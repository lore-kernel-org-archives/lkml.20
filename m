Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105143;
	b=DXnf/gOrbr/d7nOfmiYuUN8w6XplB992iMnuA4b3x0s+1i/h4K6V1bghqYoIUvBhjDsb
	 A/sJ7s8YnQuOnQbWh2eSWWK2l1B+sEw4vOPUrsjQehbhGSgglbPtt0N4UAsjrlxtQf3W8
	 jk6U5LpOCS221EfDsKhGR4IAd3n7QzgScG+fnjV9jP0r3+PJZ1RALzw3JptnO4CMX01TO
	 t8jwk4FgFKhDcUj/LksmuD4qaiFF7FD8fLntWLZSKigFRAEdF//uQ2o4B20/KSM5lg5g8
	 5nuf6NlNSZ+m686/bumC0Zy0+ZrZhthbPMJSA/R7CDdGwiXSJARPZj0LRHk4ZGA1yCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=;
	b=K8lO6NtSodUbUYpWdo8sR+5KfV7+tHdMUzLX14tskPHdayI9plkG6iAn4M7+2bqwmXKQ
	 U3eGWld0hE7ViVwyoWK+vdY3s6t76/PT5s34Op4+ibSZZNpKtkZuZYEOU8Jj1eqAyV/9d
	 nqDIt1ssF5IY6onYGL/qAx8nbdEx8roXITBtUajDx7QL+1+B98uqw7f7hlDNzNWfM6R07
	 InpHNW31XuLrWecpHP6myqX/0BncIhatJjApUUBrP3ehnJzTCpRdRQ1HDbpgobIUpTtRl
	 0CB1WCdOb9GoPv0Q8X9ICM+Tm7/RsWQvlVNFrWFQOMjp9G5KFcTvNf45dg7VNWpzbeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2kg5bU5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiOtIoHq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C7C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2kg5bU5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiOtIoHq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvJu1614507
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=; b=O2kg5bU5iEb9LCkW
	yWbOqYhsYxostEVHK5uU53HpvKx5geCBwZK0rQXUbeCxuCqaAQ0ZGbVvnKiIYCjp
	Xi/Q7+9Wn6OisNRPZ9rXOwUW1ifIl65bFNhzOVZCWvSzxRl/oJAtPqKEIuYAC7op
	vz8z5YtmAVFDk6ZPOC9zgwiV63EBd5sDkCr2rVSb5izw5TkmP3GWgYlzB0Mmu4eQ
	q2fsXuOemUnVYKVpZbT8UczSN9j+9RMrVghBuGJiLsUP5aqdn3/V5m5U4Y8y7zla
	6TckiVAu4VQp+CmSL6VBrQQ5I2tBK6FnDEjMwL/AAj0PRnJrAN1ih4SaR+jN6iQ8
	eoiVuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5s71n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:45:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so45658185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105141; x=1793709941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=;
        b=MiOtIoHqGHctYAuA7gpnqSd/jPVCGLkz13x4aODt5UA10qKtyXBvYFWmDXCgTVqI0M
         oD3Z1DLu0qbP/8nU5ibHI/JlhWBJcWhyRjkg8Zd2qhW45y+d0XVngOgFJ1hzgUtOQ0uh
         ibq7uOc1jpvBgilCvxe2dgQo4aZChRREm7eO6YiOS2avDQtdLSnJ1v0GKwHo3ChAwIdw
         KpcgJuPQ3oHAji8SmWKQAxlryWZGq+IP/LUqmEs5zzNkVyaswzofLxcXgjz/ZFi8FBU4
         rYxvJ4EsAlLtHxch2jd9NrpZz9uTZau6XuKcdnCpRYY5xUYSKqB0j4Zo09bQNMKOGgOZ
         0udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105141; x=1793709941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=;
        b=VATXqJ2P2R7TDdvzxYMjWWS9S+SW+ch4n+R643gtkkfwS8zgAgScwnYII29epRPiOQ
         VucpAekv4we1gTOOuXbG4gSkJJ6ILCWJEL+cuUXFJxKHjNaN/V3jyCvwFXXl5nkysCoz
         /6z4GyxvV2CzMpHz3uv777MVcCPiQcLVrobb8ZGQXJfZsicL6yuFNWT6XMiHRKIRfrh6
         xfOBo+T6LuY5pJZ9inqSdaShXudR+Qbqbc0PKkcEqAe4kfbocqDAR0xRz7w+BGWu3twZ
         GgLP2XuvkRdyXUJGsMV8kp7A//XzUhevdc0CqhmQjqjj3HLFLZZ3pTCVPCM5eYUcqGe0
         caig==
X-Forwarded-Encrypted: i=1; AKwUvBzlog14PtW+9fXEhdDQ3x6aLmI5V7bJAlhc4TE+02yUJqI9r+ZHrFbZOcKxS/faK7BtqUHPqGvDlfjsqio=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeHKdDIi3ZxsAFIwdrhEt54AmfGJCE7FnNqrkXhwAPjrvQa8tH
	HJVRlkpxZqrlGweMBIXjt6K3KuehImSUB85tUpzJAtazCZLgdM87b4QpuVWxAxLlqxCry1/hVNm
	PyeN0N9KF3RYUFRfXfbuCQqI+IqA/joljgCPMRwLA4OtcHQGvCLE+I27TlcDzZwgw/D8=
X-Gm-Gg: AYBFou2QzuR4Q1H4RB+GXcORMd43AZN89CqtfIpIxnDHkdqInnUMVa+RDyhtvd8OdSI
	+3UugMgMHElmg1Ve/Zt7DQsn7vVeGPCMGTOL3xFxqdj76Lwbf6/6aFzbYRfGVGlAuahMCoQhB9x
	fbDtgb3bCoTH76pgLzxd9xlw9flfAAM6HbfprJ5sFzjzn/1JcxXh+PJiaS2nsqP2srbF0aAwyS8
	ZuzNsw9b/XHd/Vsleceee2ZhftSMNvF2Is91KZA49lw1glymxEsJllQKWkxNWLoHD8O0j+WCCJJ
	kZKUwA/GD8Hl3xQazGgcwX1jJk5Sq1qUa70mjqTDWANDFnNez0hbg5aqjimPyxbx1RdYzQ7RZEe
	72fQxcZOnz9Ub8Z7/NnEfKQ==
X-Received: by 2002:a05:620a:4002:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-940ef8f7c30mr2101124485a.4.1793105141171;
        Tue, 27 Oct 2026 05:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-940ef8f7c30mr2101117885a.4.1793105140612;
        Tue, 27 Oct 2026 05:45:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e208d1sm130366066b.85.2026.10.27.05.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:45:31 -0700 (PDT)
Message-ID: <abf21903-16ee-4d3c-8bd4-84ac2c4623f8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:45:26 +0100
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
Subject: Re: [PATCH v4 2/4] soc: qcom: smem: validate private entry list walks
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-2-b0baf39c6e01@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-port-smem-v4-2-b0baf39c6e01@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX9zTGJg1dGycc
 F+1ZxubDmdFysUDGZpsdxd1p7gxROltpp7oCtvOddhoSE592PAyZF7m05mZfxlpWd+TKpOUF6AI
 DISPpGxkgFI4HXA7HKQaMVzLJgTICsE=
X-Proofpoint-ORIG-GUID: kQl4yexGN6u9tZi00FJAqf6cMtWPNyHw
X-Proofpoint-GUID: kQl4yexGN6u9tZi00FJAqf6cMtWPNyHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX5RmL/bNpYxhk
 AsGQczcQJiAk8xHfGBc8ihYurZYw39qIdHxErBwvJvr+yUHVktM5Nmyb6oKAckw1Ounu6d/fzMs
 TPOh9FPBZz9PuFAHXEXnDSQFyubzUjVUBFnvGGXI3YwBORFoW02R4UldtDhEOCc4T5pJyZo3Df6
 /1huxsvJTMuDNwV0PY4wp8KVH1wfoGmQlzrDqjtVpwhHWN7SpzIkkJAbcF6XEU4PwdU1NtK0xip
 zAVloQQy99U9GdSo/OXsWp+3a3owLFha5rfMqy/h4ZPObhiqJLeJtk/uQAXCYINRMID8/Di6Uee
 MWuoxo8t9CpcE95QfVYvonSIz1/iT1Uej+BQQr4mNZLGbcYkaD3TdCUp7AOXf3qUKUKkW7rM9nn
 veQQpxpXSumaQZNZQou8+84fcajwdsjQxyDtsox1Epu6F1V1CFUu3sM9sQKqFDjbbibZFAJG2IP
 jH7tlMmZPAHSQqQMh/w==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae09cf5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=3VCCngPR7RMLY200nj0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270050

On 10/22/26 11:47 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> When walking private entries, use the uncached/cached free offsets as
> the list bounds, require room for a header before dereferencing, and
> reject a next pointer that does not advance.
> 
> Skip the cached list when the cached free offset is at the partition
> end.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/soc/qcom/smem.c | 52 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 36a4a10f3aec..a6732832e2c5 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -422,6 +422,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  				   size_t size)
>  {
>  	struct smem_private_entry *hdr, *end;
> +	struct smem_private_entry *next_hdr;
>  	struct smem_partition_header *phdr;
>  	size_t alloc_size;
>  	void *cached;
> @@ -434,19 +435,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  	end = phdr_to_last_uncached_entry(phdr);
>  	cached = phdr_to_last_cached_entry(phdr);
>  
> -	if (WARN_ON((void *)end > p_end || cached > p_end))
> +	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> +			cached > p_end))

nit: i wouldn't break this line, and otherwise the next line should
start below where the first condition starts

[...]

> -	if (WARN_ON((void *)hdr > p_end))
> +	if (WARN_ON((void *)hdr > (void *)end))

LLM noticed that before this patch, we risk overrunning end, but with
this patch, we now risk a corrupted/malicious partition ending before
'end'. A valid walk always lands exactly on `end`, so the fix is:

if (WARN_ON(hdr != end))
    return -EINVAL;


Otherwise my clanker is reasonably happy and I see nothing wrong

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
