Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A290411FA1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189819; cv=none; b=cVG8DT5+tl2rBpJ3wjHfzriIykL8mSlYLO0x+Q/hjLzFbdWLO3pvGRL8aaVat5BZ3X5rMzyz6m/yPvQdIfvRghhuG2I4vnilF6oKedcyVDo+yVmbQgK2U6GuCZvjsylpQS42cZfHclivYC6TOmv4+NMNIH62+Cn4mRJh2h4iofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189819; c=relaxed/simple;
	bh=svagNVg/eJdrSC74cvVuAQ6ya3Bx8hstNw7sgpQl64A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4q7P+4F8nIEz9RKpw55TXmyprAcfKBJ+eiCVW2z1coR/25ptkBkN98uyIUOGJmRQNXmzCkAEnd+1am+wYjMas6UeoqFmOBFJzWi55ruDZOLQq7ZzJ1ZW0sux3ZiaCHihKIq87ZbNS0nXycqCWUJSQ4XDU7FW2R0pu8e+mp+TC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/ThcDJw; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/ThcDJw"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso725519a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790189816; x=1790794616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2iK9Wap/LJ5xdtpuyVnEeefK/YKuis4GLtVXv33cAeA=;
        b=U/ThcDJwoYO2vayQa3rdRoMDvOUVlJPn4r4Myc8cA7r961Tj/QS7/gRlJHW/8ubfRz
         24FDXV+n2coVxMRB9kUpr047bEkbpAzfKvbDAd4ovLpzLsU/RMegYWBacx72AicjACSQ
         b0xSfkiNJd1KOXW/uKE+IPqnca0mqCAiFHTxnwoivxQmUmVdjLU9UJb/osm+u8BlUNcO
         6hEz29CQjp1y20CP1y2AvPU2hhsI1KhvbM8MaVkx/pBnJsN9o9M/yF2tYnVfA/83H8Zw
         k/9dPd/ct6gdOi9xbAOV3jo32iNSvaN9hzI7GQIsZkaak+sFOqxGhG5DzNtW3KQm04sM
         rWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790189816; x=1790794616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iK9Wap/LJ5xdtpuyVnEeefK/YKuis4GLtVXv33cAeA=;
        b=zhNJ88EVcS3ckKLeVCmqtKcX1RNWbv/iryjxQS8ba+XW4exkV08cyvm6Lx0uaFULcP
         WJqShiqEcJC2eJMfwaXlNyDWiT0vfWzpOcWhE4NIp55BoJmPrbjioX2zxuRgtiRlou8v
         tx6XgHAQ3D8tMX/Hxtoy6Uj4KmhTEZqY43GT6/7n+U1+oyzF/pN6523I83/qTgE6R/70
         80OP9EEImB1+6MSvGXr4Hat++aBMqT0HZdcpfSLBBLloCOmkWEQf06POEvGRc3iD/EGr
         0cdxRKLVogj0eVvIzPZ7eUFib4z9zIyR/cnFColrQOzkKhI7dZBQpe3RZgvmP8k3Wx4A
         Ef9A==
X-Forwarded-Encrypted: i=1; AKwUvBwG22O3LIg9myLdiOM6A77vA8Nrj3FqQq9DnHlKZoy6Ri0UIVpW6jlF6fCBGCkMsarAE1r0ikq++CPCwoM=@vger.kernel.org
X-Gm-Message-State: AFuF++lTcgnKwWjv8lDGK6o+nU1y/mce6s9s7dKQzv8VXjrG7bFxDzSz
	6xDQLvmNW+SwgoIphz/il0H+Mg4ES2MSMmeTAaJeNpbh+5Ee1DiIhrAbKRLXnw==
X-Gm-Gg: AYBFou3t+jFk9Wk7+BdO7gR8lsFAmaErwjtATAWdzx2bqkN4GIMiCeNpRf5yrW0+jYa
	EUTu0bh1bnaJ/z6sZz6tav+tNhWGjI/RF0JMy4RmlktKSEKG9++cb8jcGiZyaF8YbwcyxMrB/aw
	+JJiJbx5vkXBUlgr1VEwC+O4iX2e7rcY/b1TU9RljQZOch4Dm+4ylqDxGfO0uGOUC9ezjskybzF
	kmn/SG23VLyNr08NAhI6MrkOyeTcUWXH9tWJ1941/9qtldXTknCwRLY6ytOoqwHT/7q7XkFzvCA
	8eMSlynoqpHm5yzoJImIg1ZdyTKcNuJW4E2F76Cvp+LfnlO6GusFDXlZbpMy1K5hWMadswlophO
	3SIrywVBIeE+AHFF2qHDGdsAErTFMAV93rzmWw8KtbgRSeiVdMS2DjArpuH7xXoFSoFkParTf4c
	X/ONj5XGwWLibm+1GNSPjjUqNi5ScBFGDn3iix/WJ/80iNTAbb9bzfx4XbpTNGr1uO8PHYlmkj4
	LmnOH6m+jQ=
X-Received: by 2002:a17:90b:314e:b0:39e:6a81:5a90 with SMTP id 98e67ed59e1d1-3a098e37387mr46159a91.36.1790189816114;
        Wed, 23 Sep 2026 11:56:56 -0700 (PDT)
Received: from sihokim-XPS-13-9340.. ([61.105.254.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0812c87e9sm2159435a91.3.2026.09.23.11.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:56:54 -0700 (PDT)
From: Siho Kim <siho93.kim@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siho Kim <siho93.kim@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix block comment style
Date: Thu, 24 Sep 2026 03:56:49 +0900
Message-ID: <20260923185649.1634863-1-siho93.kim@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a leading asterisk to each line of block comments to follow the
kernel coding style.

Signed-off-by: Siho Kim <siho93.kim@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 404 ++++++++++----------
 1 file changed, 192 insertions(+), 212 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 58a5ec39ce76..29ef8f045012 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -159,80 +159,75 @@ enum {
 };
 
 /*
-Caller Mode: Infra, Ad-HoC
-
-Notes: To join a known BSS.
-
-Command-Event Mode
-
-*/
+ * Caller Mode: Infra, Ad-HoC
+ *
+ * Notes: To join a known BSS.
+ *
+ * Command-Event Mode
+ */
 
 /*
-Caller Mode: Infra, Ad-Hoc
-
-Notes: To join the specified bss
-
-Command Event Mode
-
-*/
+ * Caller Mode: Infra, Ad-Hoc
+ *
+ * Notes: To join the specified bss
+ *
+ * Command Event Mode
+ */
 struct joinbss_parm {
 	struct wlan_bssid_ex network;
 };
 
 /*
-Caller Mode: Infra, Ad-HoC(C)
-
-Notes: To disconnect the current associated BSS
-
-Command Mode
-
-*/
+ * Caller Mode: Infra, Ad-HoC(C)
+ *
+ * Notes: To disconnect the current associated BSS
+ *
+ * Command Mode
+ */
 struct disconnect_parm {
 	u32 deauth_timeout_ms;
 };
 
 /*
-Caller Mode: AP, Ad-HoC(M)
-
-Notes: To create a BSS
-
-Command Mode
-*/
+ * Caller Mode: AP, Ad-HoC(M)
+ *
+ * Notes: To create a BSS
+ *
+ * Command Mode
+ */
 struct createbss_parm {
 	struct wlan_bssid_ex network;
 };
 
 /*
-Caller Mode: AP, Ad-HoC, Infra
-
-Notes: To set the NIC mode of RTL8711
-
-Command Mode
-
-The definition of mode:
-
-#define IW_MODE_AUTO	0	 Let the driver decides which AP to join
-#define IW_MODE_ADHOC	1	 Single cell network (Ad-Hoc Clients)
-#define IW_MODE_INFRA	2	 Multi cell network, roaming, ..
-#define IW_MODE_MASTER	3	 Synchronisation master or Access Point
-#define IW_MODE_REPEAT	4	 Wireless Repeater (forwarder)
-#define IW_MODE_SECOND	5	 Secondary master/repeater (backup)
-#define IW_MODE_MONITOR	6	 Passive monitor (listen only)
-
-*/
+ * Caller Mode: AP, Ad-HoC, Infra
+ *
+ * Notes: To set the NIC mode of RTL8711
+ *
+ * Command Mode
+ *
+ * The definition of mode:
+ *
+ * #define IW_MODE_AUTO	0	 Let the driver decides which AP to join
+ * #define IW_MODE_ADHOC	1	 Single cell network (Ad-Hoc Clients)
+ * #define IW_MODE_INFRA	2	 Multi cell network, roaming, ..
+ * #define IW_MODE_MASTER	3	 Synchronisation master or Access Point
+ * #define IW_MODE_REPEAT	4	 Wireless Repeater (forwarder)
+ * #define IW_MODE_SECOND	5	 Secondary master/repeater (backup)
+ * #define IW_MODE_MONITOR	6	 Passive monitor (listen only)
+ */
 struct	setopmode_parm {
 	u8 mode;
 	u8 rsvd[3];
 };
 
 /*
-Caller Mode: AP, Ad-HoC, Infra
-
-Notes: To ask RTL8711 performing site-survey
-
-Command-Event Mode
-
-*/
+ * Caller Mode: AP, Ad-HoC, Infra
+ *
+ * Notes: To ask RTL8711 performing site-survey
+ *
+ * Command-Event Mode
+ */
 
 #define RTW_SSID_SCAN_AMOUNT 9 /*  for WEXT_CSCAN_AMOUNT 9 */
 #define RTW_CHANNEL_SCAN_AMOUNT (14+37)
@@ -245,13 +240,12 @@ struct sitesurvey_parm {
 };
 
 /*
-Caller Mode: Any
-
-Notes: To set the auth type of RTL8711. open/shared/802.1x
-
-Command Mode
-
-*/
+ * Caller Mode: Any
+ *
+ * Notes: To set the auth type of RTL8711. open/shared/802.1x
+ *
+ * Command Mode
+ */
 struct setauth_parm {
 	u8 mode;  /* 0: legacy open, 1: legacy shared 2: 802.1x */
 	u8 _1x;   /* 0: PSK, 1: TLS */
@@ -259,17 +253,16 @@ struct setauth_parm {
 };
 
 /*
-Caller Mode: Infra
-
-a. algorithm: wep40, wep104, tkip & aes
-b. keytype: grp key/unicast key
-c. key contents
-
-when shared key ==> keyid is the camid
-when 802.1x ==> keyid [0:1] ==> grp key
-when 802.1x ==> keyid > 2 ==> unicast key
-
-*/
+ * Caller Mode: Infra
+ *
+ * a. algorithm: wep40, wep104, tkip & aes
+ * b. keytype: grp key/unicast key
+ * c. key contents
+ *
+ * when shared key ==> keyid is the camid
+ * when 802.1x ==> keyid [0:1] ==> grp key
+ * when 802.1x ==> keyid > 2 ==> unicast key
+ */
 struct setkey_parm {
 	u8 algorithm;	/*  encryption algorithm, could be none, wep40, TKIP, CCMP, wep104 */
 	u8 keyid;
@@ -279,14 +272,13 @@ struct setkey_parm {
 };
 
 /*
-When in AP or Ad-Hoc mode, this is used to
-allocate an sw/hw entry for a newly associated sta.
-
-Command
-
-when shared key ==> algorithm/keyid
-
-*/
+ * When in AP or Ad-Hoc mode, this is used to
+ * allocate an sw/hw entry for a newly associated sta.
+ *
+ * Command
+ *
+ * when shared key ==> algorithm/keyid
+ */
 struct set_stakey_parm {
 	u8 addr[ETH_ALEN];
 	u8 algorithm;
@@ -301,15 +293,14 @@ struct set_stakey_rsp {
 };
 
 /*
-Caller Ad-Hoc/AP
-
-Command -Rsp(AID == CAMID) mode
-
-This is to force fw to add an sta_data entry per driver's request.
-
-FW will write an cam entry associated with it.
-
-*/
+ * Caller Ad-Hoc/AP
+ *
+ * Command -Rsp(AID == CAMID) mode
+ *
+ * This is to force fw to add an sta_data entry per driver's request.
+ *
+ * FW will write an cam entry associated with it.
+ */
 struct set_assocsta_parm {
 	u8 addr[ETH_ALEN];
 };
@@ -320,27 +311,25 @@ struct set_assocsta_rsp {
 };
 
 /*
-	Caller Ad-Hoc/AP
+ *	Caller Ad-Hoc/AP
 
-	Command mode
+ *	Command mode
 
-	This is to force fw to del an sta_data entry per driver's request
+ *	This is to force fw to del an sta_data entry per driver's request
 
-	FW will invalidate the cam entry associated with it.
-
-*/
+ *	FW will invalidate the cam entry associated with it.
+ */
 struct del_assocsta_parm {
 	u8 addr[ETH_ALEN];
 };
 
 /*
-Caller Mode: AP/Ad-HoC(M)
-
-Notes: To notify fw that given staid has changed its power state
-
-Command Mode
-
-*/
+ * Caller Mode: AP/Ad-HoC(M)
+ *
+ * Notes: To notify fw that given staid has changed its power state
+ *
+ * Command Mode
+ */
 struct setstapwrstate_parm {
 	u8 staid;
 	u8 status;
@@ -348,68 +337,63 @@ struct setstapwrstate_parm {
 };
 
 /*
-Caller Mode: Any
-
-Notes: To setup the basic rate of RTL8711
-
-Command Mode
-
-*/
+ * Caller Mode: Any
+ *
+ * Notes: To setup the basic rate of RTL8711
+ *
+ * Command Mode
+ */
 struct	setbasicrate_parm {
 	u8 basicrates[NumRates];
 };
 
 /*
-Caller Mode: Any
-
-Notes: To read the current basic rate
-
-Command-Rsp Mode
-
-*/
+ * Caller Mode: Any
+ *
+ * Notes: To read the current basic rate
+ *
+ * Command-Rsp Mode
+ */
 struct getbasicrate_parm {
 	u32 rsvd;
 };
 
 /*
-Caller Mode: Any
-
-Notes: To setup the data rate of RTL8711
-
-Command Mode
-
-*/
+ * Caller Mode: Any
+ *
+ * Notes: To setup the data rate of RTL8711
+ *
+ * Command Mode
+ */
 struct setdatarate_parm {
 	u8 mac_id;
 	u8 datarates[NumRates];
 };
 
 /*
-Caller Mode: Any
-
-Notes: To read the current data rate
-
-Command-Rsp Mode
-
-*/
+ * Caller Mode: Any
+ *
+ * Notes: To read the current data rate
+ *
+ * Command-Rsp Mode
+ */
 struct getdatarate_parm {
 	u32 rsvd;
 
 };
 
 /*
-Caller Mode: Any
-AP: AP can use the info for the contents of beacon frame
-Infra: STA can use the info when sitesurveying
-Ad-HoC(M): Like AP
-Ad-HoC(C): Like STA
+ * Caller Mode: Any
+ * AP: AP can use the info for the contents of beacon frame
+ * Infra: STA can use the info when sitesurveying
+ * Ad-HoC(M): Like AP
+ * Ad-HoC(C): Like STA
 
 
-Notes: To set the phy capability of the NIC
+ * Notes: To set the phy capability of the NIC
 
-Command Mode
-
-*/
+ * Command Mode
+ */
 
 struct	setphyinfo_parm {
 	struct regulatory_class class_sets[NUM_REGULATORYS];
@@ -421,27 +405,25 @@ struct	getphyinfo_parm {
 };
 
 /*
-Caller Mode: Any
-
-Notes: To set the channel/modem/band
-This command will be used when channel/modem/band is changed.
-
-Command Mode
-
-*/
+ * Caller Mode: Any
+ *
+ * Notes: To set the channel/modem/band
+ * This command will be used when channel/modem/band is changed.
+ *
+ * Command Mode
+ */
 struct	setphy_parm {
 	u8 rfchannel;
 	u8 modem;
 };
 
 /*
-Caller Mode: Any
-
-Notes: To get the current setting of channel/modem/band
-
-Command-Rsp Mode
-
-*/
+ * Caller Mode: Any
+ *
+ * Notes: To get the current setting of channel/modem/band
+ *
+ * Command-Rsp Mode
+ */
 struct	getphy_parm {
 	u32 rsvd;
 
@@ -452,58 +434,57 @@ struct Tx_Beacon_param {
 };
 
 /*
-	Notes: This command is used for H2C/C2H loopback testing
-
-	mac[0] == 0
-	==> CMD mode, return H2C_SUCCESS.
-	The following condition must be true under CMD mode
-		mac[1] == mac[4], mac[2] == mac[3], mac[0]=mac[5]= 0;
-		s0 == 0x1234, s1 == 0xabcd, w0 == 0x78563412, w1 == 0x5aa5def7;
-		s2 == (b1 << 8 | b0);
-
-	mac[0] == 1
-	==> CMD_RSP mode, return H2C_SUCCESS_RSP
-
-	The rsp layout shall be:
-	rsp:			parm:
-		mac[0]  =   mac[5];
-		mac[1]  =   mac[4];
-		mac[2]  =   mac[3];
-		mac[3]  =   mac[2];
-		mac[4]  =   mac[1];
-		mac[5]  =   mac[0];
-		s0		=   s1;
-		s1		=   swap16(s0);
-		w0		=	swap32(w1);
-		b0		=	b1
-		s2		=	s0 + s1
-		b1		=	b0
-		w1		=	w0
-
-	mac[0] ==	2
-	==> CMD_EVENT mode, return	H2C_SUCCESS
-	The event layout shall be:
-	event:			parm:
-		mac[0]  =   mac[5];
-		mac[1]  =   mac[4];
-		mac[2]  =   event's sequence number, starting from 1 to parm's marc[3]
-		mac[3]  =   mac[2];
-		mac[4]  =   mac[1];
-		mac[5]  =   mac[0];
-		s0		=   swap16(s0) - event.mac[2];
-		s1		=   s1 + event.mac[2];
-		w0		=	swap32(w0);
-		b0		=	b1
-		s2		=	s0 + event.mac[2]
-		b1		=	b0
-		w1		=	swap32(w1) - event.mac[2];
-
-		parm->mac[3] is the total event counts that host requested.
-
-
-	event will be the same with the cmd's param.
-
-*/
+ *	Notes: This command is used for H2C/C2H loopback testing
+ *
+ *	mac[0] == 0
+ *	==> CMD mode, return H2C_SUCCESS.
+ *	The following condition must be true under CMD mode
+ *		mac[1] == mac[4], mac[2] == mac[3], mac[0]=mac[5]= 0;
+ *		s0 == 0x1234, s1 == 0xabcd, w0 == 0x78563412, w1 == 0x5aa5def7;
+ *		s2 == (b1 << 8 | b0);
+ *
+ *	mac[0] == 1
+ *	==> CMD_RSP mode, return H2C_SUCCESS_RSP
+ *
+ *	The rsp layout shall be:
+ *	rsp:			parm:
+ *		mac[0]  =   mac[5];
+ *		mac[1]  =   mac[4];
+ *		mac[2]  =   mac[3];
+ *		mac[3]  =   mac[2];
+ *		mac[4]  =   mac[1];
+ *		mac[5]  =   mac[0];
+ *		s0		=   s1;
+ *		s1		=   swap16(s0);
+ *		w0		=	swap32(w1);
+ *		b0		=	b1
+ *		s2		=	s0 + s1
+ *		b1		=	b0
+ *		w1		=	w0
+ *
+ *	mac[0] ==	2
+ *	==> CMD_EVENT mode, return	H2C_SUCCESS
+ *	The event layout shall be:
+ *	event:			parm:
+ *		mac[0]  =   mac[5];
+ *		mac[1]  =   mac[4];
+ *		mac[2]  =   event's sequence number, starting from 1 to parm's marc[3]
+ *		mac[3]  =   mac[2];
+ *		mac[4]  =   mac[1];
+ *		mac[5]  =   mac[0];
+ *		s0		=   swap16(s0) - event.mac[2];
+ *		s1		=   s1 + event.mac[2];
+ *		w0		=	swap32(w0);
+ *		b0		=	b1
+ *		s2		=	s0 + event.mac[2]
+ *		b1		=	b0
+ *		w1		=	swap32(w1) - event.mac[2];
+ *
+ *		parm->mac[3] is the total event counts that host requested.
+ *
+ *
+ *	event will be the same with the cmd's param.
+ */
 
 /*  CMD param Formart for driver extra cmd handler */
 struct drvextra_cmd_parm {
@@ -551,15 +532,14 @@ struct RunInThread_param {
 
 
 /*
-
-Result:
-0x00: success
-0x01: success, and check Response.
-0x02: cmd ignored due to duplicated sequence number
-0x03: cmd dropped due to invalid cmd code
-0x04: reserved.
-
-*/
+ *
+ * Result:
+ * 0x00: success
+ * 0x01: success, and check Response.
+ * 0x02: cmd ignored due to duplicated sequence number
+ * 0x03: cmd dropped due to invalid cmd code
+ * 0x04: reserved.
+ */
 
 #define H2C_RSP_OFFSET			512
 
-- 
2.43.0

