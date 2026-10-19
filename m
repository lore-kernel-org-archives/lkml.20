Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E44D4889
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407179; cv=none; b=KcX1dLQyyJdZL7qYN4szwDwz8qwtGPRNtoisRxmyxTFOg4Oz6wYeukOaWQqACfvUlwCqJmGTNYAewAXDNji/JGRTcmaL+2gjl6uOk/r/ZDiT0N/Yw2+DYpjwowqPk6UTOLpM7bY+xPaC/mxKnpCiY3aqqZ/3YrGcBNB3z0MtnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407179; c=relaxed/simple;
	bh=ty/ThgYQR+8E9umk7wcNM3Hc/S/Eq8NHm/I1pGnl+Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUoQjntQPDzC2qqHhssboqwEPDk458DZuArQ0+GKf3tGSKtA5IynECj1kGI7axN0nq3k8mskpsVkmZgdsRmDo1mthWNM7AYitOBuYg5s+Q/Jj3hZGPiTl8a7S/4N5wtH75NQlAcqPla//S939z5Y2D2+fyjhOwuD3N8vW+EAHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=fZ8m06GV; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="fZ8m06GV"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9951D3F57D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792407170;
	bh=dmQ8DG056mR1G4V+Df41oNaFy9WQpehuB2fwvz+jBwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fZ8m06GV1ZuiW7JMEa3DweI+p1KXneKFN6IQfbtmuMn+RbA5evOd7jxR9SMnPO9mG
	 3sqRWn6tUFwIpmH3eqcZXU1G1Fp/t3xCwefvGoTv+u8Bm5oPrykSgX6Zi7hZ5hg1uS
	 Tp2UnQPTcp61/RZymmrpQTtbw59zfbb/rxGN4j+bhMl6vK3D5xgGKyf6EBB3rJE5cu
	 GjdyoR4sdM6Y1fEpw0Zx55q0uh1E1LT28KM0mNMBV7x2Ksi7FCh7XzfmdiTuWlCAej
	 abgCHMQ4PzvWFDUdP3Agwt68SeCPOHGuBgGQcrT3qkFNRdeMoPQi1Ml8QJbexIjtxw
	 4WCz47U3++WgtX6FEO2xnCxWvl29AfdQCbivpJC28D17JfcvoQvqwS1PchpshJWcJ2
	 8Lxtad8aySkna9OrLpfIbvWWc2rGH2KwFQJTY24sgjUs8XWzdkyHHuu/jt+VWlE0qy
	 w3bSFdn4BbtleNOkNnrGvBIAslLF/pC4J0maDO+FOKEAQq8njMTk+bs2w3c+o2qMeh
	 6pZF5EX3Qmq52EqZ/x6GTbFlSr32z+6eyuEexB1qLICbmtdiOHWMYrbZi/MLbfpQN1
	 59R2OWwNUOtzX3fbn+3MxGrHe+BMwoZZ1JtBtSjG5ALBzsPcE34FKAo+RSCuhPXfax
	 mExhmxu7zXsO045AvhbZdb0U=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c4445512dso1730273f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407170; x=1793011970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmQ8DG056mR1G4V+Df41oNaFy9WQpehuB2fwvz+jBwo=;
        b=kcYCZ/SbKrxe2gpfEFm4re24wcg0hNNqLos08xoth5H7EE9qoxmXqtUiQ3/zZq/Rav
         /LepoAtETw1V5Bs8fd2gbdtAYjYIioFF7Actsq9mhVxUvjXlEMjexLipZKr/WeuGzeIo
         6k9jy+pwx/z6Ir4t9Cywe5sdokRQ66gMjA03mXcfLv3OLiUsrPro5cWrwvLmdNce9EJl
         lUDaYdRFr9tFq0lji8vn12IHQdE/NfXOs6RF95bpvA0ah8vGGIseGNrdzVF6LrFEh5gj
         5VP1CD4qK3nvFrSiOm9lvj0xsWgOhoOx2nkVnfhgj6BCMSMj1KvYoqORK506gHxqQlfP
         uh2g==
X-Forwarded-Encrypted: i=1; AKwUvBxqb71dFWylEaBFhfhxOUXODDoP8s7yGhx6/oDdYEJPCX1cRZ3UHNdr+4sioSIqlnAp3ZalX25w6LvOgXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxMf3POVlr2/xHxw2IXMKCS301YHwqQ2UkBTAlfEkJThW7HfmP
	eWJDsagaweKcjeBGFD9XYXH4aorHsdbcOErdyF8pqfAvT/R7LiIInmoT8iCCK6jXQ1JADu7+SZN
	lpG7RR+csZ1ndX+unU2+aLoybDV4I/xjdOIum6np9OT4tkhJ2vAexwCxvxfF1i787/ofxfBC0bL
	/u8Oobkw==
X-Gm-Gg: AYBFou1CDcGNetkFX1e0EczZD5pEnDqki1/XOC8C+tB9eF2ehhB2HeYTr8Tuv3tjIQU
	dRlDiRnJVsbSKdJlE/xpstAUxUdbZhEB2OdioSsKttsGurP1WIhdCfFjVFfqMX1kI2ywqc2R7GX
	a/W8O3QUGxkvHCRaVNKEfa41BzAjd7+UfMKJZ/I7vkEZAYHzGcubmNHtidynH2FSGIc0+udce2i
	cWaBg6j6lDFjmuv40bzgwmmUkYkOESQtalWBARfLBeRCVfz/gvcLg3/BgV82TN5dMLmmJMF+6om
	qGQnHAc68xf0Gtldvju41WbTWJ8JCv5BCiz6wmPqCQFzPREDcxH6w1B3OkvoUuWGUyTL1+henOo
	Jw2aOKSj7e7nV4sDqEeJ4BQ0dT2ecPP/jAb9mwLJq0tOIDcYmargkLe8vdOpnmlpvzYXK5unXEc
	4LHu1SUw5H92luvzmckbnQPCdkysPAdoj8NM9/NQFQEOl0OCOcl4qGVjBknLaMoX58aLZXMH4oW
	YJDNIdaE9hyDqzrQpXh3SoWbkLSG+VbI/E/vVgw
X-Received: by 2002:a05:6000:20c3:b0:48a:eeb7:5e5c with SMTP id ffacd0b85a97d-48e07f99f3fmr9466562f8f.32.1792407170043;
        Mon, 19 Oct 2026 03:52:50 -0700 (PDT)
X-Received: by 2002:a05:6000:20c3:b0:48a:eeb7:5e5c with SMTP id ffacd0b85a97d-48e07f99f3fmr9466543f8f.32.1792407169681;
        Mon, 19 Oct 2026 03:52:49 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm23238930f8f.55.2026.10.19.03.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:52:48 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Nowlin <dan.nowlin@intel.com>,
	Brett Creeley <brett.creeley@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	intel-wired-lan@lists.osuosl.org (moderated list:INTEL ETHERNET DRIVERS)
Subject: [PATCH 2/5] ice: retain the adapter throughout hardware initialization and teardown
Date: Mon, 19 Oct 2026 18:51:52 +0800
Message-ID: <20261019105155.3793063-3-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019105155.3793063-1-aaron.ma@canonical.com>
References: <20261019105155.3793063-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adapter-scoped synchronization must be available to Admin Queue users
from initial queue creation through the last teardown command. Probe
currently obtains its adapter reference only after hardware and package
initialization, and error cleanup and removal drop it before hardware
teardown.

Acquire the reference before either normal hardware initialization or
firmware recovery-mode initialization. Release it after hardware and
device cleanup, balancing recovery-mode probe failures and removal too.

This establishes the lifetime prerequisite for moving package ownership
exclusion from a module-global mutex to the shared adapter.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c | 31 +++++++++++++----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 164428ba116a0..ddebb28b2454f 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -5242,27 +5242,29 @@ ice_probe(struct pci_dev *pdev, const struct pci_device_id __always_unused *ent)
 		hw->debug_mask = debug;
 #endif
 
-	if (ice_is_recovery_mode(hw))
-		return ice_probe_recovery_mode(pf);
+	adapter = ice_adapter_get(pdev);
+	if (IS_ERR(adapter))
+		return PTR_ERR(adapter);
+	pf->adapter = adapter;
+
+	if (ice_is_recovery_mode(hw)) {
+		err = ice_probe_recovery_mode(pf);
+		if (err)
+			ice_adapter_put(pdev);
+		return err;
+	}
 
 	err = ice_init_hw(hw);
 	if (err) {
 		dev_err(dev, "ice_init_hw failed: %d\n", err);
-		return err;
+		goto unroll_adapter;
 	}
 
 	ice_init_dev_hw(pf);
 
-	adapter = ice_adapter_get(pdev);
-	if (IS_ERR(adapter)) {
-		err = PTR_ERR(adapter);
-		goto unroll_hw_init;
-	}
-	pf->adapter = adapter;
-
 	err = ice_init_dev(pf);
 	if (err)
-		goto unroll_adapter;
+		goto unroll_hw_init;
 
 	err = ice_init(pf);
 	if (err)
@@ -5287,12 +5289,12 @@ ice_probe(struct pci_dev *pdev, const struct pci_device_id __always_unused *ent)
 	ice_deinit(pf);
 unroll_dev_init:
 	need_dev_deinit = true;
-unroll_adapter:
-	ice_adapter_put(pdev);
 unroll_hw_init:
 	ice_deinit_hw(hw);
 	if (need_dev_deinit)
 		ice_deinit_dev(pf);
+unroll_adapter:
+	ice_adapter_put(pdev);
 	return err;
 }
 
@@ -5377,6 +5379,7 @@ static void ice_remove(struct pci_dev *pdev)
 		scoped_guard(devl, priv_to_devlink(pf)) {
 			ice_deinit_devlink(pf);
 		}
+		ice_adapter_put(pdev);
 		return;
 	}
 
@@ -5403,11 +5406,11 @@ static void ice_remove(struct pci_dev *pdev)
 	ice_setup_mc_magic_wake(pf);
 	ice_set_wake(pf);
 
-	ice_adapter_put(pdev);
 	ice_deinit_hw(&pf->hw);
 
 	ice_deinit_dev(pf);
 	ice_aq_cancel_waiting_tasks(pf);
+	ice_adapter_put(pdev);
 	set_bit(ICE_DOWN, pf->state);
 }
 
-- 
2.53.0

