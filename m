Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879806;
	b=hDgG0SFErzLrnM3HX7oybg+9LT4k4mmMcSdSEQfAjTs8tf6IZeeJNoHJLlq61ryua6mG
	 OuphZIyKw3J+XSV20+FuWjfaqRctFV+5ikTlFWadUWljVXBiYyyxQx5Dl3rl4Cv9APdqy
	 9tfQrCj5XTQqRIJecIhO9MSWODvfKjuDjaqMz0nNjnuW9aGb3TpBotKTwZo6FW39y5SrD
	 jgQln6eIEeZyzuSqPZ4zSp/ts4Ca6sayAgvg4aC1TM8XtIla5OoOzzsS84EgEwWTNB95i
	 7qzDST1O2mtZaDAprrK8CC6DJBhus0BFKbtXTeBoA+zLI9KAua3tuFcLA3xeVRR95ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879806;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=erNoA3lOUo0ZYtOb9qkmx1CJe4mtUfobD6S4pgfjrbM=;
	b=fFwiGEP38oqLYd1QzBXgORqAUm9RJAeJRNENUZguqLgrCkKBaI2g5mSQV6eTJCIhVm3s
	 vWyDEue4w75MhEYhuu47/YUoP4hrxjuLr++DKdkFi5d2tI5YfyTA/2vPVxAs5xes6W9PP
	 HVzu0a/KbNOYuxGWE6lTOnPgbITlu7Lnu5uw3ys+Fj+ZBRADA+iwYM5oy6RpPt/gkE1ef
	 CK8L0YBJNsmdfwwniXaLzpnvPmjqV2vAMFAKMeR9y47+X04VhMO4v7I3xHczb3bts0arB
	 lTH/DJ/fvsd78zgd7ted3/ebhHwQj53s6QvF5nvX/TLCWHaQKsBuZ2Pj7aMHDiG1aMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="V2tx/T3w";
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B509606A31C;
	Tue, 17 Nov 2026 01:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B509606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V2tx/T3w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=V2tx/T3wnghATcjH2lGigflaRwhcNVL1iiDyEYzjX4GUyl7Hu8HKD9TNzu7LOxRIoHfXxIUkXkobn
	 JgPxZNFHw/EJvPhSG/cUYgocTiPRuejf5ZirzqNecaPW48p87bYS08srJrXQjqjiC7LUSZUujEqspU
	 6HzbWlV8c7MbIMoY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76afbb12ca52-04812;
	Tue, 17 Nov 2026 09:43:08 +0800 (CST)
X-RM-TRANSID:2ee76afbb12ca52-04812
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96afbb12ab7a-9e119;
	Tue, 17 Nov 2026 09:43:08 +0800 (CST)
X-RM-TRANSID:2ee96afbb12ab7a-9e119
From: luoyifan <luoyifan@cmss.chinamobile.com>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	Luo Yifan <luoyifan@cmss.chinamobile.com>
Subject: [PATCH] wifi: nxpwifi: validate TID in ADDBA and DELBA command responses
Date: Tue, 17 Nov 2026 09:43:10 +0800
Message-Id: <20261117014311.19627-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.24.4
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

From: Luo Yifan <luoyifan@cmss.chinamobile.com>

The TID field in ADDBA and DELBA management frames is four bits wide, so a
peer can put any value in the range 0-15 in it.  The firmware forwards the
parsed frames to the driver as command responses and events, and
nxpwifi_ret_11n_delba(), nxpwifi_ret_11n_addba_req() and
nxpwifi_11n_delete_ba_stream() use that TID without validating it.

The TID is then used to index arrays that only have MAX_NUM_TID (8)
entries: rx_reorder_tbl_ptr[], rx_reorder_tbl_lock[],
tx_ba_stream_tbl_ptr[], tx_ba_stream_tbl_lock[] and aggr_prio_tbl[].  A
TID in the range 8-15 therefore reads or writes past the end of these
arrays.  In particular, nxpwifi_del_ba_tbl() takes a spinlock at
priv->tx_ba_stream_tbl_lock[tid] and nxpwifi_get_ba_tbl() walks a list at
priv->tx_ba_stream_tbl_ptr[tid], so a peer can make the driver operate on
unrelated memory.

Reject out-of-range TIDs at the entry of the three handlers.  This covers
the DELBA response, the ADDBA response and the DELBA event paths; the RX
reorder data path has its own checks.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 drivers/net/wireless/nxp/nxpwifi/11n.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11n.c b/drivers/net/wireless/nxp/nxpwifi/11n.c
index 9eae93c3b8..56aadbb540 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11n.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11n.c
@@ -99,6 +99,12 @@ int nxpwifi_ret_11n_delba(struct nxpwifi_private *priv,
 	u16 del_ba_param_set = le16_to_cpu(del_ba->del_ba_param_set);
 
 	tid = del_ba_param_set >> DELBA_TID_POS;
+	if (tid >= MAX_NUM_TID) {
+		nxpwifi_dbg(priv->adapter, ERROR,
+			    "DELBA: invalid tid %d\n", tid);
+		return -EINVAL;
+	}
+
 	if (del_ba->del_result == BA_RESULT_SUCCESS) {
 		nxpwifi_del_ba_tbl(priv, tid, del_ba->peer_mac_addr,
 				   TYPE_DELBA_SENT,
@@ -143,6 +149,11 @@ int nxpwifi_ret_11n_addba_req(struct nxpwifi_private *priv,
 			& SSN_MASK);
 
 	tid = u16_get_bits(block_ack_param_set, IEEE80211_ADDBA_PARAM_TID_MASK);
+	if (tid >= MAX_NUM_TID) {
+		nxpwifi_dbg(priv->adapter, ERROR,
+			    "ADDBA RSP: invalid tid %d\n", tid);
+		return -EINVAL;
+	}
 
 	tid_down = nxpwifi_wmm_downgrade_tid(priv, tid);
 	ra_list = nxpwifi_wmm_get_ralist_node(priv, tid_down,
@@ -626,6 +637,11 @@ void nxpwifi_11n_delete_ba_stream(struct nxpwifi_private *priv, u8 *del_ba)
 	int tid;
 
 	tid = del_ba_param_set >> DELBA_TID_POS;
+	if (tid >= MAX_NUM_TID) {
+		nxpwifi_dbg(priv->adapter, ERROR,
+			    "DELBA event: invalid tid %d\n", tid);
+		return;
+	}
 
 	nxpwifi_del_ba_tbl(priv, tid, cmd_del_ba->peer_mac_addr,
 			   TYPE_DELBA_RECEIVE, INITIATOR_BIT(del_ba_param_set));
-- 
2.24.4



