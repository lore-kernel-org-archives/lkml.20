Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34DF23C516
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205235; cv=none; b=VLDwrXKyruwmCttF8NnrMdrVjpgzc8W/V94phWFRKQBM4lXVw1QMGMOb4l6e6BaB8kQnMFEEKSN1U3kOZ2LpErwrFCHXxDSAgedeazF+K//HFdFN8n7rfzJCykxnDfqHukrUGH4M8NA31AZv63unelcXDAcrklbOXRhrGVp5uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205235; c=relaxed/simple;
	bh=y/DOj5Kxtb7coTB6QB5NVnMWGcNdmwOCmTlT8mckYQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goMHFwCVRiJBko7UtDFumBjv+vBQn+77FxsC/RBj0brfldysrtQzdkhEQMQWpT1QdUR6TN85GwpvoBJ7RLKRbEG+ynK6kfewva1BfsFiB812V21Wj9FX3r3Xkg/zHw/6gsV7sAtC16NnDkXOOpcx1eTQAuvEt+7ZYAAMsFjiyck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER1teMVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GplY+3Fs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER1teMVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GplY+3Fs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFTrD914054
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 13:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=; b=ER1teMVN7KwQmU/5
	3Tk/S1h0H6gRZldInKL6PDosLB7EVaf3Vb5pvhUdzRp8bEKPUwWwyPvRdmDsRTuE
	Qb4b8BQBOsQk5jc7gr12BxIyvO4JC362XJ3zYDvUMBDmq2BmC99KA86Fx66b/nSC
	FDklqorkEW0OnTo5B2NT1B7w+zSqoRZmAA17t09Mc5V9hTcigi2R25PhiR1bZ+pU
	G5ImtczX15CykX2lDjftYDjV3yVhM1H1t0WqxGfOM9VCmuW2qaWYRNYQhR7l4fKm
	ERtKbpXh86YtPzYrHfEuss8b0P6mE2/OE9DtUfn/x0wsvBRhmh7hDO13vVLffR2R
	oDdRNQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfks60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:00:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d84114044so7784629eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791205231; x=1791810031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=;
        b=GplY+3FsJ5q1owoRmsMwiYEZFVM33/Adltn3eeGp+rMpaM0QuT5lga6dDsgtu9ts3W
         A64ZM0Mx/9tgWZCYAjvpUDF/iJtwa2LgWBDM+pT1Jf0H2EAjHE7GjhEVylQAPAEjhU08
         tINgytI0TOkjb5eTXbJAi41hNEln2eXW8IhYpYpZ4nE3lKYpYKpbSUP4mEFFX+FrkdAA
         OQ+q1KnPPrBRz+6OF4gV0ACJDgXFfRHPDM1qlq3J+i1o5HrfptcRjJyeq8FpiHZnr3cH
         u+OSsNKbxHUqFb6bXerKTuBzvDlA65scniPjcOhQTYh0FNy6FdREQdKvvs+JtJqU2sew
         peTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205231; x=1791810031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPfFEOFQnUkSvYmpAmpRp5GRqU+z/sLm9AJz2jCuNpo=;
        b=JBmYHY1KFA565NdsfN9DZi3w/jGhHEu6u//Sb9x+/GumwYfax2dB0/S/sQhwBejlJN
         hAUcPGWwIvNUaUhG8bRtK2iRl99rBsBp79clFo96YtHaCN4z50EQD4LWZVLGMzXxJ3hS
         h/vgki/QMEXnu3LRvG4KtZUQZsOzeCeCVhnVJgv1e4wukDo8MdEikwQoe4tmrXbEmqge
         6WqGeP0n+ZnuJahExQTZOX8NGMlkK273BZEvg6I7UgxkGyhoACA0d7ExMoOa3fVyrVv+
         dd7l5UkSTmE4IFsDDr5gaoMdHEoF3FI91QmRCR9cTLn0/qx3DliV+W6acsXgG3Dc5TGM
         n4dA==
X-Forwarded-Encrypted: i=1; AKwUvBwzLPf1wUMabd6fLKGaKxTalJX7IzQwIXimpDLT3/JrfMRAIlzxoW+gA6kMj/UnF04XG9K5aWznLAJyUAo=@vger.kernel.org
X-Gm-Message-State: AFuF++maUov79+bD66ZAMwUtpR1jU+F0yUapaFzPyKIOpEX8Y1MteWNI
	sn63HWKF0nep6RkKLoYF5O7gG4ZrgIZbwMS8IEBFpXK2DKTmaagR0hH1lOhwTBFEA+/KF3kqCyq
	hPMKVgp+wsOqGJci2IykkiSZmCEgBdoeI/YkSg4KaVo7TryYUXaCgw9qsK7N/eK+3XG0=
X-Gm-Gg: AYBFou19u65GPvz9UHVV10TjblHJzRVhT3TvIcnuC7DpHkAFjw63a2oEpjgN6uWc2tz
	Tqsr952H3kKnlFB92qG9vrMJcPcC9S6+iYTYkfxV905d3tiRG6V3Wn/Sgg5RXRofBSIsrc8slQf
	ulRn50XUt7ij6BQJD8S0aNHaly2fk75Z5X5w1IC8EqiuKmPVGncLOzc/EeWEnMdUh2kJHecD86W
	jYpFVXbGVX0OP0FeAR1Z6ldq8mTK6kCnYLAyJBAElIiFT3JEvGEPNSp9Oj4WGdrpoyXhiZ0tYG5
	zLzRXFOdhJMXULV5C2CfPeQYDvbfn62aeu4J4wV1iFlnU4/kV4VPfuT1fSow3DSxoNXGwx7sURN
	gUH1nsh+zsi1gfQWsc5CpeHDeHO/X3A07hg==
X-Received: by 2002:a05:7300:24c9:b0:351:2696:bf86 with SMTP id 5a478bee46e88-3512696c138mr6042648eec.14.1791205230443;
        Mon, 05 Oct 2026 06:00:30 -0700 (PDT)
X-Received: by 2002:a05:7300:24c9:b0:351:2696:bf86 with SMTP id 5a478bee46e88-3512696c138mr6042580eec.14.1791205229446;
        Mon, 05 Oct 2026 06:00:29 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271847fbsm22548670eec.15.2026.10.05.06.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:00:29 -0700 (PDT)
Message-ID: <17c38615-1689-4bb4-80be-6aadd3b91d18@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 18:30:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AYY6nKIHHdfQ6YC4_mt2UerXdmJcR-aq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX01fa9N/QEFTh
 ufa86PwnMVezS45jvcVsMHi69XCS+E0IN0oZQKjDFDJU+8ar+5D84vIr2NQKXyMTCLhYrBfVjRQ
 476YsUeM135Kg5F6h06jQcFEx8YI33c=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac39f6f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=w_nWnu2JXzorbJeL33cA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: AYY6nKIHHdfQ6YC4_mt2UerXdmJcR-aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX9yqfKVRFNJIn
 Waap99Gh3IPOc7ofBiH2SE8G886Crbp85N3Ld0vAyoxF1x/07EOVqHOhOAzZWrrsddxbBKeSZWq
 19AdJxWJ+0bbjUGgvDk+hfc2lG83zxWbuoa4AUHj9vXYEzRZ2xHftt97PFQ+GPULFYd+7FFpsAw
 cLN7Cc0DXQbK5iA7Km7T8h3jaJXyVCCx5ovJ/gVi/pUkGmEs2DHEIihKRomc4/lC9S9930MZdDE
 dBQ8thTqvN8t7sGRwVgTWLx2CUHPfbtgLzG2qUqn+UfQiKsZxxqyFfcGaKfsatG7vgHLbBGhXA5
 xsfhUOf870yRSu79yRWMaiyaYM0FKCF6h5LgnBQ1Rh0IbvWITQIKFyu+wdQXAgiAPoQSUDZxkqb
 JvXNehAhXwYmulnlbjcP85vecGKvQS+SGhOVrO56r4NkEeCPnGzapn40lakD5ZtJqK4JqQL0CE3
 n4GInxWZRW0YGuoSDwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050050


On 9/5/2026 7:27 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once per
> group of pictures (GOP). This is because playing a GOP-based stream in
> reverse requires decoding each group forward first and then showing its
> frames in reverse order. Each restart makes the driver resend the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. The driver never
> stored the video_format value that firmware had last confirmed, so it
> resent colour info with a fixed unspecified value instead of the real one,
> and the value firmware received kept differing from what it already had.
> 
> On every restart during rewind, this looked to firmware like a real change
> on the bitstream port, so firmware sent a settings-change notification,
> and the driver treated it as a dynamic resolution change and paused the
> port. The client then removed its buffers and built new ones for a
> resolution that had not actually changed, stalling playback once per GOP.
> 
> Store and send back the same video_format value firmware already confirmed
> so both sides stay in agreement across every restart, avoiding the false
> settings-change notification.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the commit description (Konrad)
> - Link to v1:https://patch.msgid.link/20260901-read_video_format_from_firmware- 
> v1-1-499edea4d200@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
>   3 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
