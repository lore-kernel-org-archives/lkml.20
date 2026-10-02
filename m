Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF21BC2A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961461; cv=none; b=uIws3JKYQU2XREZWuHNRBUPsxhh8ObA8i/MyRSyHT53+QzUT8NpzbMYij8//yovJwkiV2sny2DTbOYfU355PlwDV6LzlME2uuSDswwGNDDW2kjr39X3cC0o8gKu6LilYkd/qfI6gcDy7unANJ2L7wrVGBP4JSNltT5HSuytuvk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961461; c=relaxed/simple;
	bh=cOSITwGmcb3cfSGmr/b7iRLqk+4E6R+342jJ/eURH24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzAlUne6UTNquu7JjL+zAih0ydPYSctuekzdkv1m9Qlycj7vKfCqDRVc0EeaNe9EvWTTqA7eDZlxnnYZv2F7UCecdiLf5RxaRy9PPuNtNl53WiRzDt9j66VQhVmwpRn4rBnaxEjNzGNOqmqqcKAy2+HnPnVPLjT5aPk4AN5kt7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeyvJ7f7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV8lZjPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeyvJ7f7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV8lZjPD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H65pF2115262
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 17:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=; b=LeyvJ7f7HWN0nxoi
	VfuPp1B5rlbqdq0LoaDpuDaHbvUmBwfq89IPBS2DFQcDK+/C9PtFDDVmmac/Duri
	0wa5FzkmB6Hn0nBNXJn4LG8NSalOejtpKKEGrT0Rd/tSMSzNBRbjug/DwoO3dPcW
	wscWeTJoKLsXpsxn+hG/79IfDoE5jIm+kk6dQ3dTTxIZq0UHQ3NTSAVaoHQKKp5K
	eVw5OGOqHIKB4b8kZ+wz1koDndZIMKVLGgO2IKLhxO7z0kJ0uFJ5oQJdommxer8h
	BUYdX3Zggpq7d6+GeMLDejLZ+D5H66nCqbP7TYNRSVkOyVGpNJk87kEnW3LDmLDZ
	EUcFug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tm9ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:17:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso4093288a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961451; x=1791566251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=LV8lZjPDUH4R9zCngxT4HGLA4h/IKEWaViP0atC5rsrLAILyddGjiPPvCjcTsQ7YHM
         RUAT3y+WJIHe5lZlCOhbQnApQYd23ztqM0ms4ePZSlqnaAz1WatbCJgz6apSjVrxmU/b
         9jTJt0lFl8xawzzUumFEjwQqo5iJKhcQkPILWMZhH2ltFS2/bFFbFfhM1lOfMtteEc6S
         2wywYIVgkksKbgnWU8lGw6OLwLPeSKg4IuDceYuVUsYVQRnTfso+dEPhQkOenD7Uv4p7
         v+MLlzuKBTXJRrEGNvs/DMbP6DGhA3N+KolgVA9FIwF10o3S3QtcnU2tFq4V+NFFvkFr
         xoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961451; x=1791566251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRmhMk1rJiR28ILluI4xyd5yZQyPwKu1cAuARHSO7IA=;
        b=BTVAnTqZXfvSuc3cVlQNakxZUQ1pTANviWKs85xpV4+Qfw5ye7or94hECGdWZRM/QP
         BBNRnE1XNrlc/w0BXw70Nl6U8EDv+RYnaiaL3drWmc6EAVyRZRTlOaQt+7ydYLA4J1xE
         QwRU3adSmrlRbhDvBsSrI1GtHNLUE+xSn2G8ohElp+ZcVz2hr7C+iQnhlNl+hBEx3vcO
         QB9vW2j4niSI3s5ztMbonGdL6XzzuqqDM/vt6hDHkxMuXrqDZbEgEvRjsxVzK3a6+W+n
         cTAao57AO58ix7HN9sQhMU0bYRNJhm/VBlQ4lOtgvGJ8g2pFbvgwJQGpIIk8JCzqkQjS
         MTlg==
X-Forwarded-Encrypted: i=1; AKwUvBzyU1qPTlK9XmQpXRmnRH8zjCvXRmSzOcUnXX0r/BVa2YksYZlfVA1aOqyDL99bKRFubS3Zkxqj05P7uAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6avHXW9hi94KWwArC+y9hzuitnkhRn9opcY5dySZfEOPY7vJf
	oGJ5WVh05E0HQKgka+D7zwljo1uXRXbB1D2rtnc46VlnLbTr7dIzCcEW8XlLlp1OOV+rd3UbkOq
	aY2qMGsPav1Jd5dlKc7NasGW97p2i3X36/L5eDnSeS3K0zimjRImEE2fmxVGjaMWCzkM=
X-Gm-Gg: AYBFou18snc+JFaaKdN5o5YFbXmQZubaimWKFmCljTJpqyDsJg7svchCyeQsA+l4X3/
	9qqnm/y1lGL9QwKwa56kRnIDKFiSgkJr/Vz1tS/rmsN8T6zVxdSsVu/k9XAcFjYtK5t+/WZdiQ/
	3P1Gwq3veCyfGXnK7cNFhxbKIe+07aqrHIir6DDiDLska7W+yjh87xZBlShXYTBNVZm87YJoex1
	bVt5JpCaRxiEEs2SmIqzGp9XPditnYxTAF4DDMzG+iJc+Y9Bqk9wlS6pigxO/kXkN7VuXuE7ZP6
	oWss48NwhZyXuHn3TdTNZhcskXb/2OMmUM0+nYdLgWS1jTfLfZUl9WWZumGhfhhorNHNOfLWOPs
	d8+U5naSr1aQQiEu/MfUXec+Ja8Bp
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133195a91.49.1790961451438;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:3a4:ee2b:31ae with SMTP id 98e67ed59e1d1-3a6ceadba84mr3133178a91.49.1790961451018;
        Fri, 02 Oct 2026 10:17:31 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm5295357a91.10.2026.10.02.10.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:17:30 -0700 (PDT)
Message-ID: <c5af97b8-a595-4531-aa68-6c5e6187b3ed@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:47:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TbYtdAAseB7nNLYrSIzMjoZJvSo8DOjD
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfe72c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfX/oS+6Fpbn9jD
 iEVweUsXIRYxam8t88/NtIrvYwZPQAlJOqSzoq55QSYYFRzfAdJXMnL/zG5Ei+FfqJY2/nWpwsy
 TkLOf3yscq5gnqfSKVTLHvkhoTqDtxapfTROH/Fy2Jeq+iVtQAUcQSyti1iM1MKESqBLqHVTiYX
 KuJAugoXfQ3HATmE5JrdlfkV26axkDgkUR/SdX80n/ab/joupJTcOVUuILqnsAp4p5H83/asNPR
 gWqH+ujn5XkQqAOKWQwa7nsvT16OHJGU0Qj+C6cAYyCHDN3wIv4GoGIfp8myrPHzWJOlW6FFOZC
 c61Eg1pvDTRhAieKDXIALlZQiXvZG/JFo75OB5VwvsxaKAQF8m5Al4SxJFEJPQ49wvxV+CnM/Pp
 6hRfhJHps2qFJlRNHU4I4UrymZ9hF5qT1ckBzFzyZ5bIMKABl0tlR3A0IYJc3KtdRFn60Hxx/Wr
 y+5OYNvVQTXJMvHUzYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfX5PiBh0+DswkD
 MITJSZSUSr6t0ZWp2w2pFZs3MbGCm08mxtgXbsU/ppzGj8gTyy16bFy40FwLB6Eiri6BH3Km3l6
 TVun5u4EPzdnWhaDEimDlmp6v0BE0p8=
X-Proofpoint-ORIG-GUID: TbYtdAAseB7nNLYrSIzMjoZJvSo8DOjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020068



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

