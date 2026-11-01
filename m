Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549903;
	b=W3t5IG6kK22ffVy/SFEfh94Q4pGIhbp/427HXuioa2ewFCrdNC+CVCwKoNHOeMZGPC/7
	 dqHQSX9m3VenvmL+OGMsWuSnuJCOuQTcZrP0iS+wDEKrCt5lCLXIdcY2BKfoHhovcvkSY
	 uQ5Cff7ZfpYDyqC9f/ui+Y31Ayijun1VqqAR/9I+aWwA2pQVPPaxmw3xLi1Z3Sc3g7vFq
	 a9UBwEfsyZ6yzuUASgzA0R+dJnc74Ern0UyoYmrgj/I1IJc6IuD56R2IHTBjfcum+WUcr
	 DMCwCTwZhmWY+VDN+zeCZzgLmVLcp5h9kzLl/1/xNqhw5/PPSInCyxc6GwiKzConLyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=btxl8RcoseK8+RxQlmhGi7ac+CReh6ErxdFhgHtvr9k=;
	b=UKd/tJTn1cFgq1abzaYmdD8yDdwnzRPMPD1x7w+M6IAqqR1S26xUtJOn1QSa/3esuZnd
	 R3ZoX6oGec9l2yVhZ4dJBPPm3/G9/OUqfH2sjsdvqkSHItDuKO50YRkDjZW4I0UNEcgGf
	 b60lRvyZ5GJPhYncqfThRJYVHkZgwEtFY7gv+zQMystNqohvPMcipgxFWv43q9W3ARKwK
	 54bbYbS2VNNHIRDbQ8NN5HvqY7mumLtNL2a8/G3Ujk/hQhQhDmDJJvq9nvsUiHWJIeSRO
	 6i1Lbf07sMF3glvp2S10uTkb/f2bq+vqyVZPgLVu08chuZHTROZKWnozF9KIY67xxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=b+THhez8;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE41606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE41606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=b+THhez8
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso2874812a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549900; x=1794154700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=btxl8RcoseK8+RxQlmhGi7ac+CReh6ErxdFhgHtvr9k=;
        b=b+THhez8P3xaI0eQ+L8zvr1yUA5XbD+LDIdM11hpNC+7vTvw5NURjkzuloGER8VJPu
         2ZYQCED107cLsnJQnOQfLp4ejpIcxnSktys1LV+JOmOhCbPD9al3DT+cd4zcectY7zru
         NCILVDh6sRUqQqNMT3Mi7KEc975yB0dDkCyRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549900; x=1794154700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btxl8RcoseK8+RxQlmhGi7ac+CReh6ErxdFhgHtvr9k=;
        b=QtVopLwpLFfeiFzQcqanI5JKhTnpke5sUhMOca97TdAKWA+xj29G0Fgft/K+UyL64g
         Ny71Guo0j9MYbYkEwsI03BR9I7CvHuiFiUXdlD8P4cAX2rK72L0z+t0n1MCt0tLaQTng
         DmisaSfyHHRhgefTcV3PlAOxE2YY8db3tkEn1PmLzVb6h8EN43NSomLz/OduZx5ezW2s
         AH9Sb5dPprUiG4UX3UaVR6mHE01T0PLNU0V1FzK3ytDCSTVnI0Mbpaa8Vartsz5P4hSI
         5bDMQklBSFqeoi+rgENELQxw/Fptn+u7XluHiJoj7AjKRA4Lp9y4TcSZltX8+Qlki9t7
         Z3GA==
X-Forwarded-Encrypted: i=1; AKwUvBx1tP4dZMQslvDqpkg4aKSW/rnlhxsgzopIyxG/o2YOaDueXVu3EkKSF7Nmt1g/kp0VnBESxURr5uvZ1kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eypSBQpkxlXROdaVtgCfYzb+q8b7lnnmSkLzTND57yCTFrdQO
	/qzoBUP/t3o0PRU9azOFZvYCsLc9Q0VPpmVBen6gzuGDHgIue8QaoopNZYLZ3E1gF+U=
X-Gm-Gg: AYBFou2BBsCO31v8ZRKeB8aXZlZ4TsMzWxhROK06qrGUpqWVk8aIcjmJO9ceUtg9WU1
	ewtUW01qxs9JLnoluWpqBE4eiQs32U2FLkMXVhvb7fm1pCJWYbrio8qGfyIq+2YJDvI+LlSpyh5
	4R+lOH7hKlKOyB7FHJwoH7b+68Il67l/JCOlzUQZawM309Xx5bxW8mXTEIxWGsx8KPGEHksP7W1
	FoAtcX4cNMdwrnsJr8nfuu7zUQgqJE2c2wEhaNQGWZfTGDWUO4dXUajnzlVMdj+6YbgZNpqcTU3
	gMjg+QleMX08HK+MQzdyJ8puOk0jFqYt9E5DOK6Dc00GNJ9NoQp0ONt+VsctF5N+/QOCoTRyvm9
	5FfG0ERxDDeffch7UC9NdTRaPsgQ7weu2ItxT3ewKjJmncQetCiWN9sfrpp3NNK0Ek0L892aw76
	ncLsF5hOUCLyyJNde7cyPKZrR+K+G4bklzAGGyFVU+f4AdVPNTHuGxNeOrClvYtvscae1khSBFX
	U3Nun8z++9cjX440xU0VJGjCh2+9cpXsYPaPUo9n2FNoLtBIaOLXu4JpbLMjT+sJLrDdWqS9HCk
	tZR/7DOAFMqlRL39fefvp5WRtT0T0cZfrRaA8/Xo/zaP2dPLBjvt907iti3N80HabrW3cXpuj+a
	E/2zXEndLQjmDqIJ9JUi35nrRldZnnQ==
X-Received: by 2002:aa7:c14b:0:b0:6ac:8dce:5a8a with SMTP id 4fb4d7f45d1cf-6b4d428edaemr3749678a12.9.1793549900318;
        Sun, 01 Nov 2026 08:18:20 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:19 -0800 (PST)
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
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v3 0/4] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
Date: Sun,  1 Nov 2026 17:18:10 +0100
Message-ID: <20261101161814.1325847-1-chris@miget.com>
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

Four patches on top of Mingyou Chen's v15 "Merge redmi-wmi into
bitland-mifs-wmi" [1] for the Xiaomi Book Pro 14 (TM2424).

Kento was right about the mode map in v2 [2]. The firmware passes
SystemPerMode to Intel DTT, and the DTT tables in its data vault name
each mode and set its PL1 per power source. v2 was measured on AC only,
where 0x03 looks like a 37 W mode, but on battery 0x03 is the firmware's
Turbo mode, so v2's balanced was the fastest mode on battery: 54 W
measured on BIOS 0A0A.

v3 maps low-power, balanced and performance to 0x02, 0x09 and 0x04, and
patch 3 lets performance use 0x03 on battery, re-applied when the power
source changes.

Kento, two differences from your map: low-power sets 0x02, which selects
the same DTT tables as 0x0a without the dimming, and
performance picks 0x03 by power source rather than reading back whether
0x04 stuck, so it does not depend on which BIOS refuses 0x04 on battery.

The Fn+K patch [3] is now patch 4, since it changes the quirks entry
from patch 1.

Changes since v2:
- New mode map from the firmware's DTT tables (Kento)
- Drop Mingyou's Reviewed-by from patch 1, as the map changed
- New patch 3: separate performance value on battery
- Fold in the Fn+K patch [3] as patch 4

[1] https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/
[2] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.com/
[3] https://lore.kernel.org/all/20261101144100.1043263-1-chris@miget.com/

Chris Taraszka (4):
  platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
  platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on
    profile errors
  platform/x86: bitland-mifs-wmi: Support a separate profile value on
    battery
  platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K

 drivers/platform/x86/bitland-mifs-wmi.c | 183 +++++++++++++++++++++---
 1 file changed, 163 insertions(+), 20 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 254b8455d8a7f56b730e842207d91bd6904a50ce
prerequisite-patch-id: 9708c81da6b4ed6c2d47eb927efcd64ce4ed2ecf
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
-- 
2.56.0

