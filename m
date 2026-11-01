Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.54.77.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793537532;
	b=4vQjJFRyIONAZrDBZqCn9XHm+ybOKOHY9pNALQ1G5PcL2KqCq99fDfXLSaFuzt1Yz+rC
	 jDLsISMznFPB9+BjBOzNqwo5/9OY043m7MwD4N4sXBpOM66v9uNTrlrVRJ8P0794zAQAi
	 /VjPrOEuII8RyvIxtlLxhJQuqxlzdkhIwhED0eeU6moh1MMw4eas9DrdIzrBr6WoFHLuV
	 EL7P/BLzZzuYwdEql2xyrWWzurDzhczTgHY2VUlxsk2RNbDPQ5xNo2CBI1gTMY+qFAvnW
	 ScxvTNk3GCFLzBYAIjpAtYkIyP8ncwXwQFSD3IR0W2Xa7fu94Lh1qkpRYYZS7UW5Q6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793537532;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Amp-Result:X-Amp-File-Uploaded:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=stI/el1CBpWwCJRTG5Yr04XGmaRKr84A3Tq3Gj7mwzQ=;
	b=gSgF+gCMNBaTp5RvgplOTXG15Lk0/ZmQNda8XClG3Nv83rX0HYiIcOXXC8TjoNGcziJs
	 dOPFvzSqIGV1O9p4JonWFLPk/sbPi5B0Sa1jmnG8Jz37e8Bei4wJfOOmGOgqWltzU1ftY
	 42P5CTa47UoMd/i9oimp5PeFF6PfXKXW7AbFTIlXLlhDRYhCzYWCenDJ5uAqmLN80SYkc
	 8ApHswf7ltNnkzJZ684rntN9WBHYRESKjy4ge4izrc4b6VEMKeCEjPNbOqs8BLzBFJ25t
	 WkijBQ5L1qJfOGahM1gnag1oa7xW5h893/dqRZvikDNwpsm4tlPV8DW0RB+E2fkWI1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	arc=none smtp.remote-ip=207.54.77.50
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48845606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48845606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793537530; x=1825073530;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=XcUFy86mcXwBkdVbQzI9DqvGN0xrj3EmlcdsiyF9xIA=;
  b=I1pkYVHhwMr5FDpLME7GGLsr46Kq5SzR89Cx7SRbABbNp8Z2S6MGQDR1
   GJn+d+ylAgb9h9m/RBCov72tq3QT9h+kFA0c+lZugmpS1c2Ch/m06+4L7
   Xcqab+APOdV7Dpt+tHBdY5oWLFtLN8bBZA13/5VUwb87QUzA5uHa70xXX
   dIl9aZ13SMjBrFpLgiFhYJgwLfnJ3EYQwtohdagJw0objuJ8NIJB5W5zS
   CUqejtlvL1HCN/CHx7uoySqRUuO2Nq2/eibrf89nBgAF3bfYNk8rwCmHg
   ndb9NjEyx83WcbpxMxLKwwxo61fNWDQYAt84FcvRCAVjcMxPrFvKiA4Ig
   w==;
X-CSE-ConnectionGUID: cW9n8rYGRcCgTwgJg8msHQ==
X-CSE-MsgGUID: QBEWlbg5QVqEzlJeM9FLAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 14:52:00 +0200
X-CSE-ConnectionGUID: NRXJzW0zTWqgjUI9udJRrw==
X-CSE-MsgGUID: CJJN556EQJmMSBLCCC7cOg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 01 Nov 2026 14:59:53 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 01 Nov 2026 14:51:59 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Sun, 01 Nov 2026 14:51:40 +0200
Subject: [PATCH v4 2/2] riscv: accept the atomic extensions this kernel was
 built with
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
In-Reply-To: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com, 
 torvalds@linux-foundation.org, olof@lixom.net, 
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0

riscv_early_of_processor_hartid() rejects a hart unless its
riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
hart even when the kernel was built to use only LR/SC.

Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
when it emits LR/SC. A normal build defines both toolchain macros and
still requires the full A extension. The legacy "riscv,isa" fallback
keeps its rv{32,64}ima check.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/cpu.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..5d1e39d16e59 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -82,12 +82,32 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
 		return -ENODEV;
 
 	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
-		pr_warn("CPU with hartid=%lu does not support ima", *hart);
+	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
+		pr_warn("CPU with hartid=%lu does not support im", *hart);
 		return -ENODEV;
 	}
-
+#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__riscv_zalrsc)
+#error "Need AMO or LR/SC atomics"
+#endif
+	/*
+	 * Require each atomic form this kernel emits. The single-letter
+	 * "a" extension satisfies either check. A Zalrsc-only build defines
+	 * __riscv_zalrsc and checks that extension only.
+	 */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
+	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
+	    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0) {
+		pr_warn("CPU with hartid=%lu does not support AMO atomics", *hart);
+		return -ENODEV;
+	}
+#endif
+#if defined(__riscv_atomic) || defined(__riscv_zalrsc)
+	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
+	    of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < 0) {
+		pr_warn("CPU with hartid=%lu does not support LR/SC atomics", *hart);
+		return -ENODEV;
+	}
+#endif
 	return 0;
 
 old_interface:

-- 
2.43.0

