Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA73DAADD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916800; cv=none; b=nZzVbWbJBowCt4MZqPPY6cgGPAF3HPp8J9Qz2iDMXfeJsLYzh8Nt+gaycBQHNegUNly5NIJJvFJ/79Q+ERpXsJlAVZfq3QBXLiAidD2w0JBp4pSWOaapIYA7e0SBGDJg847M+EB0gBgLBS8CF26ZETlmRCMSqoG5NzQ9jI3N4iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916800; c=relaxed/simple;
	bh=lxN9VsKxnMk9Ca2mxV7LEwYa0CIq7CinuVnZKRXFfis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtvjQO+laAbchHP1i0Vp1mlZGxyf3qT1DHDCned2EjnR4l1KZ8Efq8ynbt9YmOMHRizcKCARke7vJJ1zWUKx+lippYvwBDLwwhNGkHr45FT+5TfmfpnUm4g7z37eOV5GjhNl5TaJh/yBlfxhoO+N7GO2ZAd8AxUoatNXpFq2oDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfq3xTB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQPxRswk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfq3xTB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQPxRswk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7Nkk2167694
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AhiuAVIZ1+LG5oeQ6rnK/3zmSX0mgVXYXhfcI3yIwU=; b=lfq3xTB+qsdgCgZ4
	09AP4rZRC3qQREgcTruuqcIVn/oJry+e8snFr9Tw4ip5V4hPe2GQLDMoLUPrhzH5
	mpGsra6uyRzcJWgzmprLiNI3g4QurMhEc53Q2natH9gScEzSSsNxgS7UJ6zjC0ja
	v0E3+pv3PjjoJcNxXuKjb/541OTaqpAMSy/JnvyI23AvXgf3RmidrreCSUvbMubM
	UWUvSUcaKnzHW1x+4Ifi83e2kJaN+LKrsmkRAYklXXAOrFdtDlae7e7m3OFqPJtX
	O7V11LrWcQGMf1YjzYcV9uVP52jZQ3r2SfiaVIbCo7NRf2IH0YhPbk/3R+YfM8qW
	ZtMrDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h00sh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:33:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2573166a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787916798; x=1788521598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AhiuAVIZ1+LG5oeQ6rnK/3zmSX0mgVXYXhfcI3yIwU=;
        b=RQPxRswktkHJih+E6eA+WUvIo1OJgLtdosC5/GmH6jfjZ24WM+I3b1pdAXEocM8x1j
         LYnYmiwWAda+d/GM41vKQq7jO3AB0MWPBThCFLGtqC0sGk8mMQ4girzAzMEdUiTF1Hjz
         7PG7GCmS8qwc7N7mbF1mW7hmtUddPJpd6jTf2Y21KTdQg1bFPUVX9tlbFRUOXpE4X9Qj
         iy+aER2C0JZyDOEpzsbCr8A1zF3C1vldWnmZaFVPGC+afeFkyxt5HlwcHq64n9ePm0sw
         7FzHZ78RzrJ5r/Dui0neZxfqGN+5r7y+N01RERqRlt4nb/mQOGFwmutKwZ9ag8RfU5NR
         /UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787916798; x=1788521598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AhiuAVIZ1+LG5oeQ6rnK/3zmSX0mgVXYXhfcI3yIwU=;
        b=ahFBmUjlcuegNOFTFY2zyqtd5D8sxmRZaAyJqH8dNa0pdoZUumPCNPmX3z3bbZHLMg
         uLXwGZK6sx/EDAjlqJDy+NmhrQkjtEPcpqvQe8RLUlxcNmFve+HHYJzuiVcM38EwAXvT
         4UN8byRjghjbWVk86iien7CsOdBDRiDyTfMmM9/jDiG7VDWCIPSjfP4NQVNahNL+xTMD
         K1hC6dSFZ/SpVF2t+owiOMV9B0YUxjXgCY9tXO1KF3YqnNbkuN5fxj9bIwE8TuKPgDab
         kWPG/dfU0bZUvfTUzpRuFIB+P91PaetQUriY/M7+VhwXBkbjSRb1zZGF7Fl45Xjxjc4e
         gt1g==
X-Forwarded-Encrypted: i=1; AHgh+RoVzmptOyWrCnEesUr+X0uDcgyYkkh7Vw7wQbLcfboNNciXezuqkjU9IKW4+0g4rLLjyn/i4GqgDzCTKdw=@vger.kernel.org
X-Gm-Message-State: AFuF++ly1cJpMDyLAuRWvan9YSqEy+P5dbgV0ZmFWydt9cFdFqjfd66E
	GdeoWB347D1GApFNsrjWsTuE7V8fE9YV85R1My1QFI7sdlOZ2FHoNH3UaEFgjmxwynRUZw70uMq
	MDK1eMXzHYM+XOQHCT1SDNwgSTiHISU7vVnat2zttXpP20yM8EWMBoKUbvraY1ovifgk=
X-Gm-Gg: AR+sD11UlSORB2duZUH+ouBMY3Sc3Dj0O9s8rjmiWIacvKB8vWnXLqm6DpRV9kisAHf
	/kwM1Gd1Br5Bm0L2uCdsJUeeYNFhEbJCyVuIrIRRi2agJWXKVFIxxdl+0N9O7OC27/4gsnvUsML
	VhgHcv1gC11esqqx46tCIZtRZrWSIDJbNXHdlCbwuaNAkig5d+5I6ArNOfZ5n3jLibDxAmKmnVE
	IrI3T+cvo8KHcP/5AdgonlRudjC3KX16HlFjBHqWDk1Jc7RUTSqyS69M/BmmU/7bpXdBsUl8odl
	xBN9l+jpOwY7eCJ7uiCvPVmIuZ0fmOMCfd9neRMOdrBX13ylvPmdnzEnybqiSwamTbG9PGfrzN6
	hRf6zF0Xxs8suHEwjjmudaoSRIlMnQCMTOiNq5Th2Nkrca1Amqthd+U3QIMi+nQRQ8sf46zE=
X-Received: by 2002:a17:90b:4486:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-396d0a46cfemr6594505a91.0.1787916797391;
        Fri, 28 Aug 2026 04:33:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4486:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-396d0a46cfemr6594460a91.0.1787916796889;
        Fri, 28 Aug 2026 04:33:16 -0700 (PDT)
Received: from [10.133.33.99] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc07777sm2431868a91.12.2026.08.28.04.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:33:16 -0700 (PDT)
Message-ID: <014e71c4-dfc6-4085-ac71-3e7ac01f160b@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 19:33:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: sparc-us2e: fix frequency table index copy-paste
 error
To: Xueqin Luo <luoxueqin@kylinos.cn>, rafael@kernel.org,
        viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260828075649.2728795-1-luoxueqin@kylinos.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260828075649.2728795-1-luoxueqin@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 97z3Q9Wc_kFWytVf7PQxTAM-PMJGA8uq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5OSBTYWx0ZWRfX50xqUPISJuMG
 /MrC+htaXnG9eFR2RWAxEVNSy5uQ85XMNLklwsOPre9txcfQWNcNOEG2LS6njcYD8uD1E3+xvgY
 dNR1OmxClcsPwnnHQjiStxlaATAKoqk=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a9171fe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=A9UGcEbXNFXwkxVidG0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 97z3Q9Wc_kFWytVf7PQxTAM-PMJGA8uq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5OSBTYWx0ZWRfX9nAIcWqt9ABz
 WvPHQbQJxPbbRk+9rD7Q366Ocwz8l3yaJqfzsPjin7w437oqbPcuQkxJ8a/cihcwE9PiGpUnUTs
 YYhKdF9mx+3i5XVUje36SsZ4evKsPGWg5AJjoUei8WsygbrRE9XRv8c8EO48/8qYeQtOL5bniGM
 O/omm+AQFNPrws4eml+vjZVZHcoU9ivbfQkImbKDieCSC0G/uOCI5PPoVKE5S5r8gPEMXK4aXxA
 L+QWgC5hOGb/DF1gn7P0mkSALsRoxvNYkLLP7N0xLfjyQdIJyL8XEH+FhY6M+xjCdUvH0+WBhJd
 iL585EFvYB2d4DuqqlhI/MxlI/T+ATPyqtt/VWpLHS+hC/kqRFDvUKSNPUJpNfILjIKl7gQ3kGq
 6Qo8nLnkb8Ee2ozN0ppiuupLdjZ3smRBVgVDVwY5PLT65lbewrVgwDH9aq35T+ICxa4n1EFZ6cN
 ALTNoUyFIdZuUUY9txA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280099

On 8/28/2026 3:56 PM, Xueqin Luo wrote:
> In us2e_freq_cpu_init(), the last three writes to the frequency table
> all use index [2] instead of [2], [3], [4] respectively.  This is a

Nit: Should it be that "the last two frequency writes both use index
[2] instead of [3] and [4] respectively, and the terminator uses [3]
instead of [5]." ?


> copy-paste error where the index was not incremented, causing the
> divider-6 and divider-8 entries to overwrite the already-written
> divider-4 entry.
> 
> As a result, only three frequency steps (div 1, 2, and 8) are actually
> available to the cpufreq core, while the intended dividers 4 and 6 are

If the core passes the array index (2) to ->target_index(), and
index_to_divisor(2) is 4. so the real available div is 1,2,4?


> silently lost.  The struct us2e_freq_percpu_info::table[6] has room for
> 5 entries plus a terminator, matching the 5 hardware dividers.
> 
> Fix the indices so all five frequency steps are correctly populated:
> table[0]=div1, table[1]=div2, table[2]=div4, table[3]=div6,
> table[4]=div8, table[5]=TABLE_END.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> ---
>   drivers/cpufreq/sparc-us2e-cpufreq.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/sparc-us2e-cpufreq.c b/drivers/cpufreq/sparc-us2e-cpufreq.c
> index a68706406b88..5cda391ad03b 100644
> --- a/drivers/cpufreq/sparc-us2e-cpufreq.c
> +++ b/drivers/cpufreq/sparc-us2e-cpufreq.c
> @@ -282,12 +282,11 @@ static int us2e_freq_cpu_init(struct cpufreq_policy *policy)
>   	table[1].frequency = clock_tick / 2;
>   	table[2].driver_data = 2;
>   	table[2].frequency = clock_tick / 4;
> -	table[2].driver_data = 3;
> -	table[2].frequency = clock_tick / 6;
> -	table[2].driver_data = 4;
> -	table[2].frequency = clock_tick / 8;
> -	table[2].driver_data = 5;
> -	table[3].frequency = CPUFREQ_TABLE_END;
> +	table[3].driver_data = 3;
> +	table[3].frequency = clock_tick / 6;
> +	table[4].driver_data = 4;
> +	table[4].frequency = clock_tick / 8;
> +	table[5].frequency = CPUFREQ_TABLE_END;
>   
>   	policy->cpuinfo.transition_latency = 0;
>   	policy->cur = clock_tick;


-- 
Thx and BRs,
Zhongqiu Han
