Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE43BBFC9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512525; cv=none; b=WnGmX20JNO1wFNXClMaL5yfjJYi+QpQoKXQ5QoXBpDcjNS791O7k8bUK25lxZZCqjFeIYL//NQPdya5+5J5dHk8aRfI2VdBTOL9HeePBJ+e9xxFyjHLvxfuKW4R1uVzZKg9Qa5y3CfmL7p5CLrDEs08ausxbxB6X8eM4NEnuy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512525; c=relaxed/simple;
	bh=s4Ea2StxyPrqujNAHi1PCt4IxxmPy33e54mPI5F3684=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiS2+Z32gjET+soJLn+x8A+jPLV9RGItpFDdUgq7FMMAsVYpXVNa4BvcFBIjgHO1FjilsZi3fMylwMRdh8xoe+OoL88CXMAkrjRjHhj7ttIKs20sBjigxZNwbQNuzg5OF053TnNQLJBWuNPswoB5784gIvYfS5ibw0fpL9s6c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqg/JUWW; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqg/JUWW"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48887248ac8so132879f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790512520; x=1791117320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhesPKf99Qp44ygQ/niFff3igJzVxEwRID8kb/FNPMA=;
        b=Tqg/JUWWx4W9SdbjGQh2ZI9k1C1Tc7X8IY9MuRGn9uY/ZA5Ep3sMFxMRfgJAxuBww8
         jVGPkgCfXl7OwpJ4xWrWrs5CC8LZD0VM7MlDwaxPJw2FfTPb0QwTh22snP4Aqpio0pdQ
         jx5LXifHMhcq9BmDBgpqz/5+YPhjW/o7qEietoFQzbQkxX7Dnb3vYXHvjFY2wXDbbS2F
         aVDnNsLKwYhyl6XO1xQQlIhnoXtnL45ra3KErzHFbA6G239/WyvQL/3PyEEwD7jyI/1l
         xnzJLXQtKDtmnU345b9XMBHJ0OsAqktNFblJj021nUZIGZ/JHzsAHi/NpIdQoUJYBRDf
         vJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512520; x=1791117320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GhesPKf99Qp44ygQ/niFff3igJzVxEwRID8kb/FNPMA=;
        b=CFORYyRcjBKcnjeh9KNnI4JA6EpFrCUCRuQVMpZo40WZL9+o5JigNT5hQc2rISLJFi
         8ougXwWbrLg+LI7Ipayver1pFWXUCo6CNIIsjtDhuu7WZHLyoYRSIQKS00pfztoVR3Qk
         rjbzZmJAuhSjyxlHblhbkMIgKRITiPOndNQOOed+1tD0O4eW4p3s4WE3gV3negMT/C7P
         rL0jN/P4DgCi4ZmluLZnVvjUpZfKsZcFVyv+gxcyRfekdsx+mvKeu/gKXve6mroD2Sdk
         G4bHRYFKZrld/aJv9cF9c02tyf4qGax3bHlK2GGBhvxCPjZlgg5GRKA7B0BGwXO66N83
         7XQw==
X-Forwarded-Encrypted: i=1; AKwUvBzSk+7tyIJVEQx//fcZpJQO6AEaz6iaiy/B38LBevnLNxVt+YDdEkPTAc0VJfhcmz457RnHknT4RlUkj8s=@vger.kernel.org
X-Gm-Message-State: AFuF++kStQUge8+AaX92Nj7TpGE9IaplrKwWUsPNBkrG/I/escf1zt0d
	RQUSbLEuVCjkrJ+c7zkWZ5SXp/V773efnGs6dH1TCu732byUyoeCDPvp
X-Gm-Gg: AYBFou3DGS/8f99vbf7nUoqCyvj3fFMyISlvStNn3Bp+w+3USCcuuzajcCcGlZ6lhJs
	k9iDZRl4vBGdQ2JLuUMqAYjOaUeR5ROlVW5VRQF0GVmnk4zx+GYH0kvFOtqPRhyJjGYXp5/fTl2
	pq+x6RaEdBV93wZ2lZsIOwg8Z72yqXGDsGRIGvMxJmCytMTqopMfz1wTvnhtx3gRMGudV0DQqT5
	ChrLMHpPXZVBXfOn1fzIFt0cZJjsY5JksANoNwqsmVCm/XtDg27UWxJ+/nWzQ552yVS4rPpzecS
	zkEl+w4Qu/UU1hx9qi/8sqhQvWTs/9UXWA2sXEkWrMg+14SJZ5KTD2lPdMNKWued+plHca6lYdq
	NXOMVXka5AHCtAAgk12qEZfYa+8RXNGeIXmPPKqdfwtlQE62+nbBeYayrf97vH97XNn3MpZaHYw
	sq7Hoib3V5iDajks+IT3i1A84xsTT2bV7V1Fo2iF/beA5n7z85UFbqFio4lGCcH986DQyCuHlxL
	pkIhMqxYlA+cf2NJIVYB2lzCIHznxA=
X-Received: by 2002:a05:600c:c490:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49fe67bcb85mr176828475e9.1.1790512520047;
        Sun, 27 Sep 2026 05:35:20 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001771ce3sm58790835e9.7.2026.09.27.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:35:19 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Wei Yang <albinwyang@tencent.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH 1/3] sched/stats: Fix comment in sched_info_enqueue()
Date: Sun, 27 Sep 2026 15:35:05 +0300
Message-ID: <20260927123507.39074-2-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927123507.39074-1-kayracizmeci@gmail.com>
References: <20260927123507.39074-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment currently states that sched_info_enqueue() is
only called from enqueue_task(). This is wrong since
sched_info_enqueue() gets called from sched_info_depart() too.

Fix it by adding the information that sched_info_enqueue()
is called from sched_info_depart() too.

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
 kernel/sched/stats.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98..aecca78acc1a 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -284,8 +284,8 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
 }
 
 /*
- * This function is only called from enqueue_task(), but also only updates
- * the timestamp if it is already not set.  It's assumed that
+ * This function is only called from enqueue_task() and sched_info_depart(),
+ * but only updates the timestamp if it is already not set. It's assumed that
  * sched_info_dequeue() will clear that stamp when appropriate.
  */
 static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
-- 
2.53.0

