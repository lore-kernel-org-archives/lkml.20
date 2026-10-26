Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.90.104.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006436;
	b=UwwEnbSo9KZhojxRmHQHTOPwuRcxcpfFo/sZ5Rylw+90MOv+B2p64bIoBEIhJnaU/mgZ
	 Ee6e/F6yKZc3GaCC2k/rkhtDG7X9qa/u8GBT7El6O+SpOBlw77rwJZGyHw7iz19ISaotr
	 nifLVMwALGc2JN5ulKWlsHeYTRC7g9XML54LDj/KLqsgrxvQmP9ciBUGn3lx7xKNZtk3F
	 Dt+QH3mKd5+pqvFShJHLM/eynak0M4+V4961MfC6jQR6cbPP+pegBwbHpqFMLQV+bWeHG
	 xGhYRuKH9J6PiVELK2X/WGQeCwQaMjv5Caz70U/WyNkC5IrXCHwLIub3FHLPB6axONQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006436;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Amp-Result:X-Amp-File-Uploaded:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=stI/el1CBpWwCJRTG5Yr04XGmaRKr84A3Tq3Gj7mwzQ=;
	b=ac4bdy6ZRisWA36jyHgQ7m5B2rBohFLaCj11ObgYU3d+jJw1wktPVJnnBLuXWV3Im34y
	 UsU0iQZuhC3g9u1PbOt3+FcMm1xN6Q7nKMcQYdW/t9Bri+gfriKs3ZysgwceXW6LHeC86
	 ZIPihB7r9ibw53wIt8cPPlHwY+bXElSRMmqzLn+ywt01UWkrFTiT0iB3HdRFHOr5OaJoz
	 JQ24EXNSLnNEGIw4q8VgkR/EiQzVKaG5HjApoF/9CUh84yrBSA/hE8XFKjKWm4WYP2ve+
	 EiEj7IEa1XsRqz2Les/E7OW7bSqkGtX1PgX+yhLsxazqzAS5PEWTp7f0Zg7/m+1VLEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	arc=none smtp.remote-ip=23.90.104.144
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com [23.90.104.144])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C9B606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C9B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793006440; x=1824542440;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=XcUFy86mcXwBkdVbQzI9DqvGN0xrj3EmlcdsiyF9xIA=;
  b=SYMEP2wGLMoNnBBgiIjEc3to1ou1Rkv1+WTAQtUBc3miGC7oBhZAsxaT
   hLpjHmavKfaWcQYrqCi+RxPQ5qrkEjzj++tYvBXTJc3YK6hJVskZPui4P
   e6iEKZzMlowfBJ694PLJFjL4fslZFxt19Toyk5WYzmPMqW7/g1GoN3UDl
   TV3yNtbOV2Nit9wgK2zpBAqiGJhsHlm+/6ogDFdQAdPuG9FFQ2a1Haw/l
   TY4JNMLL8uXB1Cq2dHzh1wWItSLDGZC0yoSf4+DwvMe6A1BM+tyhmXfgN
   cukJcCJ7IHFL5Y5GjEaaiRm+6LMaMJcUI6zSdDfXtUnRb8Vlk/NJleNPy
   A==;
X-CSE-ConnectionGUID: auR1k5XGSqCWNInnh1f+ng==
X-CSE-MsgGUID: TxPMjjjRSMel8uFU3YwpBQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:20:30 +0200
X-CSE-ConnectionGUID: gKvA0zqFSmmoyalL2Yt+MA==
X-CSE-MsgGUID: /ZycMpbtR/OWvQOwYg+9Gw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 26 Oct 2026 11:28:07 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 26 Oct 2026 11:20:23 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 26 Oct 2026 11:20:03 +0200
Subject: [PATCH v3 2/2] riscv: accept the atomic extensions this kernel was
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
Message-Id: <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
In-Reply-To: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
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

