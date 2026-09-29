Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5B9511217
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.37.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681873; cv=none; b=Zm8KyUrmRyD77UNf3PP9klswIQ7ED9KxPBc9vPwo7vTVyCBhyjQHYNvUI5ni+T664LI4vIzSDVylTKcSMUKBC+5T/ZBQzhO2Wh7jr02Qe6iCPfMtZrxNLErHqtLYUDKwWkcSBFocqUt9vTRQPug5GkaUt05Zo0E3/pEmcht0CqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681873; c=relaxed/simple;
	bh=ATzPLgJoa/6F43m2ErAHXBxPfR4mktO/NFP6DJgxMxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m0Hntg3wjXnOkVkhDHErEiO20fhWlOuRgOMdPOgj9FYsdlcsklINnP4uVfCbABjLa8kesJrBX3E+1qJPA4TJQfAMhwGogJfo9sfn6hveZQ6A2VkEv8pUiMDz0SgXLoWf04Ev99QZQ90rd6gjqQBZO5RmmG6t7pwF+w/wLhyyGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=o4jAFH3U; arc=none smtp.client-ip=139.138.37.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="o4jAFH3U"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790681872; x=1822217872;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=ATzPLgJoa/6F43m2ErAHXBxPfR4mktO/NFP6DJgxMxk=;
  b=o4jAFH3Ux+R7lVvkcHGmCCcM+Dmw1LwJ5ILqWd7PDqVhLVhP2n6T1+94
   jA9qRPDbzCiF9lotA/HSz8/+ZCafsFsMwE/TkFiJ1u3Wmi/s6J2o/6NH5
   IUwgMi7eGoPBu8vaq2TCFPLayLj29OBPElcVlMRn11goXjeNyTy2H2Mdm
   FphA6ILEypJr8jq6tNSbQm7COauJ360kDWsuAR9ZDtOk0x9JwpqXIZAc0
   smBlrB9QQv7OOBWpd8Vq4THAa26GPEjbD4rqb6vn1DLOTXizbknTNTDFk
   iy7kVbvXTsMVXfCWEWzR2GsoUh5okMDkGtIG36m5e0DUNKMKvitz3tPNt
   A==;
X-CSE-ConnectionGUID: WtdVGq+qRZG8sAnJkJFsRA==
X-CSE-MsgGUID: /hKqEZyXQQWxrcymrFyixQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="234278441"
X-IronPort-AV: E=Sophos;i="6.27,130,1786978800"; 
   d="scan'208";a="234278441"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 20:36:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D5A5C33FF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:36:40 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 858FC1C00943
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:36:40 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A21861800D7F;
	Tue, 29 Sep 2026 11:36:36 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Tue, 29 Sep 2026 20:36:00 +0900
Subject: [PATCH] arm64: rsi: Correct type of realm_config::hash_algo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>
X-B4-Tracking: v=1; b=H4sIAJ+iu2oC/yXN0QrCMAyF4VcZuTbQ1TmYryIiaRvXiGwjmbIx9
 u5Wvfzg8J8NjFXY4FxtoPwWk3EoqA8VxExDzyipGLzzret8hzEShgbVBO+yYCbLN3r2I87rxKg
 cyBj52NQxnVxqnYOSmpTL+Hdzuf5tr/DgOH/bsO8f76d9c4gAAAA=
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
 include/linux/arm-smccc-rsi.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index fddb77986f70..2fb6ec5e0298 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -128,7 +128,10 @@ struct realm_config {
 	union {
 		struct {
 			unsigned long ipa_bits; /* Width of IPA in bits */
-			unsigned long hash_algo; /* Hash algorithm */
+			union {
+				u8 hash_algo; /* Hash algorithm */
+				u8 pad_hash_algo[8];
+			};
 		};
 		u8 pad[0x200];
 	};

---
base-commit: 6c360697fd4d17a53ed977a1341add3520a19269
change-id: 20260929-cca-b4-rsi-fix-hash_algo-type-rebase-e341cd50d600

Best regards,
--  
Kohei Enju <enju.kohei@fujitsu.com>

