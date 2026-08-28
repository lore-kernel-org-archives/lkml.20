Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996C3F326D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910604; cv=none; b=TvVU+dJ/21soABkUesfTO/982Dm2i+KoANZ7x6zUA/Y1++lI2ZBY83YpyeyU/EoseFFhYFEuImQZX2r62GP2lw2by4utIzpbKRFoQ6ougYXN5iFbrquLFHxYZWbPd7nLPdwpVtF7SyKEi1SWLalSAH22YLCPgqqlcR8uArP8foU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910604; c=relaxed/simple;
	bh=7qPUDI6FmCUeaOHJjOzTvxSJgNUso5rGsUAh6pdNtvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GtHakMx81rDxgMUiSHZEPXOEKeODwkP5vGEQJmThBCrAyuQZVikp5Klqk54VeUxkh8dAbxjxOHqwvpzg9VUjThgLNksuDEKZhZsBwLvWjsLRwWz1gR11nPBBQEjU486CSgTI7c4LT3FbDJC7OuYojlf4oyz8yyvr6or4NQoiB7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=gW6m46Fe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="gW6m46Fe"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so5705025ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1787910588; x=1788515388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKk+6KhjtlpyHrBbt0MDu8KMzxulCaoETO1fRLHo+Zc=;
        b=gW6m46FeUlKZsouQhW5lTl7/k5311UaDrphr87IJXdt3HSJltMQ6JGkZuZWmeIWsBU
         oHCW2c6qkXATIGW4UWqucsTbcgwmhexGuRt7vmL01QHYF/olSXgaCwlxTnTQZi5wAkUA
         mJmA1Ldaif/u1oZ65QYA/v/ZR09bYw+rxQ2vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910588; x=1788515388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKk+6KhjtlpyHrBbt0MDu8KMzxulCaoETO1fRLHo+Zc=;
        b=Rlxsko62BWGJACXbOHEdXfK2D/WlNFRbrP8uCYQa88yuVCfLNc9Z5DKtttJatAgIzf
         b+u7vUOEFz/yWC85R/Rxw/NRzBntas7qJW8AC+Udhs10IqkLB1pWRj4oiAd/x25Fnr8Q
         mAl1+Ykk6ZMV+hDSYpP0jACti2D/dtf9hJFXK6OArs2GBYlHWv/532QrF7uhjwb/59Lk
         FuicFddCiPl7BOkSdxZxxmlPZiW9wDtarpfsGut4SIaumCzmCCf7woACPyT4mE/H3UIx
         HZMy/e0RVaU427DQ/H5xrmJfc/vkXxhWR5FuG+Dk3IvgzmX0eSO12mznW32L9Dp1T1Ij
         8Srg==
X-Gm-Message-State: AFuF++nhejiAryDONfU17sxlmDVWDPRItRsFgHZz+ntmN3cBPoRRLRVc
	ygd19bW8D5dpicXDJ547xoGcB2KuBzTu2aQ5Bu2BScH5CSZB37DvkcswMd4YVcAxmnlAXBD5E4M
	oj3QW
X-Gm-Gg: AR+sD128FbzEe9J2wVUHpko+D1a+UtQH95i2TBNCwhgBVct9/bimrk2FBCD+BRGTC/h
	QJ2nK5NQ+aEvn8Bnjy7NfbAfKVl1GaCuUTBnE92XN0dCOIHmwUbv3jyM87Jp1eYcJLrwNqwOvwB
	3grWwfC1HVlHQmlfQDB+5V9kblPIQGV/2FAfHGj/iWNl1DnVGRKOrNB1pB/epRIf6LOUn4X/x44
	AFXhfKEdPC7QLjo8ApDU9svEDyu0NvU/tiWdaci0CkzCTrO3qbQGLNlHgkIkvkq+DDowRGrPZoU
	WNEErq7pgHfWJhhIdPV8ReiPOukCXaNng+hOqAqbZbWY0JExpRob9Va+H2FtoNcXcVMqc930dXK
	xm1F2CIEWDvddhNaAe8qq0EIryMuCqJ36/U3T3imAwKZw8XhRs0zTq5ud7QgTeYq7HebXm8TJdb
	quEalxhyAkoM6K9vL4KbIpj9gJAsMEads6h/wGM4ZC2Pbo2NWfSKa/krnVARnQ
X-Received: by 2002:a17:903:4b08:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d74dc51c7cmr120792245ad.5.1787910588476;
        Fri, 28 Aug 2026 02:49:48 -0700 (PDT)
Received: from shiro ([2400:4162:2428:2ffe:2418:f47b:8c1b:c157])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm3821965ad.37.2026.08.28.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:49:47 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: apollo: Fix interrupt setup
Date: Fri, 28 Aug 2026 18:49:40 +0900
Message-ID: <20260828094940.3882602-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user interrupt vector needs to be installed before the interrupts
are unmasked otherwise the timer tick isn't handled and boot up gets
stuck in calibrate_delay().

Assisted-by: Claude:claude-fable-5 # Wrote Apollo DN3000 emulator using QEMU
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

Backstory: I have Claude creating a version of QEMU that can emulate
every supported m68k machine. Its still working on getting Domain/OS
booting but it found that Linux locked up on boot and I used gdb to
find the cause.

 arch/m68k/apollo/dn_ints.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/m68k/apollo/dn_ints.c b/arch/m68k/apollo/dn_ints.c
index ba96a92f8f18..89bfb5aaad9d 100644
--- a/arch/m68k/apollo/dn_ints.c
+++ b/arch/m68k/apollo/dn_ints.c
@@ -2,6 +2,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+#include <asm/irq.h>
 #include <asm/traps.h>
 #include <asm/apollohw.h>
 
@@ -11,10 +12,13 @@ static unsigned int apollo_irq_startup(struct irq_data *data)
 {
 	unsigned int irq = data->irq;
 
+	m68k_irq_startup(data);
+
 	if (irq < 8)
 		*(volatile unsigned char *)(pica+1) &= ~(1 << irq);
 	else
 		*(volatile unsigned char *)(picb+1) &= ~(1 << (irq - 8));
+
 	return 0;
 }
 
@@ -26,6 +30,8 @@ static void apollo_irq_shutdown(struct irq_data *data)
 		*(volatile unsigned char *)(pica+1) |= (1 << irq);
 	else
 		*(volatile unsigned char *)(picb+1) |= (1 << (irq - 8));
+
+	m68k_irq_shutdown(data);
 }
 
 static void apollo_irq_eoi(struct irq_data *data)
-- 
2.53.0

