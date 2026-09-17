Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D58043DEA2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685795; cv=none; b=RfssG4oGYgbK10/x+DCAwuGFhe5dH9ciWPQJcaTqsZaMhmtLObG3ukd9K8UqfiOlZ06w4MdM2cnZyt6l2QcZZxlvQvQHW60KbsDhH29ggrJd/iFQ9344iGfub08M7qdbliyB7YRTmD/E7++RWiQBR5uEwwheGqcI5xSw7spb2lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685795; c=relaxed/simple;
	bh=P8dryjMpnqvpodgWk2ySD7v0wpX4IgHdJJ8YJF0hzFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZgX7eAXvLgWPeC/isctr21ByJ7SYzbq7lJJIFmeqdqI8TI51VFqNwbK4gTcg5OGk1Lo/WaNAYOngwN0IQcbaHp5BKNXbzMxpvCs0hWhH4bmfuJo/wFDxiCRK5PCezFL387W8uslBDZHUgxBe0VK/nG3M9u9fF0cLDJrvZmLZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Svk1/ZM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bugjM6hW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Svk1/ZM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bugjM6hW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLGI793432067
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=; b=Svk1/ZM7ul6UUri1
	ilADI/q42HWeWOXDTlhXtMd+epfVhQKv1y5K06BgXfL0VDFWvcs6dohdInxV3hlX
	p93MhU6T5EOjVT2Ipkp7pkFSz263eCTuX5MJv87sQ1yG3odWx6cxQQR0bkvp2ix5
	M2FZxSOBarq6yRe9jzg6hYzWW0YUNKFBCwwBx5cMLS6TJ/TLjdOU5Nf5rQ+yQBxU
	dQXkWvAwximUBqf4PW92VSogCXVnsfKFUIU5/fzVMvH1ilaXr7g24EhkSmjYvy1O
	0L4mAx7RoueN9q8JrJIFJ45NP0uY5M/N+k5ASAm3QaYZuKftPHIfwHgEZk9D/6t8
	efVSBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6j9b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:56:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so2443085ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685791; x=1790290591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=;
        b=bugjM6hWXZ+Adz4BAU+uQSRFluJsG4+6G2mjkmUjVM6FViMLlv7OGgYW042C2IFC/f
         3wFiqdMNreYU6TAJcNsWoDzMtmKlkol+xPN+Eu93SB2xWJFWyT5SXzmSilqPc1nPijAU
         UDZaO4GjstZFr2MnSFMZbYsvw3+V+1CSs5b0oH/kVRT06E+fkmngRhioGFMdrU1mL3W3
         /omgkZ0KHrmljoS5yRKo6ubmvK2vyxyaRyzSljg6/Yz3jvWwcEBw5o3BN1wZ9tLLU8pG
         nPCe6lFE9fVi5r1I8ZuUV5weqxVLV2TYFRZ7F7cIOHJ2s+9Cpr/Ca5B2NAwgAk2orRcA
         /pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685791; x=1790290591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=;
        b=Pe41oym7T+azviCUa1vMyCgHNduhCHPs3sc2QEUEZ6B/1yFoaMIrJtmzYgJZjL+S4B
         MIVvHaG+LD4oOcbPsb/5w93pZ7JIksX3JDPqA674oNIcwPwMxFpG/gzW1q63WyrSKwzw
         a27LdDqJU/USNk7xz7Auw6ofIXE9GJjvu1yIyK7CCguid4kZcLCvqD21h/EHZiKvE54z
         mFAF4cSV68RMmIXY5+9aG0xYMf4GhJTonaZbmrTAtr3CQIvNmQ4OgjJ0UvH39dSOyTxi
         EF9rwAoBLVBJBQUQRyyMiXiQrHR9O4T1m1Ud31hDoADz4ORf5ZJnJbPcgQ9J1agZsqYT
         NRtA==
X-Forwarded-Encrypted: i=1; AKwUvByViLVYuMZBZ3fKkK12+meNk1WqEbmF31JcB7PRqsJuBJ0In6VQI4o+EIKJHWPpchGOVf6ca9ZAfl6Y4lQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kAZXrR4oMMn/0ZRgjXx2UFKVu+Y+olcjLqMwC8F2erdR57dXBJ
	35eev3efrSJt1o1rmx9Zb9X0O9TYpbmqFLrNVFgNVJQWIJxzTa8/YShv7fVUooFCdgqtrRm7BuL
	4umcdB++tSwfpxDwS7ZROCwHLeIJda1uknQ0a8Wes6iFAbeocaJq9U8SuONyqyhqDpZY=
X-Gm-Gg: AYBFou3wOW+L8qBhiH7Fa8xmwfKQEEtmBov2brWnwPSF+xN3/D0SH6qMOe2PrdKmaH/
	5vYEq+Q6IaED+tnjIQ5FyUaZIJ68w3OTegq7y+13q8SaQtwZemlMGbbI37hleFwfEezsCPGRFyA
	UReQ/+y7rEPAESQ169OTBdpEu3je+gk5UDrKr0OBouuev8YBMP8+I/zH7oGOiXdFMwkx8ZbAjI7
	AfirGce+8TtEoyS7mliB00STQcA+1oW6A7Wg2wGCYGiRRPhRr08Nad6NJQ5cxocV7ivDp2cox3n
	9OVR4lQmnxdw40Cueb6SrzWWk83rWq1Ln/NZkv9zp+AhgrUT0pMg2wwJmJaFR8AKIvssquPShjH
	+VTK5Mi6Ki2okAKJ1cNVTtL3ONlebsvTKrdJY+GbwGGI0QWgz/w==
X-Received: by 2002:a17:903:2443:b0:2d9:484:861d with SMTP id d9443c01a7336-2ddb1af6da8mr12657625ad.10.1789685791119;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2d9:484:861d with SMTP id d9443c01a7336-2ddb1af6da8mr12657315ad.10.1789685790662;
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:56 -0700
Subject: [PATCH v2 2/3] pinctrl: scmi: Replace pinctrl ops get group info
 with generics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-2-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=3568;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=P8dryjMpnqvpodgWk2ySD7v0wpX4IgHdJJ8YJF0hzFM=;
 b=pMk4JLcfOy5cUTaVghI5ArSIfRa+ErdzPL7JMcBU8CJH4cwE8P9sIpq/IsgA7Z4eRZl8fYtRn
 VM02NxlcSLEAvVhb+ASBBsDGBwxKOIcjs/YVUJ0uyPgFjQkuuKHcfXc
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX+cuQLIIAx+DL
 QjYTqAyii4R7BerknW+MRIyl7fGuYAysLK3yNyQ3ywHvvcyXdCMMnSQ+E0DxhTaxdKWfhKKa3YK
 6bNchY6FifEQNDtDzYkB0eFhFkRLYeGeniozo85z3kv7Ht9CQi/j+y0NTAOHBa3eB7ZBtZm8yH5
 L36psh3vBlmfMKY6U/ds/sf1/zvL4IBhBsKasAupIZMFmbDeD0DW3uz+9Ts/X6DYh084/La8YXP
 MDaSxQeDLHXqKS+xeZe5752y2PG7BAFAZ4o5IMdmrxfaqh2aWz68OCtawBvaEPpvg/s39SBBXTT
 zORMj06XEx65b8qrpv3aqIjrQfUU1myoEvBjLn7+oL3FAVNI4AUmz56aU90vJrpQ1Fb/QV71bza
 11OLgijKodPkRu4NlysT3zqIvkUOMWmvs4btlJov2gTZpLqfHXf8lEsVIAgQtcjXFjhumoBZwJg
 UqzMFG2c5liEiLwP5AA==
X-Proofpoint-GUID: YLsqYhTA14nVwqu7FPfUtKcb80gy-Rzt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX42rFUSgGWfqx
 ZrvEX4Oqc9bedeZEK/uVB5huZ62hnxKoLDUjrzY9xOIJbmfrialySRnRztzPKPtfg9YAfEXhhg3
 bIf5fsMjdRLOj0qB7SgOrDugqNQ2E68=
X-Proofpoint-ORIG-GUID: YLsqYhTA14nVwqu7FPfUtKcb80gy-Rzt
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac7020 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=p54jq0OH07X71X_IsjoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170330

During probe, populate the pinctrl device with group info
so that the generic callbacks can be used to fetch group
count, name, and pins.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 81 +++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1d85a16f300d..c93d61dfa282 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,43 +40,10 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 };
 
-static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
-}
-
-static const char *pinctrl_scmi_get_group_name(struct pinctrl_dev *pctldev,
-					       unsigned int selector)
-{
-	int ret;
-	const char *name;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	ret = pinctrl_ops->name_get(pmx->ph, selector, GROUP_TYPE, &name);
-	if (ret) {
-		dev_err(pmx->dev, "get name failed with err %d", ret);
-		return NULL;
-	}
-
-	return name;
-}
-
-static int pinctrl_scmi_get_group_pins(struct pinctrl_dev *pctldev,
-				       unsigned int selector,
-				       const unsigned int **pins,
-				       unsigned int *num_pins)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->group_pins_get(pmx->ph, selector, pins, num_pins);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
-	.get_groups_count = pinctrl_scmi_get_groups_count,
-	.get_group_name = pinctrl_scmi_get_group_name,
-	.get_group_pins = pinctrl_scmi_get_group_pins,
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
 #ifdef CONFIG_OF
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinconf_generic_dt_free_map,
@@ -460,6 +427,44 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 	return 0;
 }
 
+static int pinctrl_scmi_get_groups(struct scmi_pinctrl *pmx)
+{
+	unsigned int nr_groups, nr_pins, i;
+	const unsigned int *pins;
+	const char *gname;
+	int ret;
+
+	nr_groups = pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
+
+	for (i = 0; i < nr_groups; i++) {
+		ret = pinctrl_ops->name_get(pmx->ph, i, GROUP_TYPE, &gname);
+		if (ret)
+			return ret;
+
+		ret = pinctrl_ops->group_pins_get(pmx->ph, i, &pins,
+						  &nr_pins);
+		if (ret)
+			return ret;
+
+		if (!nr_pins)
+			dev_warn(pmx->dev,
+				 "Group %s contains no pins\n", gname);
+
+		ret = pinctrl_generic_add_group(pmx->pctldev, gname, pins,
+						nr_pins, NULL);
+		if (ret < 0)
+			return ret;
+		if (ret != i) {
+			dev_err(pmx->dev,
+				"Duplicate group name: %s index: %u selector: %d\n",
+				gname, i, ret);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 				 struct pinctrl_desc *desc)
 {
@@ -544,6 +549,10 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
+	ret = pinctrl_scmi_get_groups(pmx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register groups\n");
+
 	ret = pinctrl_scmi_get_functions(pmx);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register functions\n");

-- 
2.43.0

