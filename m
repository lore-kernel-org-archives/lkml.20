Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712811;
	b=vITxGEIqtUOFKR4/3iROCrPVjMfl4d0KqcJO2ke+mXP9Jq+T2OrxS/c4CiExCAKyKBLZ
	 hQ8cafyvZi75obDOGC7McJmKPH37wO1xP+8XdZd8cSWzF8xhhPhfLmCHH00lriLUlGn8z
	 x6V5jw2BiqouT1+fUh/LWEXkhqcbOLM5Gc7oEf7SUwENSGc/bHdQc8UlGgMj7k93p/OiZ
	 LRZ9vqcNwCKA16hpvK1XWzA4rDf+bkQJj2z7GopUebNTJCGjhegaiQghJSN42o07Uxx9O
	 H5pdlGVf2gY1aFN2g4eCm8SY36kSqHV7BRGqhg1uUdm8B9wko5BKAcJ/MbKsisXEBCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
	b=GsFrInFEIo47lC+HaS/wWfYO6boE1RKl8H1iUQ97wKQGcWv2UOSoHkSESTwvnVuQLVcH
	 2fiYSII6qTUzKQjsx9L+JSl7IyytLN0JCdQ4WAxGSrWiJRdMZrqUOvGIpKVTz9J3bfjjz
	 4zR0izzhkxpSeLQMea7iUc7Nw8+K1VMvUoSbbPYRtTPMdOCZN5EHKkVcDyrK/JlE7hZZ/
	 hIiUIEH/TD/rkw4NgxPNw28+1xcVxaSCzyfiV8xo/tERAKS2MTR60cfHrqOskltBI/fGv
	 ITNdvi5vbF9y6En33LAvAdAwFll4mSFao/Hssd7geaOhRY4q0Tek3qR1jUx+f1RWiRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MSO/3svB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/frGJWR";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B5606D80E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867B5606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSO/3svB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/frGJWR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClHO53869378
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQP0DffgHZK1//+ou8ZDmPpN
	oN8WnAJil4ETuCdPbuw=; b=MSO/3svBkez6VG0Vv+LeY1+7Kyq5hXZ4kt7PeNjr
	5c1IYcz5yvdrVLTXOKPQZvZ5osMXAPK2tQJ44o9TAyYiApulqHTN+bHa8Zs70oqD
	VDQE+WRZCxOGuqLg+f9cwFP7jpfisAsxDuSZjkYmd7xk+Yn/tv6WZ52cvXZBBGJ7
	RprlSD1WdkS+bEFanAit0B4fgrhT2Y2GRJ2wJlU/13El6CRqEDCxnmMa4G+QlQ+t
	quo0cHqNJ1Xvz0Kax83RdUB6gGAmo/VQ0HnxnGOzCyMAWJMuTg73G5ooTdj4R/PQ
	jMae2YFCv9sChkxcFtCnOugBKFiHtNTqQU1hcyNnXgOvyg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy32j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:33:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf634a101fso3522311137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712808; x=1794317608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=K/frGJWRoOoeH+z+5VIcBk9jtjcU4LdYas3VxJFUcn7b1bGOhJrcyRglLhX4qqzo1e
         Lcijc4l/e2CdmPfp/h1GUGOzOiT3czoVtqpPhH0AmTgXN+iiiFH66kJshmAQBb/zxxp1
         zjUR7Se0ULEDpvl3h1CPuuMMXbCpkqIpnqkOKrK4Eg5GftjB2chLqqSpBV3Pz06mXVzY
         OoJRIjiyDk8ypd9P/2BsVZWwfT0BdV8osE6YR26vylpSje0S0A6vso25W5A8TVdmKvOk
         kMonoPmvu77MY74bOiug9hFL12NdhL6IhFaKRWat2WaaHk+QfzWb01XAnezhOjuF22Ub
         rqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712808; x=1794317608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=X7A08kkdVREqKWQXNYGvUrxr78AvUVQ1J8xblyL7Jop2mGik1WtXUyw7fN1M73PxdV
         0qPXe4mDo0WHO3ZuwarViQoI0fXlDDFgd/FYaKyTnAWJp1VX/907U60HwJ9dHrw7yGkZ
         F46fpeCYkh3Q3jmWKKXxcLqqSvHtAL1fYl1B8Pj9UMsOwQmwSqQ5GJMORZY3lUuSXcgO
         J6ekTOiOreQPgVbL0yHAzOrQqtPf9gf3sQyiJ6tMlkicIFOBO6s65Q+/rPB9TBJgPw5D
         am9gscUumw/oWKLgaMYaYYpFeebXCUWa0Kb27i7rF53t9Eejh19Mh9VnzbWQePh7SzBi
         bHzA==
X-Forwarded-Encrypted: i=1; AKwUvBzf8kCtcn6Z/c581N9VuGCKd35iP8sDjI7v2deZxIUkP7wJgTYz08oFXIQX0084KIh2SC3ICgLWXtwf1Yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zkLCplU3FN0ORsS2H0zI3u7EQzTNnl9FV3aGKW6TFTJBplpHS
	uXeH8mPuuiWtUzNi57eSMIeZlheAoZnKKDiSPzkHmISFcni9/U1nzB9tlG6547A53NyQRcnUeqp
	gRgjRlu2jvQkH+qkZrEDL7fXXqT10K/J62Lu76ZapZYgugXV6nq7JkD06E6gCJoAOxam+FVdxtA
	Zh4g==
X-Gm-Gg: AYBFou0rp2SbTvOFdkUgllPVWBCeq2/cGZeBMA0C2WCiysizlB/nUtZbHYQeuHef0pg
	V+O3+SFuRhJri7XnpPAGGSt1Vj7iTSdFNoMLAufhOAI2skmRTew4UEw2+9hJqnvg6blPxChGf9p
	tnzeOZpJrl3Y7im7kQu0nP0npilNb01xziGpdWOrIEiqZMWSkhMw9vV4UGU3sTCOPz/JX7E7Qvz
	eMGQLQVFnV7vPRvbXz0j03msicgJjuyi2s7pCxwl2H6NWn9rg5jYjOiZfccbmkEUGuzooIIgDY7
	l73bTS5wlC/6ZmJNIo1yg4BqBVyjh09RT3y9rh24VOO/I6D8wz8jn2bTLes5jcD6hva6bSh35zd
	rwMuUWMmoRWLsQ8MvgB0tYFKp2Z0urf7C/dBW63QQ1VQMK98TBuxlJ6akivnu9Uk=
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193732137.13.1793712808385;
        Tue, 03 Nov 2026 05:33:28 -0800 (PST)
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193716137.13.1793712807714;
        Tue, 03 Nov 2026 05:33:27 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm22349359f8f.58.2026.11.03.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:33:22 -0800 (PST)
Date: Tue, 3 Nov 2026 15:33:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
Message-ID: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AOZx7FHaqTJVGnFqTmVFIw-sVnNda596
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX0FcAO7YYkwNB
 cuXVSCA3x9XLI4/qLsCx1hJkxhwCAHp2iNH3KnVSQBXFqCL33EE9Org30RrhZXGamf9WiVsdDlR
 DnBilK7dRlSk3CRWN0klvzKu2yniLop6iGDaGnX0DAwQF16NhUHk9OCgnd0IAyyAN39+nQi7STb
 cNRz4e6A9exJmOJtkH9QgMo1f1AjlTC/qEQNrURH3hSddPbjfP53DS7hZ3EpMYyk6JWNi5DZPbo
 oJ6I0QxLPmnv0hAXAoZ5eSRDatKW7bP2kdVExGonoqP3D+YfySuWtKZvAVWojvngcLLH08DUU26
 c/SixMwxRnzn8j9ZsBMnEPs6vTs3oQ6ZVqHX/yTajsmvevbHRDZDZQuf6Iy7J3jZ+7M3127sGnN
 8l51L1oIxUQ7o7PpS28rSMc1w6LilnRNf8cIyaz9ETf28evhkcxbrVLiSg5zgmg78bXpgDUxA+i
 9y2JMXn4vRRQxnFSsYA==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9e2a9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AvtK1wfCeudOeV3Kv5QA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: AOZx7FHaqTJVGnFqTmVFIw-sVnNda596
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX/FUI1ALhoT4e
 3Z2JtFPfuC61UCcFubQ4LVFm0EoR2zDYl2SNawa/9JSCb2yNI5DsDaimHW2azvxPZcheLudTs6v
 rTl6FOGVQ3Be1CVaVGztVrzdlSnLmWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030053

On 26-11-03 16:59:05, Nihal Kumar Gupta wrote:
> 
> 
> On 02-11-2026 21:17, Loic Poulain wrote:
> > From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > 
> > Add the Offline Processing Engine (OPE) device tree node for Shikra.
> > The node describes the six register regions (cdm, top, qos, pipeline,
> > bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> > and OPP table.
> > 
> > OPE is a memory-to-memory block with no board-level dependencies, so
> > the node is left enabled for all Shikra boards.
> > 
> > Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

This tag will probably not be picked up by b4 and it will probably confuse
some of the scripts maintainers use. It needs to be "Tested-by:".
