Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324638;
	b=fIEiykisDO/Oy2V+FvtdF/SHk00SuhArAWAySjKXtsATXpylE+gD9thhYvxwoflnKpfx
	 YdWj5ftXCCncauVedLnvwaVXRZOYSkrUrHSASgpEg3xKdy6pIpj9b0j+Uy6IVij2v2l5R
	 uRvltE7qWar/KHD0yaBLd2cLqRN7T62LUFYWaXYOlqGJ+X7cpaTrPMYNVQTY17wxd1Tsg
	 hjkgm7kH/o7yh7wN3su4OkbX1junx/iy33VQTV8IGP5Jgy6YPx0oTDM78siqxYaFv6gY5
	 ULxDTKEOK8kXKyMFKcBFu53vb6KsYMvDSpTquFTnZt9MJtWNGQBoH5I5ZG14G3Zup5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JwOHw4AU6Rnpi+DwWpdZ4fConTJJ3cMlVCSfDKWUcJk=;
	b=l/GHFFX6wNKilb/cXNnw89ZxVMVlLJfAWjRVBmlkqmK9HNFYy1RkdZYFt7HYCwjON6Vv
	 nSFdoquoPEXJcLCqa+fCnDqya9eEXsH6mjSvCZiu/cR+OwLAJC9nhUtEzQSlDp+Gjhbak
	 K4uxp7vh0c85zlRvofvGpdc3hN4yxhbCY+eGywLfLKBgXWxTIS9y5qUl5dAeajcbokkmF
	 f1RxiyRDN5kmsB3iKLbbhgiYY+jT84J/sG1fS3SpcPX4cp+dN+OWOy8ky3KTwSj3VGCWO
	 Uyjm5W+W0QJGQ7Va62g5xdFZ6zMgO4//71EHhLRUOPtgaN44PAhiy3klWiYXUFEL4HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jHOKJPdD;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1977606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1977606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jHOKJPdD
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so18625345e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324636; x=1794929436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwOHw4AU6Rnpi+DwWpdZ4fConTJJ3cMlVCSfDKWUcJk=;
        b=jHOKJPdDJgmR/YuGXCz554PJqSgDz+0040LXZcEfXqLTBVkh2GcbuxitLaIn6ddg4C
         S3jalKqyMLkq6pDKnl50NsZrZ+Lf2YxqilsU71GS9uQGI+Hcok3MFn2f0H2230pxLeY3
         egWyg9rjRJ1/7PQ6c5QmJfZbqdPbwSQqHvMVYW7oPetbr02bMKM40nFy2qEdA4PG7Lzb
         FAixSSJT9bhAN7B8+RhJCKivpV+Igs8YmZhftMuiWGiZdllaNMSNhY2i1yw8bcGerzBB
         dVvF/ETnNmwNPYDtgrepjnLMSf/gtLhSsnRDS5X6dB4CyFZYhU3tar7FiEuiHctqH/v2
         4NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324636; x=1794929436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwOHw4AU6Rnpi+DwWpdZ4fConTJJ3cMlVCSfDKWUcJk=;
        b=g1URX89vwIlaC+PbRi81qJiQRlYD2NpxXqCHPTPgqDhutIU4QGWt7a+aTpCNmi0ctB
         aG4J2MgASDywOUs767O5PLrK2TR2IwEFJiYfU/LgX1IVALmOvlHev6g0Mq7ff/bZ3wDM
         V9eBxVJo23zG/toDHoN/1JWLlOxgQuSCLPmS/t+t5ZRmtMwiDxHH227MEtk35/nvPYvR
         52DdZiqSRl2uHtNJ96c6JimoIcXbpzKe6Ji7v90UNI1Mu3bU35VmLqh8KNWvSolXtJFo
         KcfKtThKK1s1sVQO8cBVZCFs2lFvseer15/TDqo+syuTVG1R28g0roeDywE0t/htElff
         0t2g==
X-Forwarded-Encrypted: i=1; AL+hErEDXdWA90eEbAv1BJ+UdbqY+mhgBudG//aunbhEX9SQqmIGtX+/3fMJPiLqulQ7aYXauRO2jwDkvrgeYok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dgY0WwiaAnNj5eYjcpbO8LneQ6OM+SzFnIo6uWT+Yg/qlE898
	8OQII9xkXOsoGbScxb2xEO8/4aVteMd0SJoI87ZmopwFmXwT/OF+k12euptAwxuGrTM=
X-Gm-Gg: AYBFou2szLWe0jsOAAQz8olaaK2+rz6XfENKnDMDhzEMM5m+PlRolJdVxJfwuIthUyi
	MbaRagnBbd1dCHDPeD5CtPZXr24trJ/YwWjhX1IMwTpaC62SDf5MeRrFpuk7/Q77lLWjHuGNEct
	TaJ/+594HSfd87dzcAuJR9KA7iGfwLBcTa08VrkrwDfmtkK+L6bCCkFZtqkHSoeLaL+lxkxGwyY
	hBoSI+WOYTuV5FfIGBS2jub5F2zZTxMANxGTdN9B3dEwSHizfDfz5TeHVhXoZKWgqPSGafNGD/7
	NAEc7UjBtr/sz1/5BLDeZKI/NMYygp3U2oxURW0L0QTtGebn4uIcTOE9Uout1av/9deHcEBEXMO
	o4dRNbelpMWuD3ZWe+1HmyW5TMsL9c6E0bL6jffTNa5yppx4tUs8uubjlM4U4LNh5rKNP7xH3FY
	fUvstAy03YD7toh99DPMIOG1XDU0mAanpTb8RM2+T+v12+tWB+2LYqVUoFnvyWfDktZl5MaYsq2
	qC80/O7gnAZz3ZWq8KIcfSTwiU0R4HQ2GQq1YZPvKLAJPc/RF44loLii5pmaZ6a3ryRib3e/y9o
	zsIGWY5tRkvbMztimZ5ED5R/8vPfpx187A==
X-Received: by 2002:a05:600c:350a:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ba0233d8b3mr50053665e9.11.1794324636258;
        Tue, 10 Nov 2026 07:30:36 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm71842625e9.2.2026.11.10.07.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:30:35 -0800 (PST)
Message-ID: <4f84b645-a17a-47c1-a23d-ede7dc81601c@linaro.org>
Date: Tue, 10 Nov 2026 15:30:34 +0000
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
Subject: Re: [PATCH v2 08/23] coresight: trbe: Clear stale external abort
 status
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> clr_trbe_status() clears the buffer status and syndrome fields, but
> leaves TRBSR_EL1.EA unchanged. After an external abort, this indication
> can survive into a later perf session on the same CPU.
> 
> Clear EA along with the other status fields while TRBE is disabled.
> The status captured for the current fault remains available for
> classification, so external aborts are still handled as fatal.
> 
> Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c..26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -608,6 +608,7 @@ static void clr_trbe_status(void)
>   	trbsr &= ~TRBSR_EL1_IRQ;
>   	trbsr &= ~TRBSR_EL1_TRG;
>   	trbsr &= ~TRBSR_EL1_WRAP;
> +	trbsr &= ~TRBSR_EL1_EA;
>   	trbsr &= ~TRBSR_EL1_EC_MASK;
>   	trbsr &= ~TRBSR_EL1_BSC_MASK;
>   	trbsr &= ~TRBSR_EL1_S;
> 

Reviewed-by: James Clark <james.clark@linaro.org>
