Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7D44F55B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723791; cv=none; b=rB3YG2gI9lk5GT6cioxluL23KnVLKUQrVcrub36T3mENYaWXo5oz+aTlD1wBxbnu/dIzWCOpLB3Sj708P3UPSsa5vI5nxCUICTvbOPBcclLLNgHl8zyFAPzhTyj6iTEY67QzGmjXzwsZfdnzCR/f+CbrYsPnkSze0E68x5z4Nss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723791; c=relaxed/simple;
	bh=WGkpfCN6Up9LleQnrV1JPYhqrbmq8We1WbCehLL66ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKIplLpvf825fqS8wa5QzX+E0qx920E2PvG+xP7rY4nMAZofGhb+n192IwAo3Htd8xMxkWUfK3nNP1LEGZi/GhddRJXP3qCIYFeARTCSKwTI2DoTpGvikWsG1ANeRPVfb8/dDJalCOQOEOL10GiOlrDKXEgnPx9p8GCdgTIYwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7gZMsoh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iW2fCxZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7gZMsoh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iW2fCxZ0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B852ak2111076
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rO1/Za1A0DarcuqQ6a9H3IFa91AgUYHGA+PHZR++xU=; b=P7gZMsohxi6G7yXr
	xO9RQwTJT4+4M3oE/MJrE4TfgSW1o3Es+kUUJtKCvfPCrmbbjanW8akSkHKSgRqP
	17PraAWhjG6/pvZpJgpGD6vwq3cA8s84/lmdsBpmAaW3ruAGHlauJamWyoRHjyD5
	P8N4MAUmYmbxVpQDSl3AEdSM7rTwazIcH10migcuzWILfHrFtufaOTqpQLlWP84O
	mmD7/1tPbA6zTmS/7jifDWz+J6mwFc6pJ5o+H26jI/Wt9BWQMUW7xgOTQgYn/Obh
	jkVtwaaZQIeYWSQux3cnY7tDAR+umLhQ+bWsg+CsjEZxfy6+vHx3D04YF9FnJC6S
	kBzUNg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9tun5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so339385eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723788; x=1792328588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rO1/Za1A0DarcuqQ6a9H3IFa91AgUYHGA+PHZR++xU=;
        b=iW2fCxZ0ptlQ8qqwrfXmzDD77SNO5NNSsSknIOQBeSgZGk5BZ2w26QymQsvbTyqeKY
         lxabZqy04ixM5IH+DxMaRRb8F7y7Mna5oWq5fc2YxFtyQjY4BFg1J5hEF8JrWa2yGdmh
         Df658XRbcwEbWeq5rxby4ZP9afQvfb0O3cig9QfGRauiTDbsTepAu/QlUKLa5Z+yBYV8
         Knt8ot6VSTo7B86IZvkdThwzcTAuueZeIpMjzBKlj+UIV0aRIYOPyQXCBPfoevZFOfEc
         XE1gND7Mykzhzsk0dLSgnGxKyW+RRPVL+l8vIISUVPTBwmV4xlmjTaPAV5z0FrBI2oJ7
         l9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723788; x=1792328588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rO1/Za1A0DarcuqQ6a9H3IFa91AgUYHGA+PHZR++xU=;
        b=BlVWF+01ru+W14PXmsffgs6QmVzgYOuyYyXt8XJKBP0/wJEIBlAmfmhqhHwcEuRHEA
         Dpe9/vYWKpYxMPS+cWN1NP78UhpuoQG/enillHKiyhkqnlbRZtkuefDBXd8IsvcAQd0k
         LrsGV9LrvzTg9Xkq4Lx9zyN/DpZ59vx9CwvFNl8vXVXT74+IOPnzzRuy+nDsOKR3Y4f0
         iGisosqxutLxPRhnlIw6zg5fhW6R1yyqnEo1RVctAxKM6Q6pYUNEia5v5U3r1MdGm1jc
         8sSBaZY0FJ0ih8knulVyDHFdi1jznd/OO/i+Rvc0xlNLASWRgqop9zKWItNfPhcYnKu7
         1jtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbfPx6K7+J/acW+CHR5iznDX96dYJoSavmF7hO4cccTacb5V4BIdPuedAj1nqkhP8o8+gER3V2c+wK/qg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Wbxb6BzLtbrUjBuwh0w7gP9waX0bSrk22MbOvogm8SY25et2
	hzlZLBzDb+FJ3w2hQyHFc7OoYd22UJS6yHpV/Mi6EV48ruIFgOv1SX3qA9z1oUrU3H+iHuCB81h
	odxkkGcb3sO0ahRTHbpVhUS2DOk5fG+QLLe9dBFhpeH4ivvRew86KiPXljPg8izCAXwU=
X-Gm-Gg: AYBFou2zHpEfiKoNP6Z15m7CrYMf5xJqmsE1iloo0sKKhoJG37kfMak4HuPPdg2xkpO
	aNA/JfvqB86aTx64RBELczWlZV5QUx71z+nZ9wBI+nTm2w6Xqx8x/03Uu5hMlsMo6WgtBT826Ct
	TRLrybiPFiwTaXjVkr/4oUSO9B2sEGHnd1VaaA7Tl9h7gHMf0Y20767HQTUhjdg7buILY2357ad
	HNM0g8pR9Kc0nTIRBnbQyCi7f8n7k+qRLPMe44xdv7a57u1S1hM5PqTgzAK1/UgydajoDZMucAi
	u3jZPdq79tIRbnb/XRdbXDIb3Y1hJeQhCSUnafETDnGHn0jSqR46qLl9JOaIIO7LwqytSsVcxV/
	T1khy/AdazeAGJfgQcHDIJZSNmXgbOsbkCHucvUPjYBU=
X-Received: by 2002:a05:693c:88c8:20b0:358:f678:46b6 with SMTP id 5a478bee46e88-358f6786227mr4339914eec.22.1791723788243;
        Sun, 11 Oct 2026 06:03:08 -0700 (PDT)
X-Received: by 2002:a05:693c:88c8:20b0:358:f678:46b6 with SMTP id 5a478bee46e88-358f6786227mr4339881eec.22.1791723787572;
        Sun, 11 Oct 2026 06:03:07 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:07 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:10 -0700
Subject: [PATCH net-next v2 04/11] docs: networking: Document IPQ5424 as a
 supported SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-4-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=1613;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=WGkpfCN6Up9LleQnrV1JPYhqrbmq8We1WbCehLL66ko=;
 b=AdwziqrvuaKNl3UTc9TYrxr5vR8rC3zWkZwO2PbFgtQPe+q4aZCtEsom8v0oKLdUgznRjnkoH
 upa+RaCUiLgDPXmmugBu00qYt9S20KiN4Q/hkW5q7rrpSCsG6tV/5Oo
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acb890d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=U071OhrquwQVcrAs3WcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ErC0KP6gTkOoA5EPB8BQrvhconuQoZBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX/mWfWPA4i4OO
 LDpygrjoUEcjz7J9zVXqQqSzu2NTr30BnI8C8r9Q1n+f0v+fPIPoob9Cf8F7+hCzmsUnlCJEgXP
 2zrSlQHVhAhQCkcOhnYRYw3klIkE28BS7Yt2ndID1L1O8ySPsjJCKJjsmTe7bDs9czLwhICQWYr
 TCkfmcgHv55HbQy0uvWceHPv8zPEYmtQxb5X9i4DKIE5bf7iGcczTeycTXr8HPVDf4/pVU8Lo9b
 PMCb4Rnfy7MkahFSOwHFFonWJaCI8L/xMy8nQ8ehKq6vieJooDN5k45/tYa7dqkx7q2aeg5RBeS
 csGgpFgUE2oEqKFYPpUfapX8eR7F4XCum2oNLaI5yu7KXukoRrmAfXSx9Mmsi6kZ94KZkxuHwKq
 cQ8syZoCmEEn1ZsrIWt21NdKWKqX8PMD3JZmYds6QMpIga1aiIb/TYnPSdQE6+l3yLWY7jQ6qNI
 zhpa+iP5wnv911xpe1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfXy+fymuNNUhYS
 1k6W/4rJ1jTFUV3Zg1r2VtQhIsF61gZdDyhXjoPquQ89XByeRNUcOlztd3XKrZFaDV2tnPWsDM6
 xXUSv+qEBwdhp6FymfZ4vc5hpDuhO1c=
X-Proofpoint-ORIG-GUID: ErC0KP6gTkOoA5EPB8BQrvhconuQoZBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110051

Update the qualcomm PPE driver documentation to list IPQ5424 among the
supported SoCs, and describe the per-SoC PPE hardware differences.

The IPQ5424 PPE reuses the same switch core as IPQ9574, but runs at a clock
rate of 375 MHz and supports only 3 front panel ports along with the EDMA
FIFO port for host CPU communication. The EIP FIFO port is not available on
IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst b/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
index 4ab299a28969..04c48cec66d5 100644
--- a/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
+++ b/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
@@ -167,6 +167,14 @@ PPE Driver Supported SoCs
 The PPE driver supports the following IPQ SoC:
 
 - IPQ9574
+    The PPE runs at a clock rate of 353 MHz. The switch core has 6 front panel
+    ports (port1 to port6) and two FIFO interfaces: the EDMA FIFO (port0) for
+    the host CPU communication and the EIP FIFO (port7) for the EIP engine.
+- IPQ5424
+    The PPE reuses the same switch core as IPQ9574 and runs at a clock rate of
+    375 MHz. It supports 3 front panel ports (port1 to port3) with MAC0 to MAC2,
+    and only the EDMA FIFO interface (port0) for the host CPU communication. The
+    EIP FIFO and port4 to port6 are not available.
 
 
 Enabling the Driver

-- 
2.43.0

