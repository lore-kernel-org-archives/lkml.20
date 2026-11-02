Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617045;
	b=gTiBfCWAfGducI4+FFHP25yA0+LStJVgUEXXoBWGc+b5XJu0veb6E+Do2cJDjLzLCdiR
	 OKVc5ntcI5qCYSK8MJJIEICL/gtY7xTaHGSsPhvsxJO+1wLFBFRmvW+FfBIXodfEuDbL9
	 aAyqMyCxd9OzLB3/KCx7qoQ8AU7V/aKS3OWPSo0m6HF1dsZMdDHyebX29PJRUhmOUtFl1
	 ey/hnA3XzMWM4zjGrUl5te76ctozmEAw2SJFgkU48WjvWwQX6u5FNgdR0K8QFn8GZuGpa
	 CRmz4dNuHPXr+0M7aYc2EalSCGBhKPMV7bKLZ2jea2Ai60RyctSOyFW2wJosyejEMAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VeIOYKTyw83mYC/9mhXnSVKUy1AE36+b+LMYhY+JUTw=;
	b=HhYR93ymNNIDno5Wa42Pf2WWgriwIdrIZV4JKpSKogofaZe9Dl9f+ZcQ5Icqt8YXTDFe
	 DnF6H7L5cAIw2A7HCsnuunkFmPXvCSvdm54qIMu/RRFl6Mrf5tCbnYkQLV2Ob8a2g5gEJ
	 paLjK28dTKpskEg6RdJX+rpo5ESGlfNQRlcRzSoCbDjZpaqTV5H07gQPf4xvQOujMx+5o
	 /QIPgvSiBctVd7HM/N8Oa2xAuUdDEe1BNfA7jMDQH6K1I+yEOZnK6dkeMQmkPo8Yfldc5
	 DP4MB5eey3N58Do+0dJtX8p+iAypDHuTvsRPOpKBjtHY3/AWtqQs8VRkUGJLetCV62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="FPtU/BKg";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628A60A2617
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5628A60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FPtU/BKg
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso24823725e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617044; x=1794221844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeIOYKTyw83mYC/9mhXnSVKUy1AE36+b+LMYhY+JUTw=;
        b=FPtU/BKgFk//XRlZlXVVoDt45n0O0oBnribR+fBXb7E086GVxde1kLz7uNZxrVwQEi
         u378Vy+wjE9PdHe6NY1Bjwa6/aHqdmJhOhx+noNqYsLrouWULxXeZOhmWwOT9Wq0/bLb
         AVVJ5qgNkWk9Uyd9pSGTify0ec1szO+0ixr77RTLCbiYMvCsvXL2x/1iXFivVFPPO1YZ
         KfIXu8C7iXQoVLmX+TpF7bQr5EYs4rw2xHQPTr9R49aqOD66ByuXq1xsPGZuiewgMopi
         NspaHCP5Pc+tPJ42wLxwumfulfOPVm8tORnxWT3isoM8f1XR63/c28lMeUbyLraV906i
         2xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617044; x=1794221844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VeIOYKTyw83mYC/9mhXnSVKUy1AE36+b+LMYhY+JUTw=;
        b=kILTBoioCwA1tSx1c6Xq0eZnKCKcjyOor5F94QDDxMiDyIGFaYqVKqW7idAvX8KoDp
         kuQZBgoqPQDUWf4pHoeBM7ZDkundMrokwKkuqmjHP3R0mIQ6JCp5b3L/9+TaPTz/Ldz1
         Aq8ELPxdCJ7WausmNrFeVh5paZaoxd2tCaACqs0esBmtZbcqDlu8nJKx/AV4Qal+6miR
         o268roVu38Hy2mLMFQWeiOAD4epNFLiZxlJWXQp66O6/CkElLs6KLEs0N8Ye+nd47cbC
         kYd4iwGJn8guetuQmXnQVsyuLqNR1Qn+N2a7WFfXFJZ1dYPNq7mBd38au7bTjvwjEDFD
         rADw==
X-Gm-Message-State: AFq9FYI0rjgwjSiqweWJfZevkZFUObnYMzt2Q7XyC/atuqBy4RouGyAG
	ytEBfP34NoUV14+4Dd/X0iHxdGfflQDvaVlcVUZTW5paIbNB/7TaWKSdPfP0QiUo0ksLIR/jQSR
	xL91hdRs=
X-Gm-Gg: AYBFou3xfg9x2IAJgk4okd2HPA7ehcf6IxR2GfGApcoiABDSVR8MHMflphdihnf72HF
	RaPbS+J3syL2V6mMD6BBPCJyt2b6AxTtjtFWT1WDUv5d7a7IO6tTT0fr7mNj0AMfrM6M0IY8RYd
	0MZ0zCrclT3EVd2AG4DBPJ14gxMIuA5fyMVoUNxQn/UF5gyvUZMDmcMvVx3azGP6E2c6v0iW7iP
	lLJvpC8VpmUDbfQ/Dr58JH7VQy+da56q4K2wxV39HcofqE5hax0dDC7VyiX4blVqDEgNRSBNLA9
	qYX5ci1nlwZ3VhkGjhlgYOMProZJ2PtHSPmiCLjGUJzrEY/dDwPNK906hinRb4YCrNu0CnmZmlU
	M/6Z5Q+gHeXkZPwvfK0aQX1jHGVYCq8d0+3RpPTBQ2GpYtenoxOTTSAAfwAAfl5p2Q95Q82uUI9
	tnjy4xlnFCgrR9tS5rsSRb9WCmQzWRH6mC5aZr11EHb/0q+C3L5yH82c0wmctjL/fKV8xsFp7cb
	e6hWCUO3qKB5/bAoquTGLmMJta92ejfzlusjB3y6blj2q2ORJn61fUGkzADvWncIqbJpFSZ+OzK
	akM9Afgmn048rzzKhnnfjgara9AZv6X/TN5rFlPoI7SNNSvO5YkqvnEkhxnXz4TLoQG8DjVjsw=
	=
X-Received: by 2002:a05:600c:3e05:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ac1765e5c8mr214514365e9.23.1793617043731;
        Mon, 02 Nov 2026 02:57:23 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:23 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v5 3/6] net: ti: icssg-prueth: Move long delayed work on system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:53 +0100
Message-ID: <20261102105703.111844-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102105703.111844-1-marco.crivellari@suse.com>
References: <20261102105703.111844-1-marco.crivellari@suse.com>
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

Currently emac_ndo_open() starts the stats work for the first time with
queue_work(), using system_long_wq. This workqueue should be used when
long works are expected and it is a per-cpu workqueue.

queue_work() on a per-cpu workqueue enqueues the work on the local CPU,
so the first execution of the work is bound to the CPU that opened the
interface.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

The stats work handler, icssg_stats_work_handler(), already re-queues
itself on system_dfl_long_wq. Since the work doesn't rely on per-cpu
variables, there is no obvious reason that justify the use of a per-cpu
workqueue for the initial queueing either. So change system_long_wq with
system_dfl_long_wq in emac_ndo_open(), in both icssg_prueth.c and
icssg_prueth_sr1.c, so that the work may benefit from scheduler task
placement.

Cc: MD Danish Anwar <danishanwar@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c     | 2 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 591be5c8056b..0fba22c1046e 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1100,7 +1100,7 @@ static int emac_ndo_open(struct net_device *ndev)
 
 	prueth->emacs_initialized++;
 
-	queue_work(system_long_wq, &emac->stats_work.work);
+	queue_work(system_dfl_long_wq, &emac->stats_work.work);
 
 	return 0;
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index b8115ca47082..fb7140330671 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -602,7 +602,7 @@ static int emac_ndo_open(struct net_device *ndev)
 
 	prueth->emacs_initialized++;
 
-	queue_work(system_long_wq, &emac->stats_work.work);
+	queue_work(system_dfl_long_wq, &emac->stats_work.work);
 
 	return 0;
 
-- 
2.56.0

