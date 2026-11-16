Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795045;
	b=pjM5JpQ+pQxFzKJYkMaCVFeUAJK8JgmfnMUE3MI7TVGghRILc+vf/B21qamlZvXis0Wi
	 lrtLxbZUo2kw6TZk2gvo/56gaor9vAmJsYne4rtVBXDRpvgLIalirvLeMSnVDVrPfm1my
	 xwslANsQGJTnagEj/eLY/E+16ND+tDL/RLAyyQ2wZIyaipEC4A9A7ZINr3+2h720v8NF3
	 iHePIitOQU7IST0dLmv8deVtHqtOEcFBYFP8dbsDMMUfkRFKfe2eNK93/95DYCATidHP2
	 N+RzfUrStA5SHOoauB45EOAmuVI7ia1iwoJqKhCtsSTP3H0xDqOgkhQvtmQ9UAq6nyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
	b=GWO+l0njxLRLT2Hcmvl29V+OlZFEK3nE+v+geqkTRn0SgTlAZYHTEdOdR4Bfpf4oNpAC
	 3/kv49D1M2qeZyS3yptqRE1I2MXpUzsrKBL89bArkPkyJtdIvYHiDDD0IApi5MlmEID4e
	 myllngtw8p8oYkk+3UW9Gd88+/S7R+3UJAJICEtD7SJ7hT9IYvYgsoArtrTHHX7b57gVA
	 XxcLZlxVT1I46uioPUg5hgHB9iDWhT8Q+3AqMn7SxDT8AoJ4EEG95gaA5OtF0GLBmIieS
	 1E5IV3subg5WILl/Rj8RsuZYQ2OfXeudVQN+tYzb9NZHSjFXDfHDYMEDCxx01enOwwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbqv4uHR;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385D606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4385D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbqv4uHR
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53664b4860bso40094041cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795043; x=1795399843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
        b=Jbqv4uHRQP54cdnuaL/Q/gZHnXBJRWgXPZVEdMzHxXrdSrN+ZbCCCz67AwbrZxpJm4
         fGrpnwp8q3OyYuqYDrgABdKhzipJJOZ6xePz2HSPn0Ot4Xj4aVqZPec+sjv374uauMnk
         Umb61gF2VZhReJ7iP47Lxha+w62hUf98FrmhbfCQH+o93Y83tYu0KES9RI8ICmKe2Gk+
         XCAP6KoMXNADYt9wp/H/gf3UiDsAsngAwkXHmDVxRx01F5gfEj9lEvRoYFWco06hqbT1
         sLFndp2zL7p4sF8JGXF8gxpKFAQSWGUldN+aXLNaPHoOsV87GZyGe3Gfsp8SNqIwqsYZ
         9qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795043; x=1795399843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
        b=Q4HMXQm0akO/TS9PO+n2mA1lEkeL76URQu9UNN1DHpn4mrv8NKdOYltYOy623hXJro
         vfAKtOMgzGYPAusMS5WryYnzuaoxCuMrRgfjtqIBbZMkcL2Whnn55s/G1Es3w4Cl9g92
         5HqQVcvjCKYBaZgJaSyI1NQLd8uCCc82eZlA2mNbr+NBHOc3fLEZlubd3PP2O4RVnBpi
         rHpxPhhIQg/qiuR2NvoMuIvCQXUq9eJPZrLbFc/5c541DDb/souNLJkUAYvSccqcrQ9T
         YJsQYMCiGxMOeee6KpFmvQR7/C5+7dDOPBA/C33ezb68cDqnibBiKruLwbbUVCPev/J4
         sBxw==
X-Forwarded-Encrypted: i=1; AL+hErEQqpi7XVQ1PzNSoN2XX+0Jv5TF8Ih46SMbb869gvnUpmddWrgyPWgYVYGwqUZP7ISkxIyxSzsUOeNDDp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lGQxftS+yll1AeGyZgkPsdSiPUi/YYCpwUqpVYWdO9UtrFnAm
	0mRs/qGDUe9KHRwYYwrJ/UFX0L3bDFu22OFMFXfAjr68t3EetrQIVm8X
X-Gm-Gg: AYBFou36SM2QrTq8qIq1meLtauQMp+Df/S8kJlMCn4jbliX2UgYALP7YWn2h5TdhTgA
	eE8YvrbNAXeVGaui0MXgs02QT7Siz92jrn1YnBiimmnwkAhwivhX2sfO/2kKHDVSRudYvmk4spe
	+9Eu7JfUTcy7/2VKdE8/GdX6ochi4X/4kd165ZTPkpORlGN+YwM6T2TAEZgNXCNPHxIrqkwql9W
	QWCoBE6wZmx7g0AUox9Oaz1u1p9nh1x7ksXpukSukFAsDYCjv6deQUcVMnszE0Yf4f/l7Ly4qZ2
	OSceG5HY9k8eIxz2T/71hdfd/XoJ91sn4jO3OV45XmtyB6hCA4ZJ07rhV1+h4ljjQsUjsfQy1kw
	RL4p4bg/DfxTuAseOjAdlTmUiRjg3so4b5DjGmfmf+vuugzhuA6WHqYqxBkPZOQg4HWNVnbwoum
	M1KgGRT1H7eyTnmbI/lVnWsnQ1lA+vP/cilDvvHp9JrKBKIw3XVQ50X+GdTjlNv6HkWxSqqcmLP
	PVZotIk1J5tvJokB5C9+bL/IGi9ZcYRq155clCcHdKW3skDlx14ha9TqCMtohump1PPbaDChRhU
	xfFn4pRKHbZbF5T7d5aUxEFjj2WK7xCZb5iOSlq/hWW1Drs6Ll+mF4g35d9y/5b1pvfV1L9edSI
	=
X-Received: by 2002:a05:622a:14ce:b0:55d:30f5:34f6 with SMTP id d75a77b69052e-55d30f560f8mr60276151cf.37.1794795043056;
        Sun, 15 Nov 2026 18:10:43 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm22083541cf.22.2026.11.15.18.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:10:42 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Jiale Yao <yaojiale02@163.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing pending mgmt frames
Date: Sun, 15 Nov 2026 21:10:37 -0500
Message-ID: <20261116021037.538128-1-lcy8047@gmail.com>
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

ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
completion can meanwhile remove an entry and pass its skb to mac80211,
which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
from the freed skb, and both walks can read an IDR node that was freed
after an RCU grace period.

Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
expect it to be held.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.
Compile-tested only, with x86_64_defconfig plus ATH12K and W=1.

 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eee3f38375ae..bffb2edd0531 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9220,10 +9220,9 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 
-	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
-	spin_unlock_bh(&ar->txmgmt_idr_lock);
+	lockdep_assert_held(&ar->txmgmt_idr_lock);
 
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
 	if (!msdu)
 		return;
 
@@ -9241,8 +9240,10 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
 	struct sk_buff *msdu;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
 		ath12k_mac_tx_mgmt_free(ar, buf_id);
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
@@ -9252,11 +9253,13 @@ static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
 	struct sk_buff *skb;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
 		skb_cb = ATH12K_SKB_CB(skb);
 		if (skb_cb->vif == vif)
 			ath12k_mac_tx_mgmt_free(ar, buf_id);
 	}
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.43.0

