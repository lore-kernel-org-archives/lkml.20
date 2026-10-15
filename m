Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F44DAF8A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055446; cv=none; b=AyTLACQ0zMfdxZoiWBqOed//Tp9e22OKqssKaWabA51w9m3ZMlChSEjAOq/b7QRd3579babHVbAmSk6jQd+9gZUmUwOvQeeAWI5FBBKoXXT+h0GNG82mQox7P8AHVJpMnNTORMBuNPt82yE6z587o5rcIXIZVjaiGmX9e+bT4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055446; c=relaxed/simple;
	bh=F9sCs/Et+Q8r2QxPlaxDRFhUFrobaL5SK4g9Bng5fxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPcxHW8sduSE6TsL2Fr0V3fH4ltMGvfs5EIw+vPrKw1l91TApaLvbToS2SNk8X+M3NrvpRq4hlKZkthfplNWLFNyz66YpmCSBFiIPSyj9U3EhmSNysF+3upboXL4QZXZeeNV9l80CyJGt2Aci1U/9dkFfZsssy/oXEUbXpFT2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNXqNt3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXDcXkW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNXqNt3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXDcXkW4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7lkWv3468841
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=; b=lNXqNt3tkE/p961B
	wahr3Lmhg1umEwgGeBlbKzdQD6+6DynIJcumsyW6FdgTDooOm3yrmyvioHialzms
	4apGwbfbo6HiiyUDj1e5uBpp1Ee4wERSV7RwMiy596LX/OmTC4reOEvy51vIHXm2
	ynGUNLCBTYitPT1RcFUlTqM5l49FExlq1TFFBc04dxFmK9M3f+1IbifZII0Ndiux
	taB/MRxOO7o9Jw/b3Xc8Z9JLQLWfZlV/p4OPfYk2qSS7vS6T+Z1CmYIydDcZsuvi
	KZ+71i0ZmtUzqvedLDcuCYCk2u96iDIPO76GTZpBlu/Kjvgj3KgXi7xQ2ui3/X44
	QLkjrg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7besf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:10:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179ef12a03so17125156d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055443; x=1792660243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=;
        b=XXDcXkW4vBN0JoNE3z1c9qZI4O61kOaNxGwjwkhuc+bhwN8o/LSMFn0ZHeIFCnR8DX
         u/jYQp0JjB/MGA30uVLbHYqvPbRM4FbPZplzLuh0UWre55vJ+0IKVDv3S1W6FLR2v8aQ
         tIQjIRxFYUBOPptNejNf10Gx3d5L+AEUGWIAIDKQ3rH52tnI9mIFgrwrfA4sHC7EipZX
         DYuq4hecOfJVI7y+D7RW3vtqwf48Wok2sYucCUUuH774SGcmDGjuOQ29ABzTBMy2HNfX
         ougpyr2YNSRMMsDxCsG7irJi3HSQxDjVkPce4zyVvAUwFVsVaHQBssNMc+ko7uwEHuTY
         2poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055443; x=1792660243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdDwoOcc/IZIcemzbEOb6Rk++kVeyFBUpRdmHijaAIM=;
        b=Pu8cC2XwEs48UsEwfto46mAVMVPkJ86jrMTTU27aLz6UCSao+xgOJz3MKjnbAo7nBv
         dtu2t50UTsU5H7N6zgdGxhndMhReFe7ONtcliVPtPdNc/8a0UTajsummMChgricNXKf4
         OhwbtRzhDEniI7S7UYbeH4jvP7o1IgrUgx32L5pPH6k9Uj3AHo2B3+L7eXTGVXjMUkV9
         bulpuAPP6CNwUGLAhuJBpC0Yeat0EvK0FLvLrQaU2fM0oaWafxR15ysJC7cSZz1inHZn
         OBxrX8wiF8w6BCjx6yOXsMCIF1uDyIbtCFeBE6Ai8nsNg9CMRkdteuGYJbnBLHhTRXeX
         hrNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3w7x8zOurVbkVxTXpo5Ea9qT7Hq378OPC/shgpP4aS5np54ruQaw7s7niMcW2LLbnBsBuSLg2iLeWedQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn5uLhhzDG8mbYS7+HKqRcR2ufPyTVIGDGC8U342xpF7OpbMFM
	aEa8z26q0vTDW4arJJ6JZ6764AxNQcySXrJPXZ6/Qq3ehx697S2w3mlkimwf+QHwvOfEVMZ0OpE
	j0W5CvkM6gESbEJb0Y2ilO8kmQSrzOiHsZj3xAsLhY8eTu//Q/eI2gGxCXNpEsL3gzO8=
X-Gm-Gg: AYBFou0e9iVOxYV6rUT6m2zXNFd/mi/lhsRBNW/pN2kJikZOOy7GVtEp2ZkLovUN1hY
	5kCIJg2c1Mh1S/oWf8nhGimncwnHIfFKwT+/FeUHkZoN9N8k9Hn1xRuHmh9ZNd/Ct+FqbSqn1Ok
	VXM7mo2nSNJDEwUQ95srDVr58oQJJsiE+CRZ8ADS7rUsatLW8zsv7uMIWjmEuCNNfNPGgHLXzfL
	7chQmBd8WnO0Trs/Z9Qx7IlNLk9kFCOVcoTqIcZJI0BvrCNTl2Tqz4Whqhcu62DjPy//wISGMUt
	v1608tPlgP0u0RrIie/oPJPE6CrJCsiqI+MR0y+jSwRiLEfJAAoRFCFAzCMNZdx83gIORh5R2la
	luPYYmz7KuUE4fKsppj9JRQ==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3641737185a.3.1792055442394;
        Thu, 15 Oct 2026 02:10:42 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3641732685a.3.1792055441898;
        Thu, 15 Oct 2026 02:10:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038abf24sm2188025a12.37.2026.10.15.02.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:10:40 -0700 (PDT)
Message-ID: <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:10:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad09893 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7g7iOhDP9QsUep1Qju8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Y0ONFl2w3_g6vcfQwcn75iGz2aA6ew8H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6Lq3+iw+Z7EL
 zNqcZvMLpp8GySBRErL0QhCNY+qNulaZSwmhit1RVrSVZDUS1Auku6X4snjPMIyyQdfhjX+wOoV
 Jj3uE7t/D4Kms/aLJFDODQLnLsw/CTrTewGSpi5Vyc6VUuplnsudO+GCDh+FYHU+jHU6kDmn+sB
 G0bOaeoFc0cJ+cG0mg7ilSFcZ5/lMt7fa5/9dTKRT5i2VRxDWFz8IXNqmSZPIP3w5rrQAyef95i
 mI9VZA4I4CBLH1L1Fz49QRI0rLbKHYLDg4Ta5WtSYxWxsBw2H1t5tFMAfwP8Vp9cTUIxlwB2Ufo
 ecsWSZI/MgzgQZ1ajgwHn8K+IF5uWCxGhy2UxCRVvEsys+1s+DqMfmtU6jH0+JAnZWZqMUZ/8Ty
 hpmvei/w08hdk3DXq0qqFW6RLTg00jAMaazKjtv1becMGdWhxcnApBqblS1vRsN4LLRg+rEAbX2
 Zsw0uK4usD5l3YlMDEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX9ySsilYL5Uww
 FbJbV0UxKN4zS8lBgOxs2rqYKilKbSckOz3KEG45oZz+GaEohC8NM70D4EmhePIuK1gjDG3D8Pd
 S8bVxPi7ciotEGBQTfqg6+agPu7PHYw=
X-Proofpoint-ORIG-GUID: Y0ONFl2w3_g6vcfQwcn75iGz2aA6ew8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> the wrong address the mux driver fails to probe, the Type-C controller
> and the DisplayPort controller keep waiting for it and the display
> subsystem never binds.
> 
> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
an earlier revision of the board which routed that differently or
something.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

