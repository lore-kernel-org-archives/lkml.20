Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A931F99C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791945826; cv=none; b=cLWHWgOrnGpVMmJVdjz9UMUIb8XxXe8Uz7HXxCT+BLvxPUKMd078vyHljhoBH0kr1MBw6HO5R8bQN+SZd/kE/1ADqUG4Y+E1KVBwpPCNycUvKkX4imQvNF65DSIEdxUZWUx23fxZ/jD/Lhd1X6POFBpS2ERqCWAk3cgoaYBHzog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791945826; c=relaxed/simple;
	bh=EbWJXjbzLCreNhEpEEU9+ZYBf/El/DBW2b1LyD7YylY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iMM2C71EZ96yi+iV2ydpUMgFZZ/Jhp9EZrU9dFEAZ/ZjCqUExHd3TJ6d3tjx8HqADJcSBeF8o1RJLIxUHhX3vMwsyaaVsBolpbyDVk4AVxTfPNzGdzuBRYsqnPOfkaUsCLmIN4YMENjMkhm3FCJxuT1MeZ5ICAh02Ei+l9AX+30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=Ygf/M7hY; arc=none smtp.client-ip=207.54.90.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="Ygf/M7hY"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791945824; x=1823481824;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=EbWJXjbzLCreNhEpEEU9+ZYBf/El/DBW2b1LyD7YylY=;
  b=Ygf/M7hYg5WTCml1rfMd6XoFDyjsrs7S6tmW58X4r8J8y5eWCkvt4o0C
   EvwJeTOaz8prhuw2/zPLpcMJ5UO8PrS4EiS5jDgPBazmuJn2IsP4/nvAw
   EpNCoTFh5FFPWKi2VS4dXvBQ8GYTLjBLVWZm12eAMgYQr0xQk4SjVwx2m
   zjlHI1PIKS10MbicKhUCi1t1vvhiBrfhkqgyvKdcV0ZJvbiDi2l32RdVU
   Ae1uMH7AOuXWZMg7lEFVCLdeW5TaLMNGNvcLPEZc4HTP1M3WkWmYpZQPv
   PS+w7GssZDBFp8r9sAe+1Cffl128YBf52O3FhFiLa4otcVpfPmFaqS5MG
   g==;
X-CSE-ConnectionGUID: bcwPjTdQSQSKR4DYJ+ppMA==
X-CSE-MsgGUID: Iuu0Ph4IQrK3B/DhqrGx5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="258098850"
X-IronPort-AV: E=Sophos;i="6.27,156,1786978800"; 
   d="scan'208";a="258098850"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:43:37 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E3AABC020E9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:43:36 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 97694896E1C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:43:36 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5863820002BE;
	Wed, 14 Oct 2026 02:43:31 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Wed, 14 Oct 2026 11:43:23 +0900
Subject: [PATCH v2] arm64: rsi: Correct type of realm_config::hash_algo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
X-B4-Tracking: v=1; b=H4sIAErszmoC/5WOQQqDMBBFryJZd0oSNWBXvUeREuNoIq2RTJSKe
 PdGe4IuHzz++xsjDA6J3bKNBVwcOT8mkJeMGavHHsG1iZnkUvFKVmCMhqaAQA469wGryT71q/c
 Q1wkhYKMJAfNCmLbkreKcpakpYJLPzKP+Mc3NgCYe24dhHUUf1vPHIg7vz+QiQICqcmk6rrXi5
 b2bBxdpvhr/ZvW+7183M4B47AAAAA==
X-Change-ID: 20260929-cca-b4-rsi-fix-hash_algo-type-rebase-e341cd50d600
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Sami Mujawar <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>, 
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
 Kohei Enju <enju.kohei@fujitsu.com>
X-Mailer: b4 0.16.0

The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
realm_config::hash_algo is currently declared as unsigned long.

There are currently no upstream users of this field, so the mismatch
does not cause an observable issue today. However, a proposed series
adding support for Realm measurement registers uses this field and
exposes a bug caused by the incorrect type.

Change hash_algo to u8 to match the RMM specification while preserving
the size and layout of struct realm_config.

Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
Changes in v2:
- Drop the inner union and padding around hash_algo (Catalin)
- Link to v1: https://patch.msgid.link/20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com
---
 include/linux/arm-smccc-rsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..cca881ddfdba 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -128,7 +128,7 @@ struct realm_config {
 	union {
 		struct {
 			unsigned long ipa_bits; /* Width of IPA in bits */
-			unsigned long hash_algo; /* Hash algorithm */
+			u8 hash_algo; /* Hash algorithm */
 		};
 		u8 pad[0x200];
 	};

---
base-commit: de7b38167981bb92d8e4b2ad8ad9f151ce72a838
change-id: 20260929-cca-b4-rsi-fix-hash_algo-type-rebase-e341cd50d600

Best regards,
--  
Kohei Enju <enju.kohei@fujitsu.com>

