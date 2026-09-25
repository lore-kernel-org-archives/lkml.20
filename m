Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E241C69D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294609; cv=none; b=XDOzqUzniuRby9G0etDY+JUB0feysUcY87SuAqGkEiDLUDGfxJ7JJMlZyF9GwBIK3+Ev6VKcO8vBbADLMHpK3xnyQvizQLd234mzwJiLA0nhosbDnKZLEpMpJwwSQQ0Rs2zS+ZwW2CD9fiIEYfkDpkKZ29Bax/xnhFCT2paFVEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294609; c=relaxed/simple;
	bh=HxJRp18ZASLfeI6aBBKe4WUfoXtY7A3JONx48hdHolE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+8CyeOZqknlO7g33QY+Jrew+sth14rDhxfddnybMCgrGcnTb4alzUPqHuSpr77t64ChIGJUlY0kRaPzgOCjjWuprdwlC7UXORv+R+A9Br7Ffx5ObICHHZWMgdk4uF01msV6WR/ZpI0N5ZJMiC46C6qdqfDzj/XeJPIkugI71iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKpGrlMt; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKpGrlMt"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so385083eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294607; x=1790899407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEOSNKxeCJBNAGtkZyV1IkgJGtUbB5DBJZYMoFtteqg=;
        b=PKpGrlMtOId7G4UciN8qaT47qVm6CZ3VOlOOUIrCLPsDgXF2OH+prLcJDYOeqwUO35
         gymNWadtqj/A0UXPN8Vm93NFtUIgATaPwdk7x7TFuc6nlQRlC3d5cChBet775ZB25xqe
         QlrlsPr8YYn/C1ulgCyq00c0zGdJ7hxBVFKEZyxhC277pdoyfLMoPs/aQ7HS7uiGISHH
         38Vy/tKh2Sty/nhgYi6mW2dKyu5yO70nrQc0uaoXcTjEAS/C1El7kRbH/6yTiRJ29qrw
         Gd3hTdPULJQEW+57wJ/WbFAnR2Z3FnGWVh5S0IDvQ633/76Hwnq6TdiYwNfFG323LgJf
         FDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294607; x=1790899407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEOSNKxeCJBNAGtkZyV1IkgJGtUbB5DBJZYMoFtteqg=;
        b=PxW9NVlTD7cp84sSkdvYGa6INymH/g94zpY1w72Ji12MQZsBbI2iNnfSP/0DK1VqgI
         Hr9mupFT4/MCaDTKqO0lFCkQ2OgK3hvFGJdJQ6MZm7MnuDze/AbY85c7ZgWGDKEv6i/m
         IzFxrDTBoDe56Z6/QeGzvjnSkmiKshGDkL4Brw6iSEajeU7vUQaUEaUh1hZU+MOww3SH
         8hckWqApMbhHRaeZGzGIIb4xM5mLFRA2pC08KL9fZNXmrvkluf5GYDf6CZ8v2G0qlGzY
         niWdHmmrpfJ5ZWHfWu6SMIUJZSpE9U0BeI6oe7XwqmU55ETmrzb1+8iaTBPGqtvg560s
         BDcA==
X-Forwarded-Encrypted: i=1; AKwUvBwdX6x10VA+Op5Z8V2Z9DF4/diidXODI78D2KJ5gkVMhZAQHFBIjacRY3ZITZNZpZkdkpj2Y/s9+0dp10U=@vger.kernel.org
X-Gm-Message-State: AFuF++nzsBPKMh84XuN9AGBhNuyS7C87ZNO3yPwGPy18+NAJGDAEgkyy
	1k1EdCqsWk/U4GITBDrF50ObEF5HnMZo/GhCbwhD0KKg0tRp71lBsUB0
X-Gm-Gg: AYBFou14eBCiCxDWwQMS6j+Yrj0PWo7QnX68/7jESPcShi2kILfos2SH8b+uOEdv9aN
	zDLB7Lc8i2Uw511Fbl8UntMv9MfgXCFMszTJEHfFouo+p8lV7uJx5RTc/jN+5W/Vwq5GsF6pagW
	o9vbrTyllPx5DQCP2X9eM0TnKgEBTzbqXQudffwZ6Cof0VhRhZfCN3eJVekw25qwKLmOwPA1Q6g
	x2jefdh3l1ml0FZKDHJZ4pwv4ntZPky0OQLwMIVyx61linv0pJBdNvgugF+w4p/aF0LZobe6mTB
	53Yfj73r8V72kJ0+cNKRlFhjHknjCEbY7mzZda/XbnQByoCJzoz3ReQKMmh6SGNLUK95faJwHt7
	tDJBtE9o0V3CTD4oD3Dn0HrCEZ+mUt8Vlpw7ZvBdvxDs2Xf0sgmi8FiMTA4PN9muxmt+PphKlM6
	LVKxYlB+COuxpHpDklGj5efA3z+N36qZ3cKLOC5wdeqB0w9/dngMQi7QJ9p9U=
X-Received: by 2002:a05:7300:3715:b0:341:67fc:98df with SMTP id 5a478bee46e88-34167fca954mr845342eec.12.1790294607231;
        Thu, 24 Sep 2026 17:03:27 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e1:11cd::1c6:c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm1944409eec.13.2026.09.24.17.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:03:26 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] idpf: fix kernel-doc parameter descriptions
Date: Fri, 25 Sep 2026 05:32:44 +0530
Message-ID: <20260925000244.72480-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove stale @vport parameter descriptions from

idpf_rx_desc_rel_all() and idpf_vport_queue_grp_rel_all().

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index 24b91be25676..6041c3faf7c4 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -487,7 +487,6 @@ static void idpf_rx_desc_rel_bufq(struct idpf_buf_queue *bufq,
 
 /**
  * idpf_rx_desc_rel_all - Free Rx Resources for All Queues
- * @vport: virtual port structure
  * @rsrc: pointer to queue and vector resources
  *
  * Free all rx queues resources
@@ -1394,7 +1393,6 @@ static void idpf_rxq_group_rel(struct idpf_q_vec_rsrc *rsrc)
 
 /**
  * idpf_vport_queue_grp_rel_all - Release all queue groups
- * @vport: vport to release queue groups for
  * @rsrc: pointer to queue and vector resources
  */
 static void idpf_vport_queue_grp_rel_all(struct idpf_q_vec_rsrc *rsrc)
-- 
2.53.0

