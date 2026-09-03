Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60FA3909A5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421656; cv=none; b=DMIk5g+0J33+F4IcCkUl5Dwu5RcWXo+Wz7euIrpr5ysPvkgxC3LrkLkW+TR7c84abgqqSgV/NndcWrM2QCX5SNEzLZrIYOp89j8A7lG0TYW2QoJrhtjA+Abo/a1wHKzS0G7SKeU4PoD3ijfv8Yh/E9qKS1LHmzdlPGWBkIGYLPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421656; c=relaxed/simple;
	bh=WSoJwlIhdcVAUExJcWDP3T0G3Ur8i8N17uAVaL3cxnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOP2Uy7vhIomeupZTxjSpIPw7fZHcpsRgoTtO2Vkse6aCXDiaZtRSjWP0/yjh2h5+pQRmxiUSyrUEq18YVZzUls127Eo/PAYiAIXeBFvs2r1YFUOliDNjBq0z57f9/zRQw86uICKzv4ifSrqX0XirCwp95QeMln39hLe3DrLLXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=LXwRqazc; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="LXwRqazc"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0D6C24293A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788421653;
	bh=5nc9gEzX4k4ArZqgbiRbJBtB4XzQnqrHMx6w0QnIx1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LXwRqazc2lQwPP2vH5bo0Q3sPj2vvqAd8xz8y0DH9m/8MxB1wPXD5vXkt2u7+tmVG
	 82keE0XeAOKGewLSDRxUFboJTkLIzKDQq+rWtkozelFg0neGVFjnSB5eR7Khx3VvKW
	 XhKn6cRUJ6iBaTyl+a2DfOyybvouuOUAcDmU+MxNNeHO2R6TxbkxI1NbnjnlJBHrWz
	 XKwWsZrqwgUTuvBZSYKZRMFFCyOceFDbhtvvVuBLar8HXQ3Z8YYR/+C+pz9WjPFxFw
	 qqXyyWK8/RcVwKwKy8A0st7esZ4KhLIvOxhacg/6A/Wa12E0kC1rJMZiUA8QcM54Ld
	 bzznJL506n1wTiXiAmQQseqZsBOYQ6j3p6jjEPS/8fN6Dgtbbqgf4AKELKZXEKejmj
	 tsOhWnHFoRXaXYQJcmD1/CxgkLUF9FrnNTozyEbu55CSCT2KHaO4jT6rUjeDWix0ed
	 dH/BJ7rXOcAFZiv0oJ9qijTzwgNAnObzPonwl6U26aTBEEntwhgHPwmylEo6DQU4is
	 +UdqH2iHYLj+FxOI3XW29qZfVmKzfTKJ/41hLnJCBKKINGdC5lchZxSTdlCtC5Ayb+
	 96TqV1Iby9WvWrI4AGZSQEvgGuDis+R7MeRkT7niMKel/Ant5IBJg2RYYLsyA2tDTZ
	 fPOgwgjLXz6XGNK27qV2veqI=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so4030688a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421651; x=1789026451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nc9gEzX4k4ArZqgbiRbJBtB4XzQnqrHMx6w0QnIx1U=;
        b=O4ek9dDdBfLkeadVn4IrIvf+lUGzmweLBnzErLCsp9oDgVe/9YZCkfu5sKa6zCyY8W
         GBStUWVF//InuzJ2ZtcCI7kYoOJUouEhJEwY3HL486EOmYHQaM3T/ojCejyDIGvPoMvP
         kIRreoSBssyoJ71oZmnG3aA7pEfulC1XOgeSkQs3hxaTfue4wyjMtNmSNWcaXU1GO8jv
         ngG7kkxgIbu1cGiMshsA72pb26z5+lxe2OFn39drrQPs8YkrB7XL2qzTKI62DkotxalK
         11MVUcfS5sc0hHR6BEIQ8tcV1eJWTPg27yG5fO34d6aYwIfxWrYWNwTXFsrdM/q3kjoX
         c8Mw==
X-Forwarded-Encrypted: i=1; AKwUvBz596XWcx6CAccXkA30jX1trJgXow1HWlXysgMa8p6660VVprzV0dg2myakIyq3Jp3qf33Xexui8PboDw4=@vger.kernel.org
X-Gm-Message-State: AFuF++lsmem04HYgWo8GPpEGwSYQcstJ9MJDPf6ObIbKj3uayYGo1DEN
	ibGcQIMrUR4h8LtrZru56GZrLdDlKg6ADnehOr44IQRzeHUZU41MeE0xBXGaULk3aEEh7RfYa+S
	/n7GpneALQc/keBca5Sd1VsNnbrP5vBJFFLay5Rs8j93gp6xP4ZazsrXwONH99n8guIk7Hytcpq
	UX4oH0jw==
X-Gm-Gg: AYBFou15nS45QRuePiNDKLVVnyNE6pFla2zaU0Dw97D7Gs1FSPLXWt6Xh3KwsYcIWrd
	ln2TppDit4ij93nmLBWg6bd8DdANhRS+SkwZCEZXJaEYlEiPixewhMl0b50lctxp/noPQkzWJGM
	ptuHijuFTK0mDR9+RD1qQjt++tAeDocMgaauWOGHmPj5urAF85+2BN95rkeDEu87LYTj8z7xzsb
	w2J9WHFFXp/c9JdoOM2WAhvo69awTIdCOnzl55qFqSOgCPhdK5iDTeUm0Qg231pcN05/DcNIesA
	IUUwZ1jECRXl87HAjrTLeavhhK7zuxM0enQEMXeQdtczXq7rHj5QaohSeH+EhMYj+t5qS7fKBD5
	48Ngd3/r6Bdizv0gj/xvazRwjoKe2qZgMFc139tcJxhDmEG6YuybA1Lwuy5grBKhcQ8mHsYHffb
	yfGNBoOOi/HYHdHdrzr2JmoqIwtLl7HaeS7aZixQ==
X-Received: by 2002:a17:90a:ec8c:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-39aee04ace5mr17634619a91.16.1788421651491;
        Thu, 03 Sep 2026 00:47:31 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8c:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-39aee04ace5mr17634557a91.16.1788421651053;
        Thu, 03 Sep 2026 00:47:31 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62a54f6sm2991223a91.1.2026.09.03.00.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:47:30 -0700 (PDT)
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
Subject: [PATCH 2/2] ice: clear Flow Director entries before reset cleanup
Date: Thu,  3 Sep 2026 15:47:06 +0800
Message-ID: <20260903074706.602087-2-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903074706.602087-1-aaron.ma@canonical.com>
References: <20260903074706.602087-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flow Director profiles retain handles to generic flow entries. Reset calls
ice_clear_hw_tbls() to free those entries, but leaves the Flow Director
handles unchanged until replay replaces them.

If rebuild fails before replay completes, later driver removal follows a
stale handle and dereferences a freed flow entry in ice_flow_rem_entry().
KASAN reports a wild access to list poison from
ice_fdir_erase_flow_from_hw().

The failure is reported as:

  KASAN: maybe wild-memory-access in range [0xdead000000000108-...]
  RIP: ice_flow_rem_entry+0xaf/0x170 [ice]
  ice_fdir_erase_flow_from_hw+0x1ee/0x420 [ice]

Clear the Flow Director handles before the hardware tables free their
entries. A successful replay installs new handles, while a failed rebuild
leaves them invalid for later cleanup.

Fixes: 148beb612031 ("ice: Initialize Flow Director resources")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice.h          |  1 +
 .../net/ethernet/intel/ice/ice_ethtool_fdir.c | 21 +++++++++++++++++++
 drivers/net/ethernet/intel/ice/ice_main.c     |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index db3c7015c56c4..4739ff882b9ec 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -1029,6 +1029,7 @@ ice_get_fdir_fltr_ids(struct ice_hw *hw, struct ethtool_rxnfc *cmd,
 		      u32 *rule_locs);
 void ice_fdir_rem_adq_chnl(struct ice_hw *hw, u16 vsi_idx);
 void ice_fdir_release_flows(struct ice_hw *hw);
+void ice_fdir_clear_flow_handles(struct ice_hw *hw);
 void ice_fdir_replay_flows(struct ice_hw *hw);
 void ice_fdir_replay_fltrs(struct ice_pf *pf);
 int ice_fdir_create_dflt_rules(struct ice_pf *pf);
diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c b/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
index aceec184e89b2..faa16b5a12c0d 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c
@@ -428,6 +428,27 @@ void ice_fdir_release_flows(struct ice_hw *hw)
 		ice_fdir_erase_flow_from_hw(hw, ICE_BLK_FD, flow);
 }
 
+/**
+ * ice_fdir_clear_flow_handles - clear handles freed during reset
+ * @hw: pointer to HW instance
+ */
+void ice_fdir_clear_flow_handles(struct ice_hw *hw)
+{
+	int flow;
+
+	for (flow = 0; flow < ICE_FLTR_PTYPE_MAX; flow++) {
+		struct ice_fd_hw_prof *prof = hw->fdir_prof[flow];
+		int tun, i;
+
+		if (!prof)
+			continue;
+
+		for (tun = 0; tun < ICE_FD_HW_SEG_MAX; tun++)
+			for (i = 0; i < prof->cnt; i++)
+				prof->entry_h[i][tun] = 0;
+	}
+}
+
 /**
  * ice_fdir_replay_flows - replay HW Flow Director filter info
  * @hw: pointer to HW instance
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index a97a1941cec6a..7aa1235447310 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -601,6 +601,8 @@ ice_prepare_for_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
 		netif_device_detach(vsi->netdev);
 skip:
 
+	if (hw->fdir_prof)
+		ice_fdir_clear_flow_handles(hw);
 	/* clear SW filtering DB */
 	ice_clear_hw_tbls(hw);
 	/* disable the VSIs and their queues that are not already DOWN */
-- 
2.43.0

