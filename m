Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D840141D103
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108234; cv=none; b=b+Y0aDlbhSZZM2hHkZSBkD5hr6cT9Sr43fF5NLnk2njcE7+A34oYGUkcNn7ocjGD4PSUg/9lz/qk3HxzY1XY/oIuOLS63YtrkG5X4p06ljSRkm+auWBXuBqVpQCmWtUuETSiaAjojTu5wRJb5QH68S9Z7fG5vIGV5j7x9aklnjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108234; c=relaxed/simple;
	bh=4sclRdG7XFjMLR17Oz6vTwRnep1W2BIEi49Zqe94pWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ny4QtRlAf6K0MV1asohgI8qfUIPQknX9klwlwgaoBBN5Pg6VVNpt1Oz/6iJSiHaSDFisCsukAbrAx9PR9uRlHadUxyibeJ+lW29905WhfCpB3hFv7vlCJfSfVggWqfs8o3/sXWC9rq7qNgQeY3DQqhsIafHvAfKLIrF0sotRE58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KvIvjCXT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KvIvjCXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33C51F000FF;
	Fri, 11 Sep 2026 06:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789108225;
	bh=hGyqrZr7idZAaGlig05TEMNqS3Zhsg9ieXCximgP3yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KvIvjCXTgwjMuW4C2lr4aqB149YH1MZNratExQeoEmrWIZsMDwKFSp1NnPdn6nX/w
	 y1IsFPfZ/cMzpCGn7sC597ikvmBwnPZ3KS3huJ9nMBn0BeN4r5RWlcIeSSglvUHJke
	 cU5CTMgCePvrEa2O0pzG0vyyKD4vryALNWBKol2M=
Date: Fri, 11 Sep 2026 08:28:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: dpenkler@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] gpib: hp82335: check the register mapping before
 requesting IRQ
Message-ID: <2026091120-caviar-nicotine-9cda@gregkh>
References: <20260911060927.94461-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911060927.94461-1-bolin.liu@seu.edu.cn>

On Fri, Sep 11, 2026 at 02:09:27PM +0800, Slavin Liu wrote:
> Stop attach on mapping failure before board reset or register access.
> The existing detach path handles the reserved region and private state.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 76319a9d234f ("staging: gpib: Add hp82335x GPIB driver")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/gpib/hp_82335/hp82335.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpib/hp_82335/hp82335.c b/drivers/gpib/hp_82335/hp82335.c
> index b7544b3c15c6..b1ef3dbdcdab 100644
> --- a/drivers/gpib/hp_82335/hp82335.c
> +++ b/drivers/gpib/hp_82335/hp82335.c
> @@ -290,6 +290,8 @@ static int hp82335_attach(struct gpib_board *board, const struct gpib_board_conf
>  	}
>  	hp_priv->raw_iobase = upper_iomem_base;
>  	tms_priv->mmiobase = ioremap(upper_iomem_base, hp82335_upper_iomem_size);
> +	if (!tms_priv->mmiobase)
> +		return -ENOMEM;

You just leaked memory :(
