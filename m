Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5106254EECA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001909; cv=none; b=sjAyz+FYZEIATSuysWCaq8WMMN87TjZiV8bdEifPyEpm9E0DI8VZ8G3tFueZph5iVmRpPTUKyhdi69nn289OppDN6ZL0UqOYvGnB+W+DKhwINkUe1Ni5j+ZqiTBbvTz0c4G0CzpLiJEigSaub9Ff6BnxP14mNctc6BySzMjLtzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001909; c=relaxed/simple;
	bh=Ox/q6Xcbl2QBP9ROFVe2GfpUiBuzSrQ4/Fs0XSouoIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOGj0y1fZPeXE6nGVn1Ax3+6mThYgxFdvpYbbPODY0eazh3z1nzxdozVNuZyOhWqe2+OBHjTOVE5C71ikpCsbv/yhck3doylB28UmSCo0MmQQu0wJTc7b52SbtKBptBpscvfRW8Cx7X6pZm4spDP2nfTcrrnNak7TJLNxEQPlfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xzz1Sybi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyS2alLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xzz1Sybi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyS2alLM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZsQs3469372
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+QIhK3GwsO5V/ocGpIdAZt5/hySc9RDGIkALYeMRic=; b=Xzz1SybihzuMpOeK
	92+zcA5OAX9LYAaLW64vnylrofaGV08KDNx6Uk8YDaNltbsDXNvhttxIEVC+2NoC
	PByBmyRiaGxoPglAwzqYJtK6lY2DRIRHOx5tvOFjyprnUBtvlF6tW2e3fDVexyIU
	inJfcnS0Tbegbzukde4FvHJLjoYfCPb+aWdhANb+Bvx0jqvxqPRSG8r5RYDt9fbc
	o0zjz7ECzaq8g1dDD8GyjIYTS0VV/ej55DVRu6KifHo1wGqDDrT9cS3w8Yc8QDkK
	5CQHxVuytNIcOqfm0XXUHA4Xnhz1plYYj196kWEHX/5qld8/jzDYTYpNMChs9f+g
	xXVLbQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd78drr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:18:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso4800167eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792001906; x=1792606706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+QIhK3GwsO5V/ocGpIdAZt5/hySc9RDGIkALYeMRic=;
        b=VyS2alLMSafuStt0tXJOg9cmFOXMzfiaRn1quFtdTr7ga2X9OEpu9GB/Sp+Amy4MXw
         8QOyDyCF3agUtFvqad2PqoJ3yZP9ArLKuD50i5ljyaEMT6CWE4TV5cpg3yiHLsHncLmZ
         2ObwAwu70p83ot4ipYJWqsh5jlcU0pqR5ef33WfTx16ysD5lm2w3lZkgDMVz7wTrq7mn
         J8xEod0+g1m9Y9WqBfvLjV+A+z5W1b7pa0xe6xG84jiGpJabG6z4xaolw68uNzjvKOHu
         1V42xui9L8Kpy84aROA2hpIxBrlXvxt9Z8ImZSjVq9q7zJnfr1n58NLkqnqE+E8rmjlq
         FChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001906; x=1792606706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+QIhK3GwsO5V/ocGpIdAZt5/hySc9RDGIkALYeMRic=;
        b=gxlI5BjJzKw1slqgZ//69jmsxzdLRBMTyRyW1T/PXptx03nMv/YHrSUQf9NewcoT2h
         zEzn/WRkxC+GVEWA7CV8d1AaoLSO1IEPR3kHQgsY3XriaxEW80A4toll5JSZAqHMCjyV
         SP4UbEmSp8ZC1gi6+DYtThyfhTU1OlznYvU9mN637HLKZ2BXnGjBCkpTH1c5Jm3HvAvy
         aXag3vWmQpKV12eZKkHCBnwMxVXYtrkNxVxO3Jbo42zrLE5tgz7DeowZflCX/bT/eIOY
         7A0UG2w7zJM7MPzwrUDTuabS/+ZQglmCk+ANIP53TMGhDVvUhq9va9ScuLD8qIKAsLY8
         RMGg==
X-Forwarded-Encrypted: i=1; AKwUvBzID3ZEItO3KgPfdxwH9UBI8CI6V9tyyVbALJwPIhwMO5AjhoHn4NMI22e4arZ/84dqBAkAAZDJb7tNiWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcy8C1BEjWyG41MRzTI/pW+MqPYBI22zKhVZhnR4/G0wkTBfQ2
	F6vUMPjFjaRGoHBcKIcklQP9hH/AsAJ9tc0fKTlOmHi3W7NZToEG9OkgfOt6YBEEpnQ0ZliRLBT
	JgsRmqiOTTx4EuEx6GJN3dUFuw2vu/6J9m3wf3NKY+MILzB0HvdP1SA8c7kx+lHN2Vfw=
X-Gm-Gg: AYBFou2Q82EUGbJK2mHyf5crBmQzT1VevFfWOtFp4rX15JP0FNwghBjdgropn0G1pim
	YjJ/rtCSonVK/ESrzQXS9IKp5d69KTBSZMoTGE61ikeB/fkKirxX88SwjI5raJOlJRo8fdavqc3
	nsdXreVx8n5TE8wKYn3ImMIux8fAMhSqPhcPYVejFc9kuSe7t99ElY7dBXVE1DrIO2eJLWUT8kG
	iD8ATu6oC7pT+k6gsiCjo73z8quZWBC9azJf8I/6dzXcLOETMYZAmI6Ug7tJhxyQdJ7vpsu5y9D
	9cqhfb0a+alkjKiqDt4dAkFLmkIHpgV7+BsJGWbMizy/yfGu46bWatzoZ/ksWqMk4d87/7xdCzG
	25kQw3L45XjAvaAvDvlaZ4yUg
X-Received: by 2002:a05:701b:2411:b0:170:aeef:a170 with SMTP id a92af1059eb24-170aeefa475mr16695194c88.36.1792001905725;
        Wed, 14 Oct 2026 11:18:25 -0700 (PDT)
X-Received: by 2002:a05:701b:2411:b0:170:aeef:a170 with SMTP id a92af1059eb24-170aeefa475mr16695166c88.36.1792001905054;
        Wed, 14 Oct 2026 11:18:25 -0700 (PDT)
Received: from [192.168.1.2] ([223.230.7.28])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm75443945c88.18.2026.10.14.11.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:18:24 -0700 (PDT)
Message-ID: <3d428a49-3952-41ec-b79e-77631a9eee7d@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 23:48:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] ASoC: nau8825: restore safe state after resume
 errors
To: Pengpeng Hou <hppiscas@163.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Fang, Yang A" <yang.a.fang@intel.com>, Yong Zhi <yong.zhi@intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        ajay.nandam@oss.qualcomm.com
References: <20261014032452.13456-1-hppiscas@163.com>
 <20261014032452.13456-4-hppiscas@163.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261014032452.13456-4-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6acfc772 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=yZS14lHB/DhrxgecvCV8gA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=9GlB-Q5inm8YyT56jigA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: O8lJ-9wv3XQdAejnEiTrWCraB4iYw0Ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3MiBTYWx0ZWRfX0rq0TpEU9cBW
 LbrZsF6Xrrqdg003jTiqjgGVVboy3M0NbX7fW/JV3ZJ38SrKp7d5LwKYoY8Sf7CIdICTOqeY9nx
 +3KXNBMqtjNphLGgjz4vMkBXsezhAuYDqo5jdF1db14yKpxIhyxOxGnEaDW3BQ8jV+u/rq0dVQD
 Emq369zzdpVotQwcOGxUBadZouP8pVGwnxNmJPYFsRRfTvFtr4Ra+//nQU7gRp4FxcpJh9IzbFU
 asWc7u/55N0OB9aM6+T6ciCnUnwuYZ4YBIRgZpddiVx3R1ZzP2tGfafPEA4MvAt/lX/kNOK35du
 284gn6/j0ZN8qXoB0KqYxQLl/PyJ01Z+Y39SzEFEv1lkAlP5DM1TAmMmDyE3lfldciq9NBgctrB
 UJJpZ50KvGyu/163NVvo2YtoUomZMNKzjJmwGzAyElGdBQcd1pkcJGfZHqqJyoOWLTKRZcS/oBz
 EUDamA8QBNMVVLgrNKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3MiBTYWx0ZWRfX6XUKK5jFDsQj
 pejXlNPx+ub21t8rwrzCAeo7KS/5rCocNPDLW99ICpcsXe4aMAXeAzTa/ZcnKfva6un8fcFj1a3
 nSb7Wkh2VKvVyl89nfX5E1yzNRpbrp0=
X-Proofpoint-ORIG-GUID: O8lJ-9wv3XQdAejnEiTrWCraB4iYw0Ft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140072



On 10/14/2026 8:54 AM, Pengpeng Hou wrote:
> nau8825_resume() ignores regcache_sync() failure before continuing
> dependent resume operations. Restore cache-only mode, leave the cache
> dirty, and return the replay error before those operations.
> 
> Do not start crosstalk protection or enable its IRQ after a failed
> replay.
> 
> ASoC still marks the component resumed when the callback reports failure.
> Track the suspend-owned IRQ disable so another suspend does not increment
> the disable depth again after a failed resume. A later successful resume
> releases that one disable reference. This does not add automatic retry or
> change the framework's best-effort card resume policy.
> 
> The issue was found by our static-analysis tool and manually reviewed.
> 
> Fixes: 4454a8378be5 ("ASoC: nau8825: add pm function")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
> Changes since v1:
> - restore cache-only mode and dirty state on replay failure
> - keep suspend-owned IRQ disables balanced across failed resume cycles
> - send as one correctly threaded series, as Mark requested
> 
> Previous series:
> https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/
> 
>   sound/soc/codecs/nau8825.c |   17 ++++++++++++++---
>   sound/soc/codecs/nau8825.h |    1 +
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
> index 63d927f3140902e179bd491f757f4c47e8c314b1..11c548b99ea6d758ba3843090ee65b3d9f8f8245 100644
> --- a/sound/soc/codecs/nau8825.c
> +++ b/sound/soc/codecs/nau8825.c
> @@ -2683,7 +2683,10 @@ static int __maybe_unused nau8825_suspend(struct snd_soc_component *component)
>   {
>   	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
>   
> -	disable_irq(nau8825->irq);
> +	if (!nau8825->suspend_irq_disabled) {
> +		disable_irq(nau8825->irq);
> +		nau8825->suspend_irq_disabled = true;
> +	}

With this new 'suspend_irq_disabled' state, should the IRQ 
suspend/resume tracking also be tied to whether 'nau8825_setup_irq()' 
succeeded?

Thanks
Ajay Kumar Nandam

>   	snd_soc_dapm_force_bias_level(nau8825->dapm, SND_SOC_BIAS_OFF);
>   	/* Power down codec power; don't suppoet button wakeup */
>   	snd_soc_dapm_disable_pin(nau8825->dapm, "SAR");
> @@ -2701,12 +2704,20 @@ static int __maybe_unused nau8825_resume(struct snd_soc_component *component)
>   	int ret;
>   
>   	regcache_cache_only(nau8825->regmap, false);
> -	regcache_sync(nau8825->regmap);
> +	ret = regcache_sync(nau8825->regmap);
> +	if (ret) {
> +		regcache_cache_only(nau8825->regmap, true);
> +		regcache_mark_dirty(nau8825->regmap);
> +		return ret;
> +	}
>   	nau8825->xtalk_protect = true;
>   	ret = nau8825_sema_acquire(nau8825, 0);
>   	if (ret)
>   		nau8825->xtalk_protect = false;
> -	enable_irq(nau8825->irq);
> +	if (nau8825->suspend_irq_disabled) {
> +		nau8825->suspend_irq_disabled = false;
> +		enable_irq(nau8825->irq);
> +	}
>   
>   	return 0;
>   }
> diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
> index 2abfbb5184da80f3637f06d57a7564fbf1c7574c..8238570ed48c2b147a4a1a0d7061603f8b9b4835 100644
> --- a/sound/soc/codecs/nau8825.h
> +++ b/sound/soc/codecs/nau8825.h
> @@ -502,6 +502,7 @@ struct nau8825 {
>   	struct semaphore xtalk_sem;
>   	int sw_id;
>   	int irq;
> +	bool suspend_irq_disabled;
>   	int mclk_freq; /* 0 - mclk is disabled */
>   	int button_pressed;
>   	int micbias_voltage;
> 
> base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6
> 
> 

