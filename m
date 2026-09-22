Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45477526ABA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067414; cv=none; b=MBbkyuBqnrhhCyZsYcz1euGz75O1Osw/2quiotbZN1xBeGTuUD/EeeRRxDWkqtWUx+tDLztsE9PyuR0yWGby7yPKDbOXch54gb2+B+opIs9PhZ6776OOQEE1vVEWI7nkXz8iqYdaxGeeBp1DFConL66URw2cGyPg7sKnZ7r7Iu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067414; c=relaxed/simple;
	bh=xcSudL0df4MclDXMa3bDtxmiwJRhRONHmT+v4SEV0xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxoZ9WvlXkxBydwJ8ULnboED35Vac9a1s2syIKxGVrsczyJfOiAj8P/knfMomgu7VASspeohgtI/VAJFSXBSjwil5FtMBZtqhRMrIgCHJojp6kH5PxqV+PIjfEspmUcmo5WtlCkoda2sGcZz8+ydjn1FIIRIpVFLPX1CiK69eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBDitGLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiZFu73C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBDitGLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiZFu73C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dL2N3704512
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=; b=RBDitGLAD4Q1hDaU
	b+xslq1XVVCO+4/r9CoMfBBZe000lwYOkP+E0mD/sML14h9vuCrnSQkzV20qEvdx
	dZYwwjY4DhYoYsmP3XRkc8JUfkfPgdGcZi7mPMT4kMZpQW+NxNIA4IiXF8mkIWrh
	dgmlv5RN5B2dXNv/4VNDcHqKwm8P+ShZzSCX4+kraKkFEtSbC7N251XVTVRcn2c5
	/gxv0PMn3OWSsN5OLkdFt4wsu38a/3Lfv3/U9Rcz6M6baR6gfrmV0L55GsHryJWs
	BrwolA0P38Xdb0TYE1plyyLS8hQNPYyg+ddNHXcw8PWOHMQGG7WOTZ3zWrXjmWve
	UmnYRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqg29k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:56:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so22805185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790067411; x=1790672211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=;
        b=aiZFu73C3uRVtBBXdH+vChcU1ZAymJixF1hJi8uq3RY1LeSS6mTcuztocfre5k1401
         vuF8KP4r5Vx6n6FwPgNhD9IqFp3kqTZQrT7IWf7hNZaYL5u6EyqbjBVfc7M5HyyYZE7g
         CbNmdmoJ0e3VDGrFpiLEKlAsA34Go0V4Ljn3aicwfvsmGIF0CW0pKBVOpRjZX/P156mK
         iox1QxJ+Dn6P7NqIW9wq23X6Ec9fn2dRcKnz7mO6/ftEafRdyKwzuBoWEAb/9ZDVNP3S
         ujwrJOrfJ6gHBMsj5tsnMDINFHlwvw3KxSM96YRB8A4ReCYvfrlwGBRyhUwXe2rqNqTx
         m+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067411; x=1790672211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4Hotj2B6S+EeL/H6kszz7MjT3owSO1Z1Y7x6oHRCaE=;
        b=H+mN0mkAPA9ibx4EAve77O9KtMxkw0nobjSwqg1CIYEBG3ZDEvDDlYNdahePzV5pf0
         gPKqMWpg9rH5t9DkjwyB4y7eO7DdnebFE4GbXr34eiAtpyuwYI+AfeqcZ7zyZu+q8fNP
         w+9M8+KgipwBgV02/a+oCtUPn1HmsDYoLJ/0Z1VyXwsvQyWt8WB1ennZefZY3XhBn1eE
         8Ro6nlVn11e0DPT7LU+HY3zHoJnXnaILD4GhFqdWDr3EyLxLd1aaQNxbXTVYkFV3dM5Y
         wi9YvCBgcH87f82//xtX51Bj5miVxGALKoA7TgjHkHYyYjf8OHPNFqUMPMNQbBiv7JHs
         HJ9w==
X-Forwarded-Encrypted: i=1; AKwUvBxv7P3p3OXy6Dq5gYkL39xKvbtqvg4lFUfgRCRNlCjsC50nlhyNynWozV6CR6C9jCmY4GAjbkyrQLmR6fM=@vger.kernel.org
X-Gm-Message-State: AFuF++nr+FhFonq+MOpoCwn67bG51G7GiTQtZ4rGGeYOyAtPe0FIM29b
	8T9MZDIfeOBJXvEf8KcEhnky7A3qikJfHhJJzJ7livmjBz92uboyJHkXUsmbNikfIw7cZrOj4tz
	0D/nLPRx8KQLYcdm5I8HClUu4qL2Dv7C7u8bFKzxcWkJRvq51qRxtRHp1u6724luDR/c=
X-Gm-Gg: AYBFou2Wi3s2LlXkCTWE0+mwd4yWUw1OVuxixSlxr6qHlPNQEKI7adyZPl8wLJMPH5O
	zYToJ1cZb9jQE3e2rJ/WlWuhHAYKvFUrJb/red5j3oNuLeuMgKCCJZN5+/feT+YnZI5pn1oj6EQ
	0Z2gA2atmczPFD8qR9q9tXRS975HCz18A4eQZN/zt42/IZDfJE1cweeoBAm8VA3rXVjYUhfIs8u
	l5TAzLrBwsS3jGkYdSS2FzA5cGeItyDhCpovODzZ8OR+5w7zAhENAuZ/iIJiFTbaebc2qMd2Kix
	JExKkWWjY7yP6d0texE3sYR1L6DIjz7v0Rboo2Ds84XSd0EWXB7FQdIbrmjLK4O12bQuSg8Qv05
	lkQToVYWtouok8qdUozd9EQ==
X-Received: by 2002:a05:620a:6484:b0:939:e9a3:3105 with SMTP id af79cd13be357-93c15f63685mr458253285a.6.1790067411537;
        Tue, 22 Sep 2026 01:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6484:b0:939:e9a3:3105 with SMTP id af79cd13be357-93c15f63685mr458250685a.6.1790067411114;
        Tue, 22 Sep 2026 01:56:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f32esm51695466b.15.2026.09.22.01.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 01:56:50 -0700 (PDT)
Message-ID: <cb89ad25-00f3-4dd3-930b-c4423ffb4656@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:56:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEyOCBTYWx0ZWRfX2SdnF4oKnmA/
 J5nb9fgG9oscqXJmtG44RpXeoKtq4SY2xP+LNG4YGPmR51SsrejjBQOXLl9DhuxG0v7JaP+gDWO
 u3R+v4CJ6nQ7VKJm8hbzPJDUm3G/iz7PFRdwi/oClO9xPLRX6R30lpL05MGrbFX7rkoEv0mWuok
 ODzmC+UUw5t3szHhQmdcHTNykF7bT4xan4iJUStygYynyFrn5+6hZwc/F8vrM7qUbasouqm2dqC
 wdgR/yFXLwJ+Dug7osNnKuQBxfEPkWADYE8MpHT6J3R1gA9U1jsLBUDE8ivvGZey+6B0s3CFABn
 8JjebNJExVoeTjLSu647laNQYcX8GGhs1EEDfh7LbCKMpFu4VkDZc8Lo9e8UBiUd/5zKGyn7ylO
 W+GLR/B2N2lkrbx0gnRpxm412qwLfahRtOMKLq4Ro41yaBJN2cOE4btfoG/reZKtlxUCPmQd0xx
 ICvXQTCg250VNISZLjA==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab242d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kVwqO6oyCToStzI6_vUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: q-GjK3euuLfc3u6u-r5S4YSOq8Jo7292
X-Proofpoint-GUID: q-GjK3euuLfc3u6u-r5S4YSOq8Jo7292
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEyOCBTYWx0ZWRfXx7frJFNjtd4l
 R6yw5K7OS6aqjjPjiM/f2RqfxnEM0eAumX2qKI7iJ31K3CMUyrKmFxokWZHJ4Kjrh8yj7qjt5QN
 mrnh4DSPl1KPBztvbsy8fuX9EFgcMFQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220128

On 9/22/26 5:24 AM, Wangao Wang wrote:
> size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
> called with width and height swapped, miscalculating VPSS line buffer
> size for non-square resolutions.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
