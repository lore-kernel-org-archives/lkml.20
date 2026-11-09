Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242214;
	b=MZhwpS9tpERl0CHbg10vlJxbxb54O8zsuexFCCojbKf1dKd2PTmpmamDSB1V6nHL3hbp
	 CRqw0LyiszW/CCQuJa4YN4il6W4vOeRXMRaLcAsAY2l7uqnHV848zWJurcDS95dHyuLa5
	 pQK+KEoZPzZW0ecM5fjmHNAj9tmri778gcF5BU4g+vS3QpAKSgDCrO8+w8ygviw1WeA5B
	 Nc8StLgnEUDOMCAIkwC/oIZfddc89eXBr4Fv3GkaGaoUyoGyejY6T0F7ENvFyd8+y8T7N
	 6G5Zd+1/iykSjPJ1e1MKgaOA42LaNW0t0EWMbL+9/JmcS3r/5yim1MJgHU3+0DJwWxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=69bP/4rCl9jdLnFN99AScdBIIFJeIH0XLbeU93aGJjA=;
	b=2ocudnYRr91OmnIjILLZdiH5U43rDYk98K0gNid/yRwe+rp97uB2Y5e2mE0ftxzuUtIN
	 gjVUSE0zyXTiT9iY+prOQ0ufcHEqTaBoyy11tTMJnFynBymi6UliX04Ch+rsYqP8V8s47
	 WIeMuXGBWxV2MpkbQ7onHD5HlBu+DH7JCLlB55jLZJPJzSDk30XbYryrmg7yKIB62CliH
	 7a4YfI+2V+nR5gs/JwFHjbL3t3RSMXaaBhxzTjz6fqpkTLF8ODhuaslAUo8XlnjVOXf8L
	 gWxQk4XGmd61Arobindoyxe+rmfJj9UvWC9b6YMSXlOw+aTzrcW/+G6k9yFjEmzbFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXDudChW;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B660A6F44
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D79B660A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXDudChW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9636575e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242212; x=1794847012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69bP/4rCl9jdLnFN99AScdBIIFJeIH0XLbeU93aGJjA=;
        b=aXDudChWi1kzv9NDvA24KAm9wuIpua7voi+vf9CL9Zh1dXRMr606KqP0xhJ21ap9wb
         xiYl+JgoIs5gvaTKB6z/QLk98nJfn/WDrxFer7HM1cBhytkHla3W2vxEZJ0yK/FokqIJ
         HoyKpTm1PEf552zrwq/ZOUG2xPPOVrtOOGDP1Zfs95hDrj8JKEp5Syy3M6Hgp2afk4/W
         OtP/zofw1Jd/00GxgksOYjvbSPA4bZwwJDaxTTvdJUKzYnsqJiGd8g9phJj1BESi9GtI
         MNtEIe+O3IZExAETUzG8mxajYx6fuSCL4MEOZNp1usN67wbMHTzQpa1GpRMFjJyAuVpL
         rLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242212; x=1794847012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69bP/4rCl9jdLnFN99AScdBIIFJeIH0XLbeU93aGJjA=;
        b=tPlLtrTWYv83rNMSib/EgwxfGocp5StQV7G22qQymUx7wJQpopSSnj5Qs6NpzSQ3a1
         Pm+SKaQ/jS5uWR9zWNqQFYuefB5H/ii4AhqnYOXTVBW8NunMuaIM3t5lsJfRIpZrLx+v
         auixozbHIHpmbisk1m49Oti1DA+F9KJwy6UGvoM8YFqsge69r2icV0MozQyVCMT55PXG
         Q2y8dexGQaM2GlnS15nDoKK+ddRXn8rPwJgGD99FL/drZOHqP2n0Kg7ZJJeuWrYeuFLU
         3YeeJ0poNuSx4BP7JRQymfgjibM1G+J2O8iHkyxG3RnAh5BWUSTag2Fqy7cK5rdXz+kD
         LwYQ==
X-Forwarded-Encrypted: i=1; AL+hErGDZvqaySY9B8O1/XlcPkd9HvY3Ayy2eI036EzBRD7szbPerjKw9oLfLl1UxBFcis5AEPlYQfUSnwKUDfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+swawGTA/hxy8THNbOrhDtF15lo3hS/BfxRE5z25wLa7TC3eUE
	ZOgUETEVOYWeGnU8HQ+k2winWY7SCloHV2Ru2FlgRphgOI2hnd4OZeGb
X-Gm-Gg: AYBFou2H+4+jjAuOESiNaid2YTRc0PeAEeidAWOYHyDNfCS2MwWqqSRFfJRUWsOHCLd
	BPicDDuS7UZxkDUmx21vNCtMaYOYp5iDXwGPpHL1febTrNliTFLVxvQNu9QilmgfnIOvlv8OjEU
	xANdlxyf1h2ZedcYFbcuRkSs/JCOBbB0A9H8uSo4jm5968wkhnB+Pb/T58fPCrxb2gLoDmWyNtj
	u93k8hUe3Kp/ZY9R7oIqymQk8rOx01bgHtuW9FkNYjINhDyjpC2CoUo+h8cFhUqbOMw79lXJNrg
	9hIkdGZnv5O/2I2pn7p5I/mD4uFMnbYAh2EpVkHulGCUiv15cOeyyG05MveNqgWVszdbpOOUOhT
	NAJXDdqMf/nQpsSqMUfEmiHXwPK1XfDtdPLu4wiJXh+We/VUtc8eIg449Bl0R9CaOHXNWUCSCoK
	ISKlaLW0gD49fGqPikr6+xUCSK8vybMvhrROJznODlUw8+rjWwg6VR24oh2+CH7Sk5ueG4YpR0V
	XOwtygVk95GDpm1f09Gt4XVW8m0cpFwDPPhpSi1RQDloik/CWdxHc7/fa/iX82hA2U7+S1EnvJN
	La7wkW1uS5WTQriYSezsRDYtpA==
X-Received: by 2002:a05:600c:4f4c:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4b963c7d397mr106385035e9.26.1794242212383;
        Mon, 09 Nov 2026 08:36:52 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:51 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 18/29] sched/rt: Remove old RT_GROUP_SCHED data structures
Date: Mon,  9 Nov 2026 17:36:04 +0100
Message-ID: <20261109163616.195264-19-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
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

From: luca abeni <luca.abeni@santannapisa.it>

Completely remove the old RT_GROUP_SCHED's functions and data structures:

- Remove the fields back and my_q from sched_rt_entity.
- Remove the rt_bandwidth data structure.
- Remove the field rt_bandwidth from task_group.
- Remove the rt_bandwidth_enabled function.
- Remove the fields rt_queued, rt_throttled, rt_time, rt_runtime,
  rt_runtime_lock and rt_nr_boosted from rt_rq.

All of the removed fields and data are similarly represented in previously
added fields in rq, rt_rq, dl_bandwidth and in the dl server themselves.

Co-developed-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
---
 include/linux/sched.h |  3 ---
 kernel/sched/sched.h  | 33 ---------------------------------
 2 files changed, 36 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4816e408b332..112e6a450a16 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -627,12 +627,9 @@ struct sched_rt_entity {
 	unsigned short			on_rq;
 	unsigned short			on_list;

-	struct sched_rt_entity		*back;
 #ifdef CONFIG_RT_GROUP_SCHED
 	/* rq on which this entity is (to be) queued: */
 	struct rt_rq			*rt_rq;
-	/* rq "owned" by this entity/group: */
-	struct rt_rq			*my_q;
 #endif
 } __randomize_layout;

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 10eb56aba3d4..1242d297532f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -313,15 +313,6 @@ struct rt_prio_array {
 	struct list_head queue[MAX_RT_PRIO];
 };

-struct rt_bandwidth {
-	/* nests inside the rq lock: */
-	raw_spinlock_t		rt_runtime_lock;
-	ktime_t			rt_period;
-	u64			rt_runtime;
-	struct hrtimer		rt_period_timer;
-	unsigned int		rt_period_active;
-};
-
 struct dl_bandwidth {
 	raw_spinlock_t		dl_runtime_lock;
 	u64			dl_runtime;
@@ -343,12 +334,6 @@ static inline int dl_bandwidth_enabled(void)
  *  - cache the fraction of bandwidth that is currently allocated in
  *    each root domain;
  *
- * This is all done in the data structure below. It is similar to the
- * one used for RT-throttling (rt_bandwidth), with the main difference
- * that, since here we are only interested in admission control, we
- * do not decrease any runtime while the group "executes", neither we
- * need a timer to replenish it.
- *
  * With respect to SMP, bandwidth is given on a per root domain basis,
  * meaning that:
  *  - bw (< 100%) is the deadline bandwidth of each CPU;
@@ -515,11 +500,9 @@ struct task_group {
 	 * different deadline server, and a runqueue per CPU. All the dl-servers
 	 * share the same dl_bandwidth object.
 	 */
-	struct sched_rt_entity	**rt_se;
 	struct sched_dl_entity	**dl_se;
 	struct rt_rq		**rt_rq;

-	struct rt_bandwidth	rt_bandwidth;
 	struct dl_bandwidth	dl_bandwidth;
 #endif

@@ -887,11 +870,6 @@ struct scx_rq {
 };
 #endif /* CONFIG_SCHED_CLASS_EXT */

-static inline int rt_bandwidth_enabled(void)
-{
-	return 0;
-}
-
 /* RT IPI pull logic requires IRQ_WORK */
 #if defined(CONFIG_IRQ_WORK) && defined(CONFIG_SMP)
 # define HAVE_RT_PUSH_IPI
@@ -909,17 +887,6 @@ struct rt_rq {
 	bool			overloaded;
 	struct plist_head	pushable_tasks;

-	int			rt_queued;
-
-#ifdef CONFIG_RT_GROUP_SCHED
-	int			rt_throttled;
-	u64			rt_time; /* consumed RT time, goes up in update_curr_rt */
-	u64			rt_runtime; /* allotted RT time, "slice" from rt_bandwidth, RT sharing/balancing */
-	/* Nests inside the rq lock: */
-	raw_spinlock_t		rt_runtime_lock;
-
-	unsigned int		rt_nr_boosted;
-#endif
 #ifdef CONFIG_CGROUP_SCHED
 	struct task_group	*tg; /* this tg has "this" rt_rq on given CPU for runnable entities */
 #endif
--
2.56.0

