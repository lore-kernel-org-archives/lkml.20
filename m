Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205462;
	b=h78bmfZl7B6iFk5lYji3rEUaoIfUg39yhMHfBfHNA3PymEJFt+vY5UZP+uwMWdSjUPlI
	 Gxmes1X8DmzZH+Ve0vnt4aS7srFslHXD+dk1BMSrHemgNjYnp0BaEC9QNVVFeb5Wdk8A+
	 7r5JT5wQVd6zb1gAQ3i1hkMJ9tsBLeodmdZKMoPZHD1qfadbOdQ4gbRkwixV3PwO25W3G
	 jZhcUzDmKSWqK2qzFTImhpzYNgYHWHPgXg/OlfU1wZMVhhBnaOPZ7L3i8XN4pmtR4BAVd
	 bwTkbaZgX5Ekjltzz2V9WEx8TqM7xSVT/lOwfx7mQWwep7yuuekKQvy/+6L297NvO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205462;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SqM50gwZk5ptix9XnePs8qcNm7vgVdEevevn7ejFQz0=;
	b=m36MQIJrQBdiS9IP+gGDscPAb4/NggamdW0/E+w4s+FbcUiljLAJrr5GaUAQfqneQYP6
	 UAr29nkokw4qPDXPXzCMfDgQCThAHRpuGuIIBDmIQtHX4Pfi3uoZ5fDdk2nLoF/JX+LlC
	 RE+jmYBeI8Uo313NrpYh/uC9DPD7VbyjhCad9os1Oe/eunS/sdNn6l0oJw8uk9vLmAbH3
	 XoBdGHtNIjXnXeTVo4NQCeA0YeDlrFkCAFw15rgXoDrOf0BSv55D1OWBQXMC3weMrBPvc
	 M6lOrr3AUoG5X1nc99aK+mkSxnBei5rB4DIr23X7fEOaekCnRfFu0eA0cR57E9AMAtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FBM3J2K4;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69C60A2634
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F69C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FBM3J2K4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tIQ+v/B2SyEXleKz6qMVgW24J9srP1mrR/8iPTLZ/XY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205460; v=1; x=1793810260;
 b=FBM3J2K4up2xZwZ7BpEvzfY8tgKeR2qDXA0/RaMyvgo7eAxYVPOUrgmGbS/aBm6b8HCZxh4i
 o8prFrZNziR7TSWulEpQp55Xzi9v/MuQlRvvBrutQN5YpwkH5CrV3qB3LJ/+s1EIthS5ZvJp/JL
 mHsGxda0++zVJcV4zxfw6cPM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9729f73877369648;
	Wed, 28 Oct 2026 16:37:40 +0000
X-Mizu-Trace-ID: 9729f73877369648
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 23/39] yama: preserve scope locking with numeric sysctl bounds
Date: Thu, 29 Oct 2026 00:35:02 +0800
Message-Id: <9eb2f86f804bc3479d711a685be6308e515c59d3.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Set the numeric minimum to the maximum when ptrace scope is locked.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 security/yama/yama_lsm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index cef3776cf3b2..aa4deec29919 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -439,14 +439,12 @@ static int yama_dointvec_minmax(const struct ctl_table *table, int write,
 
 	/* Lock the max value if it ever gets set. */
 	table_copy = *table;
-	if (*(int *)table_copy.data == *(int *)table_copy.extra2)
-		table_copy.extra1 = table_copy.extra2;
+	if (READ_ONCE(*(int *)table_copy.data) == (int)table_copy.max)
+		table_copy.min = table_copy.max;
 
 	return proc_dointvec_minmax(&table_copy, write, buffer, lenp, ppos);
 }
 
-static int max_scope = YAMA_SCOPE_NO_ATTACH;
-
 static const struct ctl_table yama_sysctl_table[] = {
 	{
 		.procname       = "ptrace_scope",
@@ -454,8 +452,8 @@ static const struct ctl_table yama_sysctl_table[] = {
 		.maxlen         = sizeof(int),
 		.mode           = 0644,
 		.proc_handler   = yama_dointvec_minmax,
-		.extra1         = SYSCTL_ZERO,
-		.extra2         = &max_scope,
+		.min		= 0,
+		.max		= YAMA_SCOPE_NO_ATTACH,
 	},
 };
 static void __init yama_init_sysctl(void)
-- 
2.25.1

