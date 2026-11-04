Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754662;
	b=NvhMg6oQnuwjGC4GYDCXOTlnp/Z5tdy3EOgfxU9wfK8l8ezydJ16/0sv1QD9DqZ7i3Xa
	 hygVYZ8EFcVVqOr7Z+T1968gqzPbfDRRPVfBGsFNtDbNCNYmD7TVFK7GSa1b4fYnQMojQ
	 h2yIViUeKQvMLa1LmXK8Fnyf49n/bpdTqlHDKpquD5mJNbM6ZhfqT6wIqPFNRmy637Qoo
	 cTYAQvR9r+qAE6E4dG2pX6koYOZ13NcR2rCV1sBV+F2OmzlAvM7fajIS3dS4fIRAHVYcp
	 puev+9QE+rzgtSpx0qXw0bBIERvdP6gMbAmjZrXgOl6UM+AHjGnNWa5T89hHZ8DdiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=;
	b=htFuHo4TXcft+7QikdU43uV9jUfyE/t+9BNfMB8pxAd3+Z1rf+K92HdJdjKK3AssEXCb
	 hemwjZ9JfJkwvzJ7tsDZBUeUw7tABo7cOd9a5WdR+X0cZPSIu/ZuBzrOfSWYEFWG/H9mv
	 +PzcmAUg8Y8wrpdwvxJsfat0vPFFvnUfLfgedVReBlSr4fbbAJIrHkmPO9xeG2t60ODGR
	 IOpWEkqJvkMVIAIK4uGap4BeJwTmFDHrHSqy5VeTLnppRRa0nLL6G3DtFwUDDTxPgaxfl
	 V3npACroJjCQVmwGerR+XL843KXOAAX8sZMASZdFJeWBEIMq7+BjDZ4tivf8fKnR/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoxFEsAN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hob5Suqk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C016606D82B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C016606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoxFEsAN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hob5Suqk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RLFu222105
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=; b=OoxFEsANc5Oaa+sw
	kmCqmm0LIE1twR/DNSv5P4Uh3KP9DHbkQlhcj3sxyN0tULNk20vLQ+V0lIjC1Sgh
	/8bBTPHs30D+183dXKeryEU8Co9sQvqbP++SFWGMNjvKwuax0Jw8qba9jD7OzHAS
	LyEjRpknFdhXnEn/B9csrTpJrsCAIwf24f5EcnBoiOPxKRUdbcl9Jgri/O2KBfQN
	ZApFCQQiryzhU5buTaTQCos7yuLSFwchciHDtyZjKftytWXplGCR4k+8p58mYcK6
	VjSxRb1MXLrN+EG92t5ApRp3hBkdh7quAPzFBMtuItNH2Wp9WcJv3qP2AkmkUgmb
	4bG1SQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubj240-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:11:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so283890eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754660; x=1794359460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=;
        b=hob5SuqkVpmtoECMDB+HsOPfIeTdexSyK+2FYg5L5Oit6h4p9BgliLx0m3TqX7XLpV
         DvVnwHyRlxGe00j1D52SSPXgBecJCt2ViVegDek1/AsHEHlMFOBCS38iEHSc5pNYd/Au
         XPKGeH6pV6UbL/P1MNvhIPBpzk/KIEi9SfBU+vHMTx5++c+xL2KVfkxaPFP5nry2qJW9
         fkEQfSYhLIQXlRKs2bOHhTEomRQVM1VvqKhZq/No9HjOG/7aiBF/jTYzCXfoItc1TCMZ
         hPrOhaK4KNj0hEGgr5d543jWxBCMyRZliJGBQtIVflSNzt7wSt2jtN9EoTX9K7mnK7Vd
         E/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754660; x=1794359460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdMqrqYmZYMbZHP7GOIz5k4MhWocLVLSTzSlsjp6QQQ=;
        b=US2BpA7uAKMTZHRD4dHhZyeE6B9Z49xFkt4FGRpTXcwVSDR4/8j9dtPdEgkrNT68tq
         XmkBfeoVcNdZloafNGsog2+u+RG4Wu1FQDCxm71udHDhZkLtFMfieQYJLl75aZZ6tdf2
         ep1cdu453tIytU5KPz367v7XXKrTmU8yqQaJc9mxrOJ/4pRPiyuX2HuePF4EX3L0eOd8
         Q0TwNC8fKwvtPXxyVuUMDhoqf1ZqwPqdlUurjjpP3HlcWA+tsmTxGV02IB8JTLi9mQsi
         9HfZu8tRd0BcV0XcXRYCzEKP86nAg0HijYyZRirBWAMCN7naIoOz3PKKFr7IX4+rqxAI
         dOQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvd8nrBnkHfSb7IGEhgSJbC/tJyLkrlzk9SoYWBkg0U6HVrpEK7pnl/UMUMHyH6siMMvfP6iko69kvCwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Al3qwb0lMoLdeuN44HCLUus6srZAWIB3XRdtgAsrXGoIMd+E2
	H9zPuqtYuiN6aLV7FznLnSIrdPvwPC+An5bJgM0DuHkwBNLo8HqMT48h5dFMjshK/Yu9r2x6oD3
	MYX8Tohc0oVC8GoKlegF4b3vHL8U1RwoLjvDIg5Hwqw+KTlOSVc29p37lWqKj7XsDBpA=
X-Gm-Gg: AYBFou1IGloht3fLHBdwl4BTxoDlhfKGC6+3uJszpSivcKF9xMW9eplpZ6efEZfWCft
	1cYuY2HWLdLwdLGahzDs2ncqTeosLOVM4DV+7MvO9SCP/CyHYyCjB1G+k8Lmhd8lmK4xELYZ1Sc
	T9ii0H4lkAyg9x4CFVhIH/leMFHTLACBTrWa2O4YI5mDqwTq8e1JY2xjqcs8d49C225KkkXh8ks
	Wqm8B2kUhgSoyAulDwJh1rTBeI8ChpZn7zSKSMhSCiNtasLtd1evYxjsA+Iv6n8A+5pnCEvkBMh
	KxFN8czKJTo8Fu/ul1ASADdk2tdaY598sA5WToNF7pqciNBzVSNgPvDwgS/KOUzFt0a+mmr8xRR
	Y+4W7/y5lpDEXrGGeQqOE6wHvo08zA3cTLXgFezMqyDCXyVNHrl01oCjQhkb5VsMjyIpOL/tutw
	TgGa0CSgKClFTmkagm3gENqxOs+gI81+/sdYjb
X-Received: by 2002:a05:7301:6492:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-36a423312fbmr20105936eec.10.1793754659448;
        Tue, 03 Nov 2026 17:10:59 -0800 (PST)
X-Received: by 2002:a05:7301:6492:b0:360:34e4:39d2 with SMTP id 5a478bee46e88-36a423312fbmr20105905eec.10.1793754658842;
        Tue, 03 Nov 2026 17:10:58 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:58 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:55 -0800
Subject: [PATCH ath-next v3 12/13] wifi: ath12k: ng: wire RX TID REO
 operations
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-12-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfXyrvKjXdLy9A9
 HZHnAOkG/4lmfP/ST96OQgU89hbmw781pXvr4PP1VW6skyRk5ayJYPI8RSd/3/W02zULP2Qr41a
 sWe1RLQKQNIwOFs6K+fd0ifqrOjtJCk=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea8624 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bm8WxbACC0oYRj511PUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: VmLlsGthN22Io3_MR2F6x3ClkOIDnBKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX9aRoXXU6Kn9n
 dDhn1NQzP5UIlly0IIErvXgItCbRrW4A2Zf4tPywNuwfSiXyGEDnZ3Wg3tW4hH0HJZPSqhqABpQ
 2V1fMXXupMEZyzdk/C1jG8PpUDxOck/cL33jspE+Ms+YqA4mbz+mhoI51RmVwT9oWiSdRaAZgHW
 Y3ZzbwGXU7DpcdDTV/fOe0LgCSam7u94sqEczHBd9UQR5kMZ6Lg9C73t0KFQii9AaoFYV4a3uO9
 Pfmt5hDDyWn8JUkp9ZXm6bMv/rboB9O+0AY8SqK0cGOfLGaARFqq3YUmTYahIYX6E/v+pKseyrR
 k4fbuklkwal0PiFC5PhaUEO5NjtZmkdSk/fGYivsppUB3ORjrjIKlf6k48Q6pUCic+UsCmarwqZ
 VxiTYY6oaIbd8sAaDtwCD/69GAHhYqGnm+v50ItiKRnegys2QKCEstTEueJkbasxg+5CqDBE+hf
 +w767hOVw1pBJQASydQ==
X-Proofpoint-ORIG-GUID: VmLlsGthN22Io3_MR2F6x3ClkOIDnBKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004

RX TID setup fails on Wi-Fi 8 while the architecture hooks are empty,
so common peer setup falls back to paths that cannot program QCN9625 REO
queue descriptors.

Install the Wi-Fi 8 RX TID hooks, initialize the REO command/list locks
used by those paths, and enable REO queue LUT support for QCN9625. Expose
the single Wi-Fi 8 REO LUT through the expected ML pointer so common qref
programming can use the same address table.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/dp.c | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.c b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
index e89826f33206..1e636e79fc32 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
@@ -197,6 +197,9 @@ static int ath12k_wifi8_dp_reoq_lut_setup(struct ath12k_base *ab)
 	ath12k_hal_write_reoq_lut_addr(ab, dp->reoq_lut.paddr >> 8);
 	ath12k_hal_write_ml_reoq_lut_addr(ab, dp->reoq_lut.paddr >> 8);
 
+	dp->ml_reoq_lut.vaddr = dp->reoq_lut.vaddr;
+	dp->ml_reoq_lut.paddr = dp->reoq_lut.paddr;
+
 	ath12k_hal_reoq_lut_addr_read_enable(ab);
 	ath12k_hal_reoq_lut_set_max_peerid(ab);
 
@@ -215,6 +218,10 @@ static void ath12k_wifi8_dp_reoq_lut_cleanup(struct ath12k_base *ab)
 				  dp->reoq_lut.vaddr_unaligned,
 				  dp->reoq_lut.paddr_unaligned);
 		dp->reoq_lut.vaddr_unaligned = NULL;
+		dp->reoq_lut.vaddr = NULL;
+		dp->reoq_lut.paddr = 0;
+		dp->ml_reoq_lut.vaddr = NULL;
+		dp->ml_reoq_lut.paddr = 0;
 	}
 }
 
@@ -519,6 +526,17 @@ static struct ath12k_dp_arch_ops ath12k_wifi8_dp_arch_ops = {
 	.dp_op_mlo_init = ath12k_wifi8_dp_op_mlo_init,
 	.dp_op_mlo_deinit = ath12k_wifi8_dp_op_mlo_deinit,
 	.service_srng = ath12k_wifi8_dp_service_srng,
+	.reo_cmd_send = ath12k_wifi8_dp_reo_cmd_send,
+	.setup_pn_check_reo_cmd = ath12k_wifi8_dp_setup_pn_check_reo_cmd,
+	.rx_peer_tid_delete = ath12k_wifi8_dp_rx_peer_tid_delete,
+	.reo_cache_flush = ath12k_wifi8_dp_reo_cache_flush,
+	.rx_link_desc_return = ath12k_wifi8_dp_rx_link_desc_return,
+	.rx_frags_cleanup = ath12k_wifi8_dp_rx_frags_cleanup,
+	.peer_rx_tid_reo_update = ath12k_wifi8_peer_rx_tid_reo_update,
+	.rx_assign_reoq = ath12k_wifi8_dp_rx_assign_reoq,
+	.peer_rx_tid_qref_setup = ath12k_wifi8_peer_rx_tid_qref_setup,
+	.peer_rx_tid_qref_reset = ath12k_wifi8_peer_rx_tid_qref_reset,
+	.rx_tid_delete_handler = ath12k_wifi8_dp_rx_tid_delete_handler,
 	.dp_peer_create = ath12k_wifi8_dp_peer_create,
 	.dp_peer_delete = ath12k_wifi8_dp_peer_delete,
 	.dp_link_peer_create = ath12k_wifi8_dp_link_peer_create,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index ed3ac770e754..a7da8b3a44cd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -211,6 +211,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.current_cc_support = false,
 		.ring_mask = &ath12k_wifi8_hw_ring_mask_qcn9625,
+		.reoq_lut_support = true,
 		.num_tcl_banks = 128,
 	},
 };

-- 
2.43.0

