Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C4050E592
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418982; cv=pass; b=IghNJUZL9U6ZuDoNQupHRypGYOU05JaSUkzV/W1aR+vhqSrdCEZh3saFuJ8WewtdSZm4wlp9ZMuSnog9U3cysoz/aY66ER55+jyI2Wt8pVbTszjrj39AHCfgTwBKQlC8IEkcTUNzqz10aKNi2J8CrSiO+9DlCsLElIUnQRK99wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418982; c=relaxed/simple;
	bh=69YmwAWS3dZ9In6kSWSUcs0wnTKNpoRN15/7jRzhzV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpEqaSbTG5+AKgMfm234eVm7FbtbbyP6ug58W5jho2KhMNfUqiGcUpoaKy18KzNZFCg6u2dCpm52pPvhjZDFDuRi8ZLWbf5eorO82crhtLVxjWvMMbzBwkASIduFXMw1ryEMouRRDT5F4m2BRjIa00z/bS1wm+KfJm+bYp8f2uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fm6varGy; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fm6varGy"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af81963f35so1200080b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792418978; cv=none;
        d=google.com; s=arc-20260327;
        b=ZrBxk5C2I8d8MrvxZLl7bR3reBCdgJ98VDNEwuoBXwdC5WvA8zE97oQZXrMQqkAA07
         AbNZY6EAwiFVIN3xOzUmvKMAjJNTa+B/qZAwM6riBZGGm2cv2FlQUe1AnNd9CBCmEIUi
         IncCNPihyYjfi7wbcVV43mgtuO5Yppwv/LyLluJN3ybPqZj2LrROi9bMm3nB7SvYQjKs
         qrr7vpCPmadeGUY86JesPXDkbGXwGLMti/6vd+QafM3eOKX++Mj37blDjyCp9IYSv6EE
         4f2jYXOu+XPzIvxeOn6tZHdUGp4AyfuInvaO2/i4v9hbjXi2XevWatSXLz64/WwpmAo6
         Usvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uzPbkn9TvysYoTYtHl26oKGkVeNYy29t/Y60wQicXoI=;
        fh=iNnq63sdVPnTRjK5VF65u6l6sVj0elCjxyj2az3tzIQ=;
        b=OndQDSrQ912xu/ISdc38jhX41s/Dg7oBzdDjvU3qm74N6erY+YNDUPCSI20yINphfT
         hCOrYW9MMhdSp35l983xwuO0AzRpdfZLGlkISf8xtwwDDFVD2nfT8Tq2ge5Q3GmGDIDf
         /5rib2djwDDf6ajV+Dvg1cAx1MjYXqJ87cr6a63727zOA/xLohSqtJquRiCuUHcYph4M
         s7v0UBM/R+0dVqJ+DsEWu21mdBeYgkChEPyHK12H2ceYFFcFiysjOVdv5SCOiDyOkHIe
         3acSAEhBhYs58Pa7BZG7TcqixCFvs9pI0ur/oNa2/KD5y0TTYKUr9LA3ZSExfJkpU1WY
         xvwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792418978; x=1793023778; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzPbkn9TvysYoTYtHl26oKGkVeNYy29t/Y60wQicXoI=;
        b=fm6varGyA+zT2gRAnnPW8nBLqEM9mlQESjmGewpD1Fh8C+PmkoilhpLwgfvz6a0/qL
         G8GopvG6J2QNaIcW4EFzCrLMKoaxMyslz9N9VlhDieKBuvcbt73Sku2JGle2tzi0JXmY
         cJJkLtUaUJTxxhfFORFkqleuo8JiqmbRo5hWkBelupeXOllbjb0azOCi283bEQWjXgMP
         jShb/ScA5HUnThFuQi5fv5mGGwHhmY13rhRTu/NgYIV3CPz8NVI/PpFYEpG2NuR0b5Nb
         oNjq+clLx6E/MSlFo4LpeemHWjlx0BT3VGhqAVGLWes/ICLfDFWaqYw16amMy6mMZwBH
         ymSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418978; x=1793023778;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzPbkn9TvysYoTYtHl26oKGkVeNYy29t/Y60wQicXoI=;
        b=fOb8IXOeSzTStXJQNi01wfYsJ4Hap9CB69aN/zbjIq0iunJ7Lrtezn53lNt67AkN9h
         dJqj5tliVpFtizwDHjXEh1lVKuV71S/gby+fZ4+ecOBrwKfMcjkL9Gi9y3KwmyRvaRWI
         Jp7WL9ugBzVaHVYi3YhSeG9qSqbaP5ilOPRHlyrylE0pi5KdWrUoM4lw5Wr7QKAauNV9
         1/mFL47prQDgP7KoOwPIXINvjXTBvrkhiNb708VOmthGiCz5mb+yFKSPyq8BI6ZtMKtN
         vkMjX4lvyr9kBxV6+8WkZ236kcccqakpdEj1cMyEe0jgB65AohEEccmHQchubx3QGEgF
         yZew==
X-Forwarded-Encrypted: i=1; AKwUvBxHMu3y9HedP5kRSCalWbQqLArTy4gGZTLFdE20sJr2yHhTF/UxiqaH55nZ0Qs2DFz3qHyMozoa5CJN25E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfBLBCXsVv8SOqmZCupv/7tO/SaUIXiM1q0M5C6T/mFhmAtzNW
	hCa56WFCihFvMBuEA1HqHmW3r7jYVj6N4lmrq7kfyDEmRE/lqaKDcC7uhhLU3a8n8QOSr74qpc4
	TdivwgKVFYVIC8S+OX1jO0v0IfWFdd07yI7CN4Vjg8w==
X-Gm-Gg: AYBFou0gdOeLL4psKYukXsZuSYP2MnLFjJO5ujUKaAjcc0WTtz4p9BjakbeQTmeO7vY
	PHur6Q2TYQEKe3yanWN1XYVAnpntC9Z0MvQE8gO1DX4usleb7Utqc/ZRqV4Z6KxGizafmoG1ILB
	XS/tQ1oYFRuLSm6QvRb4vFv/x8ZTyuhib7UiSkS1S8Pn9FZiZYjbyicq+yBSYVNXAp/1DOvFgTh
	hq1xtHA8/4pSUbTlcs288AAzs5tpbYXAldaUQsuAXxs6BDSBWibWwNDcxM121F7bKTmcGY5eit+
	ouf4lPro1jZhPmV709YAc/FmooN8oWZogM+yLi3iTY0wvNbOxrbKh64Etr//OkfBttf2nKgPvyZ
	RoblV/pQyk5qczJZU7eYgqfTJE6W7QtOxlUmw8LNLKFCkjIYd1bg3xzRJE4cax+UBuWF4L4yVBK
	b3b4QxemQ=
X-Received: by 2002:a05:6808:4897:10b0:549:572c:fd42 with SMTP id
 5614622812f47-549572cff69mr961942b6e.47.1792418977994; Mon, 19 Oct 2026
 07:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-fix-imx415-vblank-exposure-sync-20261018-v1-1-920383f39185@gmail.com>
In-Reply-To: <20261018-fix-imx415-vblank-exposure-sync-20261018-v1-1-920383f39185@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:09:21 +0100
X-Gm-Features: AclHuK-AIGbRFr9yg6IaZgg6GA0B3HqMS5PH9s9AyZ2TVN_nbGVs-YRnZhIMIdg
Message-ID: <CAPY8ntCz3nhefn8EwF_Ezh=vKmTWWVLYOnuAFoW2aBq6Wjidiw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx415: Use target vblank to calculate vmax
 in s_ctrl
To: berringtoni36@gmail.com
Cc: Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 13:54, Wenqiang Zhao via B4 Relay
<devnull+berringtoni36.gmail.com@kernel.org> wrote:
>
> From: Wenqiang Zhao <berringtoni36@gmail.com>
>
> When setting V4L2_CID_VBLANK, imx415_s_ctrl() writes the new frame length
> (format->height + ctrl->val) to the IMX415_VMAX register, and then falls
> through to case V4L2_CID_EXPOSURE to update the electronic shutter register
> (IMX415_SHR0 = vmax - exposure) so that exposure is preserved across frame
> rate changes.
>
> However, in case V4L2_CID_EXPOSURE, vmax is calculated as:
>     vmax = format->height + sensor->vblank->cur.val;
>
> Within the V4L2 control framework, sensor->vblank->cur.val holds the
> committed old vertical blanking value, which is not updated to the new
> value until s_ctrl() returns 0. Consequently, when VBLANK changes, vmax
> is calculated from the stale vblank value:
> - If VBLANK increases, SHR0 is computed using the smaller old VMAX, causing
>   the actual hardware exposure (VMAX - SHR0) to jump by the blanking delta.
> - If VBLANK decreases, SHR0 is computed using the larger old VMAX, causing
>   the actual hardware exposure to drop by the blanking delta.
> - Additionally, ctrl->val is clamped against the stale vmax limit.
>
> Fix this by using sensor->vblank->val instead of sensor->vblank->cur.val,
> which holds the target vertical blanking value currently being applied.
> When setting V4L2_CID_EXPOSURE directly, sensor->vblank->val equals the
> current vblank, keeping behavior unchanged.
>
> Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenqiang Zhao <berringtoni36@gmail.com>

Thanks for the patch.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx415.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index c3b22b238..e5aa741fc 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -729,7 +729,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>                 fallthrough;
>         case V4L2_CID_EXPOSURE:
>                 /* clamp the exposure value to VMAX. */
> -               vmax = format->height + sensor->vblank->cur.val;
> +               vmax = format->height + sensor->vblank->val;
>                 ctrl->val = min_t(int, ctrl->val, vmax);
>                 ret = cci_write(sensor->regmap, IMX415_SHR0,
>                                 vmax - ctrl->val, NULL);
>
> ---
> base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
> change-id: 20261018-fix-imx415-vblank-exposure-sync-20261018-967b008cf3fb
>
> Best regards,
> --
> Wenqiang Zhao <berringtoni36@gmail.com>
>
>
