Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586569;
	b=JFVlIJGPX5JXdn8vqXWJJwhTVDnxUrHKjbmK5Vrh4b1F7xFbqGKrU8fpsuyCNjn0cfUA
	 JNDQn7hpYxTQql5z95vhDCUTP8Kz6lDNMZuL34dUhv8jCPPrhn8ijfJ203MTGi1jrl1wg
	 8jfaeQn1YRdEOS9SmQZvEx+wChCmsK4rZX2faeuIZBySKsnNCfE7/hkNZC6GmGODuaf1D
	 82EIR6aEBnnfG5gM07gI5+6ImDYsFdZf0W9rtAxMl3ueFmMzAveP/RrUfCgxfqVgRo4ny
	 AOq5LMrqNK4tbxfK3X0w+r8ZygY6uaCjmbEwxg8R7oBwYVIe/7EgZoVu3XXu35RuyHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CNj2Qek4c4lAN/UKdLhSW4xMEvjSJqkN+NgM/ZlaTKY=;
	b=yl3/05unHcuDOIfNdSf7xZY+CmNDAEM2rGU4KB5uMXX9QTr4fnyxyL9lAxGgN+FuKARh
	 g1+r/nN+LwUPG/0+aDPbynZV86bxQvkS02iB/qg6EhRP8w1avGT1jDRGasnojykOiJydK
	 m9UDdCBx5qEoYupoNq0F/rPnUhBsOWX95ZEKB3swu0UL1MtT0r9bEk/IEE5f+fM9pMUyv
	 9kS+yudKfIXg9R+VHas966JueuZ+bT/l3BNXId8N7aTxKLMfxT9TYUroqop11JV6xlOo+
	 jH4+aAFa+Ai+HwGVdanxlWLXdmvvk5aZZXaChirNXA0rH8LGKos1JkLtuk/iNJWkaXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+nWQWh4;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81209606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81209606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+nWQWh4
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070755c8cso958030b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586569; x=1794191369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNj2Qek4c4lAN/UKdLhSW4xMEvjSJqkN+NgM/ZlaTKY=;
        b=y+nWQWh4Ag+E4v1W1P0P5c2dvZYL37Y7egYC9FloiPZuyG19Kz7u3mxFdwAmq4khDM
         eF8HKV4T6CGa0NetbdoCY2WvrsjNRCOTHU0J7+lqXK4q69ZxwT9kKOWeuM5c+XdaRqKR
         FKoxwp4MIeoeqkeMWoUb7S7lFCCzMrFrSVxuPBrpZDm4YSHPzcWOtP/Iy4AInR2dWFFa
         zPM79/6lbeaH2JRpzexWp+J64EJBQdkbYP62JPr7/pCF84NkBd7dYnJJtUaCfK7qlBbK
         x+/iramOiP8KN9l7JWTZqrvqyB8zj/jM6UFkTN/ia+uVbV8Ft3T7gTs+0Q5d3Wh2jPic
         QX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586569; x=1794191369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNj2Qek4c4lAN/UKdLhSW4xMEvjSJqkN+NgM/ZlaTKY=;
        b=nqL8aHugkMaMaMLYPcJjbfZPdQy6RdGGD0L+dza6jRc+AAbvy4l6Hijkw3dT6R8ZEG
         rXLPDGJNyGssLfkD2gQ+LLNeZxvfKeDAXlaaldmHyFqLsoQemVkJXOqd40t9hgX7WEM+
         T2pmMj8xehAWiDbsZ94qmUJoB5womawpRRXnvPAO+jYzsImSbn+X8wXyjeu6ls5O0wpB
         sFIhDBzRqNMzf7EBSZr98JnJhdiakJCd/EPaC//sQidxhlLsgfTVudW1Z/XK3tdTJKQq
         DF9ODP/T+nmvtchUOpOEXmaP98SCu6T4lRz7lfAva+W6VMKcHgRYzyC09GhWukCsHGYk
         KqjA==
X-Forwarded-Encrypted: i=1; AKwUvByxKlPZ0dCVwFXBKULqxjUss7MpFgu8h1RA0lrOpfCRCeT044eVX0V22wE3J4XP0rv7/CpWs1neiQi+L5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7FOvFSKPhVbJUa0AR4Oc8ooC5oRnWnC3fTgJbjyo5PLV1eodP
	LycQT0CeEY6oci3nS7cIbA/0Fyui3Q/TpuM4DOCNisiptRdGLOaKUBe0
X-Gm-Gg: AYBFou3ScXlblxY3cJlgJdqRQb6Yf74frteJ9xJMb8DXOFaNAWd4ZfpEkqB0MUAV7Ak
	t2GBO4xWUeNHJFTQD7HBuZsZ7wvrvJAS2pbTM0GXeD/MKzMxD0s/d+OHQMoLaBE2+AW+Eu1X8xs
	VPthbODcRQNmsnTVg+ItfOQ/+8AuECTCPmYzNEMPye3uo++zSyTEtqf8zJCl82P/RFqu71m0/wH
	/0KLNJ8wNJOkQcltg8UJhx1fE/HjqlVhKD1pLhAllSC0JripUYFNhpj5JoBWMllI5AG1eZFnQT5
	mM0B94PJsLqO/ZkO5ukNpn0ZyIDhZ+37lkxF4oNjVy7FxcspX65c3s7C3iQTzrIEmkJZFaS+4T+
	4K+0d1+H/v4eTjYv940DYfYfZWfJ594t2YKxF9LajwufEkHtjugdDjH7Wxo19ojxWTODxdlvryC
	0l/4Iy41SENXBg+0nr3oJBLZmsQfIUzCvYo4SqUmUPXq0yuou/R4wn6EpX6xQjvC6yLbQBQfCMC
	M7E/kxPclkvXIUbwOSQSGfqEkMIz7zWFj6uf4WQ3/qMfkiQckil28qASUwMtErB7Kocusfn4+Vm
	oEWrCJy3eVTeJJxVmeBzmEZrIsgSspjPNe+i2JcegoVKyPTT
X-Received: by 2002:a05:6a21:6f0d:b0:3e8:b7fd:628f with SMTP id adf61e73a8af0-3e928c8d3d8mr7174182637.22.1793586568889;
        Sun, 01 Nov 2026 18:29:28 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09814cb9sm2441382a12.24.2026.11.01.18.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:29:28 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	BeaCox <0xbeac@gmail.com>
Subject: [RFC PATCH v2 0/2] mmc: dw_mmc: fix teardown races on remove
Date: Mon,  2 Nov 2026 10:29:22 +0800
Message-ID: <20261102022924.51343-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101063719.88570-1-0xbeac@gmail.com>
References: <20261101063719.88570-1-0xbeac@gmail.com>
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

This splits the dw_mci_remove() teardown fix in two, because the two
objects have different lifetimes.

1/2 drains bh_work.  The race predates the BH workqueue conversion: the
tasklet that it replaced was never killed in dw_mci_remove() either,
going back to the original driver, and commit 921c87ba3893 ("mmc:
Convert from tasklet to BH workqueue") only replaced tasklet_schedule()
with queue_work().  The patch therefore applies to 6.11 and later,
where the bh_work form exists.

2/2 cancels the central watchdog timer, which is new in 7.4
(ce0043b9a302), after the work has been disabled so that a work item
that is still running cannot rearm it.

v1 incorrectly used 921c87ba3893 as the Fixes tag; thanks to Shawn Lin
for pointing out that it did not introduce the race.  The code is
otherwise unchanged.

Testing is still limited to W=1 object builds and a userspace lifecycle
model; no hardware was available.

BeaCox (2):
  mmc: dw_mmc: drain bh_work on host removal
  mmc: dw_mmc: cancel the watchdog timer on remove

 drivers/mmc/host/dw_mmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.43.0

