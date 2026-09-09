Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CB5921F7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963998; cv=none; b=F7HjUJiHVFJ+TG1p7ZYrOlT8edRJxCJ92sPQuZcG3/dW02b1HOvOw0K84lAw6K8Tf3/SVD3qe6KCfwOXktuHfmrI5cxNN8EoJdgY71M3RxXSfz3WugaqdzV8fIXOKSSnA403ymuazv9kGswWhESQwhdxMOwt+tkDKPjQmKBUWgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963998; c=relaxed/simple;
	bh=DlQubEOkIDVPGDIBdRxfLkBUTl4fYiC5VtJ6o5opARs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GYUah8vbivqBGidPHJsCa48vhx9Ltpg/O9f2JBB+otOqUJmG+qpwHT6ZuiovTT0XodBRQAr/6M4v1mXZBhsxg+C+dzyT5bjngW3XcveLjT9sg+g9cPxFkv4tx2ggWJfnHdIqRoQgUEUP6hjfv7NY5Tk/7yIhJvwaVardpXPWBl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNaocI1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+BFHlup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNaocI1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+BFHlup"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU96V599915
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=; b=eNaocI1QAzjNo97f
	LHIn63a6VUmXPt5ynwA2FMvHMc6uAj1rJmFVGomItFVezOKNdba9LiCQqbJj1TAx
	sbZdKrASy+M0+QlQtDQvabWYRnibrtxhd9qedrMIlo+09kzeNva0DyXtJ1lxm8OM
	DxQ8eOiINGkE3prbXfD819LZrNd589Bdt5kYLC6OIeiEJPwod/wBZXvc9/mu8thk
	vzoW+aCGGzB3JqumzrTgVsRT74OH7rVMJgb1lW1as3mZk/NI11HEfIfqgmWhrvP1
	ous50TwOeIHhgY5loh91vm3YmKEJH6YP+C8HEe2LjYqoMnWYzteCP08XHG64VcGj
	5FQb7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2kn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:26:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9394ad7f64aso916015885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963995; x=1789568795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=;
        b=T+BFHlup7cx/S/8Sfl7iMyo54qRY/D4nDzqglpfg3PgQQzEIjao7G6E+DPXvtz6UNt
         cNmDGjQ3RhF9OVcQtKeqpKrovd2dL7Objs/qWM6qPgFoZqRYQckEngiq0tOw/Swcg/yd
         b/DLqJ9vpjS3HdJno+KPHMvwhwW09r2vzQ4iAJYJhIu18oUwLGelyHgXa+AUC70TcEly
         Xgw09ufKDrW6ASs9En7LYWCRUyraiHbkl22TmNvAIFYMd+vEwbkcj7xyzpysEJVKdH2z
         000QOxSI/Dcxo7hesCOliL+zlp5s75tVzAJRXaAyPP87TTdyRoQU0KgUGuSYkL/LjL1L
         RpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963995; x=1789568795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNPx1Iwf446OIvz96wKGJfwiAph42NpcEbDD+XdjGQI=;
        b=aNx9bdzGmab4hwhi2TyR7chnmUgJWtmLRvpG8Yh1r5dlThLMYhouuX+6cQ+OyKG/6l
         Use+1l9+qIOh/Go9so8S2j/3XZbigS6RsYqArCUFG2aXoJdHvOu1nW70OkkcpimRJwlI
         E9PMwbEVd+1ZcqK82OJw+Zb/q82aRxYJ7Xb+pHMMV/yiqGqntHRyL0jMAJYhy5RR4Rsd
         a8u5qGa4g5isP4t6JUv0tnywjwv07wUEJX3dcwEi8CuJlvhGBNhyFvYmxLY8tmGpdGqZ
         G28aT6yvlar9AGjMJEVbAqaNi0fGsEHpKZNNxJAbD6k/ptMxB+OBRrhRr3jG+gPAfta/
         OwGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY7UCNoZ4S+JMGT7fNG0Gg+KoiPxJVMiH0qCAXq5mml4kMtVs1/uyx3jJdYL8LpqkPeyablEVWsTF6dyM=@vger.kernel.org
X-Gm-Message-State: AFuF++kF2Nvgh0Eve3eGVzIOESA6W64+283N/JugDh/ZxZzxf0PCsLob
	5vF3Xdvkg7ODZj72hoQrezAJpjlS4jEYRmF2I1ElYOjhbf7FC3D0QS2SUtORn24AVipIkV0Bs/Q
	WiMigqkOE8J9Xpwads1qQBIAJok9J7iZUfwJBq3UmiprUYEOuw1+23mKZgu9P+KtVZOI/mTbZfN
	Y=
X-Gm-Gg: AYBFou3EnCFLPJcXx0Q9wBZTrYLuHWsKV8sdxaiBm0uYLvx14hqn97ZiWh6BgSjA58O
	u/z+mI+EHBdLpyU6ns+ZXj7ZPwSLV6UNmO4cEAyvszJyhOCR9b3v9EwDa/q1Xzg3mVXama3dfmt
	UmLLEgOiY6Skni4KaVx9AcIAHSNJbZKDiXSscAYR8bc53pvrhFJAr5W4yYwA1SlFdhGT+tC4LUP
	rV/NVL7uMRmqZwLE/KgIrLiGrRvM+1lzDAKUg78D2O9ALKt7lrk22Gd0fQZRY1PuZxI7fHIoUyu
	WgcFs3bzIcX04LHr8Ccsz/am+cHbKBW2+LNmxRVmhPKJcAy5KknrVNPtI08m/2Jlj+Ux91owjOc
	P0Kg3BA1jXXCF/w==
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr229051785a.5.1788963990333;
        Wed, 09 Sep 2026 07:26:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr229018485a.5.1788963988272;
        Wed, 09 Sep 2026 07:26:28 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm54890715e9.3.2026.09.09.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:26:27 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:26:09 +0200
Subject: [PATCH net v2 1/2] net: stmmac: propagate FPE preemption-class
 mapping errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-1-8158b8333b3d@oss.qualcomm.com>
References: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d@oss.qualcomm.com>
In-Reply-To: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa16c9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BTyLBLs5qSdJAr6D0oQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX/I6HGSmAf6dD
 2YSqY1rDquSI2CLgx3YsbfYR/LpqRbd3G0kNQBlxa+hjibW9EPgNwdBaoZsFBN+/9ZX3Y3p1FmS
 YZVOjAL3LLSyxFcIh0HnpwbE0ijIzV5XG+JbGNWnaWIChFI4HUiqxSUR/REO+VExrG6SwsFlI3f
 HWNXzh9lhjxyoMgH8jlko4yBEKltM4SWp3+T6TMNaYSyC21nCJmzHMqeTRSx0DxDYaLs+ARi4uU
 6Zok5Ph4M0gMQo1je6dVDbHqC0mdpT0euBGS37m4TrUqQxmGOiI2j/86wVRfaNhxohtdyecpPRW
 YulKPs+liyF0US1+EF9iCeuq2hVw/ld0942zqNqQ2DkLqwbk2keaPleCddu5PT61JHWQoO7neN2
 2A+6HvIOaut9ou3FvuQOfkM8Y1reMXHQQ06uPp5xIsgY1B1LRYuj5EJkUnKgb0sKoHkLKiGdmYC
 Te+1DGxHVPmCWLrxgGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX266Gh98/0+Gd
 4D0rOrHb6HHk6XB/iGH5ggnHB0cfFpWXlKx8um/BV++4zbl7Zxc38EqpaQn2f2i4NUpolY1ECF5
 wekTH8qT2keabUiE15LBUTpvwIAO5S0=
X-Proofpoint-ORIG-GUID: 6COiZ2ZwRi4xu5dCG3fFtAIaKcoebV1r
X-Proofpoint-GUID: 6COiZ2ZwRi4xu5dCG3fFtAIaKcoebV1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090161

stmmac_fpe_map_preemption_class() dispatches through the
stmmac_do_void_callback() helper, which forces the callback's return
value to 0 whenever the op pointer is populated. As a result the
-EINVAL returned by dwmac5_fpe_map_preemption_class() (e.g. when a
preemptible TC owns more than one TXQ under SP scheduling) is silently
swallowed by every caller.

Switch the dispatch macro to stmmac_do_callback() so the callback's real
result is propagated, and honour it in the taprio and mqprio qdisc
offload.

Note that the taprio "if (ret)" check in tc_taprio_configure() used to
be dead code and now becomes live: a preemptible TC spanning more than
one TXQ under SP scheduling cannot be programmed in hardware, so a
taprio or mqprio configuration that previously returned success while
leaving the preemption-class register unprogrammed now fails with
-EINVAL. For taprio, the failure also runs the disable path, tearing
down the schedule that was just installed; this is the intended
behaviour.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 19 +++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..9314bcb85c22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -494,7 +494,7 @@ struct stmmac_ops {
 #define stmmac_set_arp_offload(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_arp_offload, __args)
 #define stmmac_fpe_map_preemption_class(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
+	stmmac_do_callback(__priv, mac, fpe_map_preemption_class, __args)
 
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 14cabe76e53e..5398616fcdfe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -970,7 +970,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	struct netlink_ext_ack *extack = qopt->mqprio.extack;
 	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
-	int i, ret = 0;
+	int err, i, ret = 0;
 	u64 ctr;
 
 	if (qopt->base_time < 0)
@@ -1120,9 +1120,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+	err = stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
 
-	return ret;
+	return qopt->cmd == TAPRIO_CMD_DESTROY ? err : ret;
 }
 
 static void tc_taprio_stats(struct stmmac_priv *priv,
@@ -1237,14 +1237,15 @@ static int tc_query_caps(struct stmmac_priv *priv,
 	}
 }
 
-static void stmmac_reset_tc_mqprio(struct net_device *ndev,
-				   struct netlink_ext_ack *extack)
+static int stmmac_reset_tc_mqprio(struct net_device *ndev,
+				  struct netlink_ext_ack *extack)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
-	stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
+
+	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
 }
 
 static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
@@ -1257,10 +1258,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	u32 num_tc = qopt->num_tc;
 	int err;
 
-	if (!num_tc) {
-		stmmac_reset_tc_mqprio(ndev, extack);
-		return 0;
-	}
+	if (!num_tc)
+		return stmmac_reset_tc_mqprio(ndev, extack);
 
 	err = netdev_set_num_tc(ndev, num_tc);
 	if (err)

-- 
2.55.0

