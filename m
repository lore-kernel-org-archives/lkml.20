Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B913DEAD8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484980; cv=pass; b=Klka0AyCPhfTPh2GrYEt+v20+Mn59XEU/gftvABjDdDA5DYOwUQ9MLMBK/lEQDDe23WHSh36kR05IoIlNNTCsJSc5sOdnW6R/5MHT7ZDZfEdSfHQhyjfh5Nq4lMkFRojHEcGH4tmvCl7UHPlESe4mNomir0pS9pFgt4qoHXlfuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484980; c=relaxed/simple;
	bh=wrwfiuuxQ7VMyrq8n37+qtZAtTX3QP8R+sDtYZcuGZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bt0sIMmkCX9nIVhr6usaA/5yzham6UgUQS71Wng6gRxHj4WnBlxvnwhp67Hp+4KOQrI8AuJ5b2W6bS/UDwkLsWTRKGNW3tkrEf6HbQYIfuQPv8M6SdIThj/L2XTfHYYqJlHokVwk2KJnxmyBbsfHoOwDXRk0VU5BvqLKmn9VyOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WWlcIjrp; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WWlcIjrp"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43db0c29so25550627b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789484970; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLljjz8G4XZ5PwSUOPtpWlIgdnobgYspSgxe3rYI26bUzA0rSzMiChMmSyPe1KKcDO
         JOLb3FNJuDCo0+EEobpeh76xjtyW+8njl9gwcGUBDOrA4P32PxfzhwW+uzpHfaB6XwN/
         z7NJIKm8vsvF0zCbqer3YHFOxLXNwy/m0B4m5MXy7hT0KAt0tV2L1tYNvBHLdg7jm1Gd
         dqdnA282Fj8HkEMvFkAkrO9RTVjuppDNSyZ37WZ8GnyemSajsCKVfN13pNKMYN6hUoQA
         Bz1YW+NBZNVlzI5zHEzhf1yzEiPorbsxG1ugkEtnG94R5xzCAjSKGOohXDTKp7R4EDbC
         VpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jITtBmWMyGQHz3OcenM0SvZwsTiLzDM/UHvlj8p50X0=;
        fh=cqJW4HZp/MP+/9pS6Q0BOgdD1vgQljsvGqdCNJ4GinI=;
        b=LVv6Q6QWTW62tjkP+uKs+lz7YtoLlFWCzy8sKGClQ71jJKxYgcMDLfZmS0zQ0wPTkj
         Ym1QKS+Yv5kHgk7GRka2oXowBdYyT0nYjBM5XpoOjaziYu3JuNeex8MDNv0Fvsm6VjxL
         geJCzn91xOx/wxZ2udnStXZFaNCTOJy13APfTeoJgc4Wu1aqZoKTQkOb49ZyMoSY8c6J
         5yGrZB0RFhkBrusbSc1/7zgOCUOPopN+FoDLpxcIzAW+1+wSmbE16kmHHuRGNySKVdB0
         u2JEurFdoZS+8jXD0He5GNtE4S/m+UYuN/ZzdUbp3ZxXh/wD2WCH3YLVHCfdunvfPitv
         wyWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789484970; x=1790089770; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jITtBmWMyGQHz3OcenM0SvZwsTiLzDM/UHvlj8p50X0=;
        b=WWlcIjrpgpKxi0Pj3Uq7k81ACijVq6rbjQXcCQCUXPRb1z8a5GCrOG1P/8hG9eHbwQ
         Lh1+Lj/h6FbWonXWLsBZWOs0k1keQZyYCbdc9lbsYtgGtK2sOiOzqfb58qqrSBgmGByv
         mF04X2D7OrzCxSxZSqGHNdUpiiXCADIHBEez6IDTbwgxiLmzb2tgnBVr4Q3RRxSCyy2Z
         n/210xbEZ6ewmOFzvxf1Hou7wGRzyrzLwUdLuvQdbxAuUC87CmcfriYX802FIhn2dOh3
         KochDNJU4+yzIpS+9faJDEULJiI0qVFMFwZIVFsffrGFE6k2J3miVkVNARrgpXq9pcV8
         MoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484970; x=1790089770;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jITtBmWMyGQHz3OcenM0SvZwsTiLzDM/UHvlj8p50X0=;
        b=0OXv4+XmoQ5YSjbhlSFrE/cpMug3wicsBiBNzdOm6OQAvlfc/SlDCDg88oi50ooZ9H
         t15UfXeaiawD2u7mXDlHF3gpGdSRT/3Mc/ziPkl4rGaUDneOG+rz9qysoHPb1lPEMF9N
         q9IDg0D3JIJlPGXrnJQxV3OsDjWm7SntJv0X+fX7o7kjcsDBrRDbJFpGvcGMhjeth2XR
         0Q9X10VvIUhG24385LCFXf2Adp+cY/fP3KxYvElNGW6K8bzTNmBIK54jSqVzExFIWmco
         c+7qdSSxdxeutJenNb2sCjB8BhLHZ9d+80QZCmFwM7k6uyL0qJRdmHeHBmOlcjH/qWLv
         QnZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAfqQIdl1pSnNMuGJ/Zv6wMuBSvB4lmRH1ohVVo0Z8zlTYVPgtmpI3XRXZkdxYZoJBRh/kzJ4gC79hFXI=@vger.kernel.org
X-Gm-Message-State: AFuF++lcvvjr2tbscmlMB31dHubrXQxkCwZjTnUYo4Tf8FEsmOwRu6+a
	Q5KNeCP54Tn1w4RO6g6AeQrlmh1rpihWqTs5OzPApiUoae0B9IvcsvrFpsy1o4zk/qtrCjoHj4+
	yCMtdeQdoCEFr5WlF1BcMzc4Ln4tLA/zT0ywjlDrIew==
X-Gm-Gg: AYBFou3NsmAqEGkbIvR1+nMWLdve3S/JWfd4E0OKu9KnzR9Tlz3WtcUTIaIEljJxF+Q
	vC2QZErcvu2ZZu3wqByqVjJ33w4IQ2c6mZ8LKF7VlaysCCIBIGAz/3yB3wLChmUiMzPXARHWbqv
	jITjzbqVwcp9iN2/MD6XBPjeEZlU3GeOAxpb6Pn068Nn8oBdafVQvV3e0RfTJqoK9cIQNT8wJN+
	PLyHCVGeQrI+J1pVnWLFZr+uuc/T1YN9QPpaX0LwN5YFq8T9RueZ0ECLiPUb8hvnTSrVW8zevC0
	a+fcWbBesjLM8IfxeaNoB6LgnQfrjQ5o1D7Y0DK//k2TP1qHKT0zfivZKXfobiR4P4AbmW/5/9O
	A7n2DORTlpDwMm3VwUbrLwXRMWVFJ5GQtBH6tzRUTNfjZ1oJqGLgDfHKPknXB4v+xecmnvG+5
X-Received: by 2002:a05:690c:9990:b0:864:6f4d:ef7f with SMTP id
 00721157ae682-88d1e93ffc1mr24683597b3.7.1789484969777; Tue, 15 Sep 2026
 08:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-10-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-10-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 16:09:13 +0100
X-Gm-Features: AcwNN1W7-TtmTIyUjllHDLNIKHhLg8r83BUrDSRNpnCFbQDI5w7N_3zM_OKztmM
Message-ID: <CAPY8ntDWF53Zv1yspiYH29TWEUODW1PPU4dcBig-ssa-e15jPw@mail.gmail.com>
Subject: Re: [PATCH 10/10] media: i2c: ov9282: clamp flash_duration default to
 its maximum
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"media: i2c: ov9282: clamp flash_duration default to its maximum"
took me a moment to parse as to be the control maximum, not the default maximum.
"clamp flash_duration default to valid range"?

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Currently the OV9282_STROBE_FRAME_SPAN_DEFAULT is always passed as default
> to the flash_duration v4l2 control, where the maximum is dynamically
> changed. This may lead to situations where the default is above the
> maximum.
>
> Fix this by setting the maximum value as default when
> OV9282_STROBE_FRAME_SPAN_DEFAULT is above the maximum value.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

With or without that changed:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index be38ecfad8c82..1c5bed85781ce 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -11,6 +11,7 @@
>  #include <linux/i2c.h>
>  #include <linux/math.h>
>  #include <linux/math64.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> @@ -556,12 +557,15 @@ static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
>         u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
>         u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
>         u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> +       u32 fd_default;
>
>         if (fd_max_us < exposure_us)
>                 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
>
> +       fd_default = min_t(u32, OV9282_STROBE_FRAME_SPAN_DEFAULT, fd_max_us);
> +
>         return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
> -                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +                                       1, fd_default);
>  }
>
>  /**
>
> --
> 2.53.0
>
>
