Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56074480338
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364123; cv=none; b=YrI5e0Jd4+UeJuK5hZBt7ywmU2vqRQnIXu6zFX4gjMpN+GqK6Sqy45+TZmuG4jyTas737sxs2axP3JeKKpBXiYOmggYqRVAbNOG9zXA2MK0pdk7UPntTIBnzBXhDw+ai4Y2OIKxMb0CpQEZwlrRpc9YB9jCaw24r9Nzop0aHtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364123; c=relaxed/simple;
	bh=Am5V6nrOjsB6Eu0oH+SlaPHYK1524n4Tq6KBCE5kOkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFJXXpAE6i8XvzbWx0V8WIGDl7P5vNlZtrYv5fzXqJu2/VemMgjmWZ0NlC5APbkrrR3hbFBJ9anrWYTc9lZ1znm2NAfreaX9Zqsaxhh5dKxWoK8PUZgGQN178exKqxIe1azOHWb9kJC4GuQHDgRQIF40FvSqM7onX2/xBFYc7rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk752xKL; arc=none smtp.client-ip=74.125.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk752xKL"
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6a406d7afa8so1727562a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364084; x=1791968884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dSd8UfCb1J2hG8yzHAzc315d3lw6cUEHsW18/sU0DU=;
        b=Qk752xKL3V8IgELgOtY9cgdRaNbSdo/Nvtg+P0Qo0w9H9Pizf3Mtjj/VaWls2B00zS
         1tghPhAoHMWxsYjScRs++fifcjNQPoBoBdpSETfqEmIWYWY2vgjgj7aJs7s1Q7p85w/G
         nLQmOctGsglRFrqx5PnfV4rW2LFdYowFoD06jbR9+8T5MHTRG+Jk4sRDFQyCkq4OhVIj
         eg2iWbqlU9Vhwtp2l3o9p9GLfczlDeqKMoQ5uXsuZeCAr8u+So3fI4mnYDkMcGmd5Flj
         n0KHVCjIWrER50rbQimCm0VO0rZVbwaQgcdbsd/g8P3S12NSTZPUUfKhJr9KGkg3JreB
         DOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364084; x=1791968884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3dSd8UfCb1J2hG8yzHAzc315d3lw6cUEHsW18/sU0DU=;
        b=MZVUKzd1VFeabGbj/my1OMFRljPlwj33R/BuelXroDcyuwFNRQqBZwTBlsCxWfGuGs
         W3lgRsx5uYvComyU/hybS6tEb2BtWQR5zRHsUJ4lFY1c78goB72KSzw+7QV27xV7/d9F
         0oqB3K+EjEYyZhak/0zcSxGT+uvb/2FHnMXt/uZlzHK+93M1/tsK/WeFOUiYZSTDIbDu
         OsvYAXeKh7MH/6SqNt9HU+tgbp9Wh9FfjFgOleyZkN5scnZJuzFfaMwyyvJfgKjV8n7u
         zr9t15PCRuo1riJ5YuKZ3V4WSFoWv+yh0S70457ykdNH+tBNgWTlOT9SAiUNUlmCm40Y
         zpvA==
X-Forwarded-Encrypted: i=1; AKwUvBzx2Keve3pU5JBwfZE2ypx4FHhZWZ7uzbnWPXr8sglx4aebGNt7d7OcU1dI9rJM1c6SHhqSGwtZYLHPaxY=@vger.kernel.org
X-Gm-Message-State: AFuF++n0da5I5F5kw5nqP2eng3kOPp7BsJGqjaau0FLlB3bscKjWwiAm
	3WBl0o1YtHsXTe8E2U3TD15jysc5Pe0DoPBWiEJvDynC/F1Lx1zbTuBb
X-Gm-Gg: AYBFou2kcOCLySlrN95v70m/6+YnP6fyxTLzLpSg5cHxwcs5u+AQVTGMYK1PpjEcbjk
	JHD4r10oKPWZD3xKhq8G0dO/lCwRI7LWft1xaNH25oIj30JkIEE6L2i9HAW3a/x7t1dFOGPNplv
	29XNdFJNyyC0DVJ3sJbtZtiXprQUu3tznS2JBR/kvQdyV5hlm1POvlEFG8mtCGXsYtn/1VR0rsS
	ZHKKn7sGmgOdRxIXoT3nYNrnm8kKdyomghIET7X6yQR3MMuLc6LhBr053IdXkCtJ60wkYQGuVPF
	ZKPs+eJb/5XT+2zWM8htb++RItq01xV0JMqMsisdGUcY1WeowY8Vm8XBqCeiwdD8c+6gkF21/F8
	IRVZm2NyBnxNs84JvPzYokJymrjySRybj6atuyeqE9xzQXBn4UVtP2RO9lIb9rySj5DZt7U9q/o
	R20wsbfZuJj0AQ/1+KM3O7AdNedx/nTrCgsudLM5ax3yW3ajDXMKvzrYbh9lTWdIrq2/+X/mF7
X-Received: by 2002:a17:906:f586:b0:c26:19e3:e97f with SMTP id a640c23a62f3a-c317c098f26mr144416466b.31.1791364084196;
        Wed, 07 Oct 2026 02:08:04 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm3975319f8f.33.2026.10.07.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:08:03 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: unwind cast mess and remove phy_stat struct
Date: Wed,  7 Oct 2026 11:07:36 +0200
Message-ID: <20261007090736.277636-3-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007090736.277636-1-timo.joannin@gmail.com>
References: <20261007090736.277636-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the real struct type all the way through
the call chain to remove redundant casts to and from u8 *.

Remove redundant phy_stat struct, along with the dead function
prototype rtl8723b_query_rx_phy_status() which referenced it.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   |  7 +++----
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c |  7 ++++---
 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 5 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index bf2479c01873..c85194c8fe67 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -95,7 +95,7 @@ static s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
 
 static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 				      struct odm_phy_info *phy_info,
-				      u8 *phy_status,
+				      struct rtl8723bs_phy_status_rpt *phy_sta_rpt,
 				      struct odm_packet_info *pkt_info)
 {
 	u8 i;
@@ -105,8 +105,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct rtl8723bs_phy_status_rpt *phy_sta_rpt =
-		(struct rtl8723bs_phy_status_rpt *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
@@ -384,7 +382,8 @@ static void odm_Process_RSSIForDM(
 
 /*  Endianness before calling this API */
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info)
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info)
 {
 
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ae010cae9dd7..21182a880da3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -57,7 +57,8 @@ struct rtl8723bs_phy_status_rpt {
 };
 
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info);
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info);
 
 enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 304fda3a3b5c..a62b845c69f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -73,7 +73,7 @@ static void update_recvframe_attrib(struct adapter *padapter,
  *precvframe->u.hdr.rx_data should be ready!
  */
 static void update_recvframe_phyinfo(union recv_frame *precvframe,
-				     struct phy_stat *pphy_status)
+				     struct rtl8723bs_phy_status_rpt *pphy_status)
 {
 	struct adapter *padapter = precvframe->u.hdr.adapter;
 	struct rx_pkt_attrib *pattrib = &precvframe->u.hdr.attrib;
@@ -125,7 +125,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	pkt_info.data_rate = pattrib->data_rate;
 
 	odm_phy_status_query(&p_hal_data->odmpriv, p_phy_info,
-			   (u8 *)pphy_status, &(pkt_info));
+			   pphy_status, &(pkt_info));
 	if (psta)
 		psta->rssi = pattrib->phy_info.RecvSignalPower;
 	precvframe->u.hdr.psta = NULL;
@@ -317,7 +317,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				if (pattrib->pkt_rpt_type == NORMAL_RX) { /* Normal rx packet */
 					if (pattrib->physt)
-						update_recvframe_phyinfo(precvframe, (struct phy_stat *)ptr);
+						update_recvframe_phyinfo(precvframe,
+							(struct rtl8723bs_phy_status_rpt *)ptr);
 
 					rtw_recv_entry(precvframe);
 				} else if (pattrib->pkt_rpt_type == C2H_PACKET) {
diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index b63625ab4e45..072e2b5f6129 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -9,24 +9,6 @@
 
 #define MAX_RECVBUF_SZ (10240)
 
-struct phy_stat {
-	unsigned int phydw0;
-
-	unsigned int phydw1;
-
-	unsigned int phydw2;
-
-	unsigned int phydw3;
-
-	unsigned int phydw4;
-
-	unsigned int phydw5;
-
-	unsigned int phydw6;
-
-	unsigned int phydw7;
-};
-
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index e9ebecb224a6..2f230e2d27a4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -84,7 +84,6 @@ struct rxreport_8723b {
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter);
 void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
-void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
 void rtl8723b_read_chip_version(struct adapter *padapter);
-- 
2.55.0

