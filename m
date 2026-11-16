Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819649;
	b=sFPicrbTcW04ifVpttQGW10PY7zl0SQ7Mrzl1hoNFC1o500b9OrU1CjbsDibOytTwY9t
	 fTBV2Avi2fOewdiLW9hOzqiTvlAK6DlNw9E64MAb3fosisoTxYi9aKWG16sqvhENcRoba
	 wzHTWp0DpWeApsf2aIhI2g/GSmd0wLGdn9kQPtgOxmj8hkXgZSyiOEJFd7ULBX39Sjdi+
	 /7pz6kteHvx0YPtQw1R39szIwmImtl//pF6FMq47ZooMcPZcrecu1MtHw2wnU4xJG6gUq
	 J2CEimlDakLxfjyt4vv0e5hBcHYHV9LyseEBw5/+XKAO4ps+kNYuxuISQomA31TUvLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
	b=FEmZXz4vVXdrsmADvjfQM7iYWXmJsvwQFdkdsYWvtWoWH468yXWTAmYJSdRO1g18Da/i
	 45ECnf/6I+wW7cHksST3J4A2SnpcrlK3bsP6W0uD/zlv4IWcOS9iAEXuFFrqu3y27P68N
	 wteErGB/4qeAp7Wwu82BPKv6C4P/MzALxfDMiFTbCN2fH3/WthX0GKXvR1CkKAFMcMX81
	 CCuAFOqm+lLF7rL0VlLzn+rx2f8Q9NYRzm6/IJp/rES/uGRHp2kQ8LrK+XijnPCXToHDv
	 oeKoWAzsOQuAPxU8X34Mr7UjRjB4PRymvgDgKb8zSv9j9dyXfbJlQRwZsXpwVM2rdHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuBHWLza;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMfyRuuf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11168606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11168606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuBHWLza;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMfyRuuf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7f3Pp1633229
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=; b=cuBHWLzab3S9cxil
	GCu+NrSE5S3uRepdZc7HL4WnbmISgetSMWzwctddIkA5FAcrvkOI3iX1eoKoXSd2
	g7uzdgCDkWaTG0YTXkfRpXF0UBUdx0bDhsqraqY6gjMpzPy3giTeA7y/OEhgswcL
	nwsM31/sMC1vgmjY4PcDa5s9zcSDkd9zJa0IdcoSzOjyFOi3ggnMd2rEBteBacm5
	iFuY7YRF2nNR66aJosdJQx5zm3y7qGEWtBauiyXvJ8I4WbUMbYS0CrriWfUaIjCt
	BtSGNICVZeL5FsqvRPo6j9fVLjsnEnDCXLcbT2E+IWI1OzauOVyvVodQi1btnuUA
	BPbejw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmanm34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2683560a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794819647; x=1795424447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
        b=dMfyRuufJHLH5ntW7Dhy/WqrbG/w6yhOEwxWuoBirjBIHWUwDbsiF1THECRG7+jx0V
         8mjKmFgRguCoe5ILsZufW+D/r8C8ts5u0lztgTsx02ruTbReha0zRV7BEI9j8fWlOclP
         pb9CgbLp6jugPcWZtZjf7agQg+LGtR7Z80K+6Ff9QgX0riW0d1etkLu9X4fcTUnTv/Do
         ak5loPX3+uBEv2NP0IVYVxCAfT8meTRKmL3LfPU5BkLRBjMO4OiUsmQibbyVGnPgSwGN
         eCZBXE70Wv9lQoG5zX0WbOOBzsRbhzcYNZTbI0yZQdcCzMgnHG8+5ZaQAYmK1s5X3sah
         vl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819647; x=1795424447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
        b=NgH84SIecWJfg6DyZwzCYiooaRDFbY8OMgN8b6UZO6Yn5XgCAO2wc2KjdVU6c0PY2U
         JfTE3YjVE+635VJvTN2doSmVHuXGn97w54fWObdMjI3Fk4x8WbxA3gMYDeS0KcKu0w8p
         hBtwC7xjuCVSz1vf5+tGJKpiiGFT5y4rfFmflFvoLiXkSCiP0J88xY4PAG15ibU7KwI+
         XHvpaRhh0mCQAY14nNStuZSs6AoD19qt1zuodc1Hgnmfd9/7v2ZIk1F8GWMbhUvg6rb6
         3yYIY5aTR36vlGd5IBhl9ACXCK/sA1mr0yrbSu0TNMzFV4Qf9L1anTqqvSSg47FwFUC+
         YDGw==
X-Forwarded-Encrypted: i=1; AL+hErHQ12uWe78CqOMabr7L46lsZ4hVOADiBzK07M2W4q+bGLoKwMtqsbzh7N3OykqsXUGkygnCyNL9X+hk04A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wBqVJu+0eDj+qXSOw73a1dzgG5U+4aeoMtWfDeRsRpi74cU91
	ZUBGrghJi00vhGpM1Bb3Mli/+1fkYiYHVOrGbbmrGZiyavGBSUbI1QIETnP0TKvOrIwlK3lovns
	ncobYjcAsPJkftPReHRowDY144uYKkpsdOyuqtYkEpXmWVLI7eECGLKkbKBhvFmH2vyk=
X-Gm-Gg: AZFdTZfLvTgOFtk/qftf6I9qRsE7QD9vvSwGxQUlTGmiMQdT13A1+0zJRXH0NrQRw+N
	RQgPPNXvwrMjazXocjoQIKA1dwx12Qs0qeZFtvzxJkpVPjyTFSq9vnueazl+FOfy5BmMRO2WiGx
	SP4k+/OXNm13qA7SLxFIBUnIPBsju8lX2WTHu9QRGj4b3YWjG2CJxWIr0e3usTJwYtj7JRmBaky
	iRPCHmK6aV1g6wIgUQurROfiiM+fAGU3hQk/Qs1teGaMDCii71S0Nfj3kdkE12YZgF2w35HNxaV
	AGGNtYpo8vR0hJtNRFosk4jr8ajsNhxeuHTyH0DaXB+JfQddCLnLOJWAG+t7P5zAla7CoT6tAEF
	Qy7TeLhlEfznOP6g0lWpxiCjXGe348ZOOlyKaz8NxUTJa2g/ffgEKemRIHh/12KnL/HKr3wHPUt
	bwML+XjRI=
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr9345826a91.16.1794819646693;
        Mon, 16 Nov 2026 01:00:46 -0800 (PST)
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr9345778a91.16.1794819646038;
        Mon, 16 Nov 2026 01:00:46 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm15916632a91.7.2026.11.16.01.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:45 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:29:46 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
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
Message-Id: <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: u5DtuJYz8N4aHgnVOMfsKNcTP7c8tGWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX/YAxX5pn4l5q
 tSu1Xddpfd4oUoqzNfGS/slmHK1TXJzjaMP7EQiBHXyNDNjzduFg529CWP6w+TKzlE030zddChM
 IB6N0hOj62//YTVhLZF7wE0qyG7VJlLgtWACUOLV/wQu6cYlq6K4fPAadSDpenwy/5oSK4BM25v
 +PHzjch8gew9yYJZKTnINNir+7qee3tsU6p8pMcje6z6vMjBu10otUc+a3XMpBsTBDttJ9XJa2I
 xTpiaAfoD+Mb4HfM70QHnP6Kbua5PG/1fnUUjzQOjuHJa/7quwtTzar0xuIifVEz1D5wmixB2kI
 ubQqMFEOJFLwfrgGT1dKyeBp+iIqA9pSgATXyPiDBKvfF36n96kl34E1UxX/0/h/m3kA7MCX2eL
 mgJVjQB6/FNcYyf/kVBYwUz6fT2Ja2C1DAYAx9JJkkNWgqa+AEdv+PNX9AORBA03v88aHKuK/Es
 BG6hEWvMA/zwTYCs6Ng==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afac63f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=edzx39f0doCTOIfZxx8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: u5DtuJYz8N4aHgnVOMfsKNcTP7c8tGWT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX5p408EMhNoIe
 Rdq6OuUs8KvgQmQEh3sSz2yvg7RpOAsUC74fDAxUOr4l2ZPSMFKloSnGo2IZINjrgD4PWHpHDYZ
 M8KAkGHFHxBVTxdED/2J4LHiomoGc58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160035

Shikra QCE requires an explicit core clock, which is missing from the
current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
and specify core clock to match updated binding description.
The crypto interconnect path is already described by SCM node, which
votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
the QCE node.

Cryptobam is controlled remotely and its clocks are therefore managed by
remote crypto subsystem.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..d5f0ef863173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1208,7 +1208,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1219,9 +1219,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

