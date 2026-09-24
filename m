Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7A3AFD1A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225842; cv=none; b=nvcAz1CFKIqggNUcyCcTGGb3nam5AqEeQm11Ru2eLGMYq5OIV69/gzYsF4aqT50es0ahrscRE+HYT0Z9e4NOyiRqHPeBf+JtQ8QV4SzXTwnfrB/0xdrDy99i0tK6Ngr1G/s25nOWyzBWnIDSbqUdmBNnhH3WJrmSpGDfbqFx2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225842; c=relaxed/simple;
	bh=Mpco+6yNdH2y+nlCpp5arIK1VEtWdHw1yaMXxUPtWOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W04WZXMG3qW0ZP/fEYmo6YOuEbXVikMgz0PUhxe0drGRZyW8F5v/SXZQBhcfAP3yYfYy05bGhHx6rHOexCKc1py5N5k91vlUg4ofYHxu59XdlDO7I/mdkYxV9paTHPT18LQldXcduI151R2vdHe1/uvTu3tf9mRCWXePhDVtcWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFiYGhSW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCSXbeCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFiYGhSW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCSXbeCm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36pYV822694
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=; b=fFiYGhSWRQWymu2b
	PSG/AjuiAoXlbs0NkxQmWgI4tCo4OFt4fiFScB94yiFXfGxQRm2LWFkZegMNY2XP
	Dyo1ieW4T3dkXjj3CVgckAAwQih8li0WUZqrVWLHlhyIhFaqtWSTLxUU88kha6+N
	zrKiaaytH73VlTeEJBLo5yMZcsijNGTbT10S+GinUN/Z1jqLH0DhscPBfT8dQYTS
	s05FiE/rJggcmh6ri6VTIvS0d7DDYbSLlyfTxanwRDtAF6c7S7zI5Sua0DKwqww3
	Oy5NrcNd4HFDzyQdDgv5NYjGGnkSqfyS9EAYgbgFeMeVTPmKaFUCQqJ/7LzJgX69
	Cc4gyQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrr9rhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:57:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so2199906c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790225839; x=1790830639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=RCSXbeCmY5kIV6rLkpryqp7Cjw9oPcTE4bs/KKiG7foUoTZF5rPYr88RN2ekDKmxDb
         SyxTqIV9mQMtvEVnBSSE3697jHqnbzU6Y9jd1Yq7+GlPazbVZXMP0SAhfJLrjoN6ynhU
         CTXuTiFRcn6/GTs5dE3m/g2La4NWV8PVE7NkP+h2fTV67Ib5WNua7bmy2TVHbHJcjOtv
         TzaTE4Vsq8ic9UYOMesqPsP/jmy6BAP1EFF+FMYYfjWHkXKqv9gXnYFItkSYvAJSCgbJ
         1HS/LQmeZpGXw+kaqi/k57u0XufxMMyykHLVttfYSXXNtK08DedUX2EijnbM1uDXKQ83
         oYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790225839; x=1790830639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=SH0aunoFlW61r4OqbK5IGPONuHLV0IcppHxT3M/5BLBxQs585TNaxF3qW1iv+g9ZRk
         gohJTTCWihLl/MROSQjm+ch/4qcQieyLeUoeMcd0kIIvvLBZ15YePtZLzHKV95qsL/AB
         xgJx536aynIO5tYYqvGSpA2Htm4LwSEro5WughLAe2plXtzr1WU8dGnIJypxPP5fJO64
         LkFgk2L9HZCF2iTyKcLZl4lQdttl6/8ZMEWrsAzTipwNjSad+leYMnQp+sfLQiaghae7
         1121IJ4N61JlypGi8YWIbL/hiqFA0r2TlDQj+Jzvkog6vluoFZiydDyfSI3nB0455M/g
         NB9A==
X-Forwarded-Encrypted: i=1; AKwUvByPvJQcF78OAwHVPj/dZ0vvV0I/wiV7YsDzTEiEo1vocYhFg9RdQFF77oHz7J4RFQ7C2Ddq6qISjd4nYlc=@vger.kernel.org
X-Gm-Message-State: AFuF++nkF205Pfzs8nSqC+wnDGlgffejnLd0FCu0GQrkFcmj5Njd6Agj
	ISb0bCIU6Jg8TD8GYNlZFO6kYH1oMNBhGBhdpd/Lk3pUTbFqEm+Fr2+A5gBh3ZdsicG6oNZ2KIx
	d1MRCKgZb2FMuiHORbRJJx4MeTOuKkXO2OEF6M+u/1R5BbUP1AgtGvdiWQccEplKEK0U=
X-Gm-Gg: AYBFou1mB+Fm9Ng+iI0Ysy6n3fRqlHrZ+jsd+tNoc1HSSxqBx237Ty4U2ZGri8GuY/J
	AziooKlaAEZ+4mkqW8MrMhtrRn5jxO5GzPqGsKQqycN1uvqZZ6ylKESfpqR+DLe4SM5AhOGDiEf
	QHIQ4OJVDOl11WeanOuKQ4PNok3G/K8nAbEBKVEAu/59GxEufhQSej4kRKGDolyEvOWBXVxpfbU
	rC2uU7YKJcP7tG0eZz4zNtBx3Wk5hKzp29QI9CS9VVyCho9lr7uSGd4+8Lma/MtCyIBLTDowN6P
	WRqR3ex8S6fSMXzdQ6+r5sqHMsoDyP9vEzP3aZ1SYcym8XLX4MjcnFtqvsYs1I2zmEyqZclfaP+
	fwlufw5111lpFIYqztOBn2AI7bJ6K
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007932c88.21.1790225838805;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007916c88.21.1790225838269;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm12919002c88.6.2026.09.23.21.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 21:57:17 -0700 (PDT)
Message-ID: <92ec9d68-2baf-4b8e-a8ff-74e0d2c7295c@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 10:27:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: hawi-mtp: enable audio playback
 and capture
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
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
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfX39yaeQgYZpuH
 ENHsjg37OyuLICO14LVbPbSJ/Klkd+6gzY558p26ATJayKXQJtRy6eIIj3XNZGpvggj72p/kBde
 QJCjnuYeDcRkXIvuYrerkCnmkkec0v3wiyk3MI8Vh0aGKrL5oXL34TBx9r0CGgxzJJvPOlqzLux
 BX+9zlQ4O3VtBTBLHMeD9P8I6fywVobHkO6YFCikf6ia20n+erqlMJarLL7ZXJ2gxCqvapb6zIx
 y0JpUwX1mlfpvVVDLhSg6hSoqC5GBhInaBBRxwV3MHwOBmY6K3N2lLMDTnoaygSRLwSLn1CHK3y
 0OQXYFOEm7pey97HDRLU6n/8HOP3fZo6YJWqSiflbAs1nL7fVZrlHw7g+hE3Tcdz+aoDpk4k952
 OmD+O2H7P/KDk9NCQS7zOR/1M2vVog5pjWsaoAxMVzdZc5dg40OqSOqTfinJTpXN/sbfXFkLaWc
 z8pre7aANB8NlKZjZmw==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4adaf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xu3tYevT26_x5ihNIyMA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfXxAgoDRijMTpD
 t30gi8yve1+v7iM0UrboSEei7LWO40jZxZLlH6137LO+GDjryEd6tWZt2l944wgeBRW8J9WKSob
 mDwvsSYWqA990DnD3/beSIxg7c7StqA=
X-Proofpoint-GUID: aRT22nBpBmSsqf-C4BA8mTxai9PJVd1M
X-Proofpoint-ORIG-GUID: aRT22nBpBmSsqf-C4BA8mTxai9PJVd1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240021


> +
> +	vdd-micb-supply = <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +
> +&q6apmbedai {
Nit: extra blank line here; please keep a single blank line

Thanks
Ajay Kumar Nandam
