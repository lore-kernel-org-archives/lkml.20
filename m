Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085005;
	b=m/BDti55laiYt/CHa2spWZ6TdZVkmmvKu4WLDLLZXmBa5fkUoMoCtgnB7QYNOzlrf+CE
	 9PfSiz3kykZntXdIVrQtZ5N1C2A1GMB8Zk3kf0ei+JeemBEC/KcnrSiAcKm3WEPMBteYb
	 iKwX4O70Z/UtYt7wvTwk1hQB/wq0ugjHCpjwvOZ0TNgE8STLRhAaik87d8NFfFVhWLcaV
	 dsKUpLSrpl2RUySK2UX57UCxvxxH2B0+8yrQx7pWnEaXtE2m1wVkJ+qRKFKeziDZ/uXsL
	 0J3iWBIy2ilUwTCOhuyeCzom8DzM6cCWi8inXlgatt+0BM4nRC+klplT4SrCusiUHeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EtqIIM3bW6NOeXuYxzInv9x9RXwFgInG15ngZwHQesg=;
	b=FJ6jywfj6a4CKFj4S3aYVuY8xrQUaE8FCiIL1gwquKw7ISdsA/Cdtygi6yq8ic+0v+5w
	 rztRwrLdPkOWyToMLJhRHAz/eiyYbrkTjIW9MLyNt7I5bjisolnKvrP2wvTm3GsYyfow7
	 xgfji3/Us/s/6cFKt0BM0wSYrlqEyFtwL3X/rnu9lrNTzVbiUpEHWXTjJXAWiz/xdsvzj
	 diIa8wn0E2IMaxq1iaxWDvNYnuyTMBL/9YRFhjbTrWiCCoZ88HOlp31mwUdkVxcS6umo5
	 MsWZ5f2GcW3nYAx3uEbnUWO1p75ALJz9IUGAj7ey+2d7VDGC/Bxlq5tsxZigTyAyEKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ckAg0cTw;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EB2606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ckAg0cTw
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1976490a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085005; x=1793689805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtqIIM3bW6NOeXuYxzInv9x9RXwFgInG15ngZwHQesg=;
        b=ckAg0cTwq47FgYTxX87XDEs3fE4xRTf7VVWlgSVrBnEVt87UBJOTv6tOgt1KZv5br6
         t87WjH1iSFvnT9Udd+8Kg3ZuhbkioEr37gdcaopXk1qy4vGIn49PIS0F8rKNn2n3fpdd
         A/YmdsWAs+6bFHUObcqSMQtoQscIu0bT8ZMkUBJz+806qHsO/tc4KT/gYxCCTFKrp5CG
         ysghmOBqns5MJFzd52KjwTZtHdeo1V4DyxkkxEldr6ikZzdTVZStX39BuyJBVZ0Lqh2q
         I5LY4wr2/vz6QYvTFXZrQhEfIYYMfoTaFfzxdguDNMEjDO4L2JhqASmFLZnUvvRpom3o
         VW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085005; x=1793689805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtqIIM3bW6NOeXuYxzInv9x9RXwFgInG15ngZwHQesg=;
        b=Uvgw+bkFBGqPHoFcpXJqAaAG2lW1rhOn9h8BOSVBiGLFQe7pdAYFEkZeam/thUCGA3
         QDZ+lpMCOsxJu4pWy+EZfsDQdtz72OseOXtpt4FUVcTXNdJIoAR5y6ocboaPR+UntyLP
         /1n0+0VVa3pgWP0hACnrJ29wGkB69pai9bDJ7Unvsv79+QCSVmWJ27nrKTE6Hzp4iViA
         fLxjAkrxfIoQ6kXrzUx/MliN49zBmJNPVbtwshXNm9/Wcm0nwisUpZiGe57zFlWu4sQu
         vmGgeIlRnRI1WUy25p9jWpdnT0TQMFWW6LUS0y609ptfqUA0WhAaak4Ew8WejziP/rUL
         PoVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy/mL2VsZPiWPmDiyIaBvBTw9O1AKWK5U6bPe0VRRsgZtY7pHvB1K6Ie4FjS2qVOjdQk/tfezRrrLt/dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJju4Kj7DVU53O5FKbMSP+dNdtnASoO03FFa+U+EsOjugXEyh2a
	sMZBovHJ0SLILMVKs4SDr24u2tv2lt/yLr4aBKgdf5NP7q8KZ0irhxb4
X-Gm-Gg: AYBFou0tk1aXDqhQv0CUd249pRIRg2Ed9GUfBVpQ8KDYTWL0+lkTXu5blJPhipryVMy
	oHKmFDsmC4nqrZ/WfMszjbU+8A0hnrb3U7d6Qc+R7auUziw5HN/OMkrYv8Od58nq4Ng1O2lgmHH
	ydqh1x5kyyAwXuNU9BrJzTx6dg0AcPBSRNs8XEaqBojCnY/ZZWmtgej0CklWnjk035gPhBptbxx
	34wgQbEHjfvDFH6ybI2Ei44c9Th3KDdhW8CWoT9qGx0DxqU00VukWzFGubyLgNdoaxkL1X3llPy
	ogrgXvBc27MHGNaYndmwQ0lbRBS2MJBtQtA3KEMnCrtSgowOFooYQ0XYZrNRqNrrukVRU1D8sOO
	Mn3kd2vhmG2aTMlaibCrax2NOTVmcssn1Iq17AiCFDJ73JJHyOmz1N7UKCmHEf+IDmSe3MBUCri
	t0BJBXqZZDEyUYwpTWrIKIPloK9VMY0EIU8BNF6bqbrJddBfKz4SDwDHpKVB0pQl3OQDGHX7XH0
	P9O2T3PtClpIymFBHsAHnfgcgbYWJmFJJZLhjXVGX52opuO1TU66JCFichS5pmJKp6BPO6EplQ=
X-Received: by 2002:a17:90b:56cf:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3adeae80e3fmr7279552a91.58.1793085004664;
        Tue, 27 Oct 2026 00:10:04 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:10:03 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 01/10] srcu: Record callback registration stack for KASAN
Date: Tue, 27 Oct 2026 15:09:14 +0800
Message-ID: <20261027070923.3054462-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027070923.3054462-1-kunwu.chan@gmail.com>
References: <20261027070923.3054462-1-kunwu.chan@gmail.com>
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

Record the callback registration stack in __call_srcu()
for KASAN diagnostics involving SRCU callbacks.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutree.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 2b0e2b2d2c18..46fe2f0cef85 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -20,6 +20,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/irq_work.h>
+#include <linux/kasan.h>
 #include <linux/llist.h>
 #include <linux/rcupdate_wait.h>
 #include <linux/sched.h>
@@ -1530,6 +1531,10 @@ static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 {
 	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
 		return; // Leak the callback rather than corrupt SRCU state.
+
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(rhp);
+
 	if (should_rcu_defer()) {
 		struct srcu_defer *sndp = this_cpu_ptr(&srcu_defer);
 		struct srcu_data *sdp;
-- 
2.43.0

