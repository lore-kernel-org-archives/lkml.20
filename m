Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F432385521
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157883; cv=none; b=h8DRds7bN65Qo5dYyRG0n2FMBbsQjCwGFZj3d3jwsPlMUJ78GoHkboeKsNlnqv7km6+ECM33EIgkrmrBrEtmJoZgYNVcampBntJIcvAzy9kFw5BkEczZUAIMIGbOKWeL4a/EUt6tD6c03a/pGnFUuSIw4+HUxIKYgXzdo/to4j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157883; c=relaxed/simple;
	bh=SS5aXk6Z+00260HWjb2yBKL0EsvuOVsfTLIH1GHielI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu99CLSpVTNu7WK/tnJAfGehPm/tKDry3kYAXI14vkyAZDmm3JwgiVZ5fP4DqhWs1QyK1lReRfPLo6GlR/VOX23J4lttrskC5+9r2QAFcNgS4X8+mNFDY2ZProaWpGfYATqVKsZz0tP+BdK3rnaGjnLmioDap9iAiBlGqi3a09U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O14M54xF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmIlZKij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O14M54xF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmIlZKij"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAI2p2998528
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=; b=O14M54xFQmjisn3I
	egdfMsm2hE43GxzhnmQ+X+SQca5uEgstY+NyEiDtdB9UmCYqi4fPfVHXjR8Pr5sM
	a55crih+/B/gwX8JiSVTqYqsFDyG8sqBafOO/tIXy+/xCaEEdTm546WeDFUPjHe/
	QcVsQ6vLEuX13rqObdj5qeT71wDBTYZv/58cgJ5R6KGHqlC0qAntAWej3fgtgR1b
	ffo7R1dBUZNDOSw9yzIQbhqOXGVBm1RX2NPKjgIrzdbg3Lddh5qCXQZsucnluQqh
	M7TiWd/rcg1inM+F87xEQVE21x/iQ24i3fBAYDqPMbif2xLLA5iE92BJ5xyiqR7J
	seJTVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12smt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:38:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so102967585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157880; x=1792762680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=;
        b=UmIlZKijOppkVzNnOlJ8YilN1MRI8XzFKd5RGTFpaWPXObRThRbOS7eSpjGC0RAAlQ
         vob7c12F+yrlqcnx3V6JpFKsaTHfsbuSEiGCDxLWGojpD3slS7DoYfLkWnj27CFwaG44
         Q/eNfT9ZFcNPm9OBSS6UrFxL7sshDVdLP6vAtA4lG79Hjaw4RUegfbfKKmBoUGfXp/dp
         Ev3zZ0HaHFw0/7YHoiqA83gjDdMKcxz4XDXq5JrED7+YQZW9syBAWklDxAMKPo8U3uDI
         mMXwwxf8VnMd9ckjHaFxZjMJP5AsJzE3u9YDJktgFsCx9nObnEJ68u1sFGiCt3E3SiMs
         Yiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157880; x=1792762680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=;
        b=0CqxOyGPyYxSu4EnAwO3DpqEROhLRkLQxECh5pvyhdwi2zMX/QG2/paX1bWJQ4fmpe
         gCjeoksOuj7XstKISNwnvCsv+B8AnbOnJdPMY7fghaZ6mLp1NSGbuYAVuQw66XbTKCES
         zuWpzlw48/+5+0hDzgRrOw/RQIrszlwj1nre5ojI8/jlxL3BwIr3EXdiTSv82Y2Ht4Be
         Bp2pfD7gjbY424V8GcWU81tEA5OXZn0EHDNjUWBqT7VsDIvH1s0rJzVDgST+g1TQd8kZ
         4DuZxDNfVNtueJGnPsBblsk4CfGdoRE1QagZBdWBjf5qv8REOrI95b9Li70hVRefd6JW
         YaYw==
X-Forwarded-Encrypted: i=1; AKwUvBwzhx/apop8Y1QQeLfLNG53g/v0Ai7EUF8xlEoODoNGA/pMNjZK/5i3fONMlYEVXrtNvzsaRh4DwrI6TYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBVQv0SQYLES95lEk0pCnDk2USLpPsUb3yCW+imY4drQZO8Y83
	WqOCjeP3JRCMoJj2a9EB3ICsEHxFmbkYQ5WiawUe2m8WQN1h6CoQkfmEmZP9zHSvaWqLciUgXXC
	XAp7VYtlUjvcHUI5zWrMVjhe5hE32jxsY7N+Bm1PVN+Gd88Oioa0NEtBqZDvc51Yy0zA=
X-Gm-Gg: AYBFou0+w127H4XSXTazq63uDs4erQiYsH6cNDYj6w26mshP9UHFsqQ1kb6WJZXFN56
	Jcsf/VNSNrJHTB6qVIPHeRzh7dHJbKjQN1cCRbT/oHNQsrF7AhJfp51PZGlwjcYDN+gkTXlKEF5
	CTHKqUXZ1ic1CENRM69KoVy9odk8L/z6jrndzZ72SISAci02cpE6FNAObGlajnrW9YgvG5qnVpW
	Q1xIkSaSJgWKsyqDWBSeXX3y/RJaOlBv0tdVIB7RN1SAYrBw59bquwY1phgdsofq22nTMAZLSCc
	RKXZirY7z/LZODkFDXRyTcLzWSB3lA54E0vYQjQMtCaxot3p4bYws1m6vyizLbLWnfZJ9u6OnOU
	YyoSSMY89m+MyGOLhZQducQ==
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr162052985a.5.1792157879893;
        Fri, 16 Oct 2026 06:37:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr162048185a.5.1792157879272;
        Fri, 16 Oct 2026 06:37:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c633asm894616a12.16.2026.10.16.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:37:57 -0700 (PDT)
Message-ID: <20fa5e7d-89f2-4c72-be6e-2b6a802d2530@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:37:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q09HQjM6hy2BYPM3tpmzR8c-iTiGXPP5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX5cEHaxXUaxt/
 R/YNz9aXHWBLP/ZPadBbGa1Ym/hDVxSnvOKC9K51m3Ii1iORy6ynzUHI7m+/zorY9xIuplFwN0w
 zZ0mln36aERRdz8alMBvF9fmSRnDmxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX3FuvVIYZeRzF
 Hfrydc1MZA//pJA1O34H5yWgjFC8mIVk7Vgyf/xdq8CoHCwfzTXGDrYpIZuitPiHwNm7jYSxe+4
 9G+ADRifEZTWhd80QXAFFBLIzxbPqU9ghhQT72nZCnQXHqQ82t+u9r5kVFYplY5bI7ALvKy2AKL
 hyCyzuMKGZZAm+hdhd24FCu1FxA/s9ixVn/DDZkJX7y2QLwAhH6VvnwQ456YQad4oysnyM1N5VA
 RTMfHpWjgppcNm4611btL3+ldLD9P6q2/YOLHjzshvoG7IJdnQafEbDkXUlFG6b3oXEN5DtrQkf
 ipxzVs69N2CQAyrcdxjLYItBgpA86T8o5hqdOREzWGqHEEOt6Ws5ahVAma9KpT/9q4c6XO7+OdQ
 HOCQlBpIzqoM+eMoh7ct5j8G6mXm8MbuOMmB6UgzmyawpEMC+rXN3wtkURo1PNo8Egv94M4/JCG
 n9/zPzZNLZRnv2wVNGA==
X-Proofpoint-GUID: q09HQjM6hy2BYPM3tpmzR8c-iTiGXPP5
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad228b9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=erN5cKggTshIPlD3kWUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 10/15/26 3:35 PM, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
