Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB04DE712
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471132; cv=none; b=SlQDcWLorSBTqo81C732FtvH5C8OYLdWSyFy5je6+ZmrvlWq/OCJL9XgePHus8vrpo8HC1a2CCCA6qeAEJy8uiRPrzskTj/T2pajiMD1XB82IhFsu5/rFRcHLOLDw1j6PsSWSMrMWxITQEGe2vyMzQJ+b2PmZTqiI9UpgZOIT1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471132; c=relaxed/simple;
	bh=Fx632lLcaDSUoCnHWNi6ZPrUt57HZStccHpz0lMmJPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpRYseUWvv53utItNzsQg8/cnLihcpDIt/NOhIopXOKSqp+qAVpJhLerNZQrAX8LUWWYWrq0QVNPRXEPmr3Xiaw5wBrTvFY0pxkv9eiEamwsILhLTKnLk0d8jyrFT4EA6cBwuQUXmnDU6yMgAUnhTNr8JMEaf2qSO+J/83cizTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3RHLPcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdYPIX9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3RHLPcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdYPIX9G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVS7O2801211
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 14:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgrE8ae48IWvCHBpXeohUmCoxvktBF7UD9vd3orSDj8=; b=f3RHLPclcdbrV8U4
	8S6cRSNHhInffWVVTY3/Ccjn5B3bxS/boKXlJlse0YH0t1IX4akrgPV3uQiy1FUk
	g5vCWs0de5oyMN1H6VwFnmiy/HBJE/VGWxFAsIH5v0pevgesClqPcLZDkIz4U8Rr
	a6c7+V0tIHZZaF+vI447r3NifPApyxJnnI8+E6tPvEV7cyBeyG/x8MORTZSJxQuH
	BQ7ALBZ82EADUH4bi7ABAiqzZ5wKRZJy/Euhxi9bqKcrmqcd2wKpQNzhLnegt8Sm
	wbs4kBjsItFxm8Luh0RiqhlhhLDYzZabgPm7BMTfpbGOmzsTV9NHXfN1I+0PlGxn
	BN3FGQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3kfay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:51:58 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8ae99a44bdbso61647167b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471118; x=1792075918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgrE8ae48IWvCHBpXeohUmCoxvktBF7UD9vd3orSDj8=;
        b=PdYPIX9GUhlLBccNUc/lhI5P+FAbN3mLr02pCzlUrv/hxteYpTpHA9JJJ9ni9KThKA
         492ZE4LtAs64ca4vGUKVGqgkJjHGCSF/WoHrztBGuxDsSCIWLuGF6jsOiJDEzwkXWvwg
         UdNh7ANewBBb6LUzs53yibHvOdK7X6quiIeyEodAgjEt5Ed/znTR4+eBTsGQMMin2piF
         PjexB3PKC6UqZnf5akwcL3RElDwto2o8FaX9uqAKmyew3EJPipo15TZ6IxEAg7zDz8KY
         iXUsy49bbIDDxoxpY5KAM4i6lT5nc8XOhe708pO8wNvSuu2Uh86cYpVhqnPDJHw3EsB7
         uoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471118; x=1792075918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgrE8ae48IWvCHBpXeohUmCoxvktBF7UD9vd3orSDj8=;
        b=p8u7lMPUJg26tahURPNzUYZ46QZfJwOi8TaXqfBU1txOBeLqv2TJvq36P27qLeJEQ7
         XwQvC2wQTU0VYrpU29/TBe50dz3nji4gOWb11zJvqSp7xstZigP39+RNsrSX8lhmoGTj
         /vqPlWWKsMbaCk18GlkST4mane/d3ettihvoLn+R0d5dcbjZ2fAcgnFhj39tqjRNxfUG
         h9MXnh+n6yVdyUBzqn6iBXk7C8OqeEy88x5C0JouorOuwAik0uAZFUfFnO6VnVaFR/pT
         tMvnXwvZhgu1qNr6TZ3Y0tRBSfzBMAp9meoSDBARRWiFvzqm6Mnmc6LrPzucnq5lf+dI
         wK8A==
X-Forwarded-Encrypted: i=1; AKwUvBwASnGIsWQHxq1+g9jQeIY6kzldCMsNnuxzjYouuHHNcgjHnYWHfVAolcHh58Wttu1BqQXHQ0Wif9tQyFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1vDry9yxNEg6honLz/28VPg2RW4IQixfM7GChqaVqD2RkzwvS
	Yg/sfwt4cHju+9W4902LYRjDZtV7Je2CXxAI+r8Mpf5WCnwQhtzIHzN7uMI4H2nYnq1qAWZOhRK
	7yMCdLmVFOcfrai2mgfPJaNd8RVcB3nhp1Qh/Vbcl9CVKKCh30JgRa/8P/OZEJcxrKWY=
X-Gm-Gg: AYBFou3Eo8HoP0wqGU4JHjhBFtldxZdW9YSCB7FcMwrfSfch2ShJ//+YkZ+AH1/MoU1
	vVqoB2HHNng06X86Kk0L/LuCeEFYWPi+Lyifu/NuxV+Ct876iu2KmLVI5wXXLxug7FfHbv7O+xB
	xEch09qHQfwPaeS5r5Nli3/NSCz09D7kGdf3SD80aKV/na1MccHsqL3cwsFBA1PNjb+7xycoao5
	GsS64vN7kw6VUQ0SJk/ivaQDSgCXde9DB27IOuFGvntp3pZaF7W+XmjFqOdYuV/0pd3D02MKi9N
	5h9zSrG/eAEuCucEfv/Edqeh2K5Bzk+6GG6BQQVT02gV4tDgcD0rd4tx0cgaVZ5hEVkUuoTsxjz
	6CYte6fqpvrow3JlhK0BRhwBoznTChE1ielE9sUV7WoQ=
X-Received: by 2002:a05:690c:6c87:b0:8ae:6740:999 with SMTP id 00721157ae682-8b05aff61aamr28837627b3.20.1791471117848;
        Thu, 08 Oct 2026 07:51:57 -0700 (PDT)
X-Received: by 2002:a05:690c:6c87:b0:8ae:6740:999 with SMTP id 00721157ae682-8b05aff61aamr28837537b3.20.1791471117454;
        Thu, 08 Oct 2026 07:51:57 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:56 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:40 -0700
Subject: [PATCH net-next 08/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 scheduler resource configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-8-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=3976;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Fx632lLcaDSUoCnHWNi6ZPrUt57HZStccHpz0lMmJPQ=;
 b=KV43cgjGcnbhtWxdxjLDxOVzEY5Y3sIlAkOogWMv6hUdPUR2jylpyjMGXLFvOh7aHq/oV+q17
 5sa98+OA40rBqU/HVaDpur720zXv9CXy5z7PpjHw25qs5GsSUG9e92v
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX4U6z7qpL5xk6
 w9sYrLoyXlSpZcVHiVPVw9CaDzdANB9rL1ST+t3cUb3RZbGGc+Lsob3yliY+XsEiSd8wih/6Ktu
 1CMk34p70X400Ge4+xIVCM/aQQsEqFc=
X-Proofpoint-ORIG-GUID: E_qSwd3n8jpQLvn4fGHaQHxFtll1jOhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX/VrmCddS2Hql
 qK7oKfc3qOZVqrQxt9i8Pc80tC6p+2qzFpXhD5JaBibMr7bH2Iq12ki4bHV3fNlM1fbyCf39UMG
 Rrvg4Feg5M9jiGGuUUZvyDess4Djy66EBMswvMQvdRT1iqldf+6spLbJk1ove991s/fHEzR2wdz
 9zTD3QzhwgNts9I+XOPHlmE7qzf1+A6QZMV04ItzD1Z4lhbLyYZtsX3tw/CjkySkHuk1jXXDnm8
 FzWdjEnf4T05tiN8g5xKKxXmij+ZGVv8uT0cx3kVfsqhFYohM1eQ7ueIhYxiAgFCzINZ+AcgUVn
 OiLbKzH1nja1We/Sju1nflLnoe+iLEShj1PVitjYnInndzuZagL8Z0q9HbLMm4KFfd2mim/rNLu
 3XE1RVZ0VYd8IpqhsmPuh/6AHdzTR0ktrZkNoio2ZioLgSRBSIDuFTwQ0BxfaDbfyqlzAAhYtOi
 zH1ihADYGAiK2HUhg5w==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7ae0e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JGQ9ZE40oQCnb2Pkc9sA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: E_qSwd3n8jpQLvn4fGHaQHxFtll1jOhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

The PPE scheduler resources, such as queues and scheduler nodes, are
assigned per PPE port, followed by one reserved resource entry. IPQ5424 has
fewer PPE ports than IPQ9574, so its reserved resource is located at a
different position. Add the dedicated scheduler resource configuration for
IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 84 ++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index dec8eed77253..87d55f7b7975 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -814,7 +814,7 @@ static const struct ppe_scheduler_port_config ppe_port_sch_config[] = {
 /* The scheduler resource is applied to each PPE port, The resource
  * includes the unicast & multicast queues, flow nodes and DRR nodes.
  */
-static const struct ppe_port_schedule_resource ppe_scheduler_res[] = {
+static const struct ppe_port_schedule_resource ipq9574_ppe_scheduler_res[] = {
 	{	.ucastq_start	= 0,
 		.ucastq_end	= 63,
 		.mcastq_start	= 256,
@@ -916,6 +916,64 @@ static const struct ppe_port_schedule_resource ppe_scheduler_res[] = {
 	},
 };
 
+static const struct ppe_port_schedule_resource ipq5424_ppe_scheduler_res[] = {
+	{	.ucastq_start	= 0,
+		.ucastq_end	= 63,
+		.mcastq_start	= 256,
+		.mcastq_end	= 271,
+		.flow_id_start	= 0,
+		.flow_id_end	= 0,
+		.l0node_start	= 0,
+		.l0node_end	= 7,
+		.l1node_start	= 0,
+		.l1node_end	= 0,
+	},
+	{	.ucastq_start	= 144,
+		.ucastq_end	= 159,
+		.mcastq_start	= 272,
+		.mcastq_end	= 275,
+		.flow_id_start	= 36,
+		.flow_id_end	= 39,
+		.l0node_start	= 48,
+		.l0node_end	= 63,
+		.l1node_start	= 8,
+		.l1node_end	= 11,
+	},
+	{	.ucastq_start	= 160,
+		.ucastq_end	= 175,
+		.mcastq_start	= 276,
+		.mcastq_end	= 279,
+		.flow_id_start	= 40,
+		.flow_id_end	= 43,
+		.l0node_start	= 64,
+		.l0node_end	= 79,
+		.l1node_start	= 12,
+		.l1node_end	= 15,
+	},
+	{	.ucastq_start	= 176,
+		.ucastq_end	= 191,
+		.mcastq_start	= 280,
+		.mcastq_end	= 283,
+		.flow_id_start	= 44,
+		.flow_id_end	= 47,
+		.l0node_start	= 80,
+		.l0node_end	= 95,
+		.l1node_start	= 16,
+		.l1node_end	= 19,
+	},
+	{	.ucastq_start	= 64,
+		.ucastq_end	= 143,
+		.mcastq_start	= 0,
+		.mcastq_end	= 0,
+		.flow_id_start	= 1,
+		.flow_id_end	= 35,
+		.l0node_start	= 8,
+		.l0node_end	= 47,
+		.l1node_start	= 1,
+		.l1node_end	= 7,
+	},
+};
+
 /* Set the PPE queue level scheduler configuration. */
 static int ppe_scheduler_l0_queue_map_set(struct ppe_device *ppe_dev,
 					  int node_id, int port,
@@ -1153,15 +1211,31 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 			  enum ppe_resource_type type,
 			  int *res_start, int *res_end)
 {
+	const struct ppe_port_schedule_resource *scheduler_res;
 	struct ppe_port_schedule_resource res;
+	unsigned int scheduler_res_len;
+
+	switch (ppe_dev->type) {
+	case IPQ9574_PPE:
+		scheduler_res = ipq9574_ppe_scheduler_res;
+		scheduler_res_len = ARRAY_SIZE(ipq9574_ppe_scheduler_res);
+		break;
+	case IPQ5424_PPE:
+		scheduler_res = ipq5424_ppe_scheduler_res;
+		scheduler_res_len = ARRAY_SIZE(ipq5424_ppe_scheduler_res);
+		break;
+	default:
+		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
+		return -EINVAL;
+	}
 
-	/* The reserved resource with the maximum port ID of PPE is
-	 * also allowed to be acquired.
+	/* The reserved resource, stored at the last entry of the
+	 * scheduler resource table, is also allowed to be acquired.
 	 */
-	if (port > ppe_dev->num_ports)
+	if (port >= scheduler_res_len)
 		return -EINVAL;
 
-	res = ppe_scheduler_res[port];
+	res = scheduler_res[port];
 	switch (type) {
 	case PPE_RES_UCAST:
 		*res_start = res.ucastq_start;

-- 
2.43.0

