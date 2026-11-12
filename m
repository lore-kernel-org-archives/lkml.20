Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466244;
	b=nWrDcg9OmZn2AMvPm9IRYNOEP9IoCPvbW8Ixscyp3Q7QH15IiTUykKJ+Z1dcLj1tb370
	 ujqiBmQ+xxu3GVrZt+8fjZ4a7zgW7pWY8M7HcvZs8opKUX/n5fOy60H+Ry6v8YWHvX+0v
	 hAnFw/5F5u1FMUUYxMvnWtDr4EgV33CIhfvOwaF7Hchcw+G3OxecLmdn7XvBzTCuT2Hkm
	 xJsjallw06j6QXERtj+8LNtiMzhz2k65EZPaikfaHZOEDxsH8P4FILAqsIH95rOMgLFnu
	 E2v4ASYT3iw5PrknXweK60PSGmdgXXF8Ea7Y2zgtWxeyMJB0fjdppVeIbGT7XlKqcDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iEBOkObUh/AxvYQxzQbYn4+DPmNA3eLC0/205PmvV2k=;
	b=aUMxYfqMcr0TL2sZifGvEEppTDe9kNdRzEfR4Sqcy+tORPY/H6PaDeEodN0Jav2eZ5Ut
	 aaHGo5VlZCwoHkW8R4+S0LuMcVGZnRE5W7h+Z2UGweyshrwxtIA0AXwF5zf2fCUBcxJ7O
	 5Xuw55ao4OD8gdWP2+GPqFLpPEqD/W10Nl725YnQKgNiXgnUEwcq11D2BDfjLGDBmkgbO
	 gw4apZX5dEuY3mYMB7o/o2b3cI3PsLTMIlyeFjRwWszDzxL2otnXLPoLOj7NwW6tCpmyz
	 +jT6992RvJA1PBSeQI4muVIc+xWltJoWPD8UIgiFnQY4q9GDba+jcC3txl86Z0VfwoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RASHtTpU;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790C460A263A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 790C460A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RASHtTpU
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2893531bso2273493a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466244; x=1795071044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEBOkObUh/AxvYQxzQbYn4+DPmNA3eLC0/205PmvV2k=;
        b=RASHtTpUa6G3Vjd5SL01RtOojB+8z2ad/x7Fwc1rhK+x6p4zOrdGvGJfk/SgLDH5Bt
         tpyA4BfsftJjostyJ7+zKifD2K1hAJlYwXqK6dQE69sBprIi9px5cd16i7tGRWMU9pWz
         +whOqNUkqPfg96EMCNLXR2g7qj5I6W93rKdt9UvCU8Kfp3P2yLi6it7ZSSlAuBAB3fSl
         PRF686aEDeZ+Poig7xV5ccCA7VazDt9LKus2CJNFpstgiqyjDvCzD3JXM2L4LzK/2awb
         tHkEiSiRgSioKpI64uOg6Q+VoMdZ4VtSRIPNzEnZhworbUHUtqgBWNTEI9opIBPyDGEE
         kEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466244; x=1795071044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEBOkObUh/AxvYQxzQbYn4+DPmNA3eLC0/205PmvV2k=;
        b=mSXqWcRi8YnhUTZlCP8Qpigt4jlkCOlN2xlX2FyoRt047JPR+anjmJXaJ9IiyeUa9P
         mYAsE/Fp9ghQ2piIZoPDL5eJf85e0fReDeAFL6npSVA0f602fUKECbJo6DThaqMQys75
         VVv1GndbXDFeRfu5Ngv7C0kXuTVA0QpVb0etV8/CYQ1lv29EyhZaSr2TasFGYLpmiHrw
         b6cZSaYV3NT8kmbU+uzXmnj3oI6mAj2rd6VVCVOn4xqU2kQoRY4PvySP0pHzN6fix42z
         jqAQhIsGfnC1zSjKcggKzFsIQgDMiIZuNtmYctkZ1KXFvULskczsWG6MtlbhxYH4KQbj
         Z8IQ==
X-Forwarded-Encrypted: i=1; AL+hErEenxaH75r+d9ilRBhscrr8frMD2BVc4U+4CN5LBgO6+jimeR1uWFjcyKLP4h2r1CZl1c93wBS0cXc0lI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ATEgYRTwWDbX2qDeRtHPfX92sRPBxfjfWLvy12a7HN/k0+WuS
	eRxISf5LskhHuM9IYAoUXVhhgwBfHmqXn4q5y0nGdt3NnkFxcIwrzpm3
X-Gm-Gg: AYBFou3pB2aeQ36+cSpFqB4QwgXOFOIfCH+EkiYSkg+J7oQkIw7vgzwtTWZDEyaCDIk
	cbTeboMIYTLnlEYjVijPYP5tE8Hm72kZDIvtC3RgZLRdUAP9FE7dgfT171eqsxlDl+mmLYKEln4
	nWlblObGJtT1jHvtpbCrzppjNPJXSD8Ipm8y/YjlCxBD1bJjFtBIGAjIuJOWbW1QkaFR4WZ/CGM
	aJ+whcFJ25crwGCaCZ6xu1UNawVe3B4y7bGH7bj1BAxeS1owNVzkw4DaGN8KIKLpq7+prK+Z+ux
	c/hLppnI6MywPhBm8747cJ/lQ5hwjqmh/TEeVcLtWof4/2nk/PoyKLmBhxwJjqyZ4pLSLEvMTb3
	3ahuE5z4JVwk/Drh+2j5pwirqReMfw8jq3u22FcOdvS9PynbHNeZ9fs8sePK638lqC3gchZ0vNt
	JnoN6AIw1UCm2+CNYAmIkAxq1/klDttOU/1Qdwuk3M19dHp31aK+/tWg8VoNbVb0XPAdXg70bMx
	PrHZGyK0yDnLd7Cwq03QAhTA6z3mQEMvPlP4KJdjX8WMzvGFc/xr+nAN1cLToRy7w6ztw8WNj1b
	aQjkDepiOPG0CL6Mlv54mUOUajc6saTUXzRw7xaXuRyJOaB3LkXYEChKRYDaNBp0/r3MePa2JeM
	xLQ50VDg5vnRCVSIE
X-Received: by 2002:a17:90b:4ecc:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3b182edaefemr4410200a91.29.1794466243863;
        Wed, 11 Nov 2026 22:50:43 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8aae8sm3073297a91.14.2026.11.11.22.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:43 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-input@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] Input: tsc2007 - remove unneeded memory barriers
Date: Wed, 11 Nov 2026 22:50:34 -0800
Message-ID: <20261112065037.1800467-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
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

The driver invokes mb() after setting the stopped flag in tsc2007_stop()
and tsc2007_open(). These mandatory barriers lack pairing barriers on
the reader side and are unnecessary.

The wait queue operations wake_up() and wait_event_timeout(), along
with disable_irq() and enable_irq(), already provide the required
synchronization and memory ordering when stopping and starting the
touchscreen worker thread. Remove the redundant barriers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index b3c4c0c9c42d..51e4d985afcc 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -171,7 +171,6 @@ static irqreturn_t tsc2007_soft_irq(int irq, void *handle)
 static void tsc2007_stop(struct tsc2007 *ts)
 {
 	ts->stopped = true;
-	mb();
 	wake_up(&ts->wait);
 
 	if (ts->irq)
@@ -184,7 +183,6 @@ static int tsc2007_open(struct input_dev *input_dev)
 	int err;
 
 	ts->stopped = false;
-	mb();
 
 	if (ts->irq)
 		enable_irq(ts->irq);
-- 
2.56.0.567.gdb80ae8cd5-goog

