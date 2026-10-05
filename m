Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772A3423EBA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202715; cv=none; b=NeFOlFcoFBAdEzJ84usSNprNjFbQ2ffBxka9K62besE2l+aiUTwIIVT/c05sE0g+LUZVojgGNnx3PeNvtHXVwpIFIYzPfFVMe3VeUd1bMf55iEPKGm/1DNrKQ845dnyLcmsugjUekPavXUA21JHS8ITiJqHoEKA6jT6TJ5ZrHg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202715; c=relaxed/simple;
	bh=YeuUasXs+6xt7daRBb8mSHnS9/zyWR2dsiVqHatSlXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQ3BJpDKE56DlIs48T9aDALLe5mS9WQZJ/lNkG9zqP4aZGV+0k8HWVwY1hUCLht6Y0tyQo6TOPu/26W36/v8UXH0IuTZ+rPeyOoFIgHbFUXmKnho18JY9unao3M9mhXMxVI+zOC6BCDGIqHFhCJbGwEIEDCgYVJSsSixVnLakQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gUu0pHqG; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gUu0pHqG"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2db18e5cb56so2886065ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202714; x=1791807514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T0Lp2TEBCmYO9pyb+VFPjyIlyK9zV+FfIYIe/n06RwY=;
        b=0egqihzLUw7C9UrujVmobs9pBJz30l/no8Y3jsPTkZ4NHY8zJgi3TjXuhGQri7oz0O
         96yFsHzPMMhvz6Lq/pKiUZskExg4orD0OfwMbgOdEkkmBnC3jP43eg4i+A/XYmiOXIVn
         DGGowymJSsS4bGEcwyES4qPsu4eL68J3y1ynp5LvLsgI3Eom8UdSgHNXK4TYmLDH37u1
         GKontKiWmlYFUQLz0MLm8ihgQ8DpMFLOZgACHGDrKwNvifAyeXUIed1l0zvqMY2ZpYEg
         UWCdBR/WxcO8OyZsYvjq0yJqw8NqYzd4Cyrd7nJsibMy9roZcJLGqgbqhXId4CIMDi4Y
         ORPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6pHgRtTrVu7B/3EpCQ/S9/R/0dDa9y+lMtx0n8bK6+3smwPGeIxwrXf8YFjj0ZRfu04R4s1if5c+gclI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiZyLZpIPgXwRIDvKCx7lvMo4kd6GAjgFiCqnhGMi0RBm1pc8T
	BMwondRDduflDrVDwMUG/JeeRyVNN/nBaiNDtlA5JgrusNuI64mLuec/079ygwGLVPo+hGB14nY
	szabw2vyFB6EJXP5WZVCIGCG7injGeeLDA1MHJsU2S1rUXLpvy5Qcxdc53XbsrGFzy9wRqQmfay
	UR6bY+/wSlEtsRztnWzfsCZ0UtGqIAtnhfBi7mPYvzE4e7dV8SMt9pHfSl/jUaV21ev0YrfLOQ6
	IM4htSXgQk5f24D+68e+x5Rvw==
X-Gm-Gg: AYBFou11XdtfOs8L1nKxrECI2rcevFBV6F7SxTdLy2kttnYAz6aSRHQMboVMRMlqGyI
	vp3KNno1lgDiccpqsm4iPJRvDu7vGkghcjtk9wNoSwgscCJy7mmUi5QRi2pz70ImOu6VUVEzPgF
	YH+2a1vh7Z/0gk0THtU51Rt60kmBJuGK6G11Kqdtw44K5lTvjG4hruWcM78xyp4wI9UvJdM7I/n
	iVY1KHLR97Malf2ythvj2X/Vr+sj2W6kYXAkdQ+E+Df1kS3oXor2JrUgyj55ytrjMFoBvw4pMof
	A2W8yscZR/v13vYcjjO25M1CWAq5ZXqVRYwzqaSb1uvfIuoXCfCfoKIhXvrAQuvWqzbxggMKLh+
	q6VMzUoQxJnFOkL9KBp8iGMAstMoVWRrb6C2aj91ApoPNCTIolIu3du/19Bjw4wrAeUCheppEHb
	L8P+49B3KS96whTUPNBe8dxu5UOSa0+/u9PSZv+WAX5PMr
X-Received: by 2002:a17:90b:3842:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3a6ce823cb2mr8437576a91.48.1791202713703;
        Mon, 05 Oct 2026 05:18:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78e2dc1b0sm4437127a91.1.2026.10.05.05.18.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:18:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so5128979eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791202712; x=1791807512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0Lp2TEBCmYO9pyb+VFPjyIlyK9zV+FfIYIe/n06RwY=;
        b=gUu0pHqGxR1WQojj0s3RdFtG6rXaURi1FqirgaJwJnHiL9+q0LHTRVEiBfVjrZZhTB
         lCpNKNQfd4UBzfJrwAamT2YtR6rc6caQO8MD/rQLfLo1MYAulkzIIBAFt+fW7R3AXQ8A
         kLyG9wvmsX6eVVSyOocHlJfkZk4PPXhfqIiFU=
X-Forwarded-Encrypted: i=1; AKwUvBxaTF5y7QhjdpTx3pXzo/BEqqj9IHkXH/5lH2XVYfi0jLWSG2ayVutY89yKciwkF3x8ni6OxNL5Ti+hatQ=@vger.kernel.org
X-Received: by 2002:a05:693c:8952:20b0:351:207d:bff4 with SMTP id 5a478bee46e88-351207dc13amr6603687eec.4.1791202711661;
        Mon, 05 Oct 2026 05:18:31 -0700 (PDT)
X-Received: by 2002:a05:693c:8952:20b0:351:207d:bff4 with SMTP id 5a478bee46e88-351207dc13amr6603650eec.4.1791202710909;
        Mon, 05 Oct 2026 05:18:30 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272ceb02sm25687542eec.25.2026.10.05.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:18:30 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Subject: [PATCH net 0/4] bnge: Fix error-path and IRQ setup bugs in probe/open
Date: Mon,  5 Oct 2026 17:47:00 +0530
Message-ID: <20261005121704.227866-1-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Four independent fixes for existing bugs in the bnge driver's probe/open
path:

 [1/4] Unwind bnge_alloc_core() incrementally to avoid a NULL deref when an
       allocation fails.
 [2/4] Require aux_msix + min vectors so nq_nr_rings cannot end up 0.
 [3/4] Treat an irq_set_affinity_hint() failure as a warning, not an open
       failure.
 [4/4] Clear bd->netdev when bnge_netdev_alloc() fails so it does not
       point at a freed net_device.

Bhargava Marreddy (4):
  bnge: fix NULL deref in bnge_alloc_core() on failure
  bnge: require NQ vectors beyond aux reservation
  bnge: do not fail open if IRQ affinity hint fails
  bnge: clear bd->netdev on allocation failure

 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 51 +++++++++++++------
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  2 +-
 2 files changed, 37 insertions(+), 16 deletions(-)

-- 
2.47.3

