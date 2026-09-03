Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66263390239
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412767; cv=none; b=ZrqktXOyg+G43wNIWd3rs2N2t1pGyUiaPFipd+dMT7FmbH9Pk006hJSnXwUk25UaqYgHOrMixTYUXtZfBrBuOmCZCih/jXmxyDOS7uRaiNKCZzOobdE37KYqv0S3CAwAbJ72iLFwzm9c8zoyyxsr2By4qwTR5jL8EiKewlAUol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412767; c=relaxed/simple;
	bh=raCy1icJURfHfg8hvmwuYspa5lN3bzdTo9njuaSZWyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpYsdF3VsdsYOrKBpL/6khxAE7gR7oqslNiBXTB9kNpodJlSZgZEoqGHsc0K++XBAlxXU4uClZIFOf8Jkzrw1XcJyc8MkLGQfxGRwuqtdbzH28JMLQSqkHq+H1qCXlLACqmK557LIZYFENJZ7Yn7sUvaK9gxjiTkPa0uDTskyDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL/OvZXA; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL/OvZXA"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so1726018e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412765; x=1789017565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhiKCb/De7JeZ/3UG9kBoVo3lIlkR7a6UOucprZ94/s=;
        b=fL/OvZXA06LfausQ+s12qpQJrS5QxRJM1MTyrh09jUNbb3PPHl8HbewYS00yrwPqj3
         m0HRIKFjEoNIJBTT+4bv+1uB4Rt0xawg3Dm8xdq8JtU7OF57LChI6W1QQakW8WRnCM5b
         8HIVrIGiOlWQbujnOfGc6YRP0umrI9uINH5US4h+OYBCrbEpThLOtRS0C4k1TdPKTQ1t
         odPpGjd3BNCzK1JDH8M82vOl4hpSS5e4ANIfpl32IdJ2sgj0D2t6xorzNufzRCEDbHF5
         em7CnQ/x0w7U2E/TyAoLaYnALN9SyO3W1i7r3xwkJ1uFy7T76KKumRSXkWz/5/0o7pbi
         e2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412765; x=1789017565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhiKCb/De7JeZ/3UG9kBoVo3lIlkR7a6UOucprZ94/s=;
        b=HTo/u3Csj1xzSyAY94xklt6+zWf8TkzAMaqAfrwbikakCdzGti/1jdQqqCHFEpijGU
         /KD15uGz/htmSZ40C44XDyL2U5zp3XHL9sxcY1re0/VD8/NmJnjZ5acQZKkNu/mJIa3L
         wpksnzNvnX80UpBjVFZFxj5llUfVueP3mqBsSVT2XoTv6e2bCOn3D3fqbg+du/e9sYYl
         3jvverIcuhYiRD357P2MZAdiq9f8s97JT4A1VyiQeLtc70OB/cxsKLYh56iL/WDV2NFs
         f/p/eFyzs2KXT0uM21q83TociU+q8mVxPV4LIsFel44NglAW+NlOzcrXdyS+2uJPCtwX
         7Jew==
X-Forwarded-Encrypted: i=1; AKwUvBwxgbHbypZODwT1y7DhsacLeWTv8Bld7q5fktaoq84JhGp701mWzS71gbhxUmrpUWDpfVRKMswjM4u8A5g=@vger.kernel.org
X-Gm-Message-State: AFuF++mJTli8vOGTttciCJLD2jrY3A9tXKL4X3sWzBoqe3WTwnzcJyDi
	EUSV+4Hfc5cHHs7eXWuZrJeBjz+5MvGvSW9BDBZmSKaMujCWbpHGl7Lw
X-Gm-Gg: AYBFou1g0CbyCkVtI18kwqJLbracMd3HJv1lG55IqD/LGaoBqf7rWryjmePYv/x8zTM
	X1/qpeZ5GRvNQ3dDd/4pZK/m2CozaNbYKVFLm9dPwk9t7yPH+lWhBNEJHI/ZRcrPiUInZALcaNt
	R+oqXIt4vL7TF4FtVO+CU2rLg87SCQGsXDk+BKz3N5ZNRf+SAiq0+AmvJsubLY0tde49hg3X6I1
	jFgJZARzxmBOcJISkCLLQIkR2OkLNBR/ZMErA2UTl7Ky/sAJOTbrT5BeGobaQbhiiXjgg30xbzD
	rYQM1/eLWuEo/cmtCY44AJ4TM/N43PR1U3XteDmx8OgLS4+P0aUPj8vq4BupoISD8hCYMq8itYX
	YE03RIwf4AB44lJxMatPpLbkB4Wm6G8Na2uohSjsrz5NKRtFMbKsFIJwt6zL8jOSNYt4x0bp/Ee
	vMlBO/LAlmbIOqDPD/HfwiFwTVXZWcJh5nDyamPYNNwdvYxltA4OXduk1+7AsYU86u
X-Received: by 2002:a05:6122:8c3:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c7d2462268mr4480821e0c.1.1788412764474;
        Wed, 02 Sep 2026 22:19:24 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:23 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 03 Sep 2026 02:18:09 -0300
Subject: [PATCH 3/4] staging: rtl8723bs: remove invariant parameters from
 _issue_probereq()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-issue_probereq-v1-3-82f153d157a1@gmail.com>
References: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
In-Reply-To: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=2382;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=raCy1icJURfHfg8hvmwuYspa5lN3bzdTo9njuaSZWyU=;
 b=reqSz8oD1t8+nGiU4ALLKyUZnmnY+/etlAMmnx799Q8QVj14lLEoXoQzjy1GNjyt2zSt/akZ3
 +4pJsNuZJX+B/uZa+yjpr/y3C6JX0pUDAgmPg272wz+EiYAVMZ3iowf
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The parameters ch and wait_ack in _issue_probereq() are always 0 and
false respectively, remove them and remove unreachable code that depends
on them not being these values.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d3c87d25fab1108adde15d959e0b890b2180f20d..b3642c5021a230bd70e5d8fd8d5bf77ad1d8946a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2401,9 +2401,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static void _issue_probereq(struct adapter *padapter,
-			    struct ndis_802_11_ssid *pssid,
-			    u8 *da, u8 ch, bool append_wps, bool wait_ack)
+static void _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da,
+			    bool append_wps)
 {
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
@@ -2468,9 +2467,6 @@ static void _issue_probereq(struct adapter *padapter,
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
 	}
 
-	if (ch)
-		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ch, &pattrib->pktlen);
-
 	if (append_wps) {
 		/* add wps_ie for wps2.0 */
 		if (pmlmepriv->wps_probe_req_ie_len > 0 && pmlmepriv->wps_probe_req_ie) {
@@ -2482,21 +2478,17 @@ static void _issue_probereq(struct adapter *padapter,
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	if (wait_ack) {
-		dump_mgntframe_and_wait_ack(padapter, pmgntframe);
-	} else {
-		dump_mgntframe(padapter, pmgntframe);
-	}
+	dump_mgntframe(padapter, pmgntframe);
 }
 
 inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
 {
-	_issue_probereq(padapter, pssid, da, 0, 1, false);
+	_issue_probereq(padapter, pssid, da, 1);
 }
 
 void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
 {
-	_issue_probereq(padapter, pssid, da, 0, 0, false);
+	_issue_probereq(padapter, pssid, da, 0);
 }
 
 /*  if psta == NULL, indicate we are station(client) now... */

-- 
2.47.3

