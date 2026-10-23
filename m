Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792724000;
	b=sUraeLDDAPfAU4nW8dSmZLCbVTVrfhCV9VXw7cXLbfAvr18x0mxQJeeNmzBUEp7rqldT
	 SMza0MGveIoDaIhAPcA74Hq5o2AkUY37OME9SphZ6Rcy6GHJ9XMAqbLhaxXkt0pNlAqXm
	 Z0nDGOgHLjSepNtcYtJmRKsI84ZKTmn3eeGNbQWhGA5ovIjTXkYl9JKgtfq0VDnmIVOrw
	 KCpBGhuJM2o/OYtgeFLV2GeTzFdyoohXR20znbfU/iYGi61v2HY8nsE7Yd/ePmbk81MOc
	 ekFXspg2lhvvu86ITJH7oiDVt0wYKOnwYbzSa7kwNG4XhPbNEgdOs4WBsLz/ZRR4DSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792724000;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=B/o8KjdV8O1QuoeYPT5dcm2637QzJRM+4Z019+a5VN8=;
	b=mVIfNg/EUdrOBV+eKo8cnSyFV8jAhp9JR+Q9yaehAN6P7XKX1pNA9tA5kG11S68PV6pZ
	 Ti1TKGdhpZet8cJgf3Lckx0Evsm9Jlimwu/hDtjJ975CHoLGJgtYXCmjzqj9jj5UScGcU
	 nPauOTH/slOaSvMx9LLjAwXRtUGYhdCJohIe1Ffz24JeYG4l6hDlnbeN3/kxqAOMFxiUc
	 3NzBU8VKxyzzfJL9GKttFimHlSeCsBbcMkkR47qwOPxlhoir182OWrP6X2oZ7VfqlQ03T
	 AXR+Sn3KnLqHk9bP5WAeBW5hghUiP4SVVX4PxwwiwtWfgXF6ktsvUSl8H6fERL8G+Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cZajZhOY;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D1606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 199D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cZajZhOY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=B/
	o8KjdV8O1QuoeYPT5dcm2637QzJRM+4Z019+a5VN8=; b=cZajZhOYuSAdTUXwhI
	dbaWoCa+ElaPS5V5/U0Hqtyh+Q9uhYSrDaWSXtiyGWMWThSt/ywQD+pXkoG7d8SY
	GSPaE/kCI/lwYBie9GPfd7MdW7QIEHhEU+KdaJ/bzhm5QMD0MQEW5KcE4ZxsWy8t
	29k2zwfRp7vya8lWSEOLBUog0=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3n_7iy9pqsydqBw--.2986S2;
	Fri, 23 Oct 2026 10:52:19 +0800 (CST)
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
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2] sched/pelt: Fix truncation of the PELT period count
Date: Fri, 23 Oct 2026 11:52:07 +0900
Message-ID: <20261023025207.2967903-1-sh_def@163.com>
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
X-CM-TRANSID:_____wD3n_7iy9pqsydqBw--.2986S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1kWF4xJF17ZryfZF4xZwb_yoW8Xr1xpr
	Z7KaySvF4ktas7CayvyF1xWrW5uwsxJ342gFWDCr4rZws8ta4Utr98tr4SkF1Ykr9YyFya
	yF4av397tF17t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gV93Gray+UM5QAA35

accumulate_sum() computes the number of elapsed PELT periods in a
u64 but returns u32. When the count is a multiple of 2^32, it is
truncated to zero even though the PELT sums have been updated.

The caller interprets zero as no period boundary crossed and skips
recomputing the averages, leaving *_avg stale relative to *_sum.

Return the period count as u64 so the caller can test it without
truncation.

Fixes: a481db34b9be ("sched/fair: Optimize ___update_sched_avg()")
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Hui Su <sh_def@163.com>
---
Changes in v2:
- Return the PELT period count as u64.
- Add the Fixes tag and Kayra Cizmeci's Reviewed-by.

v1: https://lore.kernel.org/lkml/20261022034930.225042-1-sh_def@163.com/

 kernel/sched/pelt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 779eb58a4261..d10d57b6b8ec 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -99,7 +99,7 @@ static u32 __accumulate_pelt_segments(u64 periods, u32 d1, u32 d3)
  *      d1 y^p + 1024 \Sum y^n + d3 y^0		(Step 2)
  *                     n=1
  */
-static __always_inline u32
+static __always_inline u64
 accumulate_sum(u64 delta, struct sched_avg *sa,
 	       unsigned long load, unsigned long runnable, int running)
 {

base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
-- 
2.55.0

