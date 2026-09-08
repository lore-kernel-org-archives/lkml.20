Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCC4A3418
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788910326; cv=pass; b=IEOAMUTm4yZgsiuj0qXlRugufITtxyrxsNrYsDwggX85/SyhU3Nd6JFfv8e6nb65WVrqKr52S2m7Nf8Q8lx3R6FLNUhvQtAySczXGb5JvXSjL6VgLiMZbpdpH+slit+qsjOLJvpaycY6g3Bp4qG9FFOC1Avr9jr+ouWXOdJBgCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788910326; c=relaxed/simple;
	bh=pLxPncky5zvsWZOTFKe5A+fK/mnU9up8jT15KYFF6dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1N5j1M+l8IO9ViHMXpmYEHfG08pc6uw39YFJEUwsVhtQeWpgaeawX1FoAtNr+XMpn8tXyKnSvTpVBPFaYwAXb6GIw/vZKvjVaXNj0eF+RUZXu6kkZiHWbEg54IMc1uSZl5RD/Lm8yilMXRr/LSCSAm2+Q4Q0n4lw9YKxk5DcBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQw3aIJ2; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQw3aIJ2"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6be4202867aso19887eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788910323; cv=none;
        d=google.com; s=arc-20260327;
        b=jzsC0iHesTSaJ7zvxmviu/44xWG0RJVQOeIqxQVpqUkrRGz9kWJoSPsk8iZzSh57JW
         N2N8mKi8AquX47BLMe14dY/IB95VZDRNr+plBqF6xAb8zgLxWspnX8EgpEVEUXoTZqcv
         aqvvgsODvYb5Ytw6tQb+mtii1ijS+oK4KV7onLomM7JJNQ9X0SZbnkiSaxrjNJLgDbDH
         F4hFkYr05UvUfkTdmcjmzd5znyJPAky8wBwWIeOkLYFACQpIeHOf+MPVuDB6HGNlou5A
         +EgAJ/1/hcxKNLCR9clINrroOEw6E3TykQSehCYoShYub50kEDOI32x+sWKg+TPWz3Bm
         rizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        fh=hQrv+vviOQPSG0pS2uCJyMK7Uu/d1/WqnsbTOGx5Y8M=;
        b=cntqo6QKZCUG+P8eGC6uQndf5fihsV588vLeMiZnHoexfF/eebEyIrl+7p9LE1aMcM
         or72tT1zOVPrJ8RABcZ0KwBVUPfJRD+2M06MHmAw1WAPb5CSv9PlNSPCPU+41/7yUA4g
         s+A48evkeHRS0WUnHdZahROlZJXeo7ZFeM14jv61ooQEaiTX6mMugl6ToBmZnycgwA9v
         fVWHsUYtZFnbwzQulcmUzik6Krx6KnaowCS7L/ygE5V0yxeyI64HU/qI6222CMyL5Cwu
         0TWIdCUxFX+PiO2tVxzAdAcr2Z6bk9469RDzOT8Xgmi8IPTNe1MAt44TqVDEM5OQC/H5
         s3jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788910323; x=1789515123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        b=TQw3aIJ2GQiXqCtRGlXmZqNBGNC5ojuHadlBGh80a5FD2j8d7ORLzQ4vJq1uDCx7TX
         qiddYpqX9RiRnAuDkktfmt8ZqmMnl3WMQR9MnU+PWyVmbJFx6bs3Daej2B9P44n/Ic8i
         ZKkU3XRcF4LCHl6KIUk0u8GjPP42YXNSyXyMeAZIB1t46LibkCQe4K/bRXiTO78YiaFO
         KBHYMhkPMzP3h+aJzTesLPvoCMtrD9bdtEhz5I68xANwOk7sI0knCwe+qacBL/QccJkp
         +Qhzh9nkmSmUcjTQfGlfSkhiuxOGyRQWcmwhUG67hAG3JvuEM7D37wK1uQUhtobVr39s
         oEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788910323; x=1789515123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        b=Plx4dtIIT/KU27nG+4oGprPv0wILxuztGaD0SonjLm/2kidlcJN3VzsHOrr5xUrCyg
         svaiKJ3dMnk4ZH+vh3lt9W+lJWbJh4jTfCeP+qZdkoODxAsQUuKwqJK4yotu7zk2/omQ
         yq0/t70+BzTIaG/RYinoLW/F9RoehkTwUw6phm1FlIvF2/tNwgJqY7BO1pI6awydUtFI
         d5gYTeTaZEfQT62tzxVuKhJlJxY9LgGyLX/diUIyI9ed+6XlP1SGdlNMHzviOkt4j1lp
         +k/WMOrAbIGqDHt5CGhW5NDJOWTDdcQ8DxwUYnymCzs1uh41TDpHI1w8VgwhgKPt2ANo
         Z3og==
X-Forwarded-Encrypted: i=1; AKwUvBwQqtbRaxsrc6ymfQCrzGOj0W0WD441jNEUNYfi96fIG+5yBY6rVqtrJ+DjTL34kR6vyLnO5f9E3FwM220=@vger.kernel.org
X-Gm-Message-State: AFuF++lUoW0sTOmXo8nJHpV9vt8Kyw78yDzX6xg/t7RpiBPsZyDnSLca
	Ten0p8PxO89ZmBzczu9LtZiUFD3lMd8A11ha3Jnt0BIvNIRX4BSYYA31nOvP33QT4wzP983xCs/
	TmegOlScE9UitMcBPuyB1YUebyaGzZ2voBOWqHC4+
X-Gm-Gg: AYBFou2Fwbu+UkYRn+Ff2178xP0WgrfH9cRsL3dHpMk/U1ZURmC5/G5IqA5WAmwOVyL
	mUFOZS6NyCk8qwoSGuEaMm7MeQC1cQmR2txgv3lp887ZRMG42etSdemgG9i9L1jEaqb/7kaJ3aZ
	mRBmdNgHnTPkVWUgUB/l0HOHcEk0AiIZ3P1zelt3z6f+ZhcGLuPZsV0/FER9lYB/ON7xz2FYo4i
	JCzgw3If9wH/MUv6XBonZBmXb1a+eURuX3bQnHSCeALF0UT0r12qnSangjNxCg0k5gPDszBhd6C
	GLIq4hOkSUqVccOAi3DgrKEKl2WBZVankin0woDFlBcIJ3djDdoWWspBloCkrpO/Eab/7hBDHM2
	Tw9OAANWl2nc=
X-Received: by 2002:a05:6820:4b85:b0:6b8:319b:9e1f with SMTP id
 006d021491bc7-6b8319b9e9cmr15317381eaf.5.1788910322806; Tue, 08 Sep 2026
 16:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710172946.15633-2-rdbabiera@google.com> <ao3d2TlIRqxbz4WP@google.com>
In-Reply-To: <ao3d2TlIRqxbz4WP@google.com>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 8 Sep 2026 16:31:51 -0700
X-Gm-Features: AcwNN1Xw1Y5ryO3wQ35hV6_NmfuyHI7Zbl4nz0Z-Sqsiz6v2x3IDE9LAtXts248
Message-ID: <CALzBnUF14HuRhAObW+HXbaWYpPYzqG_Tt0rrm1nF2OW1T1OSqg@mail.gmail.com>
Subject: Re: [PATCH v6] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: Neill Kapron <nkapron@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
	badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neill, thanks for taking a look. Sorry for the delay here, the feedback
arrived right before I had left for vacation so I wanted to make sure I had
proper time to look at it:

On Tue, Aug 25, 2026 at 11:24=E2=80=AFAM Neill Kapron <nkapron@google.com> =
wrote:

> Do we really need a 2.5s timeout?

2.5s is actually the hardware default for this transaction, which I agree i=
s
unnecessarily long=E2=80=94I set it here for correctness. We use software p=
olling
instead of the hardware interrupt, and in the product's lifetime 100ms is
more than enough time for the ACK signal to arrive. I'll update the next
patch version to use this value. I'll also program
TCA_CTRLSYNCMODE_CFG1.xa_timeout_val to match the SW
poll timeout so we don't let the operation hang on the PHY when SW
finishes its poll.

> The dev_* calls throughout this patch should have trailing newline
> characters.

Thanks for the heads-up, I will add them.

> > +
> > +     pm_runtime_put_autosuspend(gphy->dev);
>
> Here you are using the _autosuspend variant, but autosuspend is never
> configured in probe(). Should this be changed to the plain
> pm_runtime_put(), or actually enable autosuspend in the probe function?
>
> > +
> > +     return ret;
> >  }

That's fair, I'll commit to pm_runtime_put() here given we don't implement
suspend/resume on the PHY itself.

> I think prior to this we should add a check if phy_state is
> COMBO_PHY_IDLE, return an error and change this check to phy_state =3D=3D
> COMBO_PHY_INIT_DONE to make sure we are explicit in our state handling
> to prevent issues with any potential refactoring.

Makes sense to me, this will also allow power_on to only run once in the
PHY init/exit lifetime as well.

Best,
RD
