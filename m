Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416655;
	b=MJvsUZLMAHhqnAzvrBbTi82KrY0w3qvFOCw4B8m/bqDcNx8OV6cJs+Sa9MHE7TInou4s
	 Q8MKV2Tb1sXD6RTKC5zjFZsL2d5Q6uxQqiax1NU1DPy4y9GxlJ+Fcntbe39Ae6YJrMD9q
	 gu1tQL+o92XLnfHmlTwpkOBlVprUklTO9QqAapIeWidaphIvliZnFFf+Kpd7Yo/PHa8i6
	 qLP/QlL8EZfnv0WCcZdWech0o4vRVZP6AP81vNBROtKjg3KiHyvfQ3/QXpFVNMS4pLO43
	 qth9+H2MJZzguglxQ/ZGdYtPqq0VRZIjSSDR/eiR8y2eiOPadZJdTuH3nF5Ra58YAbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D3og3MEI53zysEm81HgrUH/b77qnl1uvybcLOq7j15s=;
	b=kP488pQzKq19g+6cMgjzvd0Js1f/1rGJOZ+wDHF0yxSCFPJ0gzmgLVkzcGW1nzlZCiz4
	 j2zWfxWl/JpgRgiqCU6t6DLVh1yWLad1MgLWZXmrkMlkKl8maXeVyoetfwIzRCG2LxS56
	 CVBWqb4npvlgy5chwNgdtkEbWO1oMjFGnFOXHe9A97NIGWQaJdvGb8jxIruVCyC6FLlgO
	 oCPET+Ul2zLjps+hHwgWSqpRP0Wm5qzWQroTygKw/NjvYyF0Tj8VDxCcN49S4/k04jjtl
	 3CnAIbGPxaYAXagFv0oTDgRSQKJKPq2boMY/YlzaC7FoOPDFIwha4APKDV1pSea8JBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BLX9VuSh;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB899606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB899606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BLX9VuSh
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3782187a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416653; x=1795021453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3og3MEI53zysEm81HgrUH/b77qnl1uvybcLOq7j15s=;
        b=BLX9VuSh0tGPjDWO+v1GGRNRuZysS856JlySOYtGjbOf3NefuQLksEE4eaLchLEX9y
         0ssKGSWuuJPseC0tWYcvt12rv1aWauXmJ368GEYUXJDcWr/rrzrcB5agBEWvYlJu/7cU
         m7X0lTZe4GJJ/Ea+Gzy0Lvn8psBvzOW5oRvxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416653; x=1795021453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3og3MEI53zysEm81HgrUH/b77qnl1uvybcLOq7j15s=;
        b=xbM0nyFK5+bV7sQNjzGsR5dozqUuykmkF141KJCjJz+f2uzePkU0kV0aIIz6SrQYYT
         O9pQMZMR1Fy8NKT74z3qEE5GNHdN86MDboJ1H0JtczurC59qgcglP3H6sHYsaZGHAijX
         3Wp1W/JH6dNzYYaau7d3nKEYtcNqlD0HRmzPVxzXRrlAqgXK/N/r7ocvx9HXrp7UObPu
         SKrgOcG+aPUATta5SMZuJutYd8mbQLhoOJrJtoBCzUcMXb1XA7/lxQL6bVVBk9nwlkOa
         uJuKn89z0kjT9EovME+SBtS+oR6Kor6Aiv6a6DGyW8ksSkVAcsqCZWv1B9BwtxVNTYaN
         Fcsg==
X-Forwarded-Encrypted: i=1; AL+hErEMVXgHULzpe/kT9MIvziTwshUMMP3ncRE9axDOoBlJIcR89f5Sa8juZmP9BotminjJpQobhkzndFgNPgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KTkYPqCk9AfQColUfxnmBF2f4/4EyMXkXvLxc2JS09iDw0ogg
	Ajq0FILINHg9tOVCbp9phc7FXZeh7HeQTm5PiRb5SeyjilCpnwEpm+IerJLHLitbPxheLagGkLa
	nsmDXsLQ=
X-Gm-Gg: AYBFou3YQV4aZQrgT9s0CyJ8B/M88YcUvKzFF09iRy9thrVTuvqYn9CQZydF3KtpHpN
	ViK0tvAkDTcypWrT6l9WExmhFpV69vjsRG/5D83FOq4afSkbJ6W6Cg9DjhSDMl7PtbpA/bTBRxf
	dPIkDypJ8YdkjrjTeJL8RtEF0iMMX9AEK3SE6nrUs+c0DJDX4EFcTurwooy+pPmkG3Hk9kvfLb2
	2ZCHe+bCOL50dVNrXXWUvdUdjo2fN1jFdWqPMp44R25yB7QDQoCJVuTrZqjkEybsuZs4njMLtXQ
	ACFNqedlJ6Jltfiq5n00f5JOpZBtdgUGFksasr7R1JOTibbffmPYiqRsNQY7gqFczx8Ajp8h7Jc
	bs0gtTpjfP6BC1BjNfmxWhnRIbFhpQcEDXigCnQDq1KzA/zEBAJzjmv5jjUYMYDCt/rLR0Ob91n
	YeGpCwL8qjXm7DR6WZouLFOaT9bRG0ZzdU2RUoVcaq/bjFAjscm0XywAdQsAgG5vRwXOD0RKyCu
	R2MUdjEI2Xz4RUyLGnumC0pK7Nwq+MOpEaGBZ7kHGXI4Wi5XmPenRdpf2sSp+RYKP1PljvcbC49
	Bt+bkAISrlxmf9inOFH1pwaMkzwPPlUB533O0wKwddUGZRpnlBptX9ga0nwFr4Hw2gn49L2AvrX
	Y9+aoo98E/I2Bcmn6nmURh2eC1bD98izSFIPZ
X-Received: by 2002:a05:6402:450a:b0:6b5:875a:c2a0 with SMTP id 4fb4d7f45d1cf-6b7775eb13cmr2291718a12.24.1794416653066;
        Wed, 11 Nov 2026 09:04:13 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:11 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 0/4] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
Date: Wed, 11 Nov 2026 18:04:02 +0100
Message-ID: <20261111170406.1634428-1-chris@miget.com>
X-Mailer: git-send-email 2.56.0
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

Four patches on top of Mingyou Chen's v16 "Merge redmi-wmi into
bitland-mifs-wmi" [1] for the Xiaomi Book Pro 14 (TM2424).

The firmware passes SystemPerMode to Intel DTT, and the DTT tables in
its data vault name each mode and set its PL1 per power source.
Low-power, balanced and performance map to 0x02, 0x09 and 0x04. On
battery the firmware's performance mode is 0x03, so patch 2 lets a
profile use a separate value on battery, re-applied when the power
source changes, and patch 3 adds the quirk. Patch 1 keeps a failed
profile read from aborting system suspend, and patch 4 makes Fn+K
cycle the platform profile.

Changes since v4 [2]:
- Rebase onto v16
- Fn+K: cycle on 0x28 for every model, drop the quirk flag (Mingyou)
- Add Mingyou's Reviewed-by to the quirk patch

Changes since v3 [3]:
- Move the quirk after the battery support, so 0x03 is its battery
  entry from the start (Mingyou)
- Move the suspend fix to the front, as it stands on its own
- Fn+K still only handles 0x28. Event 0x16 reports a mode change on
  TM2135 [4] and TM2424 alike, so it stays a notification

Changes since v2 [5]:
- New mode map from the firmware's DTT tables (Kento)
- New battery support patch
- Fold in the Fn+K patch

[1] https://lore.kernel.org/all/20261111141226.9482-1-qby140326@gmail.com/
[2] https://lore.kernel.org/all/20261106114300.936782-1-chris@miget.com/
[3] https://lore.kernel.org/all/20261101161814.1325847-1-chris@miget.com/
[4] https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me/
[5] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.com/

Chris Taraszka (4):
  platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on
    profile errors
  platform/x86: bitland-mifs-wmi: Support a separate profile value on
    battery
  platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
  platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K

 drivers/platform/x86/bitland-mifs-wmi.c | 175 +++++++++++++++++++++---
 1 file changed, 155 insertions(+), 20 deletions(-)


base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 290a15f4692b36391eade807db324a974a4c1f9e
prerequisite-patch-id: 48f575fda0c7b1d4c66179af98a7f8825666ac87
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
-- 
2.56.0

