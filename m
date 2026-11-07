Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034660;
	b=rWtQC8/ofFIg4/71T/WxaY69VVr1PsAX/BnyG6m9I4JjU0w61+N3vUKmX5+CjyZa/c8q
	 D+19571ScGrh39/VUvpNZWy331K1Fw0H7jfkqqqZlIH/NIgg8wg5LgJRgiJjhf9ftFj6X
	 MpwTCyIfdK+jXA/TTtpTd2vlMqgipXnQZ2V9iJotTgtOlbjNcwT5aL3h60a0Iv4AZ5wki
	 NzdGsRT4eOWCj72qhOi1fTx/m9FnaVWHMnHFDcg3G308RH4gwM/gQZUJI94o2VjHObG8v
	 dDebdhHftefW20KoLzjoE0KL++LwRe51a80QfsIFlpg0Nv/S32lbnqEFpUDRTqvS4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034660;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=8Ug3zsrw3hMyB08E82SI0s/LpxJ07OTjoo3RCvK3O7o=;
	b=ZqviB6ONC3Bs41gbTfv67sh6poOafe8kcoJMdlMkCnzLpphfGNMXHI7qiB47iQfs04Xw
	 TPtGlZ3SGYsobD2sweTbxwHPhOvIfWpI1AsiDqaDTSdHIGqnE406w4TktRW0psxidjsec
	 xIU4Jh8O4DEp7L37JPszp7TplP6yHwuJkM4rNJJWHQXM+pW5suqWYGF5lTmziZ9+3CZPB
	 42Krg+z5um+ZVvgZjreyRBafbqjrSbawUKlvaFUDvCIbv18My9nMBcFbE7gFOnW5e8Pco
	 tnIRVwwpSRJ3EsTn+8RCG3zW7o2p0sjaF6YVTYoddRemFkiXBthTDY0gsYRYlzGwDAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MbmNWtfQ;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07608606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07608606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MbmNWtfQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=8Ug3zsrw3hMyB08E82SI0s/LpxJ07OTjoo3RCvK3O7o=;
	b=MbmNWtfQFrmF0p43YnByegf78XlnGoPNoGzxC1w3OteVb3TLh6IISRFtYZHVaZ
	SMx5UvO5RWV6QE/ak9HijbMNSXsH4pBAOLLC95mcTl2Bqt9xVqvJxosYRq/2Ys9C
	BsJt9e9or9IA/uGjVZnY/gjz5FMOC1S1gjHzdzHGdcrfw=
Message-ID: <abf91f63-473a-441b-8264-2573067fef3c@163.com>
Date: Sat, 7 Nov 2026 14:56:54 +0800
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
Subject: Re: [PATCH] [v2] coresight: funnel: inport schedule by priority can
 not take work
To: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
 leo.yan@arm.com, alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261027151457.5713-1-xuchao066@163.com>
From: Chao Xu <xuchao066@163.com>
In-Reply-To: <20261027151457.5713-1-xuchao066@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X_u2y+5q7AmfGA--.20947S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Kw48GF4xKw15Xr1xAFb_yoW8Aw4rpF
	Wqk3yYvF1rKr4jyw47tF4kWF1UtwsavayIgryrKw48uF15tFykur48KF1kKrn29FW8Gryf
	tr4ayFyIga4UW3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3hL5UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC6Bp3vWruy7oL+AAA3+


在 2026/10/27 23:14, Chao Xu 写道:
> The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
> rejects priority register writes whenever any port is enabled. The
> current sequence therefore prevent the configured priorities from
> taking effect. Write the priority register before enabling the
> first port.
>
> Signed-off-by: Chao Xu <xuchao066@163.com>
> ---
>   drivers/hwtracing/coresight/coresight-funnel.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..500ff72a83c8 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -62,13 +62,15 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>   		rc = coresight_claim_device_unlocked(csdev);
>   		if (rc)
>   			goto done;
> +
> +		/* Update priorities while all ports are disabled */
> +		writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   	}
>   
>   	functl &= ~FUNNEL_HOLDTIME_MASK;
>   	functl |= FUNNEL_HOLDTIME;
>   	functl |= (1 << port);
>   	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
> -	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   done:
>   	CS_LOCK(drvdata->base);
>   	return rc;
Hi Leo, Suzuki,

Gentle ping on v2 of this patch, sent on Oct 27.

In v1 you suggested moving the priority write into the first-port
branch [1]; v2 implements exactly that, and adds the TRM reference
you asked for (SoC-600 TRM, PRIORITYCONTROL). It still applies
cleanly on top of the latest coresight/next.

[1] https://lore.kernel.org/lkml/20261027084133.GA766279@e132581.arm.com/

Thanks,
Chao

