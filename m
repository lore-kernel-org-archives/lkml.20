Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA8476688
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522454; cv=none; b=IlQ7TuVCJa+fARmWC7wI7JByjUC7yn8AgLM0Z9mfkSy3C1oOESGCKyzf5h+7oX4TuVlOR1NJim0YpN6RC6cSTRt33HY7om3L1LTmW4nsS86p3uu8h/Xg5MUxaJfnxMQ4JvywV+hTvlDdWFKrYGe0cp6+K6bnxZv06b9ZHh9gOz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522454; c=relaxed/simple;
	bh=QGib8wXxLjphYUJnSM8tdtUUFiSLYSt2RBNSn7qs8Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8dNNLz7eJbV26LxgZ9MIYWmeQzSekawSKfY3FrZ1+Sg+QTXtapMLSAaZYfpbtT8rE0SOA8V5FSbBWJrKPaZN3yCeEH09zlDmzhSh3kPlJ8oQsPRZ8yEZAI7oYkD07es7RXxzRucCs/wAw66Qf6g2quBkWKgaG2Hv0gunWi8yKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctHjeasg; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctHjeasg"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1afdf98dfso566701eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522452; x=1789127252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfRYZuaFnkNVB/L+WVfkjL8Z4nHliPGglT6z3Y/oaNA=;
        b=ctHjeasgo7xuveBqwGS6whftpCt2w+v7aNjRaGZmIkK3iFpsKU0fb83obbkWmhkA1X
         JPPc+bfFJC/Dt+9SOpic8GcR/UEtNjWU343ch5D997OCeCaBKr7dOcoxyJ8OwTFHBob4
         fV/JTCY9QmfG0hJQMXWxt2urTKpIH9lUooHQNZD6x9XGg9ETVVCUzAi9XtId2pJisqyL
         BpBE5mzOdYJ5B1r+00Y5QBG7Nk5vn+stjscg00Toa6gDfUgS48DLOysl1NgYP6/Zunoa
         L5D6tjM2+GbIfwd7UoOkcZKovsxE+Ot5hQDdfMIFZLkv9Dz0rhxyPAMl3RQautXDDHRO
         PNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522452; x=1789127252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfRYZuaFnkNVB/L+WVfkjL8Z4nHliPGglT6z3Y/oaNA=;
        b=ErAYXQELFy5Oqbaad3Axt9bP87l7yf9LgFUrqPkviM1p8FOpVz1qjyThcwUuI8xmTl
         3ZyWeZF6bLZQcQn/nI81kzoP4GZSFi8C4NRPCTWQxmrKZPo3eGToXS3hFn3OrkqHxPOW
         uVkSqTZCYjwqhVH57Y86IP2AwK1uMI4r5LS/4lM0rbFoTbHWD8rD6/ZkIv4h5hN8wAHj
         xeh+j+y6J+Y5EEwjK2/2wQD6WJoXJ+93hiA4ZzwQVET0ofdPGGPjympGsBXhO1ucB8Lo
         KoxkhdOQaeAq8R0nLUyWTfKUtB7fQRc5YGEZ8Bklok7iY9S3daaF8CtSZzmdS/3Hvmu0
         Y4tw==
X-Gm-Message-State: AFuF++k4VM5vVWn8g2UoKlXlikMBdCfemLl0DZ+AoQkLHf3nWeoMjOZV
	P81a2NhLcv2yxqG9+mO950wWvd0897T7aYnrBYus132TZlp0usMk3XF9
X-Gm-Gg: AYBFou1B6BJhGE4Uq6SH2Cse+89nB8avHWW/O3hjWIJsvMnrX6FOkQp3uwjQJTlzG9l
	t4cI+AyTX++tmEgfYdrzhbS6AFba0HiN2pBxZqZoePrR9z/LJ1BH0tbWPNabtxOc5SNNIcNkcWT
	L4bjY8IMW4za6bLiTMidgFG8xh7laED251Xq3lgC+CuNTZD5UtgSWcd45pEiTbS55lnizbl1R/M
	eeDcdFXyEQMu+FCvB99/lUL5/+6OL6wUN8TlR2aX1UiA8VR/DRWC0HGwK+D7h3pMdlMfAKswT1Q
	FuayOTKHdOlv29KNXUfZouYYy7nfHihavq2eu0DE+v1mLrYuixeIer3flkhjQp5ZTZdwZ61kpvS
	dBH9F6ton8ENj6w3W2LHHLKE4WWWkiZZuz+9rnxLEjHlEclpQZQk28vrKx4J7Ucu5zJqz6hfVYz
	kcWeRLmznhuam+1xbcSmCo3no7i6FgUfoW3MshLPPNUbIkCvy2wSWARPAF80Mk/R678FTzyiQMx
	M0OFn2ZN4FIo3g=
X-Received: by 2002:a05:6820:290e:b0:6b1:4e36:fb80 with SMTP id 006d021491bc7-6b6fa4e066cmr4331480eaf.15.1788522451912;
        Fri, 04 Sep 2026 04:47:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339c0ec914sm6950891eec.31.2026.09.04.04.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:47:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH 1/2] wifi: iwlwifi: fix typos in comments
Date: Fri,  4 Sep 2026 17:17:21 +0530
Message-ID: <20260904114724.32518-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114724.32518-1-hemanth.selam@gmail.com>
References: <20260904114724.32518-1-hemanth.selam@gmail.com>
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
 drivers/net/wireless/intel/iwlwifi/fw/api/rs.h      | 2 +-
 drivers/net/wireless/intel/iwlwifi/iwl-trans.h      | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c   | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/time-event.h | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/utils.c      | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/api/rs.h b/drivers/net/wireless/intel/iwlwifi/fw/api/rs.h
index f1254546cc9d..dd24749f0431 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/api/rs.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/api/rs.h
@@ -772,7 +772,7 @@ enum {
 #define LQ_FLAG_RTS_BW_SIG_DYNAMIC      (2 << LQ_FLAG_RTS_BW_SIG_POS)
 
 /* Bit 6: (0) No dynamic BW selection (1) Allow dynamic BW selection
- * Dyanmic BW selection allows Tx with narrower BW then requested in rates
+ * Dynamic BW selection allows Tx with narrower BW then requested in rates
  */
 #define LQ_FLAG_DYNAMIC_BW_POS          6
 #define LQ_FLAG_DYNAMIC_BW_MSK          (1 << LQ_FLAG_DYNAMIC_BW_POS)
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
index c581cc8f5bcb..fcc19a4408bc 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
@@ -628,7 +628,7 @@ struct iwl_pc_data {
  * @tcm_error_event_table: address(es) of TCM error table(s)
  * @rcm_error_event_table: address(es) of RCM error table(s)
  * @error_event_table_tlv_status: bitmap that indicates what error table
- *	pointers was recevied via TLV. uses enum &iwl_error_event_table_status
+ *	pointers was received via TLV. uses enum &iwl_error_event_table_status
  * @internal_ini_cfg: internal debug cfg state. Uses &enum iwl_ini_cfg_state
  * @external_ini_cfg: external debug cfg state. Uses &enum iwl_ini_cfg_state
  * @fw_mon_cfg: debug buffer allocation configuration
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
index b2c5be22c293..0b0e296cb2fd 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c
@@ -782,7 +782,7 @@ static int iwl_mvm_mac_ctxt_cmd_ibss(struct iwl_mvm *mvm,
 				       MAC_FILTER_IN_PROBE_REQUEST |
 				       MAC_FILTER_ACCEPT_GRP);
 
-	/* cmd.ibss.beacon_time/cmd.ibss.beacon_tsf are curently ignored */
+	/* cmd.ibss.beacon_time/cmd.ibss.beacon_tsf are currently ignored */
 	cmd.ibss.bi = cpu_to_le32(vif->bss_conf.beacon_int);
 
 	/* TODO: Assumes that the beacon id == mac context id */
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/time-event.h b/drivers/net/wireless/intel/iwlwifi/mvm/time-event.h
index 3f8628cbd480..2a4403b50557 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/time-event.h
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/time-event.h
@@ -89,7 +89,7 @@ void iwl_mvm_protect_session(struct iwl_mvm *mvm,
  * This functions cancels the session protection which is an act of good
  * citizenship. If it is not needed any more it should be canceled because
  * the other bindings wait for the medium during that time.
- * This funtions doesn't sleep.
+ * This functions doesn't sleep.
  */
 void iwl_mvm_stop_session_protection(struct iwl_mvm *mvm,
 				      struct ieee80211_vif *vif);
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/utils.c b/drivers/net/wireless/intel/iwlwifi/mvm/utils.c
index 2fd4a9961145..958eb255250f 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/utils.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/utils.c
@@ -135,7 +135,7 @@ int iwl_mvm_send_cmd_status(struct iwl_mvm *mvm, struct iwl_host_cmd *cmd,
 }
 
 /*
- * We assume that the caller set the status to the sucess value
+ * We assume that the caller set the status to the success value
  */
 int _iwl_mvm_send_cmd_pdu_status(struct iwl_mvm *mvm, u32 id, u16 len,
 				 const void *data, u32 *status)
@@ -284,7 +284,7 @@ int iwl_mvm_send_lq_cmd(struct iwl_mvm *mvm, struct iwl_lq_cmd *lq)
  * @smps_request: The request to change the SMPS mode.
  * @link_id: for MLO link_id, otherwise 0 (deflink)
  *
- * Get a requst to change the SMPS mode,
+ * Get a request to change the SMPS mode,
  * and change it according to all other requests in the driver.
  */
 void iwl_mvm_update_smps(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
-- 
2.48.1

