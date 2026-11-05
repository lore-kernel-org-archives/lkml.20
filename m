Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912854;
	b=hXCrGMkJ1t6aJhQyjSYk8CXeZF6TwBOjh528ThPSRY1eANscA2pnz+jQej4swPd1JPq3
	 XWGfvwFIyuIF57f82epOhXE+DetW9avdTRblEGjQRxbrL7LXDwz2YpCOtq0YzC6R7km3m
	 sZ7nhd18Ubr1hqxEujk6B/yyUWhi9wkspBXE3BWpNppudaMjTVkJ5ZHeKjtn8C6wdkS0x
	 Z9MxK7BgeooT3lWtilnrk1hDnNX/IU/fblRo6iCmCjAHhlf0pQm6tKnvhhG2w1sB99jwK
	 WxFZyZMJp18xunCahiWz96fcDi8nUbn8yFu6yGQKtPl3z+18Zt/cOOV6g2sH2vo416g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
	b=FZr6ErgGRL0FhOe/avPwXd1PEh6+djf67hmzo0cTe/+cPbZXJg8JMmuZ0Oj84g/qP4Zd
	 s5jc1ZItbGuZx4RtO+RkA0saKxuIUuPs3bCg/jC9a6vO/8KGGeuAYJaC827GUTAu7CMy/
	 B6U6R9lrP9zX52wM3oHF9advxCw1UtD0/L5oyRuXjNFQGECVaQvUGiVj6prDOwUbWI0Qh
	 1Xm7g8nSAFwZfEynchtI38upKlc67kGIqdFXGtKDyJBAON0zrxY0CcdsVxpu2zyen5ro0
	 Xh0aI/mlDHSZQtXnmMo+mlQIVTHRc9quNlAak4J9zQib8p0WV8wVT/AuZMXvbdlBYlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxlwCrFY;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D1606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9D1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxlwCrFY
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2279714a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912852; x=1794517652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=QxlwCrFYTIvEOSIKqlQmOXncDSBqaebeZSdZVRlub4HCltugdpbc+UMQodD7xy/xOK
         7S9nFw45XlA8fprwN3Y23VdZJ5pawxNq+HaZL9CA+skmHYV0XPa1jPKcQZGJxjfP9JiZ
         4O/wNDG9imIGbZ98esJ2npOY/+o4riac5mLzPcoCZM/hJ4ri+XNp1NQ3DEh5YFXblU9V
         Y6+++8P/s4Jkm/af4CRfqQ4dmFQHPkI1sdW0/y8ktYs3nc11d+pXXT9yPY4fmV7POCXH
         DJdIzpkeIHKWNDUYleiIgh77HiPfvtuQEuLl+FEdlrTdL4bnxWkCDAmZ9I2CC9kf8OG0
         3AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912852; x=1794517652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Okla8wIM5uPZq9kH34R9YoLGSa3a8khkoUEmtFwe994=;
        b=OceR8jE0LrOIZOQcJFiaqHvs/p51c4qMcVCvzxg2p+q+Xcd74bl6SIBbVtfrjq9BjG
         H+Wq3o6v0Lg7rVB21oN5TsIhmXo/LmL9+yoyj+8n6QP7Uee/7X9Is7RNKsqTSMdT3G6j
         YDKVF5A9hXOca+6FHif16ySuiIt/ed1WqDqJSIFJTJmf+Zrw5O1qnGThNfXwjsYjoWBc
         tGq50rq82V9aaoNJQlVvvOypUCiM1I2efGWHjyDf6Vnkv3vHNCMp8s/e2lDVWAPrHcE0
         LmM+kqEcuNcJZljrbxB4O6mtOWJ23CBskqatn84MIrJC6n1itvIdeGJWlT1rQWQNQh9n
         /1WA==
X-Forwarded-Encrypted: i=1; AKwUvBw9uZ9pUsNGWKXLF5msjq6DZQgHCc+7nyKskcWzuo3PfnsAHybhVc/XaBbPhip1LNs1QaPKYI+A8v8NbYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kEh3BUgzl+5/drtcUsssvpL/zCakrbb8EvtsZsq1GQD61en/6
	MlhYmM6zee4RUOFDbTobhlw38OvpwTQOQHYwtz1GGg2dXzo3Tf1R/Um2
X-Gm-Gg: AYBFou1Rxl8pjzGgREdkeisunfv2Kg3vLwlrNFrZBtFN6+MIA+h2TEjao3fMGhod8KN
	OIFYKVgp+EEabHIcJeLfz6LyEZJB6uUbJZBjFppfH45FzxxFojsSNSGTC7yNPeTRmW/cMpa5zaf
	zV8NN66mYzy1c2pU0eXxNrF4yGwNCe0KNaM3VK4TnAGPeJzau9hDVQzg23DmT+CN8dzYfw10vKB
	rA3flUdlwPd+lXtowFD4E/DEvvdbf/JX+M1CAO/XOO+i5Hyo6HE6w1wb3/DIQDA0WnIN8tfl5SG
	5M65n6HLFRPnyULLUc3d8TKynelaF3EJuCbPq5ouOTp0a4g+rTkdiwfnM9p6yNyVOR4GjuVdfV0
	nj6xH4VfaG538YUoTeT4eEjah1sIPLTeTCle5S1f3zvgx+k1QPGjLBkZcIMJ+TUD+LanRwGJMBI
	Fp6C2HZSEhofj8zDQ8qRvhCV5zPUQoRFZOYkSmvL7YYBSOGD4yFsQYsK7PYEhYobJcFi3ri0iaJ
	4HCyteRZTRgnl5Lpo/rQ3LKSGYpGDulHTpbh7LPHw+PeVrTVxxsH37Uo8keEdXhXOoXrXWuH9JF
	OBOErxHHpoc5H1OL98KYuY7A8dyPqnOlBkVTAtrXQDC8RRqb2Q==
X-Received: by 2002:a05:6402:13c2:b0:6b4:c971:589d with SMTP id 4fb4d7f45d1cf-6b59780391cmr343744a12.13.1793912852256;
        Thu, 05 Nov 2026 13:07:32 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:31 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: mediatek: Add initial MT6895 and Xiaomi Poco X4 GT support
Date: Fri,  6 Nov 2026 00:05:58 +0300
Message-ID: <20261105210622.523747-1-asalde.le1@gmail.com>
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

This series adds initial support for the MediaTek MT6895 (Dimensity
8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redmi
Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
with a serial console.

Bootloader dependency
---------------------
This was tested with a modified LK bootloader that is not public.
The stock LK cannot boot this DT, as its Android fixups expect nodes
that are not present here.

The DT relies on the bootloader to:

 - update the /memory node
 - add all firmware carveouts to /reserved-memory
 - pass the command line from the boot image

The carveout addresses are therefore not listed in the DT, as the
bootloader allocates some of them dynamically. I can describe the
fixed ones in the DT if that is preferred.

Testing
-------
Tested on a Poco X4 GT with 8 GiB of RAM, using a minimal config and a
script in the initramfs. The results were:

 - All 8 CPUs come up and match the DT (A55 on 0-3, A78 on 4-7), and
   CPUs 1-7 can be taken offline and brought back through PSCI.
 - The redistributor is found for each CPU, and timer interrupts reach
   every CPU.
 - UART0 output works at 921600 baud, and its TX interrupt fires on the
   expected line.
 - About 7 GiB of RAM was written and verified with no errors, with the
   carveouts added by the bootloader.
 - The ramoops driver probes, and the console log survives a watchdog
   reset. The last 30 lines were clean in the final run.

UART1 is disabled and was not tested. Only a minimal config was tested
on the device, not defconfig.

dt_binding_check, dtbs_check report no issues. checkpatch reports only
the "does MAINTAINERS need updating?" warning for the new files,
which are already covered by the existing F: pattern.

Tool use
--------
The commit messages, this cover letter and the test script were
drafted with Claude Code (Claude Opus 5.5). I reviewed them
and tested the result on the device.

Based on next-20261102.

Alexander Letuchiy (5):
  dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
  dt-bindings: serial: mediatek,uart: Add compatible for MT6895
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
  arm64: dts: mediatek: Add MT6895 SoC
  arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../boot/dts/mediatek/mt6895-xiaomi-xaga.dts  |  46 +++++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi      | 166 ++++++++++++++++++
 6 files changed, 219 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895.dtsi

-- 
2.56.0

