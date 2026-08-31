Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5043264CE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181433; cv=none; b=iTf8KIPdAvZr4eHUMrOatgGEiNmlguTjhApuLkngeJAMF/8N33hyX6Z9m0eaNpFrtKPyKYwMOL4GCco4b4LyH/O/VVPSRDAykQdKxrPeBvU1toVlVcFF3n2u302ZEYJzyplXsAZHH34DWEDhtro7hJMzERC7j1lHxByzM7tEc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181433; c=relaxed/simple;
	bh=V//q0jtU9XTTbMl5NPi6UcTLSaqr0Evx37P5sMiaSJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c542yedSYc99bTXskQ2x8lLNLeT97yGqZzfvA4jGzyfb+EcRmareSZHrLBxibmfSctZGADzGug8ISRoEADZDVCmqC9KXkj7xaTsHUE+pxNvjRi6dC5WU/QEw0Av4TnJ9Qd0MyYWQDtIgGJ8mrB1M8rCZHwkRnDV+YkauMzHIE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxKPQpjb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxKPQpjb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6fec3c1adso4039135ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181430; x=1788786230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIkEaTsAou/6x2ZpYenzr6Kjhqg+r06MkNAF+XMgBd8=;
        b=DxKPQpjbegPTpugshIwSDtMDpy+IWy8STxYwpvacmGquHLR3FStiBIvcOAovzr1eXB
         84RtL43V9rcMH5cSz93AMxFIwjgHMntKi6hGF+++1uO6e+UuwAvwkt0Le8ROMDNTH3Jd
         uXBueXeEjQu9qegDp0KfqwLsuEm/kleGtLwizmlEHYBQwUAWpy/IB5dicayxU13Ywi+h
         lmV+Q7N/CsZ9JYKvBF14qR0GrZ4DA2MlLqLcka86xOCbelviVNEDIbshSa1yF2bpaTvs
         cchAMIdPx92qiC9OhTWLzk+chWiTiW31dQ/62pqnrzguWGAQ9WrAvAjIscy8DKEj/aba
         tQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181430; x=1788786230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIkEaTsAou/6x2ZpYenzr6Kjhqg+r06MkNAF+XMgBd8=;
        b=M7oDEsNLXf5zG8MPJFwqTVPGasqa6RaN3FSl1W1sTUDPJNRZhxFnupMMIBFtd8c680
         rw4oyiYFjbAHd8IC42I4gF42LKjrmH7f1NlBsPwSnOoh9V5cyHRnY1yG1SARVM0gHfjQ
         2FHe8bsje2oUU0W6nuveBxWY9Hdh4Si3Y3ZisVU6cllOuGQWoY2oP6aCQ6b8lmQt0s9q
         OmyeuDQlsDO36Bss4Lvf3ZNFsVTm72bBrnzcPy5IF2fjNXtKhEnEWTqa1kofZvMNakjF
         WWEKVYDR1F5mmewxyKOBL7qtIr0/poOQj/faYObG6arUzzLGMCwpSzsIXMtD2McHAFVR
         UOfg==
X-Forwarded-Encrypted: i=1; AKwUvBywfTvrC3siHCBMkQs0X6cL0tBY6ba3B5iF/0/TRJ1UcIBM4iQXRv8xdrafkw3ZOl6lvIq7bYEomxQ9UKA=@vger.kernel.org
X-Gm-Message-State: AFuF++mpAT6JAxY4RBW+T77gHVdiQMprzFkdPeUwCupCmZTo17qDeD7u
	WFIpTBaKR2URsLiQVT5IGdRtbzGGf8/I7Oy7/heIqQGtgVLQ6NDKiPki
X-Gm-Gg: AYBFou02mr+39jx2F2uQEynYRIbHEl+mrFYTh4vfNTUMtmnHKIae99/hKN3GCbnPGnh
	fOHry+Nh2sAaznCa6WEYk/go20kSYms+Pt/L53HK5bH62sQcOPot9cW89ByP2x/9j1OJEHc11+z
	0ktyJJQd+IuSQM2b6F7fNk5DJe94Ycb8ko/RkpNxunWv3YQotmsECI/m1lG/vhvM3x31WyOwu/p
	iiQY2xeyECA8tSKQJa0vfkrHXJaYwaYSWieKav1Wz3UjyAGKPZQ8bHo4ggS5Sfy44f82lKc86OO
	0mH1COOuJOp9fO3zEapSRaEEFzjBKWHiU2sQvkBbdsGJYJilN0kBTF+1BUzM1wsK1Fhf8KR1y7O
	5EKcXui2mh9P88KclipuZL6cxYn/STEmgC3JScmJPkmG82hzriUouBgAFdjQ6k5iHDUZai+BEvn
	PD55auY7HIFNm7MP39I4RdwAo2o8Ns/iYFjTnHKqBuD9qyXpYo+lNarOND23cfjA/SfcoYkATDb
	DYe9KQyJ52u3UV3zM8lwx3mHmV3
X-Received: by 2002:a17:903:1106:b0:2d6:f09a:da1f with SMTP id d9443c01a7336-2d74e0bab6emr217965675ad.4.1788181429982;
        Mon, 31 Aug 2026 06:03:49 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bf283sm32567749eec.8.2026.08.31.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:03:49 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Nika Krasnova <nika@nikableh.moe>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Mark Pearson <markpearson@lenovo.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless v2 2/3] wifi: iwlwifi: pcie: deselect the product reset mode at probe
Date: Mon, 31 Aug 2026 18:33:31 +0530
Message-ID: <20260831130332.323549-3-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831130332.323549-1-navonjohnlukose@gmail.com>
References: <20260831130332.323549-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode that iwl_trans_pcie_set_product_reset() selects lives in the
platform's ACPI namespace, not in the device, and nothing deselects it on
the product-reset path. iwl_trans_pcie_removal_wk() selects it, evaluates
_RST via _PRR and removes the device; the rescan re-probes, and probe only
reads the mode back for the log rather than clearing it, so it is still
selected. (A later removal with a lesser mode does pass enable=false, but
that is the path that does not need it.) It is plain namespace state - on
the platform I have it is a named integer written by the vendor DSM and
read back by the reset method - so it survives S3 and s2idle. Neither the
driver nor _RST clears it.

That has a consequence. _RST branches on the mode variable, does not
clear it, and iwl_trans_pcie_reset() takes the caller's word for which
reset to run. So after any product reset the next escalation can do the
wrong thing: iwl_trans_determine_restart_mode() asks for
IWL_RESET_MODE_FUNC_RESET on rung four of the ladder, no CSME involved,
iwl_trans_pcie_removal_wk() skips the Bluetooth teardown because the
mode it was passed is not IWL_RESET_MODE_PROD_RESET, tries to deselect,
and if the device has stopped answering by then that deselect fails
silently - the DSM is gated on AML reading the device's PCI ID out of
config space. iwl_trans_pcie_call_reset() then runs a full product reset,
Bluetooth kill GPIO and all, with the Bluetooth function still bound.

Deselect at probe, after the two calls that already read the mode and
the previous reset's status back for the log - so the inherited mode is
still what gets logged. That bounds the window to a single driver
lifetime.

Note that on discrete devices this is not literally a write of zero:
iwl_trans_pcie_set_product_reset() also sets EN_WIFI_FLR and EN_BT_OFF_ON
unconditionally for !integrated, so the write is 0x6. EN_PROD_RESET is the
bit the platform's reset method branches on, and that is the one being
cleared.

Cc: stable@vger.kernel.org
Fixes: 9673c35486d4 ("wifi: iwlwifi: implement product reset for TOP errors")
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Patch 3 also depends on this: it is the only thing that clears the mode if
the rescan after a recovery reset does not bring the device back. That
dependency runs patch 3 -> patch 2, not the other way about, so this one
stands alone as a fix and is tagged for stable while patch 3 is not.

 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index c6a771e..df89fb3 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -4256,6 +4256,8 @@ int iwl_pci_gen1_2_probe(struct pci_dev *pdev,
 
 	iwl_trans_pcie_check_product_reset_status(pdev);
 	iwl_trans_pcie_check_product_reset_mode(pdev);
+	/* a previous trans may have left the mode selected */
+	iwl_trans_pcie_set_product_reset(pdev, false, mac_cfg->integrated);
 
 	/* set the things we know so far for the grab NIC access */
 	iwl_trans_set_info(iwl_trans, &info);
-- 
2.55.0

