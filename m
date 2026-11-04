Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754658;
	b=EtqUpc68SIPLCdMzEs/WA7HHyFI2Ng74IqfRT7f5VzVnAMfOwupH98orFVVvShygt/im
	 8GO7QObXFpqWnnISpYZkvrzWPvIIimpjAWZWsYlCvPOZ7J9xnLe5sI2JEsvOYx87LGNp8
	 GcET4GZ/i7fiIFiXWvHzznPs0t21Pv3Tpb2/Lu3SAN606Dyj1+vErpctQtgAGw+L+Yylx
	 qg1+VmVGV/7opx1y3l/zKCE/R+WoYryQvZE5AtrFRkhvdKsAhF+ZPHXkiYyxuEFnF6WV7
	 oIG86Ge9KdAV8E8OKjlioldaO5TQIiNhiqfnLiZny7TraFNjV+PJ2izFZSQmPXn1UFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=;
	b=fXYSb2IbiEFaC0lJCTvPPDCgG5QKR9zQkuKbF4u5FP4PFNdM5b8suyJBR6kR64IsuvLd
	 QYNfV452HTONxwt05hSVM4AZwTbhyDCnFtREj+b0w+cNGKXmBteZ9ldAPwBHQNyW7tiXX
	 y9dFHGvGH14POA8hZysROKoNphzUvsOD4CrOmfVyRCahRBTbbOGYMWnqgd6mNMbogDCkw
	 yRhickQBEfflgFdvKQojjfAvYysOikv6qnouZWLURcv560vG6ezy6l5g/KdKflHwLQI4M
	 HjwYa4kzokSL8UeVodZmlZ9Lwg6tClj5fCnd0+dFwvcPyy+LGvfrtRb5F+vz7P+yArQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8T9pzOk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0ZZL6Hv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF34606D81E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF34606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8T9pzOk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0ZZL6Hv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RFaA838284
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=; b=U8T9pzOk6WCaY0Oc
	8pm3jWsohRx2/wzx+Nj47binhY9OZXIuElGlia8zmUy9S5xYF4O914XqHCYNlfCo
	1xpTlUAkWZGWQIA46fHlq9Z7jz1jYuud+A+ckc7RA57yI2QOM+z4KHW6fx58YWo1
	nwD/RhLQH155AXILAxD6HqmbOG5CZVVjBx9gXf+vtuXlT+Wi4J+EEeLMUHe6TPcw
	q8fwEhgWimGggHB+56WHI2D2Yv6Rf/vCG2gyTsEGeOtSEMR7Eb1Y0VAM00GlP/xF
	utcOoTBOZQscLnAPo7vqrnnuLuojReP22idI7jtvzMPYJsEtNqLHlrd7BmuP7sXU
	/9YnPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ms9fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so313330eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754656; x=1794359456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=;
        b=a0ZZL6HvPXs+W9JoUt32DAaSfxfcZ8syajthaoP7d3mNcM8qvhcM51cM5uXP4wAQap
         C/Yfy/VoB81j3CzVWHFm+aWtZ3OoCY5ABNUblvOaE5DwCISP5wR2W1Li7xj0fY/KZIoa
         XIR1CbNNvT6QsD/2PUzVqY+vzUdhdPPuPLhWUPMBx4vPYS8Ql88PZXfCy9Oua2cRdpox
         bq+DJ0jycF6RBpQiC/JwaSv5gr4GQrlkZ5S8nwaWNClu2DuCqxxQ8/KLiTew7FkZe24Y
         EP9+JQnsv+g0qucuQgo1fU5mL0XcIbpLoPR72A/myGRgmcBspLYv84pJR8PHGWYHjCMG
         /v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754656; x=1794359456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOaFG+DBBTxtczIrNwbw/zVuA//yWfNwkVyL7JOIY/0=;
        b=T+STJlGx5QHf8m/IU3rqB1c2SCgNNFUacIkYdldTOkWaWCXdbuH6AFHhKOEv+h1GEg
         ZPQAgnOTDfRN9s2zisrjcLG3Wr4eOQwCuR0CIFYYdXmj/FPaKBK15S7TG7rx1ni5BrQs
         4t8vot4WPWviJ+Zb2y1qjANFuRgeLb7hOSD0VUqYio/MJ+kMRO6a65/9eDN4zsaS7QRF
         fsRG91lhCGkzQ4YhnEqPKsxEilN0yrbZl72JZHPV+raAw18jHU9S+xu+jO8jAeTwmxSh
         W5ggNDQu5bWzEs+94s04pWCsyLC+OYXMGUhoyDrk2YvRzLoxK1vATfpbvDs6T16qCrB4
         HKbQ==
X-Forwarded-Encrypted: i=1; AKwUvBygz4HwMm/rRIKUWMGwCeFMwIDADkraL0tuMoc31INqn/4Vyd202NTAvmEZ8E0ovUFMZAuPHOyC+y9kaog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oulp/Ne4BrC3U0Gg9Q+InnsB/U7V/f2hoDH+uam1i/xvLqLv0
	G2lfIDGpy9GhCkIJtZj7uR/Q8mAVtFZN00BXsYf4pD6oMN4EcjXG/d7T91nezTBTTnKE5wZtPSl
	PO/k8FscMjo+BCbik1SBzVxdTkY3fGKDHJWdNXGvzQ3xrnjq5T0r0NRcChLGJIgQ6CdA=
X-Gm-Gg: AYBFou2iZyH/qx8a3r/+W8kdFKZAunEKfgs05rcTzFunXDlGRb+RHzFVYiY+40ibbYC
	oRHhVhWL18UAJDvG6bEyLCsgmeQ85agbtqu6xAMpPT6H4pPmgqI4hGfQRS/nxwNHhu7WIdhGZlb
	+Ec1TSFyxAJ712+KzygjpT1aAGxn2tDkjrK5Xk+qOz97GceeHnyl2o1KsspnR7MD0kUTks8pdnX
	uu9HI/MIrby7gYEFbAAtp6B+RjzqaLcHVVQHxoE+UhVCOs5hP5SXPZBAaIt9iyA8/tgbdkjTNC2
	d/n7gBeUHOeyWovXNp3En4cUjHsvuTwvZ1f3IDIWplU9ujJV3kd9s1HTM/GTGK3gz7ish9V1wo2
	dCOL1sPJbVzVy2d26Ta1eNIymNU4CX158O+qZG3cS/bz4TgyFNmqmB5cZaCfDcvdoaAFgwkblg+
	gZNibHMv+MLoiaG7FATPbyywS7MW5nhLjNdW6I
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr22051664eec.27.1793754655116;
        Tue, 03 Nov 2026 17:10:55 -0800 (PST)
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr22051635eec.27.1793754654362;
        Tue, 03 Nov 2026 17:10:54 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:53 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:51 -0800
Subject: [PATCH ath-next v3 08/13] wifi: ath12k: ng: add batched REO
 command sends
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-8-861adf04b516@oss.qualcomm.com>
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
X-Proofpoint-GUID: wtXrBE5DOjcvYmdQ0H27UsmsSNQ-b_zC
X-Proofpoint-ORIG-GUID: wtXrBE5DOjcvYmdQ0H27UsmsSNQ-b_zC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX11hNeN6qVZgt
 cl5vbo1Sgp2oyEqTB8kUfrWjyUIAGVHqzMyYKb04LmU0NXytRbixmw3mEgIBuZ/h2j4fp2cCgIL
 tPM0huu6fGG6xpFi6ZXS7C4/S9xANv+zWdA60DST7O7+aRMuZghcgCaiVlweyMwUZN+qC+UWkkc
 2N+lE8wN/GOhDk5wyIAUFrbNe6AqM1sZpcsJfHnkJph2l58eMbgZjXomNr2+DXtTnrcCeGdJ2jI
 Cxxkav4tpGPbr4O1P8Jxem75KAR89l17CdQcD8o5owje69Rbz/mrFiltx4hRyuLLkTCwBdg8YwH
 9GvqK0/zaTl2xMwbzQtDOLRuH09y57zzp+B9+hAR01WwP+aPb84HcQIrv3kJtRqVyFj+MTANH1B
 IAkDSE7AwvObuMGof4yk9xQJ9BREm+/EJbMH0Xidn0g/HX5Jt6y/j6KR0Kl5Q+hq9uNPrvDDw0P
 BGAF1GOmswx251yFVZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX1/1lzRUt3fB4
 EmSQXm7r2Pj4USez1KrOgeRaB1MgC4jICFMNEr8FzT1zzLTJbepfutfEFgR8KckWb6nm3Q9cKaQ
 gDrQ9AGaEpVVwOcrWdaScUSBQv8B3n4=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aea8620 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CnFql80LsPCNzfZI1G4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004

RX TID setup needs to send related REO operations together so hardware
sees a consistent queue state and the driver can keep one pending-command
view for the whole operation.

Add Wi-Fi 8 helpers to submit multiple REO commands to one command ring
while reusing the existing pending-command callback tracking. Share the
HAL descriptor formatter between the batch and single-command paths.

Reject batched flush-cache commands that request delayed blocking
because those commands mutate the shared REO block-resource state. If
descriptor formatting fails after reserving entries, restore the source
ring pointers before exposing stale descriptors to hardware; keep the
same rollback behavior for the single-command path.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h          |   6 +
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c  | 184 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h  |  12 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c | 138 +++++++++++++++----
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h |   9 ++
 5 files changed, 297 insertions(+), 52 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 6534e11a3378..b4da48af5a4b 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1141,6 +1141,12 @@ struct ath12k_hal_reo_cmd {
 	u8 pn_127_48_info;
 };
 
+struct ath12k_reo_cmd_entry {
+	enum hal_reo_cmd_type type;
+	struct ath12k_hal_reo_cmd cmd;
+	int cmd_num;
+};
+
 enum hal_pn_type {
 	HAL_PN_TYPE_NONE,
 	HAL_PN_TYPE_WPA,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index 632ce30fe459..14117430c43b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -50,6 +50,73 @@ ath12k_wifi8_get_sw_desc(struct ath12k_dp *dp, const struct hal_reo_dest_ring *d
 	return ath12k_dp_get_rx_desc(dp, cookie);
 }
 
+static inline bool ath12k_wifi8_dp_reo_cmd_shutdown(struct ath12k_base *ab)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+
+	return test_bit(ATH12K_FLAG_CRASH_FLUSH, &central_ab->dev_flags) ||
+	       test_bit(ATH12K_FLAG_RECOVERY, &central_ab->dev_flags);
+}
+
+static int ath12k_wifi8_dp_reo_cmd_prepare(struct ath12k_dp_rx_reo_cmd **dp_cmd,
+					   void *data, size_t len,
+					   void (*cb)(struct ath12k_dp *dp,
+						      void *ctx,
+						      struct hal_reo_status *status))
+{
+	if (!cb) {
+		*dp_cmd = NULL;
+		return 0;
+	}
+
+	if (WARN_ON(len > sizeof((*dp_cmd)->u)))
+		return -EINVAL;
+
+	if (WARN_ON(len && !data))
+		return -EINVAL;
+
+	*dp_cmd = kzalloc_obj(struct ath12k_dp_rx_reo_cmd, GFP_ATOMIC);
+	if (!*dp_cmd)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&(*dp_cmd)->list);
+	if (len)
+		memcpy(&(*dp_cmd)->u, data, len);
+	(*dp_cmd)->handler = cb;
+
+	return 0;
+}
+
+static void ath12k_wifi8_dp_reo_cmd_queue_locked(struct ath12k_dp *dp,
+						 struct ath12k_dp_rx_reo_cmd *dp_cmd,
+						 int cmd_num)
+{
+	if (!dp_cmd)
+		return;
+
+	lockdep_assert_held(&dp->reo_cmd_lock);
+
+	dp_cmd->cmd_num = cmd_num;
+	list_add_tail(&dp_cmd->list, &dp->reo_cmd_list);
+}
+
+static int ath12k_wifi8_dp_reo_cmd_validate_batch(struct ath12k_reo_cmd_entry *cmds,
+						  int n)
+{
+	int i;
+
+	for (i = 0; i < n; i++) {
+		if (!(cmds[i].cmd.flag & HAL_REO_CMD_FLG_FLUSH_BLOCK_LATER))
+			continue;
+
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
 					     struct hal_srng *cmd_ring,
 					     void *data, size_t len,
@@ -63,25 +130,14 @@ static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
 	int cmd_num;
 	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
 	struct ath12k_base *central_ab = central_dp->ab;
+	int ret;
 
-	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &central_ab->dev_flags) ||
-	    test_bit(ATH12K_FLAG_RECOVERY, &central_ab->dev_flags))
+	if (ath12k_wifi8_dp_reo_cmd_shutdown(ab))
 		return -ESHUTDOWN;
 
-	if (!cb) {
-		dp_cmd = NULL;
-	} else {
-		if (WARN_ON(len > sizeof(dp_cmd->u)))
-			return -EINVAL;
-
-		dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
-		if (!dp_cmd)
-			return -ENOMEM;
-
-		INIT_LIST_HEAD(&dp_cmd->list);
-		memcpy(&dp_cmd->u, data, len);
-		dp_cmd->handler = cb;
-	}
+	ret = ath12k_wifi8_dp_reo_cmd_prepare(&dp_cmd, data, len, cb);
+	if (ret)
+		return ret;
 
 	cmd_num = ath12k_wifi8_hal_reo_cmd_send(central_ab, cmd_ring, type, cmd);
 	if (cmd_num < 0) {
@@ -97,15 +153,82 @@ static int ath12k_wifi8_dp_reo_cmd_send_ring(struct ath12k_base *ab,
 	if (!dp_cmd)
 		return 0;
 
-	dp_cmd->cmd_num = cmd_num;
-
 	spin_lock_bh(&central_dp->reo_cmd_lock);
-	list_add_tail(&dp_cmd->list, &central_dp->reo_cmd_list);
+	ath12k_wifi8_dp_reo_cmd_queue_locked(central_dp, dp_cmd, cmd_num);
 	spin_unlock_bh(&central_dp->reo_cmd_lock);
 
 	return 0;
 }
 
+static int
+ath12k_wifi8_dp_reo_cmd_send_ring_n(struct ath12k_base *ab,
+				    struct hal_srng *cmd_ring,
+				    struct ath12k_reo_cmd_entry *entries,
+				    struct ath12k_reo_dp_cmd_desc *dp_descs,
+				    int n)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_base *central_ab = central_dp->ab;
+	struct ath12k_dp_rx_reo_cmd **dp_cmds;
+	int i, ret;
+
+	if (WARN_ON(n <= 0))
+		return -EINVAL;
+
+	if (WARN_ON(!entries || !dp_descs))
+		return -EINVAL;
+
+	if (ath12k_wifi8_dp_reo_cmd_shutdown(ab))
+		return -ESHUTDOWN;
+
+	ret = ath12k_wifi8_dp_reo_cmd_validate_batch(entries, n);
+	if (ret)
+		return ret;
+
+	dp_cmds = kcalloc(n, sizeof(*dp_cmds), GFP_ATOMIC);
+	if (!dp_cmds)
+		return -ENOMEM;
+
+	for (i = 0; i < n; i++) {
+		ret = ath12k_wifi8_dp_reo_cmd_prepare(&dp_cmds[i],
+						      dp_descs[i].data,
+						      dp_descs[i].len,
+						      dp_descs[i].cb);
+		if (ret)
+			goto err_free;
+	}
+
+	spin_lock_bh(&cmd_ring->lock);
+	ath12k_hal_srng_access_begin(central_ab, cmd_ring);
+
+	ret = ath12k_wifi8_hal_reo_cmd_send_n_locked(central_ab, cmd_ring,
+						     entries, n);
+	if (!ret) {
+		spin_lock_bh(&central_dp->reo_cmd_lock);
+		for (i = 0; i < n; i++)
+			ath12k_wifi8_dp_reo_cmd_queue_locked(central_dp, dp_cmds[i],
+							     entries[i].cmd_num);
+		spin_unlock_bh(&central_dp->reo_cmd_lock);
+	}
+
+	ath12k_hal_srng_access_end(central_ab, cmd_ring);
+	spin_unlock_bh(&cmd_ring->lock);
+
+	if (ret)
+		goto err_free;
+
+	kfree(dp_cmds);
+	return 0;
+
+err_free:
+	for (i = 0; i < n; i++)
+		kfree(dp_cmds[i]);
+	kfree(dp_cmds);
+
+	return ret;
+}
+
 int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
 				 void *data, size_t len,
 				 enum hal_reo_cmd_type type,
@@ -116,8 +239,9 @@ int ath12k_wifi8_dp_reo_cmd_send(struct ath12k_base *ab,
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
 	struct hal_srng *cmd_ring;
+	u32 ring_id = central_dp->reo_cmd_ring.ring_id;
 
-	cmd_ring = &central_dp->ab->hal.srng_list[central_dp->reo_cmd_ring.ring_id];
+	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
 
 	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
 						 type, cmd, cb);
@@ -134,15 +258,31 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
 	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
 	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(central_dp);
 	struct hal_srng *cmd_ring;
-	u32 ring_id;
+	u32 ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
 
-	ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
 	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
 
 	return ath12k_wifi8_dp_reo_cmd_send_ring(ab, cmd_ring, data, len,
 						 type, cmd, cb);
 }
 
+int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
+					    struct ath12k_reo_cmd_entry *entries,
+					    struct ath12k_reo_dp_cmd_desc *dp_descs,
+					    int n)
+{
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_dp *central_dp = ath12k_get_central_dp(dp);
+	struct ath12k_dp_wifi8 *dp_wifi8 = ath12k_get_dp_wifi8(central_dp);
+	struct hal_srng *cmd_ring;
+	u32 ring_id = dp_wifi8->reo_high_prio_cmd_ring.ring_id;
+
+	cmd_ring = &central_dp->ab->hal.srng_list[ring_id];
+
+	return ath12k_wifi8_dp_reo_cmd_send_ring_n(ab, cmd_ring, entries,
+						   dp_descs, n);
+}
+
 /**
  * ath12k_wifi8_rx_spd_buf_alloc - allocate per-ring SPD scratch-pad arrays
  * @dp_hw_grp_wifi8: Wi-Fi 8 hardware-group private data
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index 10940dd92a62..2fb56776adb0 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -12,6 +12,7 @@
 
 struct ath12k_dp_hw_group_wifi8;
 struct hal_reo_status;
+struct ath12k_reo_cmd_entry;
 
 struct hal_rx_mpdu_desc_info {
 	union {
@@ -159,6 +160,17 @@ int ath12k_wifi8_dp_reo_cmd_send_highprio(struct ath12k_base *ab,
 					  struct ath12k_hal_reo_cmd *cmd,
 					  void (*cb)(struct ath12k_dp *dp, void *ctx,
 						     struct hal_reo_status *status));
+struct ath12k_reo_dp_cmd_desc {
+	void *data;
+	size_t len;
+	void (*cb)(struct ath12k_dp *dp, void *ctx,
+		   struct hal_reo_status *status);
+};
+
+int ath12k_wifi8_dp_reo_cmd_send_highprio_n(struct ath12k_base *ab,
+					    struct ath12k_reo_cmd_entry *entries,
+					    struct ath12k_reo_dp_cmd_desc *dp_descs,
+					    int n);
 int ath12k_wifi8_dp_rx_ring_setup(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rx_ring_free(struct ath12k_base *ab);
 int ath12k_wifi8_dp_rxdma_ring_sel_config_qcn9625(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
index d78c178cc70d..12a37c395bb0 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
@@ -536,24 +536,116 @@ static int ath12k_hal_reo_cmd_unblock_cache(struct hal_tlv_64_hdr *tlv,
 	return le16_to_cpu(desc->cmd.reo_cmd_number);
 }
 
-int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
-				  enum hal_reo_cmd_type type,
-				  struct ath12k_hal_reo_cmd *cmd)
+static int ath12k_wifi8_hal_reo_cmd_fill(struct ath12k_base *ab,
+					 struct hal_tlv_64_hdr *reo_desc,
+					 enum hal_reo_cmd_type type,
+					 struct ath12k_hal_reo_cmd *cmd)
 {
-	struct hal_tlv_64_hdr *reo_desc;
-	u32 saved_hp, saved_reap_hp;
-	int ret;
-
-	if (type == HAL_REO_CMD_FLUSH_TIMEOUT_LIST) {
+	switch (type) {
+	case HAL_REO_CMD_GET_QUEUE_STATS:
+		return ath12k_wifi8_hal_reo_cmd_queue_stats(reo_desc, cmd);
+	case HAL_REO_CMD_FLUSH_CACHE:
+		return ath12k_wifi8_hal_reo_cmd_flush_cache(&ab->hal, reo_desc,
+							    cmd);
+	case HAL_REO_CMD_UPDATE_RX_QUEUE:
+		return ath12k_wifi8_hal_reo_cmd_update_rx_queue(reo_desc, cmd);
+	case HAL_REO_CMD_FLUSH_QUEUE:
+		return ath12k_hal_reo_cmd_flush_queue(reo_desc, cmd);
+	case HAL_REO_CMD_UNBLOCK_CACHE:
+		return ath12k_hal_reo_cmd_unblock_cache(reo_desc, cmd);
+	case HAL_REO_CMD_FLUSH_TIMEOUT_LIST:
 		ath12k_warn(ab, "Unsupported reo command %d\n", type);
 		return -EOPNOTSUPP;
+	default:
+		ath12k_warn(ab, "Unknown reo command %d\n", type);
+		return -EINVAL;
 	}
+}
 
-	if (type > HAL_REO_CMD_UPDATE_RX_QUEUE) {
-		ath12k_warn(ab, "Unknown reo command %d\n", type);
+int ath12k_wifi8_hal_reo_cmd_send_n_locked(struct ath12k_base *ab,
+					   struct hal_srng *srng,
+					   struct ath12k_reo_cmd_entry *entries,
+					   int n)
+{
+	struct hal_tlv_64_hdr *reo_desc;
+	u32 saved_hp, saved_reap_hp;
+	int i, ret;
+
+	if (WARN_ON(n <= 0))
+		return -EINVAL;
+
+	if (WARN_ON(!entries))
 		return -EINVAL;
+
+	lockdep_assert_held(&srng->lock);
+
+	saved_hp = srng->u.src_ring.hp;
+	saved_reap_hp = srng->u.src_ring.reap_hp;
+
+	for (i = 0; i < n; i++) {
+		reo_desc = ath12k_hal_srng_src_get_next_entry(ab, srng);
+		if (!reo_desc) {
+			ret = -ENOBUFS;
+			goto err_restore_hp;
+		}
+
+		ret = ath12k_wifi8_hal_reo_cmd_fill(ab, reo_desc,
+						    entries[i].type,
+						    &entries[i].cmd);
+		if (ret <= 0) {
+			if (!ret)
+				ret = -EINVAL;
+			goto err_restore_hp;
+		}
+
+		entries[i].cmd_num = ret;
 	}
 
+	return 0;
+
+err_restore_hp:
+	/* Keep batched command submission all-or-nothing. If any descriptor
+	 * cannot be reserved or formatted, roll the source ring pointers back
+	 * so partially prepared entries are not exposed to hardware.
+	 */
+	srng->u.src_ring.hp = saved_hp;
+	srng->u.src_ring.reap_hp = saved_reap_hp;
+
+	return ret;
+}
+
+int ath12k_wifi8_hal_reo_cmd_send_n(struct ath12k_base *ab,
+				    struct hal_srng *srng,
+				    struct ath12k_reo_cmd_entry *entries,
+				    int n)
+{
+	int ret;
+
+	if (WARN_ON(n <= 0))
+		return -EINVAL;
+
+	if (WARN_ON(!entries))
+		return -EINVAL;
+
+	spin_lock_bh(&srng->lock);
+	ath12k_hal_srng_access_begin(ab, srng);
+
+	ret = ath12k_wifi8_hal_reo_cmd_send_n_locked(ab, srng, entries, n);
+
+	ath12k_hal_srng_access_end(ab, srng);
+	spin_unlock_bh(&srng->lock);
+
+	return ret;
+}
+
+int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
+				  enum hal_reo_cmd_type type,
+				  struct ath12k_hal_reo_cmd *cmd)
+{
+	struct hal_tlv_64_hdr *reo_desc;
+	u32 saved_hp, saved_reap_hp;
+	int ret;
+
 	spin_lock_bh(&srng->lock);
 
 	ath12k_hal_srng_access_begin(ab, srng);
@@ -566,26 +658,12 @@ int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
 		goto out;
 	}
 
-	switch (type) {
-	case HAL_REO_CMD_GET_QUEUE_STATS:
-		ret = ath12k_wifi8_hal_reo_cmd_queue_stats(reo_desc, cmd);
-		break;
-	case HAL_REO_CMD_FLUSH_CACHE:
-		ret = ath12k_wifi8_hal_reo_cmd_flush_cache(&ab->hal, reo_desc,
-							   cmd);
-		break;
-	case HAL_REO_CMD_UPDATE_RX_QUEUE:
-		ret = ath12k_wifi8_hal_reo_cmd_update_rx_queue(reo_desc, cmd);
-		break;
-	case HAL_REO_CMD_FLUSH_QUEUE:
-		ret = ath12k_hal_reo_cmd_flush_queue(reo_desc, cmd);
-		break;
-	case HAL_REO_CMD_UNBLOCK_CACHE:
-		ret = ath12k_hal_reo_cmd_unblock_cache(reo_desc, cmd);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+	ret = ath12k_wifi8_hal_reo_cmd_fill(ab, reo_desc, type, cmd);
+	if (ret <= 0) {
+		if (!ret)
+			ret = -EINVAL;
+		srng->u.src_ring.hp = saved_hp;
+		srng->u.src_ring.reap_hp = saved_reap_hp;
 	}
 
 out:
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
index 357839c7d9e3..430b0f07563f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
@@ -100,6 +100,7 @@ struct ath12k_hal_rx_cmd_ring_param {
 
 struct hal_tlv_64_hdr;
 struct hal_reo_status;
+struct ath12k_reo_cmd_entry;
 
 int
 ath12k_wifi8_hal_invalidate_rx_cache_cmd_send(struct ath12k_base *ab,
@@ -108,6 +109,14 @@ ath12k_wifi8_hal_invalidate_rx_cache_cmd_send(struct ath12k_base *ab,
 int ath12k_wifi8_hal_reo_cmd_send(struct ath12k_base *ab, struct hal_srng *srng,
 				  enum hal_reo_cmd_type type,
 				  struct ath12k_hal_reo_cmd *cmd);
+int ath12k_wifi8_hal_reo_cmd_send_n_locked(struct ath12k_base *ab,
+					   struct hal_srng *srng,
+					   struct ath12k_reo_cmd_entry *entries,
+					   int n);
+int ath12k_wifi8_hal_reo_cmd_send_n(struct ath12k_base *ab,
+				    struct hal_srng *srng,
+				    struct ath12k_reo_cmd_entry *entries,
+				    int n);
 void ath12k_wifi8_hal_reo_hw_setup(struct ath12k_base *ab);
 void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,

-- 
2.43.0

