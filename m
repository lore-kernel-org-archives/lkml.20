Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205407;
	b=Wjw2eMkqMOx93GEwXfP0G3uJ+RWCZsNEpeOWjlRD0XpylxHEvogKWQcdM+cLM/sByBEM
	 RB0TBOyKSg0BcYiTRQ4mTTrRKStVejPdastO1IM/6dsPUDh9Y8Xh8mApYVM1UtMore5fu
	 U4Zdxyl2Rrg17cT3YBsgS49BrcaSWDME/35SKB0bWTtTtG1d9j3PLIoFUOxmuIBDSPcJM
	 tkyhIzctpBb7f88fCmA+zMcLkRs4Gcg3Omgjt5k4pjTFre9l0vgDvAmFXw+FVYWf9ZDeF
	 ugOVm7v4wt7x0ZqhrXTJNWfSDIHOqTtx3fMwTkCWZ0ibCBd8P2x/nTrMah6V9EGzQ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205407;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sNx1QVfFA/ZK/0Et1XWEHddPKNj15243wikKTKwVp28=;
	b=nebBjcPsfStVCG8iKIeZiI+6t7+F/gR/8/C3q4n38LJ7nhaamZ/zm90gCJXssEFJX3rU
	 WTk+Wcj56VxCKQP7DG6FOTcm4gSXGei4hExCjdgM82LNLgBhVyS6R/7p5kwfKwD04MFx1
	 sryDy0wqcFL1As5vcY3W+DV/qW/Ln2MHoswrqR3d+5LfJQVVeV8FH93BL6JAOiiUQm9HM
	 +NVkuP3Bi90GwVjrvSKcrP1d5Py8GMIrL8nYLTyHQycpEyctyP0kryBbwTFo2fOGYKPWh
	 PGip7pWa5EgUqHGoeXw/vo8AmzSQbaoGxvhrVwB30h7KNbNnHFdLOxh+/MyGM4ji+ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V7Dwphdl;
	arc=none smtp.remote-ip=95.215.58.11
Received: from mta1.migadu.com (out-11.mta1.migadu.com [95.215.58.11])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EB6606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EB6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V7Dwphdl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xHHT1wbNVKpwdkAZwfE9VAG1f54FPg2lW4wE8grLvY0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205404; v=1; x=1793810204;
 b=V7DwphdlNUrb7HQ9UntSotg5HHwADmCPm4QduMHd9PGerBFTwaCE2qrmjTW+W26Eovm6nrhG
 FmJCwAInt7cd/aaNJUeSRhn9dG+d+iexOWiTcz4YTLmmbeoQizL9DCwzDk3iTNM3AiKL+yl1qAN
 6HCbeIBynrt/1RzH2LaZehyw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7e004241215dfaea;
	Wed, 28 Oct 2026 16:36:44 +0000
X-Mizu-Trace-ID: 7e004241215dfaea
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 11/39] sysctl: store message-queue sysctl bounds by value
Date: Thu, 29 Oct 2026 00:34:50 +0800
Message-Id: <267402e8c5af753933af0c34f56f244d0d9a2a4e.1793204511.git.wen.yang@linux.dev>
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

Replace message-queue bound pointers with numeric limits.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 ipc/mq_sysctl.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/ipc/mq_sysctl.c b/ipc/mq_sysctl.c
index 0dd12e1c9f53..cf0efc168ce6 100644
--- a/ipc/mq_sysctl.c
+++ b/ipc/mq_sysctl.c
@@ -14,12 +14,6 @@
 #include <linux/slab.h>
 #include <linux/cred.h>
 
-static int msg_max_limit_min = MIN_MSGMAX;
-static int msg_max_limit_max = HARD_MSGMAX;
-
-static int msg_maxsize_limit_min = MIN_MSGSIZEMAX;
-static int msg_maxsize_limit_max = HARD_MSGSIZEMAX;
-
 static const struct ctl_table mq_sysctls[] = {
 	{
 		.procname	= "queues_max",
@@ -34,8 +28,8 @@ static const struct ctl_table mq_sysctls[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= &msg_max_limit_min,
-		.extra2		= &msg_max_limit_max,
+		.min		= MIN_MSGMAX,
+		.max		= HARD_MSGMAX,
 	},
 	{
 		.procname	= "msgsize_max",
@@ -43,8 +37,8 @@ static const struct ctl_table mq_sysctls[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= &msg_maxsize_limit_min,
-		.extra2		= &msg_maxsize_limit_max,
+		.min		= MIN_MSGSIZEMAX,
+		.max		= HARD_MSGSIZEMAX,
 	},
 	{
 		.procname	= "msg_default",
@@ -52,8 +46,8 @@ static const struct ctl_table mq_sysctls[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= &msg_max_limit_min,
-		.extra2		= &msg_max_limit_max,
+		.min		= MIN_MSGMAX,
+		.max		= HARD_MSGMAX,
 	},
 	{
 		.procname	= "msgsize_default",
@@ -61,8 +55,8 @@ static const struct ctl_table mq_sysctls[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= &msg_maxsize_limit_min,
-		.extra2		= &msg_maxsize_limit_max,
+		.min		= MIN_MSGSIZEMAX,
+		.max		= HARD_MSGSIZEMAX,
 	},
 };
 
-- 
2.25.1

