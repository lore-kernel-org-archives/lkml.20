Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449624E13E4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448983; cv=none; b=LSnrWTGC437LrgtOq/QzDZwV53Oyfg+yy/HrmbK0HN0zwYDDzlZfxxBGL1DR1kOtXjLw+/PDmRNeZqY7Uw8ZRn+SujLowBwk4vG/Xsf8lziydzMK38Ul2tPhtcuUdmE8SJF+IgmhggF+Cn7/0sqgyPx7xSt8qjrsZSMLAoRxuMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448983; c=relaxed/simple;
	bh=DGn209hkaWMFOjkQ83re+KwEpJGKoTo3ez+Bt3Mu1Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHtsgr6iJeEFPOoWo7XZQi+ZdVouR0H4K2tOwYcQLKAoOktToV/3ZtmuTbcha5D7y40MVtQqv5GZ1npHIspPr9w3fQFBHJZ3QNtEMZf5wl8NOpW3YdtyLuMFiHpqYvqY9+bZSYxc/4GSivQWZsMDfsPPhvs1G2L75o2bbFTW+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WPZX9t5l; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WPZX9t5l"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e4998d28so1863847f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788448979; x=1789053779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6Qo+0/1udSWJ0STlhhWyqGdrWWVT73HGXaXcBOH950=;
        b=WPZX9t5lRbdRTBWIpUdSIyOVOeFBcnbMayjrIVuKpfjYpcO4fHcPJlWNJk9YvtBhzY
         vxVzEywYuL7yNy/243yL+gYDH+fkig55mpCS9xSZs44cj4o4UBj3L8wqy6GB9HpROhRu
         h/GJV8taYBCH5UnAKD80gLciMcbQSx5/gBxZ53EEg6g6gKVGzLhQI1dEzXPbuuFOjkTQ
         GWPSSkxqq6ucc0e4l/rgKY3g9jm7lmRjKy2Kw+8Ud3a+2ISxfo3ENN6ORTeSksVxPljf
         DOnaLtkDEZjbQ9zgvfMyTGfSpO0tVAbXEpy6XqOIn/vtCH1LqsBB3h+oNSb3FFPSG1yN
         vzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448979; x=1789053779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6Qo+0/1udSWJ0STlhhWyqGdrWWVT73HGXaXcBOH950=;
        b=Gq7y1J1KRKlTfr5V0s+J9hmeN9mR0080qpeUURijLQ2/LxtsautRkGKU1j1c5k/hVR
         F/gKQ1VrfIwy/Aow10HGAO5zxM2+AnlqJStZvamY4DHO9njchE+8CmB1zz48Wg+KsxUc
         IHiJu79nbg80QtRQh0voRKT2l2a5YEPPL7pvaawbu5mNsYkUqd1R7x5PNblXZlk7DEI0
         uPUDRAIOEHFMCKD4JIeRdrX7Lt4xSHLmMu0EOkYguLTm3HIwLEb5ulQgKln8l2cxDeQs
         QLP4oEbmZ1GGWsrg+8u3xHD/wWIe0v4laX46vaW5Z5NK4ESuNLDzt/A+eaUQVnAqK/LK
         iPhg==
X-Gm-Message-State: AFuF++lKTGiyEHYQg++GiybQfjrDzJ0D1o/PSML7kJOx0Re4lSV7zrNG
	zwmVcBYJyjumBo/LeMchWbCp3UzNc6feU/RD98t1lXiDrQAfdC3zSsa2E8mzqu3diIl74TnvpgV
	1anbDYco=
X-Gm-Gg: AYBFou25GictKmSaZyxcyQ0Zm7uUc2uu+sDhMksC3Rch2cJAy4CzTfEj5YB0jbVB7+G
	6tWpvpIYBlQjx+AN2tMJrLXzX0kOfImK/1LXf1FIgNG7Y6BLNgZqZqMgEQtIltniC/rVEzyU9b2
	IXmAJkod7WfZw4jWOQyWzzPdi/aFSUoTTrQIrBqWjUdurB9kmxBFcjnJzp/zIKi9tzdYa8dEjiZ
	T5klQs7oMwzLWE3rImT3NJk+/dCPPWUvl6pYOs3si82rn5vAKM03ytNCCAG+pWedi3L9GDvPszY
	NsLdsX2evG/e5F0Teco1dwNkzRMHs4U08K6zq6pYGXrWwZ63TyK+6yisWB3TMLZ5vnGr0nDhQeJ
	Xfe18AEYJxrTtx+d63Ew81rilVQLe5u8qViLo9wgKuq+28XHmh4JN4oT4V7FvzTgyw/UCH++uWU
	7VIMz3LtQ3H5klsmt2J4s2hJrC098zB59751+XvZPn+Lp9X/2iDlEaLHfX/ngkE9ExmoiNJIlV2
	VflqwHVJTo=
X-Received: by 2002:a05:6000:46da:b0:482:d9c0:ff19 with SMTP id ffacd0b85a97d-48586034836mr1701340f8f.9.1788448979145;
        Thu, 03 Sep 2026 08:22:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e13db0sm14648114f8f.0.2026.09.03.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:22:58 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH 2/2] doc: Update WQ_UNBOUND documentation
Date: Thu,  3 Sep 2026 17:22:04 +0200
Message-ID: <20260903152204.401638-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903152204.401638-1-marco.crivellari@suse.com>
References: <20260903152204.401638-1-marco.crivellari@suse.com>
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

