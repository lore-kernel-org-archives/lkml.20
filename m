Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA183A7F52
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915087; cv=none; b=CXIMQnGIn6tuKiYYs15b3LxM5Pgc92SJihD1J7zB2qZTj6GzXEw/1Oz8dDU4IscUIHVWOKNogCpaFHnG7tVBSU5lMgE0TV7xi4FnEj4V/rADnN6R00UfX/Dg2oWVfo5E94yx6zOR3QCYZwevmaSSQFs9jQry6mOgmUa+odPb7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915087; c=relaxed/simple;
	bh=h/yNVx0gWXcuWfLOkCoNxXjC56YQHgXEI/4my94jYpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6+ARfZ2zE6YeXrjpzl/Tzf8ZvR8O19+SXw7A5G3gRL3y5wrr0rW8g3Ptuv/YdzqVg/wNccjrw49Ic3oFOrUsSPOyBielgmmrCn98nd4vzoQIPrL5/r8WQDZO6omGCP5qbaGeTv0NGcDy+g0MOsuNGTJOIZogsWQbi8jzjL6vyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asZO8Eri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GROP3MMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asZO8Eri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GROP3MMy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoEie1639409
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=; b=asZO8Eri8K2BUbig
	jmKKXhn2W61X3JJnxcyvSlvpYRq0TkUf/smABB4S5fC9xtBPaWsXCxNGwHB7lO2w
	2rPhVzIhFkCkIJuqc0mjvstgU9ZRzRB4mgyiH6JAGHU4D5y6FmkTQ67lYy/C9wY8
	OC1ZiyAug72P7Dk+gWxjGqBksNlbAd5rLWuSr7xcbzZhBYrUSBlCP1m3oFamkPpA
	RmQPdrdqkYClk1c2IDnYPnrDWyPDgsCy3zf2a502vc6VaiifVXeyyqm719foGL91
	Dzm7z/CJGOyYfPavZya8K7JCl8th6FyIJaALZbP7hEGF2XnIiD/YlfrhyWEBbF5l
	15BjNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs834a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so355113985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915083; x=1790519883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=;
        b=GROP3MMyMmKlGgy7svpS8XZ8948O0i1YLTzzHtdasmTpsQAvpYuM0OEdYnYRflasrH
         d3fIOhC2qXjRcgQO5ox5CUg7LwBT/CUArhQrZMTMRScKcToV/VEbcpfxPCVAS8K/dfK4
         EfMKDdROHn2euv3h+gJN+YQtce1jlYFKKFdacckiglTHNJxnSL0TR2WW229l/sy0AQhe
         oDW9YyAixdQsMgHny5Td1PzsFxP8BwxNQnu3TKi4tGgTlFModT7Ah9b+3DZtX8y8h0D2
         ZekBHnDmcuHrshoXU7C1WuilXvQLKRcdgQfvClb5+fWIxWyKP6oNJ/1MlpTW7Eaw50iB
         JFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915083; x=1790519883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTQrQAtTU+Kos/svZsjkSQ/F26nzo7ySCIF2BAFVgi0=;
        b=nkPDt7B50/zOBw7IO7VypII6GlnnRPeWP5NBqzI4APNJPT276li2Ee/h77NRztgInS
         VKeJ7z+E4MsVhUBm9YYFx/mnRZAErGk75fiwq0KaF2K/yCMaQAph2mii7HPqUpPa2+mp
         RTdmAx6YYWVdIs3A4K5KRzEpv+wPrdr4HSVp9j3at4y8wnmxbNqEPMhC0qrL+NlIXXp0
         yszYWD8HM01S060VAFFFOmqIrVcj9FnJMcZw0Fwf1Gt3jjvHJKbWyI/VisplOoyIapiI
         3d6HTR9sL1Ll7+C4ivhd00zkzeRc/weWtiOuSPNqVQeffA8gYliZ5rfVj/q8VCh2HlA7
         RhSQ==
X-Forwarded-Encrypted: i=1; AKwUvByRP+vG5kQqXaFJ9O6f/zUGxUREAW5t9sr3549iakiO2ygR6GILGfwxT94j6DceNpMg/q+QZoo88rnAkwk=@vger.kernel.org
X-Gm-Message-State: AFuF++loqWmA26/CNBpuk0TNhqch2YpMVqB2d3/7nFj0wjDWMtLZFYCT
	Qo0GDSVSmT1rflquY7m6t1rjhn0upd2cxTP74dugP9foGCrS3WuUzrmKqB1Z4p8itCE8j4/Ua7b
	T3uKAS+vFgMpKok3cx0pva3D6b7HGfrKD6tia8dcZsbMnjkdW+SkZ/TZTVdy/mhXn/ls=
X-Gm-Gg: AYBFou1Zttry9K1G6AfBhIC8ZHH8aYgicWNvMa71EELeaR19VMDSLHLhy/yjT2qYW5u
	ApwTeGqTzWU9Y8PM2wsoxR6BgIEWtlRgQOZw1VEjkR8NSErm0k1fXx4sx7UEByIRXSA7hyMeRLk
	GlnggFCx7OGa7TVRmd6KGLsIcjrAPZdoT0OB6nhvWlA0KUU14GlmGCFSRn4wJx/vvHD6w2h6Jtj
	V4NEe0idLRMsF3UZOk7qE9ENSbAVrETtCVBLd/0mcabvoZmL7M0Ia25LKTWa8Io0jgKhApCDPsi
	H2HX5y5wIRRAhztElCQRLxHZYG+6YSCzoOHyqLLFQ/0G0+7TwS342cq9hpdZecR28iZjBJadaf6
	VJ1W+gBHesrWpf/YkymbUIrjZWAVdTj/2K/w7ebmLNGt+xvdf3yRF9R9ZCRor6J+o6k8kwA5ATi
	2YCpv6klaz9c+R
X-Received: by 2002:a05:620a:2b8c:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bf576bb71mr517737285a.51.1789915082956;
        Sun, 20 Sep 2026 07:38:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bf576bb71mr517734885a.51.1789915082548;
        Sun, 20 Sep 2026 07:38:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1549sm1251055e87.4.2026.09.20.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:38:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:37:56 +0300
Subject: [PATCH 1/2] dt-bindings: usb: qcom,pmic-types: require one of the
 VBUS sources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h/yNVx0gWXcuWfLOkCoNxXjC56YQHgXEI/4my94jYpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+/FmSa0paJW2SMhMidJAR2I17cy56sYe13SN
 f2tbaEM3r6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/vxQAKCRCLPIo+Aiko
 1S9LB/9AVciQAdfZfetcblevGwrpZkzXRgAjAhVB5bDrbPFjdLrR9SmcLIqsXHn7lWdIcaFpkGp
 k8iLAEN9xVJKy4vHDX3tiUNy1NNPRXAKJalUKfkHvfKXGlj9ssVWzUscQQHP2JhGmPFyhbrWrl0
 YTOit4sDbVdAxTWbU6ayaZsjK/vF7rKHD5FNu+PISqi2r/Sw49caI8kB+DXJysCwM4jn8u+BO2S
 3YUwVPkk42Xe2XQhFjH3ZD60L2+f3LBaBLxddMlEHukV52j9vmCHzsjOTsaatd+4r2qvYaRCpWJ
 uzsUEanfLJaXkf57UvhjRsKW00PcAmrDtrLUcWG/u29ZCwn4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: y1y32g-hCb_RO8w5GyHK5Lf2fnwpaoZM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX+zV2V+nqOute
 OgTaZQX6FyVifioIEtyTqzbnMnM6GTwPx/QlCBfsqDBG6u4toY6PAdG/tJT2GBLqBpIcHnCwS0u
 Mp2qpLlolEI9mNypNWW/5q/h/usJUSk=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aafefcb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RUh9Q5Ta6TeXDu1yFH8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfXy7UrTdNwMAqz
 h+TKyHACiQvVJHhNDIzWZC9/Agni3LCP9nK6UJmEXV9HtkC9hql4J0eir4/yMpxPBYMcQjT16JS
 HxGGXemgozIAVZkKw0EPuuX0C1ewAX4DtJsV9eU5F8qXqZPbW3yyn/KdNrFt9PWunLsWcqnr0o6
 FPxscEKAgDScEfgS10OJW7BPSLS09wUCzNrLwJw84bo3pOVMth0hWfQRHS0JOtLmchjtfL3tvrw
 Kz9QrGabUvxqtU4RsNSuCXr9sWvblQw03hDxg15VWROspQGzJwCtPpQK7uZ8lrbMkkG823egPIh
 vH8NDORSp5bRoifc9nxWlyQxRpn1d9G/tjvXwDopYlXtNiQOZf8rjRoeV1X4f+/qSLU0cPNnHXQ
 wIzVw1d8m78OQB/Ii0cZVPMRVy/EaqaPnZRD0jD19K0YmT8ox03tM2dk+cIB4cmaQvlvZn4+qG8
 DxFzrS+GlueUt/GIh/g==
X-Proofpoint-GUID: y1y32g-hCb_RO8w5GyHK5Lf2fnwpaoZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
device-specific VBUS") deprecated the old, device-specific VBUS supply
property for the sake of using the generic vbus-supply of the connector.
It also removed the old property from the list of required properties,
so now schema stopped requiring any VBUS supply. Add separate claude
demanding that either an old one or a generic property are provided.

Fixes: fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index ba790c4488b7..db487562cec4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -91,6 +91,14 @@ required:
   - interrupts
   - interrupt-names
 
+oneOf:
+  - required:
+      - vdd-vbus-supply
+  - properties:
+      connector:
+        required:
+          - vbus-supply
+
 allOf:
   - if:
       properties:

-- 
2.47.3

