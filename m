Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD93750BC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482003; cv=pass; b=qo1Ak0697H0x3aLIPgDHMyKhss8GNQzPvYv2eUIp9AdZapzwt5U2zCVPuezzQ1zf0vYxi2/mPcxAySANKfXSVc5UxL0qIzLbKu5b5lDHuAPONbr9FuEyw9vQzV2EpKDg1EbR0F2VXyPV2ipD+F6qY3ibD/JQdvNWOUHjouhNdJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482003; c=relaxed/simple;
	bh=jzjn0k4srI5F1aSZR0pfM3WdUHfq7jYHQR3HlQNiVc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tz3TdY02US7jm7lAxzj5UT13rau9PJgGo2utTjnYv+lsxn4THkncvaddQDMO1veFBhBPbGCz/4UfrYZspNSpOxvwnksSf315xDOuSIcjbFSW3rlQFEZI1Rd+mU05lWK9Fsd4fUGJPhazrGc6PEMrdRto0foMmgitmFO/t9UmAoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=U40biuFF; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="U40biuFF"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc93e00so1776546d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789482000; cv=none;
        d=google.com; s=arc-20260327;
        b=OruQAFmwTdYDFLXwB5NiyVCjLGiKwgFSy/YbCQ+ps9LM3VeQFwTIxSOBeExet7H8ys
         IVonO/pSfMZLpCUK6o5Z+cJld6x+rm2242azss8+6BiAJJMHbcjZkeNTb8LmoEvy6MdC
         NdOKckgh8xW+Fdc9F84TUsXzVklAwXLBKAHnpB9FSyzBG9hI+LaGwM+6msMVYZ38dp+G
         9jOfMt33MSzAXabXTiTeFcFRqoLou4UCbSFVvHpJZKhE8U4HMUrI6LAb0MuHLy3KaWKC
         KGAmyQ1sL8r4gYKlNYUIn299q1dWRGqzwrbrdZgjWo7Aj52rPMNT0JgAT7j68b7GeJi0
         qDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mbk5oDhmq9C3ryUTeB+AgXe55pLwJERRdnBXATeh3YA=;
        fh=w1gPg5VoQWPXmC+HHmoQBhAh/FSjXDKoFrBut3ZIpvM=;
        b=oosMJ7UdgQpAyJ/N2EVj4Xvxt0XMpDY8DWra1KDIUUj3HyWoKw6rV6PrEqMTz2O9z0
         r2bSudD2uNNX2CSViIFo/XeQ+yNuIgfAXyi/t3lOrAdMlYjwcvDCvmkZ9OmX/225dCj0
         3HAhyTpNTEJGHGCmA8qIP6PlsnIPAHeKVqx8GPpV4azvTQvhnawM77BXxOYEle0h437q
         F1Ps3EKQngmF0LcXZlgUawpoRqwkSi8hQR/vEwDjAdirHm8uTSqF91wy1NlXzqBtvRKi
         Mw0I2k67gohbD/+XafgxGNtHYn2iAVFLk4Mc3RMZZRSVkCuIlVNjQ2ViBfT46t8VqU39
         8R2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789482000; x=1790086800; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mbk5oDhmq9C3ryUTeB+AgXe55pLwJERRdnBXATeh3YA=;
        b=U40biuFFuo+KVsYIxA+95DRtIaiRqO0bIjbWaWnvvCuT+7XePnxg0Vqwl08jQWKj/c
         s/JtTPcBnrDHUmNBaU0GpfjmPPEedWjQietmGDaeiJdiD2eNZpQn76iQMb6pQkDkSMb0
         aBlwu2WlFbKwwkBbNbJE1f/aogHoqZ/aPPQiGHVrwqxFdvF4JQVvOYtbOtk0ydc7vRC/
         CyEumVnBvfEJQGF/DN390XJ7gsxPXRRjDHr8/G/TtBrU7JLIlcG+VCFOFzpR0BG4zSs6
         itR9AjiFmDW9p+ZVQDul4cdd8IvJRNwiHzIlJlwddXi2xgzmzK8TUKAXcHIjCjz9undx
         jQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482000; x=1790086800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mbk5oDhmq9C3ryUTeB+AgXe55pLwJERRdnBXATeh3YA=;
        b=iQqkOYdf6D23m0Rz/GYnsa2Z0PKuOMO58RfPdhb0vGI/jiSzTKDNCZXCDw2hCxmxgT
         owQRYLuRlqGkK8BvKKhqmnWjfsqTt2rTFo+70c4lVsFtfA/bRUMosfBU6QKLy5IyNCtp
         KhkXc2Dt/jt9+YHTqsp9Qn6hbFxXthAbX55BgdV3Tod0Ni0wnlX4ztRbYx7BuZxiMjSa
         DFigXbfZg6gnJl0KbbGSr9JYRJf2g0E6GbUzd+DoiKIYLGzGw2c08U8jq+ibVVCnpYHX
         W9Xnm5Smcq3ojTMMxedrI39Cp3kzds3HDJwqjULVjyUQ7wS2ym34AcygcmOZQJqsCrNp
         21aA==
X-Forwarded-Encrypted: i=1; AKwUvBws9r45L+jzkUEozpfxGPjdplhF5v2HTu5ZsvLZZPmrmUvwlKh/HmdE7+/mmkR0pUHJIYCSesURyqWuY1k=@vger.kernel.org
X-Gm-Message-State: AFuF++kUDZyztMkrursDUVM5fMlVf5ng/tl/xL6rH+h2qvLdsAQOz+pf
	DRPLVvnpV/Glh68aruc03080Sjjc80+uNF7QL5bRAe5MiWTq7RDN2WPozPZTl/qAmkETotbkb5u
	L1WzWoRplMoz3HNB/DUwh4Zh8U8jDNCVrkx6JPBbRVg==
X-Gm-Gg: AYBFou2oifv3JSGl8AK7i3jSgGaeuBS2bUxh7CJeFnYQpwMa1bwTktIlABMd0O7GRK/
	p9QTcUkFRr3uad/x/r4VZPu8VoA4mG9izRVdE+2NDX1nYK3VV1IXOD/Z4pQCTYCgrnS3vGMFF4x
	B0giLtWuNXnUPtTTQl9Gr9zocmAbMy7HWXQwbEwZkVt5rzN+P+on47S4jAzaAANzFMNPslPdom9
	/9gwXJ6uYYxOQ+mqTQ208nTks9ydAQWKEXOHm3RcHfEeJXkwTodltpMkJ3Jtp5uo/odOBFq2d6l
	MwGUkifnSZUh1fhRgxYppAfC3Cjot2Ao9aGWY7OjmBU9INNVYfw9GSyd1CZq/UeSJuA8lZqTqI9
	bikH6rBPgTLckvSsAfgGuNR8PJ9QitikUCHju2pZVEnpufIpKnGXFv2r3xxhGHWRSd5kEWsMkwg
	==
X-Received: by 2002:a05:6214:8503:10b0:912:3b8b:3275 with SMTP id
 6a1803df08f44-9123b8b32bfmr3657116d6.19.1789481999618; Tue, 15 Sep 2026
 07:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-1-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-1-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 15:19:42 +0100
X-Gm-Features: AcwNN1X1t13-sNIByzRZhObLlskVbwDF7voVmSdDqd5Oiho8QeQtdpxx9t-nma0
Message-ID: <CAPY8ntCJLtHbBK6a9R1EMN6BWEnftW8GJPaKrA03rdMUwkKZRw@mail.gmail.com>
Subject: Re: [PATCH 01/10] media: i2c: ov9282: handle error from exposure
 range update
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> When setting V4L2_CID_VBLANK the V4L2 range for the exposure control is
> updated v4l2_ctrl_modify_range(). This range update missed a return value
> check, which resulted in ov9282_set_ctrl() not returning on an error from
> that function call.
>
> Fix this by checking the return value and returning it on error.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

AFAICT A failure there would imply a driver bug rather than userspace,
but better to handle it rather than just ignoring it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5d301660a87d8..c10b2e205834e 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -608,6 +608,8 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                                                ov9282->cur_mode->height -
>                                                OV9282_EXPOSURE_OFFSET,
>                                                1, OV9282_EXPOSURE_DEFAULT);
> +               if (ret)
> +                       return ret;
>                 break;
>         }
>
>
> --
> 2.53.0
>
>
