Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32D4D9F7C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471139; cv=none; b=BwShtxeHdN2bn+0+zNUA/Nu9HHT/ks3+g/fNaGiJraz1nCtMhL+HDdBTAY6NbpLoGoURT2Fddn+Lf2aSMGBbv6Ed28Jdvm2u+VjsnLISowItRjk1ecFFEL6p9LXbGkm4JWHhYvb2WeBVV8rKLI4jPc6T+N2vOor0c10YHQKM1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471139; c=relaxed/simple;
	bh=QlWJ0wEAp4fI6cpcGidky+cGPsFclbDXmeWkqsDfbEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cs70adejUDCUxeiiAAQj3dgjQ6eRJMUQTP9L62+cgjLRhQ3ZulXKzwZe1Xv4vggV6SVNLN6u1+9M7brQt0MFT1Wd31apud0Twbzi9KAc31nbYQhT9x8HlQE1s7QqRPkovkuKAeAShV9f+ryvaB5NIXXjagK6CmXPOrKuBKPblJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNlx/ftP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CnGXpACq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNlx/ftP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CnGXpACq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVLRD4148969
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 14:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fK6JihZKD49xTFVPUCkQvpepBjv1yKtSS0twFJIajjU=; b=LNlx/ftP3EoSJL28
	RhS+ubL0KTu/qocRYlpiAZfm/rgXUgf8ji/QtOiRd+47R6uRDT4RQrL4FbpXNfmS
	RAbKYY53ajRv+YnUCkPxIXoqST4v21FJCpphojpNbBQhKKiSUvDcpiiL7RDgRkXM
	W+1eIaWYtsOkJggrlXTyXEWnSm+fy5XovXAFqI8ylcXyregjvjelhFKXTSOiMRUc
	njJrlNjVSjfOwOn+5u0SqOOYuVYhilSSgkoe/O71geTWvd6OCq5SBsT5MSR2dj2a
	IlszL9TNSV+d7jc/h8nJlW25i8BpkjNZhZszUIsnbvyJhwo9ysg6/7nBOXmoMD4I
	3mG1WA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6bda9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:52:02 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-88322409239so70065587b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471121; x=1792075921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK6JihZKD49xTFVPUCkQvpepBjv1yKtSS0twFJIajjU=;
        b=CnGXpACqS962oOhoXhvEAWLkDN2KG66wxSuGbf7PudQDUaR4ja1TEtHoc3ixsy8YoJ
         x4DyDTCkayHoN2AvWFH7iZCDtGOHlGNLVEcHxu/+vskx5QK25YMetglGv2/y7qzg/W+t
         ITCFubpAYs5AND5Dgku+VB9WyDWrF++5bxuauxKwdHMpL19onOfVPDtMv6H9ECYv8vTU
         cwLoaulV220fucuyMBhQlnqX9zbbHuJz8i3aQxoUxioX5eSimWkoanAwVgpWag5nIXgN
         YUsn3pjEauLh1VhYcrT3+q2lXw5r6I/34x0pMETdwfyMn39SJNaH88K9D5Uy6LcLkWcJ
         ZVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471121; x=1792075921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK6JihZKD49xTFVPUCkQvpepBjv1yKtSS0twFJIajjU=;
        b=F9esvwBVJqh1eI8ynoDJ/bB6rbc59DIi5d+amBKW90hR8Jaez5uXaO716aYoO6Ar8p
         +0xGXouhFQf99+DIUvLH30xLRsVez9or7tUa6ihO6Dqag/DT+SzXXJH0HUwFAeMUCYIH
         cMs9Ukc/VPwhalu589bV50AyoJLM5LIGKeFdG+xskSZOdb5VS+3oA4yW/tqwmFR+A11C
         XZP5U2J7ys5MUpGZJ8YQ3XumAADV2VYlI14zHr0pPJPJ7l2eZlQvUtmwyLSJNWurV4/c
         gzv2WaL73zlJD+zzG4arogYLzSioSywhAVXOme71M3SEUlVBv5i2enYiA+6sNW2ppkza
         SfLA==
X-Forwarded-Encrypted: i=1; AKwUvBwQT7aS+UyL5oyEmYBJy30rdNPce8GFK8mPvDMd8l325odieMOeMVpVtXatQKQHLjcKZUcXTQVzbJ7cRjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+QeJZr0RFibI7fz68zBMnqEjRDSHS3M5/bUyWgFLR0YXuRvQU
	W+TEj9qmHEJo5QPgoO2pvbBPsco7iQz6EFe4P0QKC80325FESDFs9+6oOxStqRfXdL7UY9OlFcW
	2RW5qOk2DASaT9nBNWevUY0Iwntd2NLDcnDSQySgxa+4fLuIfrbEIlP4a+Kfx8zEV/04=
X-Gm-Gg: AYBFou2LINLBTKm5DgIkoO8aAEFX3a0XBXj2gNb225rMfP5CQ4PtsaFpSKI4gy61+Rk
	JLEHwO9tnZPyPrP0zlTjZVTM6IVm+ICJOk1wuBpRXA7sVX8ZK9hyELY7jpkGKUZ3jWE66Poimkg
	8wGj1EoWO9wgQg6T39PclUggKmR85LbLqZzN22WokJPZqJrifyn+w8HmzOHq1GyrwdqCfj/ZoqG
	LmDYl/rT0SPCV8L4+SZbM2wnWZOe28a4j4lPZ2ucdAM6Ic3Y/PHanpN8RA0hpMlAJF68Aexx//M
	cOLJZm1kbOvQuDWEhZL1zDR8uC84kKwSYkIn9oHmKVdv5X5JVUUgffqjYUyAuzt4TMVABq3ryfX
	JLDCocHd5rxX9fvl9tMgN9R7Jf/YkY0J0GraxQbYUvt4=
X-Received: by 2002:a05:690c:f05:b0:809:fd83:a88b with SMTP id 00721157ae682-8b05ac458c7mr38515067b3.3.1791471120836;
        Thu, 08 Oct 2026 07:52:00 -0700 (PDT)
X-Received: by 2002:a05:690c:f05:b0:809:fd83:a88b with SMTP id 00721157ae682-8b05ac458c7mr38514747b3.3.1791471120266;
        Thu, 08 Oct 2026 07:52:00 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:59 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:41 -0700
Subject: [PATCH net-next 09/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 scheduler configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-9-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=10683;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=QlWJ0wEAp4fI6cpcGidky+cGPsFclbDXmeWkqsDfbEI=;
 b=Ffe2M2hHO9lGMlwfZDmON67KK7/pROoMORdjW32wC5Zke3a3b7wNSBsvo8EacPxeHbEoR7EkN
 UPdA1/2EQPRARuQnK29iwbSSxUpGV7w3MMhDk7SmDDIJvUbUNrWRy16
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: GQ_AM0jsH5Zru8duL8TM3CCXQYXn-jy-
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7ae12 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_z5rImZNeELtsDLppk4A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: GQ_AM0jsH5Zru8duL8TM3CCXQYXn-jy-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX2i+6eNwW5SQJ
 lRj9NnbXZYnJ91sr6LO9eO8ZJyxHatVjhq70fLEMcaUmifotAG9hrKLea/eJCYw7jgNHeO1d0wH
 JzKgtuTgF9FI5AoHfqhE6Ex01rI4Sh3V+hU/7q1HWhgZN2h8Kwm9wSxn6Xe2fHOPVgCjWoYI187
 h5/nsORPvDI72qC+YGu10iQQXiVXHSx48ssCw0xciPIUafZu4prObuS44w8nfB9T8aPUIhCX4LA
 Te/JsxmCko6K98VhIlwJ8jdRqKz3lqdIZIVT55pOhAhpA7L6gQ6g4Y53nVOesUQHGNestj+JF9z
 AgqMWe7ygP24XgzPYoc1C3Gwzq0/Y3SCMdnNysxP4wYq3s/cFV1hVSzJxYSy9WLpv+j2RMl0xN9
 jDZssNWOQWsY2xaU2WEJj7yru292+BcxrR4nsbuAHol6EE+hWuAS43uQy3zrLyWRTa32lCvjtGB
 /BiQCTIWFtkPytSOgrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfXyND7XHjoY7pM
 zKJSNk4NmiOZKVZCOETpEYUBKM4EuDyaqkPPF2EPN1X5dDpoqLVN+PfDTSVubLQs6kIsrCO2Xd4
 Ie5DEgjHpOXVMAcszl8i8wePaSP4OWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080059

The PPE scheduler arbitrates the access to the BM and QM among the PPE
ports. IPQ5424 has a different port topology than IPQ9574, so it requires
its own BM and QM scheduler configuration.

Add the BM and QM scheduler configuration tables for IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 231 +++++++++++++++++++++++--
 1 file changed, 221 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 87d55f7b7975..83e1f2d30258 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -520,6 +520,205 @@ static const struct ppe_scheduler_qm_config ipq9574_ppe_sch_qm_config[] = {
 	{0x98, 6, 5, true, 2},
 };
 
+static const struct ppe_scheduler_bm_config ipq5424_ppe_sch_bm_config[] = {
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 3},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 3},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  2, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 1},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  3, true, 2},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 3, false, 0},
+	{true, PPE_SCH_EGRESS,  1, true, 2},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  3, false, 0},
+	{true, PPE_SCH_INGRESS, 2, false, 0},
+	{true, PPE_SCH_EGRESS,  0, false, 0},
+	{true, PPE_SCH_INGRESS, 1, false, 0},
+	{true, PPE_SCH_EGRESS,  2, true, 3},
+	{true, PPE_SCH_INGRESS, 0, false, 0},
+	{true, PPE_SCH_EGRESS,  1, false, 0},
+};
+
+/* ensch_port_bmp is left as 0 for every entry here, unlike
+ * ipq9574_ppe_sch_qm_config[] above. This is expected for IPQ5424,
+ * not an omission.
+ */
+static const struct ppe_scheduler_qm_config ipq5424_ppe_sch_qm_config[] = {
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 3, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 3, 1, true, 0},
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 3, 1, true, 0},
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 3, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 3, 1, true, 0},
+	{0x0, 3, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 3, 2, true, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 3, false, 0},
+	{0x0, 0, 1, false, 0},
+	{0x0, 3, 2, true, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 0, false, 0},
+	{0x0, 1, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 3, 0, false, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 3, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 3, 2, true, 0},
+	{0x0, 3, 1, false, 0},
+	{0x0, 2, 3, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 1, 0, false, 0},
+	{0x0, 2, 1, false, 0},
+	{0x0, 0, 2, false, 0},
+	{0x0, 3, 0, false, 0},
+};
+
 static const struct ppe_scheduler_port_config ppe_port_sch_config[] = {
 	{
 		.port		= 0,
@@ -1817,14 +2016,29 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 	const struct ppe_scheduler_port_config *port_cfg;
 	const struct ppe_scheduler_qm_config *qm_cfg;
 	const struct ppe_scheduler_bm_config *bm_cfg;
-	int ret, i, count;
+	int ret, i, bm_count, qm_count, count;
 	u32 val, reg;
 
-	count = ARRAY_SIZE(ipq9574_ppe_sch_bm_config);
-	bm_cfg = ipq9574_ppe_sch_bm_config;
+	switch (ppe_dev->type) {
+	case IPQ9574_PPE:
+		bm_cfg = ipq9574_ppe_sch_bm_config;
+		bm_count = ARRAY_SIZE(ipq9574_ppe_sch_bm_config);
+		qm_cfg = ipq9574_ppe_sch_qm_config;
+		qm_count = ARRAY_SIZE(ipq9574_ppe_sch_qm_config);
+		break;
+	case IPQ5424_PPE:
+		bm_cfg = ipq5424_ppe_sch_bm_config;
+		bm_count = ARRAY_SIZE(ipq5424_ppe_sch_bm_config);
+		qm_cfg = ipq5424_ppe_sch_qm_config;
+		qm_count = ARRAY_SIZE(ipq5424_ppe_sch_qm_config);
+		break;
+	default:
+		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
+		return -EINVAL;
+	}
 
 	/* Configure the depth of BM scheduler entries. */
-	val = FIELD_PREP(PPE_BM_SCH_CTRL_SCH_DEPTH, count);
+	val = FIELD_PREP(PPE_BM_SCH_CTRL_SCH_DEPTH, bm_count);
 	val |= FIELD_PREP(PPE_BM_SCH_CTRL_SCH_OFFSET, 0);
 	val |= FIELD_PREP(PPE_BM_SCH_CTRL_SCH_EN, 1);
 
@@ -1836,7 +2050,7 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 	 * egress port, the second port takes effect when the specified port
 	 * is in the inactive state.
 	 */
-	for (i = 0; i < count; i++) {
+	for (i = 0; i < bm_count; i++) {
 		val = FIELD_PREP(PPE_BM_SCH_CFG_TBL_VALID, bm_cfg[i].valid);
 		val |= FIELD_PREP(PPE_BM_SCH_CFG_TBL_DIR, bm_cfg[i].dir);
 		val |= FIELD_PREP(PPE_BM_SCH_CFG_TBL_PORT_NUM, bm_cfg[i].port);
@@ -1851,11 +2065,8 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 			goto sch_config_fail;
 	}
 
-	count = ARRAY_SIZE(ipq9574_ppe_sch_qm_config);
-	qm_cfg = ipq9574_ppe_sch_qm_config;
-
 	/* Configure the depth of QM scheduler entries. */
-	val = FIELD_PREP(PPE_PSCH_SCH_DEPTH_CFG_SCH_DEPTH, count);
+	val = FIELD_PREP(PPE_PSCH_SCH_DEPTH_CFG_SCH_DEPTH, qm_count);
 	ret = regmap_write(ppe_dev->regmap, PPE_PSCH_SCH_DEPTH_CFG_ADDR, val);
 	if (ret)
 		goto sch_config_fail;
@@ -1864,7 +2075,7 @@ static int ppe_config_scheduler(struct ppe_device *ppe_dev)
 	 * port, the second port takes effect when the specified dequeue
 	 * port is in the inactive port.
 	 */
-	for (i = 0; i < count; i++) {
+	for (i = 0; i < qm_count; i++) {
 		val = FIELD_PREP(PPE_PSCH_SCH_CFG_TBL_ENS_PORT_BITMAP,
 				 qm_cfg[i].ensch_port_bmp);
 		val |= FIELD_PREP(PPE_PSCH_SCH_CFG_TBL_ENS_PORT,

-- 
2.43.0

