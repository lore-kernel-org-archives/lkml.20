Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41467478
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750652; cv=none; b=holSDmamRxNYpERbcKySF3JR7gUWRimJefoqqulvDjQS9SQWUzM6do0w7fVtQPCTUMPKI4hnvtMuxRl/ekLsnv6JIx2gI14EZpxaRKzenkPsCr9Yvn70+mBZZ/X3nGPjY6JFoP7VT3eYlW7YeCMCIANCG+jHMK4NSVOchxZYBXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750652; c=relaxed/simple;
	bh=OB2wABeWabwKQU7skl+Rz9jtRZIAO84na74VEJNIaHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IilpfkWgGS3g54MfMLnHfn3eCy0u3w3/SEve0Yr/Nbx868DjhlnygFs0GgN2Fj1R/n2Rm7l/p9caYeo2ytw0REkTSIOBCpFH1x5WF9xKF+jwVrhsmk25N1Dd8Di7O/gqZg57TbzxY7TzoW/ZhdDbT1oAY2YlsN67xyzjWHGWD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpsz11t1788750627t59ff899e
X-QQ-Originating-IP: dv7d05JYBruWzbduOPxHqLJnZMoYK3QjfK71uKOVlKE=
Received: from [10.200.8.55] ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 11:10:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13353973710952998014
EX-QQ-RecipientCnt: 13
Message-ID: <3480763CC31809EB+b4251e64-96c8-4332-a9b6-592548cb6d54@kylinsec.com.cn>
Date: Mon, 7 Sep 2026 11:08:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpdm: initialize spinlock before exposing
 sysfs
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>
Cc: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, jinlong.mao@oss.qualcomm.com,
 qinyungao@kylinsec.com.cn, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
From: yingchao deng <dengyingchao@kylinsec.com.cn>
In-Reply-To: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: M+/j+50/aE0/mDV0M6sxwYXPveMAlBAkquEtPfyWjRuelnlQjb260EUK
	LIfEpKaawTetjF7qELCe826ABzaL9Mo0AbJreQPoNJXYBSTxE/PlxCvGhKjLTRYdnpy97Ag
	R/H6vMeH9Miz7+2dHB++lZQ5ZtvoZ+UL+jztoT0bLtwd6heby/Wd4v/qQFOX6aV8S9ebfpX
	o5zN+JTQL98ju4Ztz5IKkwEs2l+83J1NwcjyuDYTk7L5DUfQVTOGmZTr1psoZB7DrcthgAa
	3eAvVW6wumCrqL1IDCBj6HpXWEa2Thv4ggiTQOOaYcCG4TeiusMs4plm3hFp+B8eWPkI5tK
	MVFp/ftzq/YmE6PhMN685eXF7DCQmmTa6bHbEFzNcQ9iiJji1OguWT0DLs1IMTei2savgyr
	l6BeiEuvv9+usU2s4otV0AULJArQIUdhSeiKBl6FhpCDt5wR2lQvbs0NMPXLjUU3AfTRAJH
	p/c+yzqhkkTzAuCyEJ5d+sCtj88fm/Ocup92vNnctnne3+SR07OGS+ABu4ziXFUYvI5YHcR
	DhUvyGImVJ7/CJ+Y7D/Cm1/TfBGFMA5g9UqpMKW3XMDC5SVGihMcrh5o6TBIHpFg8sFAl1u
	Hnq8RuF5aTS5uKfBq0pak7SU6vtAH3aCa7ha5vmJsPKtwMDDxaqokWXyG+JD0TdYMm1izrg
	uEWpz5f1UGJhBMHQ5dAhoEXYI9m05VomIROytlwA7HNZ5ToEkF9N8R/U0a2qMC4zowtiP6Z
	pHpJsaBUu3r+AYoKdFfMToT621HeHX+6xj1OF8Eobx0FiWav/f6N+vOt3HUA/DHiWY9dV+U
	JZ2VoWLKx/eZ+5kkD8+fNGh0lvzld9Ox7x3bPiTigsi5Rc4QCCys5pb5bBNV472xJG6jIcI
	4AvnNUypGNMle4NE+pizKYC8HdPIq7QsFYYrZT3ByZ7vZNfCcnn4AshexF3j15UXPeMHwXF
	wYXF6J5hnoG+Xo9YTr3eIppDPwVM5WlXvkJAUFGJ2vv1Xu/sGUQ9Xmu/eH9OW12Kja8t1bq
	kWYT9+XYkjPe50ZeckTH3opN70rNA5hi+wzfpzXa5QLSX8z7fhaq2QZdYoef2CcwlfocIUh
	ZrMh4fIZWy5
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Gentle reminder

On 25/08/2026 10:06, yingchao wrote:
> From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
>
> tpdm_probe() initializes drvdata->spinlock after coresight_register(), but
> the sysfs attributes registered by coresight_register() use the spinlock.
> This exposes a window where a concurrent sysfs write can lock an
> uninitialized spinlock.
>
> Initialize the spinlock before coresight_register().
>
> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 8464edbba2d4..50d1351772b9 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1457,12 +1457,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   		desc.groups = tpdm_attr_grps;
>   	else
>   		desc.groups = static_tpdm_attr_grps;
> +	spin_lock_init(&drvdata->spinlock);
> +
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
>   
> -	spin_lock_init(&drvdata->spinlock);
> -
>   	return 0;
>   }
>   

