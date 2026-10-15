Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C2518128
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060822; cv=none; b=JDwHFonyXBbDjXR1PaX8fC0+FfC4l/Ew9Jp82cOFyIK5QLyp2hhvKJ3DEBqmNepPuMfnpXwTRmupv2hdCwtTZ0QUN5TmCnUx+TcsS2SbKfU1q0aTtqVe9kA1Ti76sX6pYnRTwDxrPAn7CbNmReO1CeiJJq6uFIGch+3OkNYzGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060822; c=relaxed/simple;
	bh=wSNftRjlmC816H3vVNI2YUYCRfcrqAPU8eOTfIKmBEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf/EMKdx2rmuKV4wwdmLqOkmgpV2c9oEzvfT7DRkbL9Mx2L3ze6ZQzKk4NYvEHinYRQyoXrCirNQNUSma9thH/GdlJgRUvCTI36vMsTeKoAy7zZE2lhcZQhEb1IaM59XlV2bTYSIIQB9OtmG/Ex3pZD/c7LBVd1zgdurS6Cc3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a30+kFIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iqw2fcKj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a30+kFIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iqw2fcKj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPhtj4100240
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=; b=a30+kFIREsx8Qgbu
	iEq6xPiywjQNZTCmMZHbL07xnHF/EGA7Z6JD3asLsAygukqydnnOjWlIt6Gzn50v
	GwsgS+kghaty1SObscPu4YyZ+awnZWbPY1CAq2tjrfA0smLV6ChQ+2keXbgsG1Gl
	DwsV2Aa3eWa9pKRmqmUiqAf7np4LGVk8NQbSbXIGqxlhJlt+KhRQNDEqJ6G3T9us
	pMiaPBRoW7zwEyioMps7ePV/qG8LkWgoipNDr7w7sr7WO9FZv+amzYzfUMqITyHz
	11XDo+7Cs6cM6xKlnt9P5LqfmZXjcdGqzD1zO2h+rTg5/s/FbueOY8ZcGbk7Kf44
	7MAw2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r81q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:40:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f12bb489aso5263485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060819; x=1792665619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=Iqw2fcKj2ooCBSARz2rhJF44VkPwItleNPr4EEtsB7qmppscFmKuS7hckCibEtvFVN
         zaik5lFfmu2bLjXne51i3DuaNVRPD1krIVdZ3GbC5o9TJcgA57H4KRm8HthJAB02OfHS
         Iuuomn+BwNCRJrD6ssg6hR3p2/Ep7Bv6v2VGFbaokm0oYSZFDWC043c9WjeCqds1d4m2
         vAknwoLp4yZOE2wb+nFGyc34ScYClqgCG5NmTqleX56UzlIBYp/UIBhGL1p2aV1Ks0n7
         f5dPWHO49QEr2qU4/xKazYvxY1AaZDAzMf5sj3I3vbVRBCqUDDjzyBJOkAnGnl1Kv1lh
         735g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060819; x=1792665619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=eCBqT/16resPoJoJb3zzL6rWv5M0E0unxpjWK2uZYoa1fLrZtGs5ONtUK0kthoYZHx
         jGlzi9WcQzx+/4Hl1FBGNy+QihJ0TAggM5eFvgI0ubwVcm6Nsc4Y1wtQG/sz4bpFYybQ
         RyN5oVXimpxoodKAjPryMr2JHBxgdz7VVhcjLDU+4Xzm0QlDVzqXOZF9TuIF9TievNaN
         NDvN79MrYZIDOG+3XrEpicTKsTkmRuXEv8un9TlKKilF5oDnwDWnUI2AQu4H+Uh/bew2
         5XRdgri5DEQvSALP63BnbXX6CYpaeptDpkTTceGqtD1r0pUgzua/OKPT2EJgt4lOptke
         GGUw==
X-Forwarded-Encrypted: i=1; AKwUvBwxh3sNNY3MDcbGUSZfYbJkNR2Pq8doS+Ums4INi3ZCLDgi7OVvNXy90wy81vtqtAEs9cZR9u3yhfjdk38=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1xUp05acxfClVv5ezZ7hyPP8vnorMh4bIGgVnpl4cmqGAtX7+
	5OGq1Mc7B6f9CmDloePnCexsY2RcQJzJ2ZUZU61yEp0K518Y/yk78WRfDdzIm9/iJFhqbiopx7E
	6nuvc5Y/fWydRbMN+w0LTAX196dQbg7dRhT0Bc4DIuYMJ57VLX+f6mDbx6BbS1tW2D2g=
X-Gm-Gg: AYBFou1oksWm4hpcT5ZdojTDUoSeFYfXyD/9paIqKhs9mhgKwD2aBaE1Z8wBXgS3KIH
	/OJabeeO/SL/HSkH/xfc3KZ/fkhTKk43ulouRxIScWOf55uvxPtkyPrtsLfM5+mPBC8FKlpJIgR
	trGHnyyXxM+z6rSgiMrj7ISIAGbki/O5pW1ev1SFxg5hYGvyfMZCk5+RtAZTN/AiMbKqxnLMumr
	y7QSpscqFpv5C4jLTFKMiuO0/2rITp1fPWsT2BZoWfUaVDEAUtv/7e+qOkhvCSuz6F4S4cG75FY
	a37flWsSn/AHz6YvB6yewdK/ReMgI1smx+oFdunPCJ++0Mj2+M5yn9x8Hq9t75SBx24HyUL/Euc
	yoTaAXQW2N8k2rZxzrFs8Bg==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396443585a.3.1792060818947;
        Thu, 15 Oct 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396431485a.3.1792060817539;
        Thu, 15 Oct 2026 03:40:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0c3sm107372166b.44.2026.10.15.03.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:40:15 -0700 (PDT)
Message-ID: <890b127e-746e-4870-9a52-9b716854ba38@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:40:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ARM: dts: qcom: Add initial device tree for Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX5EpddRLbxeaN
 h/X2rPnG3cayi9hg4T2O64mdZSzmeD2a80YsPXyXOZODMrjFI4O07vbPbnSHX5pfGQzh5KFX/PG
 zwn872GzI/UbIgUuNS2PWWbzwHWbBVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfXx8Nj1VosguIV
 Xzm2IAbkia5g/XqmsqefEGzJq7NDGvQZvgMNgtUiSM+vNuC4Dlpssv+3QLJ6rat2kejsAKOvqB+
 0LQGJGYryh2PXC4oFyYwRWPISmema7ZSpzlvnljw4q2L1xW9IBFzW5J19nIlPydqEicNYtgo4X5
 n+HeTM2aocZ3YhvR3plHaXS9FauY8PBtSatGrYd05k6z2IpPA7yCrKH0RvntbFxLyBzU7NzZmID
 IoYrr31Mseo3fhpv1pqFlRYE/evA7V6cOu0nCTkgdvpgBqR3ty/7yPUyB9KEXldz1n9i5gEPcgW
 kzXbXi1B4zm0Nu6nsDoh22OwLOuFb78ryr9MVO6AHtGpOIpN/IsnIMSYj+A9zdSUV3JgVF5sIx4
 PMQfuhiky1hOVAHPMPCKrLXAdThni3T+1I67ZibH+xuMh/IgTA4EtPkjjg745sXUSo/z9qEPbmd
 sIEc3KtYdzUNxWqp7pA==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0ad93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6qbC1cy8WFjiKmmiPwMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AMfwjLxywkd3RRViIISj-IBa2z9otdcA
X-Proofpoint-ORIG-GUID: AMfwjLxywkd3RRViIISj-IBa2z9otdcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/29/26 8:46 AM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
