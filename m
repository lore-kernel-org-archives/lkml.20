Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0C3EFFC3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339446; cv=none; b=qgwNE8GMxpTltCUWQFkTe3HfilHvM8mM2mkIh6v5uleybPioqeua2+YTl+/hgChTSBdb40Wicb7E5G8IOoBdmisezTKI+6jINMW1ykRqfEvWVMv/+WY0AJxogX9ixDovdTSfvaJOcr7QFiaBvmahx2plE1m+++Vjd5520txBnWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339446; c=relaxed/simple;
	bh=y+mJO+b+vyKXbk+mtczFnjdFHd1eTDSIlsF6E1v/WTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmpJIP2Q9tgOwnRzCgEuuMjbcH5kcnG6tC0AGtuD3uNrEcy4uUDOMWbq6LaoYNQqArF3+A9Gi1B7mQIGZ0jYeEXFUqADhmK/chYYiaXkYca/KTp7yEAl5wbNXOvTNKB+Cr/QHc3BvIHr4X8bxOfkNbP0N5NGRekgU7DPfMuGDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihdlTz5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRDPVXuN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihdlTz5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRDPVXuN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Vkxu3758959
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=; b=ihdlTz5EjrmSKiCb
	ySKgOO3kepGb3YMjx7/N+Eoh+ebbW+oZQpZc7uLqr4gqgou2tIybTWQnakSpnA5j
	ZH6IcEaGlgt0bpzLcKc42qMzyEEJKb/a4r30a9+Wup24PQERU4UzLqxrCfV4F7Nk
	3ME9C+Fi1lNCYa0OChWF0LE6U14aizRkj9uX/BCaPY8JrH0iJ/X2+6gSXE2onfvT
	uYEx1gTi0hbJN/87Al4Hs5B1O3HIArBO6B6jK3U/vvQWlMi5sr2Jxu0fGJb5UBck
	pgPAVmhw6slgUE1rlRSvHIVZLn2z8nz+ErmVpClK0qKu3o8aFOjffiY9SL7dYzPj
	3VkFeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ck0tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:57:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so19710785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339444; x=1788944244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=;
        b=dRDPVXuNx2fx2b+hKu6MS8+NrrFViycjREItFEdRAHUFWTwN28ZEK6kbO+fIjUmkcP
         +ea2f+qKS9T+B0v2Ouy0w6rLUu4QOiwNzuOZMTC8Soe+VFA5g3DHw0jiTO3c1qaCg3Hy
         TwcHrvxsHUCsUj4AxEJdin6WMKCTvaNIUyYc0CfM9a90d+bVJZmPK+Kkqi5KWxMIMWHu
         Ggh5QlDulM246u+kR3sWRiVq5l4OYtltNpxM5i2bKxrOj6wE2SIHPfNAjvmqi9v4mqFf
         R2x0M00LhNPdKb/V6GgDOqMPni9oLPwBRK+EQA+6q54mDodEUsGCaLnueHqH1EHveQFY
         79XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339444; x=1788944244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=;
        b=VLm1YLyOtjJdLUQtAT+hly/WJW86cdq3fcUShApnk12mqD/YTgqu4EeFt4oaFkDWLZ
         G7K6iQDrOjzPGSJVlOIKTvsEhT4Ge+gjmUi92nAEU7VVOTSvqxm5IbWMMskiitN4yiGV
         TmplIoGGxPDJP/mdS+ckI6peXR/Utssgl3uyEge4ntsxy+VsncUpkZJ/MpqelPgy8gw1
         83CYBUhZvWffTWQd7dccMU8fSuGO8Wd7ZS3bcDvHOqH0Kws59bDD6XRMV/K7EM2ssfnk
         H3Y1R3OlfyP/eKfQdNXAiv33EIPSh5eDuxHgFPAq18ws7auL8LdtL3Ia1UjAbTBPoWQ+
         b+Sw==
X-Forwarded-Encrypted: i=1; AHgh+RpQPGBVkanAiZt16kqv8qSK7A3Hxc0Dz/gqJmSZCXtaRJ6SMf1Obc0LUQnrD44ZyTL4AwRNVaASY8mviuI=@vger.kernel.org
X-Gm-Message-State: AFuF++mJzPGcNLBrnh7SwTzFbOPejF244JAVvA92dDCMC56qFRk57faZ
	PGaF5AACGShr/TwtF1w6T5MDZz3xaT+5iSU8FLR3LMRGhKWAK9HbZ3FXPW2uNs6f1l2GJIVAfbu
	wHQASZi0j5rpkYq+/Z2XedCI7UxPYANLbR3ZcBkDjDvz7Srq++QfaaN/CjlNz9pc10kI=
X-Gm-Gg: AR+sD11kGiIVMIPUh6vZ68iCUMAgCRXfvSmNS0rlSthk8MsiMrFIGbR6m8iq36lqI9K
	RLA0i2Ib2Ai5mSOfSDuBUSqidph5C96ocpwYRt3JYbvCouYOmuXct27oEJHKaPWR5T7bjgfh9/9
	6m5A2eQlnZfZ0zFTS0pyx15wcaDLYKJI3lBoJQ9jd2f5bT3iKzc0x6N+niN02FGblGXQX25kUUs
	X5xJ9RGjEWYHpNR1UwriTFrxfRECFRdsYrCdJZFAjgMWM3xO2x63RH3hYbfwvn1ZhbjjnRjhus6
	fLtK22sNV4zkiRxlfXQ052ewicJAL2vS/ptPPDKsYu6R6yHloOtucXcURDAzOVBNYmflPSpZyLr
	+PmBTtt/Mzsd3HPz5L55usQ==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr200031685a.3.1788339443046;
        Wed, 02 Sep 2026 01:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr200028185a.3.1788339442200;
        Wed, 02 Sep 2026 01:57:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm727706a12.13.2026.09.02.01.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:57:21 -0700 (PDT)
Message-ID: <f4234555-212f-4700-ae90-ba895e364667@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97e4f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ICu83Fd2_dlXxx7a8cMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RI6bEoFVHslEiQYTnLnryb1fOnzpGgGu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX41jh3twes7hr
 0kaZLN5uZdQryYzJ79I8gC00Zzdp5ETqEMwwXiANpOanytAlNmgN2GYbZsWNp87RGCIWurwgpUb
 TaEoys+62LXPoX+ohL1IMf5XPQugvmo=
X-Proofpoint-GUID: RI6bEoFVHslEiQYTnLnryb1fOnzpGgGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX7aCnY8OTxoqR
 LiBjA1l2MLwVtaNTBbw3HfLgQjledly2YVgeMTj3Rc/gCzSxF606zIKT67EOX1bHHxIghpLdt7p
 aqdp8A/C7Whhu37Vy4A07n8f2OUi6blopSjxpW77pHOjN5kUZlPPwAZV1oeTY87z3fV1TvJg9k+
 92l9kpKe6NJGIB3OGzDDz5tXETziqLCpEtVyzhDQHKuj3BIimxlGYT5SukZh3fEOmhYs8GHdO1B
 nv+wpI5xPotWA6584s3SXTK1Kv46AidjVVq3h1SEFLguTBdRYl7rcertFg21xnfgzoSmg5NVX65
 zNXwFkyjIzClRrK5sY3Kh56q/sm++a6Qq3W4SJ4112WfzSTE0SXrdG7FqfQy0qQWcyqTQ9rdAV9
 EVNS8SZJEZIfPdb5X40OWd04ZanLQW5JyR+6xJRmdVxb3ILwD4TbxoBBNZpeEoHxFoYYE9ssXTF
 mtnXiHH6/Vq1MoFnZDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 9/1/26 3:31 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once
> per group of pictures (GOP), because playing a GOP-based in reverse

"playing a GOP-based [missing word?] in reverse"

> means decoding each group forward first and then showing its frames in
> reverse order, and every time this happens the driver resends the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. 

This is a single sentence and it's way too long to parse.

> The real problem was
> that the driver never stored the video_format value that firmware had
> last confirmed, so each time colour info was resent, it used a fixed
> unspecified value instead of the real one, and value firmware received
> kept differing from what it already had. 

[newline]

> On every restart during rewind,
> this looked to firmware like a change on the bitstream port, so firmware
> sent a settings-change notification, the driver treated it as a dynamic
> resolution change and paused the port, 

[full stop]

> and the client removed its buffers

"The client then removed its buffers.."

> and built new ones for a resolution that had not actually changed, causing
> playback to stall once per group of pictures. By storing and sending back

Please use imperative mood for describing the actual action you're taking
(per Documentation/process/submitting-patches.rst)

Konrad
