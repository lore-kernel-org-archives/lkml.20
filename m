Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F204AF9C0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531278; cv=none; b=eOV/ZIlcHi+49zmwrimu22OpUhNs8pX5S6U7U8ygutrbCO5LqA1CId2Yzrq9G6FsX+PD8aUJi1xM7dlg6APYfZQir6Ko+PxYDnFzO/BUcQpUdp51Fra0BHJzT+GCMpfHU01c3qZ5+6su93BHfY7BXfIw8D289h0qy8DfxdeH+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531278; c=relaxed/simple;
	bh=DGn209hkaWMFOjkQ83re+KwEpJGKoTo3ez+Bt3Mu1Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OM3jO2BEUPAkMDvA+4RpLV3CbjF0mIBmMayWUPjK6+W0pEWbW7m+PC5VUlEv2eqgEhg7PkzhUePfoO2TXo3F+SzVTP+aPfh1XUIl5XOCxax0kBYLr8HICOSWprYnMfc4LxkcdpX9jRssnANgSBKCj+8rtJ3Mg51uMWmu6EvDIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L69cR4+/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L69cR4+/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso8494255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788531274; x=1789136074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6Qo+0/1udSWJ0STlhhWyqGdrWWVT73HGXaXcBOH950=;
        b=L69cR4+/Ts69gQIcwhc1+/X6M2ElOBQ14JlJ0G7v4X5CnKlRh4iltojDWu3ndhb9Ee
         aYz04/hedCX/4wGTJg+CMrusYAUcBmAe+tQYhuCn//TETnwdeS/MUjRraEOEHxi3wGGH
         0tvpHe9PcZdnw4OFJ1ARbPMXVirUF3ZsKqR3gcZ0Uxx8drmRj4/qBKeHBzxtDtSV9Hs4
         RmTHTzQm2v2pzCBr6oGa40Eylq0gA/UN+40TixuaqdQnVzicGx0MhZaSALnVdcoiVK0w
         6v1/WFSEkTXYiRD40zAOUjUQcqh3F0Jxghpvl9x1u66+FowunAaG7y3YvV+5twJuPK90
         lfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531274; x=1789136074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6Qo+0/1udSWJ0STlhhWyqGdrWWVT73HGXaXcBOH950=;
        b=Y1rp/fgBlPUyagNzOVFL4jvBYL+dm/1wF3/wn8yQTcpFBfz4X7fhb9FmlU6F7EqAhJ
         P2TROe/A9Dx+ST95XzpmpmdjjctDtRWQeJaVESeupVVpnccr3ddC6CUG3rbBAybTc0fz
         2zswTSGU1tPINqR+axpojT8xIlmDnV1423G/ROcnMqL0/TSPqRzggaRTczAeNmVKP2t6
         SaMzez7qeBE3qZieTrSg4hG4/XOYL4FOee5sWlBQkTTUOLWQBbNreXfv6m4C18KePU2d
         dxMIZAK1RY2GXiH3EnmDBAxDnniq+CBWFvqzrr5mWl4RGjQFUST2XQVJiUVafNKUPPgd
         P8jQ==
X-Gm-Message-State: AFuF++mcqUF+HKMJM7KkJoSGl4JODCrWWaRMgG9NFOh0dljisiqvBV3i
	+JeiJCxFXPrYzLgWLSsT7yYzKcpvR3W1TMy/FSbojv0duAM1HeIYvQdfqOezKNSLCudr76QEu73
	9NAHtCeo=
X-Gm-Gg: AYBFou2yoXcVgexg6l5xBZTxOFHMmzQDaAobVJEOj8DJ8BDTMvNIHd24HoaCMxPirDi
	V9sdgK9ZAxIvCDqvNRlScbGf5HX2y2KWwC3xxsHDZMBW2nQsLA06gAA2V2zaboDJqQG0cV5hq5M
	EendUTwGa0TM+jbblRvdjiITCiY7sIn/G2814suO03166KB/lvwqGCsTp4JHu4drQiN5J5IPvc+
	2xIT5y2dnkUolKQl87v4eRAuQphcNNdUFMqWFyK5r8DzKnkG9RGNCeZd8tLuX5DxDENdYqMOBN9
	rSFqgVA3fnIKj7ya8v6ukwc0RuQYY/DdMCv0Z42U3GdLzdi7qUj2v7WLragR2R2ocH0e2iQjjp5
	7toH9NZqHJJij0/z0keQqs6pBL223HSZUz6/Yqw7gv7sBCcMgPg5ll92gIl2R8w/vFIr3aOieg8
	2bM/EgacdfKZhrVmsKapW8uTpUPjYSla5XxFVw5PmnvHq/SbpigXUUNfBmpcytNujCftRRapdyx
	WL1/pG/f3pWstbi0B1bww==
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr60991895e9.10.1788531274384;
        Fri, 04 Sep 2026 07:14:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm84723225e9.2.2026.09.04.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:14:33 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v3 2/2] doc: Update WQ_UNBOUND documentation
Date: Fri,  4 Sep 2026 16:14:21 +0200
Message-ID: <20260904141421.287647-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904141421.287647-1-marco.crivellari@suse.com>
References: <20260904141421.287647-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When WQ_PERCPU is not present the default behavior is now WQ_UNBOUND,
so update the documentation, reflecting this change.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/core-api/workqueue.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index bb770f556568..3ca636e065ef 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -206,6 +206,8 @@ resources, scheduled and executed.
   * Long running CPU intensive workloads which can be better
     managed by the system scheduler.
 
+  Workqueue without ``WQ_PERCPU`` are unbound by default.
+
 ``WQ_FREEZABLE``
   A freezable wq participates in the freeze phase of the system
   suspend operations.  Work items on the wq are drained and no
-- 
2.55.0

