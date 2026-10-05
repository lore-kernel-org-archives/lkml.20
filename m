Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07604411F83
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242221; cv=pass; b=Mckp/0T/uELlmUVvk/n2uTv8LYOAgoAMHxfDL04ruaLvOwLHZLoN8m0CQ4V7NwTf3O+pqFrjevkIg1SMg5PRMANkBPRI10M3xNEhfek75fPAHJYYSStWhAi3E1dxedSh+mIKafigrDMUXNZZkIiv/3aIZRDmuQ6sKQ6j8FvGrW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242221; c=relaxed/simple;
	bh=za9hu1YYVovCuUdIpWVDTK3e5USASw6UFL3szK/D1qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jU9sJFNVaoMnjJ7WxG+/eFoFk5Mp4twStS2L3tmhVa11698ejgqqdtGr97p6But2vvkcBCjLNMxH6yE5thUJeB3sD84HId7NVhNKhibe7+tBM7Uz8lWq5lmRXc6oMrIwhYPu7RnGVH1sNyYwUS9zGiknFjpc81FSCGAAEzt0UG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSC7b4VY; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSC7b4VY"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso3479282a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791242218; cv=none;
        d=google.com; s=arc-20260327;
        b=fvb3WahD1hXYVUvCHYg1r3iAsmo0fGs/18/ujQ8lgI2x9Bq4oZ/ghh0E3aKKS5jVLM
         /96wRNfjMHKKZ1Y1R6gUS8/ikr/dga+HpWcb7BRd5B8ZOxqIk4FnkpztKqUFIxAfBdE7
         xMzFNjC7nQz0dtFMzwcmDl0Z1awVdOLMgpZSq07JPbJFoKW0PcwAxwoh7JPoQG0c6vPN
         H8RkquUp6VMIrKerGmi0wJ3r+m5ZGqbrz+7LQGHEg5W+7FQTfgq7pR5Zlg87nL628wXR
         lllZXkGIePTA+87Z94+d9pKNSFv/FzL2BWucrW37ysrr7HBTqhjmgA0oFpaZmRYAbnxo
         sjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ggl0IbFeEE6Or0Q3w+SXUyGJmoXHMIUd48S2FNEyG24=;
        fh=Qjm7icpCrbWJ3DXWs0yxx7D8KN2KAPJP3x75smxsyLc=;
        b=qNsx/F2sv1k0c6bKDsC/9F7Ju1pSNzY1U3gVWQqQGtNqjNOkUUnUcZqBNRPqS5sABt
         l+VuT3TFRD3S46bkToQcCYjO99gSlWjl8sjIowlmreLJG+FxKLgrDCe680FObqDHVbKv
         PHPdDCqU7vpLtbBqAI6Q6ca8IssXOzv8FtESRZTck1xGjk06TLoArRN6Eb1cnRa4SjBZ
         S1imK5sCNAO061EQaVKlFlIYIPGizFdqZzRgObeX1F72ub5R/DTieei+mNyoVmL6Ew9Q
         bzq4/iR6QXIhSfewCHF/XRhvwW5LQ3bPr0yu6SenSxY139GU9677mHxvx8/6I5l8f67S
         JTyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791242218; x=1791847018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ggl0IbFeEE6Or0Q3w+SXUyGJmoXHMIUd48S2FNEyG24=;
        b=RSC7b4VYFohQA+22vFEq/w3COkgVUnGQ9SwB9fX5ky4yNhxMujGkmLnfZKhegPM4fK
         6cab6JYPpDs7xxVoEomGeUVi4VaXF5X9wogyNmWX2jMmZ3zG14r1mMuNQda9v2KtQS5n
         pKUfDplw8KFaVSibZ4FnhjOeVw1a0kGmBSvoGTXtvMSfsPwJtp0lUqETNekHSQ2fHX/Y
         gzH98xOQmm/E3P8EMnocX9XKDUonCXiX7Jgr3Rl0ViUw4zBrIlMQ5l5EcuVXYZNz8Spy
         giOdqfFStOIj9pOV3mQWvg2NrwtBw4BOmuuh+I5AxHbt5RzGLQKhnmKsFWElEsmZeSed
         U59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791242218; x=1791847018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggl0IbFeEE6Or0Q3w+SXUyGJmoXHMIUd48S2FNEyG24=;
        b=LeAkjZ3WjJLGEIghkd9mjF1oGVP3pX8XA5zz2gqoMV2H82Cah7gFm6kK7rBF+pnkY9
         ciHbPACXEMd9I9fVdE0mEbZOiFpjh+H6TQG14SXfRo6CjxL7uhGjoIfDCOQ1D4/vQUUF
         vkb1Joscpqu3F5dLaeyyJutrDU66FZv8809soHTJBe+aLjWKLl4XTp4jlqtQW02nFIvv
         5rEHeW/NGt48X2oLUSOnDI1IoQTEBvOvWxQ/7vVUJtAAXDg1Fk/KmqmYpBNTVLT1HrBU
         NP5wo4vQulHn7k1+A/xOX3ouLu9WzyUds6Hepuf3cdV7UPJULmtsLvAto3huaA3I7Fs9
         3nGQ==
X-Forwarded-Encrypted: i=1; AKwUvByPcZr4bcybEPNOXWWHO3Fj76TjEMrbUP6Tht7jkHUwfPnlBb0oPo8ra1IR15ISdeJCdz8Gy8tsyByrBCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX7/d0Z2fcINo0gtqMUAnHSERoi4tTF9LM1oYnG7J1WkIBIs8G
	1oYYkMEL3oOZf2xtY0+tKyWxICJoRPMAf/YBnc3xjm7PGBOJtZR+N/3sK07Zccy3oQKdAv9PgSK
	GaIvz3HXHChq4Xux+ykpWBD4t+CG1zfg=
X-Gm-Gg: AYBFou2nbbNWgQ9wXFa89Nebavl0a8anjTaHdingZwo8r+cpr3HEMH8RJifOuyZ38yO
	yJaZR4yYd4r3dieewORjaCEyn6qgOnx0yooCd3+4sizze3/qFwdo3cIjdEGopdZ14+UcmopKa+8
	mbCMQqMsbyKKfzA+yNj9iHRFPLhDUrt6vxAQoDlCyhlNT8kgwiAKyTvhPm380prCvRCC6RW4gz7
	RXDBG5NPoDUBSxT91PI4T1Y9N1Uj0XVyNIMul007YAKSHjP62k7qDusDY/3IJlSDZhAv6yRskYu
	0A32zOLaUX0T8QIhiChWYF0ih0gR046iZQ6xphDRx24leMHMuJjIFXJGHIoIt4bB5AgG8TzCn3v
	oY4KwgfElx+wd2xZWumSIs+rvZZePZSTJkKDCKF+3B3suaF9CqWZ3ZDJ4kO7sGaLvIxCQWkd8UD
	HzaKWATFfyXABQt0sGaGBbvGOMTBNTMg9d0qTjwfiohr10RkRWoRhE6l+18HytqFweFjLlXNnhe
	4PQ
X-Received: by 2002:a05:6402:23c9:b0:6aa:ff76:3076 with SMTP id
 4fb4d7f45d1cf-6af9e356e84mr9525001a12.32.1791242217990; Mon, 05 Oct 2026
 16:16:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005225028.465866-1-rosenp@gmail.com> <179124091720.2231598.15531231594364757004@kernel.org>
In-Reply-To: <179124091720.2231598.15531231594364757004@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 5 Oct 2026 16:16:46 -0700
X-Gm-Features: AclHuK_s9Eud8-TCUpDZfMQzzNEAVfdhAdJIVWcNPPNRW014EWQvbIbsbgBlhm8
Message-ID: <CAKxU2N-POZFgujAAELRjvoT0N5AEF4mg=GzZvtQah2iQuhp5cQ@mail.gmail.com>
Subject: Re: [PATCH v3] net: phy: marvell: keep WOL_EIE across interrupt reconfiguration
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michael Stapelberg <michael@stapelberg.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 3:55=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
This was tested on a Marvell Helios 4 device.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
