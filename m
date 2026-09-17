Received: from mail-oi2-f26.google.com (mail-oi2-f26.google.com [74.125.231.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5374A0F1A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.218
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641526; cv=pass; b=VXYJqI3N0i7Nss+Ct1Br13iiPGkRPO7pLi2Z+0UYkApbw68NJNvQi/WB2IWEQXCAr6IjXR+X+fbUrgqMPTUpo6D/1l10leiXwVMqm6FVhb6HZ9+cVj17agC2vs4mMfAdawj9Wpv3KLBfq6yq+S1FtrXG6C1Kt/6zOS8ONM7nTMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641526; c=relaxed/simple;
	bh=hIu0CuAARuW7ysj4YlS35+aN6AN4FoHp6vMMtWGb9HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4oP0ULZlNFh2nUQG3drXW/hfOl/ESy9eekYpvTXTGvoJLc3/124/nslVZIL74cQRa5vs1Ru5CkNysqtQ0vDlK9g8hE1SAdI0uAS/pJcB+zvgs+fX8/hlop47CzEqiynUXcmqLjyAz3zNvRtNHnMqAbHwI5/7keNCij5kZEPzpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XtXl0iT7; arc=pass smtp.client-ip=74.125.231.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XtXl0iT7"
Received: by mail-oi2-f26.google.com with SMTP id 46e09a7af769-80a18990c76so466556a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789641519; cv=none;
        d=google.com; s=arc-20260327;
        b=CmKxWx1q2s6i5Wp8GTNZrx20tVyfLMyI6XsGISJ/EjLyEN5/at1zDYWk2kmVCrOewC
         DeuiozycVdKLDBcaAQoSS/xEdBK8uLAsPRv+T7E/rFxopI8XRGJga5LuQ7pi1Fe4wSVq
         LcYXoqu0tpaJ660/z2UOTfleXlAgpe6u6x6qBSlzuxoOHSpN0iorjurX0feQyxththwU
         N5iCy4VMXpYzW1pVpceTEPzg6vUBi0c3lpY43wdsh+iJ0jQtdIpTv2sjZYiGTHqkBrm9
         uiP1APhKFqIobM4PaWJfmuwk48SbtEP7e3c1dCAL+zxjPnG3EBhwaC0adhh/fo0pvqZ6
         iucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sidfwu3hzK5NrEiJKEQna5QizdXQnz4aWmmgavro3+A=;
        fh=HjWMayOSCZFrR0IBj197AJ3aNZmTOdI8AGRAgd2Opow=;
        b=qkgYPrFlyWMM9QmxwE15jkVUZfc/YV0tDKK+RVgWbhXbhyyga0caAPUKHIQwydRzJO
         BueWCzIHVB22kanv0MZwWtZTFOdlr7G10LiKEL9HaCits2iwOAnBvoS5pV/hZApVnjjs
         sm0fI4zBwdKZR4lmi6t7LQzwQJXyGDTAugs37wY4c9z43KlavSE2k6vZYO0NfWc8I8UF
         FM9zSpw0ZFs2jFpKb8obNmlspxhCzv2qSPzmKCEuBJJzwDMp4IPeN0KSU1hyLXIK3VuZ
         LEo9PJxiYzaeJjy+upyjuSZgKfGMp8NhVrGFEbph01/2QuNzz/cE9oNVPs4DITSApzaN
         nz9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789641519; x=1790246319; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sidfwu3hzK5NrEiJKEQna5QizdXQnz4aWmmgavro3+A=;
        b=XtXl0iT72nVZpUKlGgJMITJGATaYAhAMkEDOT6MnZ6Yr+2+WX6Rt4XjW9IfYOpEhUx
         ufzEfRENgUuUuoN3FV2qeCwWIcrIZjOA4OPlKZLjVnDuHV0eUh92EPbkHY6CkZikz+HM
         eI3bvRD1GzBEzgRTTjNq9kyLEaOTdJKhYYTkwnQc9sB+0EmQcsQRt5b/5Eu5wQk2hqlz
         gBa9le7Zuhu0fBVAV8GtQhgdnKQ2UQAFKC0KiATPGWjXNxT/+GzceIRDSCRBvoUYJDUF
         ssbTsoGWhfm+Yqb/c1b30SODASE1Wv66sV046mjNXtrqZdttKdJ0Bww4xQ/mkDONX8bh
         P5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789641519; x=1790246319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sidfwu3hzK5NrEiJKEQna5QizdXQnz4aWmmgavro3+A=;
        b=sa418X/mLeE4Xz/cO2cAsEah0UXM2fK9CicCEAPntnZlbXIoGCfneVAfolR4B3PPNl
         5X4HuOXc0rLHdCuV4LDX8wl4YogoTZKQ8nOKVLmz5UZqwJsjAEXk5UmDrI73WjuxpNG+
         V+hi9elInG5S0eCjKMPZL3YXh0KovWYH9VvQVp2+kSLPmpAIWIn47XmjgV8BM8TYId/m
         SUsTxZi7hM+GJQ9c+yTpLT9IApLI6+NmcwmQwZvcCyEihL74eRaGpkGFatVDUf6iGSFG
         2AnNXLaQt2XT4VkhzHLutz0oytZCniikvprnYWkM7edhQDxXaiHulVxQREPLGmv+yf93
         dBWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4lW6k83UwPMdprz73SnC9lpDwzs3t9K7/Z9kEFb7VqrdhJIYclfCR1FEVSbCK64OfoTDGaEu+FOd/1h0=@vger.kernel.org
X-Gm-Message-State: AFuF++mVwFJep+vgc4Hf/R8QFVnzYGtRvXd78hw812dnCrPRNaTrp40I
	J7/WBqCHVuUXd8Sd8e4P0OMnjhvkzerM9UcMmsPxGQT8tB0GnYqw8pcUPWyEr10D7yb9LPamw+Z
	10XzaFzDfmQB4dr4qVvpvvxWTB+3J/QSidcOJ373vcQ==
X-Gm-Gg: AYBFou20WNbU4ISWaZNs1kpD8yaTCoR2l6sMgCNWqnT+symrotHnQynt7dKex8viCff
	29DIvoedEveXOCUng+OtPzvjFDoe1Zm6YcCkMnhTVk07qFnLYd9HrhGV5005jucTPekkDTduFZ9
	KhnmgxZs7/1wU278EzybeGUEbaOo9HxPnSzW8N2tatIaW4iKaquwv+a2wNhxtKDiMIDJbTBDcfF
	cFS+8ZGc+AW7hocCxfIMmlkt9jE+sdZt6PTgdZswa389cTV7u0GzBPvacpH1d6urZacscpqlgzs
	AG1YxSN6dOLtXDExxwu2v7KXNT98UO5JzIdzXm3BJ3mRxkB4RUm7O/s+RB2ujO4TGXMQKYW6wp1
	yOpjHMh3pF/AEJUgjm6M/Z0PmOTDCLPAy8zm1yXSyyfbi807kAbri01VSP8crcuK0l0DxAe4=
X-Received: by 2002:a4a:e845:0:b0:6c9:83aa:6fba with SMTP id
 006d021491bc7-6c983aa737dmr944835eaf.63.1789641518793; Thu, 17 Sep 2026
 03:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-4-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-4-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Sep 2026 11:38:22 +0100
X-Gm-Features: AcwNN1W1XA4_8El0nHmEeqmwuby_RmiS1x_uIdVKr1ADLXoFM9cz5UdeJpsWQHE
Message-ID: <CAPY8ntAyYq_54Yvo1uC=LBepmqLma8mz_rYTmsm62LzHkixX7A@mail.gmail.com>
Subject: Re: [PATCH 04/10] media: i2c: ov9282: update flash_duration range
 even when powered down
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> The flash_duration range update sat inside ov9282_update_exp_gain(), which
> ov9282_set_ctrl() only reaches after the pm_runtime_get_if_in_use() early
> return. So with the sensor idle the ceiling kept whatever value it had
> when it last streamed. Therefore setting exposure before flash_duration
> while the sensor is powered down may clamp flash_duration against an
> outdated exposure.
>
> Fix this by moving the range update before the power check.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 90a0fe542ce4a..4c88de1965171 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -645,6 +645,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 if (ret)
>                         return ret;
>                 break;
> +       case V4L2_CID_EXPOSURE:
> +               /*
> +                * Ensure the flash duration range is also updated on powered
> +                * down sensors.
> +                */
> +               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> +                                              ov9282_exposure_to_us(ov9282,
> +                                                                    ctrl->val),
> +                                              1,
> +                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               if (ret)
> +                       return ret;
> +               break;

This hasn't removed the __v4l2_ctrl_modify_range call from
ov9282_update_exp_gain(), so the range gets updated twice if the
sensor is powered on.

  Dave

>         }
>
>         /* Set controls only if sensor is in power on state */
>
> --
> 2.53.0
>
>
