Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175177;
	b=XmnY3+xqNSRmTTOwGhvukwGuYpkKg0Om5oZlg6o8oUb0VxDyTNIZPekvEvEx0G0o6Ed7
	 5xFRJIaQ5LT9wLL47V/eM5nBV+h9kgTHIMx1NS2gjvNpJPyq2q46xCD93Ww6X7upyLBRe
	 w1JClUGHWSj/RmoqasCq0VHLLW+cWHFx169nVjjZIxJQuEHTP6M3lUbXdWZzKpjEj3Wwt
	 XpVhrhcqky3nqHeMfNi/syTzDLPtvyy7mwRz41v1fCstH0Fa2O8HTM1lxABRlvMn3U4ic
	 oMWD8CYN6puYdqBY8vIOeKePW8IDKyk4/hXW1bIuDGNSmUetgwV6w48gglOAoXdrW8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56SmrkK9Jk=;
	b=5ERLX3/LytordxjOjneceUH8azyIjAm6jPUHlw+z5n0oy4JqAVdIoBO2fvJeOETM6Zke
	 8wG58s5S0Zxelf8iS7yaqBd2Iha423iuY9y7QOX+XZsISoS0HWitQfYLLUR6UpeTT8KQh
	 lKHoblQoAL+Y297kSVlwxnLDnIuAtrAz4Vd/U7MFNgUFLIR5qa7tcxbcdFGIckA7wRSq0
	 8huGuP1dKEfLn/reawq+EpwXaz+blqmeN01QGO1I3BT5XM8OKACdx4c3oXSf3Ie89muNI
	 SKyZj8R2UZvwMCbIzIfmErQmuPL8N6DgXy6mViawDkfdGAZIqodm6Mq+XQ8jNL5MtFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfQXcz2p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNv2EDOT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDC1606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCDC1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfQXcz2p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNv2EDOT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4QBir2753578
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56
	SmrkK9Jk=; b=ZfQXcz2pF3kgHWDp9VrfXW0NkFEso1q1QljvEXXSvaIq2aYTmB/
	PHB03hJJgGtkmbUWISDDe1iiyEQvjh+m9PxhNEzBO4eSgSQ3vo9b6zbe+X7OVjqA
	HeFGCsu6DWfCuuMHiujvOimGwc2TossBKvj+byweYHMw8J/u16Wnpp5900CZLfAo
	kE+PuJAdZc51lecKf+5ELfAmAkd13k51AqjWY66aEh7J7gFDomYOkSWw6SgD59IU
	6I503z0EY+w4E1vda9HfFmHmc+hH7zAmqHk8sKrnPYxKn3Kog3f+4jjjmwUQT9uM
	Dkn/VJm8+V89xcrKbLuT1FxrySRAS2OaPvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713731-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:12:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so135086485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793175175; x=1793779975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56SmrkK9Jk=;
        b=cNv2EDOT97A+yNuoCbteN4zGiglZ06L0FTJOOjJYwCbvfBn5DMyG0y8HiJe4jXWzMT
         QFFvAEM4TGLGuztVjXm0wmHRLe71dmU9+n+/wmApIIqyh+Cb1W919FSzSZVvqOVcSv2I
         nJHXK89o0Lw9oqaj9voBYdeIjiw3pj5lEATHj/E1nErk03QSNb1gOV+N5T/2chbwgcON
         522xB0EWgoEvoHmMcYLmQ45ZmKX+MBPsL3i+OYFZmonJE+Y37isHOOql/iX187Jj9tu6
         +ckYYoNAfBEgw2ob/LPoio6A+pI7MmZMRk7lOAS+k/zpW7BvZcP+2fwoJwcTG6yPS83g
         nXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175175; x=1793779975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyDQUFF2Id/JL1J8lTWcyQHlP4OzxlWsI56SmrkK9Jk=;
        b=vjkOHPzPQcTUuX2paptBBgZ/uMaw0/EF+ikJWq4/dKThsrbKB+WLQKWAWfgzbkG2W8
         MEeb2uh1tQxiQd+RLBdp5qmVjUlJzyJIJo84WZUQ62A0fel2mzCfuion/GIZb9XO+Etc
         NbTgSmNSNQ+lXzUUG2sm2sNDubCoW0r9j/Y5oxMuiC7YG1hQQbupjdGQG6v2QRvRhzXz
         aGrw+6v1EWdM6eIM8DYjK1EkU2Tp0qnc7NuClOPIKU1M5k3RqZvM0x8npeg3rHz8TU3/
         aVo+kAYScSwmHeNp6524ysIC568l5C8gBFMknp3DV+B2jFiLjw8MFr/46xO7eVwur6ib
         LKcQ==
X-Forwarded-Encrypted: i=1; AKwUvByVXQaXU6zvQN64Qs0IE9jjhT2g54wRdRF+AVkq12HtOga7RIFhsA0tmNY7hyXPtQYalHehN8eo/lStypk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxVRm2RauazXRguVyqgkmDZtTY79F6OH5uxfLzqzTyQGM068ND
	DQ60ku1lnpSxZRHbs69fwXyBq9xVB+yo9gFO+M1YWejv4dXr8xKs/3d3gGqahyqXzxS/Gt2Rd9b
	Nzd9R74S8kQ2fnbPJ0L5oBd43iShIj0vd3MhrL1JCVry1DmK3+AKgkCtu1L9wKadDblA=
X-Gm-Gg: AYBFou1qyslY9gZ0VxNIdSwoS47GqkrJn8+oAlPyi1GLUwaZPEmktXR8tZ2qXoTv2A8
	8lQKoJgwqWCa23HxSBzdVBVFoM7PLDxvfBSnXAYteHXkhwGIjThT12/gKX87g3rdnhw+vSEk0Sc
	ER3z6XdU76HRDJto9pfilnXdBXSsFlbu5u7ZBe5Gg0Vgy+LzOGv8I9qr3aUCOW4eufXTQNaNvzd
	9CgdpRD8nLAmD3Q2FvXRxOh24+j5v4kdJbDbUqKIgby7cw1Oq9fT766HXc9BCiCZ5VlX1SAKSQz
	qhCX6DMzO+iAbw/sjHhWzzIhD3Hh2RoWag077KUj4DxCipb6eiV6VnC0j6vQ8OaeV6MlvyQUP0F
	XRDsTBJcGK6y3GBSh/wkgSagcU6+HG7/qMiaFuNYQWSjdM26Yi/ZmjCjUXqTfQA==
X-Received: by 2002:a05:620a:6013:b0:93f:18ba:bf78 with SMTP id af79cd13be357-94408d1f56cmr185548885a.69.1793175174806;
        Wed, 28 Oct 2026 01:12:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6013:b0:93f:18ba:bf78 with SMTP id af79cd13be357-94408d1f56cmr185547185a.69.1793175174309;
        Wed, 28 Oct 2026 01:12:54 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm27072976f8f.17.2026.10.28.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:12:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Danila Tikhonov <danila@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interconnect: qcom: Relax child node name pattern
Date: Wed, 28 Oct 2026 09:12:44 +0100
Message-ID: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5321; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uUqlSTmTFtXhLMYp1LUAp5AuvOZCnusljum3tVLZO3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq4a57siYh18pb2JBnQeoruZi8r1IPtsM+O04l1
 yCZv9vFs56JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauGuewAKCRDBN2bmhouD
 1xmVD/9BheKSHIfPCUlrZWpdWQ4iY91ANpbyRdFKdONVcbu/flx71Vt8FSCikEq7MQtfmvxMgje
 xtzW1Vy0o0gCsLjU2aOemIjxBjFU8iFIGYv9nGS9V06VaXz006zZTkoiBu73+80As8KBAP7xX1a
 arV783trROSimoaSHVhEm0xzv1JzTxGXDl5VTqLUenD+vQuYFLcyTv0/YlQfAzGOvBYHi4pg7wb
 Ju1N75LEfEOWvCu4gj/rCGvBcviJvtcrAp7LmDTOXqUKUw7BSbViqpVp0QMzE6CZO8rqAFp+9UO
 BaiOqYJXkD6wOTD1p0NVRBgOCf3YlZlMDJmvSn2vPZqQG3332OPCBgvPOoHdB0+GkTQaP4v0+w2
 Q36yrlKfbbVKtTZ1rytw2RHeQ72OVq+dmI36oAzEUqGqCYf/S8ghE5+IXNM8ycVhRikl39ndFMy
 ATUEdWxGQeEPPpw/rC4jLt0tS+QACZN0HroPh//wZ2SsLY3TDtc/Y28bWLJoXbIImFDUOvhlk3s
 EgSft5+nrIQiHtjrsyEiISKNmmsNZT8pjs/Gyos2+0K9G13eK1jrtMxdyLT/H443mIQ1xPGFDYv
 zi6307QH9ncuWAaYEP96KPC72BVNT1kI+toSjgX2uvofcZPGz1o+lotTg1BSmHnLrbflQyKvpoc Y2pGE7x5ClTJMNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfXzVCRokGaIGWM
 4kmpJh/3jDzHHVmXLQH9B0wfpTxJCe5GO72lvacObB6NUh5+IoEwFnOkWU1QDBJE5GyEU4Q2k2e
 L1Qoco19PeX1mTi+C4j4wyaBMse7L9nYi54KiUJsVsLE4EmbCvJ6mMlQJxEakPZsh0Ax1I8OZz/
 P3ULMw2keBn7cWL1KBTVM9OvW7BWnpD97Lg9OXNxtqmW4l3Z/7UXv6AeQ7MCJjGHiiUuDwWp35p
 hCy40zn9Z9KP6ofeaqmcc+SrPslUXwwdwbGxesWAzwkLS+5kP4yIklIfqkiahUN0dStc3ZAhD7R
 G+IeHB4kuWWZ1IF8eblxIN3LeluhXQkVtSdf9hUBxJGwAAw0kJ7guNiepatN3m4PrxN6433iTOT
 hfEENofH80c8Y089hvXuNeudffEnsu3ItiCvwT9dYR8hBSPGRAKdWRagomjQQBNJhl69WxXJKWC
 8LTBEZELJTn8QJmPATQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfX+FauH+ZTqfXC
 rj0OR9sPRdc/7yiOvlPHVo2d52zW04KVhySJtkv1KQK9IFqn/x/6LOwKc6+k4+HFyV3qCVaCii+
 tcmp4pyJsrCtbMGq2Fmsn7kGulopnus=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1ae87 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KVRzILKH43C-bKGDRGIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: IUTI0AXfboMtQmmc7zeHChfw7cklGV50
X-Proofpoint-ORIG-GUID: IUTI0AXfboMtQmmc7zeHChfw7cklGV50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280032

Some Qualcomm SoCs interconnect nodes have a one child, thus that child
should be named 'interconnect' just like the parent, not
'interconnect-0' or 'interconnect-foo' (see Devicetree specification on
generic device node naming).  Ideally the child should be just a
property, not patternProperties, but that would be an ABI change.  Relax
the pattern for children to allow the correct naming.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,msm8939.yaml         | 2 +-
 .../devicetree/bindings/interconnect/qcom,msm8953.yaml         | 2 +-
 .../devicetree/bindings/interconnect/qcom,qcm2290.yaml         | 3 +--
 .../devicetree/bindings/interconnect/qcom,shikra.yaml          | 3 +--
 .../devicetree/bindings/interconnect/qcom,sm6115.yaml          | 3 +--
 .../devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml     | 2 +-
 .../devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml     | 3 +--
 7 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml
index 534644cccdcb..f8ecfe60a8a3 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8939.yaml
@@ -33,7 +33,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  '^interconnect-[a-z0-9\-]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     $ref: qcom,rpm-common.yaml#
     description:
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
index 56cdb77b369a..538115048d99 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8953.yaml
@@ -35,7 +35,7 @@ properties:
     const: 2
 
 patternProperties:
-  '^interconnect-[a-z0-9\-]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     $ref: qcom,rpm-common.yaml#
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
index b6c15314c5c5..72b060a4a193 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
@@ -26,9 +26,8 @@ properties:
       - qcom,qcm2290-cnoc
       - qcom,qcm2290-snoc
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[a-z0-9]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
index a0c26de94ccf..456b56222866 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
@@ -31,9 +31,8 @@ properties:
     minItems: 1
     maxItems: 4
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[a-z0-9]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
index cdae0acf3a1d..0024fd29c0bc 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
@@ -31,9 +31,8 @@ properties:
     minItems: 1
     maxItems: 4
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[a-z0-9]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
index 2dc16e4293a9..c62816917862 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
@@ -32,7 +32,7 @@ properties:
     maxItems: 2
 
 patternProperties:
-  '^interconnect-[a-z0-9\-]+$':
+  '^interconnect(-[a-z0-9\-]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml
index 978930324bbf..ec08000abc96 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml
@@ -34,9 +34,8 @@ properties:
   reg:
     maxItems: 1
 
-# Child node's properties
 patternProperties:
-  '^interconnect-[0-9]+$':
+  '^interconnect(-[0-9]+)?$':
     type: object
     description:
       The interconnect providers do not have a separate QoS register space,
-- 
2.53.0

