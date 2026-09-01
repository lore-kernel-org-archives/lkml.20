Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47EA46E00B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249361; cv=none; b=nguqeUS/Tw8NGZu6NLUTMF9P6Ww6y4qZZ0uoVz4dLR2VrrsOu+s4rESgGFvEpEIbS6GV3nWlkU6H943/vWdfb+Iyk0kN9Nqn+b+veXt2B1ptnhia1IYixy/mONJRmgbVO0zwgbkd12qoxAc0RTQdbFmERzM/dh08v/SVQHimsYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249361; c=relaxed/simple;
	bh=6GKN2yLKizVj79f/0u/7sSHvo/RwDr913ezSDMHaBh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpZQgr+HbkI9JotJJpyJ3o7cqhIwZue8bKesomWfGatzmx6Js8SKMyTo/dpPFCxakvtt8T4RTerR8L2ecXEAKVWcCyEKP6oEz8J9XK+Rkz1JhYSgL/u4D3jNfXW1xvd3dxtSF2ZpAShsgprjy8DPUp+tmw/Cu1uQWRgJ7ywN9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuYvifYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvsulCMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuYvifYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvsulCMe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CX92061537
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JHEwpkm2mwC
	kiN9KDQARjnU/8WkGNZroifhSu4p4+NE=; b=PuYvifYiqORpcVOaCSPPhhGVjfa
	iffe8+vioi14egcSZ2j71rsLpGWPxbgVANfq647k8G5+3B2vT11pbC2JAsteqn9o
	65ZYWCaTyWP/paYmelnb8AXf1zFvcXpsItcu0NNhYOOy6uks+wwe7K52SO2oe/4c
	Ngd8OsA8CH4+6Ihj8scONQQirLlq9jTE2h2kzQRlJl6PfxkIFdqNO6xXbNxwgxPs
	bU46sO9zpE1cb9F62zNyPIkCIJkbixN0+aUHkNa2QZCdKo9h7I59ufYF672epM2h
	BdvNpdByh22RKV0RNjArQQxN+GStEPRNj2o0qvSyOCGkXxTlyM4BE3OyBUw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0v3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:55:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso677620a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249357; x=1788854157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHEwpkm2mwCkiN9KDQARjnU/8WkGNZroifhSu4p4+NE=;
        b=jvsulCMe9z+HAN115a8MhA0sJEUBfi+4/ALqqiMvAPF/Q9Z+YgluP91LiJX3NRRa9A
         PuVAOCoyXSHAsV+7pfWLSkMOEp19Tff/QXTzn22Fns+vizy9wxe+2UifsCkvy8kQrMQV
         lKDFDPg1nRCUZwOTaA6G0icHZa8I7qJVwTLlgX/hWNS6bc96w62PGSr5CLsHjzZg328e
         KOr8hr8oymAigawdOgK5AVYIS8G+JiwZgBVl4JqjENYhEiqGZMe47YmPjwqguswWoAXN
         sz3grcf72dtL3U5BHEn9m7JfFXGgciAVcuz10CGYfc4wWHTw6OkRRI0Z17jDcH9AinQ4
         YErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249357; x=1788854157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHEwpkm2mwCkiN9KDQARjnU/8WkGNZroifhSu4p4+NE=;
        b=OB+5BuaTlcVEdqRDbBanyvzKgB9CevILqLrkMKZkZ88cLD7JCY0HTxlE36A7mVI5AO
         SpHOANth/jQeMCak9K/x6IlGA7wuGylVvgJvwZ1YqUyyY8n/n4XDg+7RFNKn4EicUJRd
         4azCopsInUbRIKXzBLA+jyoiaf+t2C5X7NnVvDN/j+mNZyHBLjq6WUKua3IUFrTHcG65
         ewKng/49kft6U6zjRY/RBL9wzAZZf6hW8lq0SS9OXbMVLzB50oxMDbXbJ51AqW+M7Z/h
         /A/QfdZMedSq1BfyItShUqPQRO3iA7IDolQVkOhIY4D2Z91jK8lrEq0srFRuqN/87q+7
         yymQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbbzsWGwfgl6TTVgH0GcR5hQGR+glFakk/d3nt1ybScq7l9ESYvNTUNiTN9aTgJPySA4CCFE6aflqp1TU=@vger.kernel.org
X-Gm-Message-State: AFuF++mulYU6oxypnPYc9OpjJH4XaEnS+zXyhrFhYgCjzFlAcYOpJYIE
	2OmxqN6Mjuu9lty/stpvnKyg7H5VTRxk+a5wEg50giM8O00VhUpKXGh1S9yUBKYeNwmcseSmtsZ
	j9iEuw/QzvB1JgAa8AGTuzyf9oPuUBdw1YA49kaqrHmVrJu0WXj4R5/DqtnFig8aUrvo=
X-Gm-Gg: AYBFou2n6DrXn06VBxWOc+tMKt4HOaolseTGa8neF9STwB92CDB+GWbONQjv+LZzu/V
	y5xjAzKAMWaJXUrnjkD1lGl1bC4w/3bHXYkym9XySlofFxmLFARY8hPUaJHFAoInwdb1Q6YoBRy
	4+gU+TEVjMrKdYUdcUrsJaEild0AB1iv4KjkC5icZ6M9RqcWYtWJW0eqNCppNuWDVObE2kPZVMM
	DkSF0ksYvufUKaVgR3AsV+PTOqISxV0JtMvifcJl+jkQb9ZFaavYrmJp2qCttEXeYPjrivJtUgd
	0r5otCpywwrslHECDgo8fYLlRK+hrUrEKtvRkvdBNBcFrnNuxqzUJGMuT+KhFhccqLTzOj6/9gj
	PC1pSWveb/bpsdyHMkFYKEUJs5jIHN/bekLVYoPR8I6t8jg==
X-Received: by 2002:a17:90b:17c6:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-3990f757be8mr3582361a91.9.1788249357270;
        Tue, 01 Sep 2026 00:55:57 -0700 (PDT)
X-Received: by 2002:a17:90b:17c6:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-3990f757be8mr3582302a91.9.1788249356703;
        Tue, 01 Sep 2026 00:55:56 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54873262c88.4.2026.09.01.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:55:55 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 2/2] arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2 types
Date: Tue,  1 Sep 2026 00:55:46 -0700
Message-ID: <20260901075552.3558150-3-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
References: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX2BJP+mlizjGV
 vt0YlxLJgSmGQkOhdIcLdyCskmRtG/4J6UPcJ02sDMtjmzTXwPC42IWQbAlRyAxVQZTVvVoy1+J
 NX9WLf8dYANRTqQ2dNrJlkNgoiEgKvs=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96850e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SqthuRuOofwOhuX4C_gA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 1KiiJj25W203idweX7TNiUQ70Pum2jdT
X-Proofpoint-ORIG-GUID: 1KiiJj25W203idweX7TNiUQ70Pum2jdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX/8qCfCOPpKOK
 RG35V/XxBCPjvHan4pDKzeFQkgIiVU1+Any8NlfgSGzEw0OSlyw9VX1PcTjcr80c4ranI8Bw0As
 wncjW4D5jjGLeejEE3ZkOe/jAQKlNWLWQgsBV4z5iJurcv/E9Xf7x+pPvRwoUN4LkVzNi931wHY
 u9XvfqizYXg1TvPaOD5L6+1XUaVLW6ub3pufBXEkCvuqvW5yBmO2lzZLL2wL/ti5PI4WAP5plm1
 B4QseUKgmZe+O8EioxfrbNKdAwcZzt7YDiDb57jGhbM3CvrfgHxWWnqzioYwhWHHMC+sWrgDSl7
 UVbvneotLCXzXRfmaDfdqD8g1fMdzt4LcSn19he8gYhNlPpA0e+pBuyWVWgtM4HpLqMUo1geO5P
 nnbJOgsYk686CVBroITZEFh8jKy3C1rHo2ZkCeSVlUIPl0xK4mogigYhu/c1GzcroVxNSUbg6Yd
 nzWU+bqCYft5Od39wSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010069

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..a6a1145f11dd 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1180,6 +1180,13 @@ &pmk8550_pwm {
 	status = "okay";
 };

+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;

--
2.34.1

