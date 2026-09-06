Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565C3B3891
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666120; cv=none; b=CljjOWWS069iTIUITo4ILmVHijuWcPYMKJC8FZ2R8ZATb9m5zM46Flg8UPfJ/2KDpJ/A6jEVnxvJtuLLvcZjRnDcp+StXjBzyV41ARaOb+9kwMnnqM6q3S/d0vyDMavhdZPH/+Kp6flx0WeOeWd1kRRhFr5vmXPOt47IqW3+ijk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666120; c=relaxed/simple;
	bh=1eg7xfXvqB+X7Z1e0Md87PErbs70YQUknxBBKub28qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ebgnLQ+89kM4adlSYPZOY4Uardoj4yAOuSo7g2p7wt7EzMqcgPW7tXKsFS3U/WkTeGYNAHDrmAuEdgJCXW1DfiPNTcQbcTJDjGhIx0r05/SpOAb+zsC7iPx7DYu1NtMGesfmUKzKBzVT8cHoBP6DI+r1/hlkrW4gndh5qXvP7SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pByYC6fe; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pByYC6fe"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2837539a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788666119; x=1789270919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=pByYC6fe9rYpeI2BCqm4LqE10goXDHLY+ydc7kEOEirNfIz4QRZLjVE5YDCl+gk1eZ
         o0OZt4vrr8Kdu8hK4vAHYBgspbGR6C3hXsMgFs7iePUcn00VT7cNFB9woAeUG0xEepRI
         vUaEgG0Mwlzozs68zlniNNKq4GiFbCmWmLtAb7J8IGQ7YljNVqNN9FboAWDBbPCdcapB
         y1MFxESdV1EE5uaq+m7RphhLVqln367q/eqSEh8GWThEyhJbWmSblVy9FsgJ6uKjK/lx
         J3HPdkX8pHJEPyf/4UsgWZMyO0Kusubpdfgl6Db9igXRW0DTTaePHhnoZXTiUVoUo5/e
         ijjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788666119; x=1789270919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=JFs5AJ6ics3j8SFTa5Y0bkcm+ni2sBcyVdof9fpz6SX7mqt9A2R0O49q4hE/ahTqZD
         4UncY19wrBkDToEbfZyavtD3cUGxTnXuUCJEuL0FmzMU2ZFirqMl8wumpSS43N8Y9RUo
         NOgRopgwwxMA/+67pyuwj3G0cSUL2L15JzqmgECGKhqV4i90OJb+fY4vhovFAn+0WhQJ
         I/ev4/wsHEN8almYP0nLdVL6PYA29JJ13I/GOsVXDxjxMFrflgHyGVEQ5FtA74Xm448L
         SQsRb5tGmyEirphGN6xAI2J6UG1zvqSXwS6ALFZbeC+YjRZanXD+X3vK0FIuiyz3nclY
         An2A==
X-Forwarded-Encrypted: i=1; AKwUvBxQ1TIjqn7hkS3B9T7DhSF4BjEhPQKGqUfFNeVBGVDeTDzRWOV+sCa7MF8KBTaM18I884z2SnGWGfq4FWY=@vger.kernel.org
X-Gm-Message-State: AFuF++kbFs1bMUsU9GHMfhD1V2jUiL6eaG4aRU1bUwj3bbTkhnc7ktRU
	ung5Tg7L6/+Dz7NgLBZ+tMUapBoxYFmG2DwFDgPqk9PSJxYI1xPVs4Jd
X-Gm-Gg: AYBFou3WyQvqLwDtTKHr0QvlWhSYLOM6S6lRmb9+EaIRns2pgQ2TIwUp/3leqUjh1Ed
	h1RDNPF17X3jEXYwdhJuaoFi8ZHVxdLhR89VujGkKBPbZqej4sVfD8fErPAgktGhizVcTuWjMXA
	V01s4TBSH1bQTWUdaIiIeejh9OTVJirwirIbd7Agz6s9gIl6qHYAIqzedKKbmcyd3Le2JQHPXaj
	Hc1IeMs2BSnCDW2fuk6Vx90ptRG+nHs43Q7M2nMKYZS0jh1H5cRJSoQ5z6phhs9cEgw9gGoNzTB
	GuTSjdnfda89/FU4RHaEtfKKPJMDhymwzkEc4Ynkkc9yOuKduegwZmkLAW82kBFwirDMHGMVBMv
	ObKU/jxNYxlPrTTo5b0hT5qO+nypR0dcBlGKMkdGxDTyifCLbMEDHh8lpDVHlx8giMMNRxi/ka3
	nyqh9pK7vefCkcAMKHRXTidepBrLtg0UVjh/dOQ63ZaTCyGeJqCZgKnYZkLKefOLmCuj3y+drKR
	ur1GEyeRnAsTFWVB1HcRXW1JTfQSpd/gSfZqI7VBX6Y
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr22343140a91.12.1788666118495;
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.10.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm22761765a91.14.2026.09.05.20.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Gokul K <gokul02k@gmail.com>
Subject: [PATCH] KVM: selftests: Fix VM leak in early return
Date: Sun,  6 Sep 2026 03:41:43 +0000
Message-ID: <20260906034144.14059-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_mmio_ease() returns early and skips the call to kvm_vm_free() when
ID_AA64PFR1_EL1 is not available.

Use a goto so that the early return joins the common exit path.

Reported-by: Gokul K <gokul02k@gmail.com>
Link: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/
Fixes: a90aac553249 ("KVM: arm64: selftests: Test SEAs are taken to SError vector when EASE=1")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rock 5B (RK3588). ID_AA64PFR1_EL1.DF2 is not implemented,
so test_mmio_ease() takes the skip path exercised by this fix.
---
 tools/testing/selftests/kvm/arm64/external_aborts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index d8fe17a6cc59..7836756a38a6 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -339,7 +339,7 @@ static void test_mmio_ease(void)
 	pfr1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1));
 	if (!SYS_FIELD_GET(ID_AA64PFR1_EL1, DF2, pfr1)) {
 		pr_debug("Skipping %s\n", __func__);
-		return;
+		goto done;
 	}
 
 	/*
@@ -356,6 +356,7 @@ static void test_mmio_ease(void)
 
 	vcpu_inject_sea(vcpu);
 	vcpu_run_expect_done(vcpu);
+done:
 	kvm_vm_free(vm);
 }
 
-- 
2.47.3

