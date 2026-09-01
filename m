Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797FE3B05A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272055; cv=none; b=h6j+H2xeTsS9cqZ560aV9/UNlCD8A7OnAfoT2d9DX1x5HAppwA8Zs+YW9kgKljjCr02SVZtPTzIEMQGBakWNhcJO1Opagk+5CCRcGhJLZR1e2o4rB7XDZfiUeuDkT8Uen1wb5MrjSJaOE8ZAZfOwvB2pG1J2IQhQCAVDLhbHzEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272055; c=relaxed/simple;
	bh=vMnnwb0rO3eK3ov6NV1/rxMCMSwFIvmsP/AaJmQCUL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcCaEO1+rPV0QYkWveZfqE4vYJh0SVTi66NsV5LWbNfQ6VTxkL14H52wcWicYyUbJsnU2ooj/VwVxqazg5Il2vlIQsVbqr5s7pVJSrQaxWsZOj3mCBxFZ9bcjy0pdMmDSl7a3xps7XzULap4b0mDje5P7Rz+URSFS2hFLGu7C7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvft3loU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+W7IWSi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvft3loU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+W7IWSi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8fB62825118
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=; b=hvft3loUtTLHubGB
	ThFXEaHZ8MvwO4iDbUk90nZmCRgQSABpUKLQBlPcZwC1+bFvWajY31qsZSbl7hd4
	5S5xSVPlE3ejYacaOBHgtCve7kBV+D9+NNRCKF4MEslVAwAMgJCcwfxagSFmLwEK
	hYzBykFfQrIuB9CRWkIFXtuaMy5/8A38s3WcziWqqooKWBVY7vNxIiNLvv6z7REd
	SjOvUpR/aW32d9RtWRa8+IdnklYVT6jOQgH13AYW28ICqgzc82dRsfj9e39S3dug
	RmgjY7+53h9HFlKQXYTAKcFTjmK27htCwJoi3cIIu8IGRxLy2MKcYbsKXzK5IG7p
	FmoHrA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cav4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:14:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c65904ade8so124245e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272052; x=1788876852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=;
        b=h+W7IWSi+Lb/YQ74KUjdVog/Z4K/J+TaHaCJBiW+Jzm/8WgIlSidEwUPVR5w7AVA78
         iRoumqXTSKc50WYxAW+HnuapcrgGKngxn5LRoEqRdjyuoZPr+EBDyHFFzmirMM0zND39
         uHtapoTI2XpgrJYEFdB9umZq6uP833cjsOpmiRBjMaX7/6aJ+qOUDaIB2sfewAnaDLum
         B4EOTx2Nad96UvmZ3CEDC/FTkTzYEtWPeZe2cz+hATPERGbSg9cMuq1DLO3fh9E1gvJM
         8/l0s4iGiKk+cnnAoYT/N+U8QlXCWAfvZmBsvQ8js9YT9AiD65rfaV17QENKC2cObuO0
         Ux2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272052; x=1788876852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bv4Uv599hFINUMQs89D9NhcUgICK7SVTcszNB76gMRw=;
        b=TlBxjko52bFB+JWxxw0lxZt+tRB3lebFIDQ5netbRBbQ5BlUusw5ngCCSTwK9koxEQ
         a4CYDVgSr0DN8wbtYZ+1seOJVA0xD8MRaTtjARTtXzEDAj+6m5pQm1uuO5ndrLZAdowL
         ZKLt19tFGm9ZbBtWstPhlunXqnxpXUOsrRjtudnURyrh4CGLPeJMHDHorrNh5pVKafK9
         E13UuULxxTkWFmF6U33BOmcrEEI9RcqrZY4B3KuIm7ZH1eWgJf6TkMWuwGoL13tFCE7w
         ws0+iQ+p8R0dHyicnSvzQZNBPry+Yo4Ba7hPfLUdSxtz617JWBkxeBbYI+3zsgr2jFs8
         SF7w==
X-Forwarded-Encrypted: i=1; AHgh+RrnxoZIhLHto/vYpGr3YBmlVyDkgUr5GCwJMhqPyAwCB1CgGwwTfIxS5ElDZ9HCOyApvX3LgKT1vfriAlc=@vger.kernel.org
X-Gm-Message-State: AFuF++l74XIqqBtlXLH768loP5a1qxBaMfAsh05GmLi1nFKRho3r7X7B
	tTKcXj7mXL68Iu2L+eRuVI9f0vSGnFxVIMKlED3uOh8x0TlSL6wITVO5XX3o6xCSr7VdeIUiWFR
	7ohFwQx4wKDxZgWifNVlD7f1eVrtTkOw0gy5fP/y4iFUjCpRFrgp7ERf8DsP23jPBu7Q=
X-Gm-Gg: AR+sD12YPJTdUWQ+uLfjxeUUJE94IEThA+NNH3SICC7DnkkkClzrKUGUpmjFOiJRpO6
	UCpK+G/+qTn/EGsObsN6BYvv9GY5bbdPFSgngvDiCDjvwbiku1dnY7czfB81KbRYS1ofLtV7aN2
	OYSCbYS+fmQLzJLU/yczTuPTqfmcGF3KgduH176DgfV5SpQpK7kgY53oq4f+CjXD0kSqv07xuXw
	Qada2+KWJd9lxRhRXsuJdco1rNWq14iJaM2yu4vRnQUJ26ooG/u3K5VCirEy8U1zt6xRO/KNeRs
	seNwI/dUKuRTpkLRRINxYvMDOQd4v79smnNocIuxhRxnHUWRnjrHX8GE3MobDzj5hIQUurF8A4V
	vi3rwCCM7ln3T1kq20WcHwQ==
X-Received: by 2002:a05:6122:6c0c:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c680966f90mr5189718e0c.0.1788272052437;
        Tue, 01 Sep 2026 07:14:12 -0700 (PDT)
X-Received: by 2002:a05:6122:6c0c:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c680966f90mr5189697e0c.0.1788272051762;
        Tue, 01 Sep 2026 07:14:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67c74bfeasm272224a12.31.2026.09.01.07.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:14:11 -0700 (PDT)
Message-ID: <7943eb21-84c3-4708-a058-e40e66f9d7ee@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:14:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96ddb5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gvnL6on5FGTgUggAsZEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: XJ6tDmWVSaH54DtBV4tIERQHjzPHu8g9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX5E28grYTcJ8m
 71VNVAIv97RqAdZVC1xAab8arcxRqcMSGvBoqm76+6jcJlFsUgFsH4Od8RE4gXu+vUY31J99gXu
 +ybfSjcDulA+7NuZQARi3ekj3IVaotk=
X-Proofpoint-GUID: XJ6tDmWVSaH54DtBV4tIERQHjzPHu8g9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfXwnlJb46urEjb
 QIpkJ0G4zsMufBmQH/nLDVJDF56sFnMApuMSOv/NgHjTalrAvlwEaEeZa8a6M/6LHKZ7iVXmS/p
 N9uCkdXwHnfI4uERQ142IpHgEsrROfuHkMdS4L00IGrO4i9pavXOYP4F5TGrci7kaq6VkIZ8DT2
 qAHIngu8+BQVBxDBHweGPcm8xTPY44VBxpM/hOBm7+sWOPbE++Bv2mKsj6OeT02O2odchYDXKCS
 vozoUIT4qlPv9M2oXourJ1Wo6bZm/5WoSdtUqqjiVZVBfsK46voenfrdTkVDED7QRFEQfu3wznI
 VPeG1kdUWk1oeMHvk4h5nqg1Ui1yu6OrNUUkcsefHU/w69GvC5t0KwDBx2Ozc7L7o1RNFFqtT8B
 IS3VlNyadVXN3FhBZqjwJj1OcRxOixDX+d2C3q0ayWJkCHlESrXbi3qiw9yWBsQodqyw7dgD81k
 pTXO1skUPTURxP1HJlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010125

On 9/1/26 11:06 AM, Luca Weiss wrote:
> Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
> one should be enabled at one time, so disable PMK8350 PON and keep the
> PM6350 PON.
> 
> Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
