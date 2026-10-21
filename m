Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575212;
	b=cR2Z0YVpvyyJzNXPWBHqEg7b1PIzuTJOeM+XAiFPaESqEE5aMHoavT5L+ARcG1ufh/aC
	 T5VQZ+CMonp06vRnDg9MmjJf4Dm7U1T2hHL19agYqaNCpY2HMqRHKyry65/0QOlk3CmTQ
	 K/jF1tBREWpwPsuXpMABYD8viAJSPpyADdtandX+LAQ6aGXp0EmsTU2WjqzoEDJCJeIMP
	 ShNMC002csebCI7u9uTyyEh7Vy3npkAHCLFuH87a2EVEkm8FmjMyMykH+KgiaciEwWw5b
	 zP5HKQAR7W3r/krPe0q2y1vNGXx0QqyQbbKuOVFCC44Pfnr21V5SmlVqduFXLqvehlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
	b=B2EHziIFzQ1Hg7TRzMnfmjdI+iGlghrad1tOpmfg3nPqr8BJnQ4YMhfybTqPlEf2Cc0x
	 DGajRUqnrrlaxobQzeIod01ITwe01JciqoyOKE38mkLL+S84SISaU+xls8DCHZwOvmlD6
	 1xP7DkHVZUIhxc26abGyojy53LVoOzLzWTtI0+F5L3pu4NHAf+5h5NppnEuWHYomWy0UX
	 wLtj+bdgKeF7SCefVvtDHXzXcm3Fj13bxrR4iLW9F85v2cqARnSOL04ruDQhx2jc3uSHr
	 kPqqXtcKMmP+Vt2traKDUgV5Kya7bYSNu4pSq9rYCII23uV6Ck3RxDgE5Q2fXntu3OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F4606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C3F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0Pp165017
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=; b=AUfvKoYYLuz/RiNj
	fU1JeE0ZX3dBvp0QOJ7aTeCslxnRypJW4z6rhGnRLYP2bfK8vtNbjBTJCuM6SACE
	MnRhIVpcac5AWC1PgE+1g2C6zPeQE+88VI/LYGT4CayKD5STdtkD4njtw9bLrmK2
	1Rv9En7HIksLlJmW8v2gwM5TOYlLpLAxserJsFppAktX5LlPcRjQ0VMFBzHe9IFR
	VyAMqD6wkbXQ+YGTm1PDgMyBbkkEDmgULpd5qEb+fKu8g9x7QOXtuV0W9+o97nNC
	qkmHMBdTjp5jwdekhrgcLBYGKkxCFq95Fvb6n67X7NGtyzMoTPMW+6w1xJF9LzWX
	/sgpyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02g3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so15980885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575210; x=1793180010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=hamLPNm6h5U7OYSHnmXUcCqCWM3/B61WoKwDjGqpXpOx7+3PNTxh/DKJ7ariZUMwDU
         FqGKi/BF+5oGYa3S1XRPezVwFKUnsbjE+3KRUyBqHk0b0HIqV9L7R82YzhLqUIigogaH
         n6M/J+yMD3ff0qStBUSfvuf6NzhKnLYBlVL7CW6Pq0tX4ODyj/iDrXaMCAy3B71HXWSN
         07OcH5Eps3A59vEyy/RVIJu8TBKcCIg2XWU3DElLM/xpsb88Mh7Eyt8+/YtwV2n8pJoa
         bzYN2vVejuZWtumXxz3fiMkjMlXk2kMCdPZ0ryoupakCieTe99HAZWncPyCTzAbUqjvd
         b7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575210; x=1793180010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=A0ukurjFMolQiGyAMVXevi+FR2O+s6uBXfJ2wJJqBN/wA1QOYd4wVqxM/8vx1G+A9K
         LgTbH8+WPnecOGrJlwRmMzKGg4QwU/cORfmahPfoNDZV9PKttMQtVxI2yrrqtZ9PhpOK
         crJXTfMjb41ewwKGAXlHpUFwzFxxQIuIlcmNr1deoMrRCl0QVFNgRad7N9uCUKdgPjmc
         P4MYAZpFRgW5wu87BKS9XIQ+8iXe+PPNCs6pUMMHaaBSkwC5mTU1JuShK0sQYVHntBwB
         itjuKyWx6YiAV8DUd375vCWeY1jt/uDRAxnHOk2WWYEPjjBC5ncKLbTjIiA4jeQRC0Eo
         7kfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP3qoV1sPXxYwLI/Q372nfdC+7KIkgty/VoJF8MtYcRCI4++B6x34tfavKugf3Mza9JPyvXhGp4my5+Ow=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF+bBaWRX3VlrUtoGghT8X9R7NaZ1LQROEX2wSLWTIMmyZ7UiG
	+KyKA1DgYS4JSqgL0ze3wE+vNqLiaE1jSNZWYz4ncG7Eip82ohycoFij4eLUqci3Rgbyuft5hnE
	ufMwFzp1WOnlhmvEyFLKO9DXJdW4HiIr2lsyZUG9Z32HMI1LAj6ZdNlPIasKGdopG0HY=
X-Gm-Gg: AYBFou2yfIljuEcgCFiWAf5WqLFgt/q2deUxCfz+KVeeFGBWggXB+O+5YmWnAi50HxG
	mGr0zhEy4Vk9cuO0/CboVZkJgoDxZzwoP3Gz8cBhi+d1az8Aa9PRiAFJbOKtWiP5wFtMLOrVd33
	0NwBNAWh+wbr3yZ9HyHJmDjrLKG/pldWyov0o2OfTIkNZS+v6JSuqzmM+2wjgqsVXPbWbwPn1le
	qpo6ckM+cyNKXNUljkUdmP9rG7Vl9jc2vOuhvjuEpwnGTwIDLLKf0STic2imPhBenD6Ow40F/jp
	boC66y0DOll0byP9aVdPc1H2kWiwovkaRnEN3sa7kXZvhaPofyrD7fH60X+IbiVJ7iZblE8FiJR
	VqdMKLCkgarYNZ1m3Z9uKbg==
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26713111cf.2.1792575210446;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26712901cf.2.1792575210042;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679037543sm59783766b.85.2026.10.21.02.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:33:29 -0700 (PDT)
Message-ID: <9981a633-4788-4b7c-975a-77c3a57c0352@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:33:25 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Marco Mattiolo <marco.mattiolo@hotmail.it>
References: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad886eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vbdGY0My6zaIDZyNjYwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX8fCMSVvApUDY
 CAwoUV+F1iu41X3vqWt2Rdhfndq5+MWdr9LvHfitL5ub+Yg810XWVv3TY9HDNyEwWz9xnxlqFMB
 kq2+u+X3/K8CW2iC8ELoPuTLCWQeWcpn3LCKn6XcbINBWAaUZyR/2KofWBW+WAThmsd+GhUvaR/
 heeUZvh1k/LplbQ9MbXOG0G6HwRDApk/g1WgAhEXOG1891ZVYYrSY7fFdcpJ+j1Wf390OBBvwRK
 uPI1uvNRY3JWvnsUB0QTLft72n5W4d+GTc/6Go3d0UBF0Wu9xrEU2AkjiuJvyJiXGCpAesxyRDU
 qP1E151OBtAT1iHuJT1qj4Xc2VHpTpA2ekbTVNrTiiiEJPCBNYx1WFNp0spXQf7epAnZKGmqxtD
 LsoJ8LRyXE53SaqN7rVqfhqXDUy6AyWHDJckTEqabgYxgCbhLGUq5z6cTDJy58yVqcY3661f21s
 7qSMNuJf7XSNifaKJRA==
X-Proofpoint-ORIG-GUID: df-dAJ43Doe6t6UXHxM4PVA8HB6Y0JEm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX/LKC8A0CssZ0
 PdfGfDi5GbQUHRTfQhw2cHl0KDrb8AN/pm/FpGtUguFkXiLZR43Uo/c1G+rr8eHB7TXHquHcSrr
 RbKtAiYNvBIE+IIKTxh2/mCSBOTMslE=
X-Proofpoint-GUID: df-dAJ43Doe6t6UXHxM4PVA8HB6Y0JEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 9:37 PM, David Heidelberg via B4 Relay wrote:
> From: Marco Mattiolo <marco.mattiolo@hotmail.it>
> 
> Set drive strength and disable the pull on the touchscreen i2c pins by
> amending the qup_i2c2_default state from sdm845.dtsi, as the other QUP
> users on this board do, and drop the unused touchscreen_i2c_pins state
> that duplicated the pins with the gpio function.
> 
> Fixes: a678adbf2d22 ("arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL")
> Suggested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Marco Mattiolo <marco.mattiolo@hotmail.it>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
