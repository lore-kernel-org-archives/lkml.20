Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE33FF1AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274164; cv=none; b=RyD3iftt37KXV9Hd8X4xi/aKyyt+O3R1D+e+s1jlqGFRzG+MeCAceMNG44hGycsV8AspukenzvmVL0VNQUtDFSm0nz6tP2DOlIlzdu0fENEqj2j6+DMO1KGP9emuzTMxIa3kb8vFNq18GvlYNUimC9sEvHJVo1H/fMfh9ykfDI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274164; c=relaxed/simple;
	bh=h2WLcDOj3k4OBlntnyY17nVK4H30VzUclgqFOJ0yB3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mF3U7lD1Ha8LQqQd2OtA6fr+CrdGjNiAC14wuJUsy8ZIuNSH27IRuAcXW0O1u/c4U+juuFh55U+bQBjNwa0FqJLhG1L0zvFRKUrK0PuOgUxVAvkIXg0PP4R6Kqz8pX5ihkFsbLhNh1LJM1SdR+vTV+dhTNQCbx9aRjfdDiwb3OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naX72m5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyDyKyqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naX72m5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyDyKyqq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8fZ33002493
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UvoY2QdWS/vIBjMfTsuzBB/l
	DG2V9aKuSuLYY3rq/zM=; b=naX72m5PjDY6NXu390ua8GewZqfyb8oRuKwuhyvS
	7T33ireJXp5n404TLry00uVqZkLDItc0zvqbCYIdVIogFSEMIuQINCwJMRhlyYvD
	PEnRslO7aaiV7iJYrPfIKESRl9/HzhVBlRA4EWx63DqBCLFTyEvVobRHfz+dKfuz
	ow24bO59xb9jHao/XR8fspsRN6spIdfa2cGVH6nUuQ6lrDhft90X14M5I8b+ftJb
	owt7YMH0NIrPrNaIKfhekGfan/QdvOk0JwvDXVAXbgOUQ8KKCC18u3EAEWdFYjDd
	s/KZe4WTSw0UTxxEzNAD0/F9G7wxFik9B0xZ6NaAOPOfaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh2nnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:49:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so844373185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274160; x=1788878960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=UyDyKyqq0jT2u1CvQ0OnWwgvdo92QhfH7EuPMuXJoWvgGDqY2fGttx+uF0jVKEJLi+
         HxaGZUqEywktV3hgqjJKZPRJcLirEpAGyzJL8lvSbTtxBDpSuIa60d4J2PCWT3yoMbFq
         iiFuH4hbrF5kWPw4He7IXh/OsON1FPNJO/dATlxbFZzzDqIAtY2qbkz01L+Qvp/9I3vk
         yazZ4FHHC3lldjUQASUVKX7h4olf71luHKL9N4iSxI7E7enganbIW8JTbbE/ikRf9FLm
         fH8OkE4AwxYZ/tfcELRI4PohJdl35p6OYfsubn1vf22tcfImD6QtbzMjLtP9MU+s0F0T
         fvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274160; x=1788878960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=ZByxus/+uFSO9UffEBhTSlox+CocSTqdZ0eSpG2eYL7a36SVZINoMlphrGi8RQhcDF
         VNfCGa0Ea/raCDlUeZ4sQMZt/cImiSnUEaW7Os3j8+RvO9CqoR1rNiiTSMfb8znJM7ya
         j/w7wxkGalZidP9f2nAouATta1SHyQsg0AlAFhBuqU7yY4f8+jHbcESUlioI2e5yVI2M
         ywfUyCQdBlskipSH6THpyCX43j5D5UxdQSIlaws/zjlSaQPQnV9euTsO7wIq90ovglRl
         N7YdqoTuAy89veIfNmCDbDjUdUf0MJiV2V1xw23oCyGgW8dFeDzJycCjyTvBPsG83nv0
         6APg==
X-Forwarded-Encrypted: i=1; AHgh+RrlwR0e+DAFnX7LcuvR16pwP2AvaRdDqK6d8RYl7J7t+0HuAncAF3b7sz0UhlAzuHf87L6mx07Rwy4cNW4=@vger.kernel.org
X-Gm-Message-State: AFuF++kvP+b1n1m6wQNFpw9f3fnw/s48xWidrCQgwQbRQvCud2SsvsYO
	z8rFh9DXmHXQY9hcz5OtAntrK3LPUa6rVZy3Y/vy6ER2Lq+pF5DekvWSRrUTSX6ncT7ap2eK2jZ
	4bdJTLOS3WXUUS8DkYMqWB4BbqwiUxrdfm7YEaz4w/UUk2szneXsquS0K4uEKper0A4g=
X-Gm-Gg: AR+sD13vRwHyw1DHJ7vraD3clxMnshye77zM9pVj+iMFhoIKbjbTkZDcutI3i36M3dZ
	HNNdDK49q+WKjcnFkfXGDBTpped7EpEJYFl1MbAUV4YyRKqB+BCZsHYKwbzQPE/MbNODaxUx1Xo
	RJ971FlhSm+uwpRqNrEn1xBM/ME6evOuWwf65AYbj3mYRhriXBwieRvJtzqXMH8VDUzOcXttf8F
	8TBGJhdLH2tXy6teAcAwN7NwzsM5Uk376KkAmr/RVl219k9oQrgZSl4V15CY8vfkNzB1/5/lACL
	q5tflkPmUEuJdJ9pxaetA5jFq2ibO7WFdISUbDWXdWUfdNvSJMeqI716SPPABMleGLgtwOSmwQ6
	NBRfJj2kqBtlHiy4=
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984653885a.3.1788274160175;
        Tue, 01 Sep 2026 07:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984630285a.3.1788274158525;
        Tue, 01 Sep 2026 07:49:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42593sm5660257f8f.2.2026.09.01.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:49:17 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:49:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
Message-ID: <m4y722wgil3rw3pg55vemschlcpiug7s3zrdkn2gh5fpflp667@eahg6zydkxjd>
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfXxy8x/j5lcwm7
 Rv51ku5k0awyHQ+MqppkaQNrXHZb9/aVqsIAWjNGqwF/IKlM9MZZMXQ2MSXAaaKAenhWOdEGq0q
 PN/iuMl9vHmlaYNQpEmcObzu6GR+A3c=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96e5f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_ajnx2MfLvpOtqwsA24A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 7yYJwZazkUL5LezRu8EYzUtB4cIommdW
X-Proofpoint-ORIG-GUID: 7yYJwZazkUL5LezRu8EYzUtB4cIommdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX3+28sYsaaZ9Z
 K9Crq+tDmaL6JMHoxDI469mnn+8+utH/MXiYUzbcMbFaYP+S4YLn111XS6H8j+nV+gpRocDiRGj
 UsJ+jtQNCgRgqnZqPMet9tpgVxOgRmvm1Y1/0BMEEDvIJdLaJNiDMSmwR+GtBjFRkhbHZoYOx0c
 xsHBf7XI27FU5o2gZIdwerieOVmpEp8VjAz9ALpKQLzNufR5L+5hHxuN4dp/3JQw+0jUP9j0+Ia
 c+KYFNpp7DWI8pypGQt2Kt6cSlBRAUoNyKpUb/BmjjyaKnzVBeKzliDXgv0uhwe6p1dgKO/kHCs
 Ukx1YICaZuvPsJORjgo6p/aXWgye0ud8qnf/iXI3D1M+C+TJW0FaiWlWmtgTFpK3yCZv/xBYKB8
 nElLiUbeuPXJBGxvifKK4S/RWIRSW7faDgiHHg7c1eNXHaj346oSrdt7CsfnXe6YAGGImRkIN12
 AS0b5Tj1Xl7MbZOPGjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010131

On 26-09-01 11:20:56, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> PM7325's l3 and l5 are supplied by vreg_s2b ("ebi.lvl"), however since
> that regulator is not modelled as regulator, skip the -supply
> properties for those two LDOs.
> 
> And document what the "missing" regulators are used for.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
