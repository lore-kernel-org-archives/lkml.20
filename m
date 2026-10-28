Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153131;
	b=2rdhdpO5raehiQdxNVfJGyx7NIxMKCEW19BCSNoOBJ0HYy3UEbeSBR8GQxZAogvSF/Ve
	 NSLnfcvNmQgeRwN297568TkHnEeVcbLW9Gg2978Xqk6ziQ1ND8tdzsc9tabI2WnvTJypp
	 IUm6wQ5WmJvwLscHMsXQhwZtu6qOp3MjvNy5u3CgCbyqIhtu1gCRX5xrU1eaa6tlc9DUz
	 qW04e24UTjhlnVbjdZHIe6kM/nIJ2nM0FGGKSN1i/8r7l9bhUJoxdV+lmp51ZK8sPvUUI
	 I9sgQ5h+9KZYKMkHBPmHZDxnuFvC8b1E7+x7p0aZO5ANp9NCp/bDURMsuebpdYsFM1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+utJkItFZ+XP1BEOPY8rPgeB1ae3hhceRf9KKKhngUM=;
	b=YTCOEgjpJL/D5jQvMgwVCUydzvIBPPk7WK2CvROMjTQiOD7ApqTlVwElIJAJl3PY2dja
	 nK7EkuUpqBvtLMCHBZf/fhlb9X1ZZRyEF+bCuKVtqdDbhm6ni8ujoHdXLLZCoufMk2cEa
	 DVAO1e6rct2EOlk+cY3UM72cBX6IWRGw+uOsy9EQaIvXhJ2mc2lSwqEL1/wR8XGpwrFS/
	 1AFv00LE9+nxUCK4OFVGaPPgz0ZffVK8881DMVBaJSYzRKwxnqewJrrlQdgZ5/mJL4KgA
	 x5ZXcWwQ5s8ZXErf49J0KGppEi4MK8cPtfr3R/qEIMBIYFu7sOsoY3y5YFHfP9aqUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZKOlcSL7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABFF606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABFF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZKOlcSL7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so3317865e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793153129; x=1793757929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+utJkItFZ+XP1BEOPY8rPgeB1ae3hhceRf9KKKhngUM=;
        b=ZKOlcSL7+5XyyFc/rp7hI6MqY8H1XG43WtVuBkl5N8P1rbswV29dgnhh0EpNbaE+yz
         nn6Q6k9isoh3mhTkEMRjKYMexI7iHE8jgrMUwF+2KCy6h7zsYIZbs6m6vSs9ybGUZsqK
         GM1wPS4vEABxdNkHo+mobZM2aJAc10oABqP6JEtEwyfBWgnJdl6T51WR9PLg5ILr7uFR
         2EfMwiVkvmsVVckU12vRVo0PvTW7Dthu9fB3UnOh2oNP+nL5UqFo+rMlDIGcyteNY6OM
         m8BqLNClz63PbSjsljETRasTD6TWOHcf2awn4xfbuwf0RPWu2yvtUPY2OiQNydd3HsJl
         dKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153129; x=1793757929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+utJkItFZ+XP1BEOPY8rPgeB1ae3hhceRf9KKKhngUM=;
        b=WwMmDTmApj4UkpreWgXd4zZ0jA7R42iLegkhLIG+oeiI3aYg7d59OuviCuaDp8SUBW
         5/MlbQ37DX/PZ9Slx6QZbatyBzlavmpLKSZbGq1iG7xluItlJvpu974I8T77brb+YOG0
         u4dU3HmUt12p1wFSNz3MHizcvW3j8Bq0wgxDz/BMGxcnkDMiKHbd+NTKMRQk6QiW8tn4
         Qs6gVaD2R+CiiXpGCV2w0vIap8+N82yOhO9FcNxO7LyefJWBz4FVv3vMnnHmsdQq9TX1
         0pI9QAUbT6k8mxzlnIWt5zwBKj4jCQaO0sovo6NtPTGtcfcQxqyfThXSmVa14WY4avUg
         VdkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5U58uqCE/QPqVlKfciOlTWGU61Zu81bTTdF+6Txknut7Vjsez2Eg+sFyPy/uplMUuMbLo2xEMPoKNQG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEo0bKKvFl0Z3tZRAv1ufItgvoqGHsLq12gSo+fdB3jOjmlCNG
	lz6w/cwLet56noBiIciKNofQPKFwhLXeABEAeW83J/6L9Sai8ERFGljlG3Qvvg3/pxA=
X-Gm-Gg: AYBFou0+FqTWSdx0fLXWPcecWKoQFAv9SCoWgz3j0da/hR7XAnqZ5aj6nQnUTr4hD7w
	u5LKSZ6AszSvaDDo6FuQy/vWJkwOrKHkemopCo4hsWsAgia//0nEe82PpcRr+qfY5O6/zrHtxru
	aVzRC4+r9vzIXuSOej0RFuegJlOYaYaCL/TtyrSAM+4gMqgDt3Rys2Qq2v8+zp9DVg9NVbQmkBi
	S+qAc7zz9GLp/8fYc6sr+iZZuIsPGn9E9dZRmz5cnzgX69dH9V2esE5CIcINQlBUEyt1MPlOWOy
	2qh6TcIDTWftXclAcNUKI9lvovKlaoygSPczzsPzRyww1J2dtLMvj/LX9b4BMyG/hSNGt1sJNn2
	e82ELIyIn2H4ERcQrgi7/MKORGTfZqdNZBDyEeFD/QIVIUB0IOpJvKZ739kzMyTm5aTDR6LAu6a
	J6k8YSdFLIX0L/h7am/rw1R++Us/ABOhz/mUhVAvCw5Ua58LVCpXKrg4ty36mJ0ONLKxbEl+COF
	uuRQ+VdzvULjHKU3FzQsg9xaicCujw2x7MGleafYu3n39rGvaH0fnOXsJ9w90s1WWmDqsGD0shX
	xo65daxsHSVJClaMZcnN9o+nyiDA6yt2Pmgm4PikAIpIfuMEl3qHz2yluTjwMtS+QpormFSrttO
	G6A==
X-Received: by 2002:a05:600c:a31c:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a9674e554emr10707705e9.30.1793153128979;
        Tue, 27 Oct 2026 19:05:28 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm10101395e9.12.2026.10.27.19.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:05:26 -0700 (PDT)
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
Subject: [PATCH v3 2/2] sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
Date: Wed, 28 Oct 2026 02:05:12 +0000
Message-ID: <20261028020512.10245-3-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028020512.10245-1-qyousef@layalina.io>
References: <20261028020512.10245-1-qyousef@layalina.io>
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

