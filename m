Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97A4611E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142447; cv=none; b=lB/bOKsX0GFhsXAT2IfAVVo0uMGKCB12ST0fFWiSGIIZvIfZZkhU2WuoVRDBzDjcUinC/Bw4ZDZMpQsGzxzYYYN9AJ1xQuh9tSKg1PnXn0boIpmqWPKnYT7tdZN5dK/7JPaTrHHXB+jdErIJoYLHxhOu2HBqg42qE0JDtdGnO9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142447; c=relaxed/simple;
	bh=J2Vo1AKcHKkb4R6FLHf/+bygkCDME8e58AbPfZcmVxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQRqBX1e8n53O2zlExuLpZ8rVqcDmxLpAU6wxE6AfZYFH7FHEvOR99wuMBxqmkLUYVN2ji8bulJBkvNNq6tFfPCP+sQENBdVyCHzmxcGsX0i2M80SbtbzaYYXL1Uw71l0EdmyF478JWwlELhpsUQeXLSZWfXzVJP5u9c8u+q3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MNoOXhyi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MNoOXhyi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8246b13cbso45931435ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792142446; x=1792747246; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZpdtgEyok+9PJ/Ri7Q+NSThTOVxSs62Fi1zlQZD7xQ=;
        b=MNoOXhyi9slDrIUJCTp532fTwsPcUietzjxggri57ENxzgxV2wjUiK93nUJYNubJnK
         g8lXZtKahlWFAQKDvE52f6lvs8VuKSWK4jnJwmhvhd1y0gCf6yMAQtYKT4U4cbdYdzCb
         V+9CMSCbXwLiKWKesPV+mxkGRUTBf++2R3+wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142446; x=1792747246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZpdtgEyok+9PJ/Ri7Q+NSThTOVxSs62Fi1zlQZD7xQ=;
        b=vWmWSSeqhy8er3gwgWWm5WVwIAh8cUpU4GugOXrOA7hykUIvzUdMl7+q9/e6ptk2vH
         ACpvM8M77Q3kh9Q3QXaQWN7GKYvncUtpFhvApuBQvRBkxWKLa9csep9ULudeetOc69T4
         pgkC5bduFKod2K5GosnWKojiNMBkxab35S8UXnVFXdgWqGf/w8nIZ2ppBH8TpCs3RHoK
         BrW5ORtOLFVrBmPgRoMsoTcXeQYwpG80dJ6xb5LhYrDGZQIxATB0tdTXza4DPegyQvNr
         74avTnHuzWOuO43LfAjGLJPMIIpjRsIN/lI1Kqr/JLCSrtuvPgtJFlCzygBVTRC7uCbK
         pl1g==
X-Forwarded-Encrypted: i=1; AKwUvBzrtWDLVahDvveHCcdMkyPc22hPnTTd9vBOUoMsD1zx99091Z+EzPMR+1s4j9SynAIY8vhh1xB9x2+8TzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsVN1Q6sBHDxBh6CvmBmMJcXW4z/dw1iK9COu9/KyHo1zEj+Sy
	P/zVGv41U/lMNF3gN225eranphcSPVw1/u2gjhIZjGnrKjMFNwv6MTfJV83wQBAJHj5IJqMXOE+
	gf9doAQ==
X-Gm-Gg: AYBFou15WomPUCiUAlLZzaQrZCBIt78FKrWLcMuSHjkIMcoPA6d5OCLdHgg0gPpPMXp
	fPqVNA9vNemObDkHdkrTWfMXe8pPGbIT9rhYcsxihintwAGyYbRr6NDBZDYBmwUheB/muPHvoNV
	lqwDnrKKopl24hxHHnb8czORZNAGWkSV9RSfkKyuPtMXKVe3Z6e5AgMMbXnD3O8H3W0xmE9PFSQ
	jNfCalqqD3PEMKPWf+x17WISv4LWBS6uu1ygX7zU67NYPaicBySuNtSY/VdhqL6pYgS0xjzEV4U
	ScoXs4KDk/3ClRYPjnZoW5hAE/c2zBOu2ntHQS/vQGNSAVblMkUeNh+JMFTIeHi0myCBzbTQI/a
	XVPuGDhnTbznXtZBjAGYRVnMoJPIkLbwCIxJV0Ztb1kqg+JcL3UHnNTr+J2hbGpiVvF9CKn+mc5
	LoTyhlN2rxLcYSPurj0fXPw+Cd7ehnB24eO2vLWS+99NHNWPMdN8w6CCIn0/q/Oc3viSNybI7jf
	LSflxc0NOPsEHLraW7h5WMuOY+I0cymNSs=
X-Received: by 2002:a17:902:cecb:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2e9572a7fc0mr54924515ad.49.1792142445953;
        Fri, 16 Oct 2026 02:20:45 -0700 (PDT)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83d9cfsm7287055ad.46.2026.10.16.02.20.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:20:43 -0700 (PDT)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-141395927feso11963081c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBf0sM81ZUPM83Y8yTcESoepWRY0JrfFywZhTNZoG5qCKBzgy/8z/fQPFq492Fad+XOuiNGjQOklJgGIg=@vger.kernel.org
X-Received: by 2002:a05:7023:a47:20b0:169:9f67:a91b with SMTP id
 a92af1059eb24-16a5dbffce8mr26511358c88.12.1792142441528; Fri, 16 Oct 2026
 02:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <atHg6s8VaFxNzuR6@stanley.mountain>
In-Reply-To: <atHg6s8VaFxNzuR6@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Oct 2026 17:20:25 +0800
X-Gmail-Original-Message-ID: <CANiDSCvT3KC=LYaQPgvxnFfFfKHwtSZkDoSVPjd-_g5R9iiU1w@mail.gmail.com>
X-Gm-Features: AclHuK9zy0ivptFpxjfRKqq4APH2lotLQJ8S3ABkRzR92mbjRrsQi_YoPtdcV_I
Message-ID: <CANiDSCvT3KC=LYaQPgvxnFfFfKHwtSZkDoSVPjd-_g5R9iiU1w@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add sanity check to uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Thanks for v2.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

On Fri, 16 Oct 2026 at 16:31, Dan Carpenter <error27@gmail.com> wrote:
>
> Smatch warned that "idx" could be too large, leading to an out of bounds
> read.  When we reviewed the callers it was a false positive.  However,
> add a sanity check here anyway, just for future proofing and being
> consistent with the rest of the code.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: It's not a real bug but Ricardo asked me to add the sanity check
> anyway.  Use BITS_PER_TYPE() instead of BITS_PER_LONG.
>
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d2f722bc3459..249c68783474 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -538,7 +538,8 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
>  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
>                                       u32 idx)
>  {
> -       if (!test_bit(idx, &mapping->menu_mask))
> +       if (idx >= BITS_PER_TYPE(mapping->menu_mask) ||
> +           !test_bit(idx, &mapping->menu_mask))
>                 return -EINVAL;
>
>         if (mapping->menu_mapping)
> --
> 2.53.0
>


-- 
Ricardo Ribalda
