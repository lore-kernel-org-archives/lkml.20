Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793194923;
	b=x9S7zDtzldT5qFHN6BkK9nLWxgp9Xyw+oxob1P1bsqjtr+F2TvKKZmL1qllN7SdYQDjK
	 9qW9orq70xyL42aqq+pvv6fGtRDsPRoJIrmBWiKMEXcaurBpPXGuOV/38kuv3fKESKLGL
	 H1BEFAWw/OaC7kNCC6jjHp0xsPwzgUTmxBlonxvTMN6xklZJenTl69g06yA0TfSRym3J9
	 TdtvF1ROTpwtw8k1HZ7whB7aJIq3UdDPqsPjQGCnIwBy2zJGBghriEt7ak9F12gPt+LS5
	 J43H5bShXpBk069SfQzzYOQkZO3QAimELy/WC89YEOseKqsFvqhh55wV+GxrwUZHxig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HWavZ6/zSVisPj33wFjAW+QGbNYpScdop0n6pN4rj5w=;
	b=CNW2hlif0PItltFhuCI9+ajDHp/5SmyRiO/rNULr4TbPm+X4QYTquQ1FU4m10vNPaqTF
	 1NOddqjrrbu3Bm4uHuAKVWR+kdOmIAGVbSZB48V0M66gJcNNCZghSxRHbl1r6IfCg3FeQ
	 6tXyA7DtRCgTaQZGE3NmZNEu7DumeGTq7F5qodCJ/NTl1a/idp3m9Qu5M1Pv7xFKqZDB+
	 hfYZpPV5lbWwjddK8ZFH+4Ov7o/wukv9IYOVcPylBKEhmVdj0eXlE7ZvqwI3u+wJ5YzDn
	 aPCHhB0lpyL7ZfUmPt+cCotti/rMmydyXCvpBKAZo6vuItTc3niyj6JsL7KdDnEYcFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNVGOqae;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC75E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC75E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNVGOqae
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a755bbe158so539985fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793194921; cv=none;
        d=google.com; s=arc-20260327;
        b=KDlDIbviTODID4Srx2GohSEAXXoobUibBkls5+7R5KG1Au5ugw+DQbLrMEvMzKKxDs
         JZ1LefTWMGtVfCnKI+jhZmaq15ezByTwXhJT2vaBftnQ6vaMitUspQdnkWu0LkJKjzZS
         nXruD8BuvY7NvxnQtJ2ofCgGVxec595wDH2vdfcAwE7BWwR7kfmm0f8vXyLGdM22Zglm
         DkqnZ7dqK4jOKkvXZI8dfbKVU8WASaDYKc9kMQinaE0ZmzobrMOHgPO+DgeiG2gozhkE
         uSsPUtX1IQEqfkB+2o5OTDYYf0T4/Rc1NMV0zOzkGy9jZfMeHHzcepk88vYvKaQIvnLH
         cmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HWavZ6/zSVisPj33wFjAW+QGbNYpScdop0n6pN4rj5w=;
        fh=9mlHlN+p42ezdlcq4EV0R0Ke1ujimy5OOYZIjYK90fg=;
        b=gF7nHPmiMcPiuKllI71qWESALYetQ1vYbvoGZKxjYJoTRKjBBhlUlWahUD3yCihr+b
         a1e3MT6L0wvhH3+HUnM59YjlM4lhN9EmddlTdobRGPUo/HSjMUI2FljaBZi5JXkZU9hI
         J+vaIWdHXyhsxGlET0OIg7aS2gRZe2Iapm9Egkl9AAopat+8lBFsvrGuZj0/dpFVRmVG
         TTax3ni89r/J5yjzjpwocBlZNFVQF2THF0reImm7nwG36LqnGm7EEQ1R+VMCRu1hfxUM
         cETkBm5ySSdLWU6O+74BnhV1c6hZg6cDLjJv3Q2S2vOPf4Q76aYkmKxF9BDXEdaEpsQC
         yxfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793194921; x=1793799721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWavZ6/zSVisPj33wFjAW+QGbNYpScdop0n6pN4rj5w=;
        b=pNVGOqaeKAtj8aHOhd6hnqx48NNmdU4C26vXEIldW1SIz6scAQK1yO8g3LVWASQasc
         q7CD4KqCrCmAwq5jscXXokg99hdiAOe77ctP/mBrjC2Vy2SSW+N8GfbaiR/BNq4vufEm
         69lqPJSco4TKJNcx0FtvevRZgZWtSARqZHnZUWRquB3O19K+pN90fCnlBzTWn2xOLq37
         cJQOOuJenLSfSGCYChUpYKeQU9SPd4kHwjXI28bQnTfnHpK77T2MOuOMI1/SNhIykSli
         hJSXsWuT7ZV5l2RvIVTf4yzaOmGhV/uTtT7+gx/OkA7Am4i1388Dsl9Mii7ZaJ2bcISV
         QWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194921; x=1793799721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HWavZ6/zSVisPj33wFjAW+QGbNYpScdop0n6pN4rj5w=;
        b=RmN0OrfHAUpMTC8yR/rAka+z+gCiUSqz2FCSEb+LZ3ZoJocbRbhZ4u5cIn+KcZMC21
         1uvS0vZ35k4Acyr43OEwMrmtO8tTcV+wce5LL1gQ8SGRW3EjErgRjIeEQL8w+binkT4b
         qP88taOQMNyRljBQ2fNisYOsMOwaGH4OtuIuRhm6ZasoDkMO1INUiuVdl7G2PfMXbGYf
         i7spxDxr/Q/AEKCagZpq5XKseGey5p/eGPIKBxnX2OoHqECBogf8ASUVmfFcbs0CawQ7
         agCXP4GmaQFWe68NQl+ZPfv4oyyCXN+6S+oFvqjtsfYiHOBiYHeA6lPqgQdaeUipydh+
         LKaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhzxUEBVKvMM6skGBjzECove0VBqcLZGs8n+E3IeL4/SmDbl86z8wyzXIgdW9ztvTCtSGLO+P6pJmEXPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzTBRTI0gOtPppJla9P01tAdYfSt3vywQAHAtlwE+uW7hQOxdq
	DBpvUZeBXEYPvmjM+7k33IMatNTeMyibQTFoYHs7/2Qu2hsoAHQVQMCqYEUkujQDf+hkBUOuDwl
	QVV10kO/0Df/o/DB/AJY29fdp4F1zeC8=
X-Gm-Gg: AYBFou3sTJmTl69TJk+mW8YfqkOI2JkZ6FWRhW/juEvk+nne5XeJUiYC/ER9Qu5E5ge
	9N5kDPoJtyrBtKwSrAFJGFEwXQqveD6oSS3/PeVZBh10xJ5uwe6CgHW64MNmnrSK/y6an/AuXMw
	qtRr5v827W+iRXt811zZy938zDLyvPuR+H37jwE3heqkGoUUvIC9MlqK2za8Y+p2iuZOrh4UQk3
	ZGPvTSPq1512xYSvDug2xIoQFz5jvcxWybAU5g5Ny165jt4M+CAkWUz9mZ28CL5xk9qTE1d1XnA
	D3QVf9vIr/EHafRtq6K3bysVLG5WKv+WgLp9k9MjfcUd5wUr5BWOE8czF41nytJsfvyApvBs2/Z
	bmlFLehwYkZkS5av4Z+gdo2SQHeeTElQvE6GJY4xD9W4IFYj3bEOAi97WXiDChMXRPwnfHMUO
X-Received: by 2002:a05:6870:f202:b0:49e:cbe:9968 with SMTP id
 586e51a60fabf-4a89b867a92mr3003622fac.28.1793194921538; Wed, 28 Oct 2026
 06:42:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132536.375927-1-ziaowang2007@gmail.com> <20261028132536.375927-3-ziaowang2007@gmail.com>
In-Reply-To: <20261028132536.375927-3-ziaowang2007@gmail.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Wed, 28 Oct 2026 21:41:24 +0800
X-Gm-Features: AclHuK_zqJxUnPCaNFg8MbtA5PoBLjeNjF1hMKIEkWPTHAkMWku6PNDEB4ByHCM
Message-ID: <CABOQOSUsZ6C324EXJgVKeshpQ3druMU331n9Gp-bOC18FimQXQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] HID: quirks: Ignore Valkyrie USB LCD devices
To: ZiAo Wang <ziaowang2007@gmail.com>
Cc: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 21:26, ZiAo Wang <ziaowang2007@gmail.com> wrote:
>
> Valkyrie USB LCD devices (0x345f:0x9132) expose a HID interface
> for vendor-specific display control commands and a separate USB
> interface for bulk framebuffer transfers.
>
> The HID interface is not intended for input and should be managed
> by the dedicated USB display driver instead of the HID subsystem.
>
> Add the device to the HID quirk table with HID_QUIRK_IGNORE to
> prevent the HID driver from binding to it.
>
> Signed-off-by: ZiAo Wang <ziaowang2007@gmail.com>
> ---
>  drivers/hid/hid-ids.h    | 3 +++
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 91319aa651..d135ea8f06 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1704,4 +1704,7 @@
>  #define USB_VENDOR_ID_HUAWEI                   0x12d1
>  #define USB_DEVICE_ID_HUAWEI_CD30KBD           0x109b
>
> +#define USB_VENDOR_ID_VALKYRIE                 0x345f
> +#define USB_PRODUCT_ID_VALKYRIE_LCD            0x9132
This VID and PID pair is used by all macrosilicon usb display adapters,
so it wouldn't just affect this product.

It also doesn't seem to negatively affect the device and is
useful for debugging, so I wouldn't recommend ignoring it.

>  #endif
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 793db001a6..70ada7320c 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -226,6 +226,7 @@ static const struct hid_device_id hid_quirks[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_YJXCHIP, USB_DEVICE_ID_YJXCHIP_MOUSE),
>                 HID_QUIRK_ALWAYS_POLL },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_GROUP_AUDIO), HID_QUIRK_NOGET },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_VALKYRIE, USB_PRODUCT_ID_VALKYRIE_LCD), HID_QUIRK_IGNORE },
>
>         { 0 }
>  };
> --
> 2.56.0
>
