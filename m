Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998265;
	b=NQFTo2cUJFKoSvn2br40J7whfnA7rJEh7TMbas8k/oef2gRxt7tjL1PkloKHyx9FrKZi
	 DTGWLKaRiFCcxV92vgkO3OPH/IIaJE7ivye2+6cxUfjssDsEm4CLq6oiSW+fV9hmo6r/i
	 m8CYa1C73FbOA9FRwrpSMdyL6YIOGYtWfVJhxkfQZPPgv0v4xiWxa+/8/k6RZlrIHm71S
	 aZJLBZWtdC2wrSEYB2M6AB0Khrx5ow82bmkpeQnHpdQSXTvWLTE/gS2t6ymeDv9sZ4fs1
	 Qbg/WBc8YH5W9UP2CMqfRvOHaB7TyhwUFRg29hl7gkD5fmYn/kwdkjXnx9E2e08VXbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLzvJMVvplTAItMLAARGpBIr6UmHk5O/wuxWTnhHIsk=;
	b=BPbGdtTo9tpBAVRiuU5E4pbokz1wka6Pwsa1kecmEycRZHY5hiH2Ct59uWU5S2jvb5z4
	 LKuNcLgBAqvW7IRCyQC4Wc9BqkYwyWtU5UM0fFH8QG7rUA5ZUSDONl02xsyjU/aNfFdWO
	 G6xXNpgzlUoyJ7AEsPD5gkkFdGCOk+EA8IzzBX7Cily/JdaeXyWt/Y7VwHOzzTlYeCg6E
	 TjVaMUJ4sC3/c6g/ncD6U04+yAhW4NM/32M2E+azxXocXG9AQwp6bBC3T0ZPqhYtZHfiA
	 TKAdQT0f9yXtoMHyN6AK/+fBHND+5VcSvKetjCjMcwFuIGAtAFZO3anLPcF/DgLjDQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUBD40ky;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35375606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35375606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUBD40ky
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1084508c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998263; x=1794603063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLzvJMVvplTAItMLAARGpBIr6UmHk5O/wuxWTnhHIsk=;
        b=NUBD40kyjtGjEy4a+yKQZ1M2hpN9/b2ZoS/It3RnkhS+524C0pYe+oy3I6tovE7bGs
         GU9jF043Zt4whv7L1NfAQ5p04kxL/tP5RAnM49D5PNHA/YMjSrdkPd45DxQZ+51goPjh
         VkUSbfHIohFl8db2DgBiEAERFX4d6JNSf33vcsNlmKpCNfPq7WWQjunnIb2xy2HS9D4y
         FcwmlTqj+A7eYDGbnkv4WaEnZQFt/k3RHFzSVetQAdOyRCJuMzlQFKjtjPghJ0VKxijm
         nzrBmloKmAQxvlroDdRQdQs4+GyOhlbTaH9yWSKPyF3vVOBDNepEfHnTCrxONMjBRZm/
         g9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998263; x=1794603063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLzvJMVvplTAItMLAARGpBIr6UmHk5O/wuxWTnhHIsk=;
        b=m0WVZiFrV2V1dQm1yNOyUk+apDhnV4Y1x7PMJd+H7QhF45EGuwDMvweGFnOlfCHdfy
         t2XPEKJF22ZJom+tpPeX2ZIHTQ6CNlbZ3ewAsARUuMj1uFuU9hhJezTCpyxvg7vrr8nn
         huOT+zTvijymmr8N1lySO5E+kSNf6WBR6FYnIlDce+OF3LqcR9rpQfkx0ZREB3XqR3q8
         x8cTEmbC2hFnCOJ1jahOaNA8PzqQA4P8u0jzS46aQ6ypubKh1kYvKq6Seusv7qQ+m66U
         7j/yDhahokhDYpqY0GbWdyXdFQ3nr/1/fUiQnXfbgiENkis/Pr8fHDS9OxJi+H+cw9w3
         MgbA==
X-Forwarded-Encrypted: i=1; AKwUvBxnylZXd0H/jbJ/ZAIKCayhQp34AnYW2s1zqU51+giISCCteehKQTMXcByOECUFT5ARK26BZMd4pjwynW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QnMQz/px4Wh/sOlsG9ps6fBZDxIQX7qvIFlef64jx1Kg1If4p
	PyOaLPyAd5Wjl6hs2f1+1FYfm2ZofAn+xWn6g6Tq2x8KK3zAcJ/M9kSi
X-Gm-Gg: AYBFou1h4DCgQNH8JZ7PKUxS1ci4XML5vvCV4WbQphQM4+u0mj3AhVx7jU2xMRrAKUd
	Uum6ZD0T6pSi9qLBtY2hvWneai92BGUslfxBAR0VC+GkGZ+7+RF4iyILK9WvYs8Cpe0ThfEY0Cr
	dY3Oz8pgyELhRZ9QUKNaHDMI9B4ZA7/cigAktkJtd7sACOG8Yxp3Z71ciB4q8+kI+uzQrdKYQId
	Inx1vE7+p0z9tzyVx3UG3oochryxffp3JSKRgGHRrTywAU2MvNuvt9Tcr1p17qNG7xlDQDP6Krv
	rNQ/9g9s+EcUO3iNpgh9h7T8QgKA+Cx0h75fj4pStlrvUA0Sy6rJcIfPhsQ6AH/K0PnjtlvgsJE
	xw3SWxJPwAFnW8u6RcgNOEh/DrGHUDcmj9I4LwpTSLsXh6wlfTAGFD9yI8ThG8V1nzt6Hx8UsFr
	QErQsC9uVETCQG/6xG8U85ZEOOCgaAA/rWb1aj5zQaRs/qAP4uZLsmt1Cpujbo4Hn8LOjUFLifa
	zKCH3loky2bvpugtvm94Vp7YdAFkexhwHLIHFk/TiLB2uL4crukSUj0qJ2pNLMHbQOrbp9eQ7iJ
	RhA3OgSLrH3JKbB557pNEa4LiNQ+TC25JaGauxb5ILlZaAkat7aQIVrH1KVpa1HWuI/KTR7vUyO
	jRjZotb+S
X-Received: by 2002:a05:701b:465a:b0:192:fd91:c567 with SMTP id a92af1059eb24-1b25d315b9amr4036297c88.11.1793998262901;
        Fri, 06 Nov 2026 12:51:02 -0800 (PST)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm8445952c88.17.2026.11.06.12.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:51:02 -0800 (PST)
From: Yifei Gao <gyf161023@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH 0/2] ALSA: hdsp, hdspm: Fix unlocked control_register updates in MIDI paths
Date: Fri,  6 Nov 2026 20:50:45 +0000
Message-ID: <20261106205050.8048-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hdsp and hdspm keep a software copy of the card's control register and
update it read-modify-write under the card lock, except in some MIDI
input paths, where concurrent updates can be lost.

In 2011, commit c0da00145f9a ("ALSA: hdspm - Fix locking in
snd_hdspm_midi_input_read") fixed the MIDI work side in hdspm. The
interrupt handler side was left unlocked, and hdsp has both problems.
Patch 1 fixes hdsp. Patch 2 fixes the remaining interrupt handler side
in hdspm.

Both issues were found by static analysis. The patches are
compile-tested only (W=1). I have no access to this hardware, so tests
on a real card would be very welcome.

Yifei Gao (2):
  ALSA: hdsp: Serialize control_register updates in MIDI input paths
  ALSA: hdspm: Take hdspm->lock when masking MIDI interrupts in IRQ
    handler

 sound/pci/rme9652/hdsp.c  | 16 ++++++++++++----
 sound/pci/rme9652/hdspm.c |  8 +++++---
 2 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.34.1

