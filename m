Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722686;
	b=FdCrnGrxTl2h2H2H62Lf+o4JnE1RvdJ+S7TqLP+bJYJWUYwqlH2jH3HLSSMsg3H1tT4K
	 0ZB1mh1U7d9kWtQgInzuv9F235nLm1WeP9GSNY8RPMhBh2CsetbDiSjjqCKM8IBrUNES3
	 YP/5cXRzqCB00kEUKD9Geca6ZYiBU0tQY2XKKHVu3Gln4i7uNJ3k7aQTa+eiTEFCVUbtV
	 E8zCDjkrEG6XcRO7ooenu7J+owYVMzGavPK7Yb+OwGntHvJIzK+gDWae48IOS6jFdLqtR
	 oyljooIoDh4/W9+EDZk2N35VbeY36/BWuybqiXOvW+QN2OphARrtGT7i7ju6D6m9FaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TdC2YU/7lyTzZkxDhw5asx021VZsxqMU4X1jjnTodL8=;
	b=rETTlcXihgFo2/yWYLW0kyWwn61zC6bu0xlEp5VAiiQfHcZI7yYwF4i36pboNr2vyNTJ
	 NJKqtb9uPNtlXNYZrNeIr5JsMLIpIai8A3QIeacdJWUGe6AM0tT/XrSjx8lFacUu1u8iZ
	 jyuABb8Dho8KVFxfly1iBDicE1jIVhNOuYgtmZxIKPEJCO/DmfRXldj9qjz1Qe5pQ8qnf
	 mYR3ERbHd6w2Ku3R85CCd1Oe/7Aw7HiL+bwv+bQikCPpoZWhAc7gWJOJ4zlw9nrbSwn28
	 ZjeHNBnQlNO+qa0vxYVWzOQ+wwGQnUJ+QVnjR63XJOCGdkzKhp7b5JNomFHYjNQIFiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k+LbJpp+;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6173606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6173606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k+LbJpp+
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd633ef819bso181759a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792722685; x=1793327485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdC2YU/7lyTzZkxDhw5asx021VZsxqMU4X1jjnTodL8=;
        b=k+LbJpp+2lF6brykMMSEFsfxbR1vyf49x+qykv07u1iRFSOQd9SlLr8vm82HGUsrrT
         QPInWkto4gnChu6CzZBRxhUSO7QZMSM6rgdhVve91aYe41kgnIcbSU9VMgupSzJ7Bayl
         Aou4YPXzRixuF6dJe4Nh/v9pCT4TuJzzvFW1D0oLbtKTPG08lunbReR5YH2uXW80N77H
         YVn9DzUyxATw3BMJZ8rSB34KTGF6xBDeTgtkYvYVy8tK2NA95TGaPvcoLE8saNRi+HWI
         0wogt+rraOjGFDrb5zRHX1vuq0HUUi71cIoUL0Z+feUvGUabFEn8RaPXiej051CJ0xBc
         cD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722685; x=1793327485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdC2YU/7lyTzZkxDhw5asx021VZsxqMU4X1jjnTodL8=;
        b=W40YFF1r0DnsDbDQJUkN9M3TMNCo0AIcC7U8G5GlyF4IDA8GfhIVZYEDkhAhZbxzCH
         pChNdPn8O+BVT18sGWFvwVwzZ+R9W+GAe5GptNYXiHYGAhZEhT5BsC0XKjI6BQGLP2bx
         KiXLafm0sr9jNgw0wUYHPLDSiEStOY2CK77dzhS/FTFR23OnYi72FAAqvT8aZClNaL2m
         y9wZF4i8RfflzV3wrg4UVOuATjYkl2X/253fg2Qd0yRprxQ6viudH203Q55pt37YF5oB
         uua+Cd6DLxHOuJHUuoee49ak1HCfL/Hb+F0kOsD44JS1I4ol5K/aoJjXW0Q9r2ZGnhpD
         CxTw==
X-Gm-Message-State: AFq9FYIR+eZdZ2Yym3slBVZGRHvnPSST4/TkyHMgFN0PgkJn9Q3dATu/
	9PojQ/PIK8FWEsl+DjTV93HFibTQN+6IYvmO9+zcu7YBIWST0Fh6OzvF
X-Gm-Gg: AYBFou1+4hFqh4lbmt6BRCVWwDEtJlo7NyHQdXDdZ7o9O8O5M+oecIYKEgrvLQNfeQB
	2yNqjXkTeHiERJzHrZec7yqXQblR1PEsHBXrEI8lpv7ayNvus3IN8irNDolJ9w1WNss/jzSXPJT
	pBo735O4/XBSMNQslZyLlEGggJX1GF6eDBxqiBz0CJQd0xUykrpTdcI9V3mfcPfWmoiOhWTNvmr
	Ds8tmVzfLjTB/pFncjkxOeQayY9rRsLUWxdo5pv3jdH1GYWbP1yVPzU9MzNPYMOaWFcz4my5vLx
	8NxN6lZCIegDRAkfEHA06ZmAyI0PBIBdEidcIOJlmoc+vGAEkB4QXStONWxiwSz2bJb90QlK/0s
	/DppIkMqONJxj5wkgSOYxZq1WozHK/i8+Co/Ofgzu+Z8KP7LO4xLZGWmhpwIk8q7DET9me1brJ1
	pqZnAf7fsaGDACTgovDKWwzKG6RqcCOAF7K0H68q7Yzkcczlsbs1cXDF8cCsnheLatVLcZS0WqZ
	CY/K+mNlt7eS+tKXBYm+2H77IWaDTsIwSNrSIgknEiGQMSIz1KNYlnaHCo+efOJ2L6VmhRKpSL0
	gfvzxDGWMr9GdjJ9MmyjNAxu0IRe6K9A1fEJsJwnKcxjnHyPOKdfVnCOEfD7M76iFM9e/UIK
X-Received: by 2002:a05:6a21:70cb:b0:3e1:1eca:2214 with SMTP id adf61e73a8af0-3e37668ea73mr712556637.49.1792722685212;
        Thu, 22 Oct 2026 19:31:25 -0700 (PDT)
Received: from localhost.localdomain ([240e:46c:1d00:19d6:7438:ad54:9ef4:bc36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba89a40fsm279852a12.14.2026.10.22.19.31.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 19:31:24 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	gourry@gourry.net,
	david@kernel.org,
	tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com
Cc: linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] sched: fix stale get_pref_llc() stub for !CONFIG_SCHED_CACHE
Date: Fri, 23 Oct 2026 10:31:04 +0800
Message-ID: <20261023023105.28829-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261023023105.28829-1-laoar.shao@gmail.com>
References: <20261023023105.28829-1-laoar.shao@gmail.com>
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

Commit b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp
to fix UAF") switched get_pref_llc() from taking a struct mm_struct * to
taking the task's struct sched_cache_group *, but only updated the
CONFIG_SCHED_CACHE definition and its caller: the stub in the
!CONFIG_SCHED_CACHE branch kept the old mm_struct parameter.

Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp to fix UAF")
Cc: <stable@vger.kernel.org> #v7.2.x
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..973647ad6c2d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2194,7 +2194,7 @@ void init_sched_mm(struct task_struct *p) { }
 static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
 
 static inline int get_pref_llc(struct task_struct *p,
-			       struct mm_struct *mm)
+			       struct sched_cache_group *grp)
 {
 	return -1;
 }
-- 
2.52.0

