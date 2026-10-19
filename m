Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16659526095
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421492; cv=none; b=ua3QGEVbG948NLHLK6Aqt3HZ29SGjwCiA9KOk3lVTJx6su6EPkQY2qUMPz+obA9/lhFwYtHuSnsQRk0REuO8TUdufDcbTUItoN3vCpZQoFguInFZxTt1VN/M4cjVqEon2mlQuz4oFRtysMNTzIvKLDda6/h2oxlvBag0zzZRagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421492; c=relaxed/simple;
	bh=zvVlRGPfV18YCPCiwYSoInnOl8u2eP57S5CcXqMx7/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U18y+d/gPIEbRsqIJUo+jvWFiEceSDVuxgcUpkzdOBGRNwhs4gOh5n3LhiJANkI/8lej2lMy2anrTxolLqATE3EnKgVMa3kJ2+M7jVFEyWQGYCiFp+rXPgZGMHyVgq/ppqFxAYs7Cy1fLrc46U/fsrVwE0oRK4hD1EfMNNcRdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPhx03yE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RS/popTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPhx03yE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS/popTU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Iqc3401053
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=; b=hPhx03yEApUtS2Cr
	G/mnu/lPHF8i7R5Xbh2U5J5RZyxLTdfI3aSP/kgAhP6l9orDBuTvcv94G8GyFQ1a
	lIduw304YqkY0Di5O58pQ9+hgU0fkY7kJWGti+yvui94zphx/B4AoO5/4F+Y/XKa
	DkTC9ZiIX7VMWKFTH1fkjDAgvklQqz8N3HOkDg73nAFOJSLZhdY42bDIHSryHwKl
	5al8zVCFVssTXigjEO5Gx389G9Dz03w+2TTlpcec0bnnMoBLPfKsALuYIPqnWXIh
	16B+vGNJWo03AxL8/ENT8e2+KpIl3tU6YjzL6JHNzGl/5Ck9VI4URkFmWWDarHGw
	2MZcqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1hay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:51:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so2973131cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421489; x=1793026289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=;
        b=RS/popTUkCJwd216WSikbLfc98gazCniIfFPlIdwCSHk4Z95jdrch9J1YgXHDkjjxd
         TYGQuAD0Ks+lKwN723TimLzi9kwVr1pITqS4e5sX5kL8bZgNSccwPx6RZ60TwIkecheb
         s+ehG4usR1XSqPPRURyrBbjI94GxZqzLUspNzUvJUrA1tLjTzELS5j3mv+Q4sOa/b2wz
         tysiXUUD/EytXznoq/qRtKfJQRXL8bb34xCRfJ4XzaPFiXM13tDSo/0H2i5o3RjA2el9
         gV/vbXAUOwH+o2NTk/40sNczRz8mnpTq7/Zug1AsTnMY9xjGx5l+Zj1bGBO3mlr9j3kL
         EyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421489; x=1793026289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7M0iJEy9hTraQhyfaGjwba1FzFb0/2NEss+BKOE7Ok=;
        b=bwwmTcizL1pPzJ7JH7Q3wcEly5uD1hPbm2U4NlG74pQjomTg7gcHy/pe+hkd0IZ8vy
         xAe/0WS+lxdsbipLVd2nIMobHaxL7dHcHlQeMySfZVQaZgXOnQiHFsWGEOx2h07dvHeE
         YSDp2GOP+Dw9VOZqykilonruqUCJ5LOSp+IaVoRGp8JIbC+UCVSaOUALX0t25+ncMpKn
         /v9gIXuB1OMfle7hlY2ymi5jvE9+gGdPCtKRR8v2T1CLZpeZomVOkx651dlqMW89+a2X
         TP7M3Uwavbw++ZRps3yi+rlKgLHtPX5UaiqHe9JEktAKlGuJkUjHPw8g29KY3Sam4IRh
         crsg==
X-Forwarded-Encrypted: i=1; AKwUvBzxykH3jABCoBTNeFrpOLiWzqOFVm8zVxpb3OV1KgCJFfA7sbhEm/Aj24GcAGd2LCNytkNQOE7rnvyWoPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1+gjDn+nDH9+X1vDurbJqFMelJpqSegt/s6kDGA3jXWJlRPHf
	Cj99j2MDHSy2qkrqAIlmywKaLC2WwRQIzEWGXd0yMSDzBSXbQytoVlQBhSUZ/BSaLjykGhdQwfN
	OZaZNavC9Lm0tQP32TS47eb03P50nyjoP0mNEc4g0wxsKBQZpimkg47/cAv64AO+hmKY=
X-Gm-Gg: AYBFou0/4bvT5K7EDrnq9b04MjvsoWAanmUKieuJPjASp+MoBogmgL8r6unziIvVXH5
	oEyttPRwTAE5RdLZFc3KQl50wqP0jYguIDIBPbNK5w6JlXAExPADfwc86rrlZj+wAro08LrzkFJ
	ektLpfV40ycjz/wlWa4IAR5pa1eGLi69PhdSI0h/zx0Z18kj4T+vUrt+ipy3hvzb7wV8KQe6p1g
	M+86V9aqW5P45p294pbbPwo/1aT1tibbH49ycCUgOiKB5FpnleSWmmsCnfzDWC29McC6oUrwLnQ
	1f7Yt5OgyceQlQrLJEvsf2siu50Q2qeWt6dU3Dp7/zOG232ZGfmWKl2LnmFS3aRY5ISn9f+iYuS
	pxgnOwV+rCbNymxZT0d2u8g==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr197678885a.5.1792421489244;
        Mon, 19 Oct 2026 07:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr197672985a.5.1792421488554;
        Mon, 19 Oct 2026 07:51:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380856366b.11.2026.10.19.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:51:27 -0700 (PDT)
Message-ID: <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX7l4Cu8cwcQ21
 dl6gTO/ZU/+GuYZmNe9v1rSkvTDcNAe4sEdZPTTnVCh+K1x4EiZ+TSnMfwWiU/C1G2p3SBGrfsO
 ii6yTlzMtH1OOoGsZuI3m58qkAbeS4A=
X-Proofpoint-GUID: DPrhFITncc_uFff35d8zgK_J7sa0dRdG
X-Proofpoint-ORIG-GUID: DPrhFITncc_uFff35d8zgK_J7sa0dRdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXxe7bj19BKRvs
 mZnzOck3JLA51ThH/9yvFHp25WhZzZutrup15LZZW2UuPrmIHCeIDMRLyAEKBwBz1O7K4UelsnC
 Iu8zW1UCL9kL1COCHWCr2SkoCxNl18p4xIRyfM7ne+LnwiVBQxsDX/LXvQSIGFr2DzjELybBy+Z
 20b52IMj9oJ+j43JDuEt5vt/vqviXJZexIVwOkZepz1Q8FLIXWxw0ByeTEo3HX3U59cadppkQJw
 oMiFrsA1FeWHJ10sp/MRPtneqlghi4/pjEQvD/C2HZMZeVAgqMDeIurvZZB9lGkjNVH5MtSN0qE
 6Y6IET8ez1ovX36gbfj9wowgft6YnPmdyuN6kmkTBUuY9lKxM90F/mA1R3yC73Cfntmi+HYAHPa
 scQnHa5xym7tJ1GxUP2mZlhpGTeOmrZfB+RwjMxh09ax8UvmQa+3aRtL2KDepaaoEdncYSA3y3w
 qFRT3zU0EP7MUOO2Fcg==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62e72 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-LKvvtDxBJcjZvG-X40A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> @@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
>  
>  		status = "disabled";
>  
> +		sensor@4700 {

Is it not there on the 4 other SMB2360s?

Konrad

> +			compatible = "qcom,smb2360-bcl";
> +			reg = <0x4700>;
> +			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "max-min",
> +					  "critical",
> +					  "emergency";
> +		};
> +
>  		smb2360_0_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2360-eusb2-repeater";
>  			reg = <0xfd00>;
> 
