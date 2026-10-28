Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178307;
	b=1l+PY+HnYruBP8Qi1K28qUVyJ/NsraLH57FSAo7D2yXsSSmJvIghhwpe7EEye4zke9UF
	 +8gcTnR9T60bCFa33k54NNmNg/L/HJmfuAf5q0RhHQTroI2QkZJniFpx6LIrrRUGWy1dV
	 3zc+vVAF+7OLCj75V+uRW/HoLJ8RSBT9ay356Y8US2LQbvtsbI3JgM1bJMhRPLb8l5UfU
	 YnLcGkF99aX5+CJMpvIHxad1AYPg8/9BTlEDigub1Se5DQwpTF2tBKvPXRJ9ei/RgA5+k
	 4r4+fNnocAP4dzWu3h8iSvXlknTe8kMYaJ52c9X9lpxD2Lc4wYTmCw6elEwXSZ33WgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XyXsofPcTo8FGzTY7aQGuAdJeI1I13ZBmLS61ks9e04=;
	b=KBG9mNzSEFV4hgnkNwLGFD5pHxzf7U/Bk3RCPx+Mu3ozskDj6R6W99VRHBHOL8xoNmC4
	 /rofhm0x7nORjSPiB3iDDxPeKoeDDCIegWu+J/etDzNN3k0KTDCaiDmCgAZzuySG7cTLq
	 YOrnnW4xOOgr1VW2w0kplzyCjy7OlX+t6Vuhu8BzbxbrUCcnJ6G2/t6AV9hAYhiKk3rUl
	 Gv/O9vFShJf55Sj7Bvk3FwNZ3zw/Y8uUlI9heTJGDym9SiG26nEqjVagcWW2Rj0TRK3RR
	 sKRl67SzjR0l87wOERmskgSsaFLlOMgghObI11C9+jUs0r7CnYm7u/nAm9Imq5iihyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CvpDM1XK;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B893606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B893606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CvpDM1XK
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8i9UR710586;
	Wed, 28 Oct 2026 09:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XyXsof
	PcTo8FGzTY7aQGuAdJeI1I13ZBmLS61ks9e04=; b=CvpDM1XKid0MSPAtaIw8OA
	dsjL5A1rsNknjI8glZk3DVPOVjqUrbnM8CTX2T4AuvubjZ+SUD1DBTpjh1ySwgFt
	lR0PBvjVrimV28l8eXQKZ+zU9AoCaR95DtuWWvFF6uP3ZmUqZBojzipieFlWNQYu
	3Gw7Hm5GBnMWfaXjz3VOdZgDSIdECKjUk2fK+XUdtgdnxk9G9YVqr8fEDDl5TPZ0
	LZwy7efzYmUJikvxRDOeBEnknTqm+ZKGeR/IPIgwFlCrchGsuwvh4GPb2m8KOfOA
	e3Tcjr7nOYXVEx5Dx7dp9fDCh5JBU3SiBM5IBBQTdrUYGGZkCxegr1IF6BEBuJCw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hgj3mbyfy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 09:04:55 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JsIj1274903;
	Wed, 28 Oct 2026 09:04:54 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hjsu7vgx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 09:04:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69S94rEC50790752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2026 09:04:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B62F2004F;
	Wed, 28 Oct 2026 09:04:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C15D22004B;
	Wed, 28 Oct 2026 09:04:50 +0000 (GMT)
Received: from [9.39.19.193] (unknown [9.39.19.193])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Oct 2026 09:04:50 +0000 (GMT)
Message-ID: <3cddf9d4-6ce8-4633-97f4-17eb70136db5@linux.ibm.com>
Date: Wed, 28 Oct 2026 14:34:49 +0530
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
Subject: Re: [PATCH] virt: steal_governor: store only the sampling delay
To: Yury Norov <ynorov@nvidia.com>, Peter Zijlstra <peterz@infradead.org>,
        Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
References: <20261026171252.3860162-1-ynorov@nvidia.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261026171252.3860162-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNCBTYWx0ZWRfX0RyBlccCftWU
 rxSp060pGnOjVlBoeNYO2Dpx70lu8GyG0RJWWHk8GS3pAOgG67aJUlaCK5LSpRVll+QEIest2v7
 2k3uWmji2AkD7G+BA26hQHR5LDIKckA=
X-Proofpoint-ORIG-GUID: B5bW1RDvggsx7WZRvy2_FEOq66pdOrZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNCBTYWx0ZWRfX4gNiiJdPDfdm
 uerqwTznPfBwFVa9HG98rnc880Rr1UMLRAml5h9NNI9YWiCcLUDaLOtQlSul+rBFPzepwiKO0OH
 J0pM3L1A2AqPVrMYgNXGvUNFQuFKs4GhRAmaiSg3dmb29nWAF9Y9k/SGtwCpR168iVoD65oRjAo
 OF9LURvACuiJvSQr8c0J2d6uiqPaukJq13KHHEgImmbJKzjmtUE1xl8rvQN156puK/N3D+Yy3lv
 +qofpp3IQjaAESHrXLDrklT8ffKPUIHWN5dElTUOnd7zY9idjYS3+1QiuQEkezqU8MLb+T0J2w2
 myUMFi5xN+iBSHA9qqdVQC1cxLo+LK0OVkDBBMk5r8/6tueEGiU74xa+kaA3vUnWCC4Fde5s8Do
 SEfB20MR1kZ4EFBMogntTEtBHYOOwUwHrPZLZ+OLGQvV6Vf8A4+sJb9Dl/kecxoiT0tCHm7Wb7s
 U3W3aQOAj0n+fY046kw==
X-Authority-Analysis: v=2.4 cv=G7uJgNk5 c=1 sm=1 tr=0 ts=6ae1bab7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=Ikd4Dj_1AAAA:8
 a=VnNF1IyMAAAA:8 a=A5I0YoTLkxdnOS9TWZgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: EvZSBbrxmlFtu13cvcMJiTG_C5sdBMN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280034



On 10/26/26 10:42 PM, Yury Norov wrote:
> The governor stores the sampling interval in both milliseconds and
> jiffies, although delayed work only needs the latter.
> 
> Convert interval_ms to jiffies in the module parameter setter and store
> it directly in sg_ctx.delay. Initialize the default delay to HZ and
> remove the redundant interval_ms member and initialization conversion.
> 
> Keep the read-only interval_ms parameter by converting the delay back
> to milliseconds in its getter. Use the same conversion for the startup
> message. Both now report the effective interval after jiffy rounding.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>   drivers/virt/steal_governor.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
> index 6e31f9923dea..81e5089ba824 100644
> --- a/drivers/virt/steal_governor.c
> +++ b/drivers/virt/steal_governor.c
> @@ -39,14 +39,13 @@ struct steal_governor {
>   	ktime_t			time;
>   	u64			steal;
>   	unsigned long		delay;
> -	unsigned int		interval_ms;
>   	unsigned int		high_threshold;
>   	unsigned int		low_threshold;
>   	struct delayed_work	work;
>   };
>   
>   static struct steal_governor sg_ctx = {
> -	.interval_ms	=	1000,	/* 1 second */
> +	.delay		=	HZ,	/* 1 second */
>   	.high_threshold =	500,	/* 5% */
>   	.low_threshold	=	200,	/* 2% */
>   };
> @@ -74,15 +73,21 @@ static int param_set_interval_ms(const char *val, const struct kernel_param *kp)
>   		return -EINVAL;
>   	}
>   
> -	return param_set_uint(val, kp);
> +	*(unsigned long *)kp->arg = msecs_to_jiffies(interval);
> +	return 0;
> +}
> +
> +static int param_get_interval_ms(char *buffer, const struct kernel_param *kp)
> +{
> +	return sprintf(buffer, "%u\n", jiffies_to_msecs(*(unsigned long *)kp->arg));
>   }
>   
>   static const struct kernel_param_ops interval_ms_ops = {
>   	.set = param_set_interval_ms,
> -	.get = param_get_uint,
> +	.get = param_get_interval_ms,
>   };
>   
> -module_param_cb(interval_ms, &interval_ms_ops, &sg_ctx.interval_ms, 0444);
> +module_param_cb(interval_ms, &interval_ms_ops, &sg_ctx.delay, 0444);
>   MODULE_PARM_DESC(interval_ms,
>   		 "Sampling frequency in milliseconds. default: 1000");
>   
> @@ -270,13 +275,12 @@ static int __init steal_governor_init(void)
>   		return -EINVAL;
>   	}
>   
> -	sg_ctx.delay = msecs_to_jiffies(sg_ctx.interval_ms);
>   	INIT_DELAYED_WORK(&sg_ctx.work, steal_governor_loop);
>   	sg_ctx.steal = get_system_steal_time();
>   	sg_ctx.time = ktime_get();
>   	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
>   	pr_info("enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
> -		sg_ctx.interval_ms, sg_ctx.high_threshold, sg_ctx.low_threshold);
> +		jiffies_to_msecs(sg_ctx.delay), sg_ctx.high_threshold, sg_ctx.low_threshold);
>   
>   	return 0;
>   }

Looks good to me. One less variable.

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
