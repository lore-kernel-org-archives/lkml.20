Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279650;
	b=KN0iTJYc6waD//pGVpiOqGrVfJZBw3Lad2Syq1f5ff0BEb/MAgF6kycynP1He91O20AN
	 /my7xEsfYNnbyxrSXDeeDbHIZf3KYW9QvBJO1jbMIkDSvln1ZWS8Vrf+OPxC1pnKAj4ta
	 RMhrT/SeIku9qfF6zKacfd4oBvPFjgqcvhpVXAtIexwC4PIWea93IkNsOWWH7LGE9POU/
	 q/UiCwyJ8RGyrXdNAZ2Z+uhG4IHOg16wSDBSdLZBIEJlfBJgm2ZiC0C1TyjunP81Us3wl
	 ypzmJ230jr/bJ5Wjbjbszg6uDdi9oJtcmqUfdmW1Dtl83vxRqXeXeJO2qd3L44seRQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+utJkItFZ+XP1BEOPY8rPgeB1ae3hhceRf9KKKhngUM=;
	b=pbLNagn7dKv7jCTwgpwFtyPiF3WLqpBDM7WT603Bu86dIPRTW6v1TVRRocWOBMqPkhWY
	 umzy1dR8wwaCC9ZrXEjvRBIbgizv2JRNptauAS8Z/BYQGv+g/DbTyViiP75EtpA4ovJXR
	 sIie04a7obI/t9B/j9XMcJcpUSNxub7bNuFgltbPjNIQpkfrmoAQb24nn/8KJAQHRT/we
	 1ehVD/AZY1a2jnC5gcKM6OXQJrme+YI22AHQuXXfWCq0idgJkaSE/g8aoG53b477HacAk
	 acUksx2wXuyUJzV1bBb3wMK5QcIfwz8lJ9o073voZSkX1pd7wVc42mfhmxro9PsCVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dJ4E+il0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B62606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B62606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dJ4E+il0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso18938195e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793279648; x=1793884448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+utJkItFZ+XP1BEOPY8rPgeB1ae3hhceRf9KKKhngUM=;
        b=dJ4E+il0IpMlpc/tOh8CR0QUrFjtAC/6LXkUiyKynHfzsUaa2AO4Acmv+JJJGrnn33
         RZM5Xmo00WAxoQJLxrd9ZSmfl/KK5Ykg2U/lVI9/p5YGGn9tOBdHG6v7y6wy17L+xOMz
         7RAzNSeAkGsZfNo519Gldgh68h4/1wGM5M/ulkJIzhqX97pdLQztAqd+/rrrZfeGs64i
         pmxXLSK0nvvgOUIaLsJKVZxUFL8fc1t587i5nnj0UxJoZ5I8NabC1ZxZjBSMgFLb8IcX
         hG2k1bBwYJUoAkkNStjV45yWNxrGb9nq0AGQETHB2c2+OXy9PWoacXAWz6/JDz23DlZd
         20Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279648; x=1793884448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+utJkItFZ+XP1BEOPY8rPgeB1ae3hhceRf9KKKhngUM=;
        b=MARoOXJvtMeTHKuVVbR8HjO0f3lfIjawA1d7gtz1DeHYtSL4FlO0zGAbsVxG37QMd1
         h0PanLYuAYqJBLBYNXKXKkws/COTvJgZ+f873niScx7goPqSkpLPbCffRrDxfPghiuWL
         WTOzZ27MEdpsrzQi7fbZhBIe+Tt+2MtBMMwT6/viQ8XeeY7IHF2aTJRGvEGllxihYgeV
         bnK12DgP02maQrktdV+2AflcYzHJBu/R5dm5IZvTU7wRy6jZvmFcCGCAsx1hxzQ6++Dt
         XG0yP9wyQy5GDNAxhKsP3Q/cRSQ0J5S1pd56fRVFgYPTFRYD9sAKf4spgOpbON4BMR6D
         VWCw==
X-Forwarded-Encrypted: i=1; AKwUvBySKvSbGtzGwAi0bRsVnvbmje1HGYz14dl21mpxsCIi1dC7LmgVubQeozZmLbitWrIj8IFYr7AI4grn8ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFkp1mZdw+1GpT8JZolNCvYpYgmIoI+UGNsB5++fKVlOADWKgH
	39NbOOsZ5adccsGXOCMG3749374NCr4u4yLndwEmnhhvT06Egvw063VKJiqOsBsugeU=
X-Gm-Gg: AYBFou3q4MdNROLCu5rSYgtLLaeiofJl2N1U9b61ZJq/JFKx/OrEuJ8VVb+ErxTtMxr
	ktJdqakBNrOLExz1JKQANj5TI/Pwx17Ol3tQH6S2gxRSK29ocz/d2pJgLx6jyD/tN1oafl4cvdb
	W5A+aF3QI3Fq1YiriTNsvS1YZ20rF/9RYZ2XKz7ZTcuq/YEzf3f6rr76e2wMerWXne7Ney+8Kbk
	2Iaw52wOGqg+VN0LLo6UAXULN4U5sbNGwAJ/BoPgZhkIq8MrTrfupTtBg2dYvdlL1Ts53Xq1IaP
	/WBcyg+hieh3HDQ06LqtLmY/CNgWr0YHHNpvLT1hLl1fiS6uuoHZeAAqjhY7II2Ok0OaGSN1kfl
	FOtbkVSUkN7AeqG/84iYmrAK8QMRrFQDd8gVLVL7XaeRzG8zkDx2ZyIxq4lW99tSYnVaUn6WPsK
	grXjXJOEpItIpiXtYnhFZ/IWypL0734yrid8AA7dNmyB2Q2iDLtUt6mQiZl5DpdtfAELjq5ppJJ
	k8MAJ+tSHSImDC4uywWvilARSIOxOKn8tsmL2TNFb/3pvSeddrlPsvr3Qtd0mWRWAMQG3jaBmZ0
	vSyHG2fB0x+1f74BGe+b7Zo3wKHNIuqZmln6wtUF46WMBDbXtojwH92209lEBun75SzhuaGCgtr
	IRg==
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr129262195e9.10.1793279648419;
        Thu, 29 Oct 2026 06:14:08 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm76637805e9.9.2026.10.29.06.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:14:07 -0700 (PDT)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v4 2/2] sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
Date: Thu, 29 Oct 2026 13:13:54 +0000
Message-ID: <20261029131354.11030-3-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029131354.11030-1-qyousef@layalina.io>
References: <20261029131354.11030-1-qyousef@layalina.io>
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

We already have uclamp_rq_is_idle(), but it wasn't used everywhere.
Replace open coding with the function and add new wrapper to set and
clear the flag which enhances readability.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/core.c  | 14 +++++++-------
 kernel/sched/sched.h | 10 ++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c6780358a7975..a2035d66270b9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1626,7 +1626,7 @@ uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
 	 * max-clamp.
 	 */
 	if (clamp_id == UCLAMP_MAX) {
-		rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+		uclamp_rq_set_idle(rq);
 		return clamp_value;
 	}
 
@@ -1637,7 +1637,7 @@ static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
 				     unsigned int clamp_value)
 {
 	/* Reset max-clamp retention only on idle exit */
-	if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
+	if (!uclamp_rq_is_idle(rq))
 		return;
 
 	uclamp_rq_set(rq, clamp_id, clamp_value);
@@ -1890,8 +1890,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
 	/* Reset clamp idle holding when there is one RUNNABLE task */
-	if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
@@ -1930,8 +1930,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
 	 * Make sure to clear the idle flag if we've transiently reached 0
 	 * active tasks on rq.
 	 */
-	if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void
@@ -2122,7 +2122,7 @@ void init_uclamp_rq(struct rq *rq)
 		};
 	}
 
-	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
+	uclamp_rq_set_idle(rq);
 }
 
 static void __init init_uclamp(void)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d87bdbd2121df..4706f73838a86 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3743,6 +3743,16 @@ static inline void uclamp_rq_set(struct rq *rq, enum uclamp_id clamp_id,
 	WRITE_ONCE(rq->uclamp[clamp_id].value, value);
 }
 
+static inline void uclamp_rq_set_idle(struct rq *rq)
+{
+	rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+}
+
+static inline void uclamp_rq_clear_idle(struct rq *rq)
+{
+	rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+}
+
 static inline bool uclamp_rq_is_idle(struct rq *rq)
 {
 	return rq->uclamp_flags & UCLAMP_FLAG_IDLE;
-- 
2.53.0

