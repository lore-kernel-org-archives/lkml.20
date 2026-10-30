Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364869;
	b=WT7MfPwP7svCjtPLQ+FsPlhUQB9Xp2xqBsCslrCy4iyzlYrfO/Ci7dF6Gf54bg/c+xpf
	 Je2t05XeNIfyUi806SRkWS3H993PpnElw+d8uuP/Ma7p43rRMtE95tv+GwmB6ZCYEuDEz
	 K3A6fUE4GTvpkkHg25LK2WGUuWUnLV6AYUvXXnNLzq862LmGz0Nhpn59E2+a9v0yWBiJp
	 f439vmOx/AWqaEXBzq4sbDzLIGvCiAxHxC0NBPz9fcOdqcIN+JuYISt1D6uyeRBFNuw7t
	 j+ikuHYBvEiooBnSsHbPr7wzqSfmgK3k3VNGriJEbJSSeZzi/gl+KcmcS1mNjnU+wig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
	b=ta0x1txGs+vW6SxMZ6rbIfKkYbdTcPOi3h6HTuK/Pc/C4LGcdmc1xsC4rpdxPJuQIQRm
	 9O2D5ARBZ1jJDi8Jt07lzaxFA6JHI31ftwHxtSswj8Cnnq36i/UHfs7uzN96HQYs9h8bJ
	 LcAZBTmO1uDqHcYeeAqLDEOLHoCc3Mh8nnLFC6nfWtL8W1DKfgwl9MNEtot/cArU9Dv8M
	 fX4C53p/RBAU8U/kNek4ZS7c41lBIgQzAzm2UI9FVfJQqijASKBthWVJmDadLaAUZlt3X
	 mGesSccQlmIyEFsxOiZIWxbIwHPY3uQ4SdDA35ZqFHirftpxicAreDEgamc/eUeCKTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2hgXAaz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8v9JfxK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E224606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E224606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R2hgXAaz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8v9JfxK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGXJW3679136
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=; b=R2hgXAazkcgtm8S6
	6Ksjoa2s0v3Zvffkjb8nFWNB1d07jrWfdScfOLB+Z9x2QULsUNeXsCt9oLVU88oY
	xWaOVfvb8EmsamAGr98O9YwOywe7Oy/YvTvtipITnfTPW10m+QIV6wdpE4ahUt15
	5E6WtSAQSYPWlriD7RFSBuTZTAO3aFoCOV5Vch+C2+vtPysDhgN65866gbmqlGKk
	UXCe+oWmM4be+XGk80BPxE0rRNiaeoB6jeAwCEdVWHGQUUwwElB4X6Qpv2qz+htK
	/rotaXpto/KIXKWRo3k1E6CHwcz8jzAuOurL6aJp67hwL6JobmYPPpjMWUv+x5PO
	R2E44w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk3p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:54:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so17880485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364868; x=1793969668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
        b=R8v9JfxKQAejQXPmCEnLiyBW4JKjzFFB6T9RHAriZ68xz+pcUxMWCaP6Zvmk+6/dG4
         JoVbPnY3Yq/LhBDmp2IEaJFzxaJptaukKzwBbVjNe9R6GU1Md7ffD6sWDthM434OZ0Fa
         /qhnBKUofNum0Nxbe1S41162OjrZDBSiFaUXeekD6ufYT/1CGVqU+Gm/8xJp5bVNGgFk
         FRUnmCsDXMrZbvE5IF+3DTmn9AXJ5UmuUbWy/n1fdSfooeAunPPpc9j30kMcHyZ5Q9eC
         SRvWCErc0XqfmHeyeoLpWDmSBzyH0kZUgJrluizfwKWKECqrs1DsLXs/r4tHdZJNsK07
         c/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364868; x=1793969668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJN7OniSPVy0+buIjyCXoBHR+lwJ1eKIsrybnLKWdwo=;
        b=egAsL0ECZR5DUYx2rhGaBDyux1Uf01OPKLYIZiG/9N15xLsQcqSlptrhqTHe1bNlLI
         DJ01mQ+R9u5Vp3i6NzO1zB90ngbzPN0xmhe48lyYK6RMSfBWvouy0GJ7gKjNWakeuXKR
         uJsBHtpP14GyrV2dnfLIWfb/uBcC1ssr2+E4n7/TqIYK3o6iY8513c4PsqJQiItNqAL5
         wjNyzint6xPL7WWkhKUBW6LpJbfD79eOqyN49uxd5IJlOrP+kIVMAC9Ihn71LFNbpg0w
         wDPPODNEvWdDS2NOTly0RAEligE/sUfUFpTVMdVV3M2ggyanoUeS4lv/kwSzS5Ll9s9c
         v2wA==
X-Forwarded-Encrypted: i=1; AKwUvBzzlrnzBRZ1mhT7S0E0u59pMig3uxHfXSJ7Va6WQhv5Ta6xxwBxCCLXx8ieBCPhd1bOaGtANLDVLjB3GUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpD7JfNzFgE3L2Yb3vjyBa9Z/2TXfUrWqycLq5FfLLeO1M2gZH
	83OGfkWhijj/I30jGZohAPKJdJfLjvCJH3rL3ipXQDsd9hxLT6CCaYQMQY5/x8d8An7dqsPC6z2
	J2+Rby2UTp3fSn9JftUYY+gg3qLWmk9QZbhgHKakFMcTekON22ECn+ColyKhP9+8ET6c=
X-Gm-Gg: AYBFou255kuY0dX8SoFZskOLTUCqe3PLdSPMJxSpQG/sz1NcbTAA6tH5/c7DTiSVcKs
	sB9zPMZ2746C6tEKqXqh/IHhhrvAXwSFxrkeXhVAyFNg7hikN/Kx/2gxV4ZpPS3HQAjexc6zChe
	CYx/zH6bFweCQVU1vNyN3sGzRDrUYU8mFTtCOGDAMFBaYO9P2KGv24XzzUUzAOFY0QzQLynuAGk
	RgxDAqu83NvdUluGQHH64Yu7AsFzkpPGWzMFF0iw/dMtSub0lwJuVuaC/pMiRWsZyh3LmEgfC++
	RIXJ71jgNPYtzo0bXzny7ogwvXN+CBrt1apH1nf4+k3ZJsxRAWcrO59nIGAmL6yKck2WA/RAXkH
	+iZJiUeYOUyMrfZZKgDZrhF4LLWBGUPnz+DV5tFFHJTf0ZZQMS56Tb8hrc0dCvnKOx+p1Ct8=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr363508685a.2.1793364867724;
        Fri, 30 Oct 2026 05:54:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr363503885a.2.1793364867295;
        Fri, 30 Oct 2026 05:54:27 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7ae6eaesm590547a12.13.2026.10.30.05.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:54:26 -0700 (PDT)
Message-ID: <c4e3943f-a4c4-4793-8d44-0b578fdb6463@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:54:21 +0100
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
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: tiare: describe CW2017 fuel
 gauge
To: Kupreenko Danila <keckerz@yandex.ru>, Sebastian Reichel <sre@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <179329639684.489944.6322623410181934358.cw2017-first-public-rfc@yandex.ru>
 <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9G2UusB7Y6HE
 VPTEhe6GL3aUzydsMGS9CReDHbRoXhSFQ6rgGMYxTnYrYHkhVFMIMuuhBaTvfCBiZ2f7R8Foxxp
 iBcPnzZaDbaucfUKt8/jYyGyWaN+n3N39iMQViPr+Y3NeE6HwdpS7JRPctUOkclrB40HhKlUQR4
 ZIu0lHzm4s1JCyaL4WDcS6i7YwxXNY16lf9OFIl9QTNAncqMOEdB131EKdZ/0Uh7O+etf1UJi3Y
 abj4xNjmY4xa0M8LuIZu0Q4r/SLIFIH3CJ122APhU9+WZRdhf9++reNd7kqEVllhKmqKJWPw9UK
 +hsn4dRuswx1Lzxl6IoTCiyVGUtK2UR/6YYxJc854wE7alvbde1ffwR61uYrBcwrA1gLCef6ax6
 Qm9rZj+dJtPr63mxizm1/OD3B2c+N02IWUlsjGBlCgNGhs8/eDVqro+6esafFaqtfNxXf9OWjCr
 CK2CnuiET1N07H1+unw==
X-Proofpoint-ORIG-GUID: rdulRFY6eCIayenVwBxsLeKn6uDDo4uZ
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae49384 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=vaJtXVxTAAAA:8 a=EUspDBNiAAAA:8 a=ogegbmFYXjI9hOOK5TYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX0VLLregd5bk/
 1F1dohtFIdy1f8xs+cLDTlCR31mT4f/laon1haaCxkeGI+gaYG0/mdmm2DBZgA8dl2Asip/mbcE
 IECoHfKj0ZsWU2iKs3EyBSSvFeVMmZs=
X-Proofpoint-GUID: rdulRFY6eCIayenVwBxsLeKn6uDDo4uZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 6:53 PM, Kupreenko Danila wrote:
> Enable the I2C controller at 0x7af5000 and describe the CW2017 at 0x63.
> The controller mapping and gauge response were demonstrated on Redmi Go
> with Linux 7.1.3. The independent monitor also registered power_supply
> on that kernel. No charger node or battery profile is added.
> 
> The resulting mainline DTB is host-built and schema checked; it has not
> been booted on the device.
> 
> Assisted-by: LLM
> Signed-off-by: Kupreenko Danila <keckerz@yandex.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
