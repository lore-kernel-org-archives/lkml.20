Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E746EF98
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390106; cv=none; b=QOJUFs/lvPO81loz8hNFYDv2ssM7iQynwXzrdm0Vt72XqtaJhFci5Vo46MzRKWoINEhN9PDSdTnqk/+3SUotuRVw8UQAJr9BQDPYxYEdiIrsXi0Uj97QW1DSAiGikKqlsWEKwWHykrDX5CBhmepTETro0rMDf8WQ9yavFJJ5rrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390106; c=relaxed/simple;
	bh=dze4wvhywaa4IGtfhRrxf5rKmL75jkRNLTy2LSMyXVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJda9jbkMV9Q5lNhHx0rOSocSni8K+1FNrCPsdXwAWy2QCQST2Qc/+XHklqX2Lg6PpD8qCGmQkMOsbT4Iv1XMW4hef12TPlv0TDdhDPFTWSTfPYL44XNUxskKmJ/9lGL372Egc2d6cD3op+5UZ8Ua90EeO8AdXFprmjP9u7WkVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx0yl0eK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wu85Xxla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx0yl0eK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wu85Xxla"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1vr727573
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=; b=hx0yl0eKNz/LnEcg
	8CgV+Rw0JrbT6ETNCgR+GqMZAg/6rFYuadlyrmDI23VT8FADLTojDa7rbXoFmJDV
	L/7IjrhtxD1Pg073b9KVo9TgogxAeRFcvWzHaOa6Sid1sbE52blv2fDXAfGDG2I0
	Nnc7L4YOoe/H+opVG8JpzYcZ95CeHdtzV27JFINoTP82DXb6upEMhdbdDqU4PsC0
	I2YBFga8RL5bwHHpaXI6HmHwjH3bKJ/6Tv2keKgxeHAd48B/qWGwwFLeEzzEdg/s
	YPsgSzLZ7sRiUIFX3xoJ0R/PMgxsV6k1DXAKEVNJ/FhtTX+ri1NSi9JR2wRmZZpB
	zTEnJA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rxyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91219341db7so56764386d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390104; x=1789994904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=;
        b=Wu85XxlaDJ8G6ORbifr31/I3e/A/vI0bxI9uKZwG1LQy512KcPh0FsLc22saGNOPcS
         Eq9Or5t7yY4R7gpvgQYmbMJyKHWRwPSGLYAeOwfUCp4H8Cr0tH3Pfy7onUn83eIR0O0g
         rnBCXheEpv2ZA7wYME+ieQhM5duj/FNHWfJ8Y0TKBZcMr7qUhBCT9090KoIcU4QaJP6n
         P3xbgCnqS3/MD3bHJj9fDrunSfWhm9FCyh4XgOAsHbhS/CB3Et8z5dujHT+PX6nDUw5G
         TlqauUrRvKRzFR3rbBq3q4kwyR6AfcdcDEBjOtkkZUtAH+TEPdlXNtbnzYV9YemxNPaf
         KRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390104; x=1789994904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=;
        b=SNVJqGy+UkoW6FBoXB1o658A0k6b9vr0dfYmI9eKcvAk6sJmK/Ik0ysp9eeF/ZQRUH
         zuHEPFKCgCMsgM1kUNi3PrI04X7cVHXjWZ5wRssGlmF36CaaG8LBYTucsxNCYPaVYT//
         RLJc1GtefxDsh/2MnA746w0uOmCAKvbbATxvdFtf5VqKVYEtxsu1Mq8VpMxG0iQ1uvOm
         K6i0Bvb+c8mkkyPGCc2tdjLd4eGZLXUHot8RS3N1KY0GcNGZRmOtjIYILE8j8+JmUBOD
         oX1PD/Gdtg3hxJnwvKKdsqw2AEVPanqyFcwWLsZl/4gZqehneyeZfy6jx+x9csTGI6Au
         tE0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx56qV4iwNtM101bZDxIHHHThFXGbEGQjBPcWiQ1T2q3tyekwhIk5jX/ACRB+hIjOoAm3JIH2/3tBjVVcg=@vger.kernel.org
X-Gm-Message-State: AFuF++nGZFeGHK19zhhSiMBIbziFPBgjJOPkRxJB41RiX/IV7i1Davxo
	pz06/PlR6hd+LeSmtLD3DhJttOyELw4IXNM2hllgUV+MVRkCS0EQn4vMizYzGyiNZNmTLXCUry9
	k7gBh2Mn+nMRqHQEMRE+YX1i4TfqN66SLmKrD1Eng48XXMe1Yd20p4EAgboKQuftWXdE=
X-Gm-Gg: AYBFou2sejMdztcSbROg8wkopADgbJv5sRTNwkehKaMFus8xBthBznisr5C9XiO+eJN
	dpcRW4ccu9uxPTSmwvi3JRm2T03m865DWu2c6dWEMLjslvP9Fi7q/0PXj8SWK8C34xAZdxgrDrH
	iAet7uVnhZRVgmHmLtR2sFTpIJA4jr6WbEBNDipIXOLBnhSU9HqOnZEeYpPWsMhm3kBiFbrz+ys
	rIUJzb+O+eQtwPS3/VDifFQMLYCThcdjMQUsN1C8Xax7TUJ9EtIT8R6S1TwXmkvmut1N2DJR8/Q
	YTdOfS8n+UHCCC/0LGO0ISAv31Vlm1KFGbmUeJmlQnkMpntFx/a31ykxGh4LUQSpEhsffK3Fg7D
	3fhko9f89
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id af79cd13be357-93a298780famr338258185a.20.1789390103565;
        Mon, 14 Sep 2026 05:48:23 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id af79cd13be357-93a298780famr338252385a.20.1789390102937;
        Mon, 14 Sep 2026 05:48:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:07 +0300
Subject: [PATCH v4 08/52] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-8-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dze4wvhywaa4IGtfhRrxf5rKmL75jkRNLTy2LSMyXVo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zTMciOruaNVKn91mmwF2+OZNrU2wwXHwBzq
 Qq//0VH5DaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0wAKCRAbX0TJAJUV
 VnXMD/9pmlZONNfKsS2PAQuuQEMp7vz0n1m0joBCnZksElJElfjl9JyQxWZzQUjO8FXI05RtIwc
 bRpN0dxXjIPPsx3/8IAfVC1dJTr6vxHF32gV7qqGQ1n2urwJoSw5lOQunTfByNhhVlE0RrjgZfL
 BCsAk2fV8oxdbBc0thj2fuCrpxFg2zSXHNcWvquR8qLAh+WBwd6DbzyxdqyW4MqIB7zUOmj0vYn
 qOdrZK4r2Z4DVyi4TpXktQz/ijKnS3EgFSXcZUBCnpYekSb3n7ck9F5XLwO7GjxZapRY56T82XE
 TB0JE8m1nLER3B+a5h6PDbQC1UY0Q5eCLZU3SU5KJrduzWHHTuV3yPYJsE//mWZlf3vONWn62OR
 +vmzH+//Z3plBeKqMorlXQ25MqnBfMjeQp1lKyX8nSK6zhnkkj/MhfQU/EQf/SttZWr+xN68/Gf
 lKKfweLJHKffzbCH3vOrHcJFAOghvANHMj7KuxE6wqauHFwg3xoW/k5ZZsPOxhjIhaq/lH0tSPB
 44O0R1hZajtqIJnjZJUL5PUc8ak0ntXDiZRK4Bjeuu0QH7e/Ddh6GBhlkJZEEuiuKvIdHx5LL6p
 MqEE7vvM+Y59DTZmSHARjLRx0pv/JCk+cl2qk1l+DPcP6hwLCEQEYFFGvPOhNttmWNAy+c4BCOk
 5U6xkISQIGfUxNw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX5DnkDnAeOkdv
 pL/6O8q0y/XS3YZj1UxKAJ1exmU4kYGOiwYONMbiKSweA2wNr9z8TUKmAsSH8cMy9tFJCrNVyQw
 nHXOE+aGyweysYlV2r932+jLerltZRA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXx4bdUTzhf5+o
 ICijwjoCv2yl21MU1vC6gItBM5kDu7Nsg8CdzvUlnzSGofXlay4kg/slr8OnqhSHhJgNxD0Zs3k
 Sre0eLTdhQ3WXVt8Cac1YXR1hE9XeuUj3MY/BRTV7UEvTh7VHwyo3c5khueSdvgH0lHtsfhRy0q
 g5QDXhgK9H0nwXXnQLJQnit/uihUT8cfDv/iGM6Ma6KsgyRwA1h+16l9Bb0IP8qUQpV20OOXOMO
 1Nl8+QYrEIJ7Z5jCoNH3JmX1qJoJ20sAVsmvS4XvwCVB9pFHX0AzGGQi8YdhxxrumZz8h5eHjo6
 LKazEu4ZGGOoR3x4AAf3wMDdU2anFJxYgEY9KhzrjKKcvEkh65vhXM/24mA1T/yky2cLfYnfBGG
 UEYGKDC6A72oJJGTOw77Cw6XNkoeYzyL3TYgxxgWsMwue+bg+GjT2K2tVoxBp126YXxBaWTqNsn
 vdakGDjwomjwYA92+xA==
X-Proofpoint-GUID: U3ixPkDKAjJq5xU_1lgyo0or9vuCTgHA
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed18 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: U3ixPkDKAjJq5xU_1lgyo0or9vuCTgHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..543105b277d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8650-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

