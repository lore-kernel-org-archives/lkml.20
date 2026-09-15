Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456B137FF40
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459311; cv=none; b=Bfzvlc/pcvyLgI+KonQdcu1qSPckYaXw1V60ry7/GvuyT4T2u55yGLu/G8g+d5JFsxBLHbmhYWomH2RR+BNeApJAk26cyZ6BU/PKd+CUHbPMEHmjZsvKKRP5KlNqpPiFqop7YOXhGfFbMnwnEoZwjKiVpQ/5lDiR+peng295dcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459311; c=relaxed/simple;
	bh=axkgfLly45euzCFhfRH5nps3GPcmIBsA55nYNTFGg8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q+dSmluJ+5YsRdLWrg46ZFIurxXMSO97YoHwSPFvbCvrhf7RNRDsCMtmWx30ADqVIe+hi3e2TK6qd6VsW0gbG35I8ROsdqHAajtWlUbvBjVQHXLfOMwX3rqH5zJnvhrjpFZRlLkoCm44dEexDtznjwYQl36S/BaPFj/u+UP9cs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlvxotWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEiAkjlU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlvxotWO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEiAkjlU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7OV2415169
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oa6Q/1/UwGnZVW8dCztoYeJ9PNBU4QT7E+k
	pBF0tFpo=; b=RlvxotWOOPfbWaRAe7We+XLV/vySKZlt/Yb6HuaV356x08piRM5
	rPsWdPt4SL9LIbvBe+Cm+EbP7FgzXXT8E57d1Nxw9gqYcyUL1foWKAuYmifSotg0
	cUIUmaQijfxEKXz0HkL7uIaVn+otwCdtywpyq176XTnnOCV19fPoeIKREqBU8sE/
	aJYx7s2p17CU9/OgGeZqbvO1MD+9b4kcea5l7vFyNpW81wAoPHpttmNckTWJ9inl
	kglU37ZIHuyLjGiFzaVVmbhkvWcUt2AFa8aKIaIyH9n8wlk8eyr7ugb3CA/r/jOd
	PZGtIqgTC9zzO2+iSNugFMSFFowifFzsN2Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd8skh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:01:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so8410526a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459308; x=1790064108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oa6Q/1/UwGnZVW8dCztoYeJ9PNBU4QT7E+kpBF0tFpo=;
        b=CEiAkjlUyPi6ZKYhofOVIqxwNvxeeHPspO8fEdbo5YrvGeJUW5AogQK/Z3AScxHd+Y
         Ib9HxU33CjFxwloNosLQ2kgGUSVleJ4Dch3gT60c9xrNscHCpGLKXK4HPt9Mq0cQJlB3
         Avvr10AFtjl0940DgEMt1BGTkKdU9Q+V3Gxdr/1YPLOzjvkfFodItEqB1x2p+JAvvEqG
         bOp4xBQryi+tq4HPGrlB+dFBDKEqVsuTlx8LV7jAIRvIFxC+3wy5FKfPgd2Q+qziRWq6
         nMIlWStq3QZ5ZNIHWXJpW8DfNgt82LsfhcAq8rar9+ElI5m9d5Mwd0Q8v4AFfbHKJ/bj
         hzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459308; x=1790064108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oa6Q/1/UwGnZVW8dCztoYeJ9PNBU4QT7E+kpBF0tFpo=;
        b=nVOG7unm1QbtwoyhKyiXr+R8g7KzA7FyMwNGHaLmA1V1O55mlJy2X6EJT63Ar/uKO7
         WOSSqJD4TkvoMQ11Jy0bBzuawaRXQ4SUfqEf87/VQyk3dveGng+lOEPKdyx+EbPIlR2Q
         pILF8Sa487rPO59bQct3A1ROfRy7DH4R8mBsJlXhoyKIjNeY3XVeXcbhVt03u8fdI0Xd
         4i31hbIDQoKggOaky0oQ66mcAVAPRi/deWIBOQX+prkLtTu6YR5tO/Y50qdh2SmQHs2t
         ziHNR3wLYLoVHZYczZ2Bq7+aViu+Gs/V2hDjWNfOqSnphao3LWfoJ9hl1ydBW3UtoIVY
         KgLg==
X-Forwarded-Encrypted: i=1; AKwUvByRWPOoM90L81ycm6tOFb8XVinR+nIX1SLGojwvY5LvnXti567O5GoHe4pKxam31+w7vIXmy/mtgwS94Rs=@vger.kernel.org
X-Gm-Message-State: AFuF++l5z59tFs7rauG5SEj9vEDPPJ/qDfXBqWpC2VthkBiBP4dMDs3v
	00Lp483zk/H08Fa7LJTdshUNy+VeDSwp7BfLFNhfmj7yrXPo+P2CLW0jgR1EGNh9+RJ9T2F2fH/
	MXRKLZyBdztfkHdMxUdKs3vgbqrjQWP7AI6z7PVZXj46IgVvlxCir3NPpKkuIUpJNIb4=
X-Gm-Gg: AYBFou3d4T1/1OF71HqFC9wUWp7K2vhhp0mHwrDPJwb7zqhNObdexy8GimHylMW8a/q
	m+484HPFP5rDTRKCUbSYJxnuyEqekitaNsvt/FkP23RSnzLrBsZtGPxpCPCi4XxioEKkbdW4CeO
	Q1VKhreCAymLzV3+alNP8eBsmeHYUKvpmwrAluCoGSVZ30zDq+fTS9dHwV4Dqddqn4cQYieGF4y
	JTGqBFswPQd1m5n9vszjTrCzHH+bnlaC1HH5XnuMHAHaLJS9hYsrxB+F+35Bxl8eViQgGij6W57
	v9vFaMpaDC/T79HsajTenGrg+7kW2x0t+xuM9/xgM22IxkRFqxMkwjCr9KmrXk878zyfr4RXM+u
	gQ7xAdsWzgnN7WCz9bMmQxjv2D6eowtgb4hNv88f4pe8EBwVy5HSD1hxtMvI=
X-Received: by 2002:a17:90b:390f:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39dec079f10mr11760375a91.14.1789459308475;
        Tue, 15 Sep 2026 01:01:48 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39dec079f10mr11760327a91.14.1789459307987;
        Tue, 15 Sep 2026 01:01:47 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfb8bd783sm1496368a91.1.2026.09.15.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:01:47 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: Fix failure to create ath12k_dp_peer on MLO reconnect
Date: Tue, 15 Sep 2026 16:00:53 +0800
Message-Id: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfXxq6/Qmd/slS7
 pmiaFiu+DW44MPqc8jRMSw5fGolq3VYDZQVtAaAwNklTtY/5IrXExfn1nOr70ro5R86ekY1PIpO
 9fpdyDY3sn9R2vatNblyWQwkJGKZ9+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfXwIuMFWWP0o2A
 sxrQDhlWXaBYW4QKXR0gzKwzWChAnaDlyEQppIYvu9M5u2tYLBm3M6M8f4NW4NjnMkfslKSewpd
 18BQ2mMBN1VeRQNDAyI55UUA7YCEnAm47itM31A0BmRxF8auRIAYunsUUWBpPAgteOcfql8h1UG
 urhDtuj1LzuMWUMl91pB7Hq44SJJf6TWSXRLNA16slLCM67Ld9Q0iKhcV0ooZty5xY4OCMR0T/j
 5xKkDI053oc88AdMWA1ZB/tZFlWE8ckKVJv/aUyIyGw3an5V7cv5fxssTDrK0Rf/0DeqbNCErDr
 XxF3yCz9wP69YMAPvD7h8tVem4/2Kr+m7wfNnWV/htSWY1xJusm5tj5oas4MmvnBrGy957bEM6d
 SlejYIEjPJKrSiWNc/00b6KjK364cMveyED3MCfuKf/e/DS03DZVE01/4b4F8TJZLPCWzbjCMzp
 QhfKFlxZuC8IySAmwDA==
X-Proofpoint-ORIG-GUID: 6X2-W99GjEWaDctQO9Gc-Qr84IqxNdol
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa8fb6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TNMgkEEFFvq8IQPbtLIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6X2-W99GjEWaDctQO9Gc-Qr84IqxNdol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150114

In ath12k_mac_op_sta_state(), when transitioning an MLO station from
IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
succeeds, on is_sta_assoc_link verification failure, it takes the
'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
the dp_peers_list.

On the next connection attempt, ath12k_dp_peer_create() finds the stale
entry and returns -EEXIST (-17):

    wlP4p1s0: failed to insert STA entry for the AP (error -17)

Fix it by changing 'goto exit' to 'goto free_unassign_link'.

Also, there is another error path in ath12k_mac_op_sta_state() that
jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
undoing the assignment through ath12k_mac_free_unassign_link_sta().
As a result, the link RCU pointer remains assigned and a stale bit is
left in ahsta->links_map, which can trigger the same -EEXIST failure
on subsequent reconnect attempts. Fix this by redirecting that error
path to free_unassign_link instead.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..57861003c15b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7845,7 +7845,7 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 				ath12k_hw_warn(ah, "failed to verify assoc link setting with link id %u\n",
 					       link_id);
 				ret = -EINVAL;
-				goto exit;
+				goto free_unassign_link;
 			}
 
 			arsta->is_assoc_link = true;
@@ -7903,7 +7903,7 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 			if (old_state == IEEE80211_STA_NOTEXIST &&
 			    new_state == IEEE80211_STA_NONE)
-				goto peer_delete;
+				goto free_unassign_link;
 			else
 				goto exit;
 		}
@@ -7943,6 +7943,8 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	ret = 0;
 	goto exit;
 
+free_unassign_link:
+	ath12k_mac_free_unassign_link_sta(ah, ahsta, link_id);
 peer_delete:
 	ath12k_dp_peer_delete(&ah->dp_hw, sta->addr, sta);
 ml_peer_id_clear:

base-commit: 91b552fe898e2c46edb363390211fac47b329308
-- 
2.34.1

