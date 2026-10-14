Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6C747D464
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966704; cv=none; b=c89PMuJjlHbgoYTAgkIUd6g6u39lm8Tl2fTU6OpT3tCE//+dKSeUebBj14ewYHTt9+pkPcpuFkOx303zFxnABVSVor23JGrD3DyTlIb24IaBynF9WURzp04IcaEOk1M34UsovHDXHJxzss0xO4h5XCb1tEHtvIwka2jlsifztDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966704; c=relaxed/simple;
	bh=v4qNB4gBxrVDyEyoMhbAek1SACXeb4y8XYsThT2ksjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmZ+qniXzXSAZRCb0aVzac/549U+OdKEdf8MJ7IFerpICOoyTkKRRfgab5kMHMmZrxqUX9+JxlY06cUh3bK4Rj4+4vTXY7ciwqFu2AhqfNOKps1ZNZL0hE4AuitMdwktoJg6uqrbPBURvSrrIzIXhKzVrKvutnvk47yFqRtjq5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFazlCiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdl2XFNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFazlCiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdl2XFNv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2RY5L3000901
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dT7P391hZ9mUKzWVuhWqjH/q
	Y+4mRg2DolVij0B5VH0=; b=GFazlCiPkIEo/hOYm50ghZbFhjttvY3jFwAKp0pX
	HHIiOCshSZY/gOr2jJDZ0Vc4b3h7BK7Eq4AdzExOduBSPlDSecZfRmqiU19QDD69
	hwgSC448fUQkk+848ggwXK39yKdlBaFIP+sy2icgHfajCZuXm1NhsrH2ffjJCA5p
	j7anZOAR5n/LPO0sberWpeynTGuF8+VwNSvVGdMPH/PrRvqeB63mwYP1H+Wmsg9z
	MJehOnhsmq/yM+JctHu6MGHXcP0t5/dIjNyKFAVJH/M851EX40o3WrKOvrffqfpC
	EDuZl5FK+CxZHOz5SMHnlNacSESn7P0rOP73iyYAVQs38Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeu0pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:31:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1195141885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966701; x=1792571501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dT7P391hZ9mUKzWVuhWqjH/qY+4mRg2DolVij0B5VH0=;
        b=hdl2XFNvtE/J0+LzaAqgnW2PgiJnPkPm7WYTOoH0vS85b/CinlSEvJ/0NL2l4kSYFD
         ZkAUz9WYgktKHVbAS5hD2c7X9VYqtIERVRdHxExTdt3xJjF8oVjKUOrCLnsyxUGoQ8ev
         ueuuLdGuG39Zq50ThfEcttALAKMBtWZS7Lb5zdPOW0jXPkcZGe4tvliTOQKxFrfw8Rnw
         BcJwpESGm8yAmWZr7Ldg9E4ZQHq6oFK9xD6SzYG/oR1tu5hdNOLC/d7m6TAkBTFXOWPG
         HKAQuNrGHvGg8EM0Xtyspd808mtvO7E+u3lI/uEw6ho9ZR9SNT5pEdNei4Iaek0F1zNN
         qLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966701; x=1792571501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dT7P391hZ9mUKzWVuhWqjH/qY+4mRg2DolVij0B5VH0=;
        b=b8kvOzLR2KhsnzNTZ2fbTuJJV8AtK7fSz8ZTmOLR2ytotycsPOFZlfqb0SX5vXeEHK
         bUw1v1M3A66Iz8pG5j0KETZRDQQ7Kxx3rJz7DWmdEvQtrvXrfaTqyMf0vPc4cdl4W91m
         8FyjdNriW8IFYqm+YXX+OvrOdyHTgJ/ZwaEW9yFn86EYo5wJE6yvTz6y9k7aTFE0xwau
         CjiAsRkJyklJcsb3N93tax/Jto3d71rdXwaZ7eoU0jh/LqvvE81tNmLukHmgVhxrS5e+
         A/0gcO3/157YhI3jGomdQEU+TSb/nY6X2JN2c2jJFlKfnsROSgu+wZfgrSHcn4XzIvjb
         pTWg==
X-Forwarded-Encrypted: i=1; AKwUvBzaPfLdrc0vX3LCIw4DoSCa49EiBViiUWg89uyjSRMi6LBBHw0nU4PLd7qkgvjlZqboUGlIq3hsIaCc9lA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwto/VG85SMGbLJcSLsJOwd+1WLP5SNctR5l4/5mZ82QA/tDz8
	07Fr2W/JCoiZfSoV2lAHP6OpIN8opULZgbEg4mFAM/CwYJf8iGOcRiohu9TmwDYkQ6tp8X6t7G/
	MjDS7n9Fz/toXYpEqmJFGRlQdzu8pxGyq2DKR2gHKDXIcvulmcCOLnI3a8FqYR0MjCZ5XcjOT08
	Y=
X-Gm-Gg: AYBFou0QqMR98Iti95Hr0ApZoJnx1pgmp+rukqbOEJjf8qi3b75ZpmVQmNwTscvYe78
	HLqY+Xs8Et6IsdomrN9EhpYjV1EzRBbQgDBO+//+85JnRu1Tkhm7gDmi53bA0eHTjhlwykQ7nvn
	YQLI9aN0cIU8znlNHT6ySS28S8q/v4PkAz+qemIpmipwrovDHnEnEs8xhMiuu1eY+ojccCNrF6r
	paGp7xAAff/+U4mrKT4BP8CVSiUzqU83pKFaA3UDY5S06PHmlGruNdg5lI9XjYkUj5gYFPE0RFH
	7+m/dOFDTsHF4CctGmbgBiFo5peRumtsPIOch02nlgaXMmnlr/qzaOjtrQFw8icCFHRAXIyl3XB
	2GGHzAqLOvQJ5fOzr
X-Received: by 2002:a05:620a:1711:b0:93f:6f8:9d74 with SMTP id af79cd13be357-93f06f8a025mr81597185a.77.1791966700800;
        Wed, 14 Oct 2026 01:31:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:93f:6f8:9d74 with SMTP id af79cd13be357-93f06f8a025mr81594085a.77.1791966700159;
        Wed, 14 Oct 2026 01:31:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm1682892f8f.18.2026.10.14.01.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:31:39 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:31:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v1 1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add
 some sanity
Message-ID: <s2vow4fvhwczwj7hldtqntg6vmoqvxuub4dc6elvypi4cahv3c@kgu6lgndcu77>
References: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
X-Proofpoint-ORIG-GUID: tucxk72zUbholMNEpZIwnzY7I_tRSIK2
X-Proofpoint-GUID: tucxk72zUbholMNEpZIwnzY7I_tRSIK2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX1qXiVofrZfSE
 aPPWcNrTiuH11mNN2lHnTaZ9RLUP+fXNI/JP/P+LIgHmS6EZC6zVp0iS3rQ58vwZr6uB2N9dvqf
 fnPRJR2nYUXLwbK4kqUh44Fyd20k6yR77bzqJmmIWl4ozIa8UTjJtGhoS7cFMl9JMihFvigXlvz
 UUXysriPCCe1EJVzlEX4wAa3Iklo7F/Aydj5irRYFpJ0D4YHbYza1UWzRDL5TRgDHKuhUGXJMNa
 hdEPCx5yHjgI63PggNFqU8yds92C9B9NbzNuN4d39/BVJXD0dp0Lxx4NVtQSfepV9LKYfEEy3po
 /8cj0M3u6iWoWTKRaT9/YAqr0hE8/hTmiY8481ml8l/EdpOq8fz0Z7rxacaFb7QUIcrqkWZH3v/
 dC07nDwy8xKrspp5/Ks+FFVdZ86pkegrZX7YFcoaJzgwvoaAGULgELMIgratrXPEIepftUIc5fY
 RU85zY9YpsBt4T0XrFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX6t5jBRpJ5bwr
 KgWUi67564pQQfj4i1FsXyTxOhz/C+KBlCg4TuAUGC46ujoXfOla9rE/iAikzrdI0vYxODYdQXA
 Zd48OWYO6NKzJMaIyaPmVbWg21XMXaQ=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf3dee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=LSfqNlErfjkisOAvbMwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140033

On 26-10-02 12:30:46, Andy Shevchenko wrote:
> As Sashiko pointed out in [1] the %*pEp makes the whole thing
> like "no escape". To add some sanity to this the used specifier
> also includes ESCAPE_HEX.
> 
> Link: https://lore.kernel.org/r/179089728102.434549.12368098081790653201@kernel.org [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
