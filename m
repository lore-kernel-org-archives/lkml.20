Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576855;
	b=2WUKlUBL8xoV8ko0hLQelZL/pItpazRWGcvwLDGoVo5H4TEAq60TbXo72vHOZhZixL8x
	 sYHdcQepjL1k+Dwf6agTvt0ADfBeG1616Th+5aCOAV5PFf/58+cPGwt+QoAxx5uGt9ZJ4
	 MZsmUbzUgm9j/joR+oebQZf7UqoeqJqistl7aboRvvOTgBvW1iqSB9ykht6CnJbZUpidC
	 n6f91TM5CRvg9ux0Z6DJopTpgLQyWw87P2mJsrSwp8vmfc0TJKvukp7MLs08TGB66/lqZ
	 1ETzT35j4CQiMcslEcm/wf0LwOqzmLvmkb7MvPHLd+t4GvuGVnRwa4ElouTLjUGyIfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VjEByB41Ih4tgNv6S4Ay7vXpDo2JBFqNUNi+LJeYuq8=;
	b=udIlri2QzxhvM5r9SDTZk9qhHrimkxjhfLrRl95qzvDgNKtArQmbEI8XRj1zgc9X2RaQ
	 Cr3zQNCvaFhCCz97MJ2yRosFnQ3/S2dCuETFsssRw175kcexirY7cSr3f4O2DfEoa38Mu
	 UQYfMZc9T8QTRxuTIj/9q2+VNl5Bjzi2OJpnUg4X6k1Tw0IserUKic87sbAyys3Fcj1o9
	 TlSOEWgYfubObh6Ik86HIjMPtTs/zwz0fcCWHXgck93hhHA1NOwLqemxUiDxXDyLfeNRj
	 a+Y3Xw8pSpiKrm3nrLDv2t4RduVNkO3W6f0O4cLEqu9eHX9hHZgFSmxk2Tmd5l/9Uxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=dyL4q9zk;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399AB606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399AB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=dyL4q9zk
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ab43af5e97so25799757b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793576851; x=1794181651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjEByB41Ih4tgNv6S4Ay7vXpDo2JBFqNUNi+LJeYuq8=;
        b=dyL4q9zk06aXWa0zDMqTQMuPbl8NGN1GWWLlFtoUQU8k03V3ogGMBmZLqcc6bp65dO
         M/TDrgEjuZEiL+x9w9e4sCIn6LtT4KMMEDbd0WJN1a8rSZPBtDkr3wsA9HqrZ/OFgdOZ
         a45RpyG2mFNJuZ+Ii833589gKi7WOZgIk8/79eLMFuFrVcL0FnnJtk4WM5VpDskEUB7M
         BXdMIc2EGBG0buSXJtAMF6IqODWN0oYGftf5GyYaT1viu586BdThj5gHpc9V05ohf9E0
         ylPj+rzVmM3BQvD1ACO+klDlUv49Z8qUW/sRhiUvVG5/mMVOgKGs2kV/mVhfLzHEMzgP
         hJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576851; x=1794181651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjEByB41Ih4tgNv6S4Ay7vXpDo2JBFqNUNi+LJeYuq8=;
        b=u9XNzltOD4hskI0peQJkj0Ndvxx0edK3dXdYh94VSC/NPfpVDl4dqqLTR5VZIDXvwX
         KjXgfCWTaMGoj6vh5ra3H21IDju2Fhxap62g2xZMLzlX+HUmm71YI41DIOm+4A6VbHY/
         vJpy75xOKtoWrXFwqMH0zYJwIKs3O5V/eLfKTWS5BDUAirfzOn5pXj4hJDnE1XV4NNP9
         W+99VmEO2N/xcP0SJ2rJTGVxWMv1nWMejJIIYh00mvFqiDbzWAD0/kcV+llzZaVAWpbG
         tkd6B7GkA0yRVr8bZ3jK5pgFGbSoNCK8P++AkfM/fb/NP2ZSIFGRgz6vN1V+txMDn+az
         d/8w==
X-Forwarded-Encrypted: i=1; AKwUvBzeJnzn8RtxuWCKoKHDaQkAOIfuLGKRvL49/msStWFVwO45aahcKAeBNRN2sU06LUSUyALibL4WqgjPtnw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqrGdol5iy7yLdbYhrPYdURlQGm2mRHOLI/45O+hKi+4HcdGbH
	IMmA2sUOURpH4MTjVMprI6KRGzH9u2LYW+2ucHayRKp//sy/Cp2Fuql5okx9tv7smkD5b/d/Bl7
	Oh1kROw==
X-Gm-Gg: AYBFou2aMi58nhi4+HgGpkgzCpGFZ3p23jp9LG7jyg/3VHZT+4Kukc2EOoPKIywdPMk
	UO4p2J0ZF8iCSF8dSGxqFhrH9kNCQ6cdgOyQOSGv9Z6F4nutWibGhIIiujAiKSglMtXHt80OZWe
	9JNrCgRrjB4CJHR609juJlbFJQN6WhTmSnSAt4La93dMCT2fbTcDexMo8GAYYeI4nf8vi4M+t5y
	qQ5dnF+MTJvEOOkDshXGHR1sE6iJTKk1RCQiR7Jh+P7eMTDVN/9sslOVW06/bZ5ZlqxGJJdoFE0
	QFXBgZ3guPE8EQZ+Sa9bpr1eAbcaW7rWlQdRcZRuF+q0TgbYAFa6JMnynr7zl9ch0yMaes/pHg1
	MLCh/Ervz8AkKeoxq9GP4to9awj16jYTkSVdrFxX7C9UxPB8T8K56i7dq32XiackedRvLOT9eof
	dD2hkS48hGWIGt/lul9Ke6Quyp5yj+DhW4tC8HQMPTkSfvTIBEKITyveYPhjeYFcoqOTm3VUoJb
	x2pR6OCE+qvxIZeVSRKkB1MAOI9hHaQCiZATvXYIF/YWSvP3E8iyuPMx+5RlpmYn0HoJDTl
X-Received: by 2002:a05:690c:e1cd:20b0:873:5c7b:c13a with SMTP id 00721157ae682-8b1c68bc542mr54116897b3.34.1793576851220;
        Sun, 01 Nov 2026 15:47:31 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71bd543sm43987527b3.45.2026.11.01.15.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 15:47:30 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH iwl-next] ixgbe: make EEPROM init_params() return void
Date: Mon,  2 Nov 2026 08:47:25 +0900
Message-Id: <20261101234725.1414173-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
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

All implementations of the EEPROM init_params() operation always
return 0, so the error checks on its return value in ixgbe_sw_init()
and the E610 NVM helpers never trigger.

Make init_params() return void and remove the dead checks.

Link: https://lore.kernel.org/all/8524c812-b659-4670-b370-35682aba2d2f@intel.com
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 .../net/ethernet/intel/ixgbe/ixgbe_common.c   |  4 +--
 .../net/ethernet/intel/ixgbe/ixgbe_common.h   |  2 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c | 29 +++++--------------
 drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h |  2 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |  5 +---
 drivers/net/ethernet/intel/ixgbe/ixgbe_type.h |  2 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_x540.c |  4 +--
 drivers/net/ethernet/intel/ixgbe/ixgbe_x540.h |  2 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c |  4 +--
 9 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
index 3ea6765f9c5d8..ab2c0818f2417 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.c
@@ -857,7 +857,7 @@ int ixgbe_led_off_generic(struct ixgbe_hw *hw, u32 index)
  *  Initializes the EEPROM parameters ixgbe_eeprom_info within the
  *  ixgbe_hw struct in order to set up EEPROM access.
  **/
-int ixgbe_init_eeprom_params_generic(struct ixgbe_hw *hw)
+void ixgbe_init_eeprom_params_generic(struct ixgbe_hw *hw)
 {
 	struct ixgbe_eeprom_info *eeprom = &hw->eeprom;
 	u32 eec;
@@ -895,8 +895,6 @@ int ixgbe_init_eeprom_params_generic(struct ixgbe_hw *hw)
 		hw_dbg(hw, "Eeprom params: type = %d, size = %d, address bits: %d\n",
 		       eeprom->type, eeprom->word_size, eeprom->address_bits);
 	}
-
-	return 0;
 }
 
 /**
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.h
index 6639069ad5283..8d4fd9074938b 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_common.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_common.h
@@ -25,7 +25,7 @@ int ixgbe_led_on_generic(struct ixgbe_hw *hw, u32 index);
 int ixgbe_led_off_generic(struct ixgbe_hw *hw, u32 index);
 int ixgbe_init_led_link_act_generic(struct ixgbe_hw *hw);
 
-int ixgbe_init_eeprom_params_generic(struct ixgbe_hw *hw);
+void ixgbe_init_eeprom_params_generic(struct ixgbe_hw *hw);
 int ixgbe_write_eeprom_generic(struct ixgbe_hw *hw, u16 offset, u16 data);
 int ixgbe_write_eeprom_buffer_bit_bang_generic(struct ixgbe_hw *hw, u16 offset,
 					       u16 words, u16 *data);
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
index 4d8ae5b56145a..eb20ef11f890b 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
@@ -2267,17 +2267,15 @@ int ixgbe_enter_lplu_e610(struct ixgbe_hw *hw)
  *
  * Initialize the EEPROM parameters ixgbe_eeprom_info within the ixgbe_hw
  * struct in order to set up EEPROM access.
- *
- * Return: the operation exit code.
  */
-int ixgbe_init_eeprom_params_e610(struct ixgbe_hw *hw)
+void ixgbe_init_eeprom_params_e610(struct ixgbe_hw *hw)
 {
 	struct ixgbe_eeprom_info *eeprom = &hw->eeprom;
 	u32 gens_stat;
 	u8 sr_size;
 
 	if (eeprom->type != ixgbe_eeprom_uninitialized)
-		return 0;
+		return;
 
 	eeprom->type = ixgbe_flash;
 
@@ -2289,8 +2287,6 @@ int ixgbe_init_eeprom_params_e610(struct ixgbe_hw *hw)
 
 	hw_dbg(hw, "Eeprom params: type = %d, size = %d\n", eeprom->type,
 	       eeprom->word_size);
-
-	return 0;
 }
 
 /**
@@ -3681,11 +3677,8 @@ int ixgbe_read_ee_aci_e610(struct ixgbe_hw *hw, u16 offset, u16 *data)
 {
 	int err;
 
-	if (hw->eeprom.type == ixgbe_eeprom_uninitialized) {
-		err = hw->eeprom.ops.init_params(hw);
-		if (err)
-			return err;
-	}
+	if (hw->eeprom.type == ixgbe_eeprom_uninitialized)
+		hw->eeprom.ops.init_params(hw);
 
 	err = ixgbe_acquire_nvm(hw, LIBIE_AQC_RES_ACCESS_READ);
 	if (err)
@@ -3714,11 +3707,8 @@ int ixgbe_read_ee_aci_buffer_e610(struct ixgbe_hw *hw, u16 offset,
 {
 	int err;
 
-	if (hw->eeprom.type == ixgbe_eeprom_uninitialized) {
-		err = hw->eeprom.ops.init_params(hw);
-		if (err)
-			return err;
-	}
+	if (hw->eeprom.type == ixgbe_eeprom_uninitialized)
+		hw->eeprom.ops.init_params(hw);
 
 	err = ixgbe_acquire_nvm(hw, LIBIE_AQC_RES_ACCESS_READ);
 	if (err)
@@ -3747,11 +3737,8 @@ int ixgbe_validate_eeprom_checksum_e610(struct ixgbe_hw *hw, u16 *checksum_val)
 {
 	int err;
 
-	if (hw->eeprom.type == ixgbe_eeprom_uninitialized) {
-		err = hw->eeprom.ops.init_params(hw);
-		if (err)
-			return err;
-	}
+	if (hw->eeprom.type == ixgbe_eeprom_uninitialized)
+		hw->eeprom.ops.init_params(hw);
 
 	err = ixgbe_nvm_validate_checksum(hw);
 	if (err)
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h
index 2cb76a3d30ae6..2bc1210756fe1 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h
@@ -58,7 +58,7 @@ int ixgbe_setup_phy_link_e610(struct ixgbe_hw *hw);
 int ixgbe_setup_eee_e610(struct ixgbe_hw *hw, bool enable_eee);
 int ixgbe_set_phy_power_e610(struct ixgbe_hw *hw, bool on);
 int ixgbe_enter_lplu_e610(struct ixgbe_hw *hw);
-int ixgbe_init_eeprom_params_e610(struct ixgbe_hw *hw);
+void ixgbe_init_eeprom_params_e610(struct ixgbe_hw *hw);
 int ixgbe_aci_get_netlist_node(struct ixgbe_hw *hw,
 			       struct ixgbe_aci_cmd_get_link_topo *cmd,
 			       u8 *node_part_number, u16 *node_handle);
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index f91856498eb2d..b337e2d4cf1c3 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -7058,10 +7058,7 @@ static int ixgbe_sw_init(struct ixgbe_adapter *adapter,
 	adapter->tx_work_limit = IXGBE_DEFAULT_TX_WORK;
 
 	/* initialize eeprom parameters */
-	if (hw->eeprom.ops.init_params(hw)) {
-		e_dev_err("EEPROM initialization failed\n");
-		return -EIO;
-	}
+	hw->eeprom.ops.init_params(hw);
 
 	/* PF holds first pool slot */
 	set_bit(0, adapter->fwd_bitmask);
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h
index a461b6542f96b..48a74c89a799c 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h
@@ -3476,7 +3476,7 @@ struct ixgbe_hw;
 
 /* Function pointer table */
 struct ixgbe_eeprom_operations {
-	int (*init_params)(struct ixgbe_hw *);
+	void (*init_params)(struct ixgbe_hw *hw);
 	int (*read)(struct ixgbe_hw *, u16, u16 *);
 	int (*read_buffer)(struct ixgbe_hw *, u16, u16, u16 *);
 	int (*write)(struct ixgbe_hw *, u16, u16);
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.c
index e67e2feb045b3..d77c6efd800f2 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.c
@@ -191,7 +191,7 @@ int ixgbe_start_hw_X540(struct ixgbe_hw *hw)
  *  Initializes the EEPROM parameters ixgbe_eeprom_info within the
  *  ixgbe_hw struct in order to set up EEPROM access.
  **/
-int ixgbe_init_eeprom_params_X540(struct ixgbe_hw *hw)
+void ixgbe_init_eeprom_params_X540(struct ixgbe_hw *hw)
 {
 	struct ixgbe_eeprom_info *eeprom = &hw->eeprom;
 
@@ -210,8 +210,6 @@ int ixgbe_init_eeprom_params_X540(struct ixgbe_hw *hw)
 		hw_dbg(hw, "Eeprom params: type = %d, size = %d\n",
 		       eeprom->type, eeprom->word_size);
 	}
-
-	return 0;
 }
 
 /**
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.h
index 6ed360c5b605b..282d10b7d4733 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_x540.h
@@ -19,6 +19,6 @@ int ixgbe_blink_led_stop_X540(struct ixgbe_hw *hw, u32 index);
 int ixgbe_acquire_swfw_sync_X540(struct ixgbe_hw *hw, u32 mask);
 void ixgbe_release_swfw_sync_X540(struct ixgbe_hw *hw, u32 mask);
 void ixgbe_init_swfw_sync_X540(struct ixgbe_hw *hw);
-int ixgbe_init_eeprom_params_X540(struct ixgbe_hw *hw);
+void ixgbe_init_eeprom_params_X540(struct ixgbe_hw *hw);
 
 #endif /* _IXGBE_X540_H_ */
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
index 4a0ccbf448a2a..a8d300e3f471a 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
@@ -629,7 +629,7 @@ static int ixgbe_fc_autoneg_fw(struct ixgbe_hw *hw)
  *  Initializes the EEPROM parameters ixgbe_eeprom_info within the
  *  ixgbe_hw struct in order to set up EEPROM access.
  **/
-static int ixgbe_init_eeprom_params_X550(struct ixgbe_hw *hw)
+static void ixgbe_init_eeprom_params_X550(struct ixgbe_hw *hw)
 {
 	struct ixgbe_eeprom_info *eeprom = &hw->eeprom;
 
@@ -648,8 +648,6 @@ static int ixgbe_init_eeprom_params_X550(struct ixgbe_hw *hw)
 		hw_dbg(hw, "Eeprom params: type = %d, size = %d\n",
 		       eeprom->type, eeprom->word_size);
 	}
-
-	return 0;
 }
 
 /**
-- 
2.34.1

