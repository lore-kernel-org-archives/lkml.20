Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572332;
	b=x/rUNv+z64b6ToPnOAsXyy263a6cTBrF0WupUJQ/8fAQIryzcx3tncLSbezfBFvwybgV
	 F8NC0rXSbbGow2yfAOgUQg+d5gMl6FJyUG9X267OinscFm3fhj8KyMamz5fwFrmPpN50s
	 liyAvxJtDPrcnlEX0j6Q2YlOkqbVPsf3CwmcBTmHZ13ZwVxM75h/jGlozo09GOeCiZk1B
	 16evcE8U0szFBFG3LdYSj5OhL4o8vxxtfYWshYykpJyZqCwJ6m6SsRoyqdA43hWAIi6ju
	 j4BtCHTWwJeQ3PNAPn4OaC5hv9fzBhf5TiXiFyVlAHouHDPLzjIf3Av/ZZoc6aD2J5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
	b=4J3bOJ918H0go7LZhJbq56sI2ZPSpHOJYvks+bxJ4hCIGlG/GD9TRLImsY1UEoYBGMOt
	 wVBDqkeJ51DTpF/fzxRojYKxfUioPdR5al9j8D8vIquuM0ymbwHaszoTC2JfbVDhu72Uq
	 l/8zwbvO3En+T8JdjYw++fFyC4Kn7j6MNKCifzQ9MfiNM/Noa6+bsKZDH0Q01fSJx/6Fc
	 9ZM8JV3t812e7OsrYgKVDchSXeBBBoWkSHIjU9iWqbRwd+IqK82MeVnzw9Sw0wEifdFl2
	 KsUz3msVYkfSel/3u4Qr6PLQWCV6l4PPK3JtI9Us9oUAyuZldjJvw9mXMD7SQliGcIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EthEb8nU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZoAEtA5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C566606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C566606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EthEb8nU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZoAEtA5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j35l3926591
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=; b=EthEb8nUYtdG+GyY
	p5JwIaqB1vcxR0MDVovpnpyMxONuJ4ZHG08WVxoSSDhpRj+KpaTSVbN2mWNa/4nL
	7ct40Sn0ZYs8Zuk7CWtHcCpE16wbYenupEcuoKP7WJNSDLu/HUj6SZ2rd3f2LiPD
	xvfSaH3Av3eY4H7SgOJDWPNssbsQcp4jRK+HqVxAC3m1Fw458b30KFiGC1gr0mqa
	J0EH145lExaJBfa6XLOuGThKyfqJZTG4yfQ/QNLa343VOMfX3emx3z4nE78Z8S9H
	88O8+ejXsypEC3tg1Q2hcWwpVSRxDxQohEefz6JCnOf0iGlrRdLbd4+wR1mDQsqI
	nFC8tA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2cjvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:45:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso15263785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572330; x=1793177130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
        b=XZoAEtA5+SSc7uWEPnJSZ9bn54TDFTYfTZ18AKDtIPBb3+FD7+483UBiSzQF9LW1zU
         mC4O8cKQH598793zsWIxX8RYa4USGbvTK9eIudqpSpLFlyetSK1ONlJhFCuJMPzJizIU
         d8J3KRrQ6MuJA5B0sIDl7M4TkBByVj3HXzOsQRvWtR5BBMSFwKhnVbKMtQzGNVfCOytx
         XUVDoCnMBB/Uyin33LhFVJh+LAsU75qKGS5haNReJEIgBFEC3VbOwPy6RBCGnkhNrldZ
         cxhETrtJKSW1qYoNXqTvpU0TkAuDZibTriQC+SAwxCt1q1SJePGGxWlQVoiSqnt7NnRq
         gFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572330; x=1793177130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
        b=BpM7l//qwYMfjfl/sailX9gzpnPLExn64h4iRj1yjSoBTsTtxSC0+rwhHRj7Eo3Mju
         3fnezWsifUAHMaZzS/63cZqg5Jaj44NudvwcI0OU9NUSgIAEc8Y8FgM7NEQ70CbkFTzi
         jp7F6K2gKruZMs0XS3YRiXFb/aHrdR9Tm9/uxacS2LXq0dHkwkLhs4nYTQswJ4n7ZNJ3
         9xOV9fpzfHit/388kg/iDBLoat6JI6rPmQdK6pQ9PAIFeP7aX9OzKRt/NfFaNPfeglNH
         R9XSYw1rbzA3847X3BRgep3L5rzDn/4Rd5bYGiB2fCF38Ao78n/sJSWO9st209+nSfl7
         8vmA==
X-Forwarded-Encrypted: i=1; AKwUvBy36FzCYmdswiXW16ghNfN4O5IQdl0e0pV0xtx6C8meXGUDDHhjWj3DbbZrsymMglgl0sroDD6GCJNMYq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk8sWTVip/wYXe+VyjiCBl1eMfAPNzmzre0l/cUD8vLPaHX5TU
	RoyFM99RiEqTc0xbAscCWBuEkADSUuHNqzI8+rphA7khmJtU2o3+ri/4oK5Uq+miRYEHdTMqS17
	pPOjCHI4JbnEysY6CTfiDf9bcIVBDi/aRDujt8n/H+YNt6gJjnXGs6HvHYlpzRY2jyEg=
X-Gm-Gg: AYBFou1r4ln3/g1mFMsND6mHCjXwnfz6qc09RfpW6Vv/pSEMsfqLKAICaqrp+xO7Aw/
	PpObFS/HqHU3cEKvp0JiYkL8Y+t0ZKuJMLxvKEDi/nBOzfoj8Nn4m8ynH8XTVtt8jTkQ7H1pwJI
	gQOaRcBDLBP/Up4FnmeomfJdNOvPtL1uoZrsDH+/rBfvI3dMQFzjDl2iENwIVskB/mofCHXCoxz
	sVYtAsbJwmhUBh9pHdOeXp9E5v/05fHEe3CYqMrtg+dSzoqTexozPmlX0G80i1iuQvWgVpspSzx
	cw1sy8CkQhutFCXeQDButxKTaU2/G7zTl+1fJDO7Y8OgLWYuOXwKjk8KM6jQK6RQIYGOgUMDGs2
	zJSHAcpIDBnauhf28ZRX1sA==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr337845285a.3.1792572329906;
        Wed, 21 Oct 2026 01:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr337842885a.3.1792572329524;
        Wed, 21 Oct 2026 01:45:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315a59esm601649a12.32.2026.10.21.01.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:45:28 -0700 (PDT)
Message-ID: <fb6a7e59-5265-4eb5-9d41-504ded38454e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:45:26 +0200
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
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host
 controller and PHY
To: Shujath Mohd <shujath@outlook.in>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        angelogioacchino.delregno@somainline.org, martin.botka@somainline.org,
        linux-kernel@vger.kernel.org
References: <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <TYSPR01MB6204401DDDDB12AC906BB9F7C3982@TYSPR01MB6204.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYSPR01MB6204401DDDDB12AC906BB9F7C3982@TYSPR01MB6204.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0v_vbmV7D6rEQMxxZqlRqK8Ifsaz2SBN
X-Proofpoint-ORIG-GUID: 0v_vbmV7D6rEQMxxZqlRqK8Ifsaz2SBN
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87baa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CYTpYu_piMVnSvLoUqcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXw3gj6rES5pad
 dcBkCM1LeR/EmRgaowok4W0RcJHVZuVZ5Uc6hmwFhVOZMhCwdIKpSr6NJZu55aOA3+Cv6AbjPTn
 U/x/dmM2ParChZ6n0vMxZBmgeR68/+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX3VrV9qyYUSqE
 qdY7ms0NZrm7fW8JIMxS0J0s8tCkRFyXe08bx/GAFOXTKPces6bFHc669N6vRO+tCgOTLP21yub
 kGAENL7rNe3fybwoxf2imeUWuOTg6UzYcxbdDkvMhhy/Lwlo7UN7X/FqU7HQEIU+CWW6V8RGB1Z
 LOAx/PK5d/TgoVHpxR5iq0jCx2LFrCidlRHqAT75TqWHm6E4hmDVg5vrVvUI/kRFG+x3Io+GoKE
 P9p15iY85plHeZmmj7v/uAU8M8FqBABikKr5H4/whVJrhrw8kvtfU/7K8OrRnuVw/aQE1RW40y0
 JhBBmm91rMNz3TRfnO1YEHIr4EdFgziAR3MrtMZNw0ZV7MZszlPm9dlmL2vdAubwhjBaubu1Xdr
 jL8O2i0n0N05FBx/007PvKjq/Ku08KLurflpirQD7GQeDirsgi92o7iwlo83Eaia0hmZVAkHj31
 H5aGkch6GLosGn59aLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/19/26 9:50 AM, Shujath Mohd wrote:
> Hi,
> 
> I wanted to follow up on this patch and check if there are any
> comments or concerns.
> 
> The UFS host controller and PHY have been tested on the Xperia XZ2
> (Akari), XZ2 Compact (Apollo), and XZ3 (Akatsuki) across multiple
> reboots without observing any UFS data loss or corruption.
> 
> Please let me know if any changes are needed.
> 
> Thank you for your time and review.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
