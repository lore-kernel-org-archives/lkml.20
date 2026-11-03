Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670796;
	b=JcggTWUEzODzk/S5qhVpm2jEj4xymGyOYgS1YYnOZIS9bW+HXo4WJ1qSxI83ECqxmEBd
	 Xat8wSUeoeOSvdBkc+BiA7l2zMU9ck5RSi86MzOs43xUgmxtfJJh/+Xlhw8se6Ys/xeU6
	 kX8AY8I6uKbbEL0Mam8wMxmvMIPHPgDwCzsTZd7Lk5HFwDhotN4VsXzn3x+HaPug/Vp1l
	 9mYHtUH79vZpjPkx9eOYWAAZJ2RQpz8lHeUEmmkcUEJTEd+tyBu/Vvz44Xg87iX6VomA9
	 yIHun628D1TWV2wmQa5IZ3D1IWvHk28ocfMEjoNigbiMDxfmjLybu9Rv8WMAKnnsYFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670796;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3FMP9N5qxp2Dx+DZWbFS4IIf2RBtBdVEHLLPzTwmg4w=;
	b=1GEMS+zUuBtxxVgJPwY37++7ZSlSU0b19eoSdahEno1XTma7M9LsBQjoddIKGJCLv6YU
	 ayiAh5kaY62V1Qq4ITw76A+zcchxJgfDmKFY4TGazgd0SsGfIor7EvB3xm43uDPw1L+lN
	 0UuwGOrQbr5uAPxIX/O/KqNCBBZOOsixiGtucriO7jDlSP8zKn7lKGPE2DAJbzITqBtOW
	 zZZ1AvuaLEqysrjjwn+7/dDDR/Is7d/65zHophmohAOSwBzmGtjEqIZnG/JR3uo163+VN
	 fPUrF8SFifsrtXe+KkcbSxdxtL0qWTyhOB4H3M/0OGwsoF3XOzUZRTqUwSf2E639l2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ngu4Mti9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637D606D83E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ngu4Mti9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB851F00A20;
	Tue,  3 Nov 2026 01:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670795;
	bh=3FMP9N5qxp2Dx+DZWbFS4IIf2RBtBdVEHLLPzTwmg4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ngu4Mti9P1G+eE6/vM/zhVk22P1y8JsyVYTN2xb55EDU6qWlGzNVLUyXcGWKgzCHQ
	 3H+xqW7sYN1DklK0nMDPBsvLU5089Y7G9eEShoEvNzkoNVcNloQCsSlwFjBEBt8KS+
	 z4MZKOpVYShxku0sTajEHNCLKQpOM+Kv/3HocRAejYjRCTaoViz/1aJt4bmZE/NsID
	 K82GH2giEdjkMqyk7p3c0iqBn+SjZhnowG0Banw2p9aLpqdZFQYw9wUdsKUNS5Ra0j
	 UrvixrlzeRudqX1QCKBRIcU5ZLpYnokMROGWEktHYwcAYUU6gJQeBNQ+8ZKzntEntt
	 OynEyRcrzP/5Q==
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
Subject: [PATCH v2 17/20] gcov: fix gcov_info_add() merge semantics for IOR counters
Date: Mon,  2 Nov 2026 20:52:35 -0500
Message-ID: <20261103015238.3780910-18-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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

