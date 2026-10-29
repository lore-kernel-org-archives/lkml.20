Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272295;
	b=qSit5+pmLzF318y7bRvt3TW2KDDy3WkgbYCcB95AXIO9cfi9UpxojLpOT/GIUG2lu46t
	 zPoz7paz4+/PB13B/t1Me6l5EWyZWLWUgaUtxYuDr7zJQLArGogApxOSkqs85zJrsWuQ/
	 cM5rcOkCQFMq+f1Cb0DR5asFTm+T8LoSxl4sQy6erygS7ccbGLtpWgMaD7zcf3vJ75DMh
	 fLNJfEOmSc5yjyIh1uk2+hlwMeFGCcG/6tmsKxJJHBvroAe+d0JboUc8OhqXZC3kasyOP
	 eqBVqYVOOvcSHkH+gwQwLs5qENCcX+GVZK/FGACgqVxUKNzSu52+9ntSqlQo98UNZxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BbeBkhwkdDPKaq3dH3r0TFQX31yftYsPvXvDbgxeSRQ=;
	b=C/3uSiXPE4FOcXFZ/hGh26V0eG3zWF4SEqzLsDedM7AhQVhpCMC0DG1gXTuf/q5efI7y
	 WdU2jY0Zabp6RCpIhCh79g9UiHveewuFEOTORZrW2AIWJESJ5pvX7N1C1T/cgmRRivPUc
	 qUHtwZhTvVLtoGvBa/nnLzPgHk18oFFwbgBvihoXuqW50cEzNFWKR5QRibUEzqEvMCvLQ
	 bwuuO/ro9XmDhgpy27EmN7wZEtX+wl0GNUENuVVnq24MUv1uKyE+Hlkr4e5DT/GOVNkJb
	 kfxOOnAAS7W/guT433YrlJBDVWMIiharcLr1BGZRUCsxH8Z8u331zPjHauy02uDsRNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mypD+mTn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZeRHWee;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96492606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96492606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mypD+mTn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZeRHWee
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA3jJF3607197
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BbeBkhwkdDPKaq3dH3r0TFQX31yftYsPvXv
	DbgxeSRQ=; b=mypD+mTn1rvcJAJWlkOSyoTzsfEi+7s7GTePmSbhhY1A6Vwfu2Z
	P9dVx0O2cDkwOWYX66/Xmbpv/PlhoP++ijmg+3P4shQiBmnNH6YrInWDXjpSIhCM
	KNz/93Y11nJmL41z7CNlrXrq41uYwNXlmGZvBEkTqDMc/ts2cslPWMwg0HVAyzMR
	mgvbFAFUqMIl9gjGpKW2YT0MAUHnfC+BwUv16rM55ruBSMvKY8Q4gmjP5SOV4cVI
	crtVKejtTYgCZpR+v9J3gxtoNyuUvKcJLKF+DJPvRk16bqGu3Ud4cw7a3dm/0ex8
	dwv/RuB9g8dB6mn43WjHMhHOKdrqNm1RBSw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fg7s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:11:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc175cb172so1912902137.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793272293; x=1793877093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbeBkhwkdDPKaq3dH3r0TFQX31yftYsPvXvDbgxeSRQ=;
        b=VZeRHWeerZNzVHd2yJJbgPGLQ2Mgnm+CsCBQ/dbytX+zTDpQumtj7IuJwFmJpvAW2t
         cmeixRQmysq0SurEophSe9QvgrPFXL4oIGNqChY6mv7k8hx6xPAuqq0qWio7WATzkKiz
         jkAa7TcEVREjAo9wZ7mnkrMwR+tXYvYR1a3+1g/JS/0x3EztPPGMryqgjwjLZRZZhCtM
         nG2VJEG3/s+F33MhkOvLEIEnuVdLCncowkfbc7PTZR6EVEvlW9KAY8K50+ySp0stNKHt
         68W+0fV5bghae/9nt6u3L6TEhjpQwjslY8b2b0Hvh5bJB5b5vGeXDx4BIgHohBkEntSd
         NefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272293; x=1793877093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbeBkhwkdDPKaq3dH3r0TFQX31yftYsPvXvDbgxeSRQ=;
        b=sdzcOBiWpZm7/D7/HnzGG89YAdgpwNyHCQdOJivnj5I1LEOrfRkRI+9rn7PJEahLw0
         gizqabMNqwarxbStd1GMPaAkYBaJg5gJ5tPBInVzb5sdJgr3Kipy8v28zBvPCjYr9wru
         0oMwBDg3q1hlpx7kpg02NO4+LtOkyeHsGqaEHB1JB5Y9xHQRLNSMy6V14SbQ+X8pR18/
         GgbXgbXK66qedQw/Hfd29XCY6J2kM+XntXQ5Y4HPTjC3S+p0NPbSog1jNJZd/a3ZBs7x
         qB1EPXNY88Wz3y+UXfyz/g5Hr/AG77cHInfKxm0KgpEvswwubstmynm6ZTP76bB037yi
         8Lpg==
X-Forwarded-Encrypted: i=1; AKwUvBwX2tEYqjp3ngA/M+DKywpcD8njFPzwyFJHrRGjcxLqWJ4cmTSnW7YT6FvqZaAUp/vGQ616GVhlmcRWpxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI57a+EE9RIg/ITZK1LW8aCQ/6i2nnZw0wx1N1F+nKQSK+JZKrH
	mM+ciOytXq19/d9smU1k5dqvAirDwd/vJLuH5GAZNNQ29PUDiNxUZXt7mSmMNV7wXSDMAuVPyhw
	Ys5IPe8hJpkb6bfGNYEWTiXs7ouRxJAtYYC7GsIyq1969tE/dneFomhl74ST4UmjipoE=
X-Gm-Gg: AYBFou1wfLGZfg2O7IEEVL+BNoFgJXvZuBYo2DIMBki+GyztR3KSKngEAQZsRX/SJIG
	KrzuO+YIE6zZxm6jl6+MD6yPcUsLelMjp79yxQ9S5Dgy66+jMEvQ2xb/VPtExeWMoHxa7DvvKqN
	z3gnfEbpj87BE31clwDDUeux6iszOMUUvMCWgrVTVgcGd7+7doKlaEGTzhNfhVvIh/kFbc9GmCA
	/yrb8cvdyHTSIqnhdYajpdmCzxuN2AI/xEZHcyr9aIHyi483dQp13y6s5ItAbizAT2rS332SNmD
	oaCLRg+eCshB4rNUSL2btZJhiqswv4Xin5orEVjuyEqtl5c0oJC7YfIilTVmR0QEKySaYEW9NS+
	Vf01/XaWJ4uopwg+1J2Jt1W2qj9cDrN65mDlhGHpIIbJLSRNItl2MPOsSDvPVOA==
X-Received: by 2002:a05:6102:2906:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d03a4ba6femr2393193137.8.1793272292486;
        Thu, 29 Oct 2026 04:11:32 -0700 (PDT)
X-Received: by 2002:a05:6102:2906:b0:7cc:16e2:c1a8 with SMTP id ada2fe7eead31-7d03a4ba6femr2393186137.8.1793272291920;
        Thu, 29 Oct 2026 04:11:31 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm31977130f8f.7.2026.10.29.04.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:11:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
Date: Thu, 29 Oct 2026 12:11:28 +0100
Message-ID: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=33936; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=MXJbBneu+Wije4O4O0vjdu9ozYFURNilTZnSBBbznFg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq4ynfMoP7MaS2D6HquRvVwLHPd/78r+R87k0Lq
 2OEP66GXEqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauMp3wAKCRDBN2bmhouD
 13APD/9VIeujie2BJEqjoAaidWSnnq0z+CRe9zaVyUFjBxbZUFiht/F2J+SPpY/CsgqliC1a6Ih
 gbFD0cxmu3d7YVQ/xe+wEYOIhGkMnG+7WDx2bv3hKArBCKRT7IOi4Vuw2wkGvQi9SMYF6u3RkzU
 Uy+cNXzQWrHftyt9OPcvyGaiqu1eZVb+KMYdii09nmeWxZXGGQ0nN8q1mzGv+N6f9kpXRNKrVBh
 RvF1EmX6jn2iXYuGOpoU4T+aqTHbBS33H6TsG+gfRebD6+Lsa69QQl58GwH/Nb4wlQI4dMQn+wp
 AZyqAJvPuuja60eBFixzCQtQfRY2xzBU33av0tUgj/WGoN4ExupeW+06pPKblPA0lgNJ6r4aq+S
 d/LVlNZ9IjfvlCD0Jo8IGJ8NIKcKdPjEU6FN1YPim3SqDsNyZRSNUOE7BPSoGtKYahZYBeyuXgC
 9RYwxKWt7TDseK/MUfm2SpTShfMq/462sR/p1z5TD2JcEs+BkBic8qAZ0Xih9mF0pLhzXHIdGku
 UjnnMPUJm7JLTsHxGl6ING5G4Pfrt7ATEj1XRfsfJB/YUOHfZYtL7M8lg3DMs8cMM8EhcTg8b1q
 D17wRrz1F5JQ9LXo/Zp7OacLbXHAwkg7G0K8GVq+CwggCbck+BRX5GYugzmB5X338NdNNuL7YXI E9lR6fd9HgJKDXw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MyBTYWx0ZWRfX2pV9vI+CdvA2
 bM5ACL/E0o08rMdokBHdSXlHQpJsdRKpySf6M1TFS79uGxF0whkqdgt1zZq0k9hz0rtW1GLgDsr
 0BqVgbrRo2xThsKGbiOjYrRaKCSWS72Qn34HFse7mAseK9pJawxUFBpPqb/sfsgfQ2u4bLUrlHb
 u/65nQuSq3PspGCVBfMT5/Q57XWI8P/uZL8JGLy4P/WQlOke4ZJsjbChxPTxGZsoTx01Z0nLHY8
 40hjKqu6V54SY5IbwdSZVJ5k+QznKoTihnBQ8ZEsPxxEcyJjv2mYiWiLnU2803QP10+6k0NDWkL
 VzSk68y6xmSDuvR3pk+z6u9eEKMDhKuNY6j14KUBeu/j4Vdk5zfkShSSEncvDEsBx9K5i4zgBK+
 m7N1GAIensnAmL6y0xvy4TysrpMCc8uE+vy2NUE3Y/Aefj4XUDQQdCbc0lrjCq+X5YuCCjFD0ra
 B5fdvJfOzgqGflERrow==
X-Proofpoint-GUID: 1yKp5r_gzNW_v41oglPsKXuJpmzSblnh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MyBTYWx0ZWRfX+abO1lYXqNAY
 EFAgqMHGu1XdphMeaoHTPTnbBcGxEH6iY0uo0riwZ/7rdrAmO6WPwC9NaV3Bs6W/jaiboMxG6Ua
 r6F9NLdlViZHwMNx4bN2qi1q+T93m78=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae329e5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=f38TYOoTp18RG4ttGKgA:9 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1yKp5r_gzNW_v41oglPsKXuJpmzSblnh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290043

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

'wlfw_pin_connect_result_ind_msg_v01_ei' and
'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
Dropping them allows to remove bunch of other code referenced purely by
these ararys.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 826 ------------------
 .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    | 249 ------
 2 files changed, 1075 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
index 279aeb2a7dbc..dc0f7e353349 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
@@ -569,64 +569,6 @@ const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[] = {
 	{}
 };
 
-const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   pwr_pin_result_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   pwr_pin_result),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   phy_io_pin_result_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   phy_io_pin_result),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   rf_pin_result_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   rf_pin_result),
-	},
-	{}
-};
-
 const struct qmi_elem_info wlfw_wlan_mode_req_msg_v01_ei[] = {
 	{
 		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
@@ -1148,302 +1090,6 @@ const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[] = {
 	{}
 };
 
-const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_initiate_cal_download_ind_msg_v01,
-					   cal_id),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   valid),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   file_id_valid),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   file_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   total_size_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   total_size),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   seg_id_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   seg_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   data_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   data),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   end_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   end),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_cal_download_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
-					   cal_id),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
-					   total_size),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
-					   cal_id),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
-					   seg_id),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   file_id_valid),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   file_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   total_size_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   total_size),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   seg_id_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   seg_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   data_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   data),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   end_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   end),
-	},
-	{}
-};
-
 const struct qmi_elem_info wlfw_msa_info_req_msg_v01_ei[] = {
 	{
 		.data_type      = QMI_UNSIGNED_8_BYTE,
@@ -1553,195 +1199,6 @@ const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[] = {
 	{}
 };
 
-const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
-					   offset),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
-					   mem_type),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
-					   data_len),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   data_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   data),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   offset),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   mem_type),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   data),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_write_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_vbatt_req_msg_v01,
-					   voltage_uv),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_vbatt_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
-					   mac_addr_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAC_ADDR_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = STATIC_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
-					   mac_addr),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_mac_addr_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
 const struct qmi_elem_info wlfw_host_cap_req_msg_v01_ei[] = {
 	{
 		.data_type      = QMI_OPT_FLAG,
@@ -2024,286 +1481,3 @@ const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[] = {
 	},
 	{}
 };
-
-const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
-					   mem_seg_len),
-	},
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
-		.elem_size      = sizeof(struct wlfw_mem_seg_s_v01),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
-					   mem_seg),
-		.ei_array      = wlfw_mem_seg_s_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
-					   mem_seg_len),
-	},
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
-		.elem_size      = sizeof(struct wlfw_mem_seg_resp_s_v01),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
-					   mem_seg),
-		.ei_array      = wlfw_mem_seg_resp_s_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_respond_mem_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[] = {
-	{}
-};
-
-const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[] = {
-	{}
-};
-
-const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   cause_for_rejuvenation_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   cause_for_rejuvenation),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   requesting_sub_system_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   requesting_sub_system),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   line_number_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   line_number),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   function_name_valid),
-	},
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1,
-		.elem_size      = sizeof(char),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   function_name),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[] = {
-	{}
-};
-
-const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_rejuvenate_ack_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
-					   mask_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
-					   mask),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   prev_mask_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   prev_mask),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   curr_mask_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   curr_mask),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
-					   addr),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
-					   size),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_m3_info_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_xo_cal_ind_msg_v01,
-					   xo_cal_data),
-	},
-	{}
-};
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 8d4b929e8437..c0b2eaea4dbc 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -240,18 +240,6 @@ struct wlfw_msa_ready_ind_msg_v01 {
 #define WLFW_MSA_READY_IND_MSG_V01_MAX_MSG_LEN 0
 extern const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[];
 
-struct wlfw_pin_connect_result_ind_msg_v01 {
-	u8 pwr_pin_result_valid;
-	u32 pwr_pin_result;
-	u8 phy_io_pin_result_valid;
-	u32 phy_io_pin_result;
-	u8 rf_pin_result_valid;
-	u32 rf_pin_result;
-};
-
-#define WLFW_PIN_CONNECT_RESULT_IND_MSG_V01_MAX_MSG_LEN 21
-extern const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[];
-
 struct wlfw_wlan_mode_req_msg_v01 {
 	enum wlfw_driver_mode_enum_v01 mode;
 	u8 hw_debug_valid;
@@ -365,72 +353,6 @@ struct wlfw_cal_report_resp_msg_v01 {
 #define WLFW_CAL_REPORT_RESP_MSG_V01_MAX_MSG_LEN 7
 extern const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[];
 
-struct wlfw_initiate_cal_download_ind_msg_v01 {
-	enum wlfw_cal_temp_id_enum_v01 cal_id;
-};
-
-#define WLFW_INITIATE_CAL_DOWNLOAD_IND_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[];
-
-struct wlfw_cal_download_req_msg_v01 {
-	u8 valid;
-	u8 file_id_valid;
-	enum wlfw_cal_temp_id_enum_v01 file_id;
-	u8 total_size_valid;
-	u32 total_size;
-	u8 seg_id_valid;
-	u32 seg_id;
-	u8 data_valid;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
-	u8 end_valid;
-	u8 end;
-};
-
-#define WLFW_CAL_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN 6178
-extern const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[];
-
-struct wlfw_cal_download_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_CAL_DOWNLOAD_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[];
-
-struct wlfw_initiate_cal_update_ind_msg_v01 {
-	enum wlfw_cal_temp_id_enum_v01 cal_id;
-	u32 total_size;
-};
-
-#define WLFW_INITIATE_CAL_UPDATE_IND_MSG_V01_MAX_MSG_LEN 14
-extern const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[];
-
-struct wlfw_cal_update_req_msg_v01 {
-	enum wlfw_cal_temp_id_enum_v01 cal_id;
-	u32 seg_id;
-};
-
-#define WLFW_CAL_UPDATE_REQ_MSG_V01_MAX_MSG_LEN 14
-extern const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[];
-
-struct wlfw_cal_update_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-	u8 file_id_valid;
-	enum wlfw_cal_temp_id_enum_v01 file_id;
-	u8 total_size_valid;
-	u32 total_size;
-	u8 seg_id_valid;
-	u32 seg_id;
-	u8 data_valid;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
-	u8 end_valid;
-	u8 end;
-};
-
-#define WLFW_CAL_UPDATE_RESP_MSG_V01_MAX_MSG_LEN 6181
-extern const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[];
-
 struct wlfw_msa_info_req_msg_v01 {
 	u64 msa_addr;
 	u32 size;
@@ -477,71 +399,6 @@ struct wlfw_ini_resp_msg_v01 {
 #define WLFW_INI_RESP_MSG_V01_MAX_MSG_LEN 7
 extern const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[];
 
-struct wlfw_athdiag_read_req_msg_v01 {
-	u32 offset;
-	u32 mem_type;
-	u32 data_len;
-};
-
-#define WLFW_ATHDIAG_READ_REQ_MSG_V01_MAX_MSG_LEN 21
-extern const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[];
-
-struct wlfw_athdiag_read_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-	u8 data_valid;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
-};
-
-#define WLFW_ATHDIAG_READ_RESP_MSG_V01_MAX_MSG_LEN 6156
-extern const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[];
-
-struct wlfw_athdiag_write_req_msg_v01 {
-	u32 offset;
-	u32 mem_type;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
-};
-
-#define WLFW_ATHDIAG_WRITE_REQ_MSG_V01_MAX_MSG_LEN 6163
-extern const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[];
-
-struct wlfw_athdiag_write_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_ATHDIAG_WRITE_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[];
-
-struct wlfw_vbatt_req_msg_v01 {
-	u64 voltage_uv;
-};
-
-#define WLFW_VBATT_REQ_MSG_V01_MAX_MSG_LEN 11
-extern const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[];
-
-struct wlfw_vbatt_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_VBATT_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[];
-
-struct wlfw_mac_addr_req_msg_v01 {
-	u8 mac_addr_valid;
-	u8 mac_addr[QMI_WLFW_MAC_ADDR_SIZE_V01];
-};
-
-#define WLFW_MAC_ADDR_REQ_MSG_V01_MAX_MSG_LEN 9
-extern const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[];
-
-struct wlfw_mac_addr_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_MAC_ADDR_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[];
-
 #define QMI_WLFW_MAX_NUM_GPIO_V01 32
 struct wlfw_host_cap_req_msg_v01 {
 	u8 daemon_support_valid;
@@ -584,110 +441,4 @@ struct wlfw_host_cap_resp_msg_v01 {
 #define WLFW_HOST_CAP_RESP_MSG_V01_MAX_MSG_LEN 7
 extern const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[];
 
-struct wlfw_request_mem_ind_msg_v01 {
-	u32 mem_seg_len;
-	struct wlfw_mem_seg_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
-};
-
-#define WLFW_REQUEST_MEM_IND_MSG_V01_MAX_MSG_LEN 564
-extern const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[];
-
-struct wlfw_respond_mem_req_msg_v01 {
-	u32 mem_seg_len;
-	struct wlfw_mem_seg_resp_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
-};
-
-#define WLFW_RESPOND_MEM_REQ_MSG_V01_MAX_MSG_LEN 260
-extern const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[];
-
-struct wlfw_respond_mem_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_RESPOND_MEM_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[];
-
-struct wlfw_mem_ready_ind_msg_v01 {
-	char placeholder;
-};
-
-#define WLFW_MEM_READY_IND_MSG_V01_MAX_MSG_LEN 0
-extern const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[];
-
-struct wlfw_fw_init_done_ind_msg_v01 {
-	char placeholder;
-};
-
-#define WLFW_FW_INIT_DONE_IND_MSG_V01_MAX_MSG_LEN 0
-extern const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[];
-
-struct wlfw_rejuvenate_ind_msg_v01 {
-	u8 cause_for_rejuvenation_valid;
-	u8 cause_for_rejuvenation;
-	u8 requesting_sub_system_valid;
-	u8 requesting_sub_system;
-	u8 line_number_valid;
-	u16 line_number;
-	u8 function_name_valid;
-	char function_name[QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1];
-};
-
-#define WLFW_REJUVENATE_IND_MSG_V01_MAX_MSG_LEN 144
-extern const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[];
-
-struct wlfw_rejuvenate_ack_req_msg_v01 {
-	char placeholder;
-};
-
-#define WLFW_REJUVENATE_ACK_REQ_MSG_V01_MAX_MSG_LEN 0
-extern const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[];
-
-struct wlfw_rejuvenate_ack_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_REJUVENATE_ACK_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[];
-
-struct wlfw_dynamic_feature_mask_req_msg_v01 {
-	u8 mask_valid;
-	u64 mask;
-};
-
-#define WLFW_DYNAMIC_FEATURE_MASK_REQ_MSG_V01_MAX_MSG_LEN 11
-extern const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[];
-
-struct wlfw_dynamic_feature_mask_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-	u8 prev_mask_valid;
-	u64 prev_mask;
-	u8 curr_mask_valid;
-	u64 curr_mask;
-};
-
-#define WLFW_DYNAMIC_FEATURE_MASK_RESP_MSG_V01_MAX_MSG_LEN 29
-extern const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[];
-
-struct wlfw_m3_info_req_msg_v01 {
-	u64 addr;
-	u32 size;
-};
-
-#define WLFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN 18
-extern const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[];
-
-struct wlfw_m3_info_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_M3_INFO_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[];
-
-struct wlfw_xo_cal_ind_msg_v01 {
-	u8 xo_cal_data;
-};
-
-#define WLFW_XO_CAL_IND_MSG_V01_MAX_MSG_LEN 4
-extern const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[];
-
 #endif
-- 
2.53.0

