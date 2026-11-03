Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743831;
	b=vSZOM6Szt22Wo/RQiH5IFRaCreWl9M/WTl4Sev2ozxChXrc0a1MoFBHxxcVBmkMcqpIA
	 ZF4588IaxGIyjpbQWxIKEfe5AIg1SRR8BPLvwmyVXNimwO+u8wJ2hGaOhlXJWgb6F9yaA
	 HftQA8H4eZD8MmGIIHw/kzO/RCFGp9HyICyw2GeOzWn83KjUT5eFjcZQIu2T0JwNDXub0
	 B00XCFUJXMCehiSTBpE91HhphKOoOazU15XqaellfR7HHWIJScoH+v6mSnsWhIT6+17qJ
	 ODeoSplT6i5d0i+c3N8Rg56i7C4aTYJJPIBRFMZTE+kPWeSeebDCLgXR2Ah/dwHAGkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
	b=z5Vete/qngKTWn3pYz7/81cHJm5h3WXU83YAxFb4w6HZLTMppwnwrhTR+LMx38O/NRK6
	 LkiFbbPGpprGnaG7pZX5+OLFigvkKNuuiVRxRzVsl9WA3T9cpL5mjXChKTGdzj7R/v1K5
	 O5PqTcyNTxN9Yg05Yo7Nixfc7Q+lh5c+iqEcJs7NocqwBXaIbpAAMOswlhMHCR0ZiOUoi
	 zX6F5oHIboy6K9WiB2WImbk73+WVhWlby64etjAmAbnKJxpTWo3oA+59Wi24q1fc2+VWA
	 uKDphcBdPbSPwTGgv3sxbxImzUTx50iBcNtewN17/yq8STYJ2411CmUK6Ct9HJH7frg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a+E3TXTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC20Xwo9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2899606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2899606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a+E3TXTA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC20Xwo9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKeh73993600
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 22:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0C
	GLMPxdd8=; b=a+E3TXTAtAfPkCzOzNlfiasq7aAxxHyXpI58AYJEdVKtjGrqi4V
	GRvVoAOuvZhfNw8SN3kyDG8v7zYlWN4rOibIzz851iyR/fcaJnjzRFVlVJcVcsAY
	rgHQeNnitb8gtUhGKTQlA2P5TFhqJo7p8A4dEaDoACsnrhc+Gvdbjo+ZBwAbFX+F
	ehXwxc1Q18SB6EvEW7tspcipqThEYe4PxU669F1NrIQwfJRc9g7iCU6zR+WJZiMK
	XsGL79VxonEHwYcx7oUOjTGLdqj5Pk9LGkB/PVBQ9EA0eZnU3jbO5Pd3e8UXyuLf
	HJyZBuxCNNkS9xhSVA2SAvQFAAE4SLABIFw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ngp3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:10:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso249805c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743829; x=1794348629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
        b=DC20Xwo9leZQo6LCS900ARLquIy+ZqenwhjOznEnP4SgI/nZZCDf7umtlpJ4CZ2k28
         GV3jMZxJs/xiWx1v1qVv31a63nOIGrrNcph5EDj72vGQ0kSva7cCiLublSAyTdQPrhpN
         tLfzL2DCuKREE6wrMcHkuEbyXWpLlTzxTeh6i/OcC9rXnAUVjwwsdn5jqFZCNfEpsR2L
         IGmkLcPDKEmDsyay+uqKbqxj9q/PCNIX+PsDXGLQ1IJ2cG67G3oS0kb7J8MFp2Jw8jLG
         eE4jY2Bf2zc5llimsjLUlTWg3CGbY/77qNXJ96PQc3bVfXl+IjqJf0Xn4yLy2PtFsVaQ
         SS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743829; x=1794348629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
        b=vYlQ4NiTvvkQuD+b8w478s8xIhs7dieWbLmAEyh8QnUpVsv//XcGMuc8aHIzKQxUEY
         fPAH0QiYFtr/F+JUseLsQWan4iPBNd7UsGX/uxskcnbAb3kVhfVyMdis28Vpgu4xP4AB
         3OCoqlnkjE/M1mGhsLZEdu6cabXmqUSBEdrSGh8iy1o5AW1S7EANCDrihWYQgMmi6ilU
         +qxVJ31yqw3a+ncIP9qfkOWWi+s9AtdnSfaS1dT8QJPTp4P7d9Fz71L+DFDAZdlxjnH8
         tkpOTeQuEmGGA6hBOU/no63CqHc4G4rfmEF+EuJhQeF0CU+VV+itPsa1nIay9NjvZj9F
         7n7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlhEBUFZPoSqRoXdPWYTtdr1n/lWb5LM7tRL5ecctM03gA8qi46YhTaJXaHH47nQT66rcXoJKIdbs3yPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jXmwE+u6d5LdkPKnlQR3ErTd44bnIyT3S0Nx2bFzM1MS1ku6j
	ftKiCEaRk79REvXOAz7VV8PjJuNuYKZfGm/zGVOhsObNZhpD8T5CHImAT/kB6lEm3fyyjQ6GoaT
	8o/+bMWsFtFQ8zzNeAWtL3u0ttDleEOsPGySgrwyfnR7oFXjMtPhQcUb9/Gf3E4JCJMA=
X-Gm-Gg: AYBFou0y7z7G2vpji/SHZYOS5ErZeX0QVBRQDvNzA8nb14mKusmtwOjKFBVOZ8e+Lic
	v6XUfkrPpmWvofruwr7DAxKJWUmFqu99UMiZX0yCUuaEONTuxDFFBKEiY+SgH1Qdg3GgK2pLPSK
	8w+IhRzl7Y+6LoMTVBh4rfOH9MIoAnHnAUGyxeJh+uzwtuXfYWu4rBoe6eMvJoNsewZOXken3ie
	nwBUIED//WH85E+xcKx1n7RlsFXhsmCHa1QlHWa9/GRA5K/27rLPRgl0YN0OhOTpQGWpNf9Kf/y
	aRrFvaXBMS9/YX/5zxjOue1oKZPRXPmICcktd5iCtyPB3WIoBD1uw587iaH1NcAjpPX4cz4ypmB
	LVe3OQWEdbgwaBOMH8SIVZlBANTpaS7a/x0DylJTUrtSMY31jSxaogIJaFZ6aTx+LDZkGtnN26R
	fe2Lu6yxyc5XcLGuaTpbo0XjBB2s0x
X-Received: by 2002:a05:7022:7f0f:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1ac59fbf8dcmr21265710c88.14.1793743829137;
        Tue, 03 Nov 2026 14:10:29 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1ac59fbf8dcmr21265658c88.14.1793743828301;
        Tue, 03 Nov 2026 14:10:28 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:27 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Tue,  3 Nov 2026 14:10:23 -0800
Message-Id: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfXwmybg+sAREig
 /uDb0qtF+rI47RZSDp26ORtkPyq1kBoHZWLIQZbccS4pxBCuKmPimmqakIQTFDzLvXbsIfuXk3c
 D26V4tMtc8v/JqCaro08sI3OG7NN6N0bqCaBNQQKCArwyy7s6ye6oi+WPMS2YVcHcdVo9Mkm4rT
 7vvlyGvtzQKToXm5mS4QUazofakI+efGjTUK1iLwwBmXYhMcVTjMtyHMBYs33VUtGP4mJOoVWiJ
 03S5BDaZQVlPhtMMETLvgrmwlagszAaPHm7naXCHswWQ/t4DRYW0oHk1ALovp8AtOV55vYwpfKM
 mo8XJMw3CU2Yiw1orFPb1SYJelXKQBHWKGml6OWQ+Hlwp3XSxb26EZq3T9CJHfoj3tqJ2siv1QR
 g7mSGkj8F4t+TfQSNB4lfizkpTFtVY8IXqEtjMen7u2oFY4miiz/Ru/0d16cpcjIeBi/LSMjhAS
 n6N9jolU5dO8IlEXi/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX5PxuVxO+36Rr
 MgTSO8bH4u/eJrIFI+2bUtnM9PlGplijN9JZCzjQMB7UM7FwxNkS1xO/BMC0E5dsBhBA0iFnyAx
 KQ+I3FDvr8dx30bxedRQZmg/5LfOuys=
X-Proofpoint-GUID: _MlhRlJbX3_6XniWtZIQsiNGtsWzWUFL
X-Proofpoint-ORIG-GUID: _MlhRlJbX3_6XniWtZIQsiNGtsWzWUFL
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea5bd5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=75llkZfwqvS44bKgfqYA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
PHY driver on the three platforms whose compatibles/soc_cfg were added
by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P,
QCS8300 and SC7280".

Each CSIPHY is exposed as a standalone generic-PHY provider node at
its existing register address, with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
picks the non-legacy path once a board wires a sensor through one of
them. The camss node's own reg-names/clocks/interrupts for the
CSIPHYs are left unchanged, so boards that don't use a provider still
fall back to the legacy in-driver CSIPHY handling. All provider nodes
are added disabled by default; a board or camera overlay enables the
one(s) it actually uses.

The three patches are otherwise independent and split one-per-SoC
since each touches a different dtsi file:

 - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
   qcom,SA8775P-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,QCS8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,SC7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced above and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 140 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 ++++++++++++++++++
 3 files changed, 426 insertions(+)

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

