Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544700;
	b=2C/R4ODZM+vVLuRSht0+pEwcMWep4ticlP5Vxjmfh6M7xeFgVPwPfccMcN7qYTmO3vo4
	 i4WPXoiv6S0PQhoFq6zIVNgGHMKBK9CDZ/ogiWYvAf+TEqzo0p0jOJgdToNdZereXALpl
	 1i59fEkqpzMYk4KeVQ1V4ISDPwDuNIXY6FnNc7T5MDzwmlOYtERYxntpS/CtBDKd+TbzX
	 PvCzG9aPzc7XmVq+Ei69osY+sVQlOVDv8D3TOYx4gx3f0APUBYoTSxijRcriXE7MCrcH3
	 b3rm+kJlksUGcTlMQjj0WHnwMKKtJVJ4r/GA6DefK1OQ9/zQUYsBiVW+xFDIm72UTYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5pTCbeuMBw4mtr39j3WfpOFFcKqtGe3X/Jp0q87wrlE=;
	b=tvarAnO5WySDbJ/rmU4rRxJSsFnF+5GBZTeMa8e9/lJOCLTNMrSpfUu+z5cFzSPZ1vaj
	 PbYscLql4B4sThhFMcx/si5ANR74xfrLBAIRhK/MQiNnNgEFBpwBtG03PytDlzHVudISD
	 tWscbJoSRUYwkKZ7LTUW0rRP95O709rSw/lNgToYakSG+d2lHdVGrh6N5xeLajuLlDJAV
	 bF8OtKL8mYfKRWVPIoawaEx5PYjwEc3GCw12aKgplgStEuhxRpXnQeexI4QQYEH6WDYMc
	 YezlmTfyIPeWTPFf7DzSDAWDcVtVBh5GCNMc7FriC43bax/HRc3grmGDHlnQ3N8IhgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N4/AQyBa";
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C6606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N4/AQyBa
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e8938fd01so10469736d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544699; x=1795149499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pTCbeuMBw4mtr39j3WfpOFFcKqtGe3X/Jp0q87wrlE=;
        b=N4/AQyBaK2t3RlBLNPt5N0jsmXcaICmUAn74EgkFJ8PTMSf4bhtTdx7CwtYPeGvco8
         OR42eS9vyrCDHvt3QkCcZzxaoaSQSTCA92mpLMla/p7aYKvyd1959oweVsUPpQXlhQw5
         zwn5w0Xb9A3Elib2NPNK6lSa9LHPy2OAl4W777Ba9Jv90QJq6n19FpHwZV2YjkZiugyE
         x3kJ6ck9+ca5VDDNpGaSUUYlwFYnGWPDTnoBvDX+oW6NyQ3v5dTKC7plFJIiq7UONsZf
         BB+GQa5p/o8dyN8lGe0pCDBAB29Huez+0m6eybG2k2bs3DxvronTZcuiQMYZcrr0nusC
         sSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544699; x=1795149499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pTCbeuMBw4mtr39j3WfpOFFcKqtGe3X/Jp0q87wrlE=;
        b=LPtmNmJM1BqFpG5e2EkjzkYMrXJd2+NjFdd9ecWoAhxbUM5A2ak3Y1t5m3hAn8iWTE
         M3NzJrgXyYjXm3tSBlJyKUQNNeWDtXysGiuf5J8Uh8zz6YiPD1YMLKtgQSQQpuq9Immb
         PNirBU61yc3WYBdeAXr5Y28R+1AkYr6tTpoKJpSy1WjB/xnOD0JZRzu4WwOklue/pEMB
         5k+AXfnGDd7kZu9bbz2UclRCrvMmx+slFcAcOc4KuIXlIlZ6lYAjzej3OFmx7eqaJ+tq
         9UTt1JAVETikwTkLN2/tPCVkRmDhOI13vpwcDa2C2NvM3lS+i4KHURl9BRDjEOp+TZ27
         qXlg==
X-Forwarded-Encrypted: i=1; AL+hErFVmrJ1DzCoNTmHbuCsJq0exJ8S9M9Gv6xefitxMJXEHxvPtUFFcMszM+ERyRWORQVA1G32EMnmCfVSZAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nBqRXN4tEnhlRBDYRWd/4KpsHh/wbpajkldRZR9M17A5EIR+I
	N0yMI5VzVgFo+0o+15n5v5P1aZTtuJ17+J68ey8yTqAv2zikLttamTga
X-Gm-Gg: AYBFou342GyhLQBX3WIoyii1Cs8gZd73Q42ifMqDikiAjeuLVvDDalspEt6uLVp9FPe
	EAZEpuVP/K1LRJdx7P+5wWIqxrdu5niJg9kxy9qDzqqRo6Qt4ySGqIak5oRXv0E6l48lrZaVxgf
	lG2BV0WZCALLdd4QCftQxrtaRiWfW3z8d8wCydevchnRtMnshrvMGRbP3bbeOZAanraoxxAHTNr
	ICF8Dhm9tBGrk8voejccqfHMmX6FCAQx4JgT+aG1QigVdnYjqmHW09mOojYEvmO6jklYTU9vgFN
	pYJH8e10lIvUBl0YMvSkN45tLfi+NfwNyWADPXjtq4+/THpz0q1NN1KmyoL89NMFLoyyYBGKx85
	PaO1eXlSrDkWt9EDxIBdNvGLfAmS5xw49qNXSYahRXI3QyWcqIuqWnXXkCwJWxTFB5Y2togwRXm
	0CBKUTGsKe4ZlHgteXHX3WjkYTiTffRUTojZFY72yWi/0enbM5z0jxvxx+GK3oFI1ueAE0GIlMg
	vPBG1tuY9xiVqmtN5asXPGg1uFWwiFc79T7QV4pY7QqdetfTFDvdBIPKPk/3huQkZVMw3FGf/HO
	fFI3lMGspjXXuLwnPB+QHiwMocv7lw+9cbIan9rPZSd34hnH1TIYtnGVs9Td2mygNxTqWrYP1l1
	SfFj6wunJlD/9WXKnQNF1
X-Received: by 2002:a05:620a:400f:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9494bb5198amr253467285a.36.1794544699199;
        Thu, 12 Nov 2026 20:38:19 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f9576sm97734885a.42.2026.11.12.20.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:38:18 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jiale Yao <yaojiale02@163.com>,
	John Crispin <john@phrozen.org>,
	Sven Eckelmann <sven@narfation.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath11k: hold txmgmt_idr_lock while freeing pending mgmt frames
Date: Thu, 12 Nov 2026 23:38:13 -0500
Message-ID: <20261113043813.2174717-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ath11k_mac_vif_txmgmt_cleanup() and ath11k_mac_tx_mgmt_pending_free()
walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
completion can meanwhile remove an entry and pass its skb to mac80211,
which frees it. ath11k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
from the freed skb, and both walks can read an IDR node that was freed
after an RCU grace period.

Hold txmgmt_idr_lock over both walks and make ath11k_mac_tx_mgmt_free()
expect it to be held.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

This is the follow-up for the skb use-after-free that was left out of
the "wifi: ath: avoid IDR mutation while iterating" series.

Compile-tested only, with x86_64_defconfig plus ATH11K_PCI and W=1.

 drivers/net/wireless/ath/ath11k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..ef60811fcf54 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6151,10 +6151,9 @@ static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 
-	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
-	spin_unlock_bh(&ar->txmgmt_idr_lock);
+	lockdep_assert_held(&ar->txmgmt_idr_lock);
 
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
 	if (!msdu)
 		return;
 
@@ -6172,8 +6171,10 @@ void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar)
 	struct sk_buff *msdu;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
 		ath11k_mac_tx_mgmt_free(ar, buf_id);
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static void ath11k_mac_vif_txmgmt_cleanup(struct ath11k *ar,
@@ -6183,11 +6184,13 @@ static void ath11k_mac_vif_txmgmt_cleanup(struct ath11k *ar,
 	struct sk_buff *skb;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
 		skb_cb = ATH11K_SKB_CB(skb);
 		if (skb_cb->vif == vif)
 			ath11k_mac_tx_mgmt_free(ar, buf_id);
 	}
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

