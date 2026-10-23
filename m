Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749941;
	b=V1+dY4pXYmz6eC9X1q+vORX73U7htNr8X/+Gux5rCeM/aoLAeiHDSUC4aSczAFlHAS51
	 bBKY06BDlI6X0CZ+6TqDknlq3oU9k5iNL6RC8SMvv1/Yqhsuxo37jX2uZgqDxDuI3gnhP
	 WJwCpS/9mJ21wHsXVBwoWPfOHsUqJENpyVfMWeCe8l0sux9YDHuGwedGeNHsvS5tqjBqv
	 za3uJr32UnXrd27om3AOVuJZ6MZ99LUJ4zrI+9/llRPUT8O1SffivVmdaA/jY7mTPRNIR
	 axBoh+4RVah3NmTteLIHas8kHEC77I1LVmzixy9Od5YxLIJxa40CnTSFofCUkVqi4qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=;
	b=gXegxeFkMiq4KqeZ7jKoqyvQOGg6WrkPcCOATNeLqv9ejyte7HqAD4uTbq8NYlvV98Nj
	 jmnkS6mSNiqlRueB0yjWGrJn5DYecjULVdXU5FhW0+ufNUYIOi6BM1cfQjdUp4n2whSpo
	 Dxnf+0PCPYks06lj+yR736Wo8eH5pflQ2MqoVHBmU7acjf2J5dQhnFyQA0ATA6eQJrhER
	 4ZJqCouloXCpR4WYueQaV+/AROAP5wqcYKG1DZdeN5bVffS/UIorhqIxFb7dxoHv8d1bc
	 PegTmyTD+Xm0Y8nLcD9SslwjrY0v9BCvBYmxvK6wXpl4IvmoMZNFKv620gQkTDzK1IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1IitvQw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjvXfsqp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5559B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1IitvQw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MjvXfsqp
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FNlb2572599
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=; b=e1IitvQwugHSTyFE
	Dm1H4kwMP7I7VgngRGtFJ1/5y1UgtiLBitdqqJjjfUVZAJVxahCNCQ61KI4n8QIq
	lurMPzcozAx6foaQeREbf2vNqWkJ4LLBfnlgITt3FuWwvrxGcnZ29KuFmgN86r/7
	IMEPg0OEGgjEafKdhOIfuGhEtvMKKHmC8yWIoFz6bTifa+vvHo+7Y7lXeqaoJQ0Q
	dLfOxUkKZ+MOR1sU+zn4Rt8uvWAP2s1rG6VBkaaozC1798bvzKniWTXU+UHPhHOR
	OinWOlNs1w4jYqG55QWo+78SiLbCrmZlfNf9Ntx2Rk+lAyI9Hj2It1ZwBv5RLaix
	3rdsbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0kn62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:05:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb1091fffso6616885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749938; x=1793354738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=;
        b=MjvXfsqpsbXtqMqrfe37bK+0njcUZrPpuzZNaLhTyXHf3IMT2qQuybQZI+t7M/hkKs
         J8xNoJ/XcpSPzkddhkRtAMfkDEV11U0od5fUJSDJkrfaZ9VGo7kZbFeiFsytgGTMhgeU
         yn6Prp5SaQqiJaq7bZ5h6CRZAE6eIoFKW8ehDSM1lKbHzNxxnx303mRA3NLfEIZp2sca
         BR9L19Ti6CAAz5Hc84FCmrWrzUG3dLHHHtKtSKGMq9cKhHsbELDXFAQjxzDT52GLFdwv
         JE7wPE5XRgCvfU8lvcY6l6ojDhCIYQs4vo+sFLQgYNZ3KJZmYIWe4wY7CCVFcbAykxEs
         hybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749938; x=1793354738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR6WqUzgduImAQJNa+B+OOfRPJTUMCWJUP/DfxjaDDI=;
        b=hT0TwMzocluYFLw3uRlYh40rZUL71pdyr81cJJFvScKpU9KkPgwxV9a7qF0n7MC+FX
         2bPITVL610SfbGdI5MmZsg2KbtJVlXh3TrZyqT911XOyijIp1ypx7ahBh9eafA2SaWKp
         V5XQMZ+KDV7LROwzPt19s6y4wSM2Tr5dfVWJpqS4lnPQlL+QByEv5kiK88B/4b8dN8Vc
         1zh0z5kAKH2G/yoUiujjubUCWI8xT45+75mNTQ3x6IgSAHYwdhYavwq9ej2oc6LkAnws
         KvgnW+V5cgnER1yg71Y88BSAwyrxz5eS2GGlaKCUXfpv8vlm3VYOUwej+FiU4berL7qW
         AqJw==
X-Forwarded-Encrypted: i=1; AKwUvBzFKxP+UuwTsfREAnX7YBrEcd3q807IHhogJUqDdJF/Mt41A6j5e3qTNILhPxwwnnR27OE0AXiIkYfrzzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyOKzajyT/YanUFMwY4Udp3uS0ALYWvhlPcgt0l44dDt6nXOPV
	N8uUbQCSsH58y6A1PSlZTDj7KyGM84iaQi6t5fzW6aRHq4OOWvbnTyLjNAQDP+9ggspVn8PhyWr
	Am7z4HZ6dnvkp5Dw+hD1yt3Sfd8kD3s8RJpIaX8c4mtubbOCyO2+N4KQrzTuCoWr6wOU=
X-Gm-Gg: AYBFou28UvpTw+MQmUkevqSKU+/g3m5L1/V3x7bvpZc8/gVAiAwSCfsS1QTISACW5LA
	tKn+4TCZW5ghK0vY58k20o7GF9mBVHs0Lx0aPJZ1z+y+8CTeDlCP2vR/t1DCT8NqMhc/YId+o3L
	Pa2TP34fAtoKs4TMCdKONxvqCvlw2gvcS21aAyDWdXzHRWumQvmPh+x8A10jCP6y5wkhLo1VaIy
	43rY2shU8SttPHLAl9skZw7gox5l2iAmE68+988MEwpgRRhJK54RQUQf3eFi3pRo+O0aeZBjCMh
	k6XVPXAHLby36P51IYwDHvM+4hSp3bvpE/vkrwBHdwZElxwuXkHN3OwK+h5+o/C2/P68AEXapIY
	ZW7/keRGjP9oDhKNuryvkhw==
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr327423085a.2.1792749938528;
        Fri, 23 Oct 2026 03:05:38 -0700 (PDT)
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr327418185a.2.1792749937962;
        Fri, 23 Oct 2026 03:05:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d0d6sm85262566b.29.2026.10.23.03.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:05:37 -0700 (PDT)
Message-ID: <43ca74be-942c-4b52-a87d-1bf13d5dea6e@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:05:34 +0200
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
Subject: Re: [PATCH] drm/msm: Report primary minor index as gpu_mem_total
 gpu_id
To: oushixiong1025@163.com, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Shixiong Ou <oushixiong@kylinos.cn>
References: <20261023072644.542364-1-oushixiong1025@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072644.542364-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dIEBqM02p5kd_GXfP3BXruyUUD0PZeOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXxOhDZtj4rQV2
 h/8xlwi3ZO4vI8dkoY3ctQ2c8v8j09p0n5+erFINQwEUxR6U7LXFzMCHKVW9nIvMVQ060K93HZq
 Y0z/m/F3AMVa63oEnvwT4cqPeKPLXrNUHIcaANnC1z8hYi1mbaVqJcI6rQ5aRlLTpekqkY837Ua
 SyGeVcWmPV4D44PUdJwd8IwNDsskMScJqCDKtbjx27zK2+sYbeiO5MyYHApsYoVU+YyUvw4qxKW
 MQhl4gKWTFXaYgXYvhouWXukcITxUF0UHBlEhVpnOZzO8XzSUABHsihD6wq2xp3w2pqSO8pSBE+
 5j1dr0+ECHSHM5zTPCHm6kh7xcVQkjI77IXpaZdhhHzUtEj75oGsFqbmDVbKX6bKjoywNZNzPz5
 aGHt7W4S0jI7Hy3M8DDU04nFlWqdYhLYvc8x2dGWTjHmQODuIK7aH5v0Z8yXUd7SuW3kVf5xNzR
 h3sbHvL1rYV4G4p0s1g==
X-Proofpoint-GUID: dIEBqM02p5kd_GXfP3BXruyUUD0PZeOK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX3p4KYQCpGS9V
 2tv9xvOOI02PaI7MNE9teRusRZgzYVplFRgM+H6C6YjaHFgGzRmRGOBJb1PEe7rjpsgr88XRqtJ
 1bSkgz88Ec95zjMevw2nbv9D4Tqg46k=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb3173 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=nDcocf_55Z5I0WzahHEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

On 10/23/26 9:26 AM, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> Both gpu_mem_total emissions hardcode gpu_id 0, so events from multiple
> GPUs are indistinguishable. Report dev->primary->index instead, as xe
> already does in commit ce3d39fae3d3 ("drm/xe/bo: add GPU memory trace
> points").
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
