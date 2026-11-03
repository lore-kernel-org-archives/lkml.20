Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793682957;
	b=J8YuEUDM0PPiUj0cg+JQ+0FgIYSsYXKgaqbb71DsT4D/Ldl+y3HqG7QvktwM6691279Z
	 tZF1cR8NSscRtQ/x8/tebo+CqSRdCHh6lyybRktbfvUjciL9+RQ23RFGnNZc67qrkB/b3
	 545+yRohaRNqq4wh+RV9i/MvCuMJOAh+rRJfHH+SJhOxQlASnDUQBwXspY/Yq/xIiNC4k
	 o/IyOYFeWMdOzdyUmoSGrJQSjzasqSgJ2q5e10q6PiDWgfPxUcdQUmzEB/CvtSyAChtDX
	 PZeb81PEg227Y5iAMgyozQn9wBpc08ELjoNHUBL9xvXUTvWAKUot9IFkZ55+uxdV8iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793682957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
	b=4RJt/usBJ9WBI96CsVJUsql2Ybw4Lj5cuidNQaRzQ/KO2+brqhIz1F2RL7gRS7TdN9Gu
	 03IUmxPIVdy/QGUvv4j9N6ylasXuvp1U5HmkfKHPpTJp0hsm0WzCYJSs4pvIdd5fVo1RL
	 46d8OqnsqR/cuhVKBOf77xhedgAt6Q1s1FoBxaVe700zNuhgD+wE5pfJfsYIemDJcYswB
	 DtrvRY1bZSadTlxQHFDYxqrXS1Fy20NmnEvF6CfoAN3xTOdVbycnkddjdSUpIpKcDNMv3
	 MpobYIy1b0LDs1Y3zbB3enaLIms92iqciE8ka39B5+e8GeaDZQ6XF/ctkh0ozm7ND+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORvIJS1n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+alEup;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE16606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE16606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORvIJS1n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+alEup
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33htcE1141804
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 05:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=; b=ORvIJS1na4Fn+v0g
	HinKegmpNDkvU7G0tetJOyhqavkqpXre145VlmM0+jKXaQHMghxlhdRejYPvQZmC
	6nS4kryPLvxWJZ7YjUx3cgOeoMANYeUrVffL23zQoA0eta6Nk4inQANaoxJIAFOj
	6Na04QeZmKDxauru1pTAUmhHOQyG5BwRFxFJ36vrx3LjaskEmacpDlHLcm1DjEWa
	dDOoi9ocDLvy5TaARCk0nZY1PU0y8TffXMSLCjSBerZpeD/w2E4Ov61E6XzEw8tG
	D170URgRj8ylBeMEtmfx2rK6AAVo+SMtdWHXAVtmw5WP4qnteHwGNybPaxTs08bC
	OC66vw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycra6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:15:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so150035a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793682955; x=1794287755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
        b=FE+alEupiVxijjhG4JjH+aGSk4hEpVFNZ36t5rFp3A3mNElh8ZiQZFC1qGwusqiV8M
         pADYaIxg4rxdM1Ku8DVzrTNHdYGbI3/X0OMNyE5P1YRi409n+QwKFEryZHnoUY952HX6
         G1oM/eEXxnSG1uEuTT15ydHu30vtEFLLdRj5vgtJqjiefg8SAnK2uaR2M9CkGKxOx19Z
         SPfgDILFeGkvXyk/FGZxvIDOo27EY1jM5Ty0Pnn1jJWnfJBypleq/q+gQUlo5th692c4
         Ll9CNanx+sRvjVf3j30fPcwWtymxvRs7Y8I5RjO4D6OqUGgmyUFTpbkrj2+aXhuDI1Lj
         MHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793682955; x=1794287755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTRrlyDoy7EVZYwU152JYLRxtMJGNPslDC+aQvpyMkA=;
        b=XBdLnkeYkWg+ghpXDsCdhFl+EOF5UQOM5CPIqUfgLqnCsqbvH8yj+y+SOraJ6lwsys
         awYcrKJKSXI+sk810P2RvBB8J8W7hJJNe8d2pd7aRGC4A35Q53R3Wb0AzeI2wtulKd4G
         lCogSpakiMaqC1pn1CBKH6DQmwb7eM/iqXk9ws4eOaTiNN4mvE+OYgBXY9z3nZuozN0t
         fwp4MWOR3970dtNwcRyBr0XRAilMXt0WvqOgmzWZuX8+fPelK8Njo4YG+VgbaMw8UAnI
         Jvj7JSqOqsYgPIRlp83pAXlPspEJLqJWMHhQJ+EkOB3x3PV3PkWm3S/ZfpVSr7JKWxx1
         ErBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6p3m1fdrChmw1lqJP9VhV/eqps7Yr3V38yOoFh965g+c1XGLiVEMejq8vnXiCF90LuDYoM6X0gf+Lc/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fgJ1UKkzm2sL+aVOmvRBJmQQbIEtC0znWZKjV6k/Eit5/jbSI
	I0ByXwYAZGxbbxxkmBjf9IwpExeqrsaW+y43BSUpYen9/VNYmcKJ6l82L1Azn1ZtcB77/+g4QGB
	oAgYjFMd/0d/XQof4YKLOGUdFxk6w1cSxXp/ZIZr1KaAHAqCHdKZkeLFZSwfhKK1Oq7s=
X-Gm-Gg: AYBFou2Cxd+PhPwopXQ3vRbqC7Jfc9oKKBj2cCh71B8CcyjHf8b4syOGtgo/dE/FDVy
	Yvb9svM9gvgnS0MAnA7JB8+U/GohKkU97p+8Ab4Wfbymzri6oSehvxETr8UOrN3NIRNxSelw/dg
	EyaDGZoUO6ZQoc+31zlOT3g7nRfHRGiHpzNEfcbDWUFBEFbQ3KXyexLnubJFKQKastFoWJD0ud2
	4GGcIsE+rmngAOESyLwzAF869+fS51+ISXLgL5DANzYa2y4GtwipRc00YCFVfuz0tdWzUo66xgy
	GVqyyr7OReb1WNCLzImiz2lHIWcIpMnsXyQEjunEZUbk/Kt1J47YDXJcQd3Py0Rj/QUj6mXoQKO
	l44w7TIgpYTQFuk7T/mLXX3HusejLpxZuFkc0GqCmkN616eXgDz1pERjmC0s111JySbXGdU6SS6
	FJSw==
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr10861959a91.62.1793682955191;
        Mon, 02 Nov 2026 21:15:55 -0800 (PST)
X-Received: by 2002:a17:90b:4c12:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3ae8986e3bamr10861935a91.62.1793682954712;
        Mon, 02 Nov 2026 21:15:54 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5814basm2423083a91.2.2026.11.02.21.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:15:54 -0800 (PST)
Message-ID: <43f340a6-3999-4cab-90dd-2cf7a537f5a4@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:45:48 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
References: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae96e0b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B0GhShHi1rKA2Csm87UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 5l-TAI9S1oM5ouWrusao_kli7hwYLT7b
X-Proofpoint-GUID: 5l-TAI9S1oM5ouWrusao_kli7hwYLT7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfX3CmdByi3oy56
 9wZlrgEcvLNQdqzdisOQDG4dVDnzBHpjsx/R+DVXuhRH0m3kPk5MnCrB1K5su+eVI7tac8i1sIO
 GLKXaAzu+AIOXEnqFRmOV3O6FNYs2Ev+IC+6x3eu6TN+xp1HAfrWr1J2oMO0PujmRUN3vHCtSCI
 oJqfHzUkJFjuDgmTgJZg/FAQHurJ+TlrpJKd6okEzx6nnIlP9pHyubnZ/uFv7LxluaCqWfMWkZK
 eRA6dikX1hwP1wmu49obLPbH8CvIEroeo59Ap/5tLc6G+UC3rIu5jxTts5SbN+rE+Zgef0qZfpL
 SyBMWWDLrQ01MgdPm5OmklPy8hS4AgvQSpsYJmmH4U3IqK8YsGY69K72q7FxIftpdQgk4k6gDs9
 SFYHeHaw/3DbZAPHkrUgNGzDY4BSkJsfi6XshsaT9lMw++qMEjG76qHk1Iepl2CJfWuCAos+N3T
 Lx1+4ZmIXhnUfRYDE9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfX47hUMhfCyMf4
 mp3uUUxSGih/beZ+kIQVePw/0wJQclQcNTJ43ToDylvFMF/k34reCaSJzU/SNbS45DNvaur3vuC
 XneH/dFXjNDPwLbpD0ftxjViWSRALNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030020

On 29-10-2026 20:11, Vinayak Katoch wrote:
> The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
> these two context banks fail to probe.
> 
> Fix the masks:
>  - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
>  - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40
> 
> Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

