Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698831;
	b=YxEESKCbfFleiMfPO1zVi8Xf5BypzXbcutb81Hx3sLZHIntOr8QRlxRb+o2uc3ZnbFmX
	 zhqlnkY4mDNhUMH+Dk2Agfn/SsCyNomw8CCZScxoewZeScdVSmM2sYXcm5YU6p5e6ip2G
	 T4kt17vZa+DI354jpr3ZA0BkCysHFhrrgTeXXMVjz1ustxWZHvCeqeJa8lX3LxfioBwCc
	 XOROjDR/lfsXroTOJb1m0byjduJ7Ayx4/ecq0fI3ySC/hKCGRYqHHLL+xRjuCRfewrA1Z
	 t4D42lur9oq8ihkg1mxwr+oKaYszT7D3obRK/LkscoHCy20CGNKKRy3N9fPn+kMCw5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjdedoHBj4Jc=;
	b=Q0+RC6AzIDmmqHc+kSgArszOqUDmY3XcFoIfKGCtRJIYfyEiPPIkp+dEcz4dM04gQYhf
	 tLwS5WeVyHy6CnzhU9G56eImhsP/4Oolu/XttAo+gDAlfA7GdRXrjvwvJQ3rp7smiS4bB
	 5ob9xqFvdYLrIx1v+6bPp43LtIT4bS23kj+nKnUkQJzPPo+MtOpGDrpVTQsyznrfdQ/Ji
	 vlw3QhrjsYoQf1mk31jsKQNwU3EvNSDhX1E+jbLQcIDIlBPtafGaZGdP1r1cX063D+BOP
	 VNjrBZOamr+Js3ZXTsbzP1Q7XlkBLVzy2OSl8KfR/zPdoQbwQnIZVgR8zUn/scxCyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0Hilzew;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bng99sug;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6560606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6560606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0Hilzew;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bng99sug
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39QqvC1142752
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjde
	doHBj4Jc=; b=G0Hilzew92v6MVHzYKhdRR1T6oucmlGAkKRf2fkOt2EJYHK0iDp
	tG/cTxEaNRH2qiBAlQQ9ZSTOL7fsgr6/99VJUSaW6CEdDnpZZhw5Y/Y0tE1UFe28
	mx3Z0T0bRNwP9uDCvISW7iOgoM1mJ6lxlevWt3d3D1XIBnrxv2vx6MTlHtQ8XQBo
	cce1I2VFySXs+kjtvcXAj6eiWaDVQ+BDlg2NXTXefezxgSJMEkJrwy2Pl+jsrMYS
	fLXt5vOi+M5/F9HDnmSP8SCmVKSskT8gYdQSkFhtD3SJs6w+4TQBf9Y/m3TqbCUw
	li4GKJ5+4YU8qBysC/0KTK2VdXz370lDzZA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycsb9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:40:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-843cf077bf7so5324187a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698829; x=1794303629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjdedoHBj4Jc=;
        b=bng99sug6S1saeieI5S8gIOH+ylRDc5rA2ydBTTsHzCj/YRL9I0c65MfSv9JI6Xqb4
         ajXg9D9iGw+CDElgk4dtaSrXoJdRppN4Yhtvio9fwFbTkyveiIHcXKOEVgc2zQQ0em8m
         k4KmJIxeYKrJEUSGoPKeTZPvOk8lGBFo58nM25U3m1CrEEjmW7Q7JaY2sYLXM65TsNHu
         PwxtItAySJKHXoFiwJOinW+UCb8wUTN+XX8yjAHsY43aVdCiFdzq6kN9b8gNxA9HelJi
         1Q+FywP+rdQpxLp2yZyQkqSDLF77HYCshZCzQ9bM2nL6nIXxnpz9ncZjHdQX00JHeVec
         QabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698829; x=1794303629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WcHWaVy/MY/Uug0kH1jhCYe8yeKUPTCjdedoHBj4Jc=;
        b=SM27GM5+LMDhzGn7rKtcRVh6jqna0GMb5WicWZouzKnlSwTUhyAlPlXko4PcuJ1B2C
         7kOvy00gpRjggWTNtPQiSPUHAlihScSQUcMlYQYIKBNdS0xk/G1ejIZygN/eiBGeJoQv
         RxITLubkwXnxXPfQCd0U2sWUl1q/Ku0rcUsgiQA3zsC8Vid+KLsiHeGaH6A0ZDMpZdHO
         iChhUWXpA3tvBJeSeMWXexrKdZJvcDOdldMpMpkTa6Tmgll1jnb3CeoQP48Gz4ZIBU7G
         5w9gi/lnGTNtb6ot8bmib4+zJ9GICqGYXS6EsUKgWZt8zlHweWWUoO85K2Z6wqwojA0r
         HPkg==
X-Forwarded-Encrypted: i=1; AKwUvBzM2n7xsPaEju6ZIoaD+IVjO7B1Q+aCeKDdeLcTGkCtHfEDms6aFPZBA17J9Ah3Hp9kXA900h8b8SzcEc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wyu9MmuCnSiBj2eR7E29ylufrIzDF/gDeF5qM9UtBBvRRUpDF
	pH3g3pypz3hGvegnHfvwSieEJCgROTCu7KNW91JQ9sKrDjk1hnYdfDhguygKRYc9AoEK2tORRjZ
	BRiSGk7Dqzxt3g/1oKiDz1FuEXKmAEWUQWq5x+D05IsS5nPoBY2oYphoKf2QF89hucjEt3uJ+d9
	U=
X-Gm-Gg: AYBFou3mdnEOR5EgXuy2fpLn0HLw/pLhFCz+YBoTlJo7XaMABgpx+sHL3txoy5Wbqtk
	P6KK7pQggY9rUeU+xr2mzDIx1wy/+HMpu3uHkuqkwmfEV0x7avXKP9UUbIlE9t+alSDHBT8KRk6
	Rq5X3+MGeZqEKmvS5OHjrziR3kCU+6pMGlVqvsscCiWt2zenyjgm75PsgXswsDRggDa+Cv/PZP1
	0ROkehPhkHy+JNqOx0iyjKmmwUJBr7HS9iaJSRwJGJa+pCQof7IYS4zNEX6qocFN2tQWcUc7CmL
	5l2UYSs8AkhS3mGvx9HUUf0lKjF6LFXApaLRSn85upw2GlFUOZOwfOlD8FpNYm9lmZtG0khHXcl
	SOcWL1Ly0VZFVMRoXr+tlV8VN2b0PgeVpItxjT5Z01K+JxZ5alZBKq6K2r8I+e5p0QDKj6eIOQu
	Ygg0bi14iUAD+CMt9gdnxwhQK6lNvyyBIRHMpE
X-Received: by 2002:a05:6830:913:b0:843:56a6:c881 with SMTP id 46e09a7af769-85d3636ce61mr11809093a34.8.1793698829056;
        Tue, 03 Nov 2026 01:40:29 -0800 (PST)
X-Received: by 2002:a05:6830:913:b0:843:56a6:c881 with SMTP id 46e09a7af769-85d3636ce61mr11809082a34.8.1793698828668;
        Tue, 03 Nov 2026 01:40:28 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354f660csm11218241a34.22.2026.11.03.01.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:40:28 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
Date: Tue,  3 Nov 2026 01:40:24 -0800
Message-Id: <20261103094024.1764151-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9ac0d cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UtmVXepWBbLK2i_37A0A:9 a=ZXulRonScM0A:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: Ha04ZrnxbXQ-Ivi3rAc0g2sbl4li68c0
X-Proofpoint-GUID: Ha04ZrnxbXQ-Ivi3rAc0g2sbl4li68c0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX4RJtd+awHY7P
 UQL0dSQ8fi50yohuMRcRk9Zuq7YePNiiLNRHGhwU7ab9ijB7vkC23nJAq0pxThUhmh15thEkw/u
 JGuYBoegtEiqdSzch+jDOV4IeZxYJKRDOqxPMcFT/dGEQgejsOp3IMRMb80iBGp6taLFusUzUx6
 iL7RBm51bq/Ivz+mlmJx4Ot4IDS8wYWek8ApzTAKblB3uKIWpFvwwQ6dO6tv0MTrpHIKQK7reuc
 nxDMmaSucexIViqruYpwhxknBk5ciL1OJg7nKjiocThNfTknu9J3p7R/nRprQ52ofRwsq8yKCkt
 eFekqUVVSQAIUj0A8XCQcYVxK0mtyPITlYKn7I9GYePrwyudvZIVRrVaUvgJgn7beeAzSH5OW1J
 Buu9TobshNWSEznkHP9x8bt/LaUQigMZKM6Zizazfojwt855rhSJX9HeOC9snKxaLS1yh8WzXma
 KFCcDD+f1WkcpTwfXsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX0J1zm02VunpS
 A9S611shezq4Hkef8BiCLZxRMcpRXO2hSyKC7H6X5asolgPzQDMfA92+bChb7ZW/7IK9qK/gajZ
 XzaAJYVpqyU9wFs6FrQzIsnzCyktiNA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

The Surface Laptop 8th Edition (13.8") has the same broken WCN7850
rfkill input as the Surface Laptop 7, so Wi-Fi stays hard blocked.
Add it to the broken rfkill table.

Tested on a Surface Laptop 8th Edition (13.8").

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25987bc58556..35a440742456 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -87,6 +87,7 @@ static const struct ath12k_core_broken_rfkill_table {
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" }
 	{ /* Sentinel */ }
 };
 
-- 
2.34.1

