Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507211;
	b=O84OPYCcIuYxSu9NInAKo9Bq5cFVhCrIylrJHDSxOIFJ+2lvO5xSkFbJqMpdGkfuJ01a
	 uwz+7WwMpuQizxEZ25gfy++LTY5vtnjQ4yH2Qei8zTQPal33W0eXN1YDyM+/j81/rI5Ls
	 ubrf/2UH5NcLcSiTKAFXFR4qULoBkag9OCHIoaYplG66xtrmxFWANxkBL7Oh3zdFKMFO0
	 ADTbUNdfTit1risxWh+bVxfokHnDAIubVU8TtnSl5e4+cHFP9ARY6oPGA7+gg5gs6yFoB
	 nJCfPh/rcUJF+JByOcxh1215xksC+mNAgGbOTbm1ihFulDe4HgjHlEeROrsJo+LMyKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
	b=fd1FMQpRgDT0pwsmILETZOLE79rf5dLTkIF7bhVWPYuOeB+i6/HprQov77MFTeqGV0OF
	 N8LStajbA/yWRwaqpsrInPT+K741S6c9j63cPJyvzDz5r4Kit9G+MvDcsHzGylOYnkL0r
	 0FQ5bEQ1TRs571fipj4MwEaDAwIgWsqedh+BrO1o/J5zd3KByVs1uvl6rfTu/SsO4Ge2e
	 SknpkPoXCY0gEkVfqIBXXpW/sQnWmtBmdL5KHIixOTDCdHwaeiwscQsusgwtqaltZH1Hf
	 p/DgMA/MlfHU7M+FVc7nWoLhrxVl/4et5OyR2JnypC+of+Z5Kx+ke0MNPbAVbhcTIOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Z6ribNwS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92F4606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E92F4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Z6ribNwS
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df0b02fe91so476753eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507210; cv=none;
        d=google.com; s=arc-20260327;
        b=pYjJ5ic+dP/mo6g1YuHomLSmCfijNzJJ9ik3cqP5bNA4lU6kA9pwWQjfBM4TsJ2DVI
         lkLdJRRfz7yS2ZIl7S8s8bGZQY7+KSElwAK23JW4HB/ZTixPzZAHuZ1/RWu4jS6kGNRC
         EE6/5FAcfF9nHLotgfuJuPFjVvesgi4WdMhGn1RzFW4niAJ/s9QAl+aVdtuy2mtsHNl4
         NiQ3I7S+bztuPDrUIuIKgVRbaK0CbFcmTJ+rjBf3ghnSBa9hkM+nnpNnbwt0lkjtLjT1
         YDLX1NoksuXhlYnqYB+fJ40PXg+xhIKJwTn3d1LSS/o9819vz92aJi2gQS5EH9XsF0lQ
         lIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        fh=brqzOotWBHxvktauqY4FFTNdZDE5Qm2/sreiP/xsvzE=;
        b=aLGmJQ4+NEseqDsgnvsfZSgO81QDmN227o1Gz4qOdXuRYIOyEJG49X4SldyoMJNs1C
         WiKerXTn1aW+AfQt43JoYIT0Q8XwHgFu0fkY86AGOCakXrTIYFf7xHf7QtfE0R66oY/W
         qDERNtQ6s77iNETZn5SB8pwXsbVTNmLDBh7i2iwzeCvNfEoJU3bsNxoq3AWKRdNANF41
         SLSz32stGueH7OgBUD5ARokFIfkYrw3a9/Ct10k9fJUDoKY74xgcGhfc3gd01sP49jTz
         9TX64t4vMaETlcFG+W/PDk3pd9JagMXcX+zCO2DE0R7k41fpFlmDv6CeGaLcuMT77o5W
         6irQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792507210; x=1793112010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        b=Z6ribNwSkuRORSRUqgJFndKt+a8pNkfz+uixDZBj2RIOvLAexORAwbiSKcQUVGCjop
         no35lkWv9bv6vKlR8fbjqwM9NDFMSs7PVNzOG059ZrH9BBqxjCeiS56Yo2HUm46Yp1cS
         KdMO2m7IWh5CC05+ItHv3vXvOMsde5bPxkYUJdhEfbmO8YOoM0g9+v0FLMvJVDrqo0Dz
         npsVT+CmXl4AmmCH9Mp2ZyIwqARrrJr+fZx1BbWiHMRtgagoNolGfVCU8QRJ9mTMygzz
         VIYfE057NaafOemF/r5oX5sh5UF+HIDpV3sRJdp1bOX03m3OwrlIh9aVXr+CRhMtyceS
         aTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507210; x=1793112010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        b=oyfrhu5vIGEP5u7Wl8h+cwYwqIkkQgJQo/26hP3iBmWa8TT2ouhg/83Wrj5fN1ahfP
         5hn0vGk7LnZVWw/JvrzOcJxUrpyFURxb4IsI1PIrYUg6+GjpP44FLzRksFktQ+XzFFM7
         c1K+LGy/E/1g57XKSefk+cqavgFF5S7a15pzgU3++b3WOBFVlS6imq6RpedavJialJZg
         QQ6n8WlH19mmkAYIyh76JzzA2z7A+1fGWHCzq4SOKkxO+VbCpyifzeL+29eGgPjqbfex
         Zte9ivtIpL1vaaFKxXUzdfJyl43RtgFXJYv/9xTBvVjBgcyxrpVDfb4wJQ5BvLXDBDYz
         gE9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjg0jmkoEruKI9p3/fZGJZlwyv5It7XrcIQQuYm2/7dxSG53e9u/qPF3szPKAmdVRNejU6AuWFfBpBgWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm7zZkJtJKCxp5sy+8HM12ie3u9CDwcisb8xGrc8A+uUdtNnea
	Bn7/eveT+Va7bq4ABGGgtLfWOlzoY17lJRbFJjyBZnwXEbBpoW92vrD7cCENbNUUhaCnRXx8DBf
	Dp7+wflVm3yMPBjIDqGbLBWrA6oisSkECTEdp5/0yuQ==
X-Gm-Gg: AYBFou2oIyHyoQ80gB2BWXG+srIMa592y5k7Zq9OhLYzQ9/UGgqbFgKDmDXi41g4unI
	4ha3jk7xvs5YRvYwRqGcADZDI01plsnhP0VJl6VQVnQWqEwopBBUMJkr1ybNvbTXDxKnys82aq+
	VKWDd2gXqcp3+nV2utvwrBnAsTCDF1sLHLrV8/ZRU2lG1PpEMUzAL/JCgshH3ShTCpBcmGcgNxF
	nWlBMccXd1pdvEqzHE/UnbfqI1bPZY0xed8izPde64XCNlFt1Qv04pOzWVnulW57ziGxdQ7CkAc
	5QjBT/lPbMp0Mdiy7hhHLo4SG6ZgDw7TSQi5r26duAJcXSmD8N+5teq/XsnzKNLce9rYDl2m/Xh
	GpqBz3mGwny5lZUj4Mx8m2dc2wCZixpzd1YYhUv6gKpOx8bbLC4udcnNTBwqA6Qlkl7fECy0n
X-Received: by 2002:a05:6820:2d03:b0:6c7:8dab:ca1a with SMTP id
 006d021491bc7-707bbe2cd66mr1550317eaf.17.1792507209625; Tue, 20 Oct 2026
 07:40:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com> <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
In-Reply-To: <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Oct 2026 15:39:52 +0100
X-Gm-Features: AclHuK_b39VaTdZ3dmgtb-s5SV-tLyOzJVne1uRjIl6FFmaQNj3mm_E5Od-ztsk
Message-ID: <CAPY8ntD2C-7UTKX2Srusn_Tzx5KS3tnUtPP+piMYbUKZP91Rpg@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Thanks for the review

On Tue, 20 Oct 2026 at 11:07, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Oct 15, 2026 at 04:57:36PM +0100, Dave Stevenson wrote:
> > There are multiple members of the Sony Starvis 2 image sensor family
> > that have the same hardware requirements as imx678.
> > Add them as options to the imx678 binding, rather than duplicating it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
> >  1 file changed, 32 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > index 098f72544216..027872a134f2 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > @@ -5,7 +5,7 @@
> >  $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Sony IMX678 Sensor
> > +title: Sony IMX678 and Starvis 2 Sensors
> >
> >  maintainers:
> >    - Jai Luthra <jai.luthra@ideasonboard.com>
> > @@ -13,21 +13,47 @@ maintainers:
> >  description:
> >    Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
> >    image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
>
> You could rewrap this while at it.
>
> > +  It is part of the Starvis 2 family of sensors.
> > +  Other members of the Starvis 2 have the same hardware requirements, and
> > +  therefore share this binding.
>
> This paragraph could be rewrapped, too -- the limit is 80 characters per
> line.

OK, I'll rephrase it so that it makes sense as one reflowed paragraph.

> >
> >  allOf:
> >    - $ref: /schemas/media/video-interface-devices.yaml#
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - sony,imx678-aamr
> > -          - sony,imx678-aaqr
> > -      - const: sony,imx678
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - sony,imx585-aamj
> > +              - sony,imx585-aaqj
> > +          - const: sony,imx585
> > +      - items:
> > +          - enum:
> > +              - sony,imx662-aamr
> > +              - sony,imx662-aaqr
> > +          - const: sony,imx662
> > +      - items:
> > +          - enum:
> > +              - sony,imx675-aamr
> > +              - sony,imx675-aaqr
> > +          - const: sony,imx675
> > +      - items:
> > +          - enum:
> > +              - sony,imx678-aamr
> > +              - sony,imx678-aaqr
> > +          - const: sony,imx678
> > +      - items:
> > +          - enum:
> > +              - sony,imx832-amr
> > +              - sony,imx832-aqr
> > +          - const: sony,imx832
>
> Should we also have a sony,starvis2 compatible? Just wondering.

I deliberately didn't based on the discussions Jai had with DT
maintainers when upstreaming the original binding [1], particularly
Conor's comment:
"Remember, having distinct multiple compatibles for the same hardware so
that you can induce different software behaviour is not something we
typically permit. While we do want to support all use cases, it isn't
always the case that devicetree is the right place to do it."

Sorry, but when time is limited, IMHO debating dtbindings just isn't
worth it. I've therefore taken the simple option.

I do have patches that implement that compatible and fully autodetect
the sensor[2], but I'll keep them downstream.
Doing so means that we have one common overlay for connecting any of
the supported Starvis2 sensors to a Pi.

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com/
[2] Currently the top 2 commits on
https://github.com/6by9/linux/tree/mainline_starvis2_v2, but that
branch will get rebased/reworked.

> The driver isn't generic still as it requires sensor specific information
> to be passed to it. CCS solves this with CCS static data (via firmware
> loading mechanism) so there are no driver changes even if the capability
> and limit information can't be obtained from device's registers or the
> device requires MSRs.

I'm assuming you're referring to the patchset as a whole as I don't
believe I've used the term generic in this patch. I'm happy to swap to
"common Starvis 2 driver" where appropriate within the patchset
instead.

IMHO Pushing the config to firmware files doesn't help, particularly
as these sensors don't have a common ID register and so identification
isn't trivial. It also makes life more involved for a distribution
maintainer to ensure they're picking up the relevant files, and that's
assuming that someone is curating them.

My aim with the series was to reuse as much common code as possible,
rather than submitting 5 separate drivers which are identical other
than constants and arrays of registers. Jai now has IMX676 working
with this driver, so that would make it 6 variants. Refactoring to use
a firmware file adds complexity for minimal gain, and you'd have to
special case IMX678 so it worked without a firmware file to avoid
regressions.

I guess the common core could be refactored to be a library, so that
you could minimise module size by having the sensor specific config in
a module that depends on the library. You're talking of saving a few
kB uncompressed though, so that would be quite extreme. I'd be more
tempted to have individual Kconfig entries and use #if
IS_ENABLED(CONFIG_IMXxxx) to conditionally compile in the config to a
common module.

  Dave

> > +
> >      description:
> >        The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
> >        variant (IMX678-AAMR). The variant-specific compatible describes the
> >        exact sensor variant, with the generic IMX678 compatible as a fallback.
> > +      The same applies for the other sensors in the family.
> >
> >    reg:
> >      maxItems: 1
> >
>
> --
> Regards,
>
> Sakari Ailus
