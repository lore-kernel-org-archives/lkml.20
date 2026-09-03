Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589735E1D5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412763; cv=none; b=kyBs2zDw1mYCgq0LYCEfROlX+4PTNb5cVOlIu0zTHuGW/SV3vvd6G2Z/WtwEnwhrgpPXcylbjrxJtjIFrSwGH6lIdsQ3PPw54qHBetWKkQeCkl2QF90qMv9ySBOYxckJIrxmorYDzD/7ZlcycpJZVYaqX5CG6+Ub7RCeCpXsEn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412763; c=relaxed/simple;
	bh=RjV75e0edVLLWrOZCmYRLID4W3QVW6Ml3ZdPj8Zuth8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inD1lkFOMPrfdWaZTeXXYSJ9cS7WQlz9LZvkieyjMAZfEqr0DKWPd6Ahbv5ttltn94jrAI7fMtqD9YzANWXdyVr4rPZ+n5UxyhCC+3XtRGF+2iwSvJtZ2lzzr82dIMGqFwc1oo/DB1KymHNUTXbVIbt+tPnygblC5jcNc8VRpxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPcoXwis; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPcoXwis"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97e9c0da212so1024496241.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412761; x=1789017561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dne05icjM1GcTXr7Nj/It1xKe5YRpUo/x6ms7nUN/D0=;
        b=NPcoXwisS3J39gziJqC3zRQ7ue3wGwebLsfoIz2JQ1zOctEtUOt4EYmjlUcEn+Mu8m
         kNnbw7fu47UrpFyhqLIIfG2G8acxslfuPuxlblfmIT2YD7JHLrt0ZlAJKZJObyLvuWKX
         RE7/Qly3r7oIItlp6nRon9uaCQuMA5O9nRtlvgLOiiQL4rD5BhudXutkOWHX56EUZxMe
         ztAQtYHHcl+yx2XYey86V7tVnTLKYlcXaMPcIgzHot7PG9JkuR6MkeS9MPR8NpNl1YZN
         IoVby90KtYKaNvEklB/qyOOYzVJCmb5tMuudRWRDeuKi9r53fUc6cn8lrt1drseTM1+v
         fLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412761; x=1789017561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dne05icjM1GcTXr7Nj/It1xKe5YRpUo/x6ms7nUN/D0=;
        b=O5d/6OqT9s6oU2YmrYkQ2SH3HsNlZiQP9sAhd08FEKETT3Xng1z9L2CfFymbNOp3+N
         325LAeRqADv0pGfHJjnQc3VoDa+fRmnt6UYChOWMmQhZYnDfqCikLd+3CncaSQwLBPTX
         PsidIBAaR15YEKzImj1qspEDCWB79WXBOredCH59WEBLIO066GP7QCKKReCV3uFeh+/m
         YdG/MIsfwz8uWj5xEGAgHareNBIRntcTiQLdWV3C0Y3IJw3Y4aespPrP1HQCSrmVuJxD
         KN8f2oC8kZ+50PoXYZEjhTrKNWKfN+3GMfSiZ096rAChlyukQaKQGtBR+IcHSARIhGOB
         EV2A==
X-Forwarded-Encrypted: i=1; AKwUvBwikY7Xw90EEUQlFu5GHziL6Uf4uRX5ea2ljsgGesVfZRBOzeeM8inrgrHYSXcBv3IBsYjBxHvkbHVEhlU=@vger.kernel.org
X-Gm-Message-State: AFuF++mgovseDUBSOGuWsBBEsQPqfWfpJEa2MnmsDDKY7HCIFDXpBYFF
	wckUKy6lLx8wLoKupg9uiRaxVqTIIHtc5EssVbRzAruyf77IGnmuwfTn
X-Gm-Gg: AYBFou1WqsLdNR/Vvef4Y7Jm6W+EDv5SASVXJuh95OnI1h5BxyEgZJ5cujgVhu2K29n
	eDTQGaoMFP0G1xm0ijfLhAF21b6WdJWC8qZQ7BYDzSc3/DRd0yQnZ7wfcKkuM+YE/aNltOFlE8t
	ZpUO7xl5pN5ZejkkvQPIqHWsTCn5FyJPjarfYdrnSyxZnjAgFdhkjhSu47oKOwIX0wQnw7Rm9nP
	0RkJZUaimQuQkvzwA6y1P3Hg/axxLCJML8QYRMdNQnXYqkQVXYKK/JfOvdPH8RzHGBeuB6nLDrY
	08fSbLQned0OQxILoB91xC+CgmN2jH1LQhgKgfVF6b+XdzuY9I5CIacBXpPBbUqZmI7xdbHwGm/
	Rzq7KimF8Q9Q4rAz/5Old63RAT/OA+g97gCmO2JT2Jq6jZ/KcjYgIU11stkG98WiA60fxNJAzS2
	V1m+Xaxnr0IuQKmfhWFyd5R1dSddBcwP5h7Nh2A//EWOI0fcB+argW3J5qbkQxK+VKB61IrpZTP
	C0=
X-Received: by 2002:a05:6122:d28:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5c7d24e4500mr4931981e0c.2.1788412760982;
        Wed, 02 Sep 2026 22:19:20 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:20 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 03 Sep 2026 02:18:08 -0300
Subject: [PATCH 2/4] staging: rtl8723bs: change issue_probereq return types
 to void
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-issue_probereq-v1-2-82f153d157a1@gmail.com>
References: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
In-Reply-To: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=3846;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=RjV75e0edVLLWrOZCmYRLID4W3QVW6Ml3ZdPj8Zuth8=;
 b=DT23L4rB+jKi88uXsejROS+viTgdTm5h+i0oK6bpgQYH3w0mU5OJ9Jif2Gs4IPPOZFVq5FstU
 126hkD1cGAtBUW0/OpRA/MRbHAClrAo+EWgXDAmcK+jY5YeLt8yWeAN
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The return values of issue_probereq_ex() and _issue_probereq() are never
used anywhere, change their return types to void to reflect this.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 31 ++++++------------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 2 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4bdd2ae24d274cdc4b2c6496f385856c6039c55c..d3c87d25fab1108adde15d959e0b890b2180f20d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2401,11 +2401,10 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static int _issue_probereq(struct adapter *padapter,
-			   struct ndis_802_11_ssid *pssid,
-			   u8 *da, u8 ch, bool append_wps, bool wait_ack)
+static void _issue_probereq(struct adapter *padapter,
+			    struct ndis_802_11_ssid *pssid,
+			    u8 *da, u8 ch, bool append_wps, bool wait_ack)
 {
-	int ret = _FAIL;
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
 	unsigned char *pframe;
@@ -2420,7 +2419,7 @@ static int _issue_probereq(struct adapter *padapter,
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
-		goto exit;
+		return;
 
 	/* update attribute */
 	pattrib = &pmgntframe->attrib;
@@ -2484,14 +2483,10 @@ static int _issue_probereq(struct adapter *padapter,
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
 	if (wait_ack) {
-		ret = dump_mgntframe_and_wait_ack(padapter, pmgntframe);
+		dump_mgntframe_and_wait_ack(padapter, pmgntframe);
 	} else {
 		dump_mgntframe(padapter, pmgntframe);
-		ret = _SUCCESS;
 	}
-
-exit:
-	return ret;
 }
 
 inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
@@ -2499,21 +2494,9 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 	_issue_probereq(padapter, pssid, da, 0, 1, false);
 }
 
-int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
+void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
 {
-	int ret;
-
-	ret = _issue_probereq(padapter, pssid, da, 0, 0, false);
-
-	if (ret != _FAIL) {
-		ret = _SUCCESS;
-		#ifndef DBG_XMIT_ACK
-		goto exit;
-		#endif
-	}
-
-exit:
-	return ret;
+	_issue_probereq(padapter, pssid, da, 0, 0, false);
 }
 
 /*  if psta == NULL, indicate we are station(client) now... */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index acea9cef7756e158c7ab9e357a06a7aab300943f..8e35aabb0ccf96a2bb0c1208db8ad74598a687e0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -542,7 +542,7 @@ void issue_assocreq(struct adapter *padapter);
 void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type);
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status);
 void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
-s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
+void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
 int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
 int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms);

-- 
2.47.3

