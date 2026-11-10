Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280975;
	b=NuinqawLCyrV9m97WvrORBp2X4Jp9hA8O5+9Jfi+6FJG45iDWCANy+v5t1ofEfUY1imc
	 n6VvNOvp85wBPMLrapcuqVIZp8k60TUk5pPk+cyU+28WNByo7gxEXsV2vaCzH+LrAMiuu
	 CyYZtQXF8slDrbFI/zaMfVZ7QTw3Lqqmebtvk+XHrMnZTCnRV4SWPVR9scOxm96djtJux
	 rp76lP5akef+nSj4p+S+q386UewcuslGiEQy09PmsJyy7Z+BPtJIaGfu/KOQfanY1JP62
	 qIWOCOkyylMx4u1O2QNZhF5st+8QZQ4THoQ1jDv5f6I+ARdFaWuw1/5zNcnHTLbXUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=InAzUvXZzaA4nGByvAtgID8HLk/HGFK8pHZc0/sFtBdpRQHOH92fsSqHV4U4gyNdavpR
	 Lq7Gt2Au0OefJgMysayYzmMOQg4I5EzqzPOJ/SbvGLWFqBFRpNEt0ARqGISpn8x6UO1iP
	 KgIeNkI/IHxJ1ORwasxVuAI1b5R6FgJBWkJVCH9V9+9aqLdTZ4tRcFKCdskyIxOiAOUM2
	 G44dHUJpVHagx+/QWtHT1WEZ0sf1cukJKhVagO0gkaGg0L2bl4maNUlWProaGSgMUmbQ+
	 I+BUjQL/FfSggVubqfDzCN4z/6rF4yD83kwmaM0/XDSmeIN/80RUN8a/5G3Cn21boyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+QEeTFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5fJT1K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D770660A2610
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D770660A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+QEeTFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5fJT1K
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jL8l1514247
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=I+QEeTFkHUu2b3L/
	XqztB6ygtRDdY9jVOSV7rCmmyTOC4o3mcDxCBQ9kfoPSP1j4snMc4m6hxvtua+oq
	ClX0PiiHmBM+2ZieTtgrCFya124YJyi0mTbgc34JiEBXq2WBlGciSq2OBaFyLKpi
	Bms/WdsLQeAE2fzaLBQ7tyhGAr/qB3IqKNIO16WxLDPwH1SUHFjLVItLqs4O6N2u
	9Rp3KP7uZTkvORJgqvvtuP+JIZpWAMkMx8on5raH0kBdLVKULqsmqm7cj0M+w1lY
	k6tnEzpRf0fcnAXqkmBjbaYfSS12LcTXeQ1WobFueAaqnNq4hbNRJpi8DE1/cAIP
	zMERmQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkbd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea446ea8c9so10785165ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280973; x=1794885773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=hP5fJT1K9FqxwIiIe0KYQhmPx4hSNqUif0zonkGrkyFXvKzKBKz078AV56rOCGkU8d
         Qp/Mo+rAi2WBCGcif3VDt6M28v6+o4IHiTP/QIEKdrcuWPPdz3a/K/GQk6zdP7iSB1/0
         GfoR9Jfn5Jh3MievM8Egnqum/fpT/yQSY10wROQiG4LyFNz+rQDYX5pTlGVDTtxgJbbm
         jmh654xX2nNJU19s4mmIDoZ8Yui+wNZ8fT5oKmDGlZkOEGiTrP0x9qMqNO8DHCNo+Ntu
         74xSfXMTRme7fYyjjq9K1LbhBYtUCTtr6ppxNbS4H+VJ73bAEwdH6RuQuPjlgErrT4bZ
         mGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280973; x=1794885773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=xuNsxjiiwIcfb4K1oF3388CwH1g8IViPrQkaZIyfw2XYtHtRDsgJaHxY8BGyeG6ikI
         pPB17ASCKOyv0BHn5n3u3eZFzopKUozp0Li7Svgm7LzddAixpa6J/u+1CUoT9ldsSMh5
         E7BOnHRLVgjZaoZR9Oor9mLNLWZOqWXZGCrRSiQ5O3c1vj55ZDuJSSM7zQm4IdOIiWKV
         y6Iv3JjZ33LToOGaIN2Tm45hn2zg1aypsea+FwUj/LbsEScCUxPxC+iZpmG1w1bqQgPL
         BmFp3bqHaM3ztI8VHzjwS2CPFkv3YuzL8PGmivx7fDmDzypJDIEW6mgmvolOYbp19BCC
         H2oQ==
X-Forwarded-Encrypted: i=1; AL+hErFFu7jpG4Jjore9MVdoTf1DoJrjOD/RH+P6vm8ORWhL/SzdJnHQ/ntI1Ceewwpvt17sQrRzJBmoowjCbdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zxG8bIQx8+AcGy+9EPrsfdezWKco9eMIJTLbhtkTaR4IXabtr
	IzGVZx1TNM+QV0rJem+ntyGX6/yHTinq9glbsNgT6WVjHJH2p8GSC/pSSmHRlXw/+dgdgAPdnx6
	+UOolWi4DwXHNuT+NhSZwecIfORU+3eA1JfddKxIALtzd/qPpH51DduddKs7MLNYg+Io=
X-Gm-Gg: AYBFou0NRIJdbaK+qXQ5gjnZw7J7VgM5amfWIANpe3/V9JEQjiBaDucOPzGB+/VVkOG
	op9+IbDG1J8jiZpZzRFpxlfRP3gA0OOSaxI0jrkqCHEewW05mTzommU707X+8F/+cwxoIIwXt88
	dZ9TdcO/cfv6gstiU2AjD6MfbClxd4u2D5Vmo3P8FzT/aALFmpfu2AV4st8B3MYpeuTpBVKXQ6q
	jCict/X6TS+Zb//dV1loiVUwI9isODBoxYZeaK5O/we+cpYYz4SL/7fHy2PwbyRL5MV2aiUzJTY
	CTklPmpEcVSiKoZPmkrCSKJ3Y9SDkWjGYskBATr4JXhhAS3g674wSCsnQRih+1xqYg6TDG2VWD+
	Syuy2P+B1kGE33NMP9AzyDdHcw76rdqCuPrWRlBRJMBmnt3C3VgIjQnFksURqrfO0kWNIafN/BR
	LvykuGucx0O+aTI2FZ8nR/mvg2gVhQEMmLPXpE
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076858a91.37.1794280972867;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
X-Received: by 2002:a17:90b:3e82:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b167a1a2demr1076826a91.37.1794280972176;
        Mon, 09 Nov 2026 19:22:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:51 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:28 +0800
Subject: [PATCH v22 6/8] dt-bindings: arm: add an interrupt property for
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-6-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=6NrGk5dSyASv83dfsrXoNPAOKI1RAL53ItKIhUIrOtoC04rY/iqbY+indNvj+wTaEWXWZve9q
 sra5huRI48JBKgouEhBBxXTQQA9P31OmGFhsDfq5bXuM/0c3Xl3Hb8T
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX3RE9Xh8Q2GXx
 jSOb1u7weLSYq84u7eF9hl8RhFl4uFUYEh++PR52hVaYih3TeKb7iSSQW4joQzr3HtSUsgLXS5w
 vXIAhmolT0IPn1EHQR/2YTj4dURFMsc=
X-Proofpoint-GUID: 9hTQW9q6aOOn9Fqv-rXw-f8Q2O-9Z3ta
X-Proofpoint-ORIG-GUID: 9hTQW9q6aOOn9Fqv-rXw-f8Q2O-9Z3ta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX0AZOqK9fZMEl
 SLpeTEV/BMKO8yGclF+A1WTIA8KUo3LWOBcFMxj0xxKnJ7dRrd3Ce8a6joJySxbOiS8xEn26CgE
 9405LlFlwqjucg1Fi10p3o6LOdFYONbyfEasIQlPqVxyE/GV0FhfLx8iOkORUpFR1YBIdqa4hYk
 jfgsUFRj9UUwQn3wQ4NvfUidEMmjIiZC3xAcawP96ITalAJ2Kcd9ZiQsDj2Xe/1MUuwxwpYocze
 1W4KnzBH7SAENBrF15I23AfeiVXf5USLb3E1okH6ToCK1fTkOhHiwV5O/Y/voRG6PtTprqZZdFy
 LIcLaf+bpv+pTxtvJeSEQ7x06oHbzbJnsX9CKq04TDIm2BX1O6Az49G+i0szp8cgnW9jlifnLxx
 VtZc3KWC6mjH3GknBDwuPEd8N+sCAp8WhroacSJ1ynoTFZMkNpiAXIAt4vHiq3Fvx0RUgIuGFGu
 nwdIRMgzLx+4PL/qbXA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af28e0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
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

