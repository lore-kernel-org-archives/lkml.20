Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188888;
	b=qVJTr7Lff1Se3N6Vlz4uTh0TqT95rHQuXV/dTHkxJ3rDlNJGFglZxkGkIRYj2EiEJ2Xx
	 Fjha8PoQ/kBugDtvntn+vyJIgBMqnB8x9xmq5DlcGudwgNL3pWevQPUnTaTS9II2c4lqo
	 F684spTG+6QkzPU2jBq0YGUTTMt2YT3VSGQ7QYxSPRnjPOT3vVJw9W4YtoeS/yUjZhN+R
	 0l9FwSBxsNifWjI9HJQpmN9R4ASJkpquRVfFrFb2VFuFz9OB2oTghg9K4aL90Y2Fu2VBk
	 nnhmVx5ExNXuzby28BuMZ73XbvlymJqNaxmToVDeWhdbIPt+7zU7ncGIP3XxBIAkFdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188888;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3FMP9N5qxp2Dx+DZWbFS4IIf2RBtBdVEHLLPzTwmg4w=;
	b=zp5Ai4WjKTQRExAWgPIwNaDJRkv3OjcCStXnML49v/FVc4Y8pq/XvEL3Fxe8vZiFPmRB
	 i0NB02EZKVY0BJ+arbmqTnlXWu79v6TgaMCnVY87u7s69AgHPA6uVusEZFc/17g5T5Qnw
	 upV1ic5GBNNiuuoVtYt7PER5ARkmiXkhz0Uyd9IEJ1zs4T2uw7SP8BcuOt0JlzDqVZuMV
	 m3QorbOUTK56Hyun7RpKn4zky/Sn4Qb/ETbdanM64T+K3m0AAlWhbysy5496NfXtBG8Jf
	 zm1GpEEcbNUeg0RAkxRR28mitWES5KPvcr1Gcp1LdCyzzyTW9XclCTkXrys+dy239zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFBprhih;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB460A261A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFBprhih
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0681F031E3;
	Wed, 28 Oct 2026 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188887;
	bh=3FMP9N5qxp2Dx+DZWbFS4IIf2RBtBdVEHLLPzTwmg4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WFBprhihVMmJrS+RFx2Xj9jfyV4lf1NZdzhQsMKTKml/va0xd/+Jzgd2GytCTSKEk
	 BgghE+UUD/HaUDZYHjv0o44MU66cGDHZM9zIB2rBnYHtu83UWt1BHs4Loh6SjAVanX
	 jBAepXAzI4JjC5h8bseEcQ8jPvdkr2YdnM7UCF/OzEYN2dMGCNBXiTFhsq9QoE0X+f
	 qaQ/3vk289GnlGDXconKSrfw8kIQrcLJYCYP1+itHlyUEixPKvGvIl6w3xgXvWA5Xr
	 8K/6zuVU1/h+6W0Ak6bmzricNeqUgalMDZ3cj4PuV9f19L/Y/6m4B3+U4deeDvnle4
	 1DOWgqurfi9ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chuck Wolber <chuck@wolber.net>,
	Frantisek Hrbata <fhrbata@redhat.com>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [RFC PATCH 17/20] gcov: fix gcov_info_add() merge semantics for IOR counters
Date: Wed, 28 Oct 2026 07:59:41 -0400
Message-ID: <20261028120034.871983-18-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcov_info_add() unconditionally uses += to merge all counter types.
This is wrong for counters that use IOR merge semantics (bitwise OR),
such as GCOV_COUNTER_IOR and GCC 14's GCOV_COUNTER_CONDS (MC/DC
condition coverage). These counters store bitsets that must be merged
with |=, not accumulated with +=.

Detect IOR merge semantics by comparing the merge function pointer
against __gcov_merge_ior, matching how GCC's own libgcov identifies
merge semantics. This fixes the pre-existing bug for GCOV_COUNTER_IOR
and also enables correct merging for MC/DC condition coverage data.

Fixes: 5f41ea0386a5 ("gcov: add support for gcc 4.7 gcov format")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/coverage/gcov/gcc_4_7.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/kernel/coverage/gcov/gcc_4_7.c b/kernel/coverage/gcov/gcc_4_7.c
index 8fa22ababd943..923cfb34966b2 100644
--- a/kernel/coverage/gcov/gcc_4_7.c
+++ b/kernel/coverage/gcov/gcc_4_7.c
@@ -18,6 +18,8 @@
 #include <linux/mm.h>
 #include "gcov.h"
 
+extern void __gcov_merge_ior(gcov_type *, unsigned int);
+
 #if (__GNUC__ >= 15)
 #define GCOV_COUNTERS			10
 #elif (__GNUC__ >= 14)
@@ -187,6 +189,15 @@ static int counter_active(struct gcov_info *info, unsigned int type)
 	return info->merge[type] ? 1 : 0;
 }
 
+/*
+ * Determine whether a counter uses IOR merge semantics (bitwise OR of
+ * bitsets). Used for condition coverage (MC/DC) and other IOR-based counters.
+ */
+static bool counter_is_ior(struct gcov_info *info, unsigned int type)
+{
+	return info->merge[type] == __gcov_merge_ior;
+}
+
 /* Determine number of active counters. Based on gcc magic. */
 static unsigned int num_counter_active(struct gcov_info *info)
 {
@@ -259,9 +270,17 @@ void gcov_info_add(struct gcov_info *dst, struct gcov_info *src)
 			if (!counter_active(src, ct_idx))
 				continue;
 
-			for (val_idx = 0; val_idx < sci_ptr->num; val_idx++)
-				dci_ptr->values[val_idx] +=
-					sci_ptr->values[val_idx];
+			if (counter_is_ior(src, ct_idx)) {
+				for (val_idx = 0; val_idx < sci_ptr->num;
+				     val_idx++)
+					dci_ptr->values[val_idx] |=
+						sci_ptr->values[val_idx];
+			} else {
+				for (val_idx = 0; val_idx < sci_ptr->num;
+				     val_idx++)
+					dci_ptr->values[val_idx] +=
+						sci_ptr->values[val_idx];
+			}
 
 			dci_ptr++;
 			sci_ptr++;
-- 
2.53.0

