Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187963;
	b=AnvKZQCfHY1p+0ICMMIec7dU36kEkul1Vj+fXw1+AwxtYucaOackLvWlVCI8/vfOYMAZ
	 vimWTC6gpWygIaOU8s69GlKRKaWQLwepArxJmyQBk6pCMptKysTMYMNcVcroKhZtwFJ8M
	 BtaS2YFIBEGEciy+w8+MbLSHO492O5swxEQrqX/SODUc8jexvMIX9tZmqF2iIfS4CpWgn
	 fMQuYzhWJmkU13koUE3FgD3LZeLCfNELg7XotcLLKUdAsvGSBIVfujK6CMB1z+EsLnXsN
	 tkXdzly7tEEuGeQKZSzVkfzdQdMbJJvVjkGRk2LLYy+NE37B37qqVLZzK5A+6IoHk0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=;
	b=Tj9Hww70q9dVxegSlvUDhOGW3TBo/OmBb2SDVgGDK+Azx/gNDYG9NVsPFUaEa1pCGTjp
	 HeDm4cMNyVZQvK8AluLPFihVY1YaDVI6DmPDTo/iMNXx2lUI3MbryuE7AciGneOAMVijg
	 ZlKcW80fG5/2cgKT+dcWsofdwR4Amu4pfOfeQJcfLsnwGGKGh0Sx0YHR2jJpH6hwnBR37
	 R1ibvPFnJbxA5r8lIvnQdUFNTO8M0mhiIQDozQAwEnpVqvXXSO5yIh9423h+4vYZmIVP1
	 62G3OWOUncgbVHf8lm3mTVPiUxuWqvf+R9bohnedtKG8c5wtAIaDv8vqkuLqYW6KCPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cP/mT5ze";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtWNSdfZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF484606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF484606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cP/mT5ze;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtWNSdfZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HLp43514786
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 01:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=; b=cP/mT5zedeMXbYdC
	+YKh5Mv69zJgx7Xcvr9wBoqHGOjGMMpdXCFcK2ubnX6gXRLiHi6eAtRZ1ZJPqM+z
	uib4ntnUZcHVWXpBlagYTwGWernRnxBP+kttd2VSxAk9j8iNQI3w4Mx74JRAG6G+
	F+GZs3HGibiEV9C6lwOxkn2/TBvps8dHAPdbobrzHzLYRr/ujQx9RTs0k+dLN51x
	2mtX3aMtvXCLrWYxrDlaNyne6v2X5Uj3MQnkWdZ2wK0sup7wgx08X9CjwCtO0w0o
	FoTlosSgenjNM7d55i1/7wz47upPK3trPpnFuQ6p0vrQzPV5rKZiD3dNC+zQ8oTS
	VbFgKA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxc80g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:32:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso6833825ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187961; x=1794792761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=;
        b=AtWNSdfZuC4Z+dD5kDjTJqG+SVRlcUxOLZtw4wGr3lNu40nhOq8oFkM9aTgGkReXP6
         klwLCONDamLkVsVIFZTcW9YVdGplG4DyhZg6haBZHqCoqyCEm9sxQgQ9zKNhJMGWADib
         BadiYmowpTOMYpILsbCFdIGRoabXEmnqNc149oOt2k62OkSaPhcFoUqId24NjMUnyP5c
         jGxPIDuKGGzzSa1EuUc5kCKWMD6OkrC+qLja4fQqUA9Ia7oJVpab4fYWp+Xamq2zeJqR
         74dYQljvFCRyeAG5dhalzvtPT4AM0Wfe3KYp58LARfkdBq2v1rAmOo993nU/p5kCyYAr
         LwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187961; x=1794792761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNNvo8IgFhtBrUlYa/0+5FIgAjOkgKbqqO+l2twysMM=;
        b=XQ2mVTXk5h6h9sGolMrhgJdUlT7yoXzdkeU+okmglZ+NA4gWw3s7AowTNBkbNs6pH7
         d/abtMnKvhgPDZaORUTZS9lDSZH/D/HdCBNr1F0KvYhuuiZ0z/pdq+eVkKxZuseDjfow
         3e39dFNZRPGpAieyU/6xbnbkcU7Id6cnwJEru+XvYbHRI22gTyW6LJTqjUPi+CO3Q+0q
         ZaZ2tFRQgLPJo2UHksQ/w+aHv29JghVD6N3ofuyZI8S2YWGM+b4l0AynCJArenrGZN32
         fVd9VRK0gvcizverxdjosu7wqv9JCgS4x1vKaoNY67d061rM17OdBQH3IdKks7yocKE4
         9J+g==
X-Forwarded-Encrypted: i=1; AL+hErEv0j7iFUwoZGDrrySm1/dMrZnbKfHthfE9naUsYi0IVX/8ocCppTu5JCWoxXNYgvbGwgmRH1JlYpWEq3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JTf3L6ReYs+XN62p0HJciFfnC8svkpeRg5YJvtsqyf5q8zKY2
	RSqXQPqRg7VPVwGQCSE4ILcX+1xa7DctRLw5xv5ndtacT6jWLcw38nJBJG9O8wjrdfTBNz/2DLU
	ZRiw/PhXReaztx5oFclgdO0bghUKJUbK6ZRrRQlemeFC61u3hnXhj8LoZUroQiNZhXrA=
X-Gm-Gg: AYBFou31lka+w7TVnm1faSlKNdwcXz5TEATFLKGzstx7qIuVZN24yfX5Yv+NZWJda6v
	kv4YQr50H5FsN+rnIcA76TSmZ5KOLcf4mNyZSlfRepNwy3KijSOtpZpI0pVHDCXJygFlmq2K2nb
	iqK+z35Wjb2oW1vJ8F7WCSfOgTayc7UqzDM8BQG4SLUJ/0uVEbyIgw6TyPs9TimZmgLuJs54n1v
	lWr2S35075Zpxg6Rlc2a4Z+Cr+M3qWtdQ48OCJaqiealCPKGMaPbWj/aWoEWS1Rw0U/n2i3jG5f
	uGy7YMM6ROoWno60XeGwSossFAVXxhJW3orXdnG+ecTRJ8OheOacCggmiCzR0LJ5urFkVLQqGkA
	o9acPFhiqIk/W6UKx7NCb13Apr83KBMOx0AQLG0/82n8YSkIamazZdZgFzwlPvT1Fq1jp
X-Received: by 2002:a17:90b:4a52:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3b12d441cffmr2288722a91.28.1794187960398;
        Sun, 08 Nov 2026 17:32:40 -0800 (PST)
X-Received: by 2002:a17:90b:4a52:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3b12d441cffmr2288698a91.28.1794187959823;
        Sun, 08 Nov 2026 17:32:39 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712abcsm4777238a91.1.2026.11.08.17.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:32:39 -0800 (PST)
Message-ID: <42ac8b93-d8d4-464f-a834-89303db792ed@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:32:33 +0800
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
Subject: Re: [PATCH v2] coresight: Fix clock refcount imbalance on platform
 probe failure
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260910-fix-clk-issue-v2-1-fda3dd324c0b@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260910-fix-clk-issue-v2-1-fda3dd324c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nRSAAzEMZDyu_SBeedkpemtmFI7MQboQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX92cV72hODRwb
 2TFiTUKeeaWCv15JNWmgenw41Ann0NgnS+aPYWitDq0LFn0BXZxpjx+2I72jtfd2ZcMxirndpNf
 xoeu0ZUvET5VJ06mJIbVM7sYkD7rzSJeyLOFhPgXLDbs30F01QQjgZ+U/X0ZgLNOiYNXDtxiZO0
 jp/8HMfPBZqDjWZcUC63UUw8u1ed1QpVIXkrmEDxoD+ZHHahDiC5fdS0rnGRRiIhji396sZ51Xo
 WhMscYVOrWinl9tRZPx8GgDQpLLsmlsJSvyhLlgqpLfBL3hHgXeibh0umYdGSvL7k+RSUYp+Rr/
 BN1rOWo5TOvDPbSh5uXxD4ztYqWcAj5xasl90+QLN1HoSELnXQMUDAYvRESShfmGgIn9TiQZyoI
 FIfWwWzlNsFM5BPkMl934SxtT9+Fv7BqczNkz5ajeV8R1q+eQ/r6orsNpB3jHduKI/I3NmnP0y5
 TUnocbiDn5OYQHPqi9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX4DHlJkxJ/OqE
 1uQfjrzcDefpMwvqcbaqrJGE7sf0p6amMUUMpFbKz8vTtWxa0V+lcPOeL66zeNpZygCB2WPGnWx
 Bm6Z8xU9VuIFPvCXrZMxURY8omSVItE=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af122b9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=IbPb2sMBOJwYpCUqmF4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: nRSAAzEMZDyu_SBeedkpemtmFI7MQboQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005



On 9/10/2026 9:17 AM, Jie Gan wrote:
> Each CoreSight platform_driver's probe() enables its clocks via
> coresight_get_enable_clocks() -> devm_clk_get_optional_enabled(), which
> registers a devm cleanup to run clk_disable_unprepare() on driver
> detach. The probe wrapper then unconditionally calls pm_runtime_put()
> regardless of whether the inner probe succeeded, so on failure this
> also fires runtime_suspend() and disables the same clocks a first
> time. The driver core then unwinds the failed probe and runs the devm
> cleanup, disabling them a second time and underflowing the refcount:
> 
>    coresight-etm4x etm0: probe with driver coresight-etm4x failed with error -22
>    ------------[ cut here ]------------
>    qdss_clk already disabled
>    WARNING: CPU: 1 PID: 432 at drivers/clk/clk.c:1188 clk_core_disable+0x1d0/0x218
>    ...
>    ------------[ cut here ]------------
>    Unpreparing enabled qdss_clk
>    WARNING: CPU: 0 PID: 432 at drivers/clk/clk.c:1061 clk_core_unprepare+0x248/0x268
>    ...
> 
> qdss_clk is shared by every CoreSight node, so the extra disable drives
> its refcount to 0 while sibling devices still expect it enabled. The
> next funnel to probe then touches unclocked hardware and panics:
> 
>    SError Interrupt on CPU1, code 0x00000000be000000 -- SError
>    Kernel panic - not syncing: Asynchronous SError Interrupt
>    ...
>     coresight_clear_self_claim_tag+0x7c/0x1e0 [coresight] (P)
>     funnel_probe+0x114/0x2e0 [coresight_funnel]
>     dynamic_funnel_probe+0x24/0x70 [coresight_funnel]
> 
> On the failure path, disable runtime PM before releasing the usage
> reference: call pm_runtime_disable() first so no further
> runtime_suspend() can be scheduled, then pm_runtime_set_suspended() to
> explicitly record the suspended state, and finally
> pm_runtime_put_noidle() to drop the reference without invoking
> runtime_suspend(), leaving the devm cleanup as the sole disabler of
> the clocks.
> 
> Affects catu, ctcu, etm4x, funnel, replicator, stm, tmc, tpiu and tnoc,
> all of which share this probe skeleton.
> 

Gentle ping

> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - update the workflow regarding to Leo's suggestion.
> - Link to v1: https://lore.kernel.org/r/20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com
> ---
>   drivers/hwtracing/coresight/coresight-catu.c       | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 +++++++----
>   drivers/hwtracing/coresight/coresight-funnel.c     | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-replicator.c | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-stm.c        | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-tnoc.c       | 10 +++++++---
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 10 +++++++---
>   9 files changed, 63 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index ad8dafea7d2f..4e2687e61c9a 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -632,11 +632,15 @@ static int catu_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __catu_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void catu_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 9043cad42f01..5827b6d5844f 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -251,11 +251,15 @@ static int ctcu_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = ctcu_probe(pdev);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void ctcu_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2247ad55d444..48050f86ead5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -2330,12 +2330,15 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = etm4_probe(&pdev->dev);
> +	if (ret) {
> +		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
>   	pm_runtime_put(&pdev->dev);
> -	if (ret)
> -		pm_runtime_disable(&pdev->dev);
> -
> -	return ret;
> +	return 0;
>   }
>   
>   static int etm4_probe_cpu(unsigned int cpu)
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..264964a340ec 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -319,11 +319,15 @@ static int funnel_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = funnel_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void funnel_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 2f382de357ee..93274ab0cfaa 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -298,11 +298,15 @@ static int replicator_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = replicator_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void replicator_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 4e860519a73f..88726274ebeb 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -1011,11 +1011,15 @@ static int stm_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __stm_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void stm_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index bc5a133ada3e..c4fe2dde5bf8 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -974,11 +974,15 @@ static int tmc_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __tmc_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void tmc_platform_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 9e8de4323d28..4479d93f352b 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -288,11 +288,15 @@ static int itnoc_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = _tnoc_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void itnoc_remove(struct platform_device *pdev)
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index 7b029d2eb389..3166ed6bc224 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -271,11 +271,15 @@ static int tpiu_platform_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   
>   	ret = __tpiu_probe(&pdev->dev, res);
> -	pm_runtime_put(&pdev->dev);
> -	if (ret)
> +	if (ret) {
>   		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return ret;
> +	}
>   
> -	return ret;
> +	pm_runtime_put(&pdev->dev);
> +	return 0;
>   }
>   
>   static void tpiu_platform_remove(struct platform_device *pdev)
> 
> ---
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> change-id: 20260907-fix-clk-issue-51e43c533250
> 
> Best regards,

