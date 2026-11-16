Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813570;
	b=PyjTWtRyuAv0i87D1MboJ/Dj/YppiUROr2XERF5YNQnOB2P7pe6nKPbODKPC8Cj5H9wY
	 RMhOyvpGLm29PruFf3qTSUWlS5oxGAOo7ko9q40B1+hDzEa1KuEnjAREJN1taBEn+k05z
	 ONTrWBkB1Zqx0hmZoHJhBCUi7QCmzBI2co+x3EaXExEL5/qpIq+lj09Kg4WBpC993kBtz
	 3Guzrbym5oFM4fGZuTYXz9fEWfeBHTc35skOkonRx3dK87h1UEx5yfjXBUNvrxIJhptc8
	 eGK0BHx1Mg3M5FEggMj1bCr5iyk0LrsVnyQ4cFJ5+cAH3fv9FfFUep4XSATN4ps93Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hpArKDI1kvex7i5YNprU+XK4K7TRng2ZiTYQoXQGmQ0=;
	b=IzrFcrtP6w3Mx8hXtiVDguNm0f3QSeimWlUeKxAQf7hXPfxZGbGJjTfwbxZnZHhjkpX2
	 tkn84+vb/63APqNV8mqlfqrTzrmjYAvmkjmuANE17PQKUFbMRDW2toDTPW0LDK3ZeQ2S2
	 TzX0oL5CWotIZ93xgXw+Mka1mASor8h0DWKcRC4+idg2BhMu6ocdWgjlgF6Vg9uFuDTi3
	 mJz5JxtVDiynzFs1hKrm1tgF8xldTo8yedv9ZlFj2IClpXhc6u14swhE8lu0+myLXFHsB
	 iIVunIDn8nyorReXyp3E09Fcu95tSEtWB+Rl8BfOOkqNZYOVAxXoV4IrHR+oRX6KfbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMP10myj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F76D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F76D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMP10myj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so6601935e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813568; x=1795418368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpArKDI1kvex7i5YNprU+XK4K7TRng2ZiTYQoXQGmQ0=;
        b=sMP10myjEyJOAIwJkxpYGqqjq4g8UU4IaraQOM2Rt9WqHC1BUR/w11e3Og6qmJzAIa
         /KGjsxIq/SiHOnCAoEhlZZVUPLOndhVOkwiKl8l8v+K8nLRigmvsrsqyYfME1mew7PDb
         cbLjepnQlPI0pmAP47VvcGZGrewQPyRjE5lWocQZk5d3qK9sNimOzlA4ZEAsfxNUghQZ
         IsamjtKH8QF1ztBcIOiEvXbog0ON4mv2er3Fg+3+vT0CiCUsM3993BPYYl6NMUIiNUM1
         /6I0r8yKYdQ2461u9k0A7Ae4AaLrvIcX8a29zuActSdeZ6tPD7jb6Pd3deA/EKqlx2AS
         iChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813568; x=1795418368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpArKDI1kvex7i5YNprU+XK4K7TRng2ZiTYQoXQGmQ0=;
        b=L/xclQAeyGVM9a/qQLHlqLkeVgxt8b9Q2zBRS1DF1GsLdk4bsSynGj9m7sCwyLFgKD
         YpFS/ZsUq1SrxJlUr/FJtV7Rj128hv0untZXpBl7YRs1jbhTcieVW8gdqH03S9tZmkMI
         pPbQpBElm2XixbJNukJjn1ikjBpoGI5HJYqVgezE6m/+2wXJG/Tese3OaVgv5eMgK2un
         pKq8N2GlRLeFwd4C6+zWp3NtsIZzZyMerBks4Gmr9wVB2LHXWGcl2hoGV687Rr4yba3c
         XeAESuI17HSyzzsSuEeCE24/xXr6BZpOJg/qGX2as+PWHdwQDanjchKXh85lOM5T/n1O
         w7SA==
X-Forwarded-Encrypted: i=1; AL+hErGDaMvdaMPRrqrNfdBvTu2ykh2rW4/UOcd9GU4xfe6Oslcr82yR0vO31fsR70wjeR2vtzui6OfcislmHGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dWmwZVDg0bx/VR7h14wcXBgwJ2kC1AZyopbL6AAbimYmWkjBz
	dKhvXLXupK5blk/LN6NfdQxLMQSgTjQdFQCv0oQp10SkOIYvFKQc/qma
X-Gm-Gg: AYBFou18gJrE1RZOQlx5Z5bG2FN/MTQCEjZBYLxNM/fMpGoptjAZLJ+oiNwia5vAB2r
	kOtYSzCBbT4F3TGEpd3tB09FPVHQm3GmeQSj858dr93jBlIo9Ev5I5WPusIuLiPfRhqje0nNuuT
	YTksvlQJBXnwy65nXD9PVugiPjAZ1xJzrtlGUreLM4NhuGdblwFBKVK1Lr/jy/K+tCqBuQEK2l8
	DmeqyovTHthSfXVeM3GR1BiuMvX56MPEkDXB6PWuOMbaSE8GHcFYy6iVDgMvTCWSverVIGFn1zb
	sbYzE7KEmAMJ1e8czocDDCMZmAK+hTvztoPy9m/R2z+A2y7YYnMf0D6n20ZTAxyYiIncOdFAKbP
	pGJpZVScBrswRyguJaM+FcHz/6+Jq5+wkRkvzdQloml7lXjHt8G+wYhvhmGFOvNGZJEPAnbGcdZ
	g86XW1MHssVhR91181agr5EjTHO4TRfwTnt/TDNEssop+LmmtgS4u6ZFDEpipLERfZVrLdc6y9b
	ucGyKYV+LjPW6kpLodEjT5zwAENe8rLa+76G2OhTH1fhIPlthNi0Cc8gfXcavp1I7kg/yYDzE/a
	djweuvTs8IRMC8UtQo/0r+kYenP7L9D2Ce4QtuD+5vHufnbCZEFhDIxphlWcVZGcN3BwQb2Rm0w
	=
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr213009275e9.26.1794813567855;
        Sun, 15 Nov 2026 23:19:27 -0800 (PST)
Received: from ahmad-HP-ZBook-17-G3 ([37.63.251.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb729b2801sm50506845e9.5.2026.11.15.23.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:19:27 -0800 (PST)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: synaptics - support the touchpad LED on RMI function $30
Date: Mon, 16 Nov 2026 10:49:06 +0330
Message-ID: <20261116071906.30110-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7f9d0adf1f49c5a2b3919130caf0acb7@gmail.com>
References: <7f9d0adf1f49c5a2b3919130caf0acb7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

On Mon, Nov 16, 2026 at 04:41:48AM +0000, Dmitry Torokhov wrote:
> Could you please check if booting with psmouse.synaptics_intertouch=1
> switches the touchpad (and the pointing stick via F03) to RMI4 over
> SMBus on the HP ZBook 17 G3?

Yes, it does. With psmouse.synaptics_intertouch=1 the touchpad binds as
"Synaptics TM2706-002" through rmi4_smbus, and motion, taps, buttons,
scrolling and the pointing stick (F03) all work.

The reason I kept it on PS/2 is a side effect on this laptop: the
embedded controller turns the keyboard backlight back on when it sees
PS/2 input after the backlight has timed out. Over SMBus the touchpad's
traffic no longer passes through the EC, so touching the touchpad no
longer wakes the keyboard backlight; only typing does. Nothing else
differed in daily use.

If you still prefer the RMI4 route, I can send a series that adds
"SYN3040" to smbus_pnp_ids[] and implements LED class support in
rmi_f30.c, and drop the PS/2 backdoor. Or, if the backlight behaviour
is a reason to keep this touchpad on PS/2, I would keep the current
approach. Which would you prefer?

(Separately, sashiko found that v3 can leave the LED lit when a trigger
is removed at unbind; I have a fix ready for whichever version comes
next.)

Thanks,
Ahmad
