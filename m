Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754664;
	b=TeV/4/OzkY2ulm30LKZuuHKRq8qXzDZset4CbIn+jpTopSWZNoh/xCR7BKkXGwbnd9ed
	 FDoi8Db6lJHiVfvddagJ1dRdKTDg4dBtW9itF1p4Chj/q+BHGMrLqBAN3HU1nc39nUYIL
	 i1WzeHmckD+QDbkzWHq19su0KCX4fh7Ma//H7Dmn5RnZ/P5YheeH3p4t383hah8RPD84D
	 V01jI524whkKZjtWkd4C12JiGr3qVc+Sb8h+uiJsP738c7REAEMVR1Wc6Qo2mU7CMpRG1
	 ZvzsavboCYUfoqJO+H3aoE665xRPxmN7iwj4uV6Nj1HDZrArVSOey8KjJErUbbXrakw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hJlACxhQlmRoY8Z9PW8FhvqV/pXbRagU+w0RWP0Hx/g=;
	b=XXhTbVDXeGb0WNk2eeRobzErjhSHd3Y0lCE7FA2EgCigDoApe4D3mmeOJxJ4C2JVBIrg
	 WfwUbY29UwN7tnp2uUVcHFuePNIviI+GnXix4+ZbfQshEbv8Lfc/g/6Aq4ljgIswboXgN
	 5KdsTuvWgBN1964OCtMq3WgaR7ZfVIycR//+Xywh4ScpEdai52Aenv90EUlgH30oaRNZx
	 FBdhXUkSjgbWrflyDi6Rrdb7vSfTMGwzmvuhy2BaNDwwsidbZWk8Q8Pc9KCOdkwX157Nt
	 dYmHQS1g1Ertg6ftOxUOLX3mD5pAdnCU2t+PMoqf+ygsinZRQmfD0shy6Q3p2o5WRsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kpz7dhUq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hUoMfN3m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE41606D825
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE41606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kpz7dhUq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hUoMfN3m
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RAIv3335160
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJlACxhQlmRoY8Z9PW8FhvqV/pXbRagU+w0RWP0Hx/g=; b=kpz7dhUqVYZa5oWC
	BiZ6QFipVnxhAph6j10QHsm9FgwXTNXGfWnDWhYUsFP1p/oiA8FjK2CGh/OHr5zl
	PNVJbUTu3PaWgQwvBGVr99tjTOg989GQLkQGxshlDNSwfFS1TGHZmlH4mphGEWI1
	J00HU7IUQqvihliu11j/ZhF1UTpwhla4u5x12X40IGW3cAIcm5fURHhdrjAhfQHN
	TnHeLLKuv9Snb/8NpLyd5FpBgvDItBNA/HsCP/5919URLjXcS/amCrKX8VsY4zSL
	q7NhfrQa083nwC8Fgtd9BameasbxYV+Fxv75ZJx30mCc4xVEyYS7FiLpatuG55ij
	rq0NoQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsfak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:11:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so520579eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754661; x=1794359461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJlACxhQlmRoY8Z9PW8FhvqV/pXbRagU+w0RWP0Hx/g=;
        b=hUoMfN3mp6FU6zXGL3N+gv5jorq0CHFTQSnR+yuIqlLbR/NLuF1a2VarWgtSS74pc1
         0a91qbAHBHVEIC/kNXTKsKBcUUBP0shcfKiUa59o/wKeQevgAk3WmrJcWRpvK7HvO4Xz
         vavXktzdxtGTvj6WNrnuPSokbTrdcgo2fpO3DdM7JgYL8qqwrWcEDdMUr5PRhvHXqeE/
         5qsX5hXtx6pYrbj6pE8UEvw58z4OGkxqRfE5hIRmQFDco4JPz4RO06HIrGpnKl3Fbytz
         b7CH5EGuJu2Jj56RqM2WD92R+7ZNblfxK8DpHkLE0Lc2NMiqHzB7mFWfH7sbcZaVxCt5
         azTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754661; x=1794359461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJlACxhQlmRoY8Z9PW8FhvqV/pXbRagU+w0RWP0Hx/g=;
        b=YTI23dbdLkbJLPmbWmH5WMaHYZoGY0QdOFTjQC1YLp4xO0WLqaMdBvR9gcsE74siG5
         1EcZT1Fdw5IBjjaR23ehtYXbIHZZiNhzVmAG2MCSRzMkXoEZukutRiVM0Dy2tfMv+CAR
         jYdJ72f/C3bTPfCzpx9PdERk6Pm2oGWBzQzM0bam83rLg3bO/SWEGllCKem8r61IUvtz
         cxooRDkx/1IUaYmhgzpVjPMZUYgteWofa+2mpSf0gJLi6Iu0n3SKVbDPHOkij/JXbRaN
         jd+SbkEpPGu2n+L6wUD7yEqGFe8kjbeeL8BInylssHrT+Y9bpJghE70+hngj5Zw36gbh
         Q21A==
X-Forwarded-Encrypted: i=1; AKwUvByYinCsnRixR8dQXEfBhptquWNfX19mQk+PyvZesgwe/mrNk8EvLuffZ792XnnkZHzpKCDeIRV6/nTvAkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1y6CJr9Hw9rGaNyPeHDBwik3k3RdCb+wT+svEKLm4tvOUCssE
	pgaH47FrhLLC+IBGlrxPKkt7yUqjbM7G/0oVV1FVt+TXexS/yOP2VUgkYqEbiyE2vgbOJVvGX5p
	P7N4+NtoVPB9+jOeVYU7YLtwvqY2OIBID07BWkFPj2f+7BeW0WoMjLKHZd3dWSlXm8AE=
X-Gm-Gg: AYBFou2yzhmsLo/MWB56ZvMgiy5i2SM77ShbEz1jX53KnDOGETGLulBr3tXISSQwVrT
	hcvd/DvN1h8yO5iNdGtvDwtpvgxfr0irP3RrNgt2XFxEYUYLMGllugFHvLZHB3l6ivBAl1al6q0
	4F86v6tcaMhx5AF8RsRoJJEwQwzYLL2eD/SkXwHYghyYMZqpRRHmLTbUaLsL6ygwyJndSfWf34w
	LsdAokEj6X430l+iHmqnQC2rnELtu7heWoGZqtggBrs6OEFxomSYtrWvj5eZuXi1D/wYbB9UXB+
	7xZprBu8YJ/z2lKkEiDsAgg7CVxbys0NbLXBp2QXL+fWqRN+iI4viMsjp+HbFZkYD/xCNESG1PG
	51SVRw8jYLFRvS1zOxSfm27FFSgqakD8FbIYjsPewfbvDPxKwZZKNjCcg94yLc3SN8FocCmTEt/
	AdAmw1AyiuAYK/uvBhH5LwUWpOjm71okQNJEwo
X-Received: by 2002:a05:7300:f408:b0:36c:bf78:967e with SMTP id 5a478bee46e88-36cbf7898a9mr753968eec.10.1793754660980;
        Tue, 03 Nov 2026 17:11:00 -0800 (PST)
X-Received: by 2002:a05:7300:f408:b0:36c:bf78:967e with SMTP id 5a478bee46e88-36cbf7898a9mr753928eec.10.1793754660298;
        Tue, 03 Nov 2026 17:11:00 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:59 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:56 -0800
Subject: [PATCH ath-next v3 13/13] wifi: ath12k: ng: use global dp peer id
 for REO TID setup
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-13-861adf04b516@oss.qualcomm.com>
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
X-Proofpoint-GUID: Dg1vcxupjabSVxi8t2Dg8fbRrREVSYkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX+ttd+ajkKegV
 4Ki6vsk1S3w/MUrWcZuGnr3Qnp8w2Be/78fZXi9P7BqOjELCR3xf3sRics1P48PIh5gDLyY1ZM8
 SyxxqYpXJ9to1ihmmkmh9e/50Rx9o8Yw7Kr5iz0fwSFEeUhfI8vzJE/hxYO8Wkd4kTikK5Jxb13
 cSWtgV//xv8AxOqQ8dIxg+1WhBPGMBGxmG6wsqpP/ITp07HkXkCYV6miQTDoMQWXrQCbpc7fXH+
 bSuYpZyECg0dQJxWz9muIBdV6q8nKaenP3MiQ33uF0y5W7VReofHFYVrk4hNaGbpValW8SF4Ofn
 kXb0zRk65hJbBTLL5QN0r0RjufMp/+5I5OQmXgQSw45KmNwyGM9zpNUJf8M2nEu5R96pQErsVSP
 w6zkvvSmjZAqJxK4nJBvtgGbtJcCNK2TEppzq8x65pL+pZAGggG6f1gn1V/vzkmMg78tQMHlPBy
 TzIXyyrjdPhEJSn6M4w==
X-Proofpoint-ORIG-GUID: Dg1vcxupjabSVxi8t2Dg8fbRrREVSYkm
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea8626 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-uCBNb5uNVuCDcWsMKAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX/umjzcKxjlau
 c0VbUa4MmeFyu+7K8pKRttAxEUpM8ncVXzZgTmAlxX/11N0tgp3a/tPajqH+mWC6z9W7Y28lIZA
 lckDPtZEEJ5T0m3o3A0PxS8q6RuO0MU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004

Wi-Fi 8 link peers can keep the firmware peer id invalid while the REO
queue LUT is indexed by the host-allocated global dp_peer id.

If RX TID setup uses only the link peer id, station add can fail before
REOQ LUT programming. Thread the resolved dp_peer through peer setup and
RX TID setup, prefer the global dp_peer id on global-peer-id devices, and
keep the pending REO update cleanup keyed by the same id.

Cache the Wi-Fi 8 dp_peer on ath12k_sta with RCU accessors so later RX
TID operations can find the global peer directly, and clear it during peer
delete. Preserve the Wi-Fi 8 stale saved link descriptor guard too.

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h          |   2 +
 drivers/net/wireless/ath/ath12k/dp.c            |  10 ++-
 drivers/net/wireless/ath/ath12k/dp.h            |   4 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h        |   6 ++
 drivers/net/wireless/ath/ath12k/dp_peer.c       |  14 +++
 drivers/net/wireless/ath/ath12k/dp_peer.h       |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c         | 108 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/dp_rx.h         |   8 +-
 drivers/net/wireless/ath/ath12k/mac.c           |  15 +++-
 drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c |  16 +++-
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c   |  15 +++-
 11 files changed, 169 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 337cb4b1c386..1cd388f613f1 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -537,6 +537,8 @@ struct ath12k_sta {
 	u8 assoc_link_id;
 	u16 ml_peer_id;
 	u16 dp_peer_id;
+	/* Opaque RCU pointer to ath12k_dp_peer */
+	void __rcu *dp_peer;
 	bool is_mlo;
 	u16 free_logical_link_idx_map;
 
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 4ab5daccd4f2..496eabe61119 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -44,7 +44,8 @@ void ath12k_dp_peer_cleanup(struct ath12k *ar, int vdev_id, const u8 *addr)
 	spin_unlock_bh(&dp->dp_lock);
 }
 
-int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr)
+int ath12k_dp_peer_setup(struct ath12k *ar, struct ath12k_dp_peer *dp_peer,
+			 int vdev_id, const u8 *addr)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_dp_link_peer *peer;
@@ -52,6 +53,9 @@ int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr)
 	int ret = 0, tid;
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 
+	if (!dp_peer)
+		return -ENOENT;
+
 	/* NOTE: reo_dest ring id starts from 1 unlike mac_id which starts from 0 */
 	reo_dest = ar->dp.mac_id + 1;
 	ret = ath12k_wmi_set_peer_param(ar, addr, vdev_id,
@@ -65,8 +69,8 @@ int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr)
 	}
 
 	for (tid = 0; tid <= IEEE80211_NUM_TIDS; tid++) {
-		ret = ath12k_dp_rx_peer_tid_setup(ar, addr, vdev_id, tid, 1, 0,
-						  HAL_PN_TYPE_NONE);
+		ret = ath12k_dp_rx_peer_tid_setup(ar, dp_peer, addr, vdev_id,
+						  tid, 1, 0, HAL_PN_TYPE_NONE);
 		if (ret) {
 			ath12k_warn(ab, "failed to setup rxd tid queue for tid %d: %d\n",
 				    tid, ret);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 9dba68f78808..36e2704f309b 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -17,6 +17,7 @@
 struct ath12k_base;
 struct ath12k_hw;
 struct ath12k_dp_link_peer;
+struct ath12k_dp_peer;
 struct ath12k_dp;
 struct ath12k_vif;
 struct ath12k_link_vif;
@@ -969,7 +970,8 @@ static inline void ath12k_dp_arch_dp_link_vif_configure(struct ath12k_dp *dp,
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
-int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr);
+int ath12k_dp_peer_setup(struct ath12k *ar, struct ath12k_dp_peer *dp_peer,
+			 int vdev_id, const u8 *addr);
 void ath12k_dp_peer_cleanup(struct ath12k *ar, int vdev_id, const u8 *addr);
 void ath12k_dp_srng_cleanup(struct ath12k_base *ab, struct dp_srng *ring);
 int ath12k_dp_srng_setup(struct ath12k_base *ab, struct dp_srng *ring,
diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
index 7075963251d2..79a3ad05900c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
+++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
@@ -12,6 +12,9 @@
 #define ATH12K_DP_REO_DST_RING_MAX	MIN(NR_CPUS, 5)
 
 struct ath12k_hw_group;
+struct ath12k_dp_peer;
+struct ath12k_sta;
+struct wiphy;
 
 /*
  * ML Peer IDs start from 8192, assuming max SLO clients count 1536,
@@ -145,4 +148,7 @@ ath12k_dp_link_peer_get_sta_rate_info_stats(struct ath12k_dp *dp, const u8 *addr
 void ath12k_dp_link_peer_reset_rx_stats(struct ath12k_dp *dp, const u8 *addr);
 u16 ath12k_dp_peer_get_peer_id(struct ath12k_dp_hw *dp_hw, u8 *addr);
 u16 ath12k_dp_peer_get_sta_id(struct ath12k_dp_hw *dp_hw, u8 *addr);
+struct ath12k_dp_peer *
+ath12k_sta_get_dp_peer_wiphy_locked(struct wiphy *wiphy,
+				    struct ath12k_sta *ahsta);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 58b8b3ab5f4b..e4e2eb0719e8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -522,6 +522,11 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	 * For WiFi7, peer_id is assigned by firmware via the HTT peer map
 	 * event before this point.
 	 */
+	if (dp->global_peer_id_supported && dp_peer->is_mlo) {
+		peer->ml_id = dp_peer->peer_id;
+		peer->mlo = true;
+	}
+
 	if (peer->peer_id != ATH12K_MLO_PEER_ID_INVALID) {
 		peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 		rcu_assign_pointer(dp_hw->dp_peers[peerid_index], dp_peer);
@@ -655,6 +660,15 @@ void ath12k_dp_link_peer_reset_rx_stats(struct ath12k_dp *dp, const u8 *addr)
 		memset(rx_stats, 0, sizeof(*rx_stats));
 }
 
+struct ath12k_dp_peer *
+ath12k_sta_get_dp_peer_wiphy_locked(struct wiphy *wiphy,
+				    struct ath12k_sta *ahsta)
+{
+	lockdep_assert_wiphy(wiphy);
+
+	return wiphy_dereference(wiphy, ahsta->dp_peer);
+}
+
 /**
  * ath12k_dp_peer_cleanup_all() - Clean up all datapath link peers for a radio.
  * @ar: radio instance whose peers to clean up
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index 5ef14ed24113..19f6a47acbb1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -159,8 +159,8 @@ struct ath12k_dp_peer {
 	/* Info used in MMIC verification of * RX fragments */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
 	struct ath12k_dp_link_peer __rcu *link_peers[ATH12K_NUM_MAX_LINKS];
-	struct ath12k_reoq_buf reoq_bufs[IEEE80211_NUM_TIDS + 1];
-	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
+	struct ath12k_reoq_buf reoq_bufs[ATH12K_MAX_TIDS];
+	struct ath12k_dp_rx_tid rx_tid[ATH12K_MAX_TIDS];
 	struct ath12k_dp_peer_ext_ctx *peer_ext_ctx;
 
 	bool is_vdev_peer;
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 47a7ec58446a..14755f653f38 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -13,6 +13,7 @@
 #include "hw.h"
 #include "dp_rx.h"
 #include "dp_tx.h"
+#include "dp_cmn.h"
 #include "peer.h"
 #include "dp_mon.h"
 #include "debugfs_htt_stats.h"
@@ -529,6 +530,50 @@ static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 	return ath12k_dp_arch_rx_tid_delete_handler(dp, rx_tid);
 }
 
+static bool ath12k_dp_rx_peer_id_valid(u16 peer_id)
+{
+	return peer_id != ATH12K_MLO_PEER_ID_INVALID;
+}
+
+static u16 ath12k_dp_rx_tid_peer_id(struct ath12k_dp *dp,
+				    struct ath12k_dp_peer *dp_peer,
+				    struct ath12k_dp_link_peer *peer)
+{
+	if (dp->global_peer_id_supported) {
+		if (dp_peer && ath12k_dp_rx_peer_id_valid(dp_peer->peer_id))
+			return dp_peer->peer_id;
+
+		if (peer->dp_peer &&
+		    ath12k_dp_rx_peer_id_valid(peer->dp_peer->peer_id))
+			return peer->dp_peer->peer_id;
+
+		if (peer->mlo && ath12k_dp_rx_peer_id_valid(peer->ml_id))
+			return peer->ml_id;
+	}
+
+	if (peer->peer_id != ATH12K_MLO_PEER_ID_INVALID)
+		return peer->peer_id;
+
+	if (dp_peer && ath12k_dp_rx_peer_id_valid(dp_peer->peer_id))
+		return dp_peer->peer_id;
+
+	if (peer->dp_peer && ath12k_dp_rx_peer_id_valid(peer->dp_peer->peer_id))
+		return peer->dp_peer->peer_id;
+
+	return ATH12K_MLO_PEER_ID_INVALID;
+}
+
+static u16 ath12k_dp_rx_reo_peer_id(struct ath12k_dp *dp,
+				    struct ath12k_dp_peer *dp_peer,
+				    struct ath12k_dp_link_peer *peer)
+{
+	if (!dp->global_peer_id_supported && peer->mlo &&
+	    peer->ml_id != ATH12K_MLO_PEER_ID_INVALID)
+		return peer->ml_id;
+
+	return ath12k_dp_rx_tid_peer_id(dp, dp_peer, peer);
+}
+
 void ath12k_dp_mark_tid_as_inactive(struct ath12k_dp *dp, int peer_id, u8 tid)
 {
 	struct dp_reo_update_rx_queue_elem *elem;
@@ -573,6 +618,7 @@ void ath12k_dp_rx_peer_tid_cleanup(struct ath12k *ar, struct ath12k_dp_link_peer
 }
 
 static int ath12k_dp_prepare_reo_update_elem(struct ath12k_dp *dp,
+					     struct ath12k_dp_peer *dp_peer,
 					     struct ath12k_dp_link_peer *peer,
 					     struct ath12k_dp_rx_tid *rx_tid)
 {
@@ -587,9 +633,11 @@ static int ath12k_dp_prepare_reo_update_elem(struct ath12k_dp *dp,
 	if (!elem)
 		return -ENOMEM;
 
-	elem->peer_id = peer->peer_id;
-	elem->is_ml_peer = peer->mlo;
-	elem->ml_peer_id = peer->ml_id;
+	elem->peer_id = ath12k_dp_rx_tid_peer_id(dp, dp_peer, peer);
+	elem->is_ml_peer = !dp->global_peer_id_supported && peer->mlo &&
+			   peer->ml_id != ATH12K_MLO_PEER_ID_INVALID;
+	elem->ml_peer_id = elem->is_ml_peer ? peer->ml_id :
+					   ATH12K_MLO_PEER_ID_INVALID;
 
 	ath12k_dp_init_rx_tid_rxq(&elem->rx_tid, rx_tid,
 				  (peer->rx_tid_active_bitmask & (1 << rx_tid->tid)));
@@ -601,8 +649,10 @@ static int ath12k_dp_prepare_reo_update_elem(struct ath12k_dp *dp,
 	return 0;
 }
 
-int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id,
-				u8 tid, u32 ba_win_sz, u16 ssn,
+int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar,
+				struct ath12k_dp_peer *dp_peer,
+				const u8 *peer_mac, int vdev_id, u8 tid,
+				u32 ba_win_sz, u16 ssn,
 				enum hal_pn_type pn_type)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -610,17 +660,27 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 	struct ath12k_dp_link_peer *peer;
 	struct ath12k_dp_rx_tid *rx_tid;
 	dma_addr_t paddr_aligned;
+	u16 reo_peer_id;
 	int ret;
 
 	spin_lock_bh(&dp->dp_lock);
 
 	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id, peer_mac);
-	if (!peer || !peer->dp_peer) {
+	if (!peer) {
 		spin_unlock_bh(&dp->dp_lock);
 		ath12k_warn(ab, "failed to find the peer to set up rx tid\n");
 		return -ENOENT;
 	}
 
+	if (!dp_peer)
+		dp_peer = peer->dp_peer;
+
+	if (!dp_peer) {
+		spin_unlock_bh(&dp->dp_lock);
+		ath12k_warn(ab, "failed to find dp peer to set up rx tid\n");
+		return -ENOENT;
+	}
+
 	if (ab->hw_params->dp_primary_link_only &&
 	    !peer->primary_link) {
 		spin_unlock_bh(&dp->dp_lock);
@@ -634,14 +694,22 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		return -EINVAL;
 	}
 
-	if (peer->peer_id > DP_MAX_PEER_ID || tid > IEEE80211_NUM_TIDS) {
-		ath12k_warn(ab, "peer id of peer %d or tid %d doesn't allow reoq setup\n",
-			    peer->peer_id, tid);
+	reo_peer_id = ath12k_dp_rx_reo_peer_id(dp, dp_peer, peer);
+
+	if ((reo_peer_id & ~ATH12K_PEER_ML_ID_VALID) > DP_MAX_PEER_ID ||
+	    tid > IEEE80211_NUM_TIDS) {
+		ath12k_warn(ab,
+			    "reo peer id %d or tid %d doesn't allow reoq setup global %d dp_peer_id %u link_dp_peer_id %u link_peer_id %u ml_id %u mlo %d primary %d\n",
+			    reo_peer_id, tid, dp->global_peer_id_supported,
+			    dp_peer ? dp_peer->peer_id : ATH12K_MLO_PEER_ID_INVALID,
+			    peer->dp_peer ? peer->dp_peer->peer_id :
+					    ATH12K_MLO_PEER_ID_INVALID,
+			    peer->peer_id, peer->ml_id, peer->mlo, peer->primary_link);
 		spin_unlock_bh(&dp->dp_lock);
 		return -EINVAL;
 	}
 
-	rx_tid = &peer->dp_peer->rx_tid[tid];
+	rx_tid = &dp_peer->rx_tid[tid];
 	/* Update the tid queue if it is already setup */
 	if (peer->rx_tid_active_bitmask & (1 << tid)) {
 		ret = ath12k_dp_arch_peer_rx_tid_reo_update(dp, peer, rx_tid,
@@ -672,7 +740,7 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 
 	rx_tid->ba_win_sz = ba_win_sz;
 
-	ret = ath12k_dp_arch_rx_assign_reoq(dp, peer->dp_peer, rx_tid, ssn, pn_type);
+	ret = ath12k_dp_arch_rx_assign_reoq(dp, dp_peer, rx_tid, ssn, pn_type);
 	if (ret) {
 		spin_unlock_bh(&dp->dp_lock);
 		ath12k_warn(ab, "failed to assign reoq buf for rx tid %u\n", tid);
@@ -686,7 +754,7 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 	 * allocating during tid delete is that, if any alloc fail in update_rxq_list
 	 * we may not be able to delete the tid vaddr/paddr and may lead to leak
 	 */
-	ret = ath12k_dp_prepare_reo_update_elem(dp, peer, rx_tid);
+	ret = ath12k_dp_prepare_reo_update_elem(dp, dp_peer, peer, rx_tid);
 	if (ret) {
 		ath12k_warn(ab, "failed to alloc update_rxq_list for rx tid %u\n", tid);
 		ath12k_dp_rx_tid_cleanup(ab, &rx_tid->qbuf);
@@ -699,12 +767,8 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		/* Update the REO queue LUT at the corresponding peer id
 		 * and tid with qaddr.
 		 */
-		if (peer->mlo)
-			ath12k_dp_arch_peer_rx_tid_qref_setup(dp, peer->ml_id, tid,
-							      paddr_aligned);
-		else
-			ath12k_dp_arch_peer_rx_tid_qref_setup(dp, peer->peer_id, tid,
-							      paddr_aligned);
+		ath12k_dp_arch_peer_rx_tid_qref_setup(dp, reo_peer_id, tid,
+						      paddr_aligned);
 
 		spin_unlock_bh(&dp->dp_lock);
 	} else {
@@ -724,6 +788,7 @@ int ath12k_dp_rx_ampdu_start(struct ath12k *ar,
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(params->sta);
 	struct ath12k_link_sta *arsta;
+	struct ath12k_dp_peer *dp_peer;
 	int vdev_id;
 	int ret;
 
@@ -736,7 +801,12 @@ int ath12k_dp_rx_ampdu_start(struct ath12k *ar,
 
 	vdev_id = arsta->arvif->vdev_id;
 
-	ret = ath12k_dp_rx_peer_tid_setup(ar, arsta->addr, vdev_id,
+	dp_peer = ath12k_sta_get_dp_peer_wiphy_locked(ath12k_ar_to_hw(ar)->wiphy,
+						      ahsta);
+	if (!dp_peer)
+		return -ENOENT;
+
+	ret = ath12k_dp_rx_peer_tid_setup(ar, dp_peer, arsta->addr, vdev_id,
 					  params->tid, params->buf_size,
 					  params->ssn, arsta->ahsta->pn_type);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index f523ac48747f..a76b79549924 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -10,8 +10,10 @@
 #include "debug.h"
 
 #define DP_MAX_NWIFI_HDR_LEN	30
+#define ATH12K_MAX_TIDS		(IEEE80211_NUM_TIDS + 1)
 
 struct hal_reo_status;
+struct ath12k_dp_peer;
 
 struct ath12k_reoq_buf {
 	void *vaddr;
@@ -232,8 +234,10 @@ int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 void ath12k_dp_rx_peer_tid_cleanup(struct ath12k *ar, struct ath12k_dp_link_peer *peer);
 void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
 				  struct ath12k_dp_link_peer *peer, u8 tid);
-int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_id,
-				u8 tid, u32 ba_win_sz, u16 ssn,
+int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar,
+				struct ath12k_dp_peer *dp_peer,
+				const u8 *peer_mac, int vdev_id, u8 tid,
+				u32 ba_win_sz, u16 ssn,
 				enum hal_pn_type pn_type);
 int ath12k_dp_rxdma_ring_buf_setup(struct ath12k_base *ab,
 				   struct dp_rxdma_ring *rx_ring);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 77343469ccca..37c17a97d5aa 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7177,6 +7177,7 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 	struct ath12k_wmi_peer_create_arg peer_param = {};
 	int ret;
 	struct ath12k_link_sta *temp_arsta;
+	struct ath12k_dp_peer *dp_peer;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -7235,7 +7236,19 @@ static int ath12k_mac_station_add(struct ath12k *ar,
 		}
 	}
 
-	ret = ath12k_dp_peer_setup(ar, arvif->vdev_id, arsta->addr);
+	dp_peer = ath12k_sta_get_dp_peer_wiphy_locked(ath12k_ar_to_hw(ar)->wiphy,
+						      arsta->ahsta);
+	if (!dp_peer || dp_peer->peer_id == ATH12K_MLO_PEER_ID_INVALID) {
+		spin_lock_bh(&ar->ah->dp_hw.peer_lock);
+		dp_peer = ath12k_dp_peer_find_by_addr_and_sta(&ar->ah->dp_hw,
+							      sta->addr, sta);
+		if (!dp_peer)
+			dp_peer = ath12k_dp_peer_find_by_addr_and_sta(&ar->ah->dp_hw,
+								      arsta->addr,
+								      sta);
+		spin_unlock_bh(&ar->ah->dp_hw.peer_lock);
+	}
+	ret = ath12k_dp_peer_setup(ar, dp_peer, arvif->vdev_id, arsta->addr);
 	if (ret) {
 		ath12k_warn(ab, "failed to setup dp for peer %pM on vdev %i (%d)\n",
 			    arsta->addr, arvif->vdev_id, ret);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c
index a89086ca15c1..2006a862feb2 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c
@@ -319,7 +319,8 @@ int ath12k_wifi8_dp_peer_create(struct ath12k_hw *ah, u8 *addr,
 	struct ath12k_dp_hw *dp_hw = &ah->dp_hw;
 	struct ath12k_sta *ahsta = NULL;
 
-	ahsta = ath12k_sta_to_ahsta(params->sta);
+	if (params->sta)
+		ahsta = ath12k_sta_to_ahsta(params->sta);
 
 	spin_lock_bh(&dp_hw->peer_lock);
 	dp_peer = ath12k_dp_peer_find_by_addr(dp_hw, addr);
@@ -375,7 +376,10 @@ int ath12k_wifi8_dp_peer_create(struct ath12k_hw *ah, u8 *addr,
 		dp_peer->hw_link_id = params->hw_link_id;
 	} else {
 		dp_peer->assoc_hw_link_id = params->hw_link_id;
-		ahsta->dp_peer_id = dp_peer->peer_id;
+		if (ahsta) {
+			ahsta->dp_peer_id = dp_peer->peer_id;
+			rcu_assign_pointer(ahsta->dp_peer, dp_peer);
+		}
 	}
 
 	dp_peer->is_sta_bss_peer = params->is_sta_bss_peer;
@@ -410,15 +414,19 @@ void ath12k_wifi8_dp_peer_delete(struct ath12k_dp *dp, struct ath12k_hw *ah, u8
 	struct ath12k_base *central_ab = NULL;
 	struct ath12k_dp_wifi8 *dp_wifi8 = NULL;
 	struct hal_srng *srng = NULL;
+	struct ath12k_sta *ahsta;
 	int i, ret;
 
 	dp_hw_grp_wifi8 = ath12k_get_dp_hw_group_wifi8(dp->dp_hw_grp);
 
 	spin_lock_bh(&dp_hw->peer_lock);
-	if (sta)
+	if (sta) {
+		ahsta = ath12k_sta_to_ahsta(sta);
+		rcu_assign_pointer(ahsta->dp_peer, NULL);
 		dp_peer = ath12k_dp_peer_find_by_addr_and_sta(dp_hw, addr, sta);
-	else
+	} else {
 		dp_peer = ath12k_dp_peer_find_by_addr(dp_hw, addr);
+	}
 
 	if (!dp_peer) {
 		spin_unlock_bh(&dp_hw->peer_lock);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index 0b8a9d32e125..c74f070c0d88 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -364,11 +364,18 @@ void ath12k_wifi8_dp_rx_peer_tid_delete(struct ath12k_base *ab,
 					u8 tid)
 {
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	u16 peer_id = peer->peer_id;
 
 	if (!(peer->rx_tid_active_bitmask & BIT(tid)))
 		return;
 
-	ath12k_dp_mark_tid_as_inactive(dp, peer->peer_id, tid);
+	if (peer_id == ATH12K_MLO_PEER_ID_INVALID && peer->dp_peer)
+		peer_id = peer->dp_peer->peer_id;
+
+	if (peer_id == ATH12K_MLO_PEER_ID_INVALID)
+		return;
+
+	ath12k_dp_mark_tid_as_inactive(dp, peer_id, tid);
 	ath12k_dp_rx_process_reo_cmd_update_rx_queue_list(dp);
 }
 
@@ -517,6 +524,11 @@ void ath12k_wifi8_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
 	lockdep_assert_held(&dp->dp_lock);
 
 	if (rx_tid->dst_ring_desc) {
+		if ((unsigned long)rx_tid->dst_ring_desc < PAGE_SIZE) {
+			rx_tid->dst_ring_desc = NULL;
+			goto clear;
+		}
+
 		if (rel_link_desc) {
 			buf_addr_info = &rx_tid->dst_ring_desc->buf_addr_info;
 			ath12k_wifi8_dp_rx_link_desc_return(dp, buf_addr_info,
@@ -527,6 +539,7 @@ void ath12k_wifi8_dp_rx_frags_cleanup(struct ath12k_dp_rx_tid *rx_tid,
 		rx_tid->dst_ring_desc = NULL;
 	}
 
+clear:
 	rx_tid->cur_sn = 0;
 	rx_tid->last_frag_no = 0;
 	rx_tid->rx_frag_bitmap = 0;

-- 
2.43.0

