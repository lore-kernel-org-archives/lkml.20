Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754652;
	b=p/xCn3hFQbk7QWPyYM2/DYXwCx0XJ5PhdYAX3pZge4D15H4hUCA2fjyQ+fWQihivdwlu
	 SGvgK1J2r2FBPlm48KdW4RWwkFpADJc2pTggmqnj1ysBOQccbUBQCk2qiSRlSzqWBYwtu
	 AliulwViduFk8Y39cJNU+nZES4EIfnfr0XJpId7rg6a5XKm2wh7fMJRhGlksOwNoK0/DM
	 2aBjUL2Fa2Dmc9Phdlawlv1CkrQ2N9vbN+3MjCOhpOmDFeyz7SQr+Cz/stSkhWoZveIqM
	 PvevBtEp2wcgyD3ldQuyL82wZQ3GUh6qzal9wPTNfoUqW4ggXgREcIeTfa2IeSpLKhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=;
	b=i0D/o9WNB8kJtBSFy6W/f2hkml3BTzYdgfVc3v2QoC1YjPqWeGV1/zNT5coN9WP7W3Jy
	 JnvabVAytLKqz5PXijo9Cp4V8TIRqX5oACfnzcY6RnvAbLEOV7ue/+lX3r9WgLIGcMCkJ
	 HSlD+XRPf837sC0mPIzk+q0kCE2DFV+Tvvl2tkyPfItPhFBJ8oAICjc1++peZUQtFoC5T
	 SeOK9lGqLxLquO/5OkGkWEU7ipsD+S9AzxXVNNiLqiG1jb1xk2D9ufa7JsmdqZZ+0MBLP
	 R4kbIKQTwL8/DKmRCNafIrMRNv7HcrvJ9sAz9ESGR5nPZLHjDoZA8+hjb5hDfj/RCVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM6UyPYB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY2WOPRX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538C606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B538C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM6UyPYB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY2WOPRX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RUDN230860
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=; b=fM6UyPYB2V2z0iYq
	qc1CwSIjDpeWo4p5H29X67tRSeQcAVdE0vwWdKI/BJUYhZOdAc4pXaqkSWgXfaCA
	o8s4FBSUnp+efxxl/eN0TTTTHaWpSGGqsTOyhJ7MhCCHvSsrhTGKfvNZqQ3z2saK
	5jr3IFKANFXiBCwsQYQUHy0BVPymT0dBUiUeySdwCscIv1fvF2VrWBCGneLIroBp
	H598VDAx7PSZKZ5CXk04prEQmFPOYOZs9b1qILIB/FagLP71McGc27EtUHPkwexa
	Am82oW2JMLkzcb9egd0aeYBGfrjqFjKvNO+69fcXi3CeE6ETU/+wCbyDxTkp3A1t
	eHs+mg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypjdvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so584467eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754650; x=1794359450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=;
        b=aY2WOPRXRPb/8lT7GX8h5esVsmJytEsJ7VztRlJ99AMDnJJcYdU4f/pKrx6h39VfEv
         2hB3EDytPanNK8DtlLqUKpuRak4eq0UaZPD1IbP4AxLjyqr2PrruGStBiaLcaK459nds
         URTVrgreE8Usd32Bh32PLsXT/Dm+pyzAC2ny97KmMAorSqhRITD6raLmyey3OL6QRRAL
         Z1FElKoHzHkTC0hgVuPfIJWj+ed52DvSPkr0ncEsBUk91bqJWgZiGWw0oLoEd3/WroSg
         tul5OlkOOqBoUFKo/5siIxZg2mPXXWQ4kpV138FftgohjglqfVjWIf7AnAmSdz9V/7mq
         kQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754650; x=1794359450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8YIDJHbFc9oxfzY+rT0pm1nf2Xr9+0RAa6mrgtbcJQ=;
        b=ADno3LQ5j1RLm5hKPB2w4YNG4pXDoJQDJ7BLGEqoOZv7xuXinz8f5FP38MKHr1WW+v
         M5MtLLnrnq4A79fCWBZhV8M7s5BnEY5cEshYDoVckF6wLwA0BSsWjqomKwmKYXNQwbqX
         QySkd4bNVksut0j8d1Tw67l9nmk0u2ASn1XhUk7gHJvROTio9C3lKtA/CL+eldyUjBUP
         CeC2cc0HZ3iVTWmcce/Wq2osk1suciK9fchduNk0txrop8t8tO/+QMgatuCRc74XUspk
         M8FDxb3MO8hUEQWuJBZPrPSHp9w0PdLIZO8DGMd8vovsMkrNL0pW71hou7W+ameR/R/f
         A8PA==
X-Forwarded-Encrypted: i=1; AKwUvBwoqXrBOl/xnzZi2wAYzieehI7JSMhBn/Bf1mTAqt0Yiyn5LCaiu/SXWAF549QDqcrvOlYCfa8SSAB5nYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AnwwAd2SozbdOE3TU92XzYQKIFk/vE4Sdcc0ORxjLsvvc56a4
	jRNyZ3kxmMgv+K8iaVnD+XQI8naD/FrQELqhvwJTq08WruVpC/j5KlYCYYd7btMCpTGM3shsU5y
	BRRZG077BeQvyMAH8+yvhr5uFo7QxjugVR6PYj1831WpGVfY8yhKm1WAot1LRV9iiM8rHpBbnn+
	c=
X-Gm-Gg: AYBFou3lgF7m8vABmLT46LZtuE37CSmMdj4g/5BX5tugpT7wWF09p+cgtUSHJ1gX4A7
	2nqsh8YSARJSwDK8CVLCub1lEUPgkjrrwF26CeXeSfJVqwjA4jLL35gey1zkM0syRp2PML3oy0a
	yf07hsYPtt7yz7K/APzn4AXlDvoA8btpYAVA1qdp4FoHMj/S6p5p/RAJwe05MTfFHsHhKUG4LnJ
	3K35GnZz0BsLyRF0grx9gIKRE6O9CLSknk0jGebWu21bHGspeLZxscl/FoINIdeai59zhwSXh+8
	8ZnMTjSzg1BPXgdWUDGGPWJy2+8aZJQ65UmL020LcmoNTnJ8wXnPquqMIDRmLIYu1rW+8kuZiGM
	IKwLj4GcwgisPb1vme2c6n5wOJmzwxWGUE0kcjR2LmYtwRlKWiEhF+CNDuXFcFvTJehP5FXg18Q
	Tesj8gDRI5FRLk60ZA/BKC5ZL/VxqE65S0L5LU
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id 5a478bee46e88-36c9b356dd1mr3626630eec.25.1793754649753;
        Tue, 03 Nov 2026 17:10:49 -0800 (PST)
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id 5a478bee46e88-36c9b356dd1mr3626604eec.25.1793754649242;
        Tue, 03 Nov 2026 17:10:49 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:48 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:46 -0800
Subject: [PATCH ath-next v3 03/13] wifi: ath12k: ng: allocate REO command
 context before submission
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-3-861adf04b516@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX6SCFciHKqTWy
 WgXKTDLVWGheX6Bjwf9y4q2NlCbbVsILUfTtVUR8Seey4G4nl9G4xqXRCKp1N9WxkkSJqmHieCU
 Ws6wrCRY9ofv2aIPDk73dIFeADV+Xl8=
X-Proofpoint-ORIG-GUID: 9UXJfP7zQOfguJsSqCngK9HIqsjO-UvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX78g92GUUndfN
 qGoWm8J1UTsAqjuzoFVEd0NVMXhUgKSJIM3HWCjeIWg5I3OdGYLg/av+6FHJrUmiaw8KV1yahna
 FYKVeP9xtaSO6V0U/7VDRnNhYx38kC7cab9pByRdNmbKSE3D6yjvqRscV7OvhCGBliFcPbYtUMq
 ZkyVC18CTM8OejJLb6QP3tM0+6I9/1IMhTTB9Fr8OJFDINpAqEzjjIL+zyPJVHGKGWJAvihCExV
 TNNNaq5uqdaP7llz7vpx5U2MACmBGgfxvcS03LtBUNnvAEID86Lt3lAeM/sRc4W1Ul8PD+heP4m
 19WbkfGRSvlDWmdBm6n6GWO7LemdxaRL4koxoKHYqeekd6wWfBDeSqBdr1G+SEjuUXCHt7UQKzS
 +gJkIQgmI7HiYzUsz50wfSp3U+KvR8XJoYK+RoAVLGwHOuAt59oLgmEFEG2I7qTndv+7WIuP5V9
 OV1A9lBxf2SiZFmqTiQ==
X-Proofpoint-GUID: 9UXJfP7zQOfguJsSqCngK9HIqsjO-UvZ
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea861a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tQMSYTo8XKOll51RSuoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004

The Wi-Fi 7 REO send path submits a hardware command before allocating
the software entry used to match its completion. If the atomic
allocation then fails, the function returns -ENOMEM even though the
command is already in flight. The completion cannot be matched to a
callback, and callers may retry an operation whose first command was
accepted by hardware. This can skip RX TID cleanup or issue duplicate
queue operations under memory pressure.

Allocate and initialize the pending-command context before writing the
REO ring. Free it when hardware submission fails or returns an invalid
command number. Commands without callbacks continue to avoid the
allocation.

This changes only the Wi-Fi 7 command sender; the Wi-Fi 8 ring path
already allocates callback state before submission. Found during code
review.

Fixes: 52c555680bae ("wifi: ath12k: Move arch specific rx tid and related functions to wifi7 directory")
Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 35 +++++++++++++++++----------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a41049e7b425..d3ed2134818a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -148,30 +148,39 @@ int ath12k_wifi7_dp_reo_cmd_send(struct ath12k_base *ab,
 	struct hal_srng *cmd_ring;
 	int cmd_num;
 
+	if (!cb) {
+		dp_cmd = NULL;
+	} else {
+		/* Can this be optimized so that we keep the pending command list only
+		 * for tid delete command to free up the resource on the command status
+		 * indication?
+		 */
+		dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
+		if (!dp_cmd)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&dp_cmd->list);
+		memcpy(&dp_cmd->data, rx_tid, sizeof(*rx_tid));
+	}
+
 	cmd_ring = &ab->hal.srng_list[dp->reo_cmd_ring.ring_id];
 	cmd_num = ath12k_wifi7_hal_reo_cmd_send(ab, cmd_ring, type, cmd);
 
 	/* cmd_num should start from 1, during failure return the error code */
-	if (cmd_num < 0)
+	if (cmd_num < 0) {
+		kfree(dp_cmd);
 		return cmd_num;
+	}
 
 	/* reo cmd ring descriptors has cmd_num starting from 1 */
-	if (cmd_num == 0)
+	if (cmd_num == 0) {
+		kfree(dp_cmd);
 		return -EINVAL;
-
-	if (!cb)
-		return 0;
-
-	/* Can this be optimized so that we keep the pending command list only
-	 * for tid delete command to free up the resource on the command status
-	 * indication?
-	 */
-	dp_cmd = kzalloc_obj(*dp_cmd, GFP_ATOMIC);
+	}
 
 	if (!dp_cmd)
-		return -ENOMEM;
+		return 0;
 
-	memcpy(&dp_cmd->data, rx_tid, sizeof(*rx_tid));
 	dp_cmd->cmd_num = cmd_num;
 	dp_cmd->handler = cb;
 

-- 
2.43.0

