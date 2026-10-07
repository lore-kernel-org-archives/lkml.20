Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63539470EB9
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371314; cv=pass; b=QOtgzUALrPbLv4jpIQjX/h7+xvpyY7BiiUfpZle5Ci46ST9GUr7D+Pgo6/jgkI9kpOjasGxaDJa0vMG/XDq7slAd+uxN3Yo41FZ2hE3iOhT7nYJLLgo4jPzsXHLLQJi/v4ObSBOGXO7QUPSHQziMmOAO9vMAXGizy/SL7nI9DxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371314; c=relaxed/simple;
	bh=tGowDxQJeXivQdDvAJkErb5jW7cMlEy5ohNQ/yw/K1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTZIuVr79n/5V5Ft5/incgs4z50XfwIZ40IAHLRghlvA6GmwPw52hCjQPlmidOzOPVOFymci3XaW3u+ajZfFk3j+zPgQQtvRumD3v1yRhAMYaAvmeibk0JYFOyVxfyJnkrNXemEQjBRLV5QiyVtB7D5X2PtAJOPAucUzCWcki0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bisWipT3; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bisWipT3"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49dd13a91d0so1237022fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371295; cv=none;
        d=google.com; s=arc-20260327;
        b=hsRGLcz9vfCD1FeeUwJyxxUIbGCgkwAyiWvGlilKjFlr9xeL+fN0B7iS+zMJGp+eQi
         ueOvYjkQG0/d5WMpQ1AzdEYOD5UgYJhd5U1JsLKxmh0bExfoai6gZsqk2TL7N9zDoZFF
         C36pQP0gK8+c+3ktztIz65i34O9l6Rv6vJo7K0DVx5CpIXSbJkg3sPi1SxamNLknQ6kG
         mbONUQa8QWJkuwTNo0KIhHWUEwt5COCSNhdAKfCU07y2WfVYETl0AqV8wFgDAKx1j1ei
         qyd3E++mblcpBhdOYAbNEFSSLyzaeRwEQtcxba7F+fPqaexRY31B/KJOAdO586KEn+sb
         v6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RAu/Imf170djptZMOt8TN6cvFYKGz4NYBJqNFsnVtSI=;
        fh=c2TL7QwBL9Drp4AXWYzgFBhgeJX2xxBfnUspRxc2Tig=;
        b=RayeOHQxxYEzmiY8OwhSzbLjM/eVNTKB+8HhAO2lBZJ+NbpOqHdcpYXOs6Sx8CsZjF
         i4Y/boTUnZcYwE6+NvkSPRMQvG4hjGN2LkWZxRa5enN8DEkGd6UK9rFs91sObpSSWEzA
         nIp4A6K4RfwzEvdNSNLFVrzlsmE3mrf/5tHeAq5mALCUVvTiAs4z5XA9q91zh12Bp6Ot
         nKxrz+XbKRnbS/zqy5cHpDfkpF7mFLuo/PLltpuiujfjNUIM8OybYAVVIhXWPlX7bAMO
         jmWeecR2R5TKzrMvaAoCdrPGx8ykxSHtIV2Pa3UypIwXCsZ9hK6T8qJrLxqLRmJ+CK0U
         vHzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791371295; x=1791976095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAu/Imf170djptZMOt8TN6cvFYKGz4NYBJqNFsnVtSI=;
        b=bisWipT3zxoJetwXafJPXK325wh96k7+SRemCOtC5YqbUDmU8N+tbMzQq5Nx/nWSuc
         9Ot95KD21EuhFUovjxuwKWGX7nmvHV3iWulheUKILkrseazz4uWjYVcdlGOPhyc7CmFQ
         oPPp/VEqFyjohgRtSukkypCIBBewFrREA6+O6nGyDIYTPVX1hx9n2fY4RAxOuWYzAO+V
         9xJLsrKboLDrtBUCw5XSzrkVf+y5X2j7W84Qd52guiz9qg7w2RlvsDr0/FG/LD/rzBw7
         5M8akiQURIC1ngyWNY9Is081haUtCPLcrarOmOyXL+F3UwWqJ8gKkOSZBUOf0xXrlZlT
         CtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371295; x=1791976095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RAu/Imf170djptZMOt8TN6cvFYKGz4NYBJqNFsnVtSI=;
        b=zQDJJ+IOgKQg+dy2EArMTFGHiLXihDoogwm7PeZX0CctB858Reciua1+zxoORmLIy/
         eH8PVqSkg+fg/wmL8D1Hkf2y4X/6lHQquvJwNSHlmsTAAatzGKRxiyRa6sKjmjHAmktX
         QIN0nqzMDwd9eO+AKAaWend6QyeTIwRtdn+NDJngPKQTCHJahb9VQ30NCaSYKIVDTH0l
         35Ag9XQaS7h6yS9I/avWDUMbgnN6jH96osbfajY6eYoWjGbykJmnuQ8YYb2j9Gu+EgKA
         go5+Epo9jzXqUNfM5LyN/sNX1bK/bUMIat6f1jzSzWigmn2TTNqh8TX68GXqnfbFlOHU
         RxCw==
X-Forwarded-Encrypted: i=1; AKwUvBy1ousDhu9iIVaOMJmALMioLqu4xsFmLmjmzQOkRtsIfD6qt23Drm5ex64Taff8Q/MBd47sSE38oF2T1dM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXMmjEovhp0WqUrcUiNPNa9D4SDqZf148SXLPEca8yof+7ZABC
	13wek4rfG9PahFkpVKVu0dDQ6CcdabkQpY2Eo7LECd8Szvyb36LDxSOZQuHeaOZATS3s+JHGlgN
	wNleS4hSSlinWCzPecFb62dTl5/9YlFw9cSH2rYrErA==
X-Gm-Gg: AYBFou3jFs++he1JRLTiXe2Y2vQP51ys+S3La5iGxOA5ACPNnhWKu91NCGoEx/H4oy8
	FpXXN8STnCtgd2q0ZnOScy/QfWvgnnpPDIOqlZueOtwgSRPMfG+w9idpbxUlXs8Zf+1yC0q2P+m
	kXh+e08aepKO/HRPy2qj3dIK7+eJKA6US5lE1vK5icWehJwNgrvsMCWsFfPpM1Q7nJGfg4aqmNN
	4Iwpl5XXAkLKXIRk8STTTJ8hRNuyqtBQgpox6c3SknOuEV/1HKHUa2A5iHSWQMUUit/a85b1PAN
	rcFYk5cxJwero0PjAt5oBEC+dRTqS2vnJ9mbJooG5rMJNgCw679WnfcewNA8PtmEENdPwbL42ql
	3tahP+8ybJ9HG68GAb4WE9oo66gPaJK5t6MUI5sIy+Iw3/AWNB1AjCNcG59VlHWx6A93kf4da
X-Received: by 2002:a05:6870:16ea:b0:491:7c1c:c24d with SMTP id
 586e51a60fabf-4a25950e29bmr1768930fac.30.1791371294988; Wed, 07 Oct 2026
 04:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104940.507820-1-phucduc.bui@gmail.com> <20261007104940.507820-4-phucduc.bui@gmail.com>
In-Reply-To: <20261007104940.507820-4-phucduc.bui@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 7 Oct 2026 12:07:58 +0100
X-Gm-Features: AclHuK8jNyu4J6aY8nFRvuolKmkC7r_xwYmvV_NX-kpPSA3dASsF-X4_A_0WY2g
Message-ID: <CAPY8ntDCR+Bgc+z3-ApNk-rU9gZwtmgSON=FnSO+6qAeyrQt7A@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5647: propagate pwdn GPIO errors
To: phucduc.bui@gmail.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Shunqian Zheng <zhengsq@rock-chips.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Walter Werner Schneider <contact@schnwalter.eu>, 
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
	Hans Verkuil <hverkuil@kernel.org>, Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 11:50, <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
> but ov5647_probe() currently converts them to -EINVAL.
>
> Use dev_err_probe() to propagate the original error from the pwdn GPIO
> lookup.
>
> Fixes: b050791d287a ("media: ov5647: Add support for PWDN GPIO.")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for the patch.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov5647.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3facf92b3841..b3049761a5fb 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1186,10 +1186,9 @@ static int ov5647_probe(struct i2c_client *client)
>
>         /* Request the power down GPIO asserted. */
>         sensor->pwdn = devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_HIGH);
> -       if (IS_ERR(sensor->pwdn)) {
> -               dev_err(dev, "Failed to get 'pwdn' gpio\n");
> -               return -EINVAL;
> -       }
> +       if (IS_ERR(sensor->pwdn))
> +               return dev_err_probe(dev, PTR_ERR(sensor->pwdn),
> +                                    "Failed to get 'pwdn' gpio\n");
>
>         ret = ov5647_configure_regulators(dev, sensor);
>         if (ret)
> --
> 2.43.0
>
