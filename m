Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242222;
	b=wrBmST85GrXTxwc+mBYutM9ApChYT53P5TXvbysiw+58LjP5pMsHh0mkbV0O7Nqgh7EZ
	 3BLYNKJf+aqamKfbOR33Og/fL+QyVUCBfgwe6xLng1H2B0cSsHQ0Gex8i72jmPsD+tXtn
	 7dR51tIA0mJ5wO1zA0ibnkkVYjeBtZgZbk6Qg8BJ9Qp/3pdh5pEUFp1aWnfEc8isbXkQ3
	 Ijl8KG2pc/8jtI3VuUcTv6DFpZCiOzP9DLLNpffI5dMem0J/oZPeo/RTA2ZPEy/RgaLd+
	 V8VZxhxY4CeH/ngOK4VzS4dDrXRPPOBOP4aFq1R0EPIYkpu8KmoquN5vw3IVQ71o9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qdVadI1hvmNJk+awA8RHjDIqE5xUOcTcDNFSytWKlh4=;
	b=ifPlEOhR/giQv/9Hz3I18dxjhzVIA+W5u/CuLwgrtYBIdl77iXd/sxrsRgHd654vbos0
	 gWJ1GrRcTCyTa0r80uIoSaU7k4yv7bxUPDEgiNJnwK/DZsF4QPxJfvn4wm41t2Is2cNiu
	 mAuUWSJ6WAELRwAVHVHUDyOp+Kbvg401YLCmDqcsT3bprdpsbQjChrIu1BM3fWwOYveAG
	 uoHar7XdtFZ9x/6scocoHD9u8FAT2bC5arVCD1UHIbpiIlsPC5ukLuYsS4LQn5q5wPW46
	 15/sT5QPzaWxjrmUbxbUf2NHvUlEmFssd4v6W7klez3VGNnTTwOzZs/xACW9bRNu+mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7gw4Nxw;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84D606A86C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE84D606A86C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7gw4Nxw
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9080505e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242220; x=1794847020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdVadI1hvmNJk+awA8RHjDIqE5xUOcTcDNFSytWKlh4=;
        b=H7gw4NxwqjeiByj/7rft0z1ChCs++jbTS2SciDzDaabPD9a5JFtSMxuZU1XLiwsqRA
         akA2rBrrhIYOC0rdwsIlP61S2mJkbyxrQlkY7KM1nGz0Lq7P1AdMsod03z6tbfQ94jGY
         cC774Ps6EUsSAPLDJ/AVx6YQX7spuvAOCLywh5nrwpwaLYfrjMzf/wvvDWpNi7zcDQa9
         vK2ZaCcGY+p/aj+zRZYB6E/8Jtnbq+93G/wlWxCarjPRad3BKx6Ob/RNmE0FCCnKhsfV
         lO9eRNSlKMsLq0iIg23RCfUj63ED5wpBmylHeOFGvfHhrT/IHDWe/dx+kedwaE3GbzRI
         uyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242220; x=1794847020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdVadI1hvmNJk+awA8RHjDIqE5xUOcTcDNFSytWKlh4=;
        b=ocUkkEIu7eMAzhd1pBdvsmBi524NfFJv9E6GLODCIaf/qHNuOd1FkwEiTAymILMZLs
         P1F/ZfTe/VmgXZfpK8RrxBhh6Gbao0MA6UEEl6lLHQl36zOOywTNWLe3kpjH8wjXx/JL
         qLH1FV51Xtn/EpTbYKUB5ut19GjS+naZLzzfy18yL+Xxt8F76KgBgww6MGUuN3usSVbX
         NWamkbJeFKcoDrt/lbIMd6zdTOMLfeaevdzrlnGSbEmOSICFSnvhCtCsMH11erCORFcY
         mCnkaa7XbE2pd5CxwPgFyrqOUFEJVI0s4QaUpLL+jCLKIM2WFMEu5ih9Alqao99Wsnit
         +xKA==
X-Forwarded-Encrypted: i=1; AL+hErETkT+4bMcbzORj1omtKRIzCgU/ogieFs2dC3ihGxzTugT+nDb5NEmMP+GNT0Nz8eLcXD6a2tyYVWX3gL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZpsqnG2NUU5g1+rfvMKMGFeWjet7VFmlZin3uZ7t8A9tSg9bX
	t8xO/RQPW0+x+R9zjtLhp7VbcqnRy5nWkBwA1RozWT0l6I60s8mrOLhx
X-Gm-Gg: AYBFou2R3coChgzlbZed84SMaYAus33vf/64m6Ot2spfBV3z3/u0isdtCCp230LitS4
	gMEH+dMWwRvd0NVpcJy8G+ONGgU7izcFDbmAaSe1a60cexXNWqzId7v/Z08jjMXlXfvoPsVy4QV
	iTiIwbj6AeQiMzlVCx9xu+Rn19rOmpAq3LOJETZAvA9NGx9sgAhlTM3QncPPkKaKVacKGwGP1MJ
	2CRXtIr5GQRNyT8mCECzUC6Xkd8j3I4fpybDnGO87dGiyQwbJgx93L0ZlBGFA1lOP14q+8QVVCU
	Yp/ESqIvrfBy1U+MM+kcHCNo+dTePS/DWUQPAgHOXLUZ9YbN/TrxbBVnpDU3XDSe0dWIrTKjVag
	lBBZUoHkWpr+OnQsjm3ODcaf/cMGRc+vYcSVFsASta1pcOUQG4uZbxnR4CBTwjCvJI3qILbKqQl
	nBJNjhi0qcUGmll3w21/frnRAFTeR5xLPCfNE/I2i+xSNX9gt6FuNWmidPFLA5CBbs4Lr/yf2e+
	De/vbYqy6JezyFv2mLiL/WPkusrZ133VcQzqkMomkrI/gHSquzobmB2iW2ur4BV2wPrUmshGGKB
	mFOcg2WYrpSYp4LNCj8+AgEqMQ==
X-Received: by 2002:a05:600c:4e4e:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4b94d763141mr82297085e9.2.1794242220166;
        Mon, 09 Nov 2026 08:37:00 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:59 -0800 (PST)
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
Subject: [RFC PATCH v7 24/29] sched/syscalls: Allow unpriviledged tasks to set RT priority inside cgroups.
Date: Mon,  9 Nov 2026 17:36:10 +0100
Message-ID: <20261109163616.195264-25-yurand2000@gmail.com>
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

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/syscalls.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index f1e9de478e1d..36bb07b10d41 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -444,15 +444,27 @@ static int user_check_sched_setscheduler(struct task_struct *p,

 	if (rt_policy(policy)) {
 		unsigned long rlim_rtprio = task_rlimit(p, RLIMIT_RTPRIO);
+		struct task_group *active_context;

-		/* Can't set/change the rt policy: */
-		if (policy != p->policy && !rlim_rtprio)
-			goto req_priv;
+		if (!rt_group_sched_enabled())
+			goto root_cgroup_checks;

-		/* Can't increase priority: */
-		if (attr->sched_priority > p->rt_priority &&
-		    attr->sched_priority > rlim_rtprio)
-			goto req_priv;
+		scoped_guard(raw_spinlock_irq, dl_bw_lock_of_tg(p->sched_task_group)) {
+			active_context = dl_bandwidth_read(p->sched_task_group)->active_context;
+		}
+
+		/* Allow changing to the rt policy when not in the root cgroup */
+		if (active_context == &root_task_group) {
+root_cgroup_checks:
+			/* Can't set/change the rt policy: */
+			if (policy != p->policy && !rlim_rtprio)
+				goto req_priv;
+
+			/* Can't increase priority: */
+			if (attr->sched_priority > p->rt_priority &&
+			    attr->sched_priority > rlim_rtprio)
+				goto req_priv;
+		}
 	}

 	/*
--
2.56.0

