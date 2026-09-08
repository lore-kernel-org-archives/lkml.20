Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9F95427F4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872640; cv=none; b=M5/ZJAzG/DDt8yyCxQ4O5P2GoJnACUcAmcs63L4O4HBoUvM1eS+S89SMPrPUeIgA7HO9Ssb/p53YvHSvfzB1h8T5XX25OOZi2DdKC9qUkEnNsWoAO4Srxs8fr7hvpxIJdqCiq2Li+goYXwKiH5z0/ZUOwkIgdqs1thsxBd8gbac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872640; c=relaxed/simple;
	bh=G1xbX1aVzAnasMGtM4jScBWUpUusRlFiE4T+B4ny3Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W8YjWYD6G8aP9j38dSUqXKlS5F0HOHbeHemJQP3JNsnXRmqCKWBxfxeRkewIhd3RUPSiZ1O+Xmwgwhv/5qk7MXNkbEwcpAJjtxFNVkkE8RrQpBvNIiEgfdaQ3VitwxMOUwkVBsKtr4wqs1DgoyLgOix+RENK0kxSy64zlyPZMrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WaRpLafl; arc=none smtp.client-ip=95.215.58.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WaRpLafl"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G1xbX1aVzAnasMGtM4jScBWUpUusRlFiE4T+B4ny3Js=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788872629; v=1; x=1789477429;
 b=WaRpLaflgrJ0MSBjsJbTauykzAT2szHDUDgVLvHvz7cAd7GNbJ4lOFoYa5Ks4NQkgK731NBE
 nMREOCEE/ge0/OlI/unULWWfpc/WLowSn2ThMVQBK0yBK02fQKYtNjY2FMwJzfN/7m/EaoFZJe4
 MCyKIKHyS+hHWJ/w+8OAKIfM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c969d80fa3af1ccf;
	Tue, 08 Sep 2026 13:03:48 +0000
X-Mizu-Trace-ID: c969d80fa3af1ccf
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 08 Sep 2026 21:03:37 +0800
Subject: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAwAvyI5N7Duyrb2K6UHXaNNQS1JuxTEv
 xv1OAMzCygJk8K9WEAos/I8GZSXAtKrmQZC7ozBOx9d7W4orCljpvSdBRsdsec/+it1IUYf6lC
 BpR8h08f28TxZf+3bov0F67oBwDpXr3gAAAA=
X-Change-ID: 20260908-riscv-vector-asm-fix-27ed36623934
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Andy Chiu <andybnac@gmail.com>, Vincent Chen <vincent.chen@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=G1xbX1aVzAnasMGtM4jScBWUpUusRlFiE4T+B4ny3Js=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkL2Ne5fpC/OH3WxGUtT0vW20+ddT91/dXE5Ef5Anb5y
 odmWTM86ShlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjIvx6G/5l9Hh9nPS1Zyrf0
 0A2G9zzBr5+Lrw9WfCNwtWRtsswG2UhGhq6pc+vfBcmEsLhv3344tdliZZByU+/kzzvn/SkXWW7
 4mgMA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

The standard vector save/restore asm advances datap but declares it as
input-only. An inlined caller reusing the original pointer may therefore
use the advanced address instead.

Declare datap as read-write so the compiler can preserve the original
pointer when needed.

Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per-task Vector state")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/include/asm/vector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a772080..c7fd6d50a7a47 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -230,7 +230,7 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			"add		%1, %1, %0\n\t"
 			"vse8.v		v24, (%1)\n\t"
 			".option pop\n\t"
-			: "=&r" (vl) : "r" (datap) : "memory");
+			: "=&r" (vl), "+r" (datap) : : "memory");
 	}
 	riscv_v_disable();
 }
@@ -266,7 +266,7 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			"add		%1, %1, %0\n\t"
 			"vle8.v		v24, (%1)\n\t"
 			".option pop\n\t"
-			: "=&r" (vl) : "r" (datap) : "memory");
+			: "=&r" (vl), "+r" (datap) : : "memory");
 	}
 	__vstate_csr_restore(restore_from);
 	riscv_v_disable();

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260908-riscv-vector-asm-fix-27ed36623934

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

