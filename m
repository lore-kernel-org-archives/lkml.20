Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CEB1D7E5C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930595; cv=none; b=MVmao0zqHU2kuQBZq4HMQNiADhkjgCxesDbBs9j1tx6YaWa4gHFLq7mlhoAF+7bRh8ZRZzoKeAjE+h0RPA+f8gLm/1M+X6VhyZVrAFzL64BWJAbio4SkkshXPf7VhZ/NA+YtiET5XVFKNsv2/usNYOR1mMurHjwsoG1UgmQAf/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930595; c=relaxed/simple;
	bh=hlUvE91ZFR2WALzkmchAgQjKrNo/AzcUBRa3ZaQdio0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ur1PRrM83hRWtDkPRlEpQqcCbo5/wpkUfIoGXrHolhQH5SoUx3YmJj66uy86LdPG3BJ/XvRaPb5XpGyJgA7RuI/h2cAJK+s1Wy8igMXD46K/HkQVlXy3m0yFUf++bPyTRyWhaoc3HBNAmpQuHZ7FewerfN/zKcISO7zl27j6TEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=lCIZBBt1; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="lCIZBBt1"
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BA61E3F618
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788930590;
	bh=j9TdbRSgBViFUc24m7gofNTrR9YA9kT863lpgmDnSEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=lCIZBBt19kyVpWL+RKC06s8Sp9xRo4MM8pNH4NVyzcZ874xH/O7lGRgDmbK1r341G
	 Wrt5+AcKQsbJ4Esswnqq/iW7KyVARy1QCnPKtBF8wa86K+nDRcKZQNO9ZxlcoXlxae
	 YOmvXoKxlzS/gyovvtodH0ckAuOJ53h7j0PNq6KT/jaPwtnUKmkyXSaCrQ3x8G40o9
	 lCPLFriOWN4PctaSeZGpnqUtCbqtDhmo+ZaYneRUiteIsVSuWUd53b54EfX1DE5pZE
	 5jW1Hnm4rVRdl1yvCVbLjYLb0ZxtG3ZhjE8EF1TBk+NdLKuMxT1Qe+Dy1ANvoqQ0at
	 pdcdQfjoKM8cXbZ4mmrGsmojlAIzJLhjLUwYAIrbbwMujkiAFwTTTlv00vNcSQxWsB
	 dDkmLz5EB7GLAgTrrxGWZHilfTYB5J3Yye39/WQhfFzwjgQkOwgspRdJMMxmlWaWho
	 DSeYzzEPjbAD04kGy8IZ9WRc88ADJuYDyyo6mekSFxzBXIVhQUtnLkdraK9tok4l6J
	 GFw7wY1TIL3o4Z7lL8be67j6zHfIu1w749b54GnQS0CtAaRu+K9+xpQ4j1+udfagcN
	 JBYGcSaJYo3U0crr556kvBqX9bXYyZGGgz3zSYQDgOZBnlyhQINNVjIBiZFV06uY1/
	 mFuLvkol+GYlRgo0mZ1Q7Amg=
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso5724920a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930589; x=1789535389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9TdbRSgBViFUc24m7gofNTrR9YA9kT863lpgmDnSEw=;
        b=DEmHBEoC5LnliHKeMjKW/tPm0PAuZhj6fM2y1he9fXmVbgvsLH9qQUX9zU81oKeEaE
         Gn+trkQBZcWxl/z+04A+o2VYGDPap6ukMk7OjxFJxUaHEmDeJ6VA5+XeCcqfBst+RRoN
         ECHOsWTs4yFu0lSzNikjsNIFzSfqCw8owuz2K11ViqQo9nWwR5C7lHvZMS37j12xHLVU
         kN7RfytdlOqfcTHTzl8t8o9hBkQNGs7QIIvjJgJ46KxTkemyDMdyJY/noJOySiXit4tH
         pnIC6Jx8tSHJ+T1WI4AZJGzjIvbY+WhCu7geffwUt9M0ygjpjxPBhV44e4TJUzcpXNLS
         5Djw==
X-Forwarded-Encrypted: i=1; AKwUvBz3b7lJl55A5Y426JP3C9shxIfP6t8dUqY1MN54LKtSnV1+aTBRa1gQIF4k5MYxF+SeVDEzC++kxZkOPug=@vger.kernel.org
X-Gm-Message-State: AFuF++lcOkEuNzOHVKBTMfLroBnKSoF9R9Zfx8rbnb2J5KLgTImr5bPh
	cGN1oPW6gKsCT5MLL0flSYwQZmo8JHhoBAf6rwNa8chjnJtAivXqcQYmIhsWNB0B9p4ovWuCkUJ
	rJW1FOUpgN+WD8xo/rkgbu2v3ccIscoa8Rg0xBProWJ3KyJlge+AVNOVaNRPzqr8ZsYv8IL+VOz
	kr2Tz2nA==
X-Gm-Gg: AYBFou1+fRNhMtAlUD/rdfGXNEgNf6A8c8yG2cQ+aEPyoed3b4+1bzXIhUT3L368Z6L
	Jb1vJKtfc5fUay9v9jtm7OBNnC+QxDvDl/FS5HyhC6h4uUxqBxx206QeIOxzPX3Px5rZZmHTlvk
	CqJYYTaCVOtv1IiFsKUxcEXcu6vX1nRylAbQxBKeS0EeeePQs+G+kdUlKhE7sZ106p/lAV0KxIL
	mAv998XXcHLUkSRz5pRlzLB/UV1aJopb3IMSIJYb+gdA3a4UqY4O4W7Xq7WI+7o//6zT6egh9sd
	ZLvV6/La8TFQBvnO0G6eNitjqmIqOlvueqWHSAjAHJFv5LHLPNFuJyElghWUHvZi33mAls421//
	K7FfS+boq6A==
X-Received: by 2002:a17:90b:2709:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39b086533admr46734621a91.21.1788930589120;
        Tue, 08 Sep 2026 22:09:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39b086533admr46734580a91.21.1788930588662;
        Tue, 08 Sep 2026 22:09:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:67c:1560:8007::aac:c1a2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm19069102c88.9.2026.09.08.22.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:09:48 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: maddy@linux.ibm.com,
	shuah@kernel.org
Cc: sshegde@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] selftests/powerpc: Fix exec_prot test failure on Hash MMU
Date: Wed,  9 Sep 2026 13:09:19 +0800
Message-ID: <20260909050919.3344699-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hash MMU maps execute-only pages as readable at the PTE level, so reading
from a PROT_EXEC-only mapping does not fault there. The exec_prot test
currently treats that as a failure, while the rest of the permission
checks are still valid.

Use the existing using_hash_mmu() helper and skip only the read-on-
execute-only subtest on Hash MMU. Keep the rest of the test unchanged so
the fix stays local to the unsupported execute-only-read expectation.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 .../testing/selftests/powerpc/mm/exec_prot.c  | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
index db75b2225de1..bd44f49d8449 100644
--- a/tools/testing/selftests/powerpc/mm/exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
@@ -108,11 +108,14 @@ static int check_exec_fault(int rights)
 static int test(void)
 {
 	struct sigaction segv_act, trap_act;
+	bool hash_mmu;
 	int i;
 
 	/* Skip the test if the CPU doesn't support Radix */
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
 
+	FAIL_IF(using_hash_mmu(&hash_mmu));
+
 	/* Check if pkeys are supported */
 	pkeys_supported = pkeys_unsupported() == 0;
 
@@ -167,13 +170,17 @@ static int test(void)
 	 * Read an instruction word from the address when the page
 	 * is execute only. This should generate an access fault.
 	 */
-	fault_code = -1;
-	remaining_faults = 1;
-	printf("Testing read on --x, should fault...");
-	FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
-	i = *fault_addr;
-	FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
-	printf("ok!\n");
+	if (!hash_mmu) {
+		fault_code = -1;
+		remaining_faults = 1;
+		printf("Testing read on --x, should fault...");
+		FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
+		i = *fault_addr;
+		FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
+		printf("ok!\n");
+	} else {
+		printf("Testing read on --x, skipped on Hash MMU\n");
+	}
 
 	/*
 	 * Write an instruction word to the address when the page
-- 
2.43.0

