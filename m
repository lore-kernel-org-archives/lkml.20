Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006535;
	b=qqbEynDjREdCCkteJ9FkF+3dbHZ3D/ZEcyAenDgXS9ORgJB/8tolz/fhXRw5JN89vIrV
	 DkJU73aqmss/7iXzkOul2zlEsuzrK9exmwa1yrnsPF5PDZDGPItTVEyJ5wcugOsMGt0Mm
	 BzNzPquRa40TtQDyRaNsj9oJZlb3NAyEXG1Ho6bENsNy1+MW2r1uHPRsIJz5V2UyESJy/
	 gbXKdf7IWXFXTCAYC7IhVWtOXh9I7XvMTMFf5iFYLfUBk3M0N0ZUQlaNcUXHVUul040n6
	 9TuPcNCf+QmHKjvJ8zGATRXVjDZCci5MsnVvZzF2yVKFbR4ujYLdqD5gVo+PwLDTKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=;
	b=p7rSZJtnuGWu7l3nRReni9nSrGbOxOwmxBc+fWh190GJ5LzX1yxg2PYy3mPkEbyzjOwG
	 S7X+V7Kdp0REEFa8mcGeCxfpj+ODr6rDka97yp08N/jWjHv8vy1/HGLhsXlZU9KvV9GdO
	 Mw2pbUQPbxsZLIm6xYwonWE/4xagpdCTyxlu7qpHp2RfQWr1j34o4n2zFxFf+NlXEwyWZ
	 +CuyCa/izzH6Sm4X6td1bJt6ikGiifegdai59N15UewLcsms/vzJHeuTjyvooN8vj+fKG
	 77mCHyk0ZuCJO005zL1ASugqHcTFDqS0lOJ1nqrd5p48WxJtqt6R9rsDSZK/LdLNekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9CCfkDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XKbFVwqh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9CCfkDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XKbFVwqh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9Dx718211
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=; b=m9CCfkDHBtQtvar0
	NYfH7dg81uQPVwzS1po3OITBRmUfqMcPwOo5cWXJyjfvoXUoQNYe3lSx/ObzhQ2e
	Ch7m2dCfokKZPKrkU4GTRz213IWkhyTHfoRcss+h6wVIQIidhaCVk1hZttIpvvIq
	9qoTTtKleoaH7M/pp3UV6nnngrJpyWHrrDyVcG6M3eWd9/aVfKRyAhgnfCzfInNm
	Lfu/Bkog2SmK8A1GZXAsXx7/GSosAqAkK9PfLmoRy0exxp1BgtM9zDzdqw8XIeAJ
	VsN6RIFgHALZX3oIeQgiDBjmCLRzdSfznhVGLf4J94QEs5/0K82TaWyoTtKTEw9t
	C6AARw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssrep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:22:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c008df17fso8485996d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006533; x=1793611333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=;
        b=XKbFVwqhA56HghU2BNW5hlrXHlB7ACKyymL6H03I9HpoHsIpRDaAGrYEsBHp6Rai/d
         H5x2oDx3Sszc7Q5Bl4Kn0PwWTgPmSkIiKm6z3qAx7IQWZ52AHYceMQkKLKjkbKgxVubn
         mJNuw8sVl36J+SpOYl+yexWVYoSoTw1U795hj7ZzOyGFQid4/ccz7ijtszkKhS/cXjIg
         qNUOwm5J3Wm/mHzeTME7o9e+jNZrz7d1gGb0ZCi4XErtRw9QDfom9gcLiuUYwND4R4qn
         2cp8tTnQYuoNZeEo7XV1wEBuR5kvNSTLvpWvlzoaIhhyxhAdAhfQG06oh2mIvw+G85jD
         w58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006533; x=1793611333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=;
        b=CE5GaJiKzIx5Vv8LO0f6myl6eWtl5+z3d21QvmdKnxTwF9Y728V3mkGEacGNqal+6N
         CCiK7Dvi9SrgWgJm4yA18xHWEBSwz34CqsSPn6GCrb1IYE5FLyj2Jb1DF3I+LQSb0mY8
         b+ZKp/BsQOO3/LsYKdKrpf/LANxRYqaBuCvN4tgNbzfzpU5K3w4WsG+pbifKkJP11Mjw
         688oS5FNAoZ+e7jVy5lhwLuLcQh7SW6SX21xTMDEiNviSkbujDtelVF4iEuqlA8D3gvr
         9QMMWjZDyncaMRpOSN6MWZRKuc8D4IOD2nNBo2tOOfi+u/cBtdENMJYhhYq++AshsJ82
         in0w==
X-Forwarded-Encrypted: i=1; AKwUvBw3XKYm18I4bGovt5NcOydcKVBdrVF2dY7ssvrEWmoVuV/ItNuqQVPzh3RiT4HT+cabP1jC/eDoOITms1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTLHHr7LN3lbhHzGLMGswwiuwG64/kSqnJiDvNdJmAlNGT6ZKD
	WCkZjgjMvChCqmhYjlY8lAyiyR9FNyjRkc0hh53QboEfBfbAugkFj9McLc6FLSZPKrny60mvw1Z
	WlxFeUEiJNfV0Xvr1eeQ4OTkEQ7Wl8sBzRSkn8dzguXNFD6fOQbYM3StJ/MrdJjNuolQ=
X-Gm-Gg: AYBFou04Imx9sKaX6FAlrIkVUXXTR3lfd/gEap5aea9lhUnL2YXKqZEjA9zt/nd8hpC
	mXqA2ez7+aytRPkLA7lenZrOBPBjMQNkWl5omu1Y9473W64Uoqq22FmrTYQmlso0hBKcW/6PAkx
	RFEpzG4cvcH53maAqM4etYcLCC0YW+gOcOwuCgzKwSTqneWykGDxVi0NbPCJrmlz7OZBxIXl38d
	PesPPWR2tk90jtOglKu/ziCHqLUnUpGCXqioleDx9Hz+Z1RVgiknaOvdw1+curMtTQ7/+vp8ABH
	7H9qJaBXyI62ugh7W40j5YK5h3Ox/0EhkTkAtCk6hsLRLPDvuiXkgSRdPFBo8uWdRHCCNECoJqZ
	HPuOY9k5IogL3jw5uNoijCQ==
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr947659085a.1.1793006532774;
        Mon, 26 Oct 2026 02:22:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr947656285a.1.1793006532304;
        Mon, 26 Oct 2026 02:22:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4992141068sm76044666b.60.2026.10.26.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:22:11 -0700 (PDT)
Message-ID: <a2905078-a7ca-4241-92f1-d4d2b0de3984@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:22:08 +0100
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
Subject: Re: [PATCH v3 02/14] drm/msm/mdp5: forget the hardware blocks of a
 previous bind
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-2-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-2-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXwfXcqUN4qO6g
 X0uSy7Z2vp1pdNnmhWlXIj6dZsWPdy+KgPXcWeLExykuuAmctZOzZVwGyLP0T+EMSEEeFlmDiHD
 dWtUrkfP1pglBwqYAQnxmZ0Qu5YslHQ=
X-Proofpoint-GUID: oSQMkkIboo1yE_E1_u7jMNJwI2h0a2eQ
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf1bc5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sdshgxurkjS-ratPg-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: oSQMkkIboo1yE_E1_u7jMNJwI2h0a2eQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXzdPoPtDQuYNF
 9iypW6wGZjRq+dNChuGwK/LTSqVdD6cMuZtPhR7DSuyxfYHzyco/xKUFy5X/V1UYAqL0bCnWCzh
 u3Be9JXJqToC727yuIAC33O8Jk82Tu53N6yoPe5gh/CrdSA0y85giLRy2+i/Aem6VBuzf7SPQEY
 5vqu9WWKNJh/R6YI1QTXUi5kp9f2ay6pZY1Rnf2/KO3fo2IHBaO4VcpikqdpFbE6Xs8khGBcGS4
 cIQhfih1MNqXzvirIHVXZVWI+aQ8cS/fHsADeytWMeQhmDeyiX9+cQe6tl5P+7AfVpZtOdXHzMu
 ktYLNWzo4Gpj1QjnhQmb8zEUbnZPDUFTbaIu7uUDbkuamttrmlnEN4gAevp2AGA35qGLcBcRjWi
 kiXGmxHPd5uDAsbjQEhBaYOpErH7G48sLOukfkTiL13G60eMX0HeBg0vloK5VmsmId9GsgbvueZ
 ePIYzFn5wszBIRldIRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> Binding the MDP5 driver again, after an unbind or after a failed bind,
> corrupts struct mdp5_kms. On DB820c, binding it after a failed bind
> oopses in hwmixer_init():
> 
>   Unable to handle kernel paging request at virtual address ffff0004d411f9d8
>   pc : mdp5_kms_init+0x264/0x7f8
> 
> Since mdp5_kms is allocated in mdp5_dev_probe(), it outlives the bind,
> but hwpipe_init(), hwmixer_init() and interface_init() still run on
> each bind and append to the hwpipes[], hwmixers[] and intfs[] arrays
> without resetting their counts. The second bind writes past the end of
> hwpipes[] into the fields which follow it.
> 
> Reset the counts when the hardware blocks are torn down. The blocks
> themselves are devm-allocated on the MDP5 device on each bind and are
> only freed when it is unbound; that leak is left for a separate change.
> 
> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
