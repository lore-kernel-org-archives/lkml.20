Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052975;
	b=C2TQrZvZ+oS3I5ufVakEwWTEZMBTNMkkv8OLz12+x4cbxTO1MZds7kJdN6UN+htjgI7f
	 EcYNmZz8saT4UlPMkAR4WdecZJ1p+KRoNl2/J0+TZCyIf6zBeDvCd5XCFSq4HgZsZSua8
	 BGy6vzClq526QKKeYM8nir2qYiJUPb2ENvEGHhg6LOGMuWxCARugnNPk3MJvrQj8nf8p6
	 4TWGB0LFUCNYt3P8tR/4z9fpGu86xhUX3xXvVajKM7fUeKHPrs+iVYpPK72zPj6XM2uG+
	 XK8tuv2imzj3DihilM4Cqe/A/1OtRrLSOUH6cvGJhpD+O30kWFVP3FIWL2SQRU5xYHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052975;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=1Kzg+7msFZ5S4gLEQuTmD6li/Dl9W6d5pBd6NPkjpEA=;
	b=YNncHXtNcX1SSY3Bma+I0EJuMRRskOPzmb/G+keaU8g2VsjfjovUuI+dTm5meB7SH/W/
	 DZYlm4qOOLnLroO7hZjVaPG+Lsmo7rMf0/pkHbmTmu6l1nVF3P+Bf9k/6paFJprwjYyN9
	 4Jw+iJJH0HaeBlLfo2IG1I0YFUpmZbOM4Onaq/+h6pUJhvwbnyDXUn1c4WfbfA1zntcLZ
	 m2LCvCCqSzBvIlVxlLRqdy3TMXSzSeezTfCdIcaDK6NgnGscf/Db55ROc7LAs0N3gSi//
	 /MO07fm7o8HyDApjzM5meKAH5aTg9fDk/ZNs2LHCAaztO9WLfSkqydn+13hd9jNPciQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vFa3g7kw;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF59606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF59606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vFa3g7kw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=1Kzg+7msFZ5S4gLEQuTmD6li/Dl9W6d5pBd6NPkjpEA=; b=vFa3g7kw8zqfrU0IMCFnkadMXq
	OADCCvszquAmvIG4WSrB4wvxpJf3CZAe4UvejxDB+Kwh79UDNpo+6+HWPQA72cNFAebmdEJgCcCmb
	egY/EmiAAlqWTTCn2tbO7UzbCHyv4O9C+WAUy1XgT3fee0sfLtxMnYYJgg3GXudbwQjAMBUtM7akf
	N65EcmqzJNUYuqu0Hlh8qFPwc0aG4ooJiI2gKOC51G6UgEAxePSZ5Vsr1YZf1UyX24tvzRRGk2bvI
	AlkGh1o5aMyx79UK1girrRfcQACuNmZf+unkJE4vky0xnt7d5tHYGLPV68oBl8G2ediUp0AV6Yya9
	+Pg7cFOg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf89-000000008xK-2GHW;
	Sat, 07 Nov 2026 12:02:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 20C7B301142; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120207.126979364@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 04/12] sched/core: Make __update_rq_clock() skip updates on UPDATED
References: <20261107115913.261163891@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Calling update_rq_clock() on a rq which is already up-to-date would still move
the clock (after warning when WARN_DOUBLE_CLOCK is set). This is a bit silly,
so also skip the update when already up-to-date.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c  |    7 +++++--
 kernel/sched/sched.h |    2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -869,11 +869,14 @@ static void update_rq_clock_task(struct
 
 static void __update_rq_clock(struct rq *rq)
 {
+	bool update;
+
 	lockdep_assert_rq_held(rq);
 
+	update = !(rq->clock_update_flags & RQCF_NOP_MASK);
 	rq->clock_update_flags |= RQCF_UPDATED;
 
-	if (!(rq->clock_update_flags & RQCF_ACT_SKIP)) {
+	if (update) {
 		u64 clock = sched_clock_cpu(cpu_of(rq));
 		s64 delta;
 
@@ -890,7 +893,7 @@ static void __update_rq_clock(struct rq
 void update_rq_clock(struct rq *rq)
 {
 	if (sched_feat(WARN_DOUBLE_CLOCK))
-		WARN_ON_ONCE(rq->clock_update_flags & RQCF_UPDATED);
+		WARN_ON_ONCE((rq->clock_update_flags & RQCF_NOP_MASK) == RQCF_UPDATED);
 
 	__update_rq_clock(rq);
 }
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1807,6 +1807,8 @@ extern void update_rq_clock(struct rq *r
 #define RQCF_ACT_SKIP		0x02
 #define RQCF_UPDATED		0x04
 
+#define RQCF_NOP_MASK		(RQCF_ACT_SKIP | RQCF_UPDATED)
+
 static inline void assert_clock_updated(struct rq *rq)
 {
 	/*


