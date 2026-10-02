Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6546F4F93AE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961031; cv=none; b=QD5aMLM00P2JWjhf6joBFOzQULGhdWLKDeq2QNON1EY5rTgYdc4sX7sjPn7SU9yN03cThB9dElkZmcEO9l1YX1aKBonD6Uweiv6HvkdXNTDoq0mOv1IQWInWOLTKxAlgwqF5aBJgsdFi5FRVCmBgyOzVCJH10D3jI5+yntQIbss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961031; c=relaxed/simple;
	bh=+3MpZXZDrpG3qLkvzfnf9AFNVYrh8OCkchmfy1w7NKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEk+sIh9sRI+mQ9lRFXujrmIGFlbeBsBCi1PBDgFzSWqt0j9ZzC8moo1PyJJjs9dN5OlXsQZ13i0gWUn3PnHzYYEUpsocu+M2GRGLiGq3SnnwrVb8Qa4aDgX8yMmKIvFvC65KDsMzzTiAY74HIAsM53uHNN/AiLd2eQI5P7Gcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUGeeCcU; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUGeeCcU"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e300fa47a5so10662605ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961019; x=1791565819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=MUGeeCcUXiDbMAHxZ/HyZlqYCMmo1ZTm3sKrqlRw5cDpxTglM8LD3v7Hj6zLg/ZZ5y
         8x86JxX9c/SAFGzB8HVoFgUcNWFDSdrpaRzrPRZvNlttlvLC6IP/ifyAPwy0GfY/Rzdm
         UzvS9rX9HE2xYJnlYPATXqymU2I1t6sANqs7p36M1AyIos/41xVkKchlSPXzkwEOZF1P
         74TExR6xH4DJJlaXm0O56Pj0D10kWr5Byl61FPGfSSauon/6Oe0W8Kr1zkE+zFy9FQBl
         UUEhEpevoAO/RVD58Tz8hohKZvZic+ERB6izJkZK1Mnyd8/2roSmWo6ggBGT+Gkkr9h1
         O3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961019; x=1791565819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=s/9F46cNKZc6rM3dq65rl4YP9NKf3Syxfu7LuUFPEuVjsAHTleAQCX8rL9iAQjG/mT
         r9VTQxkXGJ2LOJpFgEOkF+zjLc83AORaMDXy8UIqbWobaSNrLoGz7GjDBTiUdzviXfyf
         /9aKq+HqzkoCfitHR2orzTLOFtNUz3iCECPSl8yKI4CM08jrOLnlVPyypGoLj+T2MoYv
         V1sW+u2gz8d3gsHJgmFGyXiYy8N4xoTcF4DJ8I4SYaqx5xA8JpRoFuA/KfCm3MU0MV+d
         6D5qM9CH6BQuUXI2wWHcJC1zVcgqEB5VbrCDGDBtGbFQ1FzP/xJYtaE9AMt0bIQu0dTm
         puIA==
X-Forwarded-Encrypted: i=1; AKwUvBwZI7jZiflxaSpp9ZF7usQVCqryGqRvzG1DCm4URuUtt8EedqbMtefWWIfKB8bBx/1rUh6BUaN48LZD9FA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy+1dSNwKcM160zdG2KVXOg156tA7aM0lwypQ5qHE6+brj82U2
	r2SBCEJZl/3bCykK2LAV6b424aQPjdfskk9QzEwCdFs8XBiuEB6fZMdT
X-Gm-Gg: AYBFou0PdFBTyY94a4gp+JXKgcOrDErnPkBozn05aBcc367+QhgYSgdlaqkGYu2kd+h
	ZesH3nhesOcNLfd5Ban7Qkv9Z9571vwBEb1BRXm3T/wLK99aCHcgyaX8YXWq9mDE+DixKdiRo0z
	AMempHVfXk9+axpRSC8VAd3Af0lSNWxFxt0zyymp+4IRQJNl4JyUs0xuizovbDZptwvDil1azrl
	4XJJEW/sFscY5Enzmj6khf9IRGwupI+BHYHeuF4XBeWTHfZxVEdrgNzbDIQLgKWy12xz9wAzdvR
	xiARoJ5bPxvg6PLl4ONzBZ8VmsbDl/xeFIkZEkide/lrckIaVsAkyFKV3Nmhg++rGQeeS9L2VMD
	tqDikCW0VMELCGQzfLV64Cxvi/FoeTXOEWmSi89oK65XLeob9LSSF7kCBahGPtTQ/zmq1jQsN05
	56r0e7h71zQ5dG0Vf38Psxf3Lv5y081pXL3dT4hl3eDZ9eQg3Hkq/UbFKMjWPeNIopTgEfvhqse
	uBPePqBUdXDwwUGBA==
X-Received: by 2002:a17:90b:1dce:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3a6ce959345mr2937077a91.25.1790961018501;
        Fri, 02 Oct 2026 10:10:18 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:18 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 07/15] Documentation/litmus-tests: add hazptr wildcard-flip escape test
Date: Sat,  3 Oct 2026 01:08:39 +0800
Message-ID: <20261002170847.3653663-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a three-process litmus test for the in-flight wildcard window
of the single-pass wildcard-flip scan.

P0 models hazptr_synchronize(): it unpublishes the object and
enqueues the waiter after its memory barrier.

P1 models the scan kthread: it picks up the waiter, flips the
wildcard, and performs the final hazard-pointer walk.

P2 models a straggling hazptr_acquire(): it reads and publishes
the old wildcard, then loads the object after its publication
barrier.

The forbidden outcome is that the final walk misses the
straggler's slot while the straggler still loads the unpublished
object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../hazptr/hazptr-wildcard-flip-escape.litmus | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
new file mode 100644
index 000000000000..de467bb82d20
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
@@ -0,0 +1,46 @@
+C hazptr-wildcard-flip-escape
+
+(*
+ * Result: Never
+ *
+ * Check that a straggling acquire which published the old
+ * wildcard after the final walk cannot still load the
+ * unpublished object.
+ *)
+
+{
+	int ptr = 3;
+	int hp = 0;
+	int wildcard = 1;
+	int enq = 0;
+}
+
+P0(int *ptr, int *enq)
+{
+	WRITE_ONCE(*ptr, 0);
+	smp_mb();
+	smp_store_release(enq, 1);
+}
+
+P1(int *enq, int *wildcard, int *hp)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(enq);
+	WRITE_ONCE(*wildcard, 2);
+	r2 = READ_ONCE(*hp);
+}
+
+P2(int *wildcard, int *hp, int *ptr)
+{
+	int r0;
+	int r3;
+
+	r0 = READ_ONCE(*wildcard);
+	WRITE_ONCE(*hp, r0);
+	smp_mb();
+	r3 = READ_ONCE(*ptr);
+}
+
+exists (1:r1=1 /\ 1:r2=0 /\ 2:r3=3)
-- 
2.43.0

