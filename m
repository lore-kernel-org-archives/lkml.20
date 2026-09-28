Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4314B44C6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601325; cv=pass; b=F8elJ8HWgoIR/kaZq4XbBnOKF6l6YbiRUuP7THoU0VwpjNLF5t2ckneomb5iQHtPAjCaddX9H6uE7VDeapU2CTcezIa5FX0JuBbhRFOJeOxxX6vCzO5alPI394AnjOwbRO68f/wWVYDWP7eMfaJsVff7FmyCpCf3D5CadaKfQoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601325; c=relaxed/simple;
	bh=1+J6CEcuD/ehR2uQMHAPS7Wf/xRgrfM23BUbghLVVEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyN4f8Y+95soBqx4CbqAl6tpapdvb/8R0ZSwD1Py82kW0tJm6nySPKt2ujDrj3UbDRLZ2MYHIQYYchynUpEiQ4zezOWUl4OrWqTQgfAeU5aLBuACmfI3TU6hq+oh/ESzi5J0Cxhb3fr+986uPTlRwL1LLUA/iAosTB0qrpVnsNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WmS2MC6s; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WmS2MC6s"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6c72bd8a017so1851638eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601322; cv=none;
        d=google.com; s=arc-20260327;
        b=JLRITp/rQ7PI3BEXPYn5TKGjkTxeC2HD5B/nPc0hzd0wrbK0WNBuhcfIhLCn313qLa
         bFjw3YSt4LmHi1oDo0XMJZ+7YU2EyVxaBgfVBcUtBxBIzYP7eIVIHCKgQRPuUt7UWSru
         USxIc7O9AnmuNOHx0YJZSbq0hFRbJQyGEqpu3LA29hr+0OiR6CrBkIAh1woWumN5y0QT
         kHTjxMa0n5EG+jBEFDfj5LHXqniC5teLWn5SYAqPdX5GCVLee+fBMJ/G/jMMKL2wjE4r
         2WdusTNzsGtxZkTclZpp0Kva3JUBtZBN9/oCnFTsgLGdZ9g+DPDdJQDF6RHjhghDA2Cb
         2Zpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fGgI1r2PIxpAhy+XynqUn+DjOJ88MU8PW7eA+FniYzY=;
        fh=/U8A3SFngQ9UQvq3+oWSAnWxSPpZ3CLu6NK8i/jAEgc=;
        b=cipElUv2ZhcQHVTVNBYHMmzzgJNVq+sTIY2MfF3opGQKiLyNhXoQxI3prnSXffH6ox
         z+0Zj9as0Jo6byhsalKo7hATyoUjUhG6E+DNhC4sqGZAAodLBN4a9DRv+QQdxJ8+mKwz
         8UGEVjlslD40nwHbfpmJU1nV5fn2/EgW7nD38DksfTEOIyZo5TuHGrD5QMmVO2i/nOt2
         vQsXndBC63bojHgukgyfZ6t9h4nOXPO6l8472aLC5Z/anmKOxZOxwieWYTqMLIFPnYt6
         6Ry45yOdxj8tH3n/QyAVMUko+SjxdsXTxmIOaLfDbe/R4Qx9iF88GS1k6qpOKjUYMlCp
         /NVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790601322; x=1791206122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGgI1r2PIxpAhy+XynqUn+DjOJ88MU8PW7eA+FniYzY=;
        b=WmS2MC6s/LqSV5ivoex9+OhjYlnXLNcKuBQw5oYX+JqXdvGfq+Ij2+tISbJ75zX3Fz
         EyqbId32xSOyS+DANdOr9PoiR4iUb2XtjC2imRbtNQHFdvsO3jAjPoYIofZDFouNEW5u
         btPbsGNi64c+vzheKOYrR3Z3ht8SUUce5QWsRyCjHSXeDdEr4/O5IJqjrk23LHNUPrcv
         9/RxntCWvkQbPup4kKrtaToM/dJeobxHW/TeiPd9JYg+8yrMv5BB0IoZg490m+v6Ftgm
         eiyQMscMGIsKtx6aOxaDDMfFnJIc4eknRouokMR4hRSBXDQYrKuXHW8FpBnkqqNl2VVe
         WpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601322; x=1791206122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fGgI1r2PIxpAhy+XynqUn+DjOJ88MU8PW7eA+FniYzY=;
        b=pedzZrj3Lt+An5k/mohq3L1e/5hznhctXQSCx/vXiDG6ldthUCU2qEQU0s0iqAXQJv
         kNotbWMkel5Zgf1+2CEuSnqcLXDsuDhXpgvbLEb7xFODam1CK3xzyGKynuN9Ysb1h4Zk
         lqz48nViwfvFoAy95LWya4NloUFEIT+9AI37If3xsp/3Rp+0UhP7eBwLYmmNh4etiI0S
         D7LkZkx3NGnr+WDy15QZsUYMdsGNUpJ1xxiZV2ENgbUCTMBAeEvFENyN+mntRon270dL
         KDhCc+Wj/A4s6y7vPduwbCISXnTmp0BXkd6Ta5iFi6rJDt44APLOyHHu3sSVZfg05VmZ
         qEQA==
X-Forwarded-Encrypted: i=1; AKwUvBzi4j7sbMMgPMfPqjhsGZK7Ptis7rWE+VscI+wD3vgy43+RM348gBwfjm92agK+UAq7m3KAhSeQdWkIITM=@vger.kernel.org
X-Gm-Message-State: AFuF++k27I8u0nn3MqBb5WAffrObwf3VScI5tozsoCPPNi2xJeo2hZAb
	kTRuEnXnz+kLJpS73Pk4IK6PiCj45JxHJ5FxJcNyeoKEiEXfTipLzI8y+q5kzT7246+rK8NipRL
	elktblsSNAem9oLRQdg28BpOqbpQsmvo5egCZFJzC9w==
X-Gm-Gg: AYBFou3ZbakaxhwrBEhCNsZBNjNM/P0ZRRtX8IejzdDMuzSe2/yEs2PqYB7MUFSUk3o
	fKSwP460MVom7M4pL2txQ/DRTrnea9J2eeivWfNuuaWLAv6BTp8rVnf1mSX4H712bwDgcRETv9u
	H5ifyLfuIw43QmiNg9YP4m7qv/8JRQUA2ydKOTjzizC1lU3c/KfukKDMCzKyJQRjdI5/JYbFO1t
	dRB92f7eAXXxyNhnfHWduv1hhZbh6yhQFhHJtsOmFh6EoljjqJ+vXumKppO1JE4FxA5iQmZf6Lj
	wySUfXz802vRkdS53Ut34dLBnryRfbJfFgez/i9DFPi/nnVlKoxBP+UyNRXK9bQMDkxgwa7id61
	9XRhFrHrytk/LLtlwikmVijJpUQ6fFRkct2p5Qqz8AUdPo3NLFrYsG987HJ7qd2B563jBlWUP9D
	jT+dwocA==
X-Received: by 2002:a05:6820:80c8:b0:6cd:3fbd:1d63 with SMTP id
 006d021491bc7-6d4414bc5bcmr13187384eaf.77.1790601322241; Mon, 28 Sep 2026
 06:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-5-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-5-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Sep 2026 14:15:05 +0100
X-Gm-Features: AclHuK99UY9stHVhncg5huByX9eFWKgLDpC1O8vPS1rGUFOwjdnON6O_5QMpRf4
Message-ID: <CAPY8ntB6hoUMCr7v6E5soWzh+CDuSsdy_bJPStxk=b8mfEzN5w@mail.gmail.com>
Subject: Re: [PATCH 05/10] media: i2c: ov9282: add refresh of missing ranges
 on a mode change
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
> ov9282_update_controls() updates the pixel rate, hblank and vblank, but
> currently misses the exposure range and flash_duration. Both are dependent
> on the line time and therefore the pixel format.

The exposure control is dependent on vblank / frame height, not the line time.

> Refresh both, and commit cur_mode and code in ov9282_set_pad_format()
> before the call so the refresh and any nested s_ctrl see the incoming
> format.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 4c88de1965171..e64d8343c18e9 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -557,6 +557,8 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>  {
>         u32 hblank_min;
>         s64 pixel_rate;
> +       u32 exposure_us;
> +       u32 lpfr;
>         int ret;
>
>         ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
> @@ -577,8 +579,22 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
>         if (ret)
>                 return ret;
>
> -       return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> -                                       mode->vblank_max, 1, mode->vblank);
> +       ret = __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
> +                                      mode->vblank_max, 1, mode->vblank);
> +       if (ret)
> +               return ret;
> +
> +       lpfr = ov9282->vblank_ctrl->val + mode->height;
> +       ret = __v4l2_ctrl_modify_range(ov9282->exp_ctrl, OV9282_EXPOSURE_MIN,
> +                                      lpfr - OV9282_EXPOSURE_OFFSET,
> +                                      OV9282_EXPOSURE_STEP,
> +                                      OV9282_EXPOSURE_DEFAULT);

I would have expected that this should be handled by the first clause
in ov9282_set_ctrl where if vblank is changed it updates exp_ctrl.
That's how many drivers handle it.

Looking closer they tend to set an explicit vblank on mode change
though, and it is that which triggers the set_ctrl.
There has been previous debate as to whether changing mode should
reset blanking to give a defined frame rate. Memory says that Sakari
was in favour of doing that, but I can't find the thread.
Sashiko also flagged on a previous patchset of mine that if the
previous mode happened to have had vblank adjusted to be the same as
the new default value that the new mode selects, then the control
handler framework won't call set_ctrl(VBLANK), and so the exposure
range (depending on mode height and VBLANK) won't get updated.

All a little messy, so I can be persuaded that there are enough holes
in the current driver that the easiest solution is just to update the
control ranges here if you say that set_ctrl(VBLANK) doesn't get
called in this case.

 Dave

> +       if (ret)
> +               return ret;
> +
> +       exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
> +                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
>  }
>
>  /**
> @@ -855,10 +871,23 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>                 framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>                 *framefmt = fmt->format;
>         } else {
> +               const struct ov9282_mode *old_mode = ov9282->cur_mode;
> +               u32 old_code = ov9282->code;
> +
> +               /*
> +                * Commit before refreshing the ranges. ov9282_update_controls()
> +                * and the nested ov9282_set_ctrl() calls it triggers derive the
> +                * frame length and the line time from cur_mode and code, so
> +                * they have to describe the incoming format, not the outgoing
> +                * one.
> +                */
> +               ov9282->cur_mode = mode;
> +               ov9282->code = code;
> +
>                 ret = ov9282_update_controls(ov9282, mode, fmt);
> -               if (!ret) {
> -                       ov9282->cur_mode = mode;
> -                       ov9282->code = code;
> +               if (ret) {
> +                       ov9282->cur_mode = old_mode;
> +                       ov9282->code = old_code;
>                 }
>         }
>
>
> --
> 2.53.0
>
>
