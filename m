Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9E84D7964
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352994; cv=pass; b=qNsMs7J29+IjRqfXzM1WP6sjlXpK4UeUcRz2CVP84cCf7XB92oYsnZCX22eQ0pnJG0OkI6mML5bEQc8R8Einn5ieTgIxZVTO4zr6G2znRBL/bLCQuqHXgo98kzgk3NSPW6VK/DruXwOuacN90odTdfpbvD/VXx7L1F0MPNcNuwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352994; c=relaxed/simple;
	bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iml73LRkbNyMCqUOPvFV2zjznURzNKBwrHN/X4seHKchQijSQ8XoNhsWvSvbeBLYeqILtuKuKEF3I793bhRDnOPmxksuBA/0rgW/erze2Hw5kc832xEItUex2iVpgAMZtescjGWfbUhTAD/OmmIV1qKxiN02K/aD50RtatWtZX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFllTQ8p; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFllTQ8p"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso957101e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790352991; cv=none;
        d=google.com; s=arc-20260327;
        b=qq+/VU6JzLy3YH3LgPEjjD+NHc5sB4iW0nJeZBr6dHxoYzLbBjdvckR8dXKruRtj9b
         RE0u+yr2+i3sVMV05Ig4Af0F0F+EdyvK8jPOahJxQhY0pXF70q+SU52AtYb5yTB0tHxX
         fRdMIJDSs7YvJRzagoyyal3ebPAHRL6B5F97JlHmwm+YKgKBOm6OUxvFeAzEIioFESiu
         uc33AdMV2fjKxA06T0O2xACa79p0GDHto9YdophvGv5olTtYh9zHcgWwr6Vftz2m3nHk
         RDWJyr9tn96TzoXE+EyQfm6X6BtxRJFRU+9A53DBo85gS//+m1RTF9R+AsJbOoGRl1lS
         Oxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
        fh=luPegoeuNRoew1nX/MBCH8e4m5fDwrpunZ2xhGtpVE0=;
        b=fXSnA2SnbkYaTvyOcI+vnoe0P3+glZ46iyio59xRnatywvze+3aGnCwIwlpCRr65qO
         KL98hf02J0lWvhpS4iP2CPz3r+eGnMiOYgaZVCIs4gdwgOqn2tFF657FhFwp2oOGrQxr
         fdKQvCQNLY+6NuE/JtRMVxDbJ0LJG47pZSiEm/HLQ9nSTvh+pngc6LpEgqYHnewD2Lln
         61E8mku4amNYAPVNmzeYq2HKv3AOOjdFOgi32nD7lHtkQbjuTMokTrNxPwyN5M+bqfDg
         qEEJ7z3uSUf1HmEfhrcs7fj1ZiF7mB1wzQi874xf0XypUp81okMA6Idk7tGd8mzqq0bb
         oPuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352991; x=1790957791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
        b=RFllTQ8prYocmwR75A0B7d+Dap8NZs2OI7ZiNOyF6Tn1b37XYbpNtu3xUBfTtxB9uH
         hH6XSjSJbxNGCGgQjbSolFH4LwfvjZFh1sE5qEgd1hrui0cpkzrATzHpXNQC55mv+uEt
         CW9nR2e+aEOoD/pNp8BluN1QMiuMb7R9NwrjO0Ekbj8fjhLZeVYWtce9+CQxpqj+wUff
         3EIfgkwqFZZ3nGPxWQ4POpf6vYD7vZegT7hqmoO7/HxASxp20SYjwEVX2t02BpdEEh1p
         z/SyZnVEQ7fQJgXONFuZuq9OoR7b1I7xtYIg/QT9htG8X94MpMxDKJZFw6xDocltlJjD
         UkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352991; x=1790957791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYl736EIAA6MqCGLRgDKuENZSqyHdSPb4DYjJJwx8Dc=;
        b=ZgCgEjHgbM+PiK1SJNn/rvLOp2LLHTN4mTlsiFavQmPVKCxgk4YpaWx07lJ/ZlllV2
         wAHJ+m/04oAjQ1Oo5qocf7gwIqWsXCgw/nfcbXL/YGe7DDK8zDAd27sqxnJVioO06CRa
         kfWR1wbDpbuSwm4HqS+Zq/l9x5fNX8YcPFiCArjOZJ98oqwrMKNcJmWWrFy+tMr+r0MJ
         yoeDt2PMh6ENtIxnpN89KSkwvyHJ+x0nR35bIXdMfDv3M9GRBbDaPdWDh8C04xuIE4ZH
         GZO0bgIKmLoF+unky7zX+XqGLKRjhO8Z4aC9AS2SgVUZa5rUtiO72DKsMtu+SnQTeZKe
         Psxg==
X-Forwarded-Encrypted: i=1; AKwUvBwXWZ4N1qh1i1r0Hs+8Uj4Ja/Beq3vzdGYpdk87t9on3/CT6BDHyFWv6vlQHd8kLwi66FY9qCP3Ctz41nA=@vger.kernel.org
X-Gm-Message-State: AFuF++my/q4A4YxSDTb5627Bt8S2+YuiuvvWHpUOb3kovRU3j4O1lSnm
	OTkhmc2gmK4c1dAgyzEESd8tGeX5PO+pJQRidT96U8jGkkK2n4CCmu54aTxDNwpgE3H2ZFxEO4P
	r5GhvcA5n5nuOGqplacE9czFh9/QlzPE=
X-Gm-Gg: AYBFou33xk71yDwqmS/ljTfQYJTXZ0xxKAZExa1qwrRH1OBJ561OshjzcmoVzAU8mg+
	C3QwF0xsV4tngo29RXpk+Qk93xFizKMXVWDsEZo6KSnb/QGp1PzBKE9syDf2vRKW7/Xaz7w1F5K
	ETcad2qGs6lOdhsfEtiNvnj15LP2PgMrWu0MqQEV18s2V7mdXeUTaSeXKsRjSGDk+9A72q+CLqb
	agKeKaVd//D+uFaUza4owaVGWkb9PZ9ZeqB1RV8n+r9+kc/FBRO7zpIXtcZal91FkqLQ9dCtjIQ
	zpGfD3/A3HnwPDbi2fOfD/OHve/mbnwjvNWxIF7X+qRQohGB0VbIMFZ+e3fFhM3TAaeftFWMxOj
	ARN/FSiXIWEZh9fHiIGuCiZH828exMsh/N2frTg/L+uzmb8tVMsb8qg==
X-Received: by 2002:a05:6512:3f06:b0:5b8:bc5e:b580 with SMTP id
 2adb3069b0e04-5b8df20373emr2304318e87.56.1790352990865; Fri, 25 Sep 2026
 09:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com> <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
 <CALHNRZ9xAk-eVPE2OX0AiHjRe5n6AzejZ_6peS+NJr=v2jwzDw@mail.gmail.com> <516d8954-c825-4208-ae9b-1b3aa768c8c2@sirena.org.uk>
In-Reply-To: <516d8954-c825-4208-ae9b-1b3aa768c8c2@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 11:16:18 -0500
X-Gm-Features: AclHuK_H8c1Sx43SsEzC-WG489NRPFEttLh2MA3olrFoL5qq5utZjFzQ2PwO-AY
Message-ID: <CALHNRZ_Ljg2ahetObZGE5aj7kM+zgA798kG1_hbC28KHweiYzw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:06=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 25, 2026 at 10:44:46AM -0500, Aaron Kling wrote:
> > On Fri, Sep 25, 2026 at 9:13=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > Again, are you sure this isn't a workaround for terrible hardware?
>
> > It's possible, I suppose. But this is copied from the already accepted
> > aw88261 series. And it has real effects on my devices. On an AYN Thor
> > without these changes, if I start a video, it will play for 1-2
> > seconds without audio, then I'll start hearing audio. With this
> > change, audio and video start at the same time.
>
> Does the audio sound fine - are there glitches at the start of the
> stream?

No glitches that I've noticed so far. Can't say I've done a crazy wide
range of tests, but I've run through most of my normal use cases and
haven't heard anything unexpected.

Aaron
