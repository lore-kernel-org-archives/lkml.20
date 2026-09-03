Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F167D3876C7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421653; cv=none; b=slr5WwUEEDOzA8M5HWtn/F5C5FoqcPSVN0jJCbwUQKzljIfilxH3rGPbdmtt8WJhUDOxo/0aNH+l1zfqEzQFtBB6m856CQt159wDWznEHfiZW7qHn71SXAbS3H9HNA21DxvfYSc3/ZccUaUNxZNFbg4XPyU5ZzlZ+gHv8v75wlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421653; c=relaxed/simple;
	bh=k5U4shbqXbgtvBujpCTrlH6oLnwb0LssgszpCcCUEFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WoFNkw1D8TqCqKuUvTCydJjdQ6hce9Riq6U88T42Up0Io3Puie9natbyhS1LFNX6wMnE73BHXxPhhkiKvVgTz2RuppM7mjjFR3oPPV+EetqtPyFt2jYnak7/DCYYg7N8xixS381X+KAlqyt+85tkTd+bM1uHVX1yT4i+ISHjjxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=fB2uTmj6; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="fB2uTmj6"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6BCDF4293B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788421648;
	bh=PUZRPUihB4/zYB1wxGPC0vA0+5hiy7QBITAZAVWHgWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=fB2uTmj6mXFTTWDoJNRA/4cXiwj0uIeGyY7m8sN0TxHoEImnzNZW6+6ZUh2zhrPnM
	 gOmJPRaRPQL0OxAcn2D7ZYZEUOPvZL0ivBS68wKW5URlzhwpEse+jA2XzcRWsGLz21
	 gmNNfNlSF3r/HnZFNE11fD6FB5hZSoMOghPQyqc3ncF0tNdR4XCjhTKDuAfR2x01A4
	 gO242QeE24Qo88+ooY5UKysW2lLT4IP+ZSsyzK+65mdhxugv5tNetRBYWvdQ0TCk/j
	 Wx+vqWX4KhwkXpFs7O/qg4yTMV6f63qVa50+D0L0p9oLRjb/C/jtJMl2HLz2iAFvqE
	 XOPMH5IzNlLwtBS2pJi6Tsrv4k3+UKA34vaF9WzLzvUm6JPNznMuxkfJRuPePDNFpj
	 +aA2clF1/PijHPWCqEsVmf0A/TYr8ECaU+BeuWyB4QS6U9hELUXNB/miIZo9OwALjh
	 del0SFN/0n84k7JVJI8kzM/1kqeAnwvVZHCO0zKq6Sn9RLljWLsSx3Vw5JccprfrnD
	 0oqyM/IQ1fihUT2S2Wml5oJ+Rwc5gPIvAZzPnrrDv5jofKxiIaiX9WnDYj0VMWbuUb
	 qk+6LdTcBWAtuKZF7C9ZcE8+7tDpHYbHQYx8dQsKZoY9wlTj7aoAnwvF8xxXh99AAS
	 AsCAONvOOTjtqp0US/v9MvMg=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2899709a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421647; x=1789026447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUZRPUihB4/zYB1wxGPC0vA0+5hiy7QBITAZAVWHgWA=;
        b=OZW7bBerrEa8//Ryd9jbzFNBsYgk77bU9sLawcimGorosbkCs5z8sZmideC623RIKk
         XolqV6lLs1O69GMRim9j6M4+6QMapnbkRzAryvgWNXDtqC96Uxv2L9i4CyzAZBVci+bk
         7i6qW89LFpLUUlAXk8MYSaPx84YGRW3sFrvWU1Ro9x1ofqKYJ6mxDOW2L2sI488QfX9g
         H0BBW305yz0IbiZBLLVGDCONK4D+rZVRGqoY9l7TuxUeQi7QI6ZWQockOUv2oK3TnLSs
         QDZgqmSg1ZOxfSpXXN6qtSa/GncFEyqTSk/uut6iiAO4ko51vGi1w3yMzBUWF5yhE9U2
         +vYA==
X-Forwarded-Encrypted: i=1; AKwUvBxSCjuttillNmyDyeUA7nMKCTfI07vIJJmxW6cWgg6Sb3+EV4bEgsbfsrRj4VMyL+vxIV0wAyp9jog9nRs=@vger.kernel.org
X-Gm-Message-State: AFuF++n9fdkgfV582D5e8DOTohJDp2ibtExvO0daqlVsqrGykBF1xuPw
	ScKkNMxsitY/o5TyWT3gbV3gwuQgnWVNaHMUfBhL3DHK2f+BFoB2r06FcwSdIzeXrqi5OV33D1I
	cqr1BtukJEYlFqbeLiGuspWwDT+s/04+7fDXnxzp6U83vkUfeCvfNxyfim+Ys+EyZ5aPjQ0/3Wi
	ZDQPE4Eg==
X-Gm-Gg: AYBFou0ysdIQc2RBJHKt2RKvLE1Nr/+GUTYWysASE0DIRGpZBANDFvxLFj/qcxL5woB
	naq1ymVuEuFMD0kwAfsG7DTomxLHHHHKP1P/2adN0NFX4YmeJyF8i25FeiFxF+x7lGCdFP25YdY
	I1FDwypm5Tfb3kc/Qcyq1qmA7XEEf9nPKK/c1PzZzLB/M+pNc9RAzNQVO0ISbtSqO3oLuMs0Z8j
	IxksiG/lMRsdM/j5tIOEtaGL5hmZ3/w5H3ls8Eo5z+LboPp2lt6fuLJUXzyAx6oaFz4pM6PB5YC
	S5Nt5/DAqqpyR1sf7c6l48LUz3KaZeVDph5Ir7lDlVS+Zmws35BESDoRgwkn5DBp+v7xPEqjDn3
	hfuyHnoT0XKj8vTz4EsErrDCbdXabB/8O9tr6wbleIiQ2uR93zyIHMqmojEwp+cwyLXeSB3wEtj
	PicrFXamYWKn19z2msWzhSDoRTys366cbZIJhheg==
X-Received: by 2002:a17:90b:4a8e:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39aedf73060mr14440444a91.8.1788421646800;
        Thu, 03 Sep 2026 00:47:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39aedf73060mr14440335a91.8.1788421646219;
        Thu, 03 Sep 2026 00:47:26 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62a54f6sm2991223a91.1.2026.09.03.00.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:47:25 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Henry Tieman <henry.w.tieman@intel.com>,
	intel-wired-lan@lists.osuosl.org (moderated list:INTEL ETHERNET DRIVERS)
Subject: [PATCH 1/2] ice: restore DDP state during PFR recovery
Date: Thu,  3 Sep 2026 15:47:05 +0800
Message-ID: <20260903074706.602087-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware package and switch recipes are shared by all PFs of an
adapter. However, each PF rebuilds independently after system resume. The
resulting package downloads and recipe updates can interleave, causing
firmware timeouts and leaving interfaces unusable.

PFR also clears package-derived firmware state on affected devices. The
existing PFR path only rebuilds the driver's block tables, so VLAN recipe
programming can fail after the reset.

The failure is reported as:

  ice 0000:04:00.0: Update pkg failed: err -5
  ice 0000:04:00.0: package load failed, -12
  ice 0000:04:00.0: Rebuild failed, unload and reload driver

This was observed on an Intel E810-XXV-2 adapter (PCI ID 8086:159b,
revision 02) with NVM package 1.0.0.18 and ICE OS Default DDP package
1.3.43.0.

Serialize rebuilds across PFs of the same adapter, while allowing each PFR
to complete independently. Reload the DDP package from its cached copy and
restore the default DVM recipes before rebuilding the remaining PF state.
Abort recovery if either operation fails.

Fixes: 462acf6aca85 ("ice: Enable DDP package download")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice_adapter.c  |  2 ++
 drivers/net/ethernet/intel/ice/ice_adapter.h  |  3 ++
 drivers/net/ethernet/intel/ice/ice_main.c     | 33 ++++++++++++++-----
 .../net/ethernet/intel/ice/ice_vlan_mode.c    |  2 +-
 .../net/ethernet/intel/ice/ice_vlan_mode.h    |  1 +
 5 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.c b/drivers/net/ethernet/intel/ice/ice_adapter.c
index 2dc3629d6d0f6..7de9223e971a7 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.c
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.c
@@ -64,6 +64,7 @@ static struct ice_adapter *ice_adapter_new(struct pci_dev *pdev)
 	spin_lock_init(&adapter->txq_ctx_lock);
 	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
 		mutex_init(&adapter->cpi_phy_lock[i]);
+	mutex_init(&adapter->rebuild_lock);
 	refcount_set(&adapter->refcount, 1);
 
 	mutex_init(&adapter->ports.lock);
@@ -77,6 +78,7 @@ static void ice_adapter_free(struct ice_adapter *adapter)
 	WARN_ON(!list_empty(&adapter->ports.ports));
 	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
 		mutex_destroy(&adapter->cpi_phy_lock[i]);
+	mutex_destroy(&adapter->rebuild_lock);
 	mutex_destroy(&adapter->ports.lock);
 
 	kfree(adapter);
diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.h b/drivers/net/ethernet/intel/ice/ice_adapter.h
index 4f695f32da3d8..f9265de973efc 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.h
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.h
@@ -37,6 +37,7 @@ struct ice_port_list {
  * @cpi_phy_lock: Per-PHY mutex serializing CPI REQ/ACK transactions.
  *               Index 0 = PHY0, index 1 = PHY1. Used on E825C devices.
  * @ctrl_pf: Control PF of the adapter
+ * @rebuild_lock: serialize PFR recovery across PFs of the same adapter
  * @ports: Ports list
  * @index: 64-bit index cached for collision detection on 32bit systems
  */
@@ -48,6 +49,8 @@ struct ice_adapter {
 	spinlock_t txq_ctx_lock;
 	/* Serialize CPI REQ/ACK transactions per PHY (E825C only) */
 	struct mutex cpi_phy_lock[ICE_E825_MAX_PHYS];
+	/* Serialize PFR recovery touching shared FW global state */
+	struct mutex rebuild_lock;
 
 	struct ice_pf *ctrl_pf;
 	struct ice_port_list ports;
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index d88835482d3aa..a97a1941cec6a 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -659,7 +659,9 @@ static void ice_do_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
 	 */
 	if (reset_type == ICE_RESET_PFR) {
 		pf->pfr_count++;
+		mutex_lock(&pf->adapter->rebuild_lock);
 		ice_rebuild(pf, reset_type);
+		mutex_unlock(&pf->adapter->rebuild_lock);
 		clear_bit(ICE_PREPARED_FOR_RESET, pf->state);
 		clear_bit(ICE_PFR_REQ, pf->state);
 		wake_up(&pf->reset_wait_queue);
@@ -704,7 +706,9 @@ static void ice_reset_subtask(struct ice_pf *pf)
 		} else {
 			/* done with reset. start rebuild */
 			pf->hw.reset_ongoing = false;
+			mutex_lock(&pf->adapter->rebuild_lock);
 			ice_rebuild(pf, reset_type);
+			mutex_unlock(&pf->adapter->rebuild_lock);
 			/* clear bit to resume normal operations, but
 			 * ICE_NEEDS_RESTART bit is set in case rebuild failed
 			 */
@@ -7674,14 +7678,27 @@ static void ice_rebuild(struct ice_pf *pf, enum ice_reset_req reset_type)
 		goto err_init_ctrlq;
 	}
 
-	/* if DDP was previously loaded successfully */
-	if (!ice_is_safe_mode(pf)) {
-		/* reload the SW DB of filter tables */
-		if (reset_type == ICE_RESET_PFR)
-			ice_fill_blk_tbls(hw);
-		else
-			/* Reload DDP Package after CORER/GLOBR reset */
-			ice_load_pkg(NULL, pf);
+	if (!ice_is_safe_mode(pf) && reset_type == ICE_RESET_PFR) {
+		enum ice_ddp_state state;
+
+		state = ice_init_pkg(hw, hw->pkg_copy, hw->pkg_size);
+		ice_log_pkg_init(hw, state);
+		if (!ice_is_init_pkg_successful(state))
+			goto err_init_ctrlq;
+	} else if (!ice_is_safe_mode(pf)) {
+		/* Reload DDP Package after CORER/GLOBR reset */
+		ice_load_pkg(NULL, pf);
+	}
+
+	/* PFR can lose DVM recipes after system suspend. */
+	if (!ice_is_safe_mode(pf) && reset_type == ICE_RESET_PFR &&
+	    ice_is_dvm_ena(hw)) {
+		err = ice_dvm_update_dflt_recipes(hw);
+		if (err) {
+			dev_err(dev, "failed to restore default DVM recipes: %d\n",
+				err);
+			goto err_init_ctrlq;
+		}
 	}
 
 	err = ice_clear_pf_cfg(hw);
diff --git a/drivers/net/ethernet/intel/ice/ice_vlan_mode.c b/drivers/net/ethernet/intel/ice/ice_vlan_mode.c
index fb526cb847764..58fb191903a75 100644
--- a/drivers/net/ethernet/intel/ice/ice_vlan_mode.c
+++ b/drivers/net/ethernet/intel/ice/ice_vlan_mode.c
@@ -240,7 +240,7 @@ static struct ice_update_recipe_lkup_idx_params ice_dvm_dflt_recipes[] = {
  * ice_dvm_update_dflt_recipes - update default switch recipes in DVM
  * @hw: hardware structure used to update the recipes
  */
-static int ice_dvm_update_dflt_recipes(struct ice_hw *hw)
+int ice_dvm_update_dflt_recipes(struct ice_hw *hw)
 {
 	unsigned long i;
 
diff --git a/drivers/net/ethernet/intel/ice/ice_vlan_mode.h b/drivers/net/ethernet/intel/ice/ice_vlan_mode.h
index a0fb743d08e20..5dc705435f56a 100644
--- a/drivers/net/ethernet/intel/ice/ice_vlan_mode.h
+++ b/drivers/net/ethernet/intel/ice/ice_vlan_mode.h
@@ -8,6 +8,7 @@ struct ice_hw;
 
 bool ice_is_dvm_ena(struct ice_hw *hw);
 int ice_set_vlan_mode(struct ice_hw *hw);
+int ice_dvm_update_dflt_recipes(struct ice_hw *hw);
 void ice_post_pkg_dwnld_vlan_mode_cfg(struct ice_hw *hw);
 
 #endif /* _ICE_VLAN_MODE_H */
-- 
2.43.0

