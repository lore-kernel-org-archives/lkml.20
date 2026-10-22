Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672093;
	b=wS/VaTtyotjnlfRE+JaIKLHaU46i1xrSfuxRYUqZcV2DOlHcw/lg7EnfKfg9cIzp+QNk
	 atLPJ00IEbHZDJqrV5ByRBNL4hmHfJy8vptsnITdvOQFarwyq867broBDaRmIXlIxfN15
	 sWsQFXXvLKv42PMrp92GYunp3Ajj3/Mdx2nGVEK/SAnfbIFVlpuE/oxR9VbqY0GdiDh9h
	 o7mf7khATvFOaoeOVTEgC2Y/6jNNJGogl6fPDluLaONqJAr2kS2f6QUX/bZJkkpomeirT
	 rPGYoqFj43AYDD4W/FqBSnVRrgfKx5CqQzxYx2U9whWBkQsun0p/lPqEvtKlY4Ot3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
	b=LMlbrpvUBlomMg7FZmiSDPPr4zg7dQDH49XtfeObK8BjPFsph1ljynJ3im8xpqUk7QG5
	 EzyznlOOdWcyDh7h7SJNrlJG2UR1ckbr6kr+yCGKgjxgAQ+uJX0B9I6HkU1AOk644lyjR
	 0f43Ts7kGjTbbMl51rfJGIoEn7cRuzS8sUQd+d/ofqdr4YpIDbkCan2KteIoWZmgNz+Ta
	 o7ZGv71PjBasAditxyyyviWj2XPyQkHL5gsXrsGqh/Ip+7D4BWhwYbCGicejP0OocF7M+
	 y9Qz0zLU8aQLVUDPGstxPo9g63GYL7i+yYq7YbAGexdTwvB9tBai94ML86W66RDB7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk7LeKmg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YDDvB//5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD686606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD686606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk7LeKmg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDDvB//5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0MOI1965947
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=; b=Qk7LeKmgKfl8ASss
	r/S31nkFb5YhbcmUSm5td/BECe5v1/SgAUKL+3yoqW/lRibA20tcdz8GOCTejfBg
	SJnhc6mDE3oLYQ7nfvuFZ8AOxYLsPwr0r1E38ln8TXP18dG+8EWHGPBJlKfBr3fE
	VcGF4BIJOrqH5FDylxqT4Lq/KDCj1IJpqJhG5yfK7/MIdqpE/fgqBrq9Q/nILTw1
	IzY44rprRytmIoIGq05urfI+V3wtpeFQtS4HFrD3I/HhyzSUlG0u+Vhxnhui2rLv
	qbPfovCQT1cJYHYgXzKW0O4anTJTXMj/jGOLvJ/icvRKkqNw4umV6qAIrYgHlM58
	W+/f+w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ak6x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:28:12 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80a4a17618dso1662074a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792672091; x=1793276891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=YDDvB//5wUrrsMjA+YOjITn6gFH07RI8ByXRGm5tbEi/x3FTKojCVivuRWJ8C5RsGE
         hpAN++kQIO2OzyiQI61LcvkrklJLzwQhpZe0FPXz+0w977W+VaOzM0xrifW2TDcLrySu
         ntOAlduDV/IVdjKapF8Sr0LDsRgzDICMUTekO0VJsHXE2UjAySxZ6INfhIbHZwZsf/y9
         otgi6zR74w7vRYgkYAy4l2d3R4CCVY9tNUrFutkieB20d0VTUXkEcX85/XMgBYH/YwCi
         7ePqJ+8bn2e1Jp2AVdwBRmo2ZNnqF/m/kfZDxOIoGZ6cgr79hzVrAZCvEoZwSqBKuQnl
         Dt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672091; x=1793276891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffhVe/j6yRlCzr2Q00fG+yNfZLrhxessWH3dfhlXdzY=;
        b=dIOGFtcrCXRl+0H5Yhdzv3nlcg0IYkxpmgyaSqkGNiawQeBJODiJXgdzpZ//acJn69
         TF4qeo8D611BKEe/OC8KTs0HgdCTCzuOMmSxMtaNcxTL1BUIN2tlD1uNO6cFuTE9kgL3
         qjRSWY2qVCFLtnXSTGY7OO9/kvsBSsr7J0XgDhYFsIoIQXh3GUpqLwU1a2YMTbGqxdjv
         Kne8ub1tvva/GktyuVBqhfjya+VWPjoWt6CHJkNto4iijQjq5jv1HRh3jFKkGF0PFB1w
         4sssvsNAdmPwUE81GHm5cjr6DMeSsyfK48Z4urHFKoLNg5YTbMG8kma5Idnf4lG1ir6i
         cQkg==
X-Forwarded-Encrypted: i=1; AKwUvBwEiLj2+yCvWIOD5mcF9XG4pMmQft2kxbXBl9tQKe6cTT846jJfcnEUVa90dnqgobiypccyLcWG0oUc/vQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIblRpRUl36vkDl2st8GrXIv7dSR8WZ3U/soGQmoHXQkzJnoUzR
	XgKuWdONjqW5Bon1vjllw3i3paOQBws4IC2wLFBAurIFVLWl+qJQr8NZ2D87F9yTjrb/VsdLiq4
	2QXuiXTZR4DwGCagTl4e95t6R5cHf8MvPoOB2hcWZYSJKM1DnmlDjQTAqTeBZie19GJZUj7D+uR
	o=
X-Gm-Gg: AYBFou0mo0IsJzHUJMuDMxuoch9zJlBgN5T/pwf9JkRsDUsttsSE4CM/IF9levT0lKU
	ji82oKrizBUOoA9NUpv4N+1+nLqePLsy9QwF9uh9RDNpGiSu3HpLNiR2tFUKyUL7b0LziNjA/Wx
	cQQosatdTTOx+x7a+Ib3yVRGkQoz9/BjdtR7mHTTM/ZFhQkUi3Cy5vFovfPVCrhp9aXR98OyxD0
	/Q3AtddHbtcd1UmKBRnMbFb5ga5MsEiWnhRai0BdhoyuVJnVjhOpO7GEKGIJUZxAq4u07khAI2+
	/e9tm1LD14feZ8gECdBEAWVZbfiJdZf8Ar6uzNhNtEn+TtoX+rr6+ZhePXkJm11jAlQOKLQIOit
	ht5WP49hIDf+ws8LMMIEk2hCElK2/aCxf
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258634a34.11.1792672091198;
        Thu, 22 Oct 2026 05:28:11 -0700 (PDT)
X-Received: by 2002:a05:6830:6f88:b0:7f9:555:1def with SMTP id 46e09a7af769-84e30c31e32mr1258609a34.11.1792672090792;
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm4892517a34.10.2026.10.22.05.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:28:10 -0700 (PDT)
Message-ID: <d6a3a783-c6ec-4f93-83ee-ce30848917d0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:58:00 +0530
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
Subject: Re: [PATCH v3 6/8] i2c: qcom-geni: Vote for SE clock rate using OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
 <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-6-5da1096243c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX04KWVXMFEKJZ
 PsRBIRUmJjEl9aOAlNsW8JZUgDg+YlHnBA71VL3QE8UFI3si1t/XBgOqYF3yHQCSXlywD/Jqg2q
 STvEZoZ/U6naNct7rLjle+w+gJUXAbvKC/9/ZD0BkABU1O3AswU5ustm2/q0vkijOWp5qwqqxoP
 qXysY7BBoBNUMa7RZXaRKxLrDY10+UIt6Kedq60MM2ZqXNhTc1hYzjoTxkwUnbIvupowzbJRBRa
 K+aTLthcPkPskJQt5mUiazQM0XnqxQpgNUu2X2/fc5NnNchuZKupURKLTTlRgymlMd3Z4ERovpp
 5rPY6CVOY7DskB8VNu/Mb0IivPfPuGSxDyAo1DHjnUYnInUz1shF21vEojKeQSTHSm2y+6rbbIH
 CxyV3RAmnUHvuGbEuupPTDHJm21VZ6hyFWByzxvspiTf4Qo621THLt/TxmkL9qjAPZKidjxzrYp
 8GTU4zG9QSLy/5Y3ubQ==
X-Proofpoint-GUID: u9FNrJbtsvzUiU3vkG2kDly8MwvQikk1
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada015c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gi_f2RLh3HdMVU9WvNgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: u9FNrJbtsvzUiU3vkG2kDly8MwvQikk1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX+c0aI4+gUB85
 Ux42sLyaQH7q9z2wjkNRbGGeOiJh+jTHBnWPQpOPTQxRHyCa9Ke5AwKkrYXfoB3H10PsFmgruus
 G/aIf+iT+zQW4jZtDGBUFajOoAgU8A8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220049



On 10/15/2026 6:28 PM, Praveen Talari wrote:
> The GENI I2C driver selects a source clock based on the requested bus
> frequency and programs the corresponding clock selector. However, it
> does not request the selected source clock rate when OPP-based clock
> scaling is used.
> 
> Store the matched source clock frequency and vote for it through
> dev_pm_opp_set_rate() before programming the clock selector. Also remove
> and restore the vote during runtime suspend and resume.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
