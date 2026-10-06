Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6AD3EE1FE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282624; cv=none; b=nwbkRXWJJcrNnVLP0m2tkhCbPx+nDA/XswWKEcSrbpZS0zcjcf/70sRgijTrw1BTgnP9QjABwLTOK/JWG4cnIHgNHmrxTqDsrKku/SFa8VPZFDmRUiH64kV0RXX3I5RxshDfG2Leh9EG08Pq7H+ZR4krE6kAsG3nYiiCa0UoOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282624; c=relaxed/simple;
	bh=KE/VAfOA8574I5li9eEfgHcBUlxNUQrSaLDRnqQEUVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eNjstA0PVGmJRzTL23ZQMNVBSEs3C4IpQJ0B285gLcmIenCAT6MPQUhMidYI6DaflYpQL+cEwU8jXtHuPVSPCCkMAuz9VtTaiVFwYVv2qEIvItBPuykgptTh0yEkqDCtff5wtUrIKn8i93uXfzS2OK6b3Eau/Jy2L8HcNJ01bSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZfLOpSt; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZfLOpSt"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so626746eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282622; x=1791887422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bol8X0wJHH74pShfR9ELa5dHnrFIGHJN+N1Iz8VFSIU=;
        b=TZfLOpStJkQED5qFzJYyMO8XLvti+Zt+rfPrdWAZoNoOBn2HaY/qXN2tWELVl1izUR
         rpcGYwSsYh+bCi5BqrxAL4qEJFEHGCVOGkmBdBDwEfMsws7raYi24JemFWWnUgHW06ov
         wRlYcmaxsE2FeCgDPTaSIupY2s2TQYCrexgn93+gqsIzyQUD73+7c+CE1NlMVLGRLbh4
         DQSk12Lxg3YWM/V+HQen72Jjq8ubkxDX29ue0R7p3xG0Mh0f3+xSVnG3HlC/kl5s2T8M
         +0jslYZjhqaPa1Rzw386tOs9bzChaypyq0tTW/o3clxHKC/sqTi5v2sv+2gVblUoN8O9
         5Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282622; x=1791887422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bol8X0wJHH74pShfR9ELa5dHnrFIGHJN+N1Iz8VFSIU=;
        b=NnW/iU5v7S71lFx6wP5+9LGbAegMJIaGIa6EZwJ6lDknUGKc66k4nlwJlFM4l8Uhny
         wupxMSyNqWei+FbtB+f+RKn5Cm6ndDrmhD8PJtxYkU/gxA7TiQKDMkkJ7PeHFClN+iUA
         uM8krvaWNNKv7yWzjmIUOqs9EIE6SlGttNhhYl7omBxxwmo3yqAugAQm9G/dPGGa+rYi
         sQ5D8hR3wiphERU0fMTLphFyyxGGMFlwMzyBjMxqanhf1SaUmMHpA7gl5YSBvMd1heGX
         hDWClbUzObl70g2+sz5wxYg4LjdPa7CSX4ibvclfj+A9wXzaMk6EX6HOfVx+bop8D4IR
         E7Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwmTWiGebKPIywaUwHMOWQDWc3h7mHJ3Cl/b/6vCbMPnkcZJSQnVwI0D4trifqaWz1R+ZJ9TdPmSmdOKK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPDTqmiUM+cwkkwoQybgdUPNfJG8ZT+u7L3TZRH0wvsuwlFLxB
	EvZR842/eX6IzdU3gtND6vtZQFpMLEoZd+5IN9tKsCIGI3JAtwMr0U7R
X-Gm-Gg: AYBFou2KArious2jOxGSMvQ/4r5vYoev2yl7CLBZ63zZl1FQFovqnALfUGnbyx9wVzm
	9iGUSRwSG0ZvDhaKLl0vIG1y9C2MnvMPUrVu49OdJmZJQzoqPlvHhm0jRbmSF0DdM9tHjgQsc1t
	I2l9DfCRTz0XSuVpI4cLVHPCLO9DsY+BBavNUcW3/yVF+9cvbzj1vlrFaCoGdY7jIPzzJB/fH+H
	YKj+BoKSIfowojI4KD+c0VeDO+tQaxqefPjCieAMoA+Cq68ptLMf55x4ZHEcMl79+CTPvDRJ8Dj
	vfShgUh4spVC6vD77np94td4eI99C+vTjqKafJaqu92oDRzwrGQvJcug6Q9/YgiXuO465pCQXtq
	TULddlL1Nejfh5djhFo6U8LkfMvWOzBADVGF2n6jU+91z3V0KJ2x1+RtTp0Q8VRbjHmVsX0LBQ7
	GbzLRF7yRvTFiPS4JUN4LS8nlT8Yg05+JntMN7iJ8cZNbzrUnwMeoFK7VeQoiQ+vAUIl0PtCPmY
	CJqx9pQp4sOw+iz72krD+FOSGGZuCHB2WtZ1SjfRAw2sjD9rExbI7pOE/p5
X-Received: by 2002:a05:693c:88c8:10b0:34b:7c9c:9a71 with SMTP id 5a478bee46e88-3512e446222mr7496069eec.1.1791282621782;
        Tue, 06 Oct 2026 03:30:21 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm7443970eec.6.2026.10.06.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:30:20 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v7 7/8] KVM: selftests: Only warn for idle-page checks on powerpc pseries LPAR
Date: Tue,  6 Oct 2026 15:58:41 +0530
Message-Id: <0227000da4e6fe69b278dc971b74b3f65b73ead9.1791280439.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791280439.git.ritesh.list@gmail.com>
References: <cover.1791280439.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same nested TLB/access bit issue like x86. PowerPC nested KVM (pSeries
LPAR) can hide accessed/idle, since KVM (L1) doesn't explicitly flush
the TLB for access bit update, so L0 keeps translations cached. That
also means that the L2 accesses do not refault and L1 thinks that the
pages for L2 memory are still idle.

Use kvm_is_ppc_pseries_lpar() check to detect when running nested on
powerpc pseries LPAR and only warn on the idle-page count.

Reported-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm               |  1 +
 .../testing/selftests/kvm/access_tracking_perf_test.c  | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 4b7f6ab0ee54..692bbae44a65 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -257,6 +257,7 @@ TEST_GEN_PROGS_loongarch += set_memory_region_test
 TEST_GEN_PROGS_loongarch += steal_time
 
 TEST_GEN_PROGS_powerpc = $(TEST_GEN_PROGS_COMMON)
+TEST_GEN_PROGS_powerpc += access_tracking_perf_test
 
 SPLIT_TESTS += arch_timer
 SPLIT_TESTS += get-reg-list
diff --git a/tools/testing/selftests/kvm/access_tracking_perf_test.c b/tools/testing/selftests/kvm/access_tracking_perf_test.c
index 4415c94b2866..eb6939065e79 100644
--- a/tools/testing/selftests/kvm/access_tracking_perf_test.c
+++ b/tools/testing/selftests/kvm/access_tracking_perf_test.c
@@ -471,6 +471,16 @@ static int access_tracking_unreliable(void)
 		return 1;
 	}
 #endif
+	/*
+	 * PowerPC: Nested KVM (pSeries LPAR) can hide accessed/idle, since KVM
+	 * doesn't explicitely flush the TLB for access bit update. L0 keeps
+	 * translations cached so the guest won't see the idle bit cleared.
+	 */
+	if (kvm_is_ppc_pseries_lpar()) {
+		puts("Skipping idle page count sanity check, because the test is run nested");
+		return 1;
+	}
+
 	/*
 	 * When NUMA balancing is enabled, guest memory will be unmapped to get
 	 * NUMA faults, dropping the Accessed bits.
-- 
2.39.5

