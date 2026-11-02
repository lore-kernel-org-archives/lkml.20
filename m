Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617044;
	b=M51R5c1klh59DocA99AnvkfryrZKGrorvW1hbGBEep+973XXRU09koQvjubMLGeq8ZU1
	 6eZJblNkS454U6zj3puz8KBwhkg7iSc/VV1XvST5mW78DMFRd+j/bwUDsBfQwzisYMRAj
	 CoQQD9/V/mUDN9Zd0ARNGLE4ip4z1tgjtKAdH7dcLToKo+s1S0bw3yXgSY6TWp5PGtxZC
	 nULqnePHOEp5PQg4MIE+DnBVVwLaOizGNkAlwFIIXm7TcwE+AdC771/phrTdDZX4BiAXt
	 keX/jo+2UapRqilQMomV5VRAP74/7KcEBkxIio6UoWDjEV/AFnAXIEGBeqAHB8/fLQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FVUrfemyNnwloOlUvhimVc5x8NpDNzjKpz5CjJJeqrQ=;
	b=ZE49mpQTD5F9n29RWc8uEXn9Dbe3FjldCWdSc0jWTkH+4UTFWDUH2HXbkLkjERaQ81En
	 qJFh/BFZtUW2biVX9FGETRYBKhwGlWztb6kOEakSGmQvlhgVCKBCN6ch34+8q290fFyuB
	 eEwGIPMIvpiL7jJzAEPz40yIbx+W1to6WS2HCptbjJ504JObIwhG4PSydePT9vsVReXWy
	 iL3uBjCB7plneBICkyOA8LbnSP2m/BgQ7cIcwY+OGCcBMTmCChNl3q77+tiWsMfZoLfjP
	 E1/zjEfiQHeGNd3UN/5On0fKqyor6ilIlDy3x16WXadxDWdBzGihVaNAqu25/xge8mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WIFz4VTE;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B4606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6B4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WIFz4VTE
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0728so587249f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793617042; x=1794221842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FVUrfemyNnwloOlUvhimVc5x8NpDNzjKpz5CjJJeqrQ=;
        b=WIFz4VTEXCOtiYsPg3YG+rsn4sveIU38d2Y3z+guLpm4Vpvp4dCV6lvMPykxPzYvT8
         Ki1JlZKl+b/3THE2FeuZUkZfMwelsEWUoj3ulP+HZuTab8XAY8u+jVWWTEduMUrFrcTU
         esCLVe6tideV8Ydp3XkO+/Q0PDGYJ+MLOJtdiznnL+/0xanG/mv8gNZMwsJ5yxOBxiaw
         VjwJhrrpmAyB5vVKHqPPM4q2/10TeXfmQwPpUw0oF3n7/q5j/o5E7+/ChpsnpcvL1INz
         xbKdDMmNpTA/ul/hSXIOUHUuDHMZDkqbztAv3PoqTmMk7rFxb8OKvaFGS2ceTRflF8sX
         V2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617042; x=1794221842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVUrfemyNnwloOlUvhimVc5x8NpDNzjKpz5CjJJeqrQ=;
        b=oBLwWyYQ/P064SLrP6/frj8IhY3hdxbXNVcf2L1453Bz3h7Aqw5a0W+5LBiXq/EHhe
         oe33sSk8aLOpMwf4tBeEO6+CztMI3jBb831eSn8QXMfaNOv6PzSK+H65awXzlD9Mxqc8
         4aBvwHwTZRC1h/bi949ahGm/W/yUd7WTFSxuEDpt4ew1DRz09CPpFv972RXDi2FZkLTY
         WVh5Gq7XesOB7WAXp+ovbEkGUf0/6R/IlpCFTr4ssoHq5SyJuZvnQ2wTMCA6cnPUJQcl
         eF6/gMK+etZJ/ZzJ3Bmm3KMheK7dp4Qbwdfk7iol3q2lUhgnjwjyipjMMWz03vz8YADb
         OrTA==
X-Gm-Message-State: AFq9FYKehzfihx3Vv+VeInjL+lyodNMyoPP0JgqV5+g9N/dd6qu7zyJk
	ZRIRtCks0kwdDnhqi/gLF+tX3avOPcwFF8xzI7+mVozZipCzMRK/fn27z4YI/jF4VDgCb8sGTI8
	Vm71APxg=
X-Gm-Gg: AYBFou3PD2TCGxEaFw647Ws/MSGSigEAEcnvACv8HaIsthGSbv0EYgI+NS6tp8ubebg
	PLU9+zGQ7CBiNEyCIbyXiJWHvv/gFgMaQqBzhuE66kLZ13tuhGFOlGBhzQcJmsOoAERfMnBrydU
	R43LmmVVc17tGbDp1hmrjvphpv4QIeYJM7lTuBPOXCFMuOWgQOe7FG5U96cpJxy43TyQeBcYsRv
	f82oIEs6TWT/SjqK6ZlJHz+6vbMLxRYeh0sXci5qQrFF/NVocl2C/Ee7xyZ8x5dA6Sj6XGd5xef
	1v/Q+KyEq1Vg7hx3xZDjao91Ka7MuXPC6Rj+eh1YfaQOGCJy2ZtZbV18mdCOeNVCvUPzRJLUqP3
	atTzZ8fh7DVpskvhryq9G+mrN+HOjpVui5x/DB72O90fSQjxBzCfCsMU135yM0neOxguaGAyehX
	DuPiIpGEC2dyAhVnXhYAu+mtsCPcSwViB0vz1cPvTC3hSV5j+WJwKY10wQwW3krSfYkw3RZ52Ca
	P02ur5YsEuULOz1vIbTNaA+hKg07hH2f2pDh3wexnj+QXYkRYWa0l+YyvdHlfkJM5xE/g2KSNZ8
	Di84bIvqTHerFFcVaVAfggP6cXrn1e+JkyQC/uO3sxcaDteIfeq6
X-Received: by 2002:a05:600c:628d:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4ac17d1995amr224936715e9.18.1793617041562;
        Mon, 02 Nov 2026 02:57:21 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm363171175e9.1.2026.11.02.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:57:21 -0800 (PST)
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
	linuxppc-dev@lists.ozlabs.org,
	Mingming Cao <mmc@linux.ibm.com>
Subject: [PATCH net-next v5 1/6] ibmvnic: Change system_long_wq with system_dfl_long_wq
Date: Mon,  2 Nov 2026 11:56:51 +0100
Message-ID: <20261102105703.111844-2-marco.crivellari@suse.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueues the reset work items on system_long_wq: the
ibmvnic_delayed_reset delayed work using queue_delayed_work(), and the
ibmvnic_reset work using queue_work(). This workqueue should be used when
long works are expected and it is a per-cpu workqueue.

queue_delayed_work() ends up calling __queue_delayed_work(), which, since
IBMVNIC_RESET_DELAY is non-zero, sets a global timer that could fire
anywhere, enqueuing the work where the timer fired. queue_work(), instead,
enqueues the work on the local CPU, i.e. the CPU that requested the reset.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the reset work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Both work items run the same handler, __ibmvnic_reset(), and every reset
request is scheduled through the queue_work() call in ibmvnic_reset().
So convert this call site too, so that all the reset work runs on an
unbound workqueue instead of the CPU that submitted the request.

Cc: Haren Myneni <haren@linux.ibm.com>
Cc: Rick Lindsley <ricklind@linux.ibm.com>
Cc: Nick Child <nnac123@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Acked-by: Mingming Cao <mmc@linux.ibm.com>
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
2.56.0

