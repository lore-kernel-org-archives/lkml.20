Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192737;
	b=Y93/MOy0WSwFJtYsAUTHgE+I8WkNpfvS2Lxjvs8K5xDrsxfJSgGuIVPNql9D6lieYI2a
	 mJKWeHXKmsRlrPZmstj/q4o1jf/NF8GMR+TlBWnqiaaz32Q+l33laTbaPwXSXu2nR7uHe
	 fEAH0JzxI81ipsZl0hsJ4XgekT4V1fZj/0W9CFFNz8OrF1O8WINbdK1LRKa/zduMR44Jw
	 btY82WNc3F8+rNf22pFwi3WL/chNCd4SSBnYZB7DrVfEjQyJFhlqZrsTE8Am/v69tepQS
	 tQy5UGEk4spaHrkgojeDUBsJRsiosm0TjRmbq44S9+99gZH5KOvVbpE2GQhIn9Bs0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
	b=J6HnEqcNNsRJP6jrl9A4jkA9hcvSrn+Xe3TRn/t1ygwcT+B5pgVgCy9Wd5idMqqz0lFW
	 +tSk4Zhf3vjMVx2Xsgf9g1V5kF8xB4xPKHUPuVL3zmMeafkjkc8VbaetsTDisThVEaXYI
	 j937YXVLQD6QgSOvD+zddmVvUH5TBQI8LKyR51rtrGLyTIjAh6GW/K5gcIBCYwrgFlqk6
	 gUY3F3UbI2MOwr0NL0GIoo9QQG+j1Hm/G44nO4DV1CIERxa+NNr0YKp4LFJOPZx5GPevI
	 MlVSmFOCVzE+sGXaLpBAa9Hvydp5JzzkcdOaN+bcEosRLlJW9EIUkKpBL+npUmNUk/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B963C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAGu1606935
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=; b=o2nizMZ5eU4sccxm
	69Zzcq77ESHaWV2GKCTtroabump9QnRbs4TD3zNMeRCvTmiVPPbZMeVmgzyvHOxS
	rLJ16Yq1gxlEs9H2t/7W8WmtsrC1EzYPH1IQJvJce90i+b0XvBFYELU0yZW61lSA
	qUNWoQUjeAC1q6HQtAsgS3JAdQgEKuMLa+BaKYoplaNAErH0Doh7UdV0Ks9471UL
	GWmd8MF0mc0vauz9s/M6JCBqr30zyFXrO5bCD4YHmtGsX4kb8fE8EiYs9TnXQ2i7
	V4XjQoFYhRglHLZEmYBkitbfYSdpqTPoXTJ0OM2bxTLpGPd5QAREzbct9XYC8+DX
	58+GVQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j9f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:05:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ead2112f11so43600e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192734; x=1793797534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=WL0Dz8WcjyVRcZD75T58BfWqCOvMQ31JdAJO36QGp6utB8pzTtsXhXqIU2F+7wUoii
         CT2Y6Hi9YAe4jVfASOWxOG43xWlX2FJYD3ijEVD6Q6KeszLsxLfmLT/yR1jCvjjtgagK
         65o7xk6Wy8/gdHj2FBVrN+FSHjnksXYudNECm3sR3B5pxXdDbknSh0plYXgnYpI6+h8S
         F3+MjobShvwvUBVOMYLVGSmIM0UguwbEspPpAuJINxARERt6Dy5KuYuohGGrVtzMAIOE
         HUQYQkj8abeczFpOLgcZhPLbrdfre7/ME5Cp8ZUvbhd6wG4SNQKIRsKzkhUm10OOL3NV
         3dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192734; x=1793797534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=nog99Eoc3D3vesZhJuYYoTQFr/C3ZfWlb5PJ6+ATQt5ALEuCYvxZhvoKx4QTOCrTuG
         u6uexeTIKs48oRxHIjSg1tYNLSdnBz+5HrxxTrkbp3RP2SU/koilRuPWDn9RN4RY4/AC
         9ChhMfPkpu7qXlAmLPnt/iW9bFSVH7WLddeWpF4HjSINy0f/NKcvbBu4kYjQ7K60VSUr
         O1SMb+Hcs0ziCuD15Y8yNHvIuThJa5pJVpBdwM9hOpdfTBkpDSU7t2Cq8RFDub5j9dCH
         QLjAagmx8lfaObgN3Cj+GYXI/s4uWqyv0dIoCYEDsjMmOXuxFs33VjDEW8UwNQvAB1Nn
         XCXQ==
X-Forwarded-Encrypted: i=1; AKwUvByxZW6CpCm0uvlr4tvH0Q40HGOWVZlxMXySU7C7Lctyde+GIqA0V4tKs+0K/5tfSPyH5vizqBgunnJYav4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGU+/y2AjhJYecP5vEGRGpfpq2TORE52Br718hp1i6VA76J8oW
	94Q9RdNnIqJZ/ryfMw2ucgD+yrhBzHSm9U0IedluHO66yLMakPv9lqNxdFYWMWeSFuIdJoEIaTM
	TbuuY1aeVfhis2oMQj5BTwpNH1my5KFAnILaCEIs/lIZz8tJoxNUn6n1Sg282ThT2jhI=
X-Gm-Gg: AYBFou2nFXua1hqUt96ABHcJlMz7qE6REd2fcxeAhzNaZdRh+Xacq74m6o+Igy1SCzu
	RTZm5R8eMrAJ4eHnfLL4BFWHKgu3lN0sjPTnmDlexcJBTDSzNZo0MEIdVoXKkMCTpFJwTjHvz24
	BImETx/RTGmlsENFkE+E/BbAZv+AryoK+GFaYJghAjKkJ1r9cRkpd7mYSAjLIYh6SKvw1gDG1yi
	+eLPtV2eGh8aAX8g81WdQH5ctVaPTwwTFEsjckh72RfliVj0qJt9p+bXP2uH2mTdeyAvFfo4dh9
	zOZmNTVHpQEy3EGzhJqLqKyfDlpFkceWw2EiW7f/SS+H03WMRJFGeSVbPRG+LGXNmiL51M7+kjv
	Gw83RntaNpD6rDADtzSRKDMwQrRE6juozfZYzY29GLVomsihK6+zEXZisCh6xcJyoNHh8Mis=
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814502e0c.1.1793192734172;
        Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814465e0c.1.1793192733616;
        Wed, 28 Oct 2026 06:05:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm596617966b.8.2026.10.28.06.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:05:32 -0700 (PDT)
Message-ID: <8156127f-a20f-4152-8b3c-cada25a21dd7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:05:29 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfXxYpW0bvwILFj
 TCbAfJGjt2H0TlC+AOd+drSHjjvVF/iBiT1Jz0pQyF3rwUhlCPhAMHkoMeAN9ymRg3EjmYeo7iM
 DVp2k+qwJUYRpbjQjrYREki3WJcaTGs=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1f31e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zpnWK4eklKcjKML8EKEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 0EHChB2KXdIFOsxLdtKYoq0OkoEo2Sxh
X-Proofpoint-ORIG-GUID: 0EHChB2KXdIFOsxLdtKYoq0OkoEo2Sxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX6eVMWXaojg+A
 vKyCMB6qE9PesEJO7V7gJbX2vQuQvhSzAgbEnoLAhsKvdsUbyhr10BFV0BoC6qQcaq/YjCe+ozg
 +l0RrbcdEU4JkUFEiKKKN9lCBzABtS27/jEsWt40fVPiIjb2pJLTvuE1H80k7Fp7DXdDgpMEDlC
 dIpdoFowALZvB3cKoub6KfKXhf+3YKI2eIkoOfX8TvoX5NEwaoG2tnIEwquPHL5PK4foCbq5Ti7
 gZhOzzNuF1rD7MWCb0QqCK8fcpFyCjggWk/E8vpsGEoS7Wu4IdoK9x7ZZqtJ5O6R81W68Jt0InT
 VGPXAxj4eHrM7JfFv/6VDHAz5oMJcA2YmCIwSWuzwVa0rP+y6V1TS0rR0e2B4Jb1joggzcC82/V
 iG+RM8Zgacz+nHTMTP6u4vWO6bDwAX6hggtwW9odhJP0GnEurgPtjVSReH7eUEHbBTnfGU208kH
 iHw1lLq7i7Y8xrppzPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/27/26 7:08 PM, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
