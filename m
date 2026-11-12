Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458234;
	b=IUnsAtJx70zwS63nNaBYI1L1/ri89ZsmiEhoPElQhbWjeXrz23yPsqVFTgIzilRPXRfB
	 PpW/SxqSItehm9haJskP8dXnAAWZmzgwUqy3lBR4RMhTN40JcXQUuKfcv6RwgFSfOeD+Q
	 XBxLLx6gHHdYggYW1grvXveySkaZX87h6YCicf1jZeQWNImfyjPr8Bu1YJS7u1x7OrPxW
	 05E7XLj6zgNY7fT3Aparn2x0g38eAP44b9cUtFO3zjLZ5p/UeIlW3x3MPJc75jLDs203V
	 KgsVvegIFS0+ByPUT5iHqR8+/gXiJ4drbipDz03nJhWwe1lrBsARaQJdb3HcrmGJe0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
	b=c+ZLqz1J4VO0QcV+lxMpf5j47U++pwTAQ+JZ2iUivBT5F0+iBri6rGu4AAkApdwS7dbW
	 tVAIo/qbbuMZ3uIvwg5HhbBjz5DiUXJcpgWUDnVD6lpUR5NeYG+6GtWLnD8/cYsSbjWdD
	 KCyVIUcZhDleLWUMN4fYZHC2XEM2HyaOF67//ug5F6Ml7QcXq9/c94sZWt8f7v20NJsmr
	 Zo+UWbGyOGw2jjlPny0J3mCZrtcFderCyog1hOxiQAB/5Z60GjCDjS/NjE8jn8/mnrHVH
	 t7a3jbDYU3/fiz43Ac8Q6yplFN2LznQQv6rP3CY6UNS9W4nwQYJcJVdTNAV0wcA5Cyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebGcwWpu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGzksrpO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD6606B9F1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AD6606B9F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebGcwWpu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGzksrpO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZfJj4149469
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=; b=ebGcwWpuFp0SvaDp
	fWXCaG9EeM5OTnqzA7O3NcYXzaLAywLLiW1/tKlR0rk7/VKPIQ+Vpk/PK/B9ydnS
	RqTEm7ybzl1o29wqVA8ebsOpnuPNLijoWXdrA1ZyeRqAuqkY3iz9uMF8nTN9tnKd
	yeYDnnaWo1vj2V1+Fx+ZwsDE9pxZjp/MhGR9HWG0zKRw2KpZ3+C3ykjYYEJns46G
	+DXa7GROsHEuxhTEBOQsla6f9I1KjVwEZQbGmsa+T7UHdtOMWVibEwW37GH6erTw
	Iv/Q1kjNQHTCJkhhkWSCZ+PZJZsGqdkzq3B4U/zNAvx8KoAAPYuGrlUquuSV1UDW
	yauLaw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc61pt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so6370177eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458232; x=1795063032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
        b=XGzksrpOPLliIpFibfr92ScTUgXFufO2eCDVDCOlAorCvRVzgLRWXc1UaDFGg0euqz
         wYxxTdRQn+JvXf58JJRF16bSdUO/IRvISVc57noxosTuB1WWoS6G82jDBiaNqCsCsENt
         X7kqHhnFI1DgkLgfjKg8VHDkL8cVVtY0+mv3G9BcCS9uYH+5/dJwJu7X5H69ne3sQBQ2
         5jVHXt0NxQbpNmrshlskQqXmw77Ie3C6fFzDZeSj0gUvDnzzJjabpnQcKk7OB5qZttAn
         +4eEtVUVR4gOsFRM2RSdukyf9ORG5scz9+HCxQE1GpPw9o7pBrqQLqvTStOrscnKhmDo
         y2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458232; x=1795063032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h0TKREiz8XiAIj9Eio+1IUcx3jgk7VkK3TDMns8tw4=;
        b=CxHMIk9lqRizlD9Zk0/fPjJYr+VLCW2qETUrpxo8EZZCSJSdz3fYYPGrLKZyUQv4j/
         FCOrrKIo3YE+85fPhdTROAn2DVdTrJJYaJ2nQwYRCT0ebiA5yjQU2oRap3Ls8Hz+2qO/
         i3AX45ZyRyJ198QL9gaNt4UNuDCQkT8gQUkkNEWsyVzd8LLk5acCPcq0S5dg37TKmjdo
         AtXpIqVUV1i8LCOLjt3wUecrwZfWVOBb5D9c3b/2L1oPNZmRK/+0hY4DZ6d/Ay47FxLu
         z08F/t1WdvVDDzZLdX65x0ngh1dB1yZDSCdYhCRK+6BEK7U0hwiVCG/2S6B1097ZIM13
         PXBg==
X-Forwarded-Encrypted: i=1; AL+hErHQZ9iviM8ev69s/B1HzRlv2+roSagm26JvZ6Ph19w/YzAWCpf55uo8QywDjjnddgj+IlnKrnyuuZQFbsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h9VO9w7MNQVIjXGDjGhUrtVKGEJ0f5cQ/KlSaDv9lgjMS6yO3
	IZrPT7L0KgAkQDnVyHSD8I/v2vl+LpH6iJEUNsIe17H4QVfcXWYJTCqBXy32VNPCZR0wTpudbQf
	4irpVN/3+Ni0xSOocRy5VF6bfKcuV6TaGGnPMlbuGDm1ts20CiY5NN/7qV4iP25hsqRo=
X-Gm-Gg: AYBFou0+eq2txU2lI2UPFNuveez0l3KuYOQQvyw6pN0d1JtXWaEd7aMBaGOSRjHGbMe
	1nP9rMoqE7uTrPsas5+k5AFUYAiIO2zs5h0MDjtiLmHYDapkQGoNYUFCSfJNS0E7jwHhxjVq1Zi
	ZNVPjoNqBJE01xofTLhjJPDFOoRPOoCPx3vMOQPi9tlmWpZTW1rQLSEWRHge0Z/WIj8iEcp61Ax
	TS9nXlJhVMV1i4Azfrq4hX/dFTHRGihLzglkZmBjVCy+Tx2xZUpZuuieEskQoKLQS42ijBcYjwl
	yNETwcVXZOS0ycwOdTM4M+mVOEo0k5YYmZoGFuQcNH8l8rjkPCVnA+9jJ1sOXutZsSRcpg/IQaw
	2PWMyx4qnApaHzAF1L5oafhwc9hXIWu51mQZkiP+Bz1+zfxg44fDUJSe9L0xbJ+5407rTds95Kq
	QFqt/sdf24YA0aZc5/RS3gT+bIPO3AkUrF/XqmivgQYhhT/8+Bb3iFvUqirEQj6TK2vZ9Ei9mUd
	rB/T7w=
X-Received: by 2002:a05:693c:83cb:20b0:372:33cb:fa85 with SMTP id 5a478bee46e88-37686a4a68amr4780999eec.29.1794458232066;
        Wed, 11 Nov 2026 20:37:12 -0800 (PST)
X-Received: by 2002:a05:693c:83cb:20b0:372:33cb:fa85 with SMTP id 5a478bee46e88-37686a4a68amr4780984eec.29.1794458231548;
        Wed, 11 Nov 2026 20:37:11 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:11 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:30 +0530
Subject: [PATCH v9 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
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
Message-Id: <20261112-08-dts-v9-11-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: fkzjWZKWpBFYt_rxRzhRKZkrTWyZtNR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX1BQxNWHrPfr7
 BeFJCSwcbN9pYFGN0abzr7jrVuA9LU0rWxCrDLf27I+zTSz+H58bQhQPOEYFOFF3LSaI86/siEr
 8ZVoKkRvDAoHZfMyZWAq0KcZ3VfXV+uMRA2PYKgIwfH+cGhhMIQLl+NWrl8Kuic9oJPvOORSQzr
 w91Hcdjgg7OIV8RuL/MkdfuASwQ6gNHeqJHy0G5ZGAguRWI3b0SO19XqhHjgsK7pJtfaFNimt2c
 H5rP0lif22PgSHdRU17QlCZSGw/mLkMb3Kht2bA9CEx8QGKcww8MElc3GN3iirq6tjC3DEgJHVd
 aB2J/Ab+c8v46VlmTG6bYD3uWnFV498u+nsnuYbDsQPcGaI/gSFra/XKUZaS04uVxo5UQxksHfH
 AWPrQzXB/A0un+anR0hSNUN5IqM9mB9EbsVHb2Ept0cm0s9chR+xoZ87GshisY9IszeQUOZVcBV
 Ap0h/BHcqqlykvD79bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX1qZx7N8SgbLI
 5yXWWIim0YyHsTWNS/bXZKy0Ee5Pt3ldGQHttjlY9O9KwFFYE3vcg1gtEDUwry1e2F6qnfg0cWg
 cZ1f0K/vL6iJN3w5Gtsd7m0DN+5pe+c=
X-Proofpoint-GUID: fkzjWZKWpBFYt_rxRzhRKZkrTWyZtNR5
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af54278 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XHihiHp7Beehtrn9I_oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add random generator node for the RNG block present in IPQ5210.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 052c2f3df94d..219b3f3696e5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -411,6 +411,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

