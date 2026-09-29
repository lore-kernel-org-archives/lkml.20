Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D4C4C33E7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651888; cv=none; b=kiuCV507OZcyC4lroz+irm6kgotUKyfSwoobD6/ZKIznzYvWu82cwU+dBSAqSh0MlTUub4ZB+EubGIpw03JnleZyOrI0bloRH/Nlm8y7ESEuRvB+cRwBSHm7Qbr/1meY33tE3z6AoRIeVKArbj0wrn6ejZl75d6FoY8hjJrJ+3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651888; c=relaxed/simple;
	bh=ylXzUuTIz4l9YRe/EquAV7rS8KwuDXeJiQfbzvSBq/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dy0B2XPl5BbJqbflkxtm/PzsHOUgGioAuKOQi+glGsyAr2zoKmM3soIejca7bZ8ap8xagNqTXpk1ZuDzzb2cQQV8Mc8bh/ls/I1CVktj626D/CUoAx2/sRnrxh5qn4h6PqO21xSYH/k8xwOBKOsagAPT3mveqYZ+nMQ9Mg/qpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn/nVrmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCmzLpl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn/nVrmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCmzLpl4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0iw9m2341387
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=; b=Sn/nVrmSAs/z35+b
	i52DBtVuzdBRekqSzu2e++XRcRt4n246q4TZ5tP2rSTkJL2T15PNxb4LNpzwgePl
	sZaS2i69xNG/uYeBAmsIVofoGMK51wRi4kHGxs/ZSjBXyM8ErgEeDduwHICQ9ofW
	PUDPU8miEzus2tOLgNsWvdGCigN6h1t+BlCnt2EKY9dns2+PX8dO/ARsuidEkAn5
	icIM0pdkearuVJ67tYifd/NlvBAxgdolZNaTuGAm7c/PxDcLzbjlg+w18Yz60yyX
	w3QIcVdRyoGq8H5EKJMv3inlpTVeJ8sooMjM2Wdz6fk9DOLdvaoaIT5BfvbGifSg
	AxS//A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw21w40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34afa104860so585231eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651876; x=1791256676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=;
        b=RCmzLpl4Em+Wa5wntMINPjNjYwvOf0fyEjroMavv46TfHCfT228tiljdpKTjUK7Bgx
         GOsZILhtEuZetF3d07F+TX3reyen1DQ8m+MP4GQqd6JeDmkJvLrWy3YSAq7Zv8Rq2KKq
         hb7V6O//ei8MApvFx6LGlzir0O8d/Y8oB3L8kOb6I2h/PfKtEV76b7xrAHwmfunK5ASk
         sgHp1kd3jbcqC2CnL9FrQ9c0PRlGqVxFeGcJYV/FrD+liOenFHkpV43x5vBLIzK04xKG
         +GSpPr33eiX+Fpe7uRsxdilyeZ7sfErIPeY7TWpnKeAyPQ36WMTl0VKe9P2hEu2UEjKs
         oPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651876; x=1791256676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=;
        b=uYLpj1uMJAwsQgFNWCo35KXq4BIfdT1WOqEmmz/unBI4ANsoCdkDs8re94HqJRQCZB
         1ttPzaJBN0bfYmckghAJ3KN9+LwdOsPtsix+WhEqv7cPptKcpVf3P045s6AASvURVIgH
         NdGMbT/eXjevxVNOg+BVl+6XsyS1c0wh9NSaPkxhtJz7g5G5ydiEVQDIZiI9F7z3v6qU
         aUCjiAu1PTP1hlzWsrpGgVWOJ8AUfsmrGTRB5sl1525Wn1XiJBDHrtwS1H0f9+NnxKIw
         WR7jTaTGeJmQd/NhSj85zLqb2y471S5w199Ce52MvRBlGeBCuwAGsDdyIVISZBmEQAzp
         9Qgg==
X-Forwarded-Encrypted: i=1; AKwUvBwNjEBBuwbxbEG/MiwL9lhIbvEaHJLVCYJAsSZDScka74YsQ+4RZLUusDbRSW9COA+Xy50CCDFtUn0Pj5w=@vger.kernel.org
X-Gm-Message-State: AFuF++lCGewvweb3Vn9hn2KV67Zb8b15r9DPhVddWRf9VWpX756lYyVo
	yDdZigrkppl7St4r2vkzzM0iKHq41oyHdKKk9MTlUJb92HU09lXKohG2alGqXshsH9aAEO/gUbc
	fQw3arLqZLv8ZeBasWCjZOkUIcECarubSTh1kNE/PlPvJPmOoUKBfaiwlSqaqmnGTFg==
X-Gm-Gg: AYBFou0Mtpthd/81eKiPwmBFG3zCHVZDgyk7L/iaGhshkKbaLLjXaBq5anMA7LNJUG0
	FWx4lAXN841BC1gdADBnL/SJs/Qv+Imshyq6VPY5BXZ35mVZfXeFpgsoqw6F7fDiPprb3G9Hdpr
	tevuUTP1CW/YnEUNdtbLqlSjIyf/okkPtDqZjPKfdTr6nlvYK4w9LO34xSr7nRjR2T+vsvpSKtJ
	+9SGIlKos8ZBI7kGfZsqhFrQV3Vt4K+ySDfj/pqtoqFQ9xUMC8JmENpRzXroVGOIY7XQsd362ci
	zdIkcO1DUhooo5igF8sZ4pWtQLZm8GIcPejIujJ7B1txLCN4LqI/siQ2lIohsrolkg8RDrO7JaS
	mXXBacld/kZPTu2FJaA9QpkekIvxMr22JzIvIl6vlND2fJlrreR8ORtQt8PY=
X-Received: by 2002:a05:7022:28d:10b0:149:8354:ba29 with SMTP id a92af1059eb24-1498354f52bmr5383824c88.8.1790651875693;
        Mon, 28 Sep 2026 20:17:55 -0700 (PDT)
X-Received: by 2002:a05:7022:28d:10b0:149:8354:ba29 with SMTP id a92af1059eb24-1498354f52bmr5383798c88.8.1790651875144;
        Mon, 28 Sep 2026 20:17:55 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:59 -0700
Subject: [PATCH RFC 08/10] firmware: riscv: rpmi-tee: cache TEE
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-8-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb2de4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 7S5BezZPkWtZvD6XGzMjZNkT-JuGliJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX9rLbGG9RcR3h
 UzVQGhQUxwSX6fbLck4NwUQ1tS7Pu8hjKgTM5j86unEC6yonGP9t79A4XJrGU7kfcOG5bG8YAbj
 WjEn6gFIn+/Z1ErUGTBR0NuIj2LDWEg9CmBXgIoi6JDwLDvyFddQrkrVwAzMahQTa0c6tmNnZA6
 1wiEdQOikvIoKsBayV2bOrjzn3Zygyu1xfeMsWZYv451rHqcf1qacrBiW2Jg9HHd1S7iy8U2fjB
 9Ye6/mstH8y9r9hODx66O92lMC5BdbM37iHWnnXoh+c1eXwPtOOfXUloLbzcf/twg5Kb49XCLWD
 jyVAdZCPvb/Rtx69fRw20ro/WLO7lh0JSuZXp9MnKnw9Hn9lV8qSVj+dDKTDo6Cqtuvw7uWh06R
 d5tnsjkq4ySg9Ss+o9gFeooSCYOoJKeLbdelujK0J+UmRbYxGC5UWMsArrRS4FzSkdJx9Vk9FRQ
 JXDo4+kMRaFg5lcPnNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX7ZKqTZGK5zgv
 xSt1KQ1Qw5br0wMdc55pTFqOsZWhY+/nV0ZeHP4t8kleB+HgFJfj/FWOcxLqd/bfxV+njnPFFEK
 aGd+yktQXPlMQsSOIK6kFobDrjWcp18=
X-Proofpoint-GUID: 7S5BezZPkWtZvD6XGzMjZNkT-JuGliJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Query TEE features during discovery and cache memory, multisegment,
and signal-bus capabilities in the transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index db3dbab53078..7b06c1f96ba8 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -25,8 +25,16 @@
 #define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
 #define RPMI_TEE_SRV_CALL		0x13
 
+#define RPMI_TEE_FEATURE_MEMORY_LEND		2
+#define RPMI_TEE_FEATURE_MEMORY_SHARE		3
+#define RPMI_TEE_FEATURE_SIGNAL_BUS		4
+#define RPMI_TEE_FEATURE_MULTISEGMENT_OPS	5
 #define RPMI_TEE_FEATURE_SYSINFO_FORMAT	6
 
+#define RPMI_TEE_MEMORY_FEATURE_UNSUPPORTED		0
+#define RPMI_TEE_MEMORY_FEATURE_TEE_ONLY		1
+#define RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED	2
+
 #define RPMI_TEE_SYSTEM_WHOLE		0
 #define RPMI_TEE_SYSTEM_SELF		3
 
@@ -581,6 +589,7 @@ static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
+	u32 value;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -604,6 +613,37 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SYSINFO_FORMAT,
+				      &value);
+	if (ret)
+		goto out_failed;
+	if (!(value & RPMI_TEE_SYSINFO_FORMAT_TABLE)) {
+		ret = -EOPNOTSUPP;
+		goto out_failed;
+	}
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_LEND,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.lend_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_SHARE,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.share_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MULTISEGMENT_OPS,
+				      &priv->mem.multisegment_max);
+	if (ret)
+		goto out_failed;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SIGNAL_BUS,
+				      &priv->notif.feature);
+	if (ret)
+		goto out_failed;
+
 	ret = rpmi_tee_setup_endpoints(priv);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,

-- 
2.34.1

