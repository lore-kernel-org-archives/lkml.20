Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C269B2F7EF5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172085; cv=none; b=EIJ02MwkycLsgAv7EulLPQs9B1sakUOh8Lb7MSqivezHLjCYBxYHeqxPe+ndCTIe8l5EaN1ZzrenDk/G9Hd7zVbCYJ4oUaZpYwuqI5WvWO+zmszQARfeiMdgOVRafZpg2nKWTX8CdvNoclyidUwwA7rK4oNBlz3AOEyhK+Ufsvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172085; c=relaxed/simple;
	bh=rqxsimaprYVjujnTGY969FMw+LFcgYA+LhchZVvIVEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kYL+1zvoG9nSHIPz8cyvGId+Wc2llutE/rFJG0NJmTb3Nca3nQzTuaQ8AQYzpAmKQrOnxv2CPH0He/kT0CaCYTIgl1n7kdP7msQ7LGVTGZhRv+cSgCh5WjiMfwyqrswVEhXW1/ml/qIuQr4+CWp8CMNp3fFexUgXLi3vWXDqEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7PG7soF; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7PG7soF"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-154e9d2d877so293285c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 20:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791172083; x=1791776883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLwPHwcyBpbEdHoUdZEu0832fJUKg87xyYGklLfVx8A=;
        b=B7PG7soFD3o324cjBr6uzuVqL5RKq5Af+xngs6Kcc2saOPElq09vl/qLw2zJAA5fvg
         5EHQmGiAxjqP0jZCD2ts0hEMLhvDbT2TBw7903l/HM6MT5jwqBy05Z55oH31d+xM8uam
         q8Dqvx9U6VGsGlwfP9UU+rARvicAoxAqaWXNFkY5P+/OEWTKsA6AT4Lzs4cm9Fp2O47W
         Vzeyx9jWdKzKeVzn2jVqUJo1TDPy/V7INt5Y+BqKXXjYnCEBx80fgD4BVNbTvB4JfeHa
         EjasiMmOtBvUKaqxsSEIZR29zBKm1pA2A/SZS4hY39LunmAk8iLsBizQhqNKH2Of1VT1
         cPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172083; x=1791776883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLwPHwcyBpbEdHoUdZEu0832fJUKg87xyYGklLfVx8A=;
        b=HKIQK3BAa5M6U8GYmvEeGqby4BOWuyQP3GiBuPtV9XFmUkk2DUMzffQp8tqOKE9WAS
         a18V0JGuFUSeoMkPdkaOnPBg9yGz5FYCMAmD8/afdZ05bwGgoorJ35+XR82tYEjS9wzZ
         nEw8dshjyndaxwMBMvoK6cH1/+/vNvwOYT2aCdPRp9tzKcGOg6pmX7AejUaHGrC/DtW1
         YeD79PliOVudjSGi4kJ7hGCAMJF550I99Tm/igB9dSxB/QvcF+8pMUUsd44K8FYEhNlc
         WZMQrkv0iiAq4QqbcgyAfkKcggKJMWH5wIQexgOYHqUFgiZ70v2yIhquLQZ+Y7DS+J5a
         prEw==
X-Forwarded-Encrypted: i=1; AKwUvByRce3C9q0CaIZQ9/P4WHFxTgSC2c/DHw/RwSqWuRe7PNxAU5IzqtK4oMVwm+KUew4hv+cA4zsVsb+CXs0=@vger.kernel.org
X-Gm-Message-State: AFuF++mdUmGOIhLz8LvCoM1ilDPbescFXg5mqDlT3po0lx4O/XtxYJdV
	2kW7if9sL8Gmn7buap7T0cfYo54wpst5xyiO+KzYjk3xW4LxOEWRm402
X-Gm-Gg: AYBFou3a9xlyUwyQfBkvd1RQ5MRMHTJZOEytOErS+TEfLmT2bWyaMxETJnQHdjEDc3P
	2eYkI8pNtv2e+cGRb8vRIRj+ZEFgHbJ5XC4q0VemZwLmFtmYOwHmH+IlY+qnp4PTF7Qb4AUrny+
	FCTOLG3AI4zRKMmDVgx0s8j+nES/NrT7EcN9TmLIGT+8pdNdc6GlCa7P91h2MYjP0E3xbdE1T8I
	vK8zvbuxbo8L2Ub9Kl7pu8+iujQyT0pR4QMkt4pk8sjHH4Ns34KjkhCWp+DxoOC+dCGhYQGj8Yd
	CDBi7eDSHjPptomeU8N227HpR3kjElrN+2gkC+lO4HGbDlEjVszrRNWd2qjpe2EC3wgJ06iOmtL
	8K3TYcPH9nqOwdzZBhEaOQsfHV5QH8LybI0uF38WDL6PKo30nJP0DPBWnmWfG4ENYKnhu8xPL75
	kCIuEz6pno2VilaaCnRDt8V8t0pnwRyPNo7QuswwgAv7L0W1AbG8JeXW2MTw4bRdN89WXX0K+P4
	hKVmu4g9AhMnPFnPfQ2JZGF9V7qDsA7pcUtPuiUV2R82lVAyoZc8FLWCt7SyA==
X-Received: by 2002:a05:701b:2803:b0:157:cbf6:8a1c with SMTP id a92af1059eb24-157cbf68f96mr2608778c88.33.1791172082536;
        Sun, 04 Oct 2026 20:48:02 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718a18esm10840958eec.17.2026.10.04.20.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:48:01 -0700 (PDT)
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
Subject: [PATCH v6 4/5] KVM: PPC: selftests: Skip idle-page check when running nested on pseries LPAR
Date: Mon,  5 Oct 2026 09:17:27 +0530
Message-Id: <4e9622b3c3329cd32c120175b06bd30a933b8375.1791014924.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791014923.git.ritesh.list@gmail.com>
References: <cover.1791014923.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same nested TLB/access bit issue like x86. Use the is_pseries_lpar()
check to detect when running nested kvm on pseries LPAR to only warn on
idle-page check.

Reported-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm              |  1 +
 .../testing/selftests/kvm/access_tracking_perf_test.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index a7ecd7a242a9..57d1bf994fe8 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -263,6 +263,7 @@ TEST_GEN_PROGS_powerpc += kvm_page_table_test
 TEST_GEN_PROGS_powerpc += set_memory_region_test
 TEST_GEN_PROGS_powerpc += memslot_modification_stress_test
 TEST_GEN_PROGS_powerpc += memslot_perf_test
+TEST_GEN_PROGS_powerpc += access_tracking_perf_test
 
 SPLIT_TESTS += arch_timer
 SPLIT_TESTS += get-reg-list
diff --git a/tools/testing/selftests/kvm/access_tracking_perf_test.c b/tools/testing/selftests/kvm/access_tracking_perf_test.c
index 4415c94b2866..94bfb82f7b79 100644
--- a/tools/testing/selftests/kvm/access_tracking_perf_test.c
+++ b/tools/testing/selftests/kvm/access_tracking_perf_test.c
@@ -470,6 +470,17 @@ static int access_tracking_unreliable(void)
 		puts("Skipping idle page count sanity check, because the test is run nested");
 		return 1;
 	}
+#endif
+#ifdef __powerpc64__
+	/*
+	 * Nested KVM (pSeries LPAR) can hide accessed/idle, since KVM doesn't
+	 * explicitely flush the TLB for access bit update. L0 keeps
+	 * translations cached so the guest won't see the idle bit cleared.
+	 */
+	if (is_pseries_lpar()) {
+		puts("Skipping idle page count sanity check, because the test is run nested");
+		return 1;
+	}
 #endif
 	/*
 	 * When NUMA balancing is enabled, guest memory will be unmapped to get
-- 
2.39.5

