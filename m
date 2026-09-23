Received: from mail-oa2-f13.google.com (mail-oa2-f13.google.com [74.125.231.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E453A38D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176185; cv=pass; b=kXkqnU9LJ3fuYffucngFJiXHKPZ5rGc5gVEdhIzLgXtAJG3aWDRiqdZmBmgdRzn0jytXOrOx19NcLuTWSv221iN/TSSq15sLCXjgYBNnCPONnMfLXzCullkliWHQ5zlfKsdho2n4j6rJE0U4uqt3PzAqZPQ3PMBD+PFf2/iZiQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176185; c=relaxed/simple;
	bh=vBDDxkg/4u2xvKLK14IExq0ujAdn9caw6bDOuJLuOA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6St/kg/s/Y0hDDtl9mj03RUhdjbuNGFaQ4Pm2hfIVJ6/43/lHAYNQBCAqbZ/tpt5lTv6bqhjgXvDcf1iiqNBFzULgAaL3TomzppAipLgZ4xoOMIAiQovFAx5PRxa/mk/RkPrvfSV0fX579TT4vbyvAW+ocfyweH4ZWq551UvKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=e1X3Aqz/; arc=pass smtp.client-ip=74.125.231.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="e1X3Aqz/"
Received: by mail-oa2-f13.google.com with SMTP id 586e51a60fabf-466ccdd7695so399422fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176182; cv=none;
        d=google.com; s=arc-20260327;
        b=jN62HjX1UQHq9sFz0cXwsxJ71gwkwxI6ufjo2UvZpPPRW0Nhs/jxXnE9SKsgtoSD6I
         W92phsoDde97rEhMw9lGAmnZuwHnuI28JsX/MTlpeOBIW3WmFg08un1pQpWdxwE7IU3i
         ewNtBOqoxaNsRP+xt1np6bVv8Z/TlRrp+mf/N/cXwWMin3L9j9gnJpudQzm+2Ejl3DNL
         CkvzaWH81FVyzQRnK6/Oaa6uO6x6LfgDXr3Mq7ASXGzrK5GnwMf1fGn3lkABHKgdWwYN
         knCPG5CXG1R5hhd0f/0X7rHknVrfM/45wzzSGJAwXjf8Ofm4rrFSzoidMHX/fm1m7ubX
         CjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CwM5I/T1IGiVWnONvAr320V4SRpC4B1cuoZUTNeL2UU=;
        fh=EisgPc26kXavM2kx/+a3XjigYcG+SntK23CxEzdk80g=;
        b=EwEb7dLIwI26brjBPxl21tphZ+lMVp/LF3DnYeGa1f2i8vNbkLjT9WbaX85JVqX5Q4
         q+sZ5zAhsccQ29EjmBdEjWZrg5HTqIb6j0Ll7SV8C+4wmzc0AmCWYdNHEXCQrCAd4Wa1
         AyUf5OoHRXNaE3aBvUTfM3GvUSY4j3C1UFrZF91wUGLAdlNx2SS4Hod4dWSUk7TdDP9U
         1q6i4oQ19eyJO9JN/oQxC6Sxm9/LrZ/r/W2m/q1ER2UzpF68SWpPx6UmQlMOxqpkZSW/
         CvUkZxDIr36bKYVpwiDEXvCM94ymnyaN+ZRanBl0d1a991X+bGkpO8flDCgaqOUdowmE
         dyKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790176182; x=1790780982; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwM5I/T1IGiVWnONvAr320V4SRpC4B1cuoZUTNeL2UU=;
        b=e1X3Aqz/hHRoClKqDLuoluA3yZWOd+GzH3ZWxoj/NBJ38on0aEl6uYYBkqPWbK544y
         yDl89Dj3AMW+Cy+XmZlQb9plNKDfIZ3EC9RggImo8bLvoVoQ+cFYZkRuTTmc54X98D66
         fftqbjFJL6keOyG00rKYcIKozYqGT0QNyUbQycz5Uc7J5uig1tQcqc14fz/MdJw9mtJL
         X9T1PQZ0kvXdXMwp5oDY+aDkassH8j4yDON+yIzwGu7GAYPse9pVHnoKdrF2jEdMlhrH
         ZgCNfDh2E83ext6JB1rSdCNDqAi7uTtnZt96sjFiZaZpDIVT/JzScpiKKJAn0IKxJZNs
         GMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176182; x=1790780982;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CwM5I/T1IGiVWnONvAr320V4SRpC4B1cuoZUTNeL2UU=;
        b=evqJ1981Ajhz4NWEeEJAgCrmhUe/RWs9tBoDgoIWqC8rSiP4ubRufmCYsrvzIRs9af
         9ji0F70bZwp6Ad3lIsVGX8HGknaKgtDzTitpqjZfzjIoamq0JLKf4VRtBXpYR69DGZBM
         vK9MsUKi03h8OlmpiWawakFDh2HHjxlVyKRcxpanjLkLSVGfYcIPzH5SQMNX+b0rwtUt
         3pER4zBLOq5xA/gDxS6AyWQMmOJdrxAI4aMP8nv+uDXE+a15urgVKxixUJ1GSqYg602c
         EV+jqJqq/7QK9m9Perz5gpr+b8fc5M2r/MbMCz7TRemWFE6eGpN0b1rMHF7MEr/GeDZo
         57yQ==
X-Forwarded-Encrypted: i=1; AKwUvByad8Jf2AlUz2uowJqtm0KLfIRN+hkOzy6lBgcoK4Ca2PzCuEJ8HBnp9x3Oiu1DACkwLl47CFbjNtOp47U=@vger.kernel.org
X-Gm-Message-State: AFuF++mN8Mp0pHLGIGMAaiwt0b0mwDLmOIY6bLm0ZJ73UYcvd5EoCRQN
	RmQjJURKI9lkbHmPxH5oSaCMEfpRneSX3ltzFE8vq6+ysISYbRpfGCMe6cRCH/Ycf4JDSnev+US
	n8XJHIJk9cXXvjf3yTN04z/g5m8mTzQls7CR9KGXS8g==
X-Gm-Gg: AYBFou0LhpnNSb+OL4BxDdiv4qJ37bWnso/5/CIQV0KZHFlKgu+4O3yrxMYtbomKYzF
	fHUYNSWDuRgY1FgaaX9M2OzXWro6r7i4QB+qRVfmvexVlQGHf4F6fs6rUxUtqIN4U6y9EiAwlsY
	y09b4E/xK+9yubvJy/zcYFRzUD7OduJUD2yXqzrp81IkhJ+pf8LBB1ii+10GrE44ILVvBvbusUg
	b35+WbPXmfWAlZwXtXgxjHtZZHWmta1ZXguXX7u8NyXFVcy5UievzS1XecWoJoGS8cGENCLmKVk
	zeu1AQSK7pxbJFKb+ugt3aAQZ3Oy5I5UjsIYto4vJOcqdWk1h1UKomZlRzvctA5gfAuysHfDygZ
	25/95U5xG4gXrdqk11SewkqRhqbB3rrauKPbWyVFowti5kZdUBBNSbvEhV3Hyq/+EbGiyMGdQ/e
	Y6RT+ajA==
X-Received: by 2002:a05:6870:b2ec:b0:48f:e21c:cd72 with SMTP id
 586e51a60fabf-4908c3cc5f5mr2967283fac.57.1790176182078; Wed, 23 Sep 2026
 08:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-6-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-6-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Sep 2026 16:09:25 +0100
X-Gm-Features: AclHuK8PSHi2moxp8iOY0QmIwCxXJthoUN8UYH9v0j8kmRsVHSJdFCXjqVWtIq4
Message-ID: <CAPY8ntCaRiA8MjVUU1V1KxGYRhA-oZsefM9rw0i5Us1ybVHWDQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] media: i2c: ov9282: refresh flash_duration range on
 an HBLANK write
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
> The strobe ceiling is the exposure time in microseconds, so it follows
> the line time, and the line length sets the line time. Writing HBLANK moves
> it and nothing recomputes the flash_duration ceiling.
>
> Therefore add the missing flash_duration range update when HBLANK is set.
>
> The exposure range is counted in lines, so it is unaffected and does not
> need refreshing here.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e64d8343c18e9..632184e76b9bd 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -674,6 +674,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 if (ret)
>                         return ret;
>                 break;
> +       case V4L2_CID_HBLANK:
> +               /*
> +                * HBLANK affects the line time, which then affects the flash
> +                * duration. Therefore recalculate the flash duration range
> +                * here.
> +                */

Except for the comment, this clause is identical to that for
V4L2_CID_EXPOSURE that you added in patch 4. No need for the
duplication.

  Dave

> +               exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> +               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> +                                              exposure, 1,
> +                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               if (ret)
> +                       return ret;
> +               break;
>         }
>
>         /* Set controls only if sensor is in power on state */
>
> --
> 2.53.0
>
>
