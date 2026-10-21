Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573804;
	b=uC+4cF1vhhwGORMDNPtDuyB7yUFcMxeGaaXaP064U3RT2mXA4uENWyRs1JPW8MdUiB5y
	 KHGpaJUhy3GFTNqHWxg2athHifilxjNWenJHQkrslhSpMA4gd+fl8zCITy3Cku74+VLGP
	 497jaYDa4fNwY/m/R01RlneckXVLK+aoj/iA0imHWV5w7XmjMFsOJnx6dDcFq1wVZJ7Hp
	 +QQjQ9w/DVz/M88FpQS0ziLzQl7bk36ieYultX2hwwLznjttPywa5dyXCS9D31Evz8jxY
	 9xv8oNWv/odF1KZMrroONgSEGy9J/DI4xFaanDyPA38gIY8cYR1OIG4oNAqh9wlLiLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=;
	b=B+tfqpPVJ8oCSa31jFFgXNS1Mi1BWj6W6sUXulAR5Nq5WqFygSPpj+673oE4uaK35gkA
	 ycQFwnHtOe3Ma9KQ+y9xwDnvjp98bMHH4s0Td0oIHh/HaJK2sZtg+cZWlWN1EYRSK2MoE
	 rIuGKIh8WUU1TS8nAoQwBQ2YC9Yq0nuApMWu3rsDaszvfl98dTkM/cj66oB9Bt3GN1Ecw
	 knpjBVq9L3cj/authc8jUZIdmF75IvIpXPtTetsblKfjcCip+7gv2AMKVUpr9JeuT0uLs
	 uk7JIkuUfqUX/RjrDdO7TEEohjfR0Ki7zFpjCJVwXJgMLg/dZsbgV71x9F+ZmmAmKnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPFX76al;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gosX+jzN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50560A2615
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB50560A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPFX76al;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gosX+jzN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMwR3573312
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=; b=kPFX76aluWrlYph5
	T1B+ke74pp2O3rxLqvII1slAZhq0xI9tNHPH074sdAMHzq6fK82KvxQxVE76oTp1
	ulNQTqSCBvmpb4TuXnTU/BvtDf/47UIVSvzz2g183efsd5/IowrU3lIlzISH2PCM
	KUBkjKsLJqNvwMpmMh+1/sCbyHmEqlortveeguFezKlA2Hu6EuokE9NEVmmpfL0Q
	4dp2DoFOzBFkEseGPLGNsmXhS5G5KnKIYfJ+e6OvnoXD3UB2qKueML69UxwzhvW6
	y8j2h2JAkqTzytWHJgfnO8Z6y/p5DS91s9xfOPLlyP4C0/LigfY8dWwleHEpAVkh
	Hh6yyg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hu5ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:02 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so788922b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573802; x=1793178602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=;
        b=gosX+jzNcX5ynWT7lZJJ8ptwBPFS/rKNWnbqw8rsv2xwxJOEr9aWU2Ym4FVJGTltot
         Rdex7XB+c7LGXYD3JtfUIXkq1yVKO6/Tg+jWzTGrvLZQAC+gB/bg9LCh2nruyxsoZQea
         NRSJ8fRvxOjkyO012khUvtNf74LiIIdefkbjiJKKORmVDrMMxmiHkC2kAYAkEZKv1X+Y
         kyFTrInI3CPM1ye6jeuE7KEO+XP/Xx2OecDLW4Ivh2+p7lEleeJZ+jJ429IggFHrQuqY
         p8oNVCE6g9HhC/M9PJ0xhW3xiKyn/GzZoYsgrX43rU+E4XJ8S7tbMY42lm0yILux7OM5
         Bkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573802; x=1793178602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WiUpylXz/olEgRUStRYj4xpwHKMcNRb0dmuXCZUzVno=;
        b=UsdF3ITinsMqUkRkduFZqcmofpTQOnbxpbmGlAGt9x9vhteA2Qauv5zAVcbXr8R+yz
         11ZgLDH6eQTKzImkeZdjODmJvHqV70/uTdwpgDuHGxZX4cgSXTzM/EywCeSOVAISnU9h
         EvbluPW9HEuhiAT80HxvX55LqsnED0X7cbfkhnIkVERAJvJlPFO3Gr4mSPlm185lA9SU
         /Lgbupjgb13b91bpA3owI5PbjVNl3wjN4JFVM2YMmt0MMrshykSACjehn+nZ75P/G6Xh
         eafwNmBBfkdDy886ezMDzWxhMOMFKqJmGpUS3CRAroG7wc64w6MqOeI0i9zTVNt7HoRI
         z6qg==
X-Forwarded-Encrypted: i=1; AKwUvBz5ukTbBE+KD0L1lBT0IU0sWuDoLPaezz//tejap3m1ar9pKdwkBxOCZqYNts7DK85KBdMqU2Qq1WeqxEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJG65UsE10NJlkG6N69azorq9vZEuEFeQ0PE9E0LovaPGyWu5U
	DWuq6bQ/4708AHF+P6myjMDJltP/CHauxOrxA+jQPcelpn9I6JssoJ/j+R6v2rTIcHWhQbIjz/D
	DwYpIaf0wBmcavRUBb2CbK3JRpOC4NhnwkcQR8CP1comNyq2zPQFnxT0V2Z1KvmCyMEY=
X-Gm-Gg: AYBFou3ouqu2aWPL6ypcOtlslOB6yBsq4jvin1rjHkYW6a3iudEpalyLNvOYoQMricK
	bGkFfUSf2J2kLLW2rC7iEl/DToAlEKaE6PyfxIVDx1KR55+3dYjhD6A4JEPWdGA8MwGKYF0YG4C
	hB3j+pKSEWPZcEX332ff6PU7j8vpbyBYUeJZNchfBejatyozSilMTNHLpatQXFSfxWeSWBM5XE6
	KY2meO0rC7kGlxmYqJm+Tt5ZdxjIktxfA33l/wfkDeP66NYK1JBGP4eTAyOOGsC2IqWDbF0mPpG
	hCj9j6eFNUs0YhQU2X3derdFBrVeEsT4ivUP0ubU1RNc/31sKSuaVY56MtT0Wxnns5ymYQbJqL3
	IAVpFrONYnIXttMNMsUI1ihKO4UjAMLeOVqHehQonizWaE7KQjw==
X-Received: by 2002:a05:6808:2226:b0:539:df4e:2d25 with SMTP id 5614622812f47-5535fbb86a4mr911517b6e.28.1792573801691;
        Wed, 21 Oct 2026 02:10:01 -0700 (PDT)
X-Received: by 2002:a05:6808:2226:b0:539:df4e:2d25 with SMTP id 5614622812f47-5535fbb86a4mr911505b6e.28.1792573801246;
        Wed, 21 Oct 2026 02:10:01 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:00 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:33 -0700
Subject: [PATCH ath-next v2 5/8] wifi: ath10k: check the recovery deadline
 on its own timeline
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-5-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=5132;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Zm1I+cLC0VNPdJGg5JTNbho8Qm0AKnQRRx3GT6kI3Fk=;
 b=IIfx2/kiO2eEwv2ja73Os+qHLV+1i92khTHC/Z3H66kVZU8OoGrLul3JF+hJJo6LDN6+7dTus
 O4Un78hiyBMBNP8Z90ts6XnMxcsrMLUjvaZy7hEDHpKuebLt2dbornd
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8816a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fAo9eQ8qjfjkKEXINywA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX67WqLNF6x9WF
 yXAQCvexBIK+koyxsNbYkS5dZv50Z/QKTUto2bB9wmXpnvdM+NCTshQimiQQfp0lzrD6Bu49Q/2
 zlpKE0xjo+C5JTSzc3RPD5/LcW1EVsM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX9B5kmvoGMIGK
 bMTkzMg1EdtgsXeghvnWVmrYfXE9C6ejqxsk/JzxLtr+t1/TddvbfbpfGxnXSC0QW26kFeDuDTS
 dqoF0CR0jyurwhERNGbkWUouMeUASLxRZrLWSF/MpQ3mO8HXQJmVVvY5drOWmbChTligh/HXmGE
 2tCFplsT44Szw4a57H5h9vntWGarDC5VPgp7EducmN2wsDsKdmodoamDZoFzY3ILi76ErzvJMmQ
 K8dUq09WLuGSZJPh9nY8Mwv/ZJS/RJeeQksf7x4hA1q1NctB/x2nLQlI5OoWMQjsIqTCBr19m4b
 7+rlI1oVGCSHOWKykzwOF3RohzyK2E7Irfx8w7puhe9YXArnetuanIopHm2j9E545wai1eG8qbR
 s2wstR03/OV68tgSme+PtQY9mxc8Mqm4oymdmsLvUK4iHsHh3AtTO//4lFmHWU+qJ4coIv/PsLn
 SJCr9Crx+FZ9zRr1nfA==
X-Proofpoint-GUID: yAIstNMJT1Kt2eMCAm0QfPkJlL_7SYps
X-Proofpoint-ORIG-GUID: yAIstNMJT1Kt2eMCAm0QfPkJlL_7SYps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Recovery timeout enforcement currently advances only when
new recovery triggers arrive.

In practice, the interval between triggers is not bounded.
Additional timeout handling, workqueue congestion, or other
recovery-related activities may delay subsequent triggers,
causing the effective recovery timeout to extend well beyond
the intended ATH10K_RECOVERY_DEADLINE_HZ limit.

If recovery becomes stuck and no further trigger is generated,
deadline enforcement may stop progressing entirely.

Convert recovery_check_work() into self-rearming delayed_work
so timeout monitoring follows its own timeline while recovery
is in progress, independent of future recovery triggers.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 18 ++++++++++--------
 drivers/net/wireless/ath/ath10k/core.h |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c  |  5 ++++-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 25e9a8f0ec8a..6b6b80242cd1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2525,7 +2525,8 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
-	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
+	struct ath10k *ar = container_of(work, struct ath10k,
+					 recovery_check_work.work);
 	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
 	int fail_count;
 
@@ -2539,9 +2540,6 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (!atomic_read(&ar->pending_recovery))
 		return;
 
-	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
-		return;
-
 	/* Record the continuous recovery fail count when recovery is late. */
 	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
@@ -2550,7 +2548,12 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 		ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
 			   jiffies_to_msecs(jiffies - recovery_start), fail_count);
 		ath10k_core_enter_wedged(ar);
+		return;
 	}
+
+	/* Keep checking on our own even if no further trigger arrives. */
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
@@ -2571,9 +2574,8 @@ void ath10k_core_start_recovery(struct ath10k *ar)
 	atomic_set(&ar->fail_cont_count, 0);
 	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
 	queue_work(ar->workqueue, &ar->restart_work);
-
-	/* Start monitoring after publishing the recovery timestamp. */
-	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -3755,7 +3757,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
+	INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 0319da3ec022..a1ded2cba103 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1213,7 +1213,7 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
-	struct work_struct recovery_check_work;
+	struct delayed_work recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 45a3082d5a64..693b935536c2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5428,7 +5428,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
-	cancel_work_sync(&ar->recovery_check_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)
@@ -8173,6 +8173,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		/* Cancel the monitor first so it cannot bump the count after reset. */
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+
 		/* Clear recovery state. */
 		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);

-- 
2.34.1

