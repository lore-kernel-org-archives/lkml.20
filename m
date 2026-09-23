Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BBA47ECFC;
	Wed, 23 Sep 2026 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161393; cv=none; b=tJJvdTFzSfVgdex5r7OAWoCCoBmUaN6MIAjizKklOyk9a9ruYSxTtqcb28tWSrAs/iSyTl4UnXZuLFQZ2RA4409M1metSXKRJ7OuTlvALr0ER8TLIKxFs1DpesCobXBMJIcbVWgTzFa4f0DKwiCD7MPPv9eeMRlbRy+IqaD+xLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161393; c=relaxed/simple;
	bh=lveIoLeUGI0mxtbo4J6b2RuNa5XWtyjbg3JBFgv1ot8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RE38e+8YHhSJjRvLd8f/twGuVvT7g1CNRiOJKxis9FhFl7COQatDh0CMUfW8yXM4FMeriq+5E9g9aHShj6W4qchlvJmsYMz2q+Cdd65aqz5g9iBzkxl4FbbtRzQRld6azhaP6xOCvssq/HvImUs5aap5sSjznQkacgrq2r2wvHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dajVmbyT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dajVmbyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32461F000FF;
	Wed, 23 Sep 2026 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790161383;
	bh=I0UZMyYQQrs40qxhN2Ez3ugIaetPzHyArsOt5uMcBW8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=dajVmbyT8be54+O556MEu+iOYgQDJKaPU/QWG4BzeTQWIbzNt2t9B3EM2GL9g+Y8V
	 RFILdh/Ay9SoM8LlaR6bsEujFKJ65fm5M7z8MrjorSX8lHmI3Jis0OEcmh8WZZZpBj
	 T9pioLupdqGw7oxPVjvE3FBbRbpoipmEYVN4dbMtMZf8UkfPC1v418b4wlpj172LhN
	 XZ3WoWhZ2th668ntuo6FmtBxXFi2p4XAt4XaStuetGXwS6341sCePonYtPnBpMUg8r
	 DhkAJgEJLyZCWFycvIJba0gv+inio4tuh1QOrnctuis3pFo53PY4bMdzuJ9LQ/PW89
	 HmYCxvfP1Bjvw==
Message-ID: <c55b028e-8d88-4843-b29f-f8dfc35653ba@kernel.org>
Date: Wed, 23 Sep 2026 13:03:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: rc: Fix build failure with CONFIG_LIRC disabled
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
References: <20260923085948.312798-1-sean@mess.org>
Content-Language: en-US, nl
In-Reply-To: <20260923085948.312798-1-sean@mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 10:59, Sean Young wrote:
> commit 37efd09ba2c6 ("media: rc: Ensure registered is cleared in error
> path") broke the build if CONFIG_LIRC was not enabled.
> 
> Fixes: 37efd09ba2c6 ("media: rc: Ensure registered is cleared in error path")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202609230511.Em5Osw74-lkp@intel.com
> Signed-off-by: Sean Young <sean@mess.org>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/rc/lirc_dev.c | 3 +++
>  drivers/media/rc/rc-main.c  | 3 +--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index d9b6ecca563f..f7b8f1f66d9b 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -777,6 +777,9 @@ void lirc_unregister(struct rc_dev *dev)
>  	unsigned long flags;
>  	struct lirc_fh *fh;
>  
> +	if (!device_is_registered(&dev->lirc_dev))
> +		return;
> +
>  	dev_dbg(&dev->dev, "lirc_dev: driver %s unregistered from minor = %d\n",
>  		dev->driver_name, MINOR(dev->lirc_dev.devt));
>  
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 1c07bdd3b42b..a867bf9e8416 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -2018,8 +2018,7 @@ int rc_register_device(struct rc_dev *dev)
>  	scoped_guard(mutex, &dev->lock)
>  		dev->registered = false;
>  
> -	if (device_is_registered(&dev->lirc_dev))
> -		lirc_unregister(dev);
> +	lirc_unregister(dev);
>  	device_del(&dev->dev);
>  	/* registered already cleared above */
>  	goto out_free_table;

