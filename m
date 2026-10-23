Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754333;
	b=wFIYZ/5pCSDf4F9+TQa+TyGjDKtlBiemEY7f6P+J7xTyMu5/y2fjaT146mUGBUOWi4xJ
	 jmtR4g+6CSEoInnjN6p/gln+JMXvRCDCoyrW7+nUvJ1qznZSSwYWL11tv6B89+zZtK0ta
	 MyYeUcBCc3d/nOXGoJtH4l8Y7/WyfhG8JOW2Xg6JtbnOEPfdAKPvlSV3vjBhnxLUCUj6r
	 BtqDX46Vsmr0B8ahhvSY9G71fKwoTPLhTlSclhKYHl0qL7mzgQ3DSqXp8q3Qg/jJTVKXU
	 cUHDo6QbPUnJurGiAmvhTFk39zZ+f/2jcL+aXzxliTVU9AcL1frDorIoyt6a2WNbg6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4eYMQUVemRNKeyNl32c8fCLUf4CNfhmVQc8I+lOfp6M=;
	b=cFpiT8hcnvHAyLxxpJgyYEER+eCglys88grM0zHEraNEvvTmEeVNYjX9jFQWZMwB9Djf
	 mkeshb/aAbncNBb++YRDsuEpslbSuvxTkIYT8wnWIo1aMRCZjLX2uKnyF154Om/ZJqm7w
	 tETP78ZJCAuHYYuiMaJi9G0tweGFFlP2SlsYgjW9u++WJ1kke3M8RHY4Yi2ydQatv1NZo
	 efURXO23NI2/fGhHxDULS26btIvlH9mo4j6ZobCpmy1EMvu1Npa4wwWmptV21v+8Ylzkh
	 AQHTtu9h9e5zpdSBhLDptaGVqnYfz6+icRmamFG/UXmCjH25e+3jR76crVz+LCwruaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMKa8YNe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FD0606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FD0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PMKa8YNe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8836335e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792754331; x=1793359131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4eYMQUVemRNKeyNl32c8fCLUf4CNfhmVQc8I+lOfp6M=;
        b=PMKa8YNeG/x9GDtr+H7jOlnlObm+YMkoNfSA4qLaIL1ByELUULiMRq4vGj1tj5EFCr
         2J8qG7QDI2N+njIgqfYZ7jqvMGen7m3ekoryaLIQ50+yRpGkfe9m7UaZaYfR0gSMbd9a
         PKeg1kDRe61CXL27nZnzXSnhwzZjYHSRlwU8GiL6CqnV9YI0+xs8rEnGOPMOMknnJK7A
         OdJpiO67ah/CwOT3eTD/GhR83zsNztfS5iPIIwzczu2vsIDUp1yglnHpfTYwaXwuj+L3
         xNyE/LhUwMFbMC1iY60dCgZUp5k0Qu/jzpEczBVrRKNEwTeREaSIjdAjJ5coXert/4+a
         dN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792754331; x=1793359131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4eYMQUVemRNKeyNl32c8fCLUf4CNfhmVQc8I+lOfp6M=;
        b=rCwOVO+bF3rOkBvUPX3T4itUdjvmPx4mlLS17s5mWhR1H6j5MCFsVdAv27sA4p3RV7
         NBg0e4E78Uj6ERogy4OpG/wwL4WNFRrX5x7XEDfLI0Ko3u0LiGITGyaIG93/2hSQVWJm
         Vok57ohrh0et1vBlpdTHH1KvOgnyLvs3ekkJywnX0VpU/kFrR/b4IfiKCXl9U7Xg9Nlz
         PGgaL/+7OHyhzYwy963CNPrxlzZVEGD3Gtu3HhvIJZdfQpItt/1ZS2xZ9CU7ZE2q8ZUm
         RDVK7qiA+HZcj2vdx7n32u1AILaA0vfLynnIlQC3+CFeSKHTR2UimZ9/2F++N4CSSMgj
         qz9g==
X-Forwarded-Encrypted: i=1; AKwUvBxW3HOYwL1SnpsHjpMtcfRi5srKC3WEnuJR7E2tcwzUn2PfgMUmoYmP/P2NNaLsPB6g9eqRKZbLRSKvJ30=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsVvcf/5czLDqvy1B65lZlkgJouhhoQk/eP+0diQm4LGVr61UI
	UG0Z0eSWVCQj44hCf6wJ5yuXs4qkBBhnj89V3gEmqcn0Wu9a7GZfLFoR
X-Gm-Gg: AYBFou3pkPo6vRqLm5HJIjYqf5ojOleq6y96HhwTwVaMyXq6/JvT9K4MMPmSKv1fKlH
	QM1r/py62ar2XTeZLBYeV8T1BAnIy6IqG9eSzlmNTAGdo/QvCrnWoqDmY2Ygm5EaKRKbQSa7jxr
	RXQOZ369PrIuuSYupMdqPMcAOcfa41Tpu4SF+1x/8H4jmZFlJcSzsUIxajw5NEwRegjjwiOuHHW
	MRjzaZpUA0CMnHPA4zIXEyVkc5Cg4FwlmYIVYUOzLXusIaBf8JFyyvWhaX93/MCbS+vX4kqMIzS
	0ksEhA5qPK8jWlG1NyaF/B7t5Est+oQprSo6vwJLIvug3qg+03phxuX1ccPRhP90VlyP1niXOZ2
	gaNr53OOINqItaNx3ZmFFsDGzS+lCcLSvL8bJeH7nMdnwKfrj6kMGmD/5PXTGgCmR7+za0DICKr
	/wZYvoC1MXwsvcJK5tZ4Av6fHC40YXr83R5tPEaFToz3uQFWpp9RfMLuWDqGa0rFMeJOQWhvQsS
	gOWIhQJXCqpozcrm0xfPYAve9GQZTgMRuQV5mcJg2Cn19GH/xR2/COySUATF3H6VSuVgB3VtSil
	l8h88f8aolkOWmOtMTlWq1oTSzRLW1xnp0rAN5e4rHjzEWJ1TdxK+Fsn9ydyVbzlyDK2qpRPfDE
	DtA==
X-Received: by 2002:a05:600c:3114:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a211eef48cmr29490235e9.11.1792754331286;
        Fri, 23 Oct 2026 04:18:51 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:e71c:400:f186:eea4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215571923sm34503275e9.5.2026.10.23.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:18:50 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v2] wifi: rtw88: pci: wake the TX queues when the rings are reset
Date: Fri, 23 Oct 2026 14:18:40 +0300
Message-ID: <20261023111840.2844381-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <74b5ab33c8a3445ea45d2f5d0c8d7387@realtek.com>
References: <74b5ab33c8a3445ea45d2f5d0c8d7387@realtek.com>
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

> I meant if you have more dumps in the future, please analyze them and
> give us summary.

Understood. One result since that mail, since it closes the observation
I said I could not place: on a healthy link HISR0 carries the same
unmasked bits while interrupts keep being delivered and the BE ring was
empty at every sample. So those bits are set in normal operation and do
not hold off the edge-triggered interrupt. Not a lead.

> Let's me clarify two groups are:
> 1. stalled TX ring causing queue_stopped flag raised
> 2. link (connection) loss (not clear yet)

Group 2 as you put it. Group 1 with one qualification: the raised flag
is a later stage of that group rather than the whole of it. Most of the
stalled-ring captures were taken while the ring was still filling and
the flag was not set yet; it was set in a minority, where the ring had
reached the stop threshold. So the patch covers the end state of group
1, not group 1.
