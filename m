Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913306;
	b=Qin9cRkbaFWvdyEkI8OutnAdSsFWH5rT0zMgS3L93bBBKyDnXd/Gof74uZ2U+bNWEs5L
	 9BnkVAFSveVC+pdCSYikYNoj+EUL2rueXH7SaaDJkF+m7b4HL8ocf8qJjRAWishITnNfZ
	 S8i04bXpr8LioIeAGB0k0GCBx9U5pmczAvzQIgnT0fwC4qfUcJJo5FgwpFTK7yM7fU7Ur
	 X/LZjfJyZqDroecSg5ZfpXhxYiKdILXae2x7J6miJunocXJBa6YhVcCRD0RreDVillrLT
	 fGQuSCa2MLKyjFN62MhQKE+w2PiRKIQfWB72WImSLkrz6d5Mtb4XoIAkxFMLzEuJxSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
	b=u0c+l0+SxTBc2PqoypaUw27OXVfvEal2yMFh5OVlDA2O+vfriGEZh9narlqka5IfzMLj
	 t9Ae2mkj7ZUl2BAWIpTNY8Nap8BBSylCdvKo4nQmxe4NtQtBvZsI3uJPB0MHM9zuE8hix
	 jRbnKh+4vAkQvm5NxmDCfk1R6qh/G9yaxeoDhJTsb1o94n0z63kM9wlJLjkAFt+3gxbDS
	 SYxe89jifV5gxabeY6lFHA0/O4aYHGfwLzUmZVW0D7qJNv1CwLzDZUlxd3r28OI6NqTHk
	 xvFievVIuCdhj8pVxo0hNhAQTZV4/oCR2Iaf2LeskziwIwOQXzQABWu5vqQ0Ge2FJFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqorPMdx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69354606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69354606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=muo0knjk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqorPMdx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8m4b92934254
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=; b=muo0knjkPJLHmOJ+
	SeIMK/MkrZFvRSOzz9zyW7mOiP7Aeux59PJGrr2af/T8TJNfWp6wS3vQwgJXcXNN
	X5KtFXC2c/g/N9JMosketbN5Gs5gjhboYbfe2ZwTcxnTEMeWPxKecaH9rEQIRgpS
	+SSCs0MMEOwVkjhBAEpcb0sZwt3WlKRZ7b+Ef3kFUB+xNV2JqYiGIYLGeTPFItYT
	aPNQK0Z4C62hgoMi0sWVHbEuCu7SHu2bnaH8bu6+iHjElppP7JY6JFANxsoeqlAu
	q82163jaV1Yzn/+tnx/BpA5f4xhhLW95lGhlXjgxcmQsTjxUq36QVyA2qfzg1KOf
	zF1sFw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0arbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:01:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so4808188b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794913305; x=1795518105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=QqorPMdxDJBjgM3kLGv6MngQ7XcgrH4+AItij+9Tun8q9J1OI8MMUSjjprv8jMCPPy
         XMKMkoTzdlGUSZcBnqHnE5FFQl1rxCKMmxgo6Zk4hZwktvi8Jv+zhFenzFMA56xjodrw
         TLq2H3yt+d6DhAmG4yjKVPkjHpP6gAyRopUf9dq0CH+mxEX2Ojk8h4kFdz7B9KyNSFYc
         sShLXObyQ3MrQGWQXBK5qK23oP9qxY24wiAt8ffVlTEHF564g1N7FvZPY2BfNED1VDHk
         mfeDbNL1ZMSqAcdZNpiiB5/GCd71SJhCYAuIHZ5YQj+8F1K1GpjWpDhq7uIFyXQKoVRz
         mtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913305; x=1795518105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaIk7uMdjTpmz4jKxLGJh5b8yUAGglTN9V8Z/YtcjGo=;
        b=J87qHKLZHqMCzm3oM5EoTQe3WvE8jqtaZTxIra+LGtivcx25CXEgaO5uuXpsdLxdL5
         DfIOdeOE9W7kB8fUAn8b6VSoNR4jlt5nFcJC6zBvsxkOEDJNGLkZt5HsUaxwNboajMc0
         hCcAwKAUecXGkTSWdPI9XFjgNoz+QajFys4V3Q0XCGoGRc2y7cvsdW0A0llXdc2Let+b
         jYNMaqVUktQoSasrw5bsvqcWp6ZhObRBOguqjQF+puZvmW6dM3hawSKhJSW7aLgH5VPR
         oSkaOhJJblc2byE2JMITf2Q19fkUUu3J7dwjQ9P58qwyfIy3bmF0f3JlgqGkP8FKhi/y
         i+Vw==
X-Forwarded-Encrypted: i=1; AL+hErGMdf2L0ocNY6yqAZZb1hxH/lVDr0S43/YDWfZC+0jQClh7ZOiyCrKGmYneo37EKsEIetFQ71mRDaMM6zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QNeuOCyk3oEAUoID+Ed6G0ozJypnmBNlnLnTv+Chwi6E9wFYQ
	T7U202wfPC7ese4BfUGLSiGt7rU4YQ2PZh6g7mxglcfXPIUAi8y2d1H+UIfzKEfZFiRBeCQl1cb
	OS1Wc+voENjnzWW0jX3FKS5Ue2HOQyLbB3zHdb0NJkv/ufonRChExkJOU6snfrm/PWr0=
X-Gm-Gg: AYBFou1vR6nLgMdsqtsqYH9/xd1RUTyl1QYr34n4Foi9cUAkVR/JX3d1BYAENHLYR+K
	LdXdwRLrRgtuUQNZq1CpAXz3VM1udYHFENcKN5XYdggtvoS+ngN+Tu+vzy3TLVO46T+4BQYYGmc
	cvMwXTCJjJZ+gtBi7cjlF2BTGEICwMCmcF9AjXjmdzWC4hsUgvuKwTV7udAswMI+HRNwSwpW7RP
	1lvoQoHj114+CfnBVH/Mw5umpCWJ1RYvUwvHzXQfJg8y1Sa9VNjQpukCMSCiWAmdhsg1gntJ5EG
	iT7H29avPF5miZ9ZREGcAWQInithYkLmBWNkUB+hfAFNW6YE6F4496Cu2imD5cGs3DcJz3sAUFh
	OhsmascwdKcW64vnQtkOPLYHAZhEEqqcWNesldMH8EnZemK3rm3WVUK31K4XqEIZvkNkmCXlm
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991741b3a.29.1794913305037;
        Tue, 17 Nov 2026 03:01:45 -0800 (PST)
X-Received: by 2002:a05:6a00:3773:b0:89e:8915:24a2 with SMTP id d2e1a72fcca58-8c42858750fmr1991679b3a.29.1794913303862;
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b648sm4805369b3a.46.2026.11.17.03.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:01:43 -0800 (PST)
Message-ID: <2e247391-ab5b-477b-933e-0e396e0920d2@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:37 +0530
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
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: talos-lyra-evk: enable audio
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
 <20261117104303.435294-2-karthik.s@oss.qualcomm.com>
 <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <2e7767be-ed88-41fc-962b-7c4bd728e856@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX9d0EVC4Q6WoK
 qn6vhQvzwJhmLSApMaHUFpZlh+aJud/3dtfRKdFQ/Q1UeHeRyCb13LYYoHAjU0RlKEql5uwzrzD
 4xG/2iy7OLSkFhgpx+sKHqEuexImeA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfXw8sbWA3ktMOp
 fFkZOuJ1zKWxm/GMNkI7pC77QT+KptChlWNxeF6lhCkQnqFBUBi3lvamVoge3ZPbO4vkkx12j4/
 Bq276knEa306zkSPzo9bRfdX8gArmh+2JCAynXUxC69Fln+W8njjp5MuQJ+/FSiQosG+afX0WAY
 oADfqJzGhe7XwzHiS2bgSbBuRnZe9kij0w8UYcSebuARlANqrcAegi5VtizfT3veCfnYLYrg9ei
 l5XKoC6I8jZ84C0AudfAhlg/1+kcUYSDEe3vr5J7Pgz44FgNb4HoFHrgeuePG9GLpW1JVJMuY5y
 GKkKkH91BE9KM+Xg4pKa29GI0fdD896rnaQw9uCv7ihQa0Usz5dSGvVsiTr4pkLLkSQ+bfXZinO
 VNzZW39bUbytfSQHhtKXD42jyOaKTunRzgX/yfdtLoliHYzc+WSOHAAc8dfcA0U8ncOHBlLcsqZ
 UIxymeKFnPu18UJ+A+g==
X-Proofpoint-GUID: Rrc_mTECYyLx2XqzKoGOiLt0mPVs5vBg
X-Proofpoint-ORIG-GUID: Rrc_mTECYyLx2XqzKoGOiLt0mPVs5vBg
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc3419 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=HA4giugNgv4V6a54TBAA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170043



On 11/17/2026 4:20 PM, Krzysztof Kozlowski wrote:
> What is happening here?

hi krszyztof,

git send-email seems to have picked the wrong patchsets, i will resend 
V1, sorry for the confusion

Thanks and regards,
karthik
