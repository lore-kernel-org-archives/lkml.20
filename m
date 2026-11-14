Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618816;
	b=eML3U/3xrtywaTyAnKAEUCODOv9CqWDYG/HJR0U7VWY/79OqUVA6S0xqFUxR4YYniT7/
	 bK5OONLqa0wZ4SoEa5c/POk9XkSsbWEyou9N/it+Y7XArjNyEAmKTgnPNys23dZOiv8dO
	 NqK0ecbrM9seqzZlTTzw19+zgIWs4NpuiWTi1hJQo9EnLW2WYs8eSIx1uRZCywX3ocTbg
	 UzQ9wSDpEHWSydwtbzLjTUkbZArfqfbY5KhRH4kFJ7+Unb2Iae8wydSBIS6a32DCCXbH/
	 mQV2yb2yv9LgMGk72qv9Sjaf8fRbRyDpwbrc0tKjoNm+3JINIEft1u47pTRI1jUkkEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
	b=COQlqBcLIFRGuyOTG8jQ0uKkyVdXJ5xIp8MLiJEN5UK2+kKC8JhaltzymAJ2bf23Fvvj
	 5GPLy6tICI4ZBoW0w2Rpg3wOMdXnCsxr9miqiYRYGaWzL8N7XQOAMo0VCCsurZRBYJXFg
	 vDt6ljxnHZrEVbJxaKsFH/+3AcUhccs41tPAZihpfZ8s2momZK2w0JLJxjrsZamUv6/MP
	 vRaOsgUEpPieibS+jHvFZz2xKNLzpqWAD8FzKsGIeuqbpwg0cc2hQL9bHE0yhpX4K0MWn
	 vKuKd75ZRrgM0B4D6Pw76xDAD6BDAUvGXAG7ooNHEtTtg4iPhuuQb6BXdqhb19HiIBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9mSvnqb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+A1ltRc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0CC606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0CC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9mSvnqb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+A1ltRc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE0JavW482736
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=; b=I9mSvnqbty4lHCSv
	1V595++OyJ0Z7aRn6JLT1RWafjthvzluXt7l7lECWu7HIM+tHjC+r/f8R+Q1C/zU
	ONKicF/m1XRxxqPKr99YWutec/3+Z0cv9qnDTRR3N3newo2P8weSkVIgcbNRwhK3
	ddhEyHjVcHJLiFmxHYk7jA8bby1bC/u0+PRYtZ8FcK5QoCwHjUAA6jTD7yfQlQo6
	YaYZ6YhcpYB3j85AB0kTyxy8INxP730SOy+zt75XRZgVOeE1o/fbp060PO4+BBwV
	TcMvIqREBnAxOmVUeFIOmUWrG9tPym38R2bAP5mdMC93Jb5f+SrOaQAmlqe9mZZV
	0eaZag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nr4hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so2060874eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618813; x=1795223613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
        b=T+A1ltRcfqfcB5zSbHA1ikWUVwSfv5mkw77dX7BE36AtghlXbrPe+WMq5itgHUplhK
         aKZHnrS73ibFr66CERU+XlXtQuHWoqxGZGiON7W2853RpjmJdvMbhZwTdI0VBBKKv84J
         nBxz0Twnqq6EgZurA+gxjN6wNhkr328zHlIPiodGHjaTJxamvPbfKtssegtJ69LHLW6d
         GsmS0MKWXW0jctH7vMKQLdKzujuxjXsetAK/6aPHDdjRB5WGZyZqxbPIOB9nIKI9Aw9P
         flOa3YaEekVZljKWU///dOQn1heN6VYviUlXWJINb45A9wDhsHFc4mToHtqCFtUDwiec
         rclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618813; x=1795223613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
        b=Js7Vkf52Ffgn/CQZh6XC6lolfSE73bN2CoVePa+8mjXzQy9NYn45QdAIZWpz1lHwh6
         3i4iu9Z+zJ0KYDHCFprjcJCZSejk/Lp7+FpcpwVuyT4uRKa4ACKFWjc3EYEQtg1Fkxu6
         9xOlf6tFO36pormK23FfRXF1lary0opV+gYXfphni98IIGIoM1reIuI8W/Whyr4KTCQD
         S/EFUN2x3CGYHjB2YKgF1eVKCIoo4kKZaarGAQYkNw6ewVlISoqg0Ugqla2VYyw938A5
         ujnrqkkVMyQBp4TbKxLuP/mitM6GXcRJQ3QQCNOH+iL83zo1P/7A3T32IOolNGWsjRZZ
         Lp1w==
X-Forwarded-Encrypted: i=1; AL+hErGCt3eo3cFmfPUumTWxqeux+7vDJoGWSYMHhXee9900RwGm2pwcGLz1bDKc/uR5OptZB8YsrD7+wr93O9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1yqKAfRtCicPz9VI28AyNVmeW/QzC2En5V2BF+Wfd2IAoifvH
	TJinVRLCLn5asijQUOKG8FISfWLInDLxBtcBBSmRBhiFeqdGPXlgmzdhUDjxUmOCenmguPnzq23
	zQnMvwDVELIHCP12CmMfodt2cqGY8zaDVPDGmMKMUN2szYQiMnupPD8dN8gqRwhf72bM=
X-Gm-Gg: AYBFou2zJ7xcQOa6uZkSiuNTa3usr/QG44YnvDrikQtwcsM6LAqCW/NnSADEQ4okRnR
	7Kfp/S1ZFKFETuDCDgYlpavkW2tbqpjNRjpnpVIqs/mvy78wgWjWwd4JuOoz+c4zuIVp0POZXln
	6env7MU3ggl9N/CpiaD9rIpHmXUcJeB+Urw4bBUigu41W7fRXw+aHOOaR25qSS8qPRyylrUmyKu
	r/a/ajMQ+tuOL3lcT0HrCMl92tvVS3QanLjhp2K8jUMK6fEq42ncmasr8YChcQOUXoj6JdtOLWR
	xqRPaSLhlvKD6hhu9mb4LMdf4Uj8iclPfkRbw5bgJj13JoiQliXBdyAjrzvCUwAHbD/6Bs3zDC1
	+US17dYkGYMnRiwhH5z+lp19WlPQTsQLJ0YVCL3wlEAwS6i+8WRoeePf/95eROwbDbLcZ5nRF8X
	IeZ+zV97Wu
X-Received: by 2002:a05:7301:4d10:b0:377:58c0:22a7 with SMTP id 5a478bee46e88-379655d4493mr3179192eec.6.1794618808015;
        Fri, 13 Nov 2026 17:13:28 -0800 (PST)
X-Received: by 2002:a05:7301:4d10:b0:377:58c0:22a7 with SMTP id 5a478bee46e88-379655d4493mr3179154eec.6.1794618807286;
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:04 +0530
Subject: [PATCH v3 2/6] dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
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
Message-Id: <20261114-monaco_ep-v3-2-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1137;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s5Y87Am6PDDfuUvVslWLtn/yo2Q7MJcUCKhSdRzo2nI=;
 b=Jk36zBCLoS8UAywAYb2ft0Os2UknwfK1EJL5/lVvHm14BbQvBzWXaiRlezKB7UMZKQQ6d8atA
 ozomEkdv8gGBRRxGGqYHEIiuIdlL9j3swKMKMRm04TlBLJa/Y2CdvER
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX+oH6ozr/ar8v
 07CRcxCkGxIue7nVRKURIbW1s2hG9HBecJmHKTWD+Kg4B8MGGr6ojdhFviirtko+uG/vuETDa5Q
 483rVFdpf2B0lvLmt0EmsRjZCCWb+zc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX8bLC3nIQNMl/
 Fitf4Oacqd2dISeudlgfE0By0Bq9Bxn/5dC4itveAXvzGwlrewq4SGnFen4cnA39PaTBTdoj9qH
 SvQVR0DEhvv7gR5W36nrT6BPfzGQG26Kxdk8tHnkxJeNbDijAFyptNX0OlxygCVzq4TVjOnNqYJ
 ZieEg6o4KTou+UA66gVYeQ66cB6Vc0dOdYb9aDWhjUeWsENw/4zHcWwRviGjQKcLs+NT760/Jjt
 owHNl0/cZfAR423gON5e4mpw5gZVHEG8i5tZErEzgkojg4l/u+RCpj9Xcgn0YUE3OB9PuNJHTUE
 FtkKTYO2x+sbQ20xckLo6rwwCgBa9FRxkRQb0T5fbXjXAuiLVYWPdB3cgzbfxwDZ9coTNG/zNN6
 Foh4HiTl1ajDcr95kfhuOjLQxa8zaemEYMKhD0myJULgAkZj+n/5cKqquO4+AIutPHTXi9BSACC
 EqlyNhtUDS9LR3upB7g==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7b5be cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: rLRMLAhGcUcWRHC5mjulDUMCt62dEmS8
X-Proofpoint-GUID: rLRMLAhGcUcWRHC5mjulDUMCt62dEmS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140004

The QCS8300 PCIe Endpoint controller is compatible with the SA8775P
PCIe Endpoint controller and uses the same programming model. Document
the QCS8300 compatible string and its fallback to the SA8775P
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..1ed0b97f883c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -17,6 +17,10 @@ properties:
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
+      - items:
+          - enum:
+              - qcom,qcs8300-pcie-ep
+          - const: qcom,sa8775p-pcie-ep
       - items:
           - const: qcom,sdx65-pcie-ep
           - const: qcom,sdx55-pcie-ep

-- 
2.34.1

