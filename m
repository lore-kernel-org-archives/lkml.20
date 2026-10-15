Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4EE4D6C20
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061341; cv=none; b=cMKJCrIUgXchDYTlQPimE9O+XkGXainfEB4Uk+74mM4sUkLO3qgnXi3Kus0Xqx1O4nRVonVxBS2IR0xKbBc3bfXD9f9fSylVF2sr6nufzbKnXgtS7lTl0TXXv7no9O3NsJWd8tvKCpSJSfSCfscoU4GbguIJiafz/VYBjBioF5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061341; c=relaxed/simple;
	bh=HI0B6U20PGlmDr9utd8wlA1Fuqt21mxCePzjPM+qxE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swKwbbNDELaKqSldfiSx3wrhUyq7OI4XIHkPL4z+F3ag6Ye4CVqS723v+NePVsFdxEIx+qgdB9jnbEOds4yv8FNv8LyImNKWqKMSvYuukt8tNroeV5vLykkxBsoP2qunuh5lZya3wxsyG+ZdXF5DEmlZjIvgut2iakq6fOVDrOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Keg1rjob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0bjcki4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Keg1rjob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0bjcki4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9joPY3408871
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=; b=Keg1rjobQuhKYnqF
	TI0Ep3xQZFA80mzN8TaR5/WuqnFpDmlwTugGSZEbuWufoxwtciA/MVUqgEfGt0iS
	v+lj8prd0Jt9UI4VuQ6TDptQnOOm7wrIlT5ymBEl0x3cWhiuGFWwDqKp+WuSTBHU
	hgoVycVqYlhXmCQKEJUCoTd0EIYgFW9hvkYYa8s9q6c/SP45fd03jtjOetttzWLk
	CQFt5IucgT92jMvfqrlboqZ5wjvhMHDgkWJoPJgq/Mcj5/iJcsVZqyC2d5G/04o1
	U4Z/cWj78KZBCljwa02fCANU5+DHSYJ6Qu7wtHkwZA4cPT9gMoxNMizpV1cxbXk+
	XD8www==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2bt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530cd3dff25so10678271cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061338; x=1792666138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=;
        b=g0bjcki4QwlHohbhK2KcQ5DUn/SpSzfutzwyPL4UvMG6UtXI0EDWAmckNeHSp0I+LJ
         VQwEezur3dLr8Dknab4c6llxevr569sYil3XMlXBciXzShcKzKdV0Lyo0k14s/S2DKXd
         nM7y9pFZD85mrjrWdYa+Owm9X+758RlJ7eikLXHIz6B/9C2BZ5jaNEpZZUFqWHMSnyAq
         69DVlHnJ1bn1w95yQ3m/UGMzu6mt/pp7TxpAXPzYlCFJjCU2Wm1cDe3A5ON6vxt697B/
         X6oCnbcMBDAYPMLVut4BlD4TPescc13k/9EWKyIreH9SNjEgo68lodHbFIUdDgQJURlX
         tbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061338; x=1792666138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PK37F6HA0tUM1rNto9KrqFXRqlvSgZ37BjeRB21jxXI=;
        b=cg0TBKLseUDwiFvpds52uEYPPbUrqfgWzOGKgcTQZkNuE2C4P+9050ZulPZcprasKR
         z6QkE4hWPqtUVx8fGayS5OWhjnjdg7w16mbGv7d1n3QOHiHICwaC5b8+pZMRXxMpgSpi
         rnc5bC3S0K3kSVrRBA2BrsSpWlR4SilWCOymRW/hQQ8yxFiqHRg5X0IdvPi8677YQYbL
         Sm1Iq+j2cL2CbAQg35NSZ1e28kIlJo19quVEwKb1dL3yfxOv3HUCjo8QGCp59PRrZrm7
         rtyjAm+jSCXt9Xf9R5cj20bT4hs+zwQECYun5KcnV+MDXCLxiqgkNERZQcUMBLAourRl
         x84w==
X-Gm-Message-State: AFq9FYLaLDwEHCn5ZEHZVyLrAF/+noLAl4hbzPHHKbYVuRsW2fW44p7a
	GPDmym2m/RRsD0lTTKoEGQ4rsbuMAK+wcUjHBkCGI40FjrGFYACt4cZT68Cp8hBFZ+kurNm1jTC
	1cfM3p5q8xNeDE+3pzjiee4nRdUo2lkbb4ag28qSbauMROmCJ+Ngu3n8DzQ5mfn7ALes=
X-Gm-Gg: AYBFou0L7Iqj2gCMiJ4W2ElBy6eSkpVHKraL+12aGwrRIkIWJbzMasDGr+Z/wh1nRrE
	5wICdNdwQJaxGXo9Hi7C8W4ivbwaKemwwC5Yv9XQ+EfLAFRYGRfytSSBAKHFpjfuS324Sr8anYb
	GhDIdx9wiFzulJR9cfNyT3W5WbnT/O7wAOakvO28+1ma6JjU4H4SY2ojaKDg89gN71V+c81Plzy
	up/FYdL0PI9EpnU8nnYFNx7kBw5KrOjhZo3RK7rbhaxka7nF1T9oitlJkizvyE5f4Z1V9b8NAXr
	WiJ5WNaU7dnGs5zzeZ5FRs63QthTy+yuiSI6745X1hfps2lG+CiyHOlb00BHtjLOpa7W5O4Tpz4
	74HBUZZjQV0nWiuOLej+7QQ==
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr357213291cf.0.1792061337757;
        Thu, 15 Oct 2026 03:48:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:531:2133:cc7b with SMTP id d75a77b69052e-5359f05276amr357212871cf.0.1792061337282;
        Thu, 15 Oct 2026 03:48:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda61fb26sm108538566b.69.2026.10.15.03.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:48:55 -0700 (PDT)
Message-ID: <0236914f-1d27-4618-8f94-3bfe6d931860@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:48:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sm6350-lena: Enable IPA
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-4-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-4-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX7xIkUbShOx7q
 T3N29uWZ+5G1lljQnS4lQ3nSOanYDXPn5FPfAM1zkKENdyjzgzCNb6WGBd7t2h85KWtxWlArXed
 MRqKdYHdlUMjjzAyg+yzSgvDFh2s5Vpsxl0hS/ZyP9I1X/GcSSgoGRn14D/SyoR7zflfvNlCsyn
 HKAKEbmzfv+l2oRjyqp7Igk9xouAlY5ltN9WplmsSQekrMIRewdcDEY0bxcFMs5NvwF9W1uGb25
 qA2g22KLiBjORhwiN3cO8RG0IV2nvDPA4p+5Y64+xM+xFvt3ttN5NWn7snjY77nq65trCFeTxP3
 a6EI081ve7Zi4ta0dhRBUNrpbslJqdc6KFEVkGokodAzBgJNdwWtZY36AJB0m1F2jIfY/M7AdJQ
 j0jJgzlBQwG1YY5VjhMl1Y0haYxDsYVyzheiP127G2kDEPWp7Ou1VOGbeaKPZxBttykzD5Hl3ah
 5f9aXeqFzeeFQFeVSvA==
X-Proofpoint-GUID: DXI0bkg-YgxoOEEuuxHwHFniqhyQDJIP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX9DjQVj5E/Ums
 tbtRFSu5gxn6rrIqqDB7vlVc0hieqSaTV2qVrU6BwNoRhgkvXXRPiaVxwzPERyU8Lo9jVXSLvOs
 tsNtvzbwWNyivFk723rdv47veen2Myg=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0af9a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=KD0jGWNZPHkgkXdHO94A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-ORIG-GUID: DXI0bkg-YgxoOEEuuxHwHFniqhyQDJIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Enable the IPA node for the Xperia 10 III which makes mobile data work.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
