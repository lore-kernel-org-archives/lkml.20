Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793370874;
	b=5ctuPzhGI61tkgf0Swem3X3u0TcfxCX0vv5IuuIi0uaop97D42qf7O2u27xyfWF5Vr8T
	 kLo9Ez9pcgqrg7Y0RrBzV4TOPnd0SWopmDE6LhUssgNnA1gLfWpTckWg1WUJUqVIeWJRj
	 0+yKSJzVBhYQCLavITN/XTZA3U1NYeASZNw/Rz+ja917VwhgoDAGsLUt1cow4tfCROW3E
	 5bu51hld58arQOqDEkvuW/f+EhR73yXPg3RHrwZCpJDYBYUVRbUr63rntY2neD7zaJbzp
	 +Rg5ENUbsP5/08XbNFvHtkcC9GoqzS6X7OvTmD6Oh2MxbBvwsRh7FAJapvX4cV8NV0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
	b=HQein4136HmtO1iRHH+L2ig6EL1y7vwB2XBNtgvnC6DTPZcKPVvCIb2omMfnaFtt2la3
	 pPAVVxZb+IO3xHJqAvyIzqHZoHymzpKQNOwjkzEIj0laAOHV+pJ8xFc6f+k5TyeiyM9mO
	 nOXSqQZXOV87nccW+BEfSMFdFV/mldvptnXcGVAhIYmrn6WARbnkvrlN0aFY6S+3cft/I
	 FZsUCJSwbO8FocnoQ5Oj8jQsV9mvG3zuyso8kBbw/GP6pmD9iBqeD6ohUimZy4zCsgEWV
	 gvX65tK5Pxy7TwQYq37T4qPjNHXPT12OT8aZepHsQ+lhJV7YlSo8Z1nywpqt6mjLZ/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvyyby5i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17683606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17683606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvyyby5i
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a49a022221so5642171fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793370872; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7m4FqhIFFRHjorHcDbXXBOsea++9wcj/jNHGkeByl5ttw7OcGFRYbcf5hWYoFdHNQ
         RZY2IesAFTuV3zfPwCJl9oJWd7mmIlxb0iinxWbozWcauiXYCuShuL+HWHPXyiK6XYXn
         KZtajlrYzPQnlozHEvM8SAbf/kbAHFiGMi9Bg3ebHFd20gHKtWVrRIdVw8qF4VOk8qV9
         Srw2SquzaDcExSGFOKHE3jy1cmkR7X1IBfXItyEmiJtypRjBNcG5hiBB/109HCrXM6FZ
         ED7c5xZQUyr74yVljVmZ5LiaJNGn0BlA5nRohkotiL3x5ILQ3EpDd8tlnl02jl35FOSl
         yeng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
        fh=SbKSmDWkjWtXnRIaGYN8ww/hOGQuC5EoNMt2KaAZgkA=;
        b=qZGWyvB+vlgb09Gcd+pYkUEJoGny50OJviMi7vDwgfx2oAQME99k5lfuCWMEvFzslb
         q0cCIjrud8goYCDWpCa+9TZy9HdjvicnvqreSuzyBU1nZkkVFt03lI3+kUXJVXr6YC7Y
         jqOZCMtwxQicS5PfWpTt2yWEVheLNcMtx6CVTxsz30F8oWAwtnJO3OadQx6EOwnmNF6U
         qIgWwwLnHlirCT0PbXcuL3kbj7/z2uWp8+bFNoN0h8DOKUy3I0J/lHhlz6lbzMEZ4rT4
         Nr4LtzIlB6tdVwTPU+9Y0EFAOvWvRt10ZoFGepFaeP4i3nLBzo4ramiI0+udEEksmC/R
         Cbpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370872; x=1793975672; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
        b=nvyyby5iSvj9vPr/RlViH2O81w/aEYocJwAZ/aYUkV7r8rD08aAV8jsmGlGkx63UMQ
         yGLcLMv9evOvo3HAwfAlPK39Ih2L1Sgjn0FhWD/NQ3D7W/7/N14WR9LmcjkyFopGI0Oa
         qSmRyl8U0VcbtYDlfjzguVp58CntUBvhkVZtFZ35L2BUiQy594so3ypjJrNT9ql/VNmm
         iiAAnoBEdvuGkh61R7ll1XT2OILnWy2Xq4psYYhU/9m4cDf2PxzqDml2V77IYiRQOsg9
         /slctc8paSZeS2BcqpIPhE5pDcC30+8NBagCMmnqHgeaX3YtTT0jiNnehBWvSCgP/kin
         DZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370872; x=1793975672;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFTOgQZG4mIHctrB0aORwynv7cySmH6M2kM+pz/yXfU=;
        b=IRnoDXZQoI9CyfKMnwYkB8qgL/h0lMKU6Sj1Y7Dn1V+V7Pai78O+wf+8qL+YxvQRQM
         9lR5cCQ4UGLKlqJ6NJyBb2Zo0TPQoOwfUNTePIT09FSgjBQSm6jT5MaNpqVNvJo2tyyE
         F0QGVGxlPOG+Gwe4f0fQGdWuQ4VJG2nAT2TU+Mr/sEJfiHEWUxkpjVasQen2Ssux7Nd2
         20zw0CmZqAr/KOHWdmBsA0GhxTHKbtXIXOi4fgohYnhT+4ZF+yve+P0VvTQTQwMZOHui
         ZKLu27q58prND1RXsEnfL3CnoDotO1NdHKIbUkRX0NpHL3gWJdIuINBT9khMWvEfseoq
         thpw==
X-Forwarded-Encrypted: i=1; AKwUvBwK06AYhnHzP7UPcjKPM5QBw/CcZGzw7vHxjai1IX20gIEdpB27VNRKzaFv0qfunEvNrUfOqhFijlQk+NA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4/NOSqF2pAxJyCxxHi0g6HiAsufHSNcw/OEpysoZxeoqvEbp8
	BvGdQ4Rzp8PNf4qyNZ0dceBEO3cJ8b2LWdaPIya0E8PPnFhHN/WPNmwBHyNMaVbjQjA97MBFLy5
	U2EmuYe3HEFQfWnKOIfhriJEZQCf+R9E=
X-Gm-Gg: AYBFou1U8Ksx0w4YDENi4E8u6qGorpCuWMyOx9uWC3ldAD9Oz+ylXxlF1YNnO8WalpL
	MnC7vXKcFVhboyQ7Q4LQt0Z49Kqi3SRE9qgaEBxJsiJyZlyUAKr6BghofvUfuDA2+wYTHYObkHN
	Wfg4UIS7OP6YG8pRtGRPMCPU2ZmU8E8mhlyak52YQ4NljryTGFiV86hsV1Y5QINTyoRiYJkrmIe
	CznKtaozxyD4j6CN2AkZle8vp0h9aDtfbzWYkkrDDftoZpIw9/prHauveI7jh9nOdikuyeiyr79
	mG2hvAIzR87BvLvs3zI0NXWhxDF0AuSf4X4kZyxVUPhcCQRTi7eR4WrjUBqmMYNxgr82O41Xp27
	yEZuxotphJGg7kTmnsFqTts+MErZuP2W3u4JD
X-Received: by 2002:a2e:a551:0:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3acb7a65105mr5694271fa.7.1793370871985; Fri, 30 Oct 2026
 07:34:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029205751.3513474-1-holofermes@gmail.com>
 <20261029205751.3513474-2-holofermes@gmail.com> <20261030-dynamic-oarfish-of-dignity-feaef6@quoll>
In-Reply-To: <20261030-dynamic-oarfish-of-dignity-feaef6@quoll>
From: Fabio Piparo <holofermes@gmail.com>
Date: Fri, 30 Oct 2026 10:34:02 -0400
X-Gm-Features: AclHuK9dxvx1UcAhGMn9zzLe_VKDjbdEcAcVGd7o5Y08vLu8QcCLZKL1cDzYAik
Message-ID: <CAB3Lz5a67uvP3+1fXd8iUeJWzH8wUoPdauu8zVW4t4KXMbTN8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: solomon,ssd132x: Add col-offset
 and dclk properties for the SSD1322
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Barzilai <amit.barzilai22@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2026 at 8:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Oct 29, 2026 at 04:57:50PM -0400, Fabio Piparo wrote:
> > +  solomon,dclk-div:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
> > +    default: 2
> > +    description:
> > +      Clock divisor.
>
> Why this cannot be deduced from clock frequency?

On this module the SSD1322 runs from its internal oscillator, and the
external clock pin is not on the ribbon. These two values only set how
often the panel redraws.

> > +  solomon,dclk-frq:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Use either existing properties or - if there aren't such - existing unit
> suffixes.
>
> > +    minimum: 0
> > +    maximum: 15
> > +    default: 9
> > +    description:
> > +      Clock frequency, higher value means higher frequency.
>
> Why would the frequency be fixed/static?

Right, it doesn't need to be, and I'll drop both properties in v2.

I still need the redraw rate to be adjustable. I drive this panel at
about 200 FPS, and at the default clock it redraws at about
115 times a second. One way would be to offer the 256x64 mode
at a few refresh rates and set the clock divider from the mode
userspace picks, the way panel-newvision-nv3051d offers
640x480 at 60, 100 and 120 Hz. The rates would be approximate
since the panel's oscillator is not exact, is this a good way to do it
here?

Thanks,
Fabio
