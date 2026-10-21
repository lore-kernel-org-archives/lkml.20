Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573806;
	b=v1uKm2v65W/evm1EAUIEN8HyodqWUfcUHO+JBKMv51cDKIp/IRLRXVaWBivZ6I5GjG/t
	 AofpCZreKoiDN7wgo/7EjZZC8beR2xF8RcH/dV0NF2xuJcSTGk7anBlo02qjkXjIYJD3M
	 BMc35WlWBi6iwal1YtNpkEiVmb9ID96z59fCTE/7tlH8uLQT4VCh/hpqNNMB/TRk9s/ZI
	 6QqE4y4+2Eclr1KtVYxq9N6/HtQ9bwgthO5ANNJ/WbXgiXq/hl4rCTr3BLwxOYAuWV6hn
	 5GJ43JIGmmTxERUNsIlUdQVEEiKF02xae1SPJ8e2fG6Iu8A3AJg78dQAzDiBkEOcxsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=;
	b=cQ5R9Iup4JkvHenrkr+zeh09IQT8oDZC3zydWffwf/PeIs58rlvblHfQIWQx23LJ0Svd
	 8l4fjEQPz5EOLFOrVRltyBKFZ6uufhm/+3DFJoYvKu0Wt+P+lTQwnifFutdYvGFBFRb5d
	 20upT+PshXvazrZYyQge4xrPQTGSvywqlzg8QCxiFJQ8UFIIipEKHZUyqHqPC+WFJWWWF
	 dn0wQ/oQhSo5xrzVFI5JcHsCYc6uoul8RDFEx1nxDDjlREFjA0rESJNEjfmePxx0YnoyV
	 2f3tubMmOaZOV1sbBJyfJUerjZUsGDfCiX5XS48QtNuv4fXGewsgl1kV2j7whqI22vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0w6X48f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C/YrJyFP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4E606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A4E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0w6X48f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C/YrJyFP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0LY165017
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=; b=Z0w6X48f1DaZ6K3R
	ZLB+y/BGasTuyoYb0wgOk29GTDbvjE+HgFQS4/BIr696zV5nIwCUMRVYv+VOHJhM
	PA+vBU+MrWxykKTCXfpT9lT98cl7OA202DXveWEEM6ChcvqbrEJFCzfa/VaU5/3n
	4zFBRuiRYuIVIT9JayPA/plFY4CtwpWLOfW8Op9Xt8aGKJbmtjgcO4m/Wa1a9AP/
	KeUbcadm1YQj2L3YPQqnWnYYbYDP3vUKKGJ2r0ZVMEkITzn822qqzk4BiwqBvmlX
	Ka1n/DAKnlbyGJy44+FsinoQRN6VMmUa22YT92bfoYGupRjNYl1JaDzGyDn12PJL
	1JolBg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02cyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:58 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c307941971so628803b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573798; x=1793178598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=;
        b=C/YrJyFPyk+kOBnUe5BbPgDzzus0dpYy3YZOlJoQ/5/hapzYjDrZM39KRdgpCzasdw
         OsImrxWo4akgmKH9ogaKL9vAbZGVcJsLj5OMeH5xT6/6+uJZT/Gd375BRm8t80c2DoX/
         za13sy51wYZbIIMm/fQQ7g06k6IdyXDJbnuWqU3JKLoxmn1CacWXR85If0+3Kk7G0QJp
         jjOsySAwnS22p1uEPLi+mxz/Yq7oC8JwNGlVrN7p1QvxV7NjbPnH8YtXtbEQlrt8WsOi
         g0CRfW26pNLk/h1K2qBcNTdETw5Hlpe0be7rnmSLbeo0RB+lR3vTJdSXabrDw5UYogY+
         +vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573798; x=1793178598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=;
        b=qBjSU6O2K27OXvWCcqfghK4oDxqjbYpaCUTEvllVDnYlICk5vwDFCWBEx/j03ScVJy
         nlpPJaGFWHcOzsz14LvC6KO/2bBd0awNs1sT9c9R+ViPvNutiOGsgMlt9WqZHtYQdgp+
         clFK4zsgSpypX9az0V/VK9sxxewAGgBnENNtPXjgsr/JQnEwbCDBxgrWxBM87fup9lh9
         8FvwEyHayb1Lm/0Lry8eZMUNZllCd1YfVSS2gEigYlW0uuejQqThz9d45amLYmOLL5sZ
         DI0dBq7j8O0QU2tT6t/B+WYGQn6BQWz7g4RyIibBCsS6xZ7czRJ7MvKOZOqnnAiUEc5f
         Ej/A==
X-Forwarded-Encrypted: i=1; AKwUvByclVL3uZrUPmBiGmrSJ5kamvWqcCnlNUlUFAFlrj+LG/yoUiwbpVbYAHrA9yP5+0l6Wuf6x4EDJioNOyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtr11C949S6amr/kvAOkC/NCM3PkAzYTUSRbxn6oKs6fCe3Boa
	OnP/jgnhb5eUvek86DzhyEKfXbH9PAF8eEPl84fdn+FqaoOwL3r8Xo8c7b7KJPNn4+xQC/p5DnU
	3aZ6aaIm7R3C1YzNLcVHn767ZlZgI87rbXUOKHyRHE9rGaAYsPM5lgfyoIg0DoPB7yIg=
X-Gm-Gg: AYBFou05/qSbByx2/M3+whOOXu/oKfOPyyBl/KWNKLaNIt+AeSkZ6RjpNuNPQH7oWOk
	0+x4GWwk17sLVW9i+nU6p22FDEUc3CgqnUgJ1DzvELAgw0YDJWZOZlj3N8JO3uB9LvwzV03iPW1
	g0TcKcJOjK/yK90GRFAYSj5kHVTkyqvtEHwNz5HWlk//TRKvTCwGXF0KlTt80Sh34CI8ORF1G+U
	PgY4aamgQJQ++o7Bk6mFF4MrrkgtSlwfozYkrymY0VwZXoOQs2IU2bhcIHH790HX7T3Gq/jC7o7
	YiP+vNKLxUYQDfUT31LCp2Ik/cwSJVTBDMUEn6IWZ7uJkY4hzkD+k8+dcN+SGycKqPWIFYJESVP
	3Mym0zbvBgnPLLOgOeFjK3H987/4FRR8o1zYT/Fkk0vSNKdkeYQ==
X-Received: by 2002:a05:6808:4fde:b0:4e8:721f:2824 with SMTP id 5614622812f47-5535fbb3a8cmr813194b6e.60.1792573797998;
        Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
X-Received: by 2002:a05:6808:4fde:b0:4e8:721f:2824 with SMTP id 5614622812f47-5535fbb3a8cmr813190b6e.60.1792573797599;
        Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:31 -0700
Subject: [PATCH ath-next v2 3/8] wifi: ath10k: also wake remaining blocked
 waiters
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
Message-Id: <20261021-10k-sdio-crash-v2-3-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3231;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=/2dOtNID5u69agznXn4uIB8KW+SaBAax+d/DHi8fIRM=;
 b=q1K/zTxgVqrUOksIWnOs9Obafn/YPuh3uBgZ80D1tHOrVOA9s7YRi9bWvwAo3BjcqkkXtGX7O
 seYqGVjUcmqBNSFpIB32g2C1UotH5rbbmzcd5b0Bx0vY24OSJGzW6gP
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad88166 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zeuzKm5edEikVQEUlRwA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX2xozFpnirC33
 CgT0bfmBOhs+fnc3pL8KNNmc9v6lrpgfe6ILMzeZO70PhvX4hiTLJUVuHIj/SfERF5DnzG+oW1f
 Ky37iZOIv8zbuM/rO9TU36n6YTHrOVKQScTicSayAuTz93vmTOI2XKYFvKDTXpywgEE5ho4Bp3D
 3bNMvKTgi7hmmnuo92o7jJpRzKiZ/WRxT40LSTP44yETAADRthyf7qzuxG8yYx9Nf2w4rp5KPvt
 bA02rh/EkD5TQodxc6gSPNHr264rF2xIqttIuff1Alh5MLZTRQERHKvikhgV1dkEjOFbC4c7eNT
 WiDn4eEFuxhn9+V2cCL/HIM0LLnL1LPydrrdjc4x2MBhPqnzbmEDIShfz/aD/KRLxQeeed9tMTw
 KeMVwnWeI4qWKn/3ItxF4YxHL4e58cCtRnB/fkSz4u/hPd5hmWptuV5TL5hcQudqG+ZQ6j5UdV9
 +3o8AVrnrOdn+721I/w==
X-Proofpoint-ORIG-GUID: 8zJrvhD3VfdmFqPjrlzUIqFeDnIMSvbW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX4QuoYg9mwwhA
 4JjQNFbKTC4uessW3VL6fy236k94vAqq8GF2vG0kUBSOTanjga363SGSVJa9CHG5V0MuBufZ6KS
 zbppdN6IJihFNerSF9gjA0G7+xi2ZBY=
X-Proofpoint-GUID: 8zJrvhD3VfdmFqPjrlzUIqFeDnIMSvbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

ath10k_core_wake_all_waiters() releases callers that would
otherwise remain blocked after the driver has given up on the
device.

However, peer_delete_done, target_suspend, wow.wakeup_completed,
peer_stats_info_complete and wmi.radar_confirm are not included
in that list. Callers waiting on any of them continue sleeping
until their individual timeouts expire, even though no further
progress can be made. The WoW and suspend waiters are on the
suspend/resume path, where these extra timeouts consume the
watchdog budget.

Add these completions to ath10k_core_wake_all_waiters() so
blocked callers are released immediately instead of waiting
for unnecessary timeout delays.

peer_delete_done is the only one of these that is never
reinitialized before its waiters run. A completion left over
from a wake during recovery would make the next peer delete
wait return immediately, so reinit it before each peer delete
command is sent.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 93140f1ffb7b..677e582b87e4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2500,7 +2500,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
+	complete(&ar->wow.wakeup_completed);
+	complete(&ar->peer_stats_info_complete);
 	complete(&ar->thermal.wmi_sync);
+	complete(&ar->wmi.radar_confirm);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);
 	wake_up(&ar->wmi.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..45a3082d5a64 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5890,6 +5891,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5952,6 +5954,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1

