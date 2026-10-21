Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573805;
	b=gYikyS1fypJGe66uo2w6Wt125fT1wE0vSZ9MFAhKmtxuUqVoiJ5dfoVqNSeyuhYOp24z
	 JRXXG7jXgeyWrY3QgY+sb+bHqlubduly0+xuQn5EA+w09hX49Joeq4ynL1r0eOfr6XmRx
	 2H4z5RjRvBF/6aasc31kXXbuz/8yReey94CFP+fX9OZjeM1+pFaCzPwWuI8fJjNMMv/AK
	 bf+ItwbTmLk1S5yzoq8IxQYI88kf9UY8qRtwgDl5x4bkGS8LOYG5irDxS2HH81Z25PHC+
	 YqvtPpJIgvd6ROfg49k4bzvuSwdyoYcVbmx5muTndGpAuMpwLUvDPAsm6A7QFnn1xIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=;
	b=mtQxjK70g3RumKRKj7darb+9p/n9f8sb6PeFjJ1ru4JD+xpoSmSM2LPf/+N5MKaQ+BEY
	 aV7d170bSedSu9x94bPqLVHzIiIwa+EF72qhbj+7GF8PoxjZC2kaG6ljfKixEu/E7Y+nY
	 P1Kn40gv4+9QCqLSbBVyq7QZar56II7IBSFwzGkfCLtT6Hxj7BYLEd7DvXKHITDq6hZkV
	 8fcGOBb8Ya+y76BzD44fq1ewRu3QKHJAdvs1aw0IGHW7IptdrUKoBhoTbgWxW8pWt/15g
	 0IQNkVyrfGTQx0dOEnXj5TIvyuahnJCauJ5XNaw/trr6q5bO/0ppx41slebbKJ8uGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOnlt0h1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjGCBp9N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2121C60A263E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2121C60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOnlt0h1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjGCBp9N
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j7Xk793411
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=; b=cOnlt0h1d7kKb+W1
	IVQvBkgrSep25aqhcWG+aMMBO51uTK9AsxijMqx3H4MdBqzjAI6yAkQYLYDSjaIb
	WPNjD2t6iuIV3/unJ+pwALGAKJrwfZYkc1IAAvHArTRrReYvvfN8zUlQM36KF/WN
	ioZE7efeAA/CX6CH6jkfUzI+W9Gh8KGXzw9xxYVBwvDWregJfULg/r1aI91XZF90
	5Tpo8ew8xl6cfFXZSmR0akxHcdLa8ep4/UK2fzAErLsa9EPkn/jnPlJ6ClqlnHOV
	xGsXYKPGYeiSnNm6YnNNK+S1/oHrquHVtE6rLdxfycLRPkzSWY75m6q7c8+cXq/P
	0tgD7w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk6rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:04 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-844195cc415so663608a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573803; x=1793178603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=;
        b=SjGCBp9NxNGg07jlCyB1YmTZ52oN7eU1NjENN0zyiPYG++iM2SEnXFIJHf1NhLS/3y
         DcFVhh86APrRgJfcIYZMOQt1S5SQzFzzJWwnbawudD/hUkkpeuip8J9TsnlmeHE8YetD
         jNkaWPehz3i+UT8OvybQCZJJQX+KxfE8DlsTss5X678nPNqfwCKbxwxaCEGUQGrZjGjw
         1eTlA/B6njawXz4IcIgZaZpKPNXXIzGyHpMfgdn2PudU8ogBV9xBr2zUKSNlZWoob13k
         x8LlCHl5/40B3+KTgUc3Wfij3qnFtMW7XCb676boInFwN2yVuEO6xyPBUTXDNt0oIue6
         q1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573803; x=1793178603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPVcsUgfs7OUGvpBli68749xFmB+62PrtmbrcnsPIas=;
        b=m2gISm7zHVITYb+9w61ACvagXZKMSjuRb62VupyGpcylk9rHiYM6bCZEkdctqBJPbh
         rDcHGByO6U/u1EO+N8pTvRhlhl56+vu3dSyjOISdYZ5lPcBv8StT+DLGzGN/SNieocL2
         9WHUjxYn43E6BRBd003SJHCstofMDSl45uvVwfye3818x6Lx8t1xBVbLbDpmWo8AUKrP
         +kYmdLHYkoSTFwuSJ0Veta+dy/xplSYCKYdcKXktcckQfx4LCiJIKmwMfiL9CnR9BqS3
         krG1RNM8TtIp7EwPUn+QzdUNN9hIdzbcktoweyxSxMEQG3YEWOT4NEiL2fu/nM067U/v
         1esw==
X-Forwarded-Encrypted: i=1; AKwUvBwlezrRm3rc3R1HvmveD+1Mno8ODXZ2rPITCVEgiJK8UXbjWZ2GBXREn1qB5FaxHAXWgda3tVLNZYeIdrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPfLPbBEv1+v/KMCgkV0CSY31jToGFa1r2HnvNtplWY8akULrj
	TSR9CGXK3dMbsejER3Tx1QCpxzrpx8s6LecMYC74LQ3szJVsrMtHqR+2KZZHJ7pqvex6ebjyVSV
	3SQJhjY4iiSYGGTQM2SqvHSbYKuX4oUSm9aJKTYSKjxcg3xrguyV8B3E8XD5iAkG1Cd4=
X-Gm-Gg: AYBFou1rlSVE60I7jU16qDWwqukEKSZrq+8t+piV9HF5NTKT0mauGjBvsPFSBG5RhYf
	Jk05Ysd5F2P4CAz8SfyRi0iCBB1ZnU5BnmuNxSJbS6mmXW4nIUSfng2BdBrt6CdZXZQFaa5kOhk
	cB6Lkzr7qomxIz/VsT9Y+Q2AJuSzCJjJ47ACe7xNvA+JlC1ZsykmSAzfI0xHecZZ5/3ZRh9P8so
	UxTPlg1bnkcYlicpnzJ3M7tUm0omI+f+8lV7Fv2cAptmhMcFrT8lSgnuvF5ObJn32zhgbkwSbud
	UOdIisAy+97sqbWxO6pQ1zeFAmlzxUp1HoSKSVSAaiivaKbVlO4NgfxDE0arhMN0WHyN0kiaYW7
	eRCs+Q2wYPWl61Zw8Gh+kAPcQJzu4KUVm9WyJXvd3dirHdx/2Bw==
X-Received: by 2002:a05:6808:6d82:b0:4d5:295c:a82f with SMTP id 5614622812f47-55364d258b5mr732739b6e.60.1792573803443;
        Wed, 21 Oct 2026 02:10:03 -0700 (PDT)
X-Received: by 2002:a05:6808:6d82:b0:4d5:295c:a82f with SMTP id 5614622812f47-55364d258b5mr732726b6e.60.1792573803034;
        Wed, 21 Oct 2026 02:10:03 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:02 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:34 -0700
Subject: [PATCH ath-next v2 6/8] wifi: ath10k: hard-block the radio when
 entering WEDGED state
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
Message-Id: <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=1618;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=6wQOkQ2hXX9hGjM/vuhKeWn72iJTqSx+IKksWMLSs/U=;
 b=CzZ+VAhpbP/IGkAFZ+AV9iboiPWbMFmvSs0lxqlueWoldNAu9/IyQgofM5dHnMG1CA7F2H6Ef
 oqaTgWyEYL4C9tb7TByplY7sck+Azv17w+IK5C7cpGpPVqKpHwsggGn
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXzXo9x1z4THzV
 KzzaULnz9oUQ2Ge7+6H/57xLJM8G+bkX/4sYtNutuXR7jHAtnOnbj0w/tl/Xw86+m2fVJVGDAiB
 lHD+tmPcMji6ohdu6t7qw4EIRq4yNdA=
X-Proofpoint-ORIG-GUID: M1RLmAcixkaVpUPRt1pcWOlgbzIQhPsd
X-Proofpoint-GUID: M1RLmAcixkaVpUPRt1pcWOlgbzIQhPsd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXzdFuLjIquxhj
 O1P8ZakGel6iQ82ckwPZ9YPOcYSiTWSU+nrdCsxUx1wkO9lkIYWEWAv3eXpmsvGccEEnacaJLOb
 tCmPo4iLMO9k2B+IdMHYaKwv5GWmd6Y6G4BuIkpa6oq2juiRP0b0Jomz5mBBLh3gaCEVOnDcEdd
 o9tXltU3wOqk4xWr6hJzZfRaJ4dReFhmYGGnQsoYWPivYqy+U+1EnGOKNlWnHGXK2OCnqSsz/xk
 Avn++YrPZMlEvvZBGC8MYgADyzi8bkg8s64oRyLTncKxL33sLFfFUcPuZBZQghBHOu8+GRo6RMw
 xdwkyUjErnu8PawHqhdfdCEqBAxf6rl+LHIeD7jkIExagx6asuXx7PIKGp8OK3gKg/plFBN5p7g
 /XUeoQAqaJAQpnDaqMvjq9nhlnIU4cGwbV3Az4/2BXRuOlKCpSlbYXEnQi/N6OkJNnAM5p+QsvS
 AeuGiLoVvEE899S3YQg==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad8816c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6b6b80242cd1..66585cfa6d96 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_core_wake_all_waiters(ar);
+
+	/*
+	 * Signal the radio as hard-blocked so userspace (e.g.
+	 * wpa_supplicant, NetworkManager) stops looping scan and connect
+	 * requests at a device the driver has already given up on. The
+	 * state is cleared only when the driver is reloaded.
+	 */
+	wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
 }
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)

-- 
2.34.1

