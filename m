Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315481;
	b=xxoigpaMQbeV+696n/zDNtIGCH/Dlj2kYYvdgE/Py+frHKABmf6z2+1vpdmBffr/BoR1
	 Su19fa7I+0s7IEI9Br3wn09fimwW9BoVmsN31BGpNIse/wDkmA8Gf7BXqIS8sL8qUA0jx
	 1PzxNEJTJeHMWY+X85IkmmTrRUpAdd8f3I8TH5EbUOyMNY3IGpXWEsGSxT5FwYqEbDIH4
	 lh2AHRfd4wVjXWLz+Cm752fIE7IsEa/4c4kCzU3fdLb7T0U0w+rGDm07CkW1WLkI1n3/O
	 8s2N8lGgZzNnvp5dkLuGF/0294hdb8znHm4C1xRRAHva4AYaYalVbcrI7VVUC8V3C+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H+mwwfBgfHGTRg9UaddozXfFfAVGCo+7WdhMoWki75U=;
	b=sNldtmQkanT2A4rKTxAUIQtCYnzyCY8x4OAIEDbhWRMT2pVl/Q0hynOr4RAYB1PCp0i7
	 OHjbtYrHUUqi8BD5/3JTvbEv2mcqjxIBTETMNbeNyFcwpIPzEp4TL6N+R9Q08USVsLiPW
	 hSsSsfqOBvqVJanRj/wAe9dQSrutlVlGKoTvfk0x5g/z2yR2mQGt77PV91FgHmskVcw22
	 0i37fTZqH65Eb7VFsl34bnNaOzwtC/DZ9rfKEVXfrYHPjnePDWEUQEU+JBK3dqqLKS25E
	 qIoZC8foGJqzawpwHTj5ZRggriuxP+9zbj54QND2Lw1y/13fcI88bL9JzslvueLMoCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJ3TAB2F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C90BvSwe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15DF606B2DD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15DF606B2DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJ3TAB2F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C90BvSwe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAJ8D2688237
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H+mwwfBgfHGTRg9UaddozX
	fFfAVGCo+7WdhMoWki75U=; b=lJ3TAB2FoTFuUj/1kD/GeyLffEzjID6ZEaHA5B
	gaD9NaS4tbNL7wLxiLV6FqeeggxnTy7Kw5QvsNyKv1lcPFe1XRN4vxxbHripYmL0
	A7bO0h73eE/Sqy3C4GgzM0ruU3+bbLeoN9vZxdagX3BC6IEJu9zKOtQ/98Sxg0Z6
	SaM0SVELxxwTE0pAKPDSSYDCRZUgMPtbWtiUrKNSM/YLJbqOIWOlZ5444oEGV2Gg
	UEipX1nEfdH16mXR9BzyAMXq15punf2QZtEFWAasFSzB6rraF24H1HhsG/lrA38u
	YVwc90aPIiDnVgfPSyB6rIDiP8YhwtN2+ww83bOxlCy3y0kQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp2105-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:57:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d304016194so488663137.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315479; x=1794920279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H+mwwfBgfHGTRg9UaddozXfFfAVGCo+7WdhMoWki75U=;
        b=C90BvSwe7f5A/NR1qO6eAZxHl0FtnLKpMqWq0dqz1fVTzg7rIPC18rZ8NEt+iMUx2k
         Ujgpfqj+RvkLr1t5wHfOzXrr4nEZ2FqiGmvHtFn+BZcgN25Fr4gcTEehzez1cRqU/A1E
         FUhf/futHYwzkfdYNpI6wv6PbhrxlHLkwZGBadXtomeIwXbOUbmUPg1QqJpBShBL/WLZ
         oAeD2dbprPcyEY88sv2SblY/3LeWgTyjf2H1VD+ICvQ1g35cu4L7TPjqWN/0tZ0xUzG8
         maqRaSw4JTX0riX4sWFMMS2Rhh7t2a6sxeTFyBqiFKWG0FyEDQyf+3mtanlXgeh2RE4D
         KPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315479; x=1794920279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H+mwwfBgfHGTRg9UaddozXfFfAVGCo+7WdhMoWki75U=;
        b=KDBQAi+7T0mc7P6B0e9ZLSsF+ScvQHiQTI63zuy93bp6pPdqCZDCDfNBfBFgnaOkDO
         R0vwBdJF38aKJxM++6vs5Mc1Yl4l7MOHZzKGsRrNudusUJskGVcoLVrQqF5EFAnfi5uK
         j6SKZQ2XHHzL4DFMaByEngsYMte5MWE4HIEq1LDDSdssmZZmijVaXMogPbuv2gYwMN1f
         Q5wWCm/9gw7pfANGUigCBZkNDuH5nBRaiZAdBt137+778jeDEvODzinIUEnBudhguPFI
         iLDqDlJl5Snyr71JU/3l4HlpOPrn8Fs+VKCrnSuTXoqXFc2XUNkU0pUk05MdG8/Nnr2j
         0EjQ==
X-Forwarded-Encrypted: i=1; AL+hErHL0s+6fcSNQLot7xlvdSH6jZWf65Uh5X5cyJ8t356S8k8A5BWQ4FFbCOTKVHm2mgkKClX+38NYy5K4ox8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OwxyvfCXxEWZY8IaPEah6AQwgW0WB4vVaxip0JTqKr4Xhaoq0
	cIdE59JBRi6sdfjZ4t6OweKALT1ax1epp7rFdNH1Ld4MDiL3oakZu+dbTjZz2AyfPKNKEAl2HNy
	S3WvOvE9z4JKTKyQgRn6Lwt8bhP/RuyhoVnw3Bdy4GfjOHOoSsedIZjC3GbvrFN83N2wTQYVXlQ
	0=
X-Gm-Gg: AYBFou2sGSy2gAC4/uWeCV2cva2CbJZUuzfBNz6b+JOV1dIvpl7xNCq4gY1ZImS4Sp1
	WYwIkNaiqMXJ3dOk78Aa1arC7lra1CnQv728zPchT78au/9Qe4AezF9NqQGymHWodwuyx28+0Lf
	2/n6K/emEv77dlxmc5Hrdn86RwIvLwb0J+lxVhz81PBc3TNGO/rRF+AOAEeWRCudPo7ZZDK7ORC
	Dc+R+DCKPievnNjZZ04bPq1Kkx69FWJ971ocdy0DYIbfEWfnvo8KMujAQFXQWAzQu9rAnCO0ooi
	qcSVl0AL1GW/+DtrkXm1aqKDpN2hYqk3rToJYmnNUmsmgpGwh4+uLPrv/8KA5RRCLMDPgkfsbOl
	JLW3hy3pdq6+7mh4Fyv4WMTuDnAeRfXLFOQsaqfsCUhd/ZJ4rklqzCwMon4JtrX6P8tswOg==
X-Received: by 2002:a05:6102:2c8d:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7d301ad48abmr861884137.2.1794315478884;
        Tue, 10 Nov 2026 04:57:58 -0800 (PST)
X-Received: by 2002:a05:6102:2c8d:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7d301ad48abmr861866137.2.1794315478372;
        Tue, 10 Nov 2026 04:57:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm58422365e9.1.2026.11.10.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:57:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] arm: qcom: display/msm: Require DSI graph endpoint
Date: Tue, 10 Nov 2026 13:57:41 +0100
Message-Id: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g1MxIr0KqWLOEZNqTpMVBTx7
 p3W5Vv8f4BJVDF4ZAdEWdV0GhPoloHveewEtUmG3OUlETls1MKHdxxswKnFLnLokV1FfPclFXU
 BKQ1RWt3+2+frsi31W/z8e8F5fgHK9GyLeAAAAA==
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2992;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/tEHBo/1L53Cz1wvKQP13TTvfSMPe/VgE4L7czNBqRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xTNYKySglQ0J6E+qNdJThU9Din5uwEj+/k6q
 YSmAOg6wn6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMUzQAKCRDBN2bmhouD
 16DtEACW7kLeMUKsxhWZScVcuTXcpHcht89n+bbmV6jkN+byb9WiQTXqrUZXRyrbKvUXQeVS21Q
 q/D3M5SPkoGVpO6hFmTPNPCxD/PDAQAVuz1XM+S0dWofbJNUQTAQReOcXrRifj5e+MpJ14MSi1t
 3prdLR4aF5bcvS2bE+M8JQtPT2O0JfO+Hup5OXvropkXYMU3uWqadvvHKPEpCBnt0h2LgyYaV6D
 TQKBhtmjEZn1xc9yoPWEAPvXTOUm1YnXtr2xHhR3GF9tdHUX1juGSCD2LlXSBl3qr4jwlnW8FPp
 C0ORUwPgbmvEAbyV4kYf5MLAGzHA/pMLdPu0aIGuAaNUBtauUFIzeM58bYp8qZLg1wvmEpgRXy7
 1bSkDOAWnS+RfHFO4yOdsWG63Hl/+TER3zaiCMe1s3U54oTM8lGUdFQRZZaD5Dz3jrMw5VBdiPR
 8Or7fD7Ow7MC2ge0fFy1rsbufmQJgByoayi04EP4AYu3mmn96IY6IUIQIzRwcuNaBGPshLvrYA7
 H9cQKQMvdzk/X6j5NvKSaES9TgCdLR62ItvJHmjR0pvXd2axnKJ6DtFDhkKqU4KFMnur8gqyMEv
 Wo1FAHi7CfBEogL163vFaYb1+eG5J2YrXhQVVqeuzliNzN5i5qtxFc2fO+rG5ys2XmOyGg7qeTm
 T7IU0bHdRtlr4lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: buA1HJSlULUpfPTeHKzxW-2l0TvBJynO
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af314d8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=569UQr4CCCqzOnBEreAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfXxZ1QQ/fTmTuO
 5WOwi4JRnAWgRMp4SEjIKcrCbzr6f8HknVGFUIATacIKxkTD8sBcJYrghjMeVfxK1Dltb8Ep+fC
 VNY2xHbJsgYZs71lLzKZ16oNgQ1WWK6SSKT75qc98dHeE1oRGk+iq/O4PaKYfR+f2FitFOW4cmQ
 Mef9w2Tkiv8NlrNksYyBd4qHRibGozWrMoXj0mCdyl9c91cZK0GjP7kwuanJr6HsZvVfbzqI5AM
 pRreGE72hYmhceIEpTJQwAjyKEEL3BfEIWpYdrmQ6XkFQGcz/lsHuaUnt6eXCJetAE2cAoZ3eaA
 wfco3ZCRJMtzOPbvecxgAllCUzKf+j57RGyFK7lj9YSoi2eSsq+5w3AhZVn2tifbsK/4BWdvdpV
 /zi3lSFlJu8WEIhLR9h25uKUntkHh0YJGUKT0BNab1s02x997kahibQg+Se8odjJ70eOUl0l4U0
 TPYypWRAePmIi2o4G+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX4g+UxK8Hdir3
 23WmoO7OKD0OVSeCNLD42ahjdNkCgZcVBraikyf0JEv5SWwAVhQ/f6ADA+4NgjS1utYhhbpSSje
 jG5GPxgP+sfwQqbRQAfYKmSDo1wd7tU=
X-Proofpoint-GUID: buA1HJSlULUpfPTeHKzxW-2l0TvBJynO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100051

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 31 files changed, 76 insertions(+), 5 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

