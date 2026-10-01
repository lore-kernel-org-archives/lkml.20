Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED0C3C5833
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869918; cv=none; b=gGcGLoJ1oHZo3DQE+gyt2UWdGHu1XH/hEhcgvCmJFUZ+D3WdZ5hTze1bKP1AlrYLB/d7KVopRml/6Dh5aV/OWeKn8NYtAK0lvlNfw9o4hInDXlobHQXHKyEhHZiOe90XeSdBzae0piBLbOLo9DU9lcidFlM8nd/K4gxX/MSp9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869918; c=relaxed/simple;
	bh=8D4KfYrVlVXwyqWnK/YbBls8DmHeg530/bdJqD/KZn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5vS51U3lGOTDge8JPs3t73LO1l0Ha3SbVZlizAYYThOvOjXCCn+eyU7qBGp0jXj09U+tapjv886ggJHYv+3DvPw3uhnbpBemViaGhXUkYIkB5qqKZpGnj4X9hglSn3diK18BJir8IUSCQ+uNhsOhzhUcOFNCIhxBSIzJMZPoX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFs3tEK2; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFs3tEK2"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b00a9147bso587115f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869915; x=1791474715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXDrZW8Yth+9+duqV7J2Csa/w7pQ2E6AflQjaMeQxP8=;
        b=jFs3tEK2RN23ERhJ0zx396nKZU+qlSng/S82rlwDro2ExKz/wh9pof6fFkSu/AUY43
         Bz/g0yIhlT4dq5+g9XY/ls6plnbq/QG2UTuTKjUctALbU1/3n6bp6N+T/4ASl0gmkrXk
         8CSGBnfhNWYTPWTEUOTVd6NI/NawRseJYtX0rDni52Koh3R2uAjIP2mXX6GKNNa7NhyX
         s4txPRYKVn8bmTrhCAUEo319ehKO844WDGvt+drhDhJOx0jZ4FMXyLTeuuKGDq60SkAM
         oZwHnmXTttF0URNBVNkeCOKZScfdBIk6bqJ3XyAu4YPY8bfbW7HYWa5khhCIFRjcxPfy
         e8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869915; x=1791474715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXDrZW8Yth+9+duqV7J2Csa/w7pQ2E6AflQjaMeQxP8=;
        b=SutgNjeUAx5xqBVP4/8QBWM7481R///AvQe5edE7IFwtqCWNMxH6sp/bhtmhb/+Yn0
         +Zp6HdOCmF8hno3xtPkSjQ50KugwrV+eXyWTooD85ZXw2H0cMPCWatkE03DOcIAsy91a
         3qMLFyRoL+q2uFEybO283HOwqz2VUXAzJ2Z1LxxD/j7HsdM0zX84swjMhAUxFci3Z4rd
         qPa1hekjkQY3NnmSq3LX8/OvWjZxzAzkl/6mW02FjBIYnzGjIK/leUiLQoqZFegHEIT8
         HqmR1r4ju/iNnXg/mZi6hCn7RyFpIxcQelAG9W0KwzLX5L1Cism30Pmr6NrL8uO1C3BK
         Jdvg==
X-Forwarded-Encrypted: i=1; AKwUvBxqWF7cG+mOtnD2BXZFQpVp5E281pHPP4JDQ47ZhFLroSejG+iRx1Gy3CqhTFzGOogr8jjbxRPR9ExI84Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMk2zc0k9rUR9yuC/YXwdtDcP8BGJabDgwmUFkJaialTdHGjXJ
	3K6l6+/A4lWJDR2d1/GGag6WBzHAIIIaPro4CiBV3biJ7OacZepDlAwg
X-Gm-Gg: AYBFou1QUXQOD5V1bbNglsL4r17jIBHfAAb16LZa3sOOKitXe3+gjD2TSg5LNbS2lQD
	nN3gSpfagYRHQawNNQat9i4aIW9eVbVCHEv4oz0j3ykMlcHRXyNUzPL6mhyNKj7i+/I3MQ6BBqx
	BW6FT5gtYwmtIJOX0K2JQPDx9tf1bUsqCrAFH7rmNe+WujWyOABjyDRDUz3ls02m7R12p9/Xb+J
	AI8OcqtgQ8h7JIfWTefKed3pUSrZNzoo+w4186VDWOjQSkhYVeU28KSpUkzUtLfBBMMCluHpCmL
	V1c0YoDK55R1rF5KsRnNEyT3qy3K4eHDJ1VLQW25rpOG9VvpIZx39EwcINrizhNtKDiffI+GHn5
	aHMFkkYv9upn0QaLfh0cdU1Bby7/IkWP5LWMgR7is6QZwUtgO68/is6HdvyOyxOE+Rtl3VQzHuP
	PCIFEE/z+O4I4Go3Y9DjkYJSNF9EWq71pbXOriDGrnuvG4H7IRVZOFpZRHcD/I2WJsgtuA
X-Received: by 2002:a5d:6f1b:0:b0:48b:26c:8cc with SMTP id ffacd0b85a97d-48b12716e36mr46781f8f.27.1790869914694;
        Thu, 01 Oct 2026 08:51:54 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff96dsm6878545f8f.8.2026.10.01.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:51:54 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	m.steinmoetzger@gmail.com,
	atharvmargur@gmail.com,
	straube.linux@gmail.com,
	andriy.shevchenko@intel.com,
	s9430939@naver.com,
	qstrydom0@gmail.com,
	dev.lmmrtns@gmail.com,
	khomenkov@mailbox.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Thu,  1 Oct 2026 17:51:34 +0200
Message-ID: <20261001155134.159481-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct identifier references the 8192CD chip while being in a
rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
while being generally reserved for typedef identifiers.

Rename the struct to rtl8723bs_phy_status_rpt
across the rtl8723bs codebase to accurately
reflect the driver and clean up the naming.

Additionally, propagate the real structure type all the way
through the call chain to remove redundant casts to and from u8 *.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through the call chain to remove u8 * casting.

 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   | 6 +++---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   | 5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 34b0369a7936..c85194c8fe67 100644
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
@@ -105,7 +105,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
@@ -383,7 +382,8 @@ static void odm_Process_RSSIForDM(
 
 /*  Endianness before calling this API */
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info)
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info)
 {
 
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ca3380328a72..21182a880da3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -18,7 +18,7 @@ struct phy_rx_agc_info_t {
 	#endif
 };
 
-struct phy_status_rpt_8192cd_t {
+struct rtl8723bs_phy_status_rpt {
 	struct phy_rx_agc_info_t path_agc[2];
 	u8 ch_corr[2];
 	u8 cck_sig_qual_ofdm_pwdb_all;
@@ -57,7 +57,8 @@ struct phy_status_rpt_8192cd_t {
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
-- 
2.55.0

