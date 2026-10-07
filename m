Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A645C710
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363104; cv=none; b=s8GwjfnyiCrjFgSmdmdelcWBIYNPudX8wVjgXljE7ovvTKIyBbBRCbhV0bvJuiVWU/YoZGn+B1kdYskLR5hgVosd/gPvIMfaibNbZt7mznMpribBolJRoxfx3ETLGkzK9DkqE8d047MOpCmoP+mMDdarwTdaUEQtGhwi8n0ePUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363104; c=relaxed/simple;
	bh=DH0tJcbPsXOPYXRyuqzxn0kEpezPHDDjwZ70r+XMCJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLE279RhfJD/Ech2Tbk8Sl8DYH1t+xQkt7XgmeqOYAYG1hUgAbrE5Zv/KIZZKheMjc9KYogo4xrdnbhnVtglmY2wjvBWjgTxH+nGbPgxS2E6cGhSkiB32hYZR27WheHHRBskHKB20UtIQ6bTo/Wy7RZ9POfwvCmd+wYi2aNy48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=JtdDYRb1; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JtdDYRb1"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-34ceab2900eso2521492eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363091; x=1791967891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/sQhRikHvQy+tFDRD+cXFmdlH5Y2NFpBNiPzBCd5xQ=;
        b=JtdDYRb1JVLMIAkgPE/oc9J2jozGekIiMqXndzvX01Pg7rh10S8fAuRt184hr/Cuii
         SbPjS99J9KBqrHjECtgS6veP23ecW3jbh/cBRUr+olWnpY4D+7/XWH8j8vkYcskKAZkF
         vkxe2OxKa2hU2J8ug1fbdLMMj6cKXmnuZe6Vgvo7zdNEdAiNRaeEJK6oQCqUbPSmIco/
         zbgV6FOxYbVmthF+xGcgURjRvFaG/tWAFdct3bT/poOtqpNgQ4X+idifeOVRaaPV43Fq
         0gy32xy/4E8nQ4deoRCzHciz9R6Fqwf29pNKtnAUtz7oK9o+xFg9AbibZiHj4KdrMdoy
         bmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363091; x=1791967891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/sQhRikHvQy+tFDRD+cXFmdlH5Y2NFpBNiPzBCd5xQ=;
        b=whcpJuND3Je81LdYR7ID3GdEATbmb+kciTj1/q2c/aBIZ3kTuFe5gqdY7CuvJXOTQV
         4Vx7XLkPFXNCV27TLRgYOZxhrWuTG2NlXK3kYKlf9hLygHEVYm4oNtgYCf4Cm0nMW3dS
         gdVblzN0EqOaWzl4BT7Yq+u2XvD0YqGUPqn9pSvbznPsxfKSNa7pwHO3pwG7bq4/tu/+
         vNeXkNYCfbcWEJ1aN9+cTq+T+PS9I325GBzZLz2V3pe5YLh2q+AsVNsHPcM8IYoPk86t
         fHSiuh0EKU3GjRZToe8tYXU9IXaYlGg+V2fN4GDAssiI2L2CTlDG4EodoZwL66MF28+M
         XKTw==
X-Forwarded-Encrypted: i=1; AKwUvBxEWibhnRizRG110/GYoDGmKApciICbRD1Q0rJIN1/GnvtPVKWE0+gzHoftMhnKkCwAXMlcXj0aQBG10MQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lnSM69jTYzEDNz5k43suavAOevZP8dogqhlTZOLAeWh8Q0bKH4
	4SwlqVIF+MFpoJ+yilDll9FOOPzT+oM04JNvU6d1MC8/r6FoiTQFjLNGqA/q9WsbCnQ=
X-Gm-Gg: AYBFou3XnCMnxtzlT4kgbQbfDuQqAsigTthv+hqQ0h4//Vi0j32rM42iLLNkkICBuFy
	dQdn9WD2pgas+NOwXGmHPAAhniPSdGG2n1vZ7Iaw3bg0bdEKfH/Qv2Yb7d7ThTzabH7doH+lDX9
	rlWifKi3Ux6iRognCz63yr/DmGznVvavZ1xGOJc/KB/9NAqP6dUC7xVpFHrtn+33q9CWAOSAfH9
	JSt8g/p8aBd4RaqFebnQjK9l6ERHIweBRHDEzubMYZU2ocxn8sUiH74HAWjtvGBUdhGEl3YCBv9
	JLOnKOnOKuOljXgGjrp2gGLphz5ylLd9MCkTdqVN9pB2/G7RIyyoq+IHO/e0gZFFoZTO3RT6/I9
	u4GaZP+udZQSoumidEDc3AVlLnFm/u6e84lwfBis9kr1xT6dJeYwG+qN687hEYiqcFFKvHlGM+l
	D2i7zWBf+nrzjqt/3/541+Vel5A3kyXPGvwzprxGohMDEpQKY76wNBjexPfBTXVa7nhV/4tP2VL
	4tfuZx5xHIOdoC2ra3P
X-Received: by 2002:a05:701b:2719:b0:14e:8ae9:87c8 with SMTP id a92af1059eb24-161fe497e3cmr1456351c88.1.1791363091401;
        Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/3] RISC-V: KVM: Decouple vector prctl state from VM ISA
Date: Wed,  7 Oct 2026 01:51:18 -0700
Message-ID: <20261007085126.222688-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This was hooked up to KVM so a process that
could not use V in userspace also could not create a KVM VM with V in
the ISA.

Remove this connection as it does not really help with any compatibility
concerns. A VMM that does not understand V will not include it in the
virtual machine's ISA.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kvm/isa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 971f44655100a..447c778bf850e 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -9,7 +9,6 @@
 #include <linux/nospec.h>
 #include <linux/pgtable.h>
 #include <asm/kvm_isa.h>
-#include <asm/vector.h>
 
 #define KVM_ISA_EXT_ARR(ext)		\
 [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
@@ -159,8 +158,6 @@ bool kvm_riscv_isa_enable_allowed(unsigned long ext)
 		 * Guest OS can use Svadu only when host OS enable Svadu.
 		 */
 		return arch_has_hw_pte_young();
-	case KVM_RISCV_ISA_EXT_V:
-		return riscv_v_vstate_ctrl_user_allowed();
 	default:
 		break;
 	}
-- 
2.52.0

