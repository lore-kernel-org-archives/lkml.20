Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481743;
	b=4cwDfLcfwckJaIGNYqlsCTKj6vbX2t2E9r8o3bYg9xM2/jjV+G2zv4pU1YhGz1hYVijm
	 uPQan1vfbSgVzk0KFxsNjyVyal05ZvrKaGzzLFEldJfM25PNZUXoQYnejXIu9u+NjNZ6A
	 7htk8CFB7EtPyr/TM3H+o1MTxNo/3IJMpJMva16JxG9X4k6vShg/yzfueOmDEF/71q7Ue
	 3Xm9JgM6vK+WO0KJN+TALxTtN5jVsuzFSNIwqkrxQhLmvxqkxLq0xKYYDzupDP54DkHgV
	 EhgqnuvtlLSOw+tjVK/HjBmbnlKmKvS18YL/e1aOYAlPYbpxzBKgDQHAKHe5rk4uHdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=;
	b=5m7vHN+kO4t0MlfMTyuWskisr3AlZ7hYC0Z59UXOUcXH3ZvxiWyZjRYO5Ry2z46uN47f
	 5bo2A8SnK/XmBIH81kCDqLaaNV06QYafdaF+wLkVWyvFud5eQPZZnwKTJuYQKTv1yaf5g
	 th9MVFJZkKP8XZAuE3WqiKsgox1kKZ9WIpt+8cBVmm7+IetqKv3ZZOYzsZgb1MR5UR/Mw
	 JKUxWtgdhAZV33BtTz8XMI83PSa7FASsvrJtx+cKnh8fv7K86DJwOEJ+qlgQQKnMYi283
	 KdAzzsk1vMwcdD8qZcWnontzpoejgi57nOabfTkb8CsQaLbkvFAQphFRrgjAHQrlPpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XaEGjjlk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFMZqoZK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E1B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XaEGjjlk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aFMZqoZK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tOdV4178132
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=; b=XaEGjjlkPyeip8/D
	Pd3y0fGZBsDnL6M/pphc6lNPtmn2W+306Vk0wjXgzQY6XAg5RSl3G0kmDsieeMTk
	Sh4y4Lo2FEcDM6TfYbRj9kZXSYpTPEjE6RF5An/eFrLDisemnG5ak5sZvOcqSpUt
	hfJwW/zM3odC9itOexU4Go0F7ZXfilfoKb4v7mJtYLGoCi/5M0IuXnn2JL89d+SN
	t3L0yng8nfE/RCVBM/o7TDLgpEFUAj5jy9sDOs/tVgGjbAoKhHKrK8UtEVi/LXzb
	NAannXznf3dY3w789Ck0OCK+DHd5PBYnRc6dEtG8GJjxW0rLAiUQ2s7NUAyRdSnn
	k0ennw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1cus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so3312033c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481741; x=1793086541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=;
        b=aFMZqoZKx66iJI4nY9Qr5d4WI4zOS7bp8MyqV5aAQFBKrQbRZLlHeYLi8U3oxBKdyh
         8B0dsCuQ+gadRiQxpINwbFQfgo1G2iMr/EOAbDojwbcHkGfzP8Kh+hR9DqaUNyPvYcwa
         mkmU7FfjBFb21FgPkKGgpb6C6zVK2YTxICfLGlztldx03abQWxUah4aAIFn440LxOKAK
         jiVNtICUW9bzYPBeY6cIQr/8s4X2dDhM3p7W669QaiyvU0h8xBk7zs+x4vLEAQt5UccD
         KPlKrAiEAk627DDoLmrLPYNtOysycCaSJnviTYN6UmcOBpXwjak6H4cnWY9/UD5WJQpK
         ug0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481741; x=1793086541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=;
        b=MxynCAkce0buS2VFoVVNOTqgpsQP348MKZRv2wwC+tAB8beCuPOLDLJzbPEGLrlH5Z
         lOJnGFm6SHrvP9qCUjMWru7sXjYYfUS5VtZ9NwIZ5fhZvXvc7afrA7/fXmq9gxKL61kt
         XshiAPb6xRq53gGyp4B8YnViD0Qf791tVSoOsXoRJAQpEqxLGXw24v5vpHLDNGlRePhi
         Meoi4fCh11wXqzp//QntUcOCFZiqubS2QpnjkyMDK6SyXxO3PguOEzc9QXkQ5pC955Io
         g2KIYr7cQII4ETHKgYthkXQX3eC6fEbPJ9WujLV9w3p3+m5cWxBbXQzYa54NtJzpZ/i+
         tTHw==
X-Forwarded-Encrypted: i=1; AKwUvBymq65aUZLB1N0WorGypcejurner3KWmARU12Od+W3pEvx9r/Uopk04JLqaxu/hSiDEhMWhu84rZ+QAyUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo9o4tyK6sk7sKkI1F1DWJTYAdqNH88ULwlLmZMb2PZZBxHOAo
	zIrZ8OMCjKh69cEgyNwZtnPcQ1GP/CebcG4SVzMYquNXCMwlq+irl0LbHKVu26G2jup4hpYamu3
	2mV+U2c+m/JbfiCDpuvkDlU8fgBSbVwh8CL4JbAIrPZby1tRPFti1XVNrUAgwW3K/YZA=
X-Gm-Gg: AYBFou35rDcZaNOsM0sSWjGsp6YZ3Fo2GR8Ar+AIvhflLS41Ia1F5R6y+mXM+2ikZrb
	TVdTnwHrgJoqwi8LvXiWxy25+SR1tZh8NbfCMY7rnzz6HoIsqAJSdp/uAOwuqznT+t9Zzxzldp0
	TxIen2aOiip/UQnmML5c7Tr/y0KWILAJHYEv4TloIaC9ajXG+/b98NVGtly5HTGsb5bh8Jp0CIG
	oSAmVLQkzm3eivSep6isChGae+DJBMf3/FPpc97WJdLC4ABm+3sQ37g6arGoX8NbnumhxJJnlni
	UltD3oCyfKF3APorhwquM/xoZy6vcKj/qZYbPdDlAhfuTWgBLVmmrP/hh+pmZmUcE/aB7CEpqjh
	s/ojKhXV7ycP9m3J7lmJYiWvFEJYkqXs=
X-Received: by 2002:a05:7022:eb44:10b0:14e:d0ba:7569 with SMTP id a92af1059eb24-1850c502379mr14549927c88.6.1792481740734;
        Tue, 20 Oct 2026 00:35:40 -0700 (PDT)
X-Received: by 2002:a05:7022:eb44:10b0:14e:d0ba:7569 with SMTP id a92af1059eb24-1850c502379mr14549899c88.6.1792481740204;
        Tue, 20 Oct 2026 00:35:40 -0700 (PDT)
Received: from [10.216.21.16] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm36257771c88.22.2026.10.20.00.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:35:39 -0700 (PDT)
Message-ID: <d1ef564c-2031-477b-b318-426d472b80e6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:05:35 +0530
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
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for the Qualcomm Shikra
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-shikra_pd_mapper-v1-1-a5572eca26e3@oss.qualcomm.com>
 <014f65d8-702f-4b45-8037-8c416ea8c858@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <014f65d8-702f-4b45-8037-8c416ea8c858@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hG8SlGkcr89jd_V2gpCgqoEXtt1CaNkk
X-Proofpoint-ORIG-GUID: hG8SlGkcr89jd_V2gpCgqoEXtt1CaNkk
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad719cd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZLLkx3fnuknxs5wuvD0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX17g4+S4BNJcR
 Z6Ld/H/eYhhDUCVl/B+IeSCaZqB5/2tHR9/SedoSQ52t8BoLPidiDJLfHqRF2Q3tc50nbJQMYG5
 O4eCPIiV9QpSygS8L+NAq0tlfv73ZK62QD6FAHeWESdvZNfSr+Cjxkv3EUs2a27gzwyVrE1s6+P
 CQVoJZl+x/CmAleu1d0x4wqC1GnVZ48sG8C/9c2u+20LCz/7XiE3rBMTTp3ePOfDOZmyK9oKpnr
 rv+amcW4b2H8DxPCqCzQuB/HA3tR+J9/4DYAXD9JSn/jLlz+vfLE/AaZgM6nWsPqOwSyJZISahN
 wccSkmWwWURkMAvyNAwjZPMlmqkiLum2f4V0BNSwM9zmfK9adzz3sEPyvaXSKLsTk0lskI3oRyQ
 xqMhtIZl494yNyGJj0dBmsMSGEA2Qa4gYZMuNZvMkQSWvvU6WiDUxPV6NkWUS3C2HIzNkUtjh3y
 gM+mGE02OO4WDQhjBmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX5WrNCQ9bM2JT
 ZHUtgurMKPjdAVM1bMAg+tD9HA+KEuMW9TZ9Qgg9i/Yng4Zp0T0KjbGtfTNSJ9g9W/yNNa4+F4j
 UeVHRUN/mWtsdDiUi5NOo5V5P4BYlyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

On 7/28/2026 3:43 PM, Konrad Dybcio wrote:
> On 7/28/26 11:52 AM, Anurag Pateriya wrote:
>> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
>>
>> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
>> domain requirements: mpss_wlan_pd.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
> 
> I understand the audio domains are lacking since there is no more
> ADSP, but mpss_wlan_pd? cdsp_root_pd?
> 
> Konrad

Yes. I need to add cdsp_root_pd and mpss_root_pd
I will add it in v2.

For mpss, I already added mpss_wlan_pd. Mpss_root_pd share the same 
instance_id = 180 but register distinct domain paths (msm/modem/wlan_pd 
vs msm/modem/root_pd).

Clients subscribing to msm/modem/root_pd restart notifications require 
an explicit entry.

I will add mpss_root_pd to ensure complete coverage, consistent with 
other SoCs.


Thanks,
Anurag

