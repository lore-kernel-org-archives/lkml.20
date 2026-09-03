Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A284F4725
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454457; cv=none; b=HwisMEovpIqqZqUZ1qAUcYavVih6lrQcbZzkyUVpA9bpKHFAn2dJ6VwJL2WdiA4AIBrgKNpMwLPGB2SPCFZiuVtrWpExwKUAqVp15OlppT3clrjaaRSpkslUxw4COs83srPwRJl1krJgRIghvRLVW/LOUhI+kBux7bqghNHXFlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454457; c=relaxed/simple;
	bh=DGn209hkaWMFOjkQ83re+KwEpJGKoTo3ez+Bt3Mu1Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+WN6Fhw5CoZzJs6LRMIvucXLE6c1AzCbdxaTLTUQoXHBEtw/k/PkE4y418BLFsRFvoxx7aW8aEIfp7axljZeIyMH/1lV4PjKZweSw65n40LC+9ObHqJWDEdlyUQQkG1xHQfl2A3w4Vx6GMgc4Gdhudh6oIYOKw6zn130lWoVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wzg7ITqu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wzg7ITqu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e067e908so87152f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788454454; x=1789059254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6Qo+0/1udSWJ0STlhhWyqGdrWWVT73HGXaXcBOH950=;
        b=Wzg7ITqutyKr1H/0Fn21bJswQHFxNmjXiu16iqLlg1vJxiZVKq2SV6jCJHhieWerpA
         EjfWpcq6uF5LFrQO8rEZO513482NxCuagdYij5K5+ei+aKhA/AqEUuiKWUdM7MAK8SMu
         VId/rbSYu+tPMDpx1LP99evBmqF80BE5xxz+wfLECHSuBLXyRL3j0Bz7otZuA2vQ1BHY
         d+/hfi8ykDBgf4fypYqqobnIUdesj0+vshPKFTN3awpELvqQXccIsrxzy62y1O6zOhWN
         5Ql0N3xN5YXATAg+nocpQ9pvTdNUcIJB/AR3l3jPCGOJN4+kn4TM1kV8CP98TVP/kAqT
         gY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454454; x=1789059254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6Qo+0/1udSWJ0STlhhWyqGdrWWVT73HGXaXcBOH950=;
        b=DT/ew0kH5jrNw1nq04MK6bXOQyiCdpJegXlqWULGqgdiWKCBlRoJ9xIv6zgvs2aXms
         x9ezjHXFAZU13TyMus3octDBxzjx9DTeH637DoAD46dItKdXPL7VxWD1xFOuKO/z0AsD
         ugnxhifFBi8CI4MYKi4u+q5LdDJcAko4J31dvjGizK8ExMp2eoYvm7GDa9L/ollIZjmy
         dbehR6N8Dg6u94mp13X/BMEKXEU1/AhWbpgYvDDfkg8QKEObqSud5Qu+4z6IzY/Rk/zy
         WuMTMXWgVKQG+TcJprYCMUrT6IorvxNp6lFVDT88CXHMCoM7wl32aYyeggQl9EhPDIFn
         P5hw==
X-Gm-Message-State: AFuF++mnDpKYP4DXTvnlaqRdw3zP8kxaINmgQHCDLFt0EyRa9p3qeOxH
	DWBAlRnDUk7SYuUV8hhOtLGi0FDdW4i5bYsFawv/EZ2VHcZipuS5oLpiz3H3GhRwZ4nA0gqMW3E
	aIAIhubI=
X-Gm-Gg: AYBFou2b6hePeG4QnGHb03uspkdRuWjf1qnb0CvlfRMnoA4TEZI3zzovj+jZ2QIZNlh
	hRWEgnKbOqDlNjbeI5SwMW74Mope+mUEGinv+lGccXxplVZqFVjjjnHkj/KhAeul+Fka+tBEAK1
	f3jJutLAcJ8JXVyDOV55wVnGiwPh8Gw4Bjd2eachdJ4IuqoIu4xYvDnUO9VIASHfQ+CB6pQGpMC
	eZ/ChMi69Q7UTdyhqUP0j6J7SrlKSmNZGyS9B8k7EViovWM6pTK4x3FkTIxmRE2/z8D1CFIOM2E
	Wi0R4sZpztWXG4j8O7nH4uilEfMgeh/xpCkihjlUVoQPU/10Q2GqKV49sNuYLhlt3CB4OUaUSXF
	LNy5AuevZoPegW8YC2wX/SC/ulngOncQDJfjzfCdxEDF7ke3+5qbUIdlSOh9SatyAuRssaRwKdC
	lzvTZnEbDbmj3GJUxVe379rhY//A2qrRR9fF2tmREsXKgA0/NbphZGmtImol9yo3hM3w/CAU+qj
	5FfA6ryzqU=
X-Received: by 2002:a05:6000:420f:b0:484:f26c:b9f3 with SMTP id ffacd0b85a97d-485872ebd4emr452855f8f.28.1788454453908;
        Thu, 03 Sep 2026 09:54:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm15311657f8f.27.2026.09.03.09.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:54:13 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v2 2/2] doc: Update WQ_UNBOUND documentation
Date: Thu,  3 Sep 2026 18:52:51 +0200
Message-ID: <20260903165251.481362-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903165251.481362-1-marco.crivellari@suse.com>
References: <20260903165251.481362-1-marco.crivellari@suse.com>
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

