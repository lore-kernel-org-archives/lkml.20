Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1374734F3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798914; cv=none; b=pYWIXwcXf85MTwDk36JqRDaoMW7X8sFM8irpWfnE7d4aR5GouvkmXqsO3sE5OHa3VR+9P9L/IJiR9mWAPak4aCVa3FiLfM0PQTmE/bVfnp6y6xZrhsU0CzGsRxDx1XdH2xfyqgBCcCgh6obRvvmQeyyE20ZvZ+t+vBNlSYqtP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798914; c=relaxed/simple;
	bh=5o+gkaEDGsokOpCnIO/4/WtZKXU3lspYVk5COSvG6RA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X/9XRo9AZYIlL8OaUjnDLsFr5ycnW1lpvfQp1XfJpsuhnBBLR8g6PF6hmFb4qSlzQM24Wsmyc5gWzr/cQpDs9D1t+C6RwSoL3Mu+cJWgcwyRviI98TdkRckxphf2+Xi2NFnjeOcwXd5EyMWsfOJYELToGYBCYtr2pwsSBjiihuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yc15mDh7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yc15mDh7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso2522854f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791798907; x=1792403707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0DTUEu+tQMr+K01BzO77MDPNxFso/NrhJ3ycIpr+NMA=;
        b=Yc15mDh7XId/RpM52kMrtDMAckt4mMRHjA0YCLYXLGSQmt3f8izA/MwV5tgghKNC1X
         t6jEiUrohkzpK3xUdrMN1cSbUw3QoQz34FjvK+RFX428EC7nryGK+LmnNmAfee28i8dX
         ccHId9xtBdNm7K03pwyXjhziFIajA76fdfedBmSdKqqo5DLRA78hXxpnMZ2fwVvWyDt7
         tNmibkHnuRmbBctb6ff8ox7mNiBhxq4ujeqFOepdgW0wyAfss1wS8+GwgqugbfK5+a/K
         pUeSLBrM1xFFiDkpwU3zCbVZyysZgxRO3zmVulpxf6dzdnKVZp6s/JkAJmQAaesxlC5z
         mWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798907; x=1792403707;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DTUEu+tQMr+K01BzO77MDPNxFso/NrhJ3ycIpr+NMA=;
        b=oL37kos/jGQc4aTBILl4qFORRfecjQBmN4TyrpaAdvrOqM922u7/nojdVViuphgmZ4
         abw4D4BRWCinXPmymGtdgOAO16wOWVnGBiJXvDQM40/kI4jav6x0jFeh05uQ388rjZVJ
         hNoYpM0bLTx6FY4QT8zIoMuMCXq4XEyA434XxZTZ9MvNPGeWvgfJKsJiQ57SKdNL0FYy
         871siEkEmLDp9fdcIArgbt4M/cznv3CDvVNJeuVB6hsfdrZDBZBb1GR1MCDs7DuBDaOm
         3TTpYW9Ur2xPaSziSYaZqN9ekjNlTrNzaXXOa/lHuPpjLUOW5cMmZHWRBGMLRWX1OWr5
         J+xA==
X-Gm-Message-State: AFq9FYL/1OvBeACCwbWnaXlllMKcWASub1B82ipmUcR2cWVzEAg45B+u
	9bRhfXL/fVKVnMKt1xQpDpJtgViVvyBsP0CTEyhgzR6QvTQdWNrk81gNMdKbae+xj7Xv4ekcae0
	8XfGMwJM=
X-Gm-Gg: AYBFou2X0kPlSR/BjRoOaXv1WHYcdKj0DDFXSyz7EKdiUGOK2iel552FjsyfP+/Dyi9
	G7NrPEFuxIiN3ZyzJt6LUDavnODUoiTvs+IfO9GEsSC8zEWUhdkE4MpVsow6G7F+GJX4DABD4pB
	nr0XfOYGUEhsvVbU89yAAV2m8TTJ9k6p+XrtpsXgkIPrynoQRcUwOCy/TmgjO1ky1XXjwCu+yfW
	woMo57IQ/ROy+l6hY4OV6r80ulII7pcp7Pvwok5E5rUxLkiz41hMeRCSRYPuuZ+rAit7Yc3Hvk/
	48Gmys2ABz4rkkKJIYLf04Jstv/QabOCWfYunTBU7U3wAecu7QblH1wA3cjhF3YN/796KcJ752m
	oxBM94EZph8NzB8HvLn4xRpofjD4cd+qU8GzDNqUtD0A4tyZRGTVMIuVZwIfiuwNFVy9QJru7jK
	FI37uQSoRvr2mTLhpq39GZJx/2MW4zZLHKPoK8yY3RKzA/tlna+4o/T9Bn+gj5og5M5iiZjvq4Y
	Tc3aYuS77sDSXxxi1fV3Q==
X-Received: by 2002:a05:6000:298d:20b0:48b:469:b562 with SMTP id ffacd0b85a97d-48dba7b3284mr12398568f8f.2.1791798906038;
        Mon, 12 Oct 2026 02:55:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm18539103f8f.26.2026.10.12.02.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:05 -0700 (PDT)
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
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v4 1/6] ibmvnic: Move long delayed work on system_dfl_long_wq
Date: Mon, 12 Oct 2026 11:54:40 +0200
Message-ID: <20261012095452.135828-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012095452.135828-1-marco.crivellari@suse.com>
References: <20261012095452.135828-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Cc: Haren Myneni <haren@linux.ibm.com>
Cc: Rick Lindsley <ricklind@linux.ibm.com>
Cc: Nick Child <nnac123@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5a510eed335e..d4c284c8ef43 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3229,7 +3229,7 @@ static void __ibmvnic_reset(struct work_struct *work)
 	if (adapter->state == VNIC_PROBING &&
 	    !wait_for_completion_timeout(&adapter->probe_done, timeout)) {
 		dev_err(dev, "Reset thread timed out on probe");
-		queue_delayed_work(system_long_wq,
+		queue_delayed_work(system_dfl_long_wq,
 				   &adapter->ibmvnic_delayed_reset,
 				   IBMVNIC_RESET_DELAY);
 		return;
@@ -3267,7 +3267,7 @@ static void __ibmvnic_reset(struct work_struct *work)
 	spin_lock(&adapter->rwi_lock);
 	if (!list_empty(&adapter->rwi_list)) {
 		if (test_and_set_bit_lock(0, &adapter->resetting)) {
-			queue_delayed_work(system_long_wq,
+			queue_delayed_work(system_dfl_long_wq,
 					   &adapter->ibmvnic_delayed_reset,
 					   IBMVNIC_RESET_DELAY);
 		} else {
@@ -3454,7 +3454,7 @@ static int ibmvnic_reset(struct ibmvnic_adapter *adapter,
 	list_add_tail(&rwi->list, &adapter->rwi_list);
 	netdev_dbg(adapter->netdev, "Scheduling reset (reason %s)\n",
 		   reset_reason_to_string(reason));
-	queue_work(system_long_wq, &adapter->ibmvnic_reset);
+	queue_work(system_dfl_long_wq, &adapter->ibmvnic_reset);
 
 	ret = 0;
 err:
-- 
2.55.0

