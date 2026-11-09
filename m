Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187320;
	b=oTJkVZuB6W9dFkWmNGUnU2fIYIywlDiqt4BMqgwbU+1KFKr6yQpXBfETb5j+YPyE61Gd
	 Tth1HcMkH6WExqAXIzWFq9UQe2sHSSE39MgqQVxwropaorseop9decaZGWV/f8lTaNlZq
	 EYIHYo9HjerrZtQYlko23F9ooM9+vddrwVfmlNB2j/yU3ncMhHhQsc63LZPAw4IQ47egt
	 MkwpZPmdnsKadL2aa4tNLVr204ZUeLxCpLZ9KrkT/K7+YQIZ3FG5NsjJmS42Uj3WKe+eA
	 xNQHIKmy7p3O1d63wdiUXzwhByYQxaepdBZFwWCjvhPKmptDEEFn1lEx88GzJCTrhxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=;
	b=dgJ9tmp9JQKqcBxS7R1syshGqefdU1nkfwcezRoPPGYM5xLyvZoexUukNjM7OOYoC0vJ
	 1x8rABi6E33yMpUc4WL/lfcaA/4ouIAN2ocokQarl51z2yquYp3D43e5WGxCGwN9u/8eR
	 GlRXTpmoBcBqMfkzbtoKxl6LklvUCaua3zO6sKbjVqVklaO5PKGDEcZp5Y0dp3DzzUNyz
	 ZTp3lhJsrYkQUNikkXE5YVJBYfSoNl87OUpMf3Obia5D6YHXXMeklaJ30P3igcVvrwlE4
	 2Um3eZ5sziykcXfLwAJSfxlFG8uwPEpUS+6v1hySUityHL+g4jcWD8hBe40+rrMSaKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IIK81rKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JpXMW0QH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C7606EE90
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36C7606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IIK81rKF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JpXMW0QH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HBa33850196
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 01:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=; b=IIK81rKFxtWQTOdJ
	aseFKM+lDCaWD618ZA0BMXPQKSCUL57ICi1T68Ke7ad4lBBD2CsVsSrzQ4g0ITYK
	b0ReAEtp6Fb9ZCmGqIZdtzHFL34GJ5Q2SldcIKihX5eKso1Rrli/DmLcwrpB1K0H
	8+RAaqQmUV46wBb3neU8SM/UGwgiUXve8ha749zkKsZJKBfdFtkFz9xVk8QURWLu
	3l9GhtbYvvF/yIwsNoSRALJ+G3MPNO03tzRt1XtohPEf25PLW6XrjRQy7DAC7O2L
	asnmoq54bLVvATLV7WCXRj+asB6guC60ukLX5zLsIZkHPOPA4JBGpYohNttiLA09
	oyR6vQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf4fmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:21:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so276535a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187318; x=1794792118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=;
        b=JpXMW0QHhyY0FEVmuOIsQstXn+3zgMq4ur4oq4TTcP5e978rLsBCNZlLzKowh9zsih
         O9G4jo30SppCeWPRjy+blG5Tk5x73DImqq/3dR4PS+AUHVZUhHOMObRl/SMgd+AFLq3V
         /RCXy181w56OtgdSv1QEacUPC2kbHqeuk4ZB5fbzPhdlK/NpILVBcTeBM0ac+uVyrA6f
         jNfrgxn0S2ot6jboUCVmGr1AnI/lfJ+ukntcKSiQrwwEFmVvvMupHl6/R7j8rMOqXtcT
         t97z5NDkFwSI8SXcRdQxl1AnJIEkGxsosiRcbLv9qFLwitRdqQ9h4ic/G4YtUJwYZQb1
         TvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187318; x=1794792118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uw2xNVXE3nPEvcSRMwLt65q7UQPCULUZxs5qUuZDgjs=;
        b=AzNU1lFg3WJqb84PyLdDd7GbaW7zRY33oHfmBLw2yMcX25AB77gID3KK7huxdpdumR
         +lsGwboLq3HZx9W7bCNugx2i0Pym9roUHnH9D7U9SemG13qXQc1mj3me+W9lpXsUuu0f
         uTbZJy7ZJ8bQuPixVkWSl1+s/5UNN2t6VC0HQmWiOkg6md6D2PJa546zJBJ40xzogSKX
         dKSdKMzxRB4wHR+UaqEpeazvSIpRW4NWObDsRLZkqiT1wO6jc/UZXW61k6Woz9YEVYe7
         zxy1/ypZ+yuzso3RONTlYTWoY0zslUxSMeJ3gqtHDYI2GX3Sqyf0FkWgqaBIlXHcTA8b
         wCGg==
X-Forwarded-Encrypted: i=1; AL+hErHQOOA3SNqwH/Yr0oqpuCqlipzfMIunQEhYPVCtsBKqddd/dTeCS6PRX6007Oqu+aI58NWRnbYvZ7oOsH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z91m371p94GWG3+2MQQFL4TeSAZ08z9im/vAda8KCfGrybZCt3x
	GL2knU5TGDMLaxVFhAaPsswRV2kwON4I/NTeYXhMEoL2mdiNk3ljHVLUA0CGGAKuN1EH7PMhQV3
	38xl4t4inlgthhGkyCm0ohJDhZAgExK7FC38+xTvQBpxnQJcUgCJAxAO6StkYlDt6sN8=
X-Gm-Gg: AYBFou1vWgJixYqSf+ZuveO2E4uYmTgp2uSH1VSBqUBcyD0KyrPiGyNje9Omio5NYSE
	kRCyAxyMkv0vSy/FNji95DisGGEwq1P9Nuz05a8JWICAk8amnMy2076malh7nusAuvgiHjmT9ni
	gg1kbLQFOcnAK3U8tgMbwzoNO0lBRYIwnM0a1CF0Z3p9SCh+mKTfEq3R+sz2jDK+3ivZd7uf6Ke
	WgqhEz9o5v/+50jUOMa9apMag5m/MpEYVfsW5w/O2WGYiA4eIsmd8vpnCpJyDsN24ilwuphbCey
	MqxufJEayZedN6PYNh7HMJHaSXFea6/XACLJCgf9S206prK3vteyzf92705/zN0KteHSn0VgtbW
	Z8dsf+9IpaGm7ggocFyd5FnOaJN/R193p7xO4NqprOgkWex4yGKkC/OBL6vLYMyKKAdS/
X-Received: by 2002:a17:90b:564e:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b12cb3ee6dmr1874647a91.0.1794187318451;
        Sun, 08 Nov 2026 17:21:58 -0800 (PST)
X-Received: by 2002:a17:90b:564e:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b12cb3ee6dmr1874635a91.0.1794187317899;
        Sun, 08 Nov 2026 17:21:57 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127970954sm4788398a91.15.2026.11.08.17.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:21:57 -0800 (PST)
Message-ID: <172f1a97-6567-4cf1-9c28-82938bea33dc@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:21:52 +0800
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
Subject: Re: [PATCH] coresight: tpda: fix race between refcnt check and
 register access
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfXw9UAgg2VVR0g
 OmrkAMvuQ+S8S8t/ORA2x/llEkPS2/hFpDcqCG0Trdrzrmyy3K+mMfXlFEwf5FQKVH+IqqUrkl+
 AimiLY+ho3R2i2r6n/l2UnBIelFmv70=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af12037 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=c7d8TTRRwYqZNTvHBSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: G9KBSTmcdmFP4sGD2-LfckOHcxnohOcl
X-Proofpoint-ORIG-GUID: G9KBSTmcdmFP4sGD2-LfckOHcxnohOcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX/B218ib2Qn42
 t16TrfEbyOrxTFPUxgJ5q6cdMfaGYGmz+GY20QjuKUjLHfxtKC2ovYvZsIq/kXEEIyXhWmKb2xb
 ofX+T8TYpy+O36mp7YulW1j93jyNOW6prdQQVyZFLk0GB3/UB+oTi5FwSTEeq+0D60g+/qDJTw7
 8n5oV47NlFKJ1F9GAkq7OvohXvuAtOhGG3gZjdyMIPtXOP0LDaAxzgXMZaG8MZy0N1THipq4qA0
 cCQ94IlIRyfrkBTzVp1YbvnsVuvCa3YomebR94B1GdtGb5efwVuCy5bAonosr9a/Rcaf46ThBQY
 Tq+mtYOHKmufY39Dfl2uRJvUXr93wal7yppqf+Txz27hOlL6lwbBUALyA7awFuIbZNUam8kzMGL
 QpIpregXbMULhA3Uw79d3SdullHLFcJYPY7E9srkzpKJn+d9Rp/yyfiXIdNyjh5crenrDI5nESD
 omhmmjSK44ILiPHKTLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090005



On 4/8/2026 9:23 PM, Jie Gan wrote:
> Several sysfs show/store handlers check csdev->refcnt before acquiring
> the spinlock, then access hardware registers inside the lock.  This is
> a race: between the check and the lock acquisition, the following can
> occur on another CPU:
> 
>    CPU 0 (sysfs reader)              CPU 1 (disable path)
>    ─────────────────────────────     ──────────────────────────────────
>    refcnt == 1, check passes
>    [waiting for spinlock]            tpda_disable(): refcnt → 0
>                                      debug clock disabled
>    spinlock acquired
>    readl_relaxed()  ← FAULT/hang
> 
> tpda_disable() decrements csdev->refcnt under the same spinlock, so
> moving the refcnt check inside the lock closes the race.
> 
> Fix all six affected sysfs handlers: global_flush_req_show/store,
> syncr_mode_show, syncr_count_show, and port_flush_req_show/store.
> 
> Fixes: 8e1c358a3b0e ("coresight: tpda: add global_flush_req sysfs node")
> Fixes: 33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR register")
> Fixes: a089d585a7f4 ("coresight: tpda: add sysfs node to flush specific port")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---


Gentle ping.


>   drivers/hwtracing/coresight/coresight-tpda.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 89c8f71f0aff..63a979312463 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -360,10 +360,10 @@ static ssize_t global_flush_req_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
>   	/* read global_flush_req bit */
>   	val &= TPDA_CR_FLREQ;
> @@ -382,10 +382,13 @@ static ssize_t global_flush_req_store(struct device *dev,
>   	if (kstrtoul(buf, 0, &val))
>   		return -EINVAL;
>   
> -	if (!drvdata->csdev->refcnt || !val)
> +	if (!val)
>   		return -EINVAL;
>   
>   	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
>   	/* set global_flush_req bit */
>   	val |= TPDA_CR_FLREQ;
> @@ -404,10 +407,10 @@ static ssize_t syncr_mode_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val, syncr_val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>   	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
>   
> @@ -440,10 +443,10 @@ static ssize_t syncr_count_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
>   	val &= TPDA_SYNCR_COUNT_MASK;
>   
> @@ -478,10 +481,10 @@ static ssize_t port_flush_req_show(struct device *dev,
>   	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	unsigned long val;
>   
> +	guard(spinlock)(&drvdata->spinlock);
>   	if (!drvdata->csdev->refcnt)
>   		return -EINVAL;
>   
> -	guard(spinlock)(&drvdata->spinlock);
>   	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>   
>   	return sysfs_emit(buf, "0x%lx\n", val);
> @@ -498,10 +501,13 @@ static ssize_t port_flush_req_store(struct device *dev,
>   	if (kstrtou32(buf, 0, &val))
>   		return -EINVAL;
>   
> -	if (!drvdata->csdev->refcnt || !val)
> +	if (!val)
>   		return -EINVAL;
>   
>   	guard(spinlock)(&drvdata->spinlock);
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
>   	CS_UNLOCK(drvdata->base);
>   	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>   	CS_LOCK(drvdata->base);
> 
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260408-fix-race-condition-issue-d44203254b87
> 
> Best regards,

