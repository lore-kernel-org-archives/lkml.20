Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9E401A33
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763544; cv=none; b=mRIxkZ8UUDOmJlk3tuVfL2fJ5SSpgn/0WCOf4NEr4eEaVJBDZo4gMksgbwdkn+uatlycA/i3IrU8kngUitrpWv1WMSaaJnUHWKUCwtWhoVc1Vp2fp2E+7cmw+XpH+9jn3tWukXXYeUgRb7i58fS3361PWWYuer6Vi0rke1Pd1Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763544; c=relaxed/simple;
	bh=nDZpcBM59iD2w8vCeXG2T4euNTrpfmHmUN2xuDNmNTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CivzkaJLrCe7uGYAkRhhTdpBA6I9iWFM9Gj7v1GD+oHoYfG1AJfPL65MPJgBsPXvraF9UmKQsQOW8SSTMmrs4tXvwdrU2JlvyqnLEguY42B33TAMQZ/Vk2zcYT63+OtsBqlKC5343fAxe8Szf6HjHYsz86TWLyecYgZ7n2sHcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YucapLsB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YucapLsB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84830c774a0so2823422b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763541; x=1789368341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSjjPSQYL1+9wjdu1C6hiIJblaC71FvAqWZOYXHWgd0=;
        b=YucapLsBsWvW1Y9runFITT4xB0SNgMwfiRVG5ZvtPiGJP3OrXJvCX1Go3YXlnr/ej2
         ePKOxuGcbs1wiTKgt0DNuTlcG1+mDI/yG2hhIBHemaYriS5PY4f8MVPQoBRdUu9PniKW
         IuTiA7qHMgTTeo6FDO8l0e/yE7m8QXqbp4GgQUXM7lR6q07IvQOUATV+uIV2u9gSsxRm
         D5GFXCXlKj8D76N8EL7RD8qgP6OwF9G91hmSnDzcOxn+PU8KHG9WUqiONs/096IADAXR
         nmILo7Xhw7Bj7lXdyoORfFtJVXoDle22uhAVkVFTCIksCTv+6CqXxF+gY5PSfuTVCHjj
         SRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763541; x=1789368341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lSjjPSQYL1+9wjdu1C6hiIJblaC71FvAqWZOYXHWgd0=;
        b=lqwToZ5vty6hDAmec98UKFW6W3m4BP/+temGLIhOUi3amutQaTlAucEp+nmq3uWYfk
         /cNTiqiWUFT5UlCfA2ENHuXqcUGzPV+1aGlTqPoUjclWDvyEsisi3CuJvHhaUEmSNfYK
         PE+Pdjfkh66fi8AsZCOGybKpY8D6h/lyE+5OeRU2GVR1rS42SMV0nGDIF7UkB5u5OriW
         IYuAtWde13PT9ikAU1593XYUw81OgzVNQBgWYO2FcLHKFc406TS6T56CV3BW9TO2DPih
         vh373VBfLJOsjtu2NP45bP7bU5E5I2Cij2USoM0lvkBjTNfwtf756NigsEvbChGlMfDf
         yFhA==
X-Forwarded-Encrypted: i=1; AKwUvBy04tBZskqHIL/OjJ7y0xOx9MkmUHuCLmjepLIsfa/EmWFTdRxxqXurOv6AO0PHGi9OnriXwHTMAi+DxhM=@vger.kernel.org
X-Gm-Message-State: AFuF++kfhtGGGp2ZAjIbJmUfumkpVlfPNU0HlD6A61A8hPWwB2MhMNEB
	F5iTh0h0w1m6WuZi1BZ0aTAN+XRXuP8tVA3MoPazdJU+EuHwKuzCN2xe
X-Gm-Gg: AYBFou06zmV3p1kUkIUS2u+zDv+TEBmgASliRW309YWt2iVr2KI/jBAUA4vP5mZmx3H
	pWaltmjpM8wzNoMrM5Bx9GaDFXE4neO2EIF3v50pzENLIjXcnRvPYJ5IjyDih/picftb9mvgN4C
	nU0Zglj//Z+T7t7/arAdWGa0jSIIgWgZMSZik8TKZGyQ70T8eZ+SC+Xw3teKxiM6qolS388uaNT
	7eQG0bPssgl9DCYdXDeKtDYSFF5ljiqBTi9xQ+/F3RKzF0GyG0o2EEAtJ3g9oZKRRpD1zkCKrCE
	9TVG9eR/aWgqScbZ/QRhtenXKep9DWv1ErE0k25Daqr8vbPAVKcC1vf709M+IRKxU6Qh3xgrQP3
	9+LSWoagvjUE6Tere1y/a4BYfG4Rh9XUSmPxiEKRql5tpw+q4YJlsEW83ebSRfF8OOVMdTE4+3A
	pi1c2s71C/7qKbyaxwgeaPGgMCnefSgxx2qLsdO3CXbMwbEDpSOift3ymyDb2YtKzDD4yBDcxl4
	TiDRWaIrtPIow==
X-Received: by 2002:a05:6a21:48a:b0:3d0:c5c0:d9b3 with SMTP id adf61e73a8af0-3da39ff0220mr32935854637.18.1788763541389;
        Sun, 06 Sep 2026 23:45:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm17209594c88.8.2026.09.06.23.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:45:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] net: intel: fix typos in comments
Date: Mon,  7 Sep 2026 12:15:27 +0530
Message-ID: <20260907064528.6602-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064528.6602-1-hemanth.selam@gmail.com>
References: <20260907064528.6602-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/intel/i40e/i40e_common.c     | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c    | 2 +-
 drivers/net/ethernet/intel/ice/ice.h              | 2 +-
 drivers/net/ethernet/intel/ice/ice_main.c         | 2 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c        | 2 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_common.c b/drivers/net/ethernet/intel/i40e/i40e_common.c
index 8dadfef2c09f..026b35e5a000 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_common.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_common.c
@@ -676,7 +676,7 @@ int i40e_pf_reset(struct i40e_hw *hw)
 	grst_del = FIELD_GET(I40E_GLGEN_RSTCTL_GRSTDEL_MASK,
 			     rd32(hw, I40E_GLGEN_RSTCTL));
 
-	/* It can take upto 15 secs for GRST steady state.
+	/* It can take up to 15 secs for GRST steady state.
 	 * Bump it to 16 secs max to be safe.
 	 */
 	grst_del = grst_del * 20;
diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 3da9ec49cc74..ef9d1e78c16a 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@ -2614,7 +2614,7 @@ static u64 i40e_eeprom_test(struct net_device *netdev, u64 *data)
 	netif_info(pf, hw, netdev, "eeprom test\n");
 	*data = i40e_diag_eeprom_test(&pf->hw);
 
-	/* forcebly clear the NVM Update state machine */
+	/* forcibly clear the NVM Update state machine */
 	pf->hw.nvmupd_state = I40E_NVMUPD_STATE_INIT;
 
 	return *data;
diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index db3c7015c56c..e5f940d324dc 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -1105,7 +1105,7 @@ extern const struct xdp_metadata_ops ice_xdp_md_ops;
  * ice_is_dual - Check if given config is multi-NAC
  * @hw: pointer to HW structure
  *
- * Return: true if the device is running in mutli-NAC (Network
+ * Return: true if the device is running in multi-NAC (Network
  * Acceleration Complex) configuration variant, false otherwise
  * (always false for non-E825 devices).
  */
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index d88835482d3a..fe47ec0ba809 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -6202,7 +6202,7 @@ ice_fdb_del(struct ndmsg *ndm, __always_unused struct nlattr *tb[],
  *
  * Features that need fixing:
  *	Cannot simultaneously enable CTAG and STAG stripping and/or insertion.
- *	These are mutually exlusive as the VSI context cannot support multiple
+ *	These are mutually exclusive as the VSI context cannot support multiple
  *	VLAN ethertypes simultaneously for stripping and/or insertion. If this
  *	is not done, then default to clearing the requested STAG offload
  *	settings.
diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
index e04de0215596..9ef1aa66fa2b 100644
--- a/drivers/net/ethernet/intel/ice/ice_sriov.c
+++ b/drivers/net/ethernet/intel/ice/ice_sriov.c
@@ -924,7 +924,7 @@ static void ice_sriov_remap_vectors(struct ice_pf *pf, u16 restricted_id)
  * is correct etc. Then disable old mapping (MSI-X and queues registers), change
  * MSI-X and queues, rebuild VSI and enable new mapping.
  *
- * If it is possible (driver not binded to VF) try to remap also other VFs to
+ * If it is possible (driver not bound to VF) try to remap also other VFs to
  * linearize irqs register usage.
  */
 int ice_sriov_set_msix_vec_count(struct pci_dev *vf_dev, int msix_vec_count)
diff --git a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c b/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
index 7ce46b4b4821..7eb4acf59dab 100644
--- a/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
+++ b/drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c
@@ -3995,7 +3995,7 @@ static void ixgbevf_tx_olinfo_status(union ixgbe_adv_tx_desc *tx_desc,
 	if (tx_flags & IXGBE_TX_FLAGS_CSUM)
 		olinfo_status |= cpu_to_le32(IXGBE_ADVTXD_POPTS_TXSM);
 
-	/* enble IPv4 checksum for TSO */
+	/* enable IPv4 checksum for TSO */
 	if (tx_flags & IXGBE_TX_FLAGS_IPV4)
 		olinfo_status |= cpu_to_le32(IXGBE_ADVTXD_POPTS_IXSM);
 
-- 
2.48.1

