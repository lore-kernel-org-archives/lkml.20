Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C61439F7F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393329; cv=none; b=ikAaT6NaBK1tQC0sOiTH5E4rkfKbXK7HhcGVtvSCxJoxgH+TSif+4jmFX8qfssRkfjTPOZGuQy4D0OzXEf/crbFkUoAx5hcGe+xzbh9cq/FNm6K9DHs2gmAkAWdDOOgEIPIoQqsleWvzyA+yxhWHAx3P0K9jEDlEK8wwJPeLKdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393329; c=relaxed/simple;
	bh=CawgkxGKJ3UxmVB/3oUOcDhftc9MGZruLp+O+HF6Ukg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aL61Hhw7S7soXiq71eRHaHyEG6JowhGzZ5ETc7OaxZG0+iNoVrrgDN0ceqA/QB8nGdLfGx5A6MU4D3scYhHGKlmKFSu3pGCsi7bv/4pixOY1PUp+5v4RrLrlh5oZJH6hhRwpNxAbB9F5sFKw3Yh9iz4CA0dkQYuBetQVTuGdN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pT2Ycofu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pT2Ycofu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso40276655e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393326; x=1789998126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Hg2g/k6LjK6PKUxnUuBlrddBnQ+AWzC6JwaHgy/hfc=;
        b=pT2YcofujVTFumGc9Btch1YhhPmBTZjmEHVA55JnGPjVnbsvSnE9eRriE44vkqIC6U
         IiARbAbQZx3op2aoGs/2KGe/YLOX6wrfFuEC0BE39VIFF1Jj4gzf3zdaWQXnmNpbQlq9
         /fP4oydVkCw7Fld7SqzZL1yGDRmF08cgumOabi2SdCADcHUooo1ad6ipePtwM35Bbxft
         fL8X8zejMmWhasiHDlKZ0irwkDdJ8npVHO0IwYz1vLSyzuNflXtraBSJBDBr82Hrt3iN
         T7jGVCQ+3Bph8EiWqZdEXgKQEzxd+N/XlcswIMcl60tOL0D8OQtqgjSyD2e7iDNp7jxZ
         3EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393326; x=1789998126;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Hg2g/k6LjK6PKUxnUuBlrddBnQ+AWzC6JwaHgy/hfc=;
        b=Cze/TqlK8StDXT9TZ+BMqoBw8e6wTwxZ7bG4JdSklYycv9tcGrtsYi8Buv7P9Ns5UM
         B0VVs9mIJdQnZiX3KvACjQ63eKeBZArynyXX13BfTJE2qu8jN/AF6j39UKYOL8OE5GgW
         EgeyCCDWGkfEEl3Y3W8YS/INgUntAHo8M/tQ0kJRxWo+sooNNq5ykGM6XHt1K2RTgBMt
         JMS2ch0x5z0fc1m1Ei04TkCofgS7tMQjWXbwh7NBM2bnOIwdcKMpsR8RsX4fhBqIeeWk
         LEuWuOzJmtGFwy3KfHWUO4KQcQjthndy2fGnK1Auj5FpyyHUTm5QfEA+tWnRPY2zaFeF
         wbGg==
X-Forwarded-Encrypted: i=1; AKwUvBy6YeOZ/KNJnsbFWaFPUIp39ciMLQjObH7A31Jjden9vMQstn86bOaj9QrQmcnth/c68de7lqfzBlAbfco=@vger.kernel.org
X-Gm-Message-State: AFuF++nLi4unrHafDPmiRgMLJOSUT4HdhQUsmQbDzVpDPt7/Ymj1hvSG
	lDntI0EijhuEZSaIYi2mpMLswP+Y/3gFt6eGWWiRWqVpsjIlGhUMaslw2v8c0w==
X-Gm-Gg: AYBFou2f7q035ZgdhZbeZMj9E4OB5Kpb25f0OZlIPoudXfVPcRwUmVU+KF79AIyLwZP
	OMgXUrzqaHqb0QX03Ev5Zocl7jCCeHcw+FR6sTOaLCX/ELYfoky+29eG1u463ph2VpFle44wOS+
	91Ccq7WrbWOZVqzbc01fa1+3BTfvBJt0ReG6g+2P0qS2UGTuxlGXaIfR/LXVV+RdM1dtyOHAPGL
	nUQRMNaPLsM12VAov3PSaX20Yxz/iU8ttNvxtmZplPOdUggL1oCK6gNPq4fWxQiWp4tqaREPJP+
	AbqqeHwfPZopcwyLAbvM5prpsZDb9r6JDO156E76c+ZnO9+tBTIByVgaPbmz4cFoOQ0QHR63TGg
	OLDhAZYRr6C0hUlGc+4t6ixDKw4GvzY6CJ57kajxXVvO9eDfKoz5aLnXPB8Apvf162O/goj5XH1
	25bNFBgOifyDmJ70Gqm6d/p9HwqDJGtRSaiXK2VSpGfIhsbhmnuNcAcQhpBh3P2gavBkZOf8QuQ
	vi9jAvc8mG2J5PBwsD0Nzbuv49JhvyWmknNR8CZNsQuMZ0XxeX0Tf2RRUSEzpVPAOTkx+wwU3Fc
	RqY4OiW0vHsZ473Y0n7vDAbnu4QruCHb35WqYZbm0PlcvpAZPQsGQGGA64hnl87G96A0gffC3md
	rrCxpwREVxQY9cOvsFB4xHWZtRMHvdWEI8ymX0FJ5lFJhRpzJ7b3OuSlqvGppkzb1pOBr8/w+u5
	bZ86Ai
X-Received: by 2002:a05:600c:a012:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49e7a67798fmr33274475e9.26.1789393326105;
        Mon, 14 Sep 2026 06:42:06 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71e300f3sm224253015e9.7.2026.09.14.06.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:05 -0700 (PDT)
Date: Mon, 14 Sep 2026 15:42:04 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, Daniel
 Baluta <daniel.baluta@intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] iio: dummy: free software device on configfs release
Message-ID: <20260914154204.000028fa@gmail.com>
In-Reply-To: <20260914115404.1691763-1-lgs201920130244@gmail.com>
References: <20260914115404.1691763-1-lgs201920130244@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 19:54:04 +0800
Guangshuo Li <lgs201920130244@gmail.com> wrote:

> iio_dummy_probe() allocates struct iio_sw_device with kzalloc_obj().
> The error paths free it, but after successful registration the normal
> removal path only frees the contained IIO device, leaving the software
> device allocation behind.
> 
> The software device embeds a config_group. device_drop_group() calls
> iio_sw_device_destroy() and then drops the config_item reference with
> config_item_put(). Therefore, freeing the software device directly from
> iio_dummy_remove() would free the embedded config_item before that
> final put.
> 
> Configfs requires dynamically allocated config_items to provide a
> release callback which frees the containing object when the reference
> count reaches zero.
> 
> Add a release callback to iio_dummy_type and free the software device
> there.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 3d85fb6f8104 ("iio: dummy: Convert IIO dummy to configfs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/iio/dummy/iio_simple_dummy.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/iio/dummy/iio_simple_dummy.c b/drivers/iio/dummy/iio_simple_dummy.c
> index 19fcdbbc11c6..7d2ff1d4a06e 100644
> --- a/drivers/iio/dummy/iio_simple_dummy.c
> +++ b/drivers/iio/dummy/iio_simple_dummy.c
> @@ -23,7 +23,19 @@
>  #include <linux/iio/sw_device.h>
>  #include "iio_simple_dummy.h"
>  
> +static void iio_dummy_release(struct config_item *item)
> +{
> +	struct iio_sw_device *swd = to_iio_sw_device(item);
> +
> +	kfree(swd);
> +}
> +
> +static const struct configfs_item_operations iio_dummy_item_ops = {
> +	.release = iio_dummy_release,
> +};
> +
>  static const struct config_item_type iio_dummy_type = {
> +	.ct_item_ops = &iio_dummy_item_ops,
>  	.ct_owner = THIS_MODULE,
>  };
>  

Seems legit.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

Sashiko also pointed out that the same issue is in industrialio-sw-trigger.c:

https://sashiko.dev/#/patchset/20260914115404.1691763-1-lgs201920130244%40gmail.com

-- 
Kind regards,
Joshua Crofts
