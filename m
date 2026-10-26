Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013736;
	b=u/MCXw2KLMdekKGjWwP/EGFqNNuprk6K/gyVLApbjsUOaHUWXl8eqU3fTlRcftlyXPwu
	 5Gs/Ci4BFhWrmkHFDrntGNDqCBry1FUXey7aqTDtAdMw9QqJRtc+czsqHZGdhwkzAoQt4
	 Hk2Qxnnv8TRUGwmr5bA7NXO1cnoH7vuHR3fk6tquFTt8A2BtiCjDEuoJc/U0R4ePSu3np
	 0bmqJY3DChGppv2K7ACPtGJaQGLW25NqTT/yDwhEQH92fXmGF59sppenf6+r/kwKU8s41
	 WbW32BM1K8K79KB/ShaUSuavWx32Xvxm7XF8/3h3Dy3HSJB1b1uJpz+2WdHMbyeDe1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CwUajG6zOxtmKYKaBabWQ/RQ7YEOVECEPn4qU0GhKJI=;
	b=UMzIXvAbFZl30nKwTknGfYtMJ8uAg8+2+G5e4LQsVrjpwDba4vrKaHavBAGfm23fjzTo
	 o/lLQX5z2VbPqiQ1X74ccmkaWyeDvoZ3YoxYOZlQ7qnzLQe6KNVF3ZZDd81qePm51mI8L
	 A4zc8JCFLalgSyUFf5xcEtg+eyFHfXXLSqNojcCggJ8v64xSq8FptDllE4aslQyr6Rups
	 aQyoKQfhlfDDlLOSh4WAoaUKsqQikGF38RTiyWI73jv8vn//kAd7ucd9+IS7NrRDilUwh
	 1Kn25R2QjynUci01WIxp8Frn9H2t8Inn7outkNFYS8p91y+593FSz6lbEOgU2OIyXMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/GaxXPF";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1006E60A2600
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1006E60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/GaxXPF
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so4964575e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013734; x=1793618534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwUajG6zOxtmKYKaBabWQ/RQ7YEOVECEPn4qU0GhKJI=;
        b=A/GaxXPFgozeZ7aLS9ssmDZFGeG8eQ01zyFtmvsEFEjHgN0ZpShGubPQPT4c6ak1P4
         dwJQljiF8o8ydDBGa6DWNlST6KmndsguhxZoSXBAF3cFAr2VLIcvGww58U1l7TFXyNr8
         u0Q4hMX8JyTzhJVfOXgZ3SVw+3ig1+XWrfnCsemzqNe0ZHHPfQhwrnXOFn88YwOD0KHK
         fFH17KsZHJiZ5b4vfG3iNjUBmmh1/cUqLR1CARwXyQ0+Nz1Wocn3dwCeQvYHYg1Hx4mt
         FGAGya+o5DgR2lQ5bxC6kUC9MmXpRGjhBQCx9E6zappKoh4FpNHs2/Ap46JX+RZIs0UM
         e+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013734; x=1793618534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwUajG6zOxtmKYKaBabWQ/RQ7YEOVECEPn4qU0GhKJI=;
        b=U51j/DRzdLLqWNbBkDlG+Eeh6YtytniJr6NLIjAujGz0uNykcc4651LnfKijivhoSK
         kxcxqEL0zB+aolkyab37EDgULON0mupXuYGG2dFWmxql0ko2lKYAu9yJjsw+dTgQj6O9
         sxwPUeI7e4XVo4GSrGgg4xzXHXBNMMWdOoZ4m5z/bk4P13Zml+YqISSomI8xwZphjIG2
         grVtenQpy06bJZqRTMbb5k4QnunXBZ164roCym/Mlriz6gWuaKFW9Se3P2CooJz0cjwl
         fuLSdvUkJibMLP1//yGYxWlwxOKTqLHcB8WukTiBnnvLcsc1t1JBzwA9qjIcgpNuPsk6
         QQcw==
X-Forwarded-Encrypted: i=1; AKwUvBzqVo2gIKwQxzRoj9nyAfzJQMiWVLWhcoFQAYCpiOhoQYitC8gj2Jg0A8jBz48ZjwyM5tcmmsfbsfm7IgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEhbvAsqmX3gP777UjrtvKSysXkFriq53DdYAPlaeXx2CiebOO
	+EgfoLjDQN0bTSLhw4UQLxhzIfQiv+33ytT+3xiJBWjAopXMlqNTZILGXoT29Sw=
X-Gm-Gg: AYBFou3+r5DiY4ieYqbYnZF2BrueewZCZxkq9m43JdbVni4cGI6aJ+CWzsL7DGwVhr8
	2anENFScUov8AwiwkEz34V/dUAm7YOLo0wqfirdqOPWMNpZayXtfL36MzJWiSEgT/yfwfioynbH
	Kz+6G3zzBXOeMeLPB0X085nw4HeiSAKVOaCX7lu+Of3aAL79ZW94aRV3YC+BZpaCPRQ8MREkqrH
	GB8YlUyU3kJFQm//+sY/0vVlktEDSEjgGB8jNn6xL9P1QWwfAbvy+62s6n+v/xUWUcIk/CnUHXA
	TD3B4lG8bBUw0ijrMYXKD27UARbGDLZ5WhKSshVJVN3HaEnht6CWNRW83dgFspbnQQiNc1qw0eb
	+hlCvV998hrRR4IOhwcEkMMMPPXdszEpj5iiyj4bzJxPApBlW38oLBNrsOJRvCZkRcBnPgLRCq6
	I4Rn+DUBpx4uhWeoLVdVflL9qlz0jNiMnz+yCVEDt2byHLUTg88ACuY1Au2+YGNjfUy7AEqC/lb
	XtBJPCUnLlr/O9PLVzfuYac8w==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4a35ac99bbemr117137165e9.15.1793013734410;
        Mon, 26 Oct 2026 04:22:14 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:13 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 0/4] ASoC: cancel pending delayed works on component remove
Date: Mon, 26 Oct 2026 11:22:08 +0000
Message-ID: <20261026112212.2519775-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

Four ASoC codec drivers initialise delayed works that are not
cancelled during component removal.  If the card is unbound while
these works are pending, callbacks fire after DAPM widgets are freed.

rt5668 and rt5659 share the same pattern: the IRQ handler reschedules
work after the codec is reset.  Track IRQ acquisition so that
disable_irq() only quiesces a line the driver owns, then drain all
delayed works before resetting the hardware.

twl6040 frees the plug-detect IRQ but does not drain the work that the
handler schedules.

wm8994 frees IRQs and firmware but does not cancel any of the four
delayed works that IRQ handlers and DAPM events schedule.

Tristan Madani (4):
  ASoC: rt5668: cancel pending delayed works on component remove
  ASoC: rt5659: cancel jack_detect_work on component remove
  ASoC: twl6040: cancel headset jack work on component remove
  ASoC: wm8994: drain all delayed works on component remove

 sound/soc/codecs/rt5659.c  | 17 ++++++++++++++++-
 sound/soc/codecs/rt5659.h  |  2 ++
 sound/soc/codecs/rt5668.c  | 20 +++++++++++++++++++-
 sound/soc/codecs/twl6040.c |  1 +
 sound/soc/codecs/wm8994.c  |  4 ++++
 5 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.47.3

