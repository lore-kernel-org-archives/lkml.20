Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A05581E4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922559; cv=none; b=iG8LjoSVnhltP0NjINT3KR/GYlvIEYgD3N2pwQnZD6GY6+CzvXKbjfWbHBGAgEbvlvBLGSDunnHaF6OEY0ALajiPxbVfnMyuVXVWpEROUifaBL+94H15tVAliSNIbutMzOziRNZN5rizzk2Be4zmk20ahXA/wSyjzM9Lyn90leE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922559; c=relaxed/simple;
	bh=XrOKi5+LPvGwFwVerfisjs3shnJ7pN8myymdFyxc1Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQt1Cp/+RLz1XpfPeMFYFoTb8OLVlVHOxnTRu9F6g1V7y9zPSx/iIizzIOwkwMULVTZWiaReSMbRo8KyXTQwWw6BY7ZElNGvzHr5wHzVF5Kk2t4vnpC/I7meD/ehJ0v91jjy/WKVMtvu6S9TesA/H4IIQgTjbzg5ehVCZ7lAC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4mjsctT; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4mjsctT"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-81ba09a5d23so197405a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922556; x=1792527356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcBlwSovPnfSTK4K/hUxzccfjyfeJvmVDVyKW4TD8gg=;
        b=I4mjsctTKb7oRBP3zs0EneI4caacajmVHeXHIs6KvyRYozxoDbERtI1z+qJsGBE3A8
         3Ps2dGoAS/PgqLnWwYMlNk6o5PUnT4G1kSSg5B37GkZ+DrAT9YIhf9BdDYVBjvyn/qBI
         orVZJ0hfcBe0DpKibUdjmvrHriBNz34NRusK0/xHWiPztDVdzJ8OgDqW5AOKZt/OhxjV
         ZUpEztw8f7EfBLkPVJI7iwAly6KNI0gYyKnXOuSbZ1YvSB7euIKSKjfjb5IqLg/bvNvR
         cV5ozgXVyZtl8TKPj1Q/lWqFKZZnWAOb1DmYcCuuzAKco8+rVDgpkfcP+I/N1Sv1TWV3
         yH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922556; x=1792527356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcBlwSovPnfSTK4K/hUxzccfjyfeJvmVDVyKW4TD8gg=;
        b=ALjU7SiMoErM62XmbaaeKjPcVEMexROUUyonf1VnVmRpcxRuSNB+6SZ0Sax1gFEPNx
         QYWJidhgxCdmShwYUMmHkmztOJ6p8zjLXDJqeMOQQp67hHKaz9LcYrtLqn7RQf+UHPMD
         hH4UJsj6ec3G6yM+nm2/PXFALS1DVjw6Hx7ldVIkcZEK7mny9mfUCpHZRikNCfh6LdgT
         8OWkU0Z11HcCIgon7RN0TdRt2gDrCOBhi1XD6I7zj7QdiDJisHjQ8lsLyNmvyFMh7NqD
         op0nD3h54zrIPID8jS8myitNWkO0RhOVg72VvodglLnBRPfWhU+Vjf16fupxORE+LJ4h
         iXIw==
X-Forwarded-Encrypted: i=1; AKwUvByOgIIags2WtxOJObGibjzA5oSyDi7en0jOwyFIpsLZ5yQCjss3WJGFEiCVRAi2Rf7ArZXH5AsJe2YwBhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkgQsIqPQMtNi11jkP+RRQaIimsbpK+iezcel3rZ6Vyhn0hsPZ
	EWgrl53BSzGlP8kT1FNJvYQNDFoPRrDRuBvKYWVIW2uqfc/P2bzyFZ42
X-Gm-Gg: AYBFou3Hty5hozelfIfkHkZ/N87TAkYY9U1EjguMklr85h3bCr/TMURm+zMfN9MP8/M
	0/PUq0ZfTD2BTToqqIdsJ2Rbl9++qOs1RtvT8BCG/KsVSz+eN/1ZlFUeWtGZG7SNsjygvNnmvFO
	zp+2EILKmZU3/kO0IuFDE6MDccRjyT3726K+7h4sBO4jGEO5DWvMjT8gwxAGQZjQ77WNdO3AyWH
	DdiY/h5Ee/mDoGiTqKqPw4y7itGraCcBluF6zM8I/CRX5dKgddSoF5vMN/q4ftSbUWBrAcn2vcX
	V1LEyOy12r9/cBUUfFxg/8TSplrJlCGx5jSggNZk8CXv9c0e9DZiCxbVEgl4CmWCsnMtYT/xkRr
	O0NvXej0VUnZgNSV7kOBRnIsJiaHw3puZe+x++CXXKqsraKFS03+UL7MEW+fJt7615IWgln8k7p
	iAFaZ/EoMwGyjLdG6rgFJkQShEssFXrESwqqbsl+1M//V3JQGQwT7uTolZamZfCZ8aQRtrdVpaM
	/s=
X-Received: by 2002:a05:6830:6f8d:b0:824:e29:e00e with SMTP id 46e09a7af769-830971a491fmr11696739a34.20.1791922556403;
        Tue, 13 Oct 2026 13:15:56 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:55 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 09/10] staging: rtl8723bs: use IEEE80211_QOS_CTL_* masks for QoS control
Date: Tue, 13 Oct 2026 15:15:37 -0500
Message-ID: <20261013201538.43156-10-rishik.yechuri.code@gmail.com>
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

The driver reads and writes the QoS Control field with the
SetPriority(), GetPriority(), SetEOSP(), SetAckpolicy(),
GetAckpolicy() and GetAMsdu() macros, which shift and mask the field
by hand. <linux/ieee80211.h> defines IEEE80211_QOS_CTL_* masks for the
TID, EOSP, Ack Policy and A-MSDU Present subfields.

On transmit, set the subfields with le16_encode_bits() and the
corresponding masks, and declare the QoS Control pointers as __le16
to match the byte order of the field. le16_encode_bits() masks the
value to the width of the subfield, as the macros did.

On receive, locate the field with ieee80211_get_qos_ctl() instead of
a fixed offset of 24 bytes, and extract the subfields with
u8_get_bits(). Frames with four addresses are rejected by
validate_recv_data_frame() before the QoS Control field is parsed, so
the helper always returns the same offset as before.

Remove the macro definitions, which no longer have any users.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  8 +++++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 12 +++++++-----
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  8 ++++----
 drivers/staging/rtl8723bs/include/wifi.h      | 15 ---------------
 5 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ec0046d3a..4d8073d48 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3039,7 +3039,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	unsigned char *pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
-	u16 *qc;
+	__le16 *qc;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -3071,13 +3071,13 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		*fctrl |= cpu_to_le16(IEEE80211_FCTL_TODS);
 
-	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
+	qc = (__le16 *)(pframe + pattrib->hdrlen - 2);
 
-	SetPriority(qc, tid);
+	*qc |= le16_encode_bits(tid, IEEE80211_QOS_CTL_TID_MASK);
 
-	SetEOSP(qc, pattrib->eosp);
+	*qc |= le16_encode_bits(pattrib->eosp, IEEE80211_QOS_CTL_EOSP);
 
-	SetAckpolicy(qc, pattrib->ack_policy);
+	*qc |= le16_encode_bits(pattrib->ack_policy, IEEE80211_QOS_CTL_ACK_POLICY_MASK);
 
 	memcpy(pwlanhdr->addr1, da, ETH_ALEN);
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index b09ea6f76..a7462444e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1309,9 +1309,11 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	pattrib->ack_policy = 0;
 	/* parsing QC field */
 	if (pattrib->qos == 1) {
-		pattrib->priority = GetPriority((ptr + 24));
-		pattrib->ack_policy = GetAckpolicy((ptr + 24));
-		pattrib->amsdu = GetAMsdu((ptr + 24));
+		u8 *qc = ieee80211_get_qos_ctl(hdr);
+
+		pattrib->priority = u8_get_bits(*qc, IEEE80211_QOS_CTL_TID_MASK);
+		pattrib->ack_policy = u8_get_bits(*qc, IEEE80211_QOS_CTL_ACK_POLICY_MASK);
+		pattrib->amsdu = u8_get_bits(*qc, IEEE80211_QOS_CTL_A_MSDU_PRESENT);
 		pattrib->hdrlen = pattrib->to_fr_ds == 3 ? 32 : 26;
 
 		if (pattrib->priority != 0 && pattrib->priority != 3)
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 1624bf6de..290e7e589 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -904,7 +904,7 @@ static void xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxm
 
 int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib)
 {
-	u16 *qc;
+	__le16 *qc;
 
 	struct ieee80211_hdr *pwlanhdr = (struct ieee80211_hdr *)hdr;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -956,14 +956,16 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			*fctrl |= cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 
 		if (qos_option) {
-			qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
+			qc = (__le16 *)(hdr + pattrib->hdrlen - 2);
 
 			if (pattrib->priority)
-				SetPriority(qc, pattrib->priority);
+				*qc |= le16_encode_bits(pattrib->priority,
+							IEEE80211_QOS_CTL_TID_MASK);
 
-			SetEOSP(qc, pattrib->eosp);
+			*qc |= le16_encode_bits(pattrib->eosp, IEEE80211_QOS_CTL_EOSP);
 
-			SetAckpolicy(qc, pattrib->ack_policy);
+			*qc |= le16_encode_bits(pattrib->ack_policy,
+						IEEE80211_QOS_CTL_ACK_POLICY_MASK);
 		}
 
 		/* TODO: fill HT Control Field */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 756d6dc84..24cf2b6eb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -260,8 +260,8 @@ static void ConstructNullFunctionData(struct adapter *padapter,
 		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
-		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
-		SetEOSP(&pwlanqoshdr->qos_ctrl, bEosp);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(AC, IEEE80211_QOS_CTL_TID_MASK);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(bEosp, IEEE80211_QOS_CTL_EOSP);
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
@@ -748,8 +748,8 @@ static void ConstructBtNullFunctionData(struct adapter *padapter,
 		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
-		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
-		SetEOSP(&pwlanqoshdr->qos_ctrl, bEosp);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(AC, IEEE80211_QOS_CTL_TID_MASK);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(bEosp, IEEE80211_QOS_CTL_EOSP);
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 85348979a..d1bb9076d 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -18,21 +18,6 @@
 /*  This test verifies the WLAN NIC can update the NAV through sending the CTS with large duration. */
 #define	WiFiNavUpperUs				30000	/*  30 ms */
 
-#define SetPriority(pbuf, tid)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf))
-
-#define GetPriority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
-
-#define SetEOSP(pbuf, eosp)	\
-		(*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4))
-
-#define SetAckpolicy(pbuf, ack)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5))
-
-#define GetAckpolicy(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 5) & 0x3)
-
-#define GetAMsdu(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 7) & 0x1)
-
 static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
-- 
2.43.0

