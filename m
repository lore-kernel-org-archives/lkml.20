Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DEF3A7F4C;
	Fri,  4 Sep 2026 05:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788499132; cv=none; b=hiGZYTG97JFirVT6Xvj7AbHI/5e8WYUOXbNSEICSHtzFyMAMTjgHJDBz6lDxXnJfQueZYWLbp3d7leX5f99tjipJQKhtli4XywGeBcp3h0fgJzkCQnF4HuKpwzyOD+ztya7rY36H2eUc0gQKCzk7BCCccuckk3X+CwIq99gRqqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788499132; c=relaxed/simple;
	bh=DsAxb1iKQ3ug6Vw8n42mQxb4rsyHPw4KAe6etdGJ9pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLBWwG5EMpiHZQw531J81ZFpBt7zE2ZV3gjD+gFvvpA6qCGLx4NYNJwGZdVeot46sRoZXN1ILXNI1DTnMGpSX7CrDkljbHtzwv4nPGGdZQaEtVW7SRQCjtMoiWbXFlfZQtrnDNUwjAhAP4gZazH13ReYeWIhGTp9fKXivHUdlFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=edM78hHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="edM78hHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFB61F00A3D;
	Fri,  4 Sep 2026 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788499131;
	bh=voIKpujjWAd4jJI8NcBvac5G/HD+Z9b44tnjfoY/zrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=edM78hHSVSsQA6eka3qeCDjQjT0FJup/a1BUJc8VAgDcUYIw+bcMt+TDk4YMVoSls
	 kssHvLPFErufA4tejI+QyRIbVSiQrAEBcULFrw6/UaGFxHnazpMzfZvLmfssts7YEu
	 EH2J1PLqDQ5MwIDJAY2scYKpEoa6smFz2xrgKmKc=
Date: Fri, 4 Sep 2026 07:17:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
Message-ID: <2026090447-sturdily-prenatal-9cd6@gregkh>
References: <20260902050127.3767049-1-rafad900@gmail.com>
 <b99e8d15-9031-4d77-b1c1-2bd8cce6013e@rowland.harvard.edu>
 <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com>
 <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
 <CALp66yHc7e7QYxNhKy_zMHe7gV=KrCexu0vB+AuStCWOM3D8hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yHc7e7QYxNhKy_zMHe7gV=KrCexu0vB+AuStCWOM3D8hg@mail.gmail.com>

On Thu, Sep 03, 2026 at 10:12:27PM -0700, Rafael Alejandro Díaz Cruz wrote:
> Which changes? Currently I'm on the new v1 and all I would do
> is remove the top paragraph you said was unnecessary. Or do
> you mean add the "Reviewed-by" tag that you added? (Thanks btw!)
> 
> I'm not sure either about adding it below the "---" line.
> I haven't done that before....
> 
> I saw an example from some other patches and I guess I would
> do the following:
> 
>  20 Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
>  21 Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
>  22 Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
>  23 ---                                                      // ADD
> THE PART BETWEEN THE "---" ?
>  24 v2
>  25 - Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
>  26 ---
>  27  drivers/usb/gadget/legacy/inode.c | 1 +
>  28  1 file changed, 1 insertion(+)
>  29
>  30 diff --git a/drivers/usb
> 
> Is this correct?

The kernel documentation should explain how to do a new version, perhaps
re-read it?

thanks,

greg k-h
