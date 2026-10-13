Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1600D54489B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922546; cv=none; b=EkfqrwLsbAF7iX1QU2j0BZnKoyP9zuwfi0pYC9nFMo6n9nBtIKVUjCxltofDbpsrwr26mZORhVL3HSV9S3aabZsOvnb0QNj2vG7I0P76KLpAc3BhbmNXBV0sEYxA2ehodr3CPzDxTd28LeOS8q5+Dal8fZnr99DCVZlUM7Yq9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922546; c=relaxed/simple;
	bh=Z8Bu+KL+bj0mGq2kIrvhdlj8hmMhTjmJBRCxms5B6UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msmluEhj+RPvCDN0bbrKjiypS/svgLlGdt6aLQL7Fzz4BzPUe/OaFAMiBJonBqnhsrZMEVXuhKfnOF4XvEIDVu/4ZXiq29FuDfaDTR+x9pV+yG8s1dKL5g//nxQzE3lDyzoTkdrfI9K/5cNkgJzK/LouGfLqnXfo0K3+w2IX/U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OteVz3ht; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OteVz3ht"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8266c388b67so2886285a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922543; x=1792527343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOYnbfYGvBBLrVRDfsaZ7wyCdHgMKhFfjmPtx3cZKDo=;
        b=OteVz3htMZgOqWmypg6/+49wox8J9Es3i3PVOZhO0y5LzhkZ9BlHIeJZ0vhM2hAsZS
         myZLI+H+cEI9QhJVzjzyuLDfiQkbqROBtIL5jAiHv68o2niP0G4+cgFYTx+FzbqtEVXy
         mNda37fnuBnCvwM7YaLWnqpk6EDo1zIcUUy/XnkRwv3ez+4sTZE+t0tSSnfjZFBNafz2
         ryf3x4MhBMhHeXzYlqF4nTHRG7+L6m+7gx9HHmWZfRczcLwpA65EXrmPUcMlgy7hIe/C
         D84wQtSwiAjx3rWuOTYGhgqg7SaNfmgOyMgGmimszCoBbBJnJtYGWUfD/AfMLCoRacxv
         6Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922543; x=1792527343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOYnbfYGvBBLrVRDfsaZ7wyCdHgMKhFfjmPtx3cZKDo=;
        b=gKhVb1h7Kq39RM9PY7xwf73QzhXVB5Vp1niY6tXkAmDepZDRB+HL/gTy37haPjEMhi
         +lWCfuUhzIq5mIdB2nt4DAVYF1gErYp8v88D3BMa6vY/VIsLQr0VSIrkJYsYSQX9qgci
         1QAMZ4zqheffKAPv4lzIAHWfXAjvnRQtC3g8NIEVTNTlqYYptsU9ILaB9bDdSsbVV8Kk
         GsGnVf6AGaymwy4OHoZQk4tQgOOX2lWhvLmOjYodrU4eLvfb+Xc2WUtRQmxaU/IyWRDJ
         oPI41NqlC476BIW54pmHdxgeoFGgcnXnpKjwDXqb+M096NSjRuYPBPPBsd0ZLRTbH4Ea
         EwbA==
X-Forwarded-Encrypted: i=1; AKwUvBye+69LuGYCWN4gxznFLAXxZkaypMBMhU4AVtl+4/dNKwGLKWzQZiS7PPZ0IA4SY0sQeOx00lA3VnPqV2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7kg7sOeVYI4A5Y7lLhJ1H4j4ptx6Sdwt/GI92/RUWUE4BICUm
	oOoqrECZaCKhhBZMCVYirzfmvTR7fvZ/99nTNWKV+EgusOY2v4aFEU4p
X-Gm-Gg: AYBFou2rVq6bsJ+cRmqDG19+30vOkhYFeTzs8QTR01jNprsohgMFZU0B6cSexNZ+VOW
	QyeFxXHM9lxaRb8dAhTHkN/kkRpRAh/o+geB2fhgxkZqBWM4lMDNPCOeh6MdZGe2KDNwdE/e7wY
	HKdApJwai+9hnvFmCWC5gxrOsPPP011oMtkzpOE3TjsOFSSVD18CHrQJVhDJo/rZA+bhIOzmk1F
	iTlielbiSwgv6K0OcafL/fnfLfqpnZTdoD6j7kTINc0/y+9TrneIBGSDZm1c0gKb5Xot8cFC+NJ
	fjYIonvI4CxKvDqs45uZc6zd+geoMjCXNCFcW8jTNqTEeUijcUQ5N/CGRS5nFHckNT6RjC5P+hT
	wRYznpjtKrchIC6DXsSkpQ5iuPiWBNKxqUrYDj0I7IyotnKXw6K7oEnBUKLMQZVi3sOlYtc7VEd
	T0M4O4I5cERD0R0j8VlIOP+KS8ZFHOIG+vBCq37CPaJHKrCNWh8r+eHJRmGAI0M10k6V2zvQAYP
	KI=
X-Received: by 2002:a05:6830:6f8f:b0:821:8e71:1bb5 with SMTP id 46e09a7af769-830963f4818mr13915729a34.14.1791922542558;
        Tue, 13 Oct 2026 13:15:42 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:42 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 02/10] staging: rtl8723bs: use ieee80211_has_*() to test frame control flags
Date: Tue, 13 Oct 2026 15:15:30 -0500
Message-ID: <20261013201538.43156-3-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defines GetToDs(), GetFrDs(), get_tofr_ds(), GetMFrag(),
GetRetry(), GetPwrMgt(), GetMData(), GetPrivacy() and GetOrder() in
wifi.h to test individual bits of the IEEE 802.11 Frame Control field.
Each macro casts the frame buffer to __le16 and masks a single bit.
<linux/ieee80211.h> provides equivalent helpers that operate on the
frame_control member of struct ieee80211_hdr and test the same bits.

Replace each use of these macros with the corresponding helper:

  GetToDs()    -> ieee80211_has_tods()
  GetFrDs()    -> ieee80211_has_fromds()
  GetMFrag()   -> ieee80211_has_morefrags()
  GetRetry()   -> ieee80211_has_retry()
  GetPwrMgt()  -> ieee80211_has_pm()
  GetMData()   -> ieee80211_has_moredata()
  GetPrivacy() -> ieee80211_has_protected()
  GetOrder()   -> ieee80211_has_order()

Open code get_tofr_ds() using ieee80211_has_tods() and
ieee80211_has_fromds(), and remove the macro definitions. Also remove
GetOrderBit(), which has no users.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 19 +++++++-----
 drivers/staging/rtl8723bs/include/wifi.h      | 31 ++++---------------
 3 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 1349bd423..d318b0ff4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -455,7 +455,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	ptable += index;
 
 	if (psta) {
-		if (GetRetry(pframe)) {
+		if (ieee80211_has_retry(hdr->frame_control)) {
 			if (precv_frame->u.hdr.attrib.seq_num == psta->rx_mgmt_frame_seq_num) {
 				/* drop the duplicate management frame */
 				return;
@@ -690,7 +690,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	auth_mode = psecuritypriv->dot11_auth_algrthm;
 
-	if (GetPrivacy(pframe)) {
+	if (ieee80211_has_protected(hdr->frame_control)) {
 		u8 *iv;
 		struct rx_pkt_attrib	 *prxattrib = &(precv_frame->u.hdr.attrib);
 
@@ -849,6 +849,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	uint pkt_len = precv_frame->u.hdr.len;
 
 	/* check A1 matches or not */
@@ -858,7 +859,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	if (!(pmlmeinfo->state & WIFI_FW_AUTH_STATE))
 		return _SUCCESS;
 
-	offset = (GetPrivacy(pframe)) ? 4 : 0;
+	offset = (ieee80211_has_protected(hdr->frame_control)) ? 4 : 0;
 
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
@@ -1673,10 +1674,11 @@ static s32 rtw_action_public_decache(union recv_frame *recv_frame, s32 token)
 	struct adapter *adapter = recv_frame->u.hdr.adapter;
 	struct mlme_ext_priv *mlmeext = &(adapter->mlmeextpriv);
 	u8 *frame = recv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)frame;
 	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num & 0xffff) << 4) |
 		(recv_frame->u.hdr.attrib.frag_num & 0xf);
 
-	if (GetRetry(frame)) {
+	if (ieee80211_has_retry(hdr->frame_control)) {
 		if (token >= 0) {
 			if ((seq_ctrl == mlmeext->action_public_rxseq)
 				&& (token == mlmeext->action_public_dialog_token))
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 8f3c0552e..43452f50d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -566,13 +566,14 @@ static void process_pwrbit_data(struct adapter *padapter, union recv_frame *prec
 {
 	unsigned char pwrbit;
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct sta_info *psta = NULL;
 
 	psta = rtw_get_stainfo(pstapriv, pattrib->src);
 
-	pwrbit = GetPwrMgt(ptr);
+	pwrbit = ieee80211_has_pm(hdr->frame_control);
 
 	if (psta) {
 		if (pwrbit) {
@@ -1248,7 +1249,7 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	signed int ret = _SUCCESS;
 
-	bretry = GetRetry(ptr);
+	bretry = ieee80211_has_retry(hdr->frame_control);
 	pda = get_da(ptr);
 	psa = get_sa(ptr);
 	pbssid = get_hdr_bssid(ptr);
@@ -1435,6 +1436,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	u8  ver = (unsigned char) (*ptr) & 0x3;
 
 	/* add version chk */
@@ -1446,16 +1448,17 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	type =  GetFrameType(ptr);
 	subtype = GetFrameSubType(ptr); /* bit(7)~bit(2) */
 
-	pattrib->to_fr_ds = get_tofr_ds(ptr);
+	pattrib->to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
+			    ieee80211_has_fromds(hdr->frame_control);
 
 	pattrib->frag_num = GetFragNum(ptr);
 	pattrib->seq_num = GetSequence(ptr);
 
-	pattrib->pw_save = GetPwrMgt(ptr);
-	pattrib->mfrag = GetMFrag(ptr);
-	pattrib->mdata = GetMData(ptr);
-	pattrib->privacy = GetPrivacy(ptr);
-	pattrib->order = GetOrder(ptr);
+	pattrib->pw_save = ieee80211_has_pm(hdr->frame_control);
+	pattrib->mfrag = ieee80211_has_morefrags(hdr->frame_control);
+	pattrib->mdata = ieee80211_has_moredata(hdr->frame_control);
+	pattrib->privacy = ieee80211_has_protected(hdr->frame_control);
+	pattrib->order = ieee80211_has_order(hdr->frame_control);
 
 	switch (type) {
 	case WIFI_MGT_TYPE: /* mgnt */
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 6c877c7ca..800bfd962 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -75,53 +75,33 @@ enum {
 #define SetToDs(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_TO_DS_))
 
-#define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
-
 #define SetFrDs(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
 
-#define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
-
-#define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
-
 #define SetMFrag(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
 
-#define GetMFrag(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_FRAG_)) != 0)
-
 #define ClearMFrag(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_)))
 
-#define GetRetry(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_RETRY_)) != 0)
-
 #define ClearRetry(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_RETRY_)))
 
 #define SetPwrMgt(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_PWRMGT_))
 
-#define GetPwrMgt(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PWRMGT_)) != 0)
-
 #define ClearPwrMgt(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_PWRMGT_)))
 
 #define SetMData(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_))
 
-#define GetMData(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
-
 #define ClearMData(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_DATA_)))
 
 #define SetPrivacy(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_))
 
-#define GetPrivacy(pbuf)					\
-	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PRIVACY_)) != 0)
-
-#define GetOrder(pbuf)					\
-	(((*(__le16 *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
-
 #define GetFrameType(pbuf)				\
 	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(3) | BIT(2)))
 
@@ -204,7 +184,8 @@ static inline unsigned char *get_da(unsigned char *pframe)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *da;
-	unsigned int	to_fr_ds	= (GetToDs(pframe) << 1) | GetFrDs(pframe);
+	unsigned int to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
+				ieee80211_has_fromds(hdr->frame_control);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs = 0, FromDs = 0 */
@@ -228,7 +209,8 @@ static inline unsigned char *get_sa(unsigned char *pframe)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *sa;
-	unsigned int	to_fr_ds	= (GetToDs(pframe) << 1) | GetFrDs(pframe);
+	unsigned int to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
+				ieee80211_has_fromds(hdr->frame_control);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs = 0, FromDs = 0 */
@@ -252,7 +234,8 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	unsigned char *sa = NULL;
-	unsigned int	to_fr_ds	= (GetToDs(pframe) << 1) | GetFrDs(pframe);
+	unsigned int to_fr_ds = (ieee80211_has_tods(hdr->frame_control) << 1) |
+				ieee80211_has_fromds(hdr->frame_control);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs = 0, FromDs = 0 */
@@ -317,8 +300,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
 /*-----------------------------------------------------------------------------
 				Below is the definition for 802.11n
 ------------------------------------------------------------------------------*/
-#define GetOrderBit(pbuf)	(((*(unsigned short *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
-
 #define ACT_CAT_VENDOR				0x7F/* 127 */
 
 /**
-- 
2.43.0

