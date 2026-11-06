Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987767;
	b=IdADjyG49VEJ7LUES//vLDaqbQkGc3L1ckUW32yeCKy6G6Dk4QZmMlInjofpDMVCW9kB
	 CrJaKD7kN76w6Jvf0i6rjPEo8uNFYG5W0Uk7qQGJ4B7RwtEn1BjPKG97ChfpOr61GVomZ
	 JISkrhrBYI80FCw/CfTJF+AiieW8kTW/dE+KGrg4SrYuA637oy2DnxOFhUPPkla7mEzE8
	 L3c3zwe22xiHzLLLeR9D+wMUPuTVXL5K5L5pkexHQkRO5KHcaT8culdTvM0knpF05CRV+
	 B49cuVvoFf+wXF7nvpMRSSIm3P8ur4cMH8OMO5N0M8tCBSl+25iqEbZIUVjFfNC8bbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
	b=rhkDPMETnkrcP/s7QuUdnTbYwqViQirCn17rpK/plGU38bmV6oyjcKh/LvJfHjp347pB
	 nw4tf+YU5fg20eNe4N5Pur8Ku+YHc/IwwzpqM8+k157U9ogqa177Wi0IFEfvGvFm4MBWD
	 TQHnyZLDGWcGnEKkJaXTLdGqKu43PQRMFsQb2BX08CRT1qFUhodzNy5PbfVnM4PReEdRx
	 DsxraBWdUqDlD0ebCP4ZUv+RZMXZ0hwRlHWq7rm7qtFTDhhdtbs6yo76ZMZBUnYyQNVnS
	 Ri6Wldino+N8wta+M56I9rAqpldYOiZRz+rLW4O7Ss0cvPAmEeWzX4B9cuNhyuztTZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+H0HZfu;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF189606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF189606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+H0HZfu
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8621565e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987765; x=1794592565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
        b=V+H0HZfuTjx0Yt+dhwl4yeTKKlDgXEr3C1GsMwtWgCCUZjAxIesAi7BUXLUNUSahqo
         ICrbdZax4dlin0+p4rGRpLRVfRDMJavHxfuDXVl5AvWk1HxXqAG54IC6BERDolBsf/1l
         gJkrXrEfAtsF+vfP0ivxMiNmYG2tcMCbFPOnLa6cPd1Q4pQRkQIkwmiBhUV8q1iTAMaZ
         zlJo7pppydqapsxWdkYw5O2qjSbYx8y4TMeer+qhSvxjARNf3fBLSrxymEBy/u2k6TD6
         uRuRsBu8sMSaBLbjHUTk4ft50a65InkQLoA0caroKnBb0A8igA0KcIjdJvcDDTAcjIYl
         wYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987765; x=1794592565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SbgHzD04jlGsEuRy1xPY6PzoC2hIAjh79EQrJ0tJMU=;
        b=jrkqZX2fZlzgQqZfI36HOI+9Eetr4q3p0XF+X36ENHcQV0ck5pMmWs4QCQq6FyXt6m
         8c1apdXWuM74DbtEaR0VCOSJs+fKu+8Zb8+6RrZu5UEYi/skdP07Z1dP/XyqDsdh9EUr
         M9H2fGKZggB5pCk+TiJ//0Oo/I4NIeLOtbzeXP9Lad9G/xAZXjPvevHScDOZPe3inw8U
         KH4ZG9JSyczj4wRrcwHozFbIeuds6fVjsDN8AC3WWCNdLG71gWp5eYZ/ykYV1qI3ncns
         pn5eXppNfhjlqmgnaMujKvz05F3AMzyeYeaZFUZ316S8jbufFFf8fdZOn8Lq4NTx3Y4p
         wb5A==
X-Forwarded-Encrypted: i=1; AKwUvBxhsnVOMlQ6NFOEuLr8SoQQXGJeOKnrGYkxPpcCzO9iHPwjsJ2aPeQsbDl8xLj2DbsIQeOGR4Q2cdZ7XM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0P26dDAiOvJxvyIxmrOPwBG1ioOWDfIGsyRWXlhZLW6gQwmLu
	6U7E1sP1BqkZJx/W/thOl5Vw6hg3sktmwOAgUyLouwF6fAItOh7kE5fr4j6hwsLE
X-Gm-Gg: AYBFou0rbRR44qaddsLjxYwdgLR4U5NUFUIqWTMMWM5+rXzYTrRswIWv6XvItHoNcDy
	NVH1mFYaOEiIMo9UijflLwC/DF1iPL7CVa+1xjQSQ9p9WzF9ndyKQvsj6vfW07FoRi1XXDcoz/E
	gD+DwpnboT9h+2np3X8VUPHAMUi/z8uLJSr3uaroX0S6v+CBjtI3dpanrO/D3ApCa7iNztRtG4Y
	MOdYOluDWgF1MENVjMiZtLLWg9HPQ18+Vab8Q+vce3EVPDDifKmopbdGYFmtOchdkStfF55sps2
	NOtuX+S38KDSzKKWKaFAsUh9DmpNphw8jT39P4q4QqJFEVpESxr92LQqyMfsWLK0Fq3+UP9fW1v
	YVN3jq7L4U/L+ByjaZhnBLCWhSCXHctpL/wL64/Mc1LFBSmXT/Pcu3N9J+saM66IP//gjwnMhE1
	YePKwsigKFqD5bFaFOz60c0XnhinljH4KFzeXdQvpYWkgqWdVdirMhQ04oagSqy/msbrx4bOCkv
	mQWwnCNz0yjnjVOgN+99/dJYwY8xIbrF7qYlhMZI/eHLSfq7XkRe8yWGSSuPNcJ4u3INi93j1ZD
	5B83yMCAfYlO6hV0eb6K0Xy763vvu3Se1JIdYGJ38wRwWnLR/p5p
X-Received: by 2002:a05:600c:4f4a:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4b6e017248dmr56108655e9.30.1793987764822;
        Fri, 06 Nov 2026 09:56:04 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:03 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 0/3] rtc: Add StarFive JH7110 RTC support
Date: Fri,  6 Nov 2026 17:55:57 +0000
Message-ID: <20261106175600.3877614-1-oo.hehir@gmail.com>
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

The JH7110 has an RTC in its always-on domain that mainline does not
support. This series adds a binding, a driver and the SoC DT node.

The driver is based on the StarFive vendor driver (rtc-starfive.c,
commit ebac2b5 in the StarFive 6.12 tree), reworked for mainline:
- hardware calibration and the default time set in probe are dropped
- wakeup uses the generic wake IRQ helpers instead of the irq_desc hack
- set_time waits for the counter to load the new time
- read_time re-reads if the time rolls over between TIME and DATE
- the offset rounds to the nearest step and follows the sysfs sign
  convention (positive = slower)
- the 32.768 kHz counter clock is described in the binding and enabled

Thanks to ziv.xu and Hal Feng at StarFive for the original driver.

Tested on a VisionFive 2 v1.3B with next-20261105 and v7.3.1: setting
and reading the time across the 2000-2099 range (out-of-range years
refused), leap day and century rollover, the alarm interrupt with
cancel, the offset, the rate over 60 s, and setting the system clock at
boot. Not tested: suspend wakeup, drift over hours, and keeping time
across a power-off, as the board has no RTC battery connector.

Known behaviour: the RTC loses about the length of a reboot across a
warm reboot; the counter appears to stop during reset. After the
StarFive vendor kernel the first boot found an invalid time. I would
appreciate an opinion on whether this is expected of the hardware or
something the driver should handle.

The binding lists the RTC maintainer, as no one at StarFive has taken
it on; I'm happy to change it if someone from StarFive wants to.

Owen O'Hehir (2):
  dt-bindings: rtc: Add StarFive JH7110 RTC
  riscv: dts: starfive: jh7110: Add the RTC node

ziv.xu (1):
  rtc: Add StarFive JH7110 RTC driver

 .../bindings/rtc/starfive,jh7110-rtc.yaml     |  85 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  14 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-jh7110.c                      | 324 ++++++++++++++++++
 5 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

