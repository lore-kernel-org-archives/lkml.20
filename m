Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641052;
	b=aI/cpFjG2gn7MWF2+QYRTU6+L/M4L78OIePXsg4fsCj3keQRZn1KbeqrRCtw/OMvRquL
	 +vymoorqycgsrhlsdmm9WtNeB1+S9lTMdR0zItMVJntqr0Lenta1KpU95vJ/FWL0idftg
	 r6GenSxl9O98UmzLb7SX7j+gDGwleMuzdHwke18sJIoD5dqqnvBbn17rsrUJWVLUHejO9
	 EWacsvKO7AMdqjF5lPBZWhF5BBr8H/eOMETU6A1EJML0/3szUD7jbeS+4/b1ewNHM4Mu+
	 OCvTvV9tKuKzZvZr/RgBIpZxCiw+3UutaeEuf3Ikb/IY/fq0x4fL+shDQrdCCh/7Cig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641052;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=JsfUO8dXWDpAInx7mMxTwcH6GSdHX/xaEyBCjjhsbp0=;
	b=hHgcIlqPFcEi+rouOJ9IjjzWQ+Q2IF6JuVrtGWU/6IkJxVeMsC07vvuy3mQQhAdJk8v1
	 ez+T67dR3n/nZXNwcURT8cSABLQAP3wDkKjAYNCDVOUULNr7nQsvX8NKMOZG/4BqeALe1
	 d1BNC8VBPf3T/t17FjXJekT4ehbGemZeTx3XddzMKOIM10tevzziS8pfz53T/5HT9RKjr
	 L7+oj2+YT3XVADzBxurRB162gi2svqCOr/DX7kIP7BTsI++dx4ZmNoqr+wzZratdXAw89
	 9wHjK0mHMWiRkIDBHJCY4kK37/2zS16Y48p59CHo3oS5yeowOe+156kNoO6NSPUxXew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ClVBXC5T;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C19606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C19606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ClVBXC5T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Js
	fUO8dXWDpAInx7mMxTwcH6GSdHX/xaEyBCjjhsbp0=; b=ClVBXC5TK7b2vIHt/L
	NRUgP36cvCIP73CLpEOPwoEBNmUPN00DB7MaiLx41LZ/8qUyzM5Wmhw6MuJdLHqt
	/MfPF2+V2CV0Tm19u0YgdJAk3X/vKw5XEEnu08JGBYN+MpeiAhu3s5Ui7vlPVJuP
	+q+V4MiuNP1IMzCMsf9v9eTCg=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnT7zKh9lqFjoMCA--.35041S2;
	Thu, 22 Oct 2026 11:49:37 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/pelt: Fix truncation of the PELT period count
Date: Thu, 22 Oct 2026 12:49:30 +0900
Message-ID: <20261022034930.225042-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
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
X-CM-TRANSID:_____wDnT7zKh9lqFjoMCA--.35041S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1fZw1UXFW5CFWkWry5twb_yoWfXrX_Xa
	1q9rnrtw4DtanFvws7AF4fWryxtayjqF1rAw47Wry2grW5KFs8J34DCFZ3Jrn7X397JFyD
	Cr9xtF1kGF1vgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNHUqUUUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hInhmrZh9II4gAA3V

accumulate_sum() computes the number of elapsed PELT periods in a
u64 but returns u32. When the count is a multiple of 2^32, it is
truncated to zero even though the PELT sums have been updated.

The caller interprets zero as no period boundary crossed and skips
recomputing the averages, leaving *_avg stale relative to *_sum.

Return only whether any period elapsed, which is all the caller
needs.

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/pelt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 779eb58a4261..519bc9c40043 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -146,7 +146,7 @@ accumulate_sum(u64 delta, struct sched_avg *sa,
 	if (running)
 		sa->util_sum += contrib << SCHED_CAPACITY_SHIFT;
 
-	return periods;
+	return !!periods;
 }
 
 /*
-- 
2.55.0

