Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910768;
	b=utM/cdnxPSHn8cBGzsMvx4KU6BAMLd9GOkZV+CouCnFIo4XiIiRl3aLeDkBcNuirfxni
	 ah2UAkCpdPBhPxnSyROXKIB31lQyLfDlP5vzBzBzwP0pHujMDcn3hAE6wLQOhRPfxhvh/
	 2oSdaOgf9BAMY4qp0jFJ67Rn1Mhc6YDPBOpDp8AnMSwMAmtuaNWCboyjX85hloh813/19
	 nrRNlg6VvZwY8ftaSb4lNPHKI/y+BF4715hyUfVvkFzVPmiR1AcRlAweWWIjRDsmSfEwU
	 BIeToh8VlZY7NDIZfEs4jE5lpHqr+fWoC5znSbQ9CNuUYtJu4RhsNo4kEO1KBASiDIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
	b=y3eKrgQTkFQdIMlYF04tS57qAD1Vfuylv7hKzBNXZtCUqNkTqR7Dne5FokIsDOnw/Qzv
	 V8iiLCnYlJUsaJO/FJUY+PRbyFmRgED95jnzegUQTKlPZGmgfnFa5eisYHJ84vubCTRyY
	 gwIumlix0cZzZaDrkdjYHnrWJudYKBWeFQgtqhiFzEE0MWowlb6HfXrUB8X2DS1amD4TD
	 wU2XBfsEBHFf6SVjRUjAm37aELQoN8ZkTeSRstB/lMGm88KS9YaFRue11racXtTVqurve
	 D0gXXgLwWnpUJ1CwkRWLe5+vCRog58ar2+GddPZOv3EWzIgKV2p8lko6DI0MVVyZPjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbfReCaR;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74E606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E74E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbfReCaR
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso3143504eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910767; x=1794515567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
        b=CbfReCaR2ox7msv4AJ+5IvKVxHvt7xkkGjz4AN3ksoA/F/C0jG0H8EY77tTpQ0g5CZ
         tUE2XHB0GSv1rHmE9fquea9vp6kx1iDMVBOEr5k5o4NOzNGI7kj+Au5QoHHcKDrSV17V
         U2HSz7rLAVl8PIhE+24Cf/bot01Ab0ciACiavrXgbWgNPXISvJauopLPbrNSgPUZYz3d
         MdaJJyhlYWGIiEAWLw+gQC3UvQr30N+DNF/SElDvrKxjcMGLYee98mgO7QgIwvY+rlFm
         T1TEt2W46CA0+ERiKrv74KKG/EH9hNyXnrh6kE9iZ9GGX9nfFndMWzX8wEQC8ylDgiFf
         diQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910767; x=1794515567;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
        b=CRo3SQ8yh1ywx+uzCf59/8QccY/r1UBVDzkYHh8JC6CY01BhIIDlbLzx8um/TsyCqO
         TJMlH1gD0DEDLDeQVlfM36JzYQjmNBTEHfIB6hl0s9IbSEfTMjyhRgk+/o3KiObWSy8E
         OEEgXzv0ZGFvVMg/BddEbxqkPJ4eJ0H/bAnZwC+4yd6Y4/6Jebo4Hc06j9F9XHr77vCe
         0Hhqv3W71j3b/Simy6RVSN9ardPLFriZ74espCE4/hzM95z/Nd2OcPDGivkU0fdl8Zfl
         ugzILbAa7mGpYiWFE3Gufp5CNxnpkj7v8pkHpR0HDpWsXL5iJfwM6MmPPheUEhI5AMk9
         8fBw==
X-Forwarded-Encrypted: i=1; AKwUvBwzD9MGHhaMJ0TS5ps88RTQZPDjdkoarslQlwy1JOrtRBmnv56QqYRNv9LWY0GCYpX0N1IVfmWLqBPmtxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zADJkZOLmO5upV6Mw2ad7dJ/fpMgaNulVgfuYmD59Zb2bwcFY
	EVLK16xW4WBedn+eNWTDIV0s/mTlkkFk+RN1s7+hi0lBfdfN9YJDpi36WMaYmA==
X-Gm-Gg: AYBFou2L3aFvXjXssfP4QLxLfjbSBQGtCVv1YrjFqLG7P/RbBVs02rtrUrlpMJR+SrO
	CmCVruNwOaQnxQ8pZ/o+s8WDt6vE6SWuCAkt5Ut28BOhYTISTYGfW/vwkpe3jel8kxr/X/te/PE
	gWUnq/pyBpIi4MTluFAxIpPFp0ULF+9AGHV/BS4+oDjkiMZdTpbFfHsPP6HFnjPp826ymbHXDqN
	ptnCXzbNCAxdILDf1yPLO/QzzQ8sgWyez77Sr/nd6eoFQnslx1zxXHK1BMZmkf5aK+uPFgsdaJR
	pTkfJIv+mrxMzptK9/4mbKLJSpIhNw7yB//VlNQKa0gCWLZWR1Z9zhsN3Q/ooqGum6n05qIVz86
	HXNlOr97vw78ygWeFwToSjAfejMia4iATC6eVSBDNDJSVdg+fWwouQVK21Jb8ZPs3yFCYZ/gO6m
	DOddqM0Xu3EgUBfM62iKSLW8gJdTN2FmuBMvne4b9jO4cTLv1MwOzX3/qsCEocTZRCxNwSNbRg/
	NqBWPUcgcrnZa4Mg0WiVdoTv4sHKj2H8pZPVCnRJlNE68wLo4rnRJ7KZECIY98XhUPqWm1Y5L7n
	pSIOX4Wv
X-Received: by 2002:a05:7301:4145:b0:36e:20ee:b297 with SMTP id 5a478bee46e88-36f752549f1mr304325eec.6.1793910767172;
        Thu, 05 Nov 2026 12:32:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu,  5 Nov 2026 12:32:39 -0800
Message-ID: <20261105203243.2292647-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Florian Fainelli (1):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add JZ4780 SMP support to the generic platform
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/Makefile            |   1 +
 arch/mips/generic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/generic/ingenic-smp.c       | 240 ++++++++++++++++++++++++++
 arch/mips/generic/ingenic-smp.h       |  20 +++
 arch/mips/generic/init.c              |   4 +
 arch/mips/ingenic/Kconfig             |   6 +
 arch/mips/kernel/idle.c               |  25 ++-
 drivers/clk/ingenic/jz4780-cgu.c      |   2 +-
 10 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/generic/ingenic-smp-entry.S
 create mode 100644 arch/mips/generic/ingenic-smp.c
 create mode 100644 arch/mips/generic/ingenic-smp.h

-- 
2.53.0

