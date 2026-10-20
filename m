Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476893;
	b=yLpNgIp35uLXSub5DU1xEOSB4XkGv8QVm+gfmqC4WKi67SxdC+XrghopQGtUCVBCyJMZ
	 K9BbGIqOY0oc350doQGqOPzK+fUlGIcy7nb2toF2JAI9WI2UCILUrRzm3wElj2jrQCLZ5
	 r//+ulXGwxmQJke1AH/Y7q7dIbEIFnuQMpjIo+MXh7X9/9zPidGlMrjX9h9alaS68RqSl
	 f66+sfKYIpmjKJrk74DsdkodnwsW+vLhu2B8AX+Lu/P5tKX28fcncrpK2jQC+1cCTvUFw
	 AsKgHsnhT2HtQlqfyQMsKVDXmQG4SlzdLWf1Tm+gSZllokVW4QjetBHUZQdQQKqY4dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
	b=LHMmNIltcI12CdTcq0hS3POVbeD3r7+q4AUkiaLHduBGBVKjcsL0xoOuV5FcwDJw8Llv
	 AX6Et5BGVNhE7m5G+hSZ4RA08is7lvVlG92a23zf/9i5bxPHhr+F3n47AnrlJBrxxerY6
	 Z2BN2cErq5lu3LbkqkBhoajlEQ1gh0QlpBKhKPw4QwicYiHXVigK8j5/ynYbToigE/wmN
	 EYQC14GcbMJqmK0+fvMZDonTpdHZuX3rUer/luAS5QQySHuXEZAByodjjGBrG7kPHPSgg
	 eAQ5xe6HLWk3KJqW9gcPni5urv6+XZM9VmRsHcQ/3jw24UCWnpL+NgtQDKqw2tkaFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5O2Qj8q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFelRwvQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE0C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K5O2Qj8q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFelRwvQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K65s0p803528
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=; b=K5O2Qj8qb6BT9++k
	UOJo+dkca2Ppn9kklkvRAEawszaE/2n+i32Rh7MM6//bqjvM3NSrblCLmul6G2nV
	6poTzZuDq1P7LTZn5BJ+sWkK/lllH9M4Qw5pe5ZauGUTi5vZfNZhhcj7jPxx8dd5
	vs77lD91TUY6KeJbEexYLNPZ8onlwLzmFiq7nh+NpBKAGGIkeH3G4yWDWH3gdID0
	GwISto8IC1QN8E+Jh8cLhL3S+jwrYt8nUgEUYnShFbGjFzL5WFp9RlOgz/bZz5PH
	m/+WXWxLbFSkX7kH2mhjKkQNsTsfKn9EwueM6MqfZCpiEp4E08n2zm4glhwWWDAn
	sSmsfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n14qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1de6d5c3so676359485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476891; x=1793081691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
        b=HFelRwvQs/xAl1VdRuJlTlIMDqJY1USgZwrG3zzf9auw6PLJ3IosZoUwUUkshBLYhC
         855MzEf0j2BTDftlWlbV4qTCgDZ/ilMbRaMZr7DbRFEqoPUm6nUbJIm5AjsS1IRCEL8Q
         gleH6S0GuvWJuBtr3PYi9E3T6R0SRBtWyVQWuCcJ2HFqgMi2dVs4v2+dJYiS8GpIJjGn
         Llt04IR9q/qs8E2rcK4Zsl127qqRMBw2Bli7YVWmajJ0/7NOQzaopaDJ8AbvBAIJLuXn
         EWSpWi6J6ESWCJGeliLKZyQVD1TwAXb6ZYrxFNLKe2nl3IbB+z1SgNJyHT6pAPxRXweC
         +lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476891; x=1793081691;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xncXGr6zq4MTCEvst6yWCd1srzBS2CkwUN1LxY2DWY=;
        b=rkZYwSGTbMDPbR4RDkPrSkmc0Z8ytJR/tsdAKQiZ7/AhxWtwqHLXZgK+y/UQIJ4iIO
         Qnehl/5d5Z178RM+PkadQ1FChXqvaLkesvv6MTvfkax4Lox1mMvMdDFohJYwWdYguE8c
         vxc/5F2AaNzRqb8xRTyA/+fz0qAYZUplaJbt9KYvLd+sJrcG4WN6/9WM2KHH1aXdweqL
         TinJDcUgoYcj4NnGRJ7XAhTmKypnqhZW+e0G+SL2DuOL677pZRJuTIWntcsc+2GljIoo
         tM9vTM+wq87DsoS6EX+30OM+zC4CcG8OppZ2ItTFnQZVaVHhoPYgHqc4Nm5un2ZNIIWe
         KMDg==
X-Forwarded-Encrypted: i=1; AKwUvBwfu2ec2SbZ00R9z6r7InvbyjoI6n/Ckmh6mmm8+dMW04lgJbWVuEP7ySvF6fVh5Fy+TI44jOQvOmMN3ag=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUjAiKIC3xf+G7Q8QxBm4j7eKtap85cQ5L5X3QsNNLGpchzoWX
	VeqTujnaxztV5kij8grbi7XhfwDNnUM+47vNWmhrtXXlbVvIA8NTYNlcqAto2mBioJEfQybxa25
	WKt9qu8b2eO1uTlvz9VmfMIgIR31nAbn3siZxE3o6wCxe6JaCVD6KlVAPMeyNDbgZK5k=
X-Gm-Gg: AYBFou2xPz0DnsLqjp98bOCxhB74cUSsXQ7vmqfPPywDyDe3xui4tcYlzhAOznrjvcX
	OswIIE8C1TrBWOJ4uP11E+znIP6YiS0+8mv3BMssaaCL/Bc7XVLXNhzMF2AJlcxcsRb3EN6rWpS
	xKmeoZXY79qM+jjjTqA21Nc3u74inpbs3BGc5odPcXUd0D2sCkq4aT/9V3moztpaMD8ILxMBcZa
	NB56wWYeupjmySprllc6NMeqKrZK6QH/JNKNh40vacVoNfXQHRv3C1xGHRwr2zFXN4dEWqxkZRu
	g9KjR7QOvV3qOyiooa7TL2LD46Cdn2Bp99UYNwRh8neYTyPoZALzqqChqRXlZsx7l9nkRdZENNd
	S/GxEvDFc3oBxLwLqEwlzRpvEy+OAhuTTSb4bbimBB44QobEDbZI7gYTW
X-Received: by 2002:a05:620a:3944:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f29d0e9ebmr1567052085a.25.1792476891186;
        Mon, 19 Oct 2026 23:14:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93f29d0e9ebmr1567050285a.25.1792476890705;
        Mon, 19 Oct 2026 23:14:50 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm41347755e9.6.2026.10.19.23.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:14:49 -0700 (PDT)
Message-ID: <22163445-115a-4c41-991e-de5daf5df03b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:14:47 +0200
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
Subject: Re: [PATCH] ASoC: qcom: q6apm: Fix the wait for
 SHARED_MEM_UNMAP_REGIONS
To: redducc <sushmit718@gmail.com>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019161805.2427-1-sushmit718@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261019161805.2427-1-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4EUgX939lhpiIYmlm-xkVOwUfdHXkp6k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX6i2cv1RcFZAA
 sHRyc6gNy8WX+orgq+rA/yut51ZznCc9p0uKx/SgTswU7rFWFn0U7SzI24toWZ89XmQynMSLmYP
 PGNFTLcufUkMS8e5r8gmz2oJBLeJtzo=
X-Proofpoint-ORIG-GUID: 4EUgX939lhpiIYmlm-xkVOwUfdHXkp6k
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad706db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=I-3ohRW-80EDcGXojW4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX/QBJLAIGj33/
 +Peg4lUz5gBSQVIP4pmZZYCdT3nmFnWTFLzgMR3kIUbDzsRPqC7Z7oarRO05w2OXBHAIgr0+Dnu
 r8BFAkLklsaFRhc+PhdYgTRoBY9yuISbxORt4kqxrap9MfjJD9aoximd6DmpIH1zp5ubj/HuV/q
 S3cJvReCz5ZuIJM2cm93okkG5SKrT5b0QJdPfemdqU5VtMLB1CiESBW33IgcSfNFVlYv3PajsMZ
 OybJzjnkAB5dRp8kM+YYtgB6p+WIU/OvWEJVJz/eEAKKSIXuw6D6/iyhsPlgnyE0gsauQdKYMkY
 pbXIMco8J+KTMcw87zcbPhb2uwoLVeP/qWBE1wJptQSJskQMK3B0g6DbnGpLSChnfTebGyj5r2o
 ORM2XzzbEpYDP4D6xLDn94Q4GCgf/Er4P7pdBwNQtd348TRJnuPZIL1LSna5HkAFO0vjoMn1p3i
 h+PAuTHJH/biHCqEX1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

On 19/10/2026 18:18, redducc wrote:
> The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
> GPR_BASIC_RSP_RESULT packet. apm_callback() stores the packet opcode,
> GPR_BASIC_RSP_RESULT, as the result opcode, but
> audioreach_send_cmd_sync() waits for the result opcode to match the
> command, APM_CMD_SHARED_MEM_UNMAP_REGIONS. The wait never completes,
> so every unmap blocks for the full 5 s timeout and logs
> "CMD timeout".
> 
> Store the opcode of the command being acknowledged, as the other
> GPR_BASIC_RSP_RESULT cases already do.
> 
> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
> Assisted-by: LLM
> Signed-off-by: redducc <sushmit718@gmail.com>

Please use real and known identity. See submitting patches document.

> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index b6b1ef6833b3..379b15b7e503 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -960,7 +960,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  			wake_up(&apm->wait);
>  			break;
>  		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
> -			apm->result.opcode = hdr->opcode;
> +			apm->result.opcode = result->opcode;
>  			apm->result.status = 0;
>  			rsp = data->payload;
>  
> 
> base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
> prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
> prerequisite-patch-id: 22bca48e48813fb55976db043f9c35c926c61e3d
> prerequisite-patch-id: cd21b1ff6a4fef14c706cea97fc906d7a0331b5c
> prerequisite-patch-id: ce4057205dd2c2a6650c3a36c60664bd2737e202

Why are you fixing patches in flight? Why can't you just give review there?


Best regards,
Krzysztof
