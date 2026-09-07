Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB2237F321
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763804; cv=none; b=X9ibssjLDAejcGH2De2jkKrVUI2JNcjcDibP5TN0A16Jdwz8dqRclLE/iVNnpRdsyl+vo/m6ygbsA+9k5Hgb3v7/pyN5lqNIVpccgT9Epe6BE1v5MQYdl2JUBYflrT+SllEApLtRu76jq4X3Fx4x4giPwMWRRLp2dnZG2ltUIn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763804; c=relaxed/simple;
	bh=GnAHVebleQJJnmt8WC+Szgot5FGZ67IN3635nKxQqYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDnEeJJyr0PNU+TsOYFqiUFY91N3Q1Q2TM8eH9/riwoCcoL6xYTcSVrcpIdC5FcdnCOdQPzxiVIL4N02JRNcoNoVDtpQJkLm6UgQlbgqLU8cXm/0B6MExMdO5NeH6ndNfML4L0naXNDWmgB1sj6xx1BnKSUz/UtbqAndbTStmGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoPAS09y; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoPAS09y"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2610288a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763802; x=1789368602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcyHQ8J0eTBJ6x/cyto2HEpUStNZUbDWvhiih6YejS8=;
        b=HoPAS09yLbIku9yxi/P0ZN9wtj+LiQa3JE38G9F6zTXwZrtzliTdUUj6BmuK5jBO39
         6QgtMSAvnRhh6lo5pAfo2DgvczANEkHCSJvLivoJOq4wkX5/J7IWNxmiGVyF6hi9UL6n
         v/paFgEU4Rz8XGd2kXhvlOWOaie+VpJcQywBJuANvIBmQQ0J5vnYPLAjINn0OG4aeSWo
         98HRPXfE4kKPhszeb4spLNxPXQ94IFscnY7Wj5GnC1EijiUaXIMYwene32SGZj1l3MmP
         /SKJeoEcYLGuCInjw7cKYWmI1AJ/3WfRihgjnEZ+ezcIss2/6RkT/TY7Gs8U4woyNAA0
         XP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763802; x=1789368602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kcyHQ8J0eTBJ6x/cyto2HEpUStNZUbDWvhiih6YejS8=;
        b=OH7r5quh8+86AGmbNf6pqDzbYqXNTtUFAm6OPOGa55zYxeVMJbH4AXbRyIIuP/10ue
         vXPQ0+63sMeUrggLoR4JJe3HRcw9Znfesn3KteXb0y1Xt9v75RclPFqkyVNQyCRA8e74
         Wsj6x82pDqehQVnDgUM1Hvuc5GXDvLPQQWGvjsWJNhFRfRATuz/xZWqV+3zocYAxgx1+
         WaP0TGXaaCXGuyEHvkGoVn30YQ7VeyEW6NnM5JxfhTjJ3jYGZk3fWWxPG0B0oUL6HUMF
         +jHB1MfXlfxfQV+EfdsXM0+7WjcS1ll3iIWvRHwKBfASiO2rHXgeCJiZjlwdhd280JPN
         7aPA==
X-Forwarded-Encrypted: i=1; AKwUvBweT42f/bkre+Fc5V9YOHdf4/2xtKdwPrmFLc2HxUJTZtABhIPUy9kyQBnu2kt1RrT2yPNbdJfGnNRSGPo=@vger.kernel.org
X-Gm-Message-State: AFuF++mCypCmUQ8A340WkyDmTTMX5IJcjvin6AGOdx1rykQyxLUPKwbT
	6EndvB2ZgSklR/cI/bs8MjOy0krtJrNnXibfRlJi1bysUzUodHhAw2EJ
X-Gm-Gg: AYBFou1ouqGcBBZzXYw2oFNs5TTIDpyWjvq8kObDesKNf2Esk3CpJWcshCqtEr0KUDi
	QYUsg7cZorxOV7eLql8EAD0JKVntYslkq2pV1wIS1ogyiIWNoZSYkqP9NL2n/2/OqZJKjakp27n
	HGd6wexU82AVnzw2yWW7iKH0rPNNPMikQFsVIVMQff1ZlZlRX1jQItqtg8ejryYBWNm2M6AVtVx
	nWWLsUOunjgK0EUXrbZy2TM+Z/IQ7JVPm+2nre9n1EOWpOvH89jO7ldwmHQQvKmDbTwoQtC0g+Q
	SHCukt6oei4HjTqsWZEeKeAkaHUJUDp0eCTwGIS6N/PnnCF8qHyR3Iw3OObh+0xA/Tqy4arnGgu
	m7kNB5mKZ/7LJ3K5d22UaV1kZnJFmr/rLXD9+wmJv8mutdHdGTYMSHSmfQY0ybclYVWMJBASBQj
	huY2212xRDez+heNX9IOS1gXiuAVr6a063DQdQnECdyXX9EOcE/guxU6a0H7+ORcnjG54d0JJ0G
	bONX55u5oUd0A==
X-Received: by 2002:a05:6a20:5681:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3da39eacde1mr33933937637.4.1788763801799;
        Sun, 06 Sep 2026 23:50:01 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm465210eec.31.2026.09.06.23.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:50:01 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 2/2] tools/sched_ext: fix repeated word 'be' in comment
Date: Mon,  7 Sep 2026 12:19:43 +0530
Message-ID: <20260907064943.25304-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064943.25304-1-hemanth.selam@gmail.com>
References: <20260907064943.25304-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'be', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/sched_ext/include/scx/common.bpf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index 76f5e025e107..9660b43d612c 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -306,7 +306,7 @@ BPF_PROG(name, ##args)
  * Similar to MEMBER_VPTR() but is intended for use with arrays where the
  * element count needs to be explicit.
  * It can be used in cases where a global array is defined with an initial
- * size but is intended to be be resized before loading the BPF program.
+ * size but is intended to be resized before loading the BPF program.
  * Without this version of the macro, MEMBER_VPTR() will use the compile time
  * size of the array to compute the max, which will result in rejection by
  * the verifier.
-- 
2.48.1

