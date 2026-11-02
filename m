Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615478;
	b=DJO1hhppCR3/WpyZYQr1vDS1QBWGMdc6oYM5c2sxQS+BYsrzW9fELG2ZjNF4kz1zbM/D
	 EK5uCYhypGiJSI4SNwo6qZKg6hc5ZJ4peoGDbd7ltPbpxYgcOh25sWg+1QB+TflD7xrwY
	 hbTcdy7ftrjlKdbhiRc0ynkNtcUyAbDgSbMkmYNkF6UUvmBJVy1qcaiKxPr/+ALx7LjK1
	 vki37y3Cz5hTf9W9gOH8b1Jj+xu2cGXDWXh/BFxXlnRw72RoVbd/+OMMQzs9Z9w1t06Vd
	 7/QnP4P21f78eBWlYcLhKwe58YrQvRNyR132At5/vveusUW4tj1r779jy19Xu0Jh55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=;
	b=o6FjPeYyS25lmXRmDsfSQx6mendAlIW6ZfmVaH+rJx9JHw5beJ0bEqBb2F8rWk5xIqzQ
	 F5/2gVu56y64isWNdmx4fu6cP5YXFgxhWYhlek6oXvUu0qPhJaVHnJC3E8HZ3ejViCFim
	 9xZYPRArQNe452fIm6cNcCo7e6pEWnTuSemd0PRgPem6mBYvRbdbTyiDLDJsIGpsJeeRK
	 OLOiZCodqe9jsTN82LVGaTp8bTQ8jRuD3tW7lnSQLA8w3iwUxpNZXuxfxshweNiC/d8I3
	 hPW9GAXBiLDAOXMqhTYoLqKrdP4TlwoVtBBQekbRU9xJHiHlMkqSf/TE/gJB1QPzHng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqOy0Qxh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCP9IEZJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73312606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73312606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqOy0Qxh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCP9IEZJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xnY3430281
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=; b=iqOy0QxhOCnKNBdb
	/Rh6UyYWPSeiPz76xCjfWUaNc1iK6XbqnFzicpEoMLn1OuC3hZKuC0tNztnd9/B0
	PlvyYYjvjvLtrAOIA0VfMjrcUvp3ndTUlyauhME0PPPjRcZ8MDTtJV/pX8VYURAn
	QIxZFkwtM/Xn8pjfgOA0QTvCrgBUmoTd2RHYmRdBnmRIrAsj+lq9VpPCx8CTyQrp
	v3dt7CsCODBmt1bmLjd1CXKa+lgauQzbhH40OhNhMmiy6NDfBz2YSpVzHLaRom5b
	Sj1hLsRUPwhaIHXuxRm9sPLo9B9EMpfk3iFFUOuAOYvBIOD6gSiH17Q5ug6EhyBb
	TnNCrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmeruvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:31:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so48536285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615477; x=1794220277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=;
        b=aCP9IEZJ35thTu+xxh/A0nNM///k4CWeCfLgntDzgzRdt0NKakkvUMCuAT7NoaXKoY
         6OcNrlkJPVNPXMvzQ+DrfCrgHJT0eegx5NBGti/rrBQeTzNKlnD7kTPxW5CX2tgqKaAG
         XuT5MxunhN8We95E0PPOoffzkjv7S5us9iwdDqmYCrak+//Z1CR+dZHhvHH3wx8ICk54
         D/hScTiiHpXddkTQhI0GoungCMak2Dq97FyZ+/O5bilFXgcPdeT/MUNRbsI2qCDg3f3f
         +Bq5/tPBNpQ7wm1pIl10Nw2hG8pru8I2MyjBUt/m8MQXxglbpdWJbTqBtTR+DEcD4hoN
         mhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615477; x=1794220277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BD2jJ7R23UELXBejTUvUKCF/Tie5xKv0KES5hJVghpg=;
        b=GWI8iHrqXKWBrFphg4GUUMu/0cw+8149ZUmzMJEJI4v3CPoIF77DOwM+wTsB0ZfxyP
         ttgTJHmCa5WYv0gaD5PlSqhsMEaNpB0amPPev9yZrvmuI+8HcU+7/sOhKMnH9/eJks4+
         R5ZRpXZB+wVjG9b5X51JVUSv5Jur+2OL//Lm2eempFhpKR84Ll3/Kb02HLpPD9E9PmI6
         DnkHlEOsJu0hoSFBPfSyjWrTJR7EJ5Pn9I3J3uia1DAtLpBWjeDeAbLEl1zbAV/JPqsX
         T6wjfWPF6J0uGHvYnKm4vEVa1u1qSLIDxPV4UeqB42njvKTOxpnkWNdpBjpuUeBoP9SI
         ZDjg==
X-Forwarded-Encrypted: i=1; AKwUvBwbZLWBVthaJMAe7a5/kuGINKJyojCZvyf9KBLMGOslOBV6kgPqN4oKiV/Ex/MpsHdUxs8fuoDpnqPxZro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyB75wX2HC9WovojfeqyFB01THuH4pBvJNlzyTTYKePlzYs/4A
	XScUQAirh2DwcU7thYvF4G77tlvb2logk0hG0/T5VCqPblL4ldlJwDadtBdHmCKWIgxcI17xu33
	H4gTpEN03udy09aFbULpEvyRQk9r407APw4w+qKtUsOXNhPQCnprhl+EOfvI5TNYf9kY=
X-Gm-Gg: AYBFou1ow6uLoLWOHwDRp2LAzVy2cAv6MwGONDzKb3ZJBxLy87WhA+94P1YC80A6YSw
	/cWfD1pkmsboqwcfLV05rBWp5c6dWhYZoAEWuwxyaLK4qI6rI8iKbhv+OD6r0WX3DtUU+j+edXZ
	mdopv+SQYae2ypVrN4pKO7UAF3D9deNhHbzNCjY/SVtCzl3RdCfc5G2h9YQlTAtlbo4qmv7TP6U
	iCdNb2AHxeSoZSZ0RDq0Ro/ywfvOEuGzzj5Jg4ojdyNQkGtpLJLTpdVaj4QpwLfB9rh6OoM5XEa
	jsVpr/aYVlVc+SicS81Ie34u27KPwzAu60afkB1PcDDSVwTq09vpuc0Fx+ZDmhHUiSZRwjMOe9V
	9UQ6fzBSkDLmphIBpqC69FpuXMnGBkUMdg5nRGgdLwm0eBcEevNphCsim90z16qiMWjpb49A=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1550882685a.2.1793615476646;
        Mon, 02 Nov 2026 02:31:16 -0800 (PST)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr1550879385a.2.1793615476113;
        Mon, 02 Nov 2026 02:31:16 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf428f1sm367117166b.86.2026.11.02.02.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:31:15 -0800 (PST)
Message-ID: <01e57cde-a18e-481a-8b4a-e38d467b39c6@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:31:11 +0100
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
Subject: Re: [PATCH 3/3] soc: qcom: smp2p: Fix possible out-of-bounds read
 with too many inbound entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261101202404.156522-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101202404.156522-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae86675 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UsLgiRDap3Yzww6lrMkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX7RwxjPRE2Mbi
 HobyImcm/PrCae9gqnwhw3fqGbL0d68o5NydrRRh1MbhHQrT7IOOdf2Z0ve9MFp/vldYsdzdOX9
 Sbzj2AikEjk7/HgZNg7JcgE0RDzL8akQpVvlSDycKa6mfKX8F0BdqrT1ARK6Nlm4QY3dqeonauA
 matWHB/gcTPo0cQLUHxYSGGphpfXDRD77X14WkiMESxEhH7AAWar2FaD6EwGaIq9/R8lLf4zuDA
 l5zeOBtzo5mV1lXihN2/YLHfHT8sEDPSX9ZYyKFkNhr5zmq9qLbq3gOSpe31bdvtR+heX/BFhZw
 J0eVV3KPvStwN0ha/IHLWt6vmn8x2WtvVaKZAurCAX1n+8rpika9qS5DLgiqO9nszXyJm0MTC3M
 zUccMdGhtn5qYpD8D62iEwvg+gLTpprm4wj1idbCn9wLv6Q1WITDp0sgKrYGZFinavTC0jsI/sU
 KwT+jWpWwX7w0+iGMxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX+4Y9uO5NjWyq
 h23Z/wTmaA1CS3IfEJ4j9S9A8glGi1mC6/2E/PtgVmCEKFnSNruCqby25kyxlsK3/BvM8Imp4Qx
 lb8X4cKC1AZlWRpeLs9LoBjBTFUcNXY=
X-Proofpoint-ORIG-GUID: mjI3OE9LQsfTn9sea7Z_8wPDN5hoFZMW
X-Proofpoint-GUID: mjI3OE9LQsfTn9sea7Z_8wPDN5hoFZMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020041

On 11/1/26 9:24 PM, Krzysztof Kozlowski wrote:
> The inbound SMEM item is populated by the remote processor, so its
> contents, including number of entries, should be validated by the
> kernel.  Number of inbound entries is directly used when iterating over
> inbound data structure, so if it is higher than actual size of data,
> kernel would read memory out-of-bounds.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-b79427c9-5d22-4b48-8ee7-1d7808101e52
> Fixes: 8a9a7b9d14c2 ("soc: qcom: smp2p: Add irqchip state support")
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
