Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418309;
	b=iVXlhqWm06iOfRnpTFa1D4z+R5U6QjVl3iaW62iVrOc5GbkHYcPd9twgLIuMiOzyerpt
	 cVoKSMrAbEjLbj8P0KuKsGmelfHBrBlsPw9I9E3jJmzqbSntDjovbKPSUsUK6wCX5OUdg
	 1b+rQXEOFz6bOvHCIkzl3q5K71LYnP7n502xMoDH/jFN2Q0DB0UpJdXca/xUcHABVhwMe
	 gT30FQwxp7MGOYF7rfxblWLXZkxz0okhs7Xw92wX8we+U01xgFA9mUG6QEac3lyS4UTWZ
	 +UuchxKCxKhChdu5ml7U5HdCMjpHdAXmSkEczEnNo1pWlEMHO/soQSsvyV/4u4I4nlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
	b=EoUf/0CUYnJd7MDeV//NVjTic+e69vpJ05G5QQwhMrs2EF2Ar8cMerzn9SEUGKeVFuif
	 69w+8AKVptduuzYezdLGvm4lVuL2fo2zM43d+LRXVjpzHLichm+bFHB4AMxhCztHtJ2eL
	 +QQLpZSff83YsAsjIcdtdK4JEBA25sNuR1Hz1MX/XHalzjhI4RL/i9RpmxQddi9zo9maO
	 PXto5K/B6uOu2ReNwj2g8GXntsLeWZwS9TMP4luZXh0E6UFR/+TEGPisEjc8VgRkX53FT
	 VppzTjyEVVfLQqCvyhVxBxGevuyyr1S+hxQZ5TBlZMmV/+mQlVm+ldgmbMKIGL0MA3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMpyGTuW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwMPo4LU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB60606A895
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB60606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMpyGTuW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwMPo4LU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0I662651078
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=; b=GMpyGTuWfKCtD3FC
	JEHPmo0do8hTcM/kvQ4VrfQCxNC8/Evbu5HPHqpPp/nJOvRz/mNyNkhP0n++8e+o
	rqJPVMKqmENLTDAjyQeXUu+cfT4vGtZzvSk7SkJ3c9GTayUM7wGJXojLzv+yX6L+
	aZRNYSiEtLQcNgG1B4NV7gwyltqxkIKE+iSKXtYvBxOcg/UHx7RMWcmTwmzy8XdL
	ucFwb4k6ktd6g97twK+DrDQoJ7eFxHJzbO/mn9KEPRa8NViHldvt+8Z8wnR3Okjy
	o+RmpbvurHjyUENAPAtU/ZvCicwB2E2KQvkL1dX4glMP/YaKT9QAmc1OwCiSY8Ms
	OSRWQA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbwxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2229767a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794418307; x=1795023107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
        b=QwMPo4LUwp6zNAaQGRIkZXrXl/eQLDj3QwXT54rDzoPc/UuHK1LibT92hwGSXkJH9Z
         3kFoCIos64uSJblZjlEv68mY7EIa0aHOE+wV2i9ROHSAxMGYtbOzBXu/b9grjcO+689M
         R6Y/8/mWfeBle6mUtq4ajl3tXpmV3XHAdk/D3Vz7sleg/+RwZ83DJIGYbYSKsXDHMlgs
         bc5b4V8tZzcQo3sA8EcD5GGN48+frUVtjqq55SFarg//TpY7unzLquSzknBDCdtFSiOJ
         HWFhRAQjWI6b3CYeMXwdRN011JxVsWwdS/DPYo4S1feQPwMFE2/Rg63K2V08B+p/BmZH
         WFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418307; x=1795023107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
        b=WDQQF5MIq9l6n60KWNcjZ4iWEeTCNp0hvM16gD1azRwT3j2raC/gkk8WbnrWCQ5d2V
         vSI7UsPX7anJ4UqyDWgm7aRcNFco4qneibc092sgQGS84Hmy3jDa3GOM2c8bS43PpKNP
         L9bYmgS7DI66K2WsJxm71OAu0DTP/Y2obAGQICKh4mkr0pCtaT6uoMWMUtVnQkAVtVr5
         UzcK+QagO2Fsgoho0YUsyRVbcFF0w+ywXSxusv8XtGaDYPv+OCgUtq4wlQXprkSwIxqq
         yPY0wQ+7FO4pSGotdjWvgGEbi/rs95SDYcOyMJquFu8H/i0/h4dycpIHBHbj5VQnC8Ck
         0RMQ==
X-Forwarded-Encrypted: i=1; AL+hErGmLOMRhbB5mcZWS5Gi3d4QBUtzz8+7A3lvQySzooo5y1fNo1meMkR5FMjtgFiYf3OtjKikNAtog9xXpwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z96YmUlSEj3IQ2ITC/nzOvkk+i8m2FXrKHqMpCniC9IbQTN0/q1
	YXhkKVve3K1ZM2JYzWi3IaaA7db9Hr4q0uUBphNJ1xABSzixpAjAMa+kyOrn4Dm6CinBIXnw1hU
	mg5OGPQTBhsPILgQSknOrRJc31TTIcBStOEDLvKN3/HU87ykroZ2hZsX38FzVkH913KY=
X-Gm-Gg: AYBFou1ktnwQruYG831rJmkzDbcKUdzbHN8pXN4NykRkx91Hw+Ge95uD5irnnVgG7v9
	CwUJjJh64olsCKYl03ev4qdt9GgcCSSKcQ0G6NQMGY1ZoOx/ykxB3WgGSxhc2N3lJMDpY6VnKKn
	YJf3yddV4DZ+e84vPF2ZJcFkT/1ZMKDOsfHVWuRVReoIA/pPKx3Pq+pufY9dWZBsRJmZ45BCorn
	hbN2+IyR28GAqnrZIn1ZENPAxKS09LycNK1AS79KlyZja5m/F4yBLhMa9VZEDFrXAdogJNxPOnN
	9yvIQPePcerUV9Qtr3IRv+0ebgDWjyU5ybUIBI9cm5dPjfhJt/a4JcojTyNXaL59RK8Vz/f42Ls
	vKRuUW/GKEj9dfg59oEcGqGayqKMJNg746aXNdcHb1MB+HLVzVybqbiPcAabBH8dGD+F9LX2j5d
	XkOp6qQ+zOpjCQ3ZoUu1F61IFYKegYe3HD9pgXZ7Nk1Q==
X-Received: by 2002:a17:90b:3c44:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b182efad9cmr2756606a91.10.1794418307011;
        Wed, 11 Nov 2026 09:31:47 -0800 (PST)
X-Received: by 2002:a17:90b:3c44:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b182efad9cmr2756575a91.10.1794418306531;
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm237305a91.2.2026.11.11.09.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 23:01:26 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qusb2: Add support for remote
 endpoints
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
Message-Id: <20261111-shikra-qusb2-charger-det-v1-1-5a9d919c66b5@oss.qualcomm.com>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794418296; l=2916;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=owFjultANOxmQtS34XQvZEam8JgpNAnt9Xs6zAWLZVM=;
 b=c3V0jWnq4UiJGGT2KZZQBL4VS3BaOfk2D7xD1gxg2+qfMsMVHw0jUUqQdD15HC+Z7Bno1LeCE
 J42X6d6Rf6pCafyo9wKvwqHm5nWiaXZFfmrh3ZQ51lGw/Ee+F9iyshV
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: w8Z9e56KNro-2zujt1s95IT5OoKQKUj5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX916h+1sy+Nt/
 cXRPrlPXfuUPpdAoGef95QqYptZ6QLYulhdFcfBimFoAFSnZj3p4/tlbyUTqd654D37OVXMZEXG
 I9sTFUKVVdJTesYFxQIVsqZPy+uPCtk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX9FJUBBO01Se8
 KRtGY++faUHUk/N1MGLgVuPGDdwVgkqC8UUWzbwI/vVLC+SyzJaqHyma0J8OroyztPttzjxUO2n
 +eQhD2OgHqu/B9rzymnSWx+ukb8XOzKe38W5CKx4ZFs0A3I8ztGjJg5FbA9izepFRs4/+T48Eew
 NTJ+17/qRHrUDy+THFz1iMkB9oWntwXWIOmNsV/odS6kBjYvHEVw+7mJ2odY/1629XKQyfYiFVc
 sKKSMKyBmDkj2UrKe+ZnmLQl4tkzKH6l8r9a3BnkoB2LW5A5N5FON5he7XgljcDH5rP9DmsbCcX
 tP1j0TswgkxcznimBOVDcXVxOXlYuEfF92wJGmbCa06xA5J769Z62k2UrZ4f1roCYDNlg1VxyC3
 +6d+oE/Yfg1aRKyTQVUuZi5kfwIjNfALf1h5iWsWiPf/D5kwyvFegQJsiSxzUblszYKKM8qd0sU
 1cuTLRN1LzzlP5ja4pA==
X-Proofpoint-GUID: w8Z9e56KNro-2zujt1s95IT5OoKQKUj5
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4a684 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VqWNwAWn-JPd5HJ3FDIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110069

QUSB2 Phy HW is capable of doing BC.1.2 charger detection. On most of the
platforms, the charger detection is done by PMIC. But on Shikra CQM/CQS
platforms, the PM4125 doesn't have ability to do charger detection and
that responsibility is delegated to QUSB2 Phy which acts on the DP/DM
lines in its control to get the job done.

During process of charger detection, if the controller is supposed to
enter device mode, the charger is detected as SDP/CDP/DCP. The controller
must enter device mode only if the detected charger is SDP/CDP. In case of
DCP, the phy can be turned off after detection. If the controller must
enter host mode, charger detection can be skipped and hence the phy must
know the role before the controller so that appropriate decision can be
taken whether the controller must enter device/host mode or not.

Intention of adding remote endpoints and usb-role-switch property binding
support is as follows:

a) The DP/DM lines do go through the phy to the controller i.e., the phy
exists between connector and controller. Hence adding remote endpoints
depicting the same.

b) Although the usb2 phy is not the entity doing role switching, it still
does need to decide which mode the controller must move into and hence
adding usb-role-switch property to allow role notifications from charger
to go to controller via phy.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 001fd0ccc985..0b6b2933dd98 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -159,6 +159,29 @@ properties:
     maximum: 3
     default: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Those ports can be used with any connector/pmic node that is able to
+      provide role switch notifications for charger detection purposes.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connector Data bus
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Controller data bus.
+
+  usb-role-switch:
+    description:
+      In the context of usb-phy, it denotes the capability to perform charger
+      detection. Although phy is not the one responsible for switching mode, it
+      is the one responsible to take a call on whether controller must switch
+      mode or not. In case of SDP/CDT, the phy would inform the controller to
+      switch to device and in case of DCP, role switch doesn't need to happen.
+
 required:
   - compatible
   - reg

-- 
2.34.1

