Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4DD42BC39
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237417; cv=none; b=flXE1EkHVTxqv0VuHqetAScuAgZZvmyZWLeJJWjcwiyPqkNJQUVDaXvwuiqCM2VTvAIFmcv5+JX6S2hNgbIgTG+Z8oPV2rTtW9qcfUo5F6LV4mDnII3NqvLisNaapYcO+zayNQVEelfbdJOrcCd7CZMRMyMTITPlgCXQBzLTMeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237417; c=relaxed/simple;
	bh=EbRsjy+izD4FGJar3RutZAfTClGR/6Al7JWVZmKxHY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Eoy1kUGR0Y+6RgKmiPrsJ9vNpE0rndZpNjv805/YIxVjLsMoKnrWamjh99u3KliJ/yAZDuneVlbkMxwSh4YdU0bPMjgDFCKntN5ANgseCU8KMeGnjyJAf2AlHs+XdooX/EM0GZristKioomWcF2CUvHgvlPBVWpR77bXJDxuL98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=PU1A39I/; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PU1A39I/"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso1145988c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790237413; x=1790842213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qskrl8FoTONerp5XUUFpCXSU5ueWew9f+qB/NK4x0zg=;
        b=PU1A39I/y5QCXALh7dtUYG+hqtcIQVUh1cwPQ7NDHN6i2a9x760ZFHk6PPgAlNwHGq
         tJf0xiAT0WY6BXiH7Vile2qoTm+nJls3W14u1TOCDhTmT8zuzPOC3jW5aeXvBqqC48P7
         0ifXGPdd+nRqL3048VwjFhoeX1KUy0hzbSv3jVvsxua1q/g8FR+lkc5mFB8DpDp9hm3x
         bkBGWat0x0gQ6pi4+rLapgPLbpq2a8B0ZEs+1+lp/xxFcOPzQbGc+ZP+Al+9xZ48USuW
         oz11spp+sSxjxdOzRQe2x1MtPi60DBhctyQTREYMgK+LTbnL5QR1VGh9Gzr2XFs0zxLX
         8QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237413; x=1790842213;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qskrl8FoTONerp5XUUFpCXSU5ueWew9f+qB/NK4x0zg=;
        b=o6PHajq9WM7SstJ3Q23b3sOrzcNh53RCHO7PH5vuUpRtJwNKVMMzJH89WC+Gh58Iyi
         HRsg+zItd/jha3Sr3eCaG46jr6YbGaOPJtd5dPzqoJ7AEcfkAWaeaManMVDajPElOIPQ
         1MewEyUrUtt7A7I77HWaqXV6dpTuZN1ZEqo61sDAjMWZ12a4P6AXBsRVx83kbpX99c7i
         srONaGwJLEKntH3dwmOXoe3C/7fBiYfo36YXv5+9lzWnc9DMhciCfpNBDC1+4lKdueLN
         2Yipz5D/x3L0vy5KUOyQSIKupvTNvtxuFZEThgDJq1ZOfEtXPKb0ObHcr9wFHN/cg6Fg
         RlTg==
X-Forwarded-Encrypted: i=1; AKwUvByVeGwfdstaLPbUFVSR0ieWDIPmr37Qg1nSgjmRZUyI2Id+NVvOXy5G4ZYCRidmcv/nYkVwPKeknCYRGfg=@vger.kernel.org
X-Gm-Message-State: AFuF++m7UP/IwvrmRRAMLzr6hVJ495RZcDXHy99/o/jEIpU0001GZpeS
	Mpw06LA8IwkYrUVMfHdCduZY8VmZmmUS3V00hC6sulbmDYNgAFSY46OaA6IlREjDVN4=
X-Gm-Gg: AYBFou0VLgyxNGNBj9o3+tS/IjjLqlw8ut68fFHMuoBe8mDvsbl/981DSwsElsklRDb
	M2IVlc6VRwZybmPFQsmZ+lGD8e1aWoAMYC3FWovq0dtwOl4UCHWE/UUDBQ5AIrX++3Cb1wGKavU
	gnnAdZ9qkUMFY+fuH5yz6N785CGEKUHHC+B90hIamaub8Xd1oKpS5MHPfta16gEekxYhflZgw+Q
	OsLSzxUU5dEXcB+leCSxFgXOCY7NyJQAa4XWyRIJJfSBSgvArYpF1k3oBNAg5XlQpBG1mnqAnCd
	TzvY7HbL2zhluw7GVLk05YC142udfEBuaxU90CI61Y/6UnQLxae69iHFBY6IK4Q5V6F9IHZv8lw
	ORFqEkKJ2NOj546gtRk+DL+EDoFeYd50m2u3DNc4IJ1xvj6oMPa0x/cDrmEmLlliv0kBErMxw26
	R9H+A8zXICOTTk1EnAsx+PqBBh5gSVliLk8sm5fMeOuYF+5SN5qWCmyC4x2dybrRTYnSwjJNvmo
	sW8MY7e669cmUQfdbY=
X-Received: by 2002:a05:701b:42c5:20b0:143:298f:33b6 with SMTP id a92af1059eb24-14503fe4a39mr1479373c88.46.1790237413336;
        Thu, 24 Sep 2026 01:10:13 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9390183sm10838473c88.0.2026.09.24.01.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:10:12 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 24 Sep 2026 01:10:10 -0700
Subject: [PATCH] RISC-V: KVM: fix the Zicbo[m|z|p] block sizes in
 GET_ONE_REG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-kvm_fix_cbosize-v1-1-e57eec1b19cb@sifive.com>
X-B4-Tracking: v=1; b=H4sIAOLatGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3eyy3Pi0zIr45KT84syqVF3DpDSj5JQUIwuj5CQloK6ColSgNNj
 E6FgIv7g0KSs1uQRkjFJtLQCMNJxCcwAAAA==
X-Change-ID: 20260924-kvm_fix_cbosize-1bf2cdd282cb
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 Anup Patel <anup.patel@oss.qualcomm.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790237412; l=1573;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=EbRsjy+izD4FGJar3RutZAfTClGR/6Al7JWVZmKxHY4=;
 b=ktuwHwkl+sNKmTBsvPQ0ePdlIJCd1cN4B/8rlGZcLD78YaixmZ3+Sr9zf3M4Ve+OkLZfg1JZ5
 NDnGj8FH/u6AD44JXwxKm5xyMK8rr/ydh0aXz4LawdWbz5iOAe6oTgj
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

The kvm_riscv_vcpu_get_reg_config() should return the block size when
the host supports the corresponding extensions.

Fixes: 298276da73ca ("RISC-V: KVM: Zicbo[m|z|p] block sizes should be always present in ONE_REG")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 877ba823fc74..f2b125569449 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,13 +50,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		reg_val = (kvm_riscv_isa_check_host(ZICBOM)) ? 0 : riscv_cbom_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOM)) ? riscv_cbom_block_size : 0;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		reg_val = (kvm_riscv_isa_check_host(ZICBOZ)) ? 0 : riscv_cboz_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOZ)) ? riscv_cboz_block_size : 0;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		reg_val = (kvm_riscv_isa_check_host(ZICBOP)) ? 0 : riscv_cbop_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOP)) ? riscv_cbop_block_size : 0;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260924-kvm_fix_cbosize-1bf2cdd282cb

