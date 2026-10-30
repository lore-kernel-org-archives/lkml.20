Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340116;
	b=o0V8+rLbLaLswXxgb7tyJ2SBLAbu+/+M28sh4r2iP1J5WndMtjL9uJmdgUd3j6VmEP+x
	 EsZxrLRqcU3l4BAelvN2NQfa8adw9V4DoYGHQFRe2xUnwu/Y7QHoFOMETyfwtfpRBbLDq
	 27U1MNM8SuNmEJSnbh/UM0VRotp6HX0dF/0ZdkpzJfMpfyxRykhOv7XVgp5tT//uVE8fH
	 U6mcmIjiRwJ7pFFD31LcZEj+X8vo7hLEHoB521j6ZVjp1BM4+McGPaMIfylWgchdnjyEl
	 7DitcSyWQe2BD2lK06nFn2JVVR+pal363pSTHWD7vDOLQvB0e0CH520DCdZfmJCEb/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
	b=n7uuTPf90/HBdNvHN1urhTIJCMOxAQkVwVFZ74AKISUpZZKzhiBfCGebHu3Kj7bkjhG9
	 gZy/P+aW3FquVhsIsXiMDezAc2FF32cSqpYapzBpKxpO+ac9peuIayWMF+ELIynbHe3/d
	 N33y4RHYH5hrWcv3Dc2LjOeJ7mk7kf8dLkxylO/dIxnBmaU5/yKJThJVJny0ylj6i5+Oz
	 BR+t9+j+uLHzWM5kEY1zwWkEHoFu+Tn9Eerz8q27qSOjGiXirdzrsOKVSuybGQJ2EeLSr
	 pmbz2GeeEON01xnrsoufb4f/q+dVxmvrte+Xxpa2BnRoWnb0d+zxCQL66gF38tLZvMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N61c8DdX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eg+9PD/u";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8F606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB8F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N61c8DdX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eg+9PD/u
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0k71266511
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=; b=N61c8DdXQWkt3ddf
	K7S+aCwGr7sMjMhFo3BRucsbhHwMRtHxx6r3YWa/PcUz860PivJt3066PqsqxjEt
	33B+BkvalMjKcH4QaR+Ov3XXPXV9zLrDWzrNqI6vE7Uk5JOb+GCMyHfpnpz6xdnc
	fUEOjxQtue81uZFHjxq4TdGDQkPpUlxIoaRnELZfK2qkc35eETusJ3HPInuQ6SEc
	AmLB3XhLA0cuLis25+6Q6Y4dVGtYiN6LvdSKO/CZFCxUXNynL3jn78CV01et/Utk
	YyK9XU9T6qbNaEMxrMEwTamDrF107If26e0TTD6bHNvlx5i/GStoqhHxpp5Zq4td
	X9+8qg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p1gk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so397370b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340113; x=1793944913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=eg+9PD/u7V493umLcoddVBKNZKKxSgjti9/Dt/utqEM9q4XhG62o1R2WCcI2F9houl
         zATzy9FNFSgDBP3AmEaz8buaALvX2LaFPTfiTTspI/D3mbxoNBbmgjK19HY7/WYnO1AE
         YgamKtlZQ4ra5ctYNSXgTt/r5TA9ULM4i+sBILPpxPQg1NdiyS5icYaVul85XMz1AgSb
         tqGqkfta/NRtMazHyIY9WEd44fuo2LDQ1lRdUutNAv4cQPyQebZGfRZoS9/CMTcADGGl
         LOo9SJQgZc40vFl0S9u+8RSaeS5Hg+omioiUGG7me6HHD7Riv3B9eDsbsEdDq44UA5Yz
         Cwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340113; x=1793944913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snjDAgx8om9R1BlpaOaUSFsNlIWrFmRNqUEBYG9Aam4=;
        b=HBIS5n2qpkkfQ8oeh/VV52WnT9MP+n+uiKis4msV7Knf2M2u5A4SYBlct/qmzkzMhx
         tmkQuPt0W8avb0aPFA36liRAoJhrmlkEWYEVlM8sBZha0Wcf1I3dqXc1jDGpU1ARdrhI
         PgQNLbp8ILvgDlGsDKLHMe/x9pBPbjqlQ5JklEktUDFAkgdNfZxe4HoCMpAf5nt8qu88
         uHVXD/e4Mv//giNsk6MqDaRdUycK9q0ioT7HZ1tRV8TKCOLrR82L8lzribSDgZVnjDdg
         gQR80MrZsGSml1/JnL/RtnPhzY6JFcE5v779TKsEdPYuiCqCwjWbKIR5G+FpK8IM5Gzr
         VBkw==
X-Forwarded-Encrypted: i=1; AKwUvBwgNpqQcYFbL8mQNGuxffMNfQoPcmlI6f1Dv6xzwksHEVspKY1czdPeuYL1dMtJ2b5lIV0zjnYT9bMJBgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHqP2r5fWNxTQOG1SXVaq14+8/8WOXWk5Yu3Ip+wHIjCXMNgUT
	LltyJYxdZvJjC6e7jbQnxvJSthjBW/hmBzdBsqJZujYS9IxnndSpVMmM6AVscIywj6WymM1T/zZ
	QlLUwb/t1xrg5Tk9yxAN24afytMLBkPrZyUnbgbSvGaAZiXgnBitF4m5wq7hDZNLT914=
X-Gm-Gg: AYBFou3s98TWLVs784qs7K9VUIQL8iDpeHZoWeSb95a8KR/aJY9r/FgAlqJjWBrWKQK
	PrFp+ur9lryYa7Ik2UxmXDTq76vdDogQ0iRYN+YAZ60zl98iu9gEuMaIeZI3O93F4uABKWTUbok
	8HrRQt4x5886AKDXIax0DUf9Gx8PwPNnJ+LVAugVd1Hg8M0awJmBKDzDWv01/VIu8+Vr4nb+QhQ
	tTf/54TR1/I7hIbPsUdK6caYYHXQYMlKegtaUNh2o+UydlOZEZlREypXKiKoybYwAqblDkg+nH6
	Ck0I3EZgj3KqajYL7YD/K2COi1MXozGfojmNUe5Kry+SJoLh0oeJ0PgRj/jh5cgFyXskJaCABOs
	+PUwA5y7DKOiKA7T+Zg9gtCPjD+oZ9K8m0Z2Mk3gAo/GjIPGnpUTgoCChwqgmMjcrjt9QUYdj2g
	K0UFzrOM8Zm468JLCkkRS+aj8nwch/vrH8qPtg
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1101025637.14.1793340113173;
        Thu, 29 Oct 2026 23:01:53 -0700 (PDT)
X-Received: by 2002:a05:6300:398:b0:3e2:b482:ba2e with SMTP id adf61e73a8af0-3e928c9f58amr1100988637.14.1793340112695;
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:29 +0800
Subject: [PATCH v20 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-5-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340077; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VZwTP8q3VzOtW+jql1QO52SoMySYQJECUrbQXJatheo=;
 b=EEud5RknIhi9nBBQ9Ap+ON8z3v4WfMbmbWr2mlSA1hC2GfyWzIXCRFPxIGb24or5dmZbA2wdI
 LYWNA/Ywb2oAd6HA4/BPuj+3dioxkUBoi5/fux4bsfxpjTmDA2n+a9O
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX8EcTKlfgc9iK
 GljFHlyHU40LC6oT/Xjaist95EVNNjbo81sZmQyaG1eGdl1wdYmVVPv+ps6yuhvGu9JwdvzwfVX
 7KMkLVKxQf6107lQVf8noSUfubaS2PK09wWPrTS/L9SFg5OJ6KLWLq4INenA8R+IX/Vph57yWXG
 ssh6fFqZcL6AO9Msuy8b8hgf7iq6b70aZBNsK8iiNQIgYZM/kvtkpCekCwjP0DAYZ1RnqEOjgZ6
 fWiSDMObuC4amAAUZcmj6loUEhmJPYRCU184NQ4WGFCIKZzvSbVIJDdAkTr8/k9zEvgIITJZTWw
 /2F8VAXDMTss7e9wRcELNDbDe2VNBvgtCfU71K5l7frr5FRyNdDY9MKIIb53KrRj3nsD+SkEsCk
 PgltvmVCsiCXOZJUbnayWSxATPCybhQ1iSkmKMy95oTfXQj9KQaWR/eR/wfRA47Md+LTzr0+Taa
 w/Qng3GR+UY9jgJ88sQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX0++Fblh8bpPP
 iMRtRM8ReU/bRdv38VoJwojLDvs02khFNv6hs35IeebiLG8sk+sNA0/gEs9efGpqg0qTFKDDa/R
 m07mxfv2sJjk3lP9E2SSRJlua44jdNM=
X-Proofpoint-ORIG-GUID: ljmzGOdunpXV3T7I4sQ2vnUEmRisWR4W
X-Proofpoint-GUID: ljmzGOdunpXV3T7I4sQ2vnUEmRisWR4W
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae432d2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300023

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

