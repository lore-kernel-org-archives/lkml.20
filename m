Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC14A0127
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186408; cv=none; b=aXgabq+6rJmNe5vRWIfkX9ScXUI9U1/L5v2O/fpgFRwZMEc2rkfCZBTjuX0WopAZM91OjcqhA8WxwSW6QhJAuQ4v1e7Od15krLQO+zkJDh41RgiDwoM6QZUk1QPy84jWPikFDuqnIe0uYAktyufZdB41e/gQDsRPrcBHYFko4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186408; c=relaxed/simple;
	bh=wsKRpLlsmgcTbJ1BWZgMNeanaZZBwWDLeXmduYOOh3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAgJaCFM1v/IzJoYmWufCu53DuDFARd94iV/h3CpSvF+dHr1fdwW/jsCcztHUf/yNULJoXDh9AbAb8pmtH6U3TR+DY70Yo381WArGA19zJEyeysVdFOggc6dvZCWLoLzko4ZNW4jH9Kr+/hmd64iObVwV94FP/cG8JbQ6Cr/JM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXV4a/66; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXV4a/66"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3640337a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186405; x=1788791205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WluRCjkia+1tPs9bNfIuaxHPsKCaiBiYVNlOY7m4ry8=;
        b=BXV4a/662qnUodISD1RawZ9cxj2ePdlBGePPXXYmwFUwHsEExvcC2fg82/JXOg73Ox
         7YGkDmHGICUS31mbKJWYjpLrqVfUNlLhYlRg+df/JXn2EFm6ceOfOaaY476EF981/ww2
         oLs9M4F4IIfw0EB/nCtPon8pR8tluQ+syG1P8MkBGCQYiOByM6mSqhwsBlJzjUBohbiv
         2LRnCbLaDBWVEKdJeOhT+wl+Xf/A1YAsHrK5a2ribSUsfWm90IP8NuQ0M9dSFQpxEh+T
         8GeT+uCWuNX+ZCJ0yxs2syCAqDOjYGEMTSMRyV7b+v63792p19j2P5z0SZBMb6hgpLtE
         bZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186405; x=1788791205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WluRCjkia+1tPs9bNfIuaxHPsKCaiBiYVNlOY7m4ry8=;
        b=g6ityQX3ReaH3ktiqAUaVtE03gYXUMhN9b3Ej7NVoQYKcVHu5RZ+PE41x9XO6IE1L6
         3PIuZA5BjplU5wT1xKNCew82Wu7Ncn47pp7miKuwgqo/HSzBxoZVhAhkxCAMw6UnJ9oB
         Xh8j/lknVp48WmmFDyYW5HpyLX7EHVpIHkQuOACJLPf5pCSMAyYcBHKF5B0k9zDfRzl0
         DkFTxK71Qrsn9aPLwUolbv8vtHW0Bo+8wrNWIE7Noqq/KjNA4PWvFXSYi5+fOh8Z1V/t
         ffq76ju72aFLq6Sh0t9r7vA4YaXazuHrBhp/U4TQQ9g4rxLQtPnBaoHowwtAiEQZJsE1
         adDg==
X-Forwarded-Encrypted: i=1; AHgh+RonuJQJkVERuYw2+KFz44/e63ckZ4ISVzClNhAWENqJbPPJlqzOiV60kTBTir3JKP50qC421eESJASX5dM=@vger.kernel.org
X-Gm-Message-State: AFuF++nZdZVS9Y1yM4wh0Abg7lU30VYwrB/Tv2RmlDE7uDAv40G+nEEW
	QCqNaPLCe/VNxKI1uOrJXEJ05LyD7ETzJdm9IqW/ZMNuk5u9Sf8WffL63PunvA==
X-Gm-Gg: AYBFou3MW5R7W9l3/1tVOYt8ygAIX8rl4YWk2+3Sl+i2IjSvMsuZU+t2bAYgCY3AymK
	9obgrTDyQiH2QFD1fNhMTBUuaueM/T2c1RJeCdivKuGu3lx7C/VlXZOBNu2w+UVZ446kMD8Faqt
	VaihcaDp+0XWKzM8kgz91Xg6qk7to0K9+LxRJGUyGR/Po/5wA1ZR4SBSysPnzM64KnFAVtRQvPt
	tley41psRqQieq5BO4Seh3GCtkIB06vIg1W1745rRHVBeNeFkPGxt8AmteWp0DAQx8kHOGEINCs
	rJuokBYqhu3O/2i33BU3uKv4quT08aaqg7v3Kt0mMB/9F9d5Q+KAuLXdQ7/abgUdoDDCdh0u9Je
	/dOTxL9Ew+erS9Mj8/I+txTBprYyGZdKFSLXt9kLyQUCbdnd9ShkSWlr/LIj+tBK1BmlneDcuBq
	NfSotIg1OnIY50Ftc5EEss64B0akWhiFzKf5rfvpShvIC1tIlFULrtMQTLRw5C2QhO+1FfD0JsU
	nxqNwpNQycT
X-Received: by 2002:a17:903:2b04:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2d91b002e3fmr73563805ad.9.1788186405287;
        Mon, 31 Aug 2026 07:26:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8750057e5sm33541385ad.66.2026.08.31.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:26:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 07:26:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Marius Zachmann <mail@mariuszachmann.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] hwmon: (corsair-cpro) Create debugfs entries after
 hwmon registration
Message-ID: <a3bfd099-c81e-4a0c-9796-6afd1502a8f0@roeck-us.net>
References: <20260831014509.3352442-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831014509.3352442-1-lilinmao@kylinos.cn>

On Mon, Aug 31, 2026 at 09:45:09AM +0800, Linmao Li wrote:
> ccp_debugfs_init() registers debugfs files whose private data is the devm
> allocated ccp.  It runs before hwmon_device_register_with_info(), so when
> that registration fails, ccp_probe() returns with the files still in
> place.  The HID core then frees ccp, and ccp_remove() is not called for a
> failed probe, so nothing removes them later either.  Reading one of the
> files dereferences the freed pointer.
> 
> Create the debugfs entries only after the hwmon device has been
> registered, so no failing path can leave them behind.
> 
> The two version queries stay where they are.  They send USB commands
> without holding ccp->mutex, which is only safe as long as nothing else
> can call send_usb_cmd(); once the hwmon device is registered its
> callbacks can do so concurrently.  Only the debugfs creation moves, and
> it is told which queries succeeded.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader information")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Applied.

Thanks,
Guenter

> ---
> 
> Notes (v2changelog):
>     v2: Create the debugfs entries after hwmon registration instead of
>         removing them on the error path, as suggested by Guenter Roeck.  The
>         version queries stay before the registration.
>     Link: https://lore.kernel.org/linux-hwmon/20260828061949.3151191-1-lilinmao@kylinos.cn/
> 
>  drivers/hwmon/corsair-cpro.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index 8354a002f4c5..56de0fe0f544 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -566,21 +566,18 @@ static int bootloader_show(struct seq_file *seqf, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(bootloader);
>  
> -static void ccp_debugfs_init(struct ccp_device *ccp)
> +static void ccp_debugfs_init(struct ccp_device *ccp, bool fw_valid, bool bl_valid)
>  {
>  	char name[32];
> -	int ret;
>  
>  	scnprintf(name, sizeof(name), "corsaircpro-%s", dev_name(&ccp->hdev->dev));
>  	ccp->debugfs = debugfs_create_dir(name, NULL);
>  
> -	ret = get_fw_version(ccp);
> -	if (!ret)
> +	if (fw_valid)
>  		debugfs_create_file("firmware_version", 0444,
>  				    ccp->debugfs, ccp, &firmware_fops);
>  
> -	ret = get_bl_version(ccp);
> -	if (!ret)
> +	if (bl_valid)
>  		debugfs_create_file("bootloader_version", 0444,
>  				    ccp->debugfs, ccp, &bootloader_fops);
>  }
> @@ -588,6 +585,7 @@ static void ccp_debugfs_init(struct ccp_device *ccp)
>  static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
>  	struct ccp_device *ccp;
> +	bool fw_valid, bl_valid;
>  	int ret;
>  
>  	ccp = devm_kzalloc(&hdev->dev, sizeof(*ccp), GFP_KERNEL);
> @@ -632,7 +630,13 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (ret)
>  		goto out_hw_close;
>  
> -	ccp_debugfs_init(ccp);
> +	/*
> +	 * Query the versions before registering the hwmon device: they send
> +	 * USB commands without holding ccp->mutex, which is only safe while
> +	 * nothing else can call send_usb_cmd().
> +	 */
> +	fw_valid = !get_fw_version(ccp);
> +	bl_valid = !get_bl_version(ccp);
>  
>  	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
>  							 ccp, &ccp_chip_info, NULL);
> @@ -641,6 +645,8 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		goto out_hw_close;
>  	}
>  
> +	ccp_debugfs_init(ccp, fw_valid, bl_valid);
> +
>  	return 0;
>  
>  out_hw_close:
