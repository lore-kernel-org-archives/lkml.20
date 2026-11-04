Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799165;
	b=PTngd+aZRllMqSdwYNm5GaimIn40ZidCIdetbXqAWaMIvQJEqlvE240r0xmIOKnzBk75
	 gylkkAMqXlKefxS4l2bpuseJoOHijrg8TyZlDslPA9/16wJdEyqkF6z6WDOiYUzGlPFI0
	 fUWU+ejTr8NTSYFHOGrSewn5wOZSeTo2DpB7G/L9vHLAcVasp1rs8jpHfzNOv+OBSIJtw
	 ga5hGori+emRi89t/Vf8eaMsOtyWrymjIrfblHRoxGhZ+h4p1HSW5ctnsGqVnkOO1/K4Q
	 GoZPbmrthvraOLRcVt9lrOFuMfuDvJLsXlQBHRFMoVqx0CQhQPOWQNRFggCfKuwIJag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
	b=x6BJ5KSeKuXvKu4LpyrcpZeV7qpYbzb8Y8uQxIXe8o37B6qhJIrUJ9al6i0t4jIdumno
	 Zq8ac5H+rin6BZ27uGESnDigVEdim3WawOF+9GUYZHImXJFF2kGYixiahOa4bgTI92S2C
	 26RMv0xFsPru8zaLXYJ6vGSLeN4zPR20bYV4BRoupnpIOe0k5jMum25Qrw8XnpyyrycBp
	 JOC7qaoTEAjEZgqKLFWYPHJ+WD/EDPSkT7fj+B1uhFQnzM2hkL1bv9LSM52mkV3V6lAFU
	 XfJwQfOIo5xTnBVfeW5iW+Bmgw/bcG+xjmZdLMcZo4Ez9jwGCFHu6R2RWh9MLjpAX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="A5Hr/Grc";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346FD606D808
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346FD606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A5Hr/Grc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so7453395e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793799158; x=1794403958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
        b=A5Hr/Grca4g1tu2xiDFXWfMDdZQA55aeOJgwSaJ6U5ZxxQ5n9iJlSwGAZv7GOgnnwu
         6CaKYBsHH2aGLoT9Hz2eKilnRw1+Jps+DZQu0aqUKgr89Yxs4MviaH1ZyBd77Cr97Ygq
         JpGOeHwgNEZHdRo+fB+UTQpUeGl78R5somkITXNM+lHduml1m66zB+84vqPHSVEdNWaw
         RfzPO5RUiOwUckkH6oB6oxXSX+g/6cnkPjUHUb9mmO8lAByOUXv8XsRdgC7KZneB4Hez
         kUfQipZwPz5JrwtXR3A3iHvGRT+lm9E7LZKVxf4/Fyr1SbfdTgmEZoz7k3HlkVrXMK9g
         BjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799158; x=1794403958;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
        b=KhxPQXUIhpowwf9y/A4RrRzbho/WnI5gr7ySdzlML0zyuXcDY+TAIGc+EOi6oO2CtA
         iSvSRL+64erTHYu10+Wd0TnCQ7bu2hxIOYCtx2aJHse5QG86wyl7tDaTcFcwl3UordYK
         tHDc+HgHaijdXuCC7UubPHvjrBhbTLpmjWX4raUOAhmKAOS0HdkWCN0LdYntxeCmf7MA
         kRd7FF5e5UFZQZ7IVcNBvx5J/dwCC0mMSqoqqAR08e7cSbDCvK9lZ05ZxkbwRD17Pf8q
         q9a6XUq+RmUiveOJFik8KcE+nmyP4wERACL8CKv9SRq97Ba33qHGHQqBqtxa/7Q9N8UH
         BflA==
X-Forwarded-Encrypted: i=1; AKwUvByHvxjMTjW6UtyeSiRFcz/Gdb+haBAL0lLLzOk1YEfcqIqr9fiKQ2g4cj7GNLfwI+/aNbn+w2QiDAcZi+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sSNyYgs7nWGfU6GmhmmDVghu9mzESjWy9z+aZB8aCogFiYak6
	H2o9STmpj/6pFyPB5XkidN8CCVYVUD+x4PKQKxlCM/2aJFyoODj+bjWK4sDOOhcw11o=
X-Gm-Gg: AYBFou11lTMTy/GfbK8LGF3zBB5Y778WgUQQo3gkaaObbYHl6V/XFHPguLJieBydrrQ
	TfLTJid/0lUPaZFWJzInLWJj+T8cIhTIFBhEYo3B/zWGPiFK/oxWbhH/VxRZgIuUuABaj3pN44f
	uMOS7D/LFsbJ2VUqoKODouxhVHJk+j+bTIfP7q4vm34ccT4fScPy1wl7AB4dxCUi6NoALw8IfLV
	lXLBQ698o4TBlsXF+i2sriAJSobSHRCh0M/1mU+oq6H60+5HiBgAJL+6Z0785FkF0mCu8W/ElKz
	028igIzEH3HLcSBdohsPhwsqmpcvtu7/6FkhTrJhc3VzUdfNSOog4eF7bXpGZJtP22N+UfVzcz0
	n05qoajKgWjwV6FwNIL0DwE4qfE0RVNbf/mrMc7c52wdeUHMZEOVRbyBrP3GwmhOFrVJVzmKWYb
	UNLVtlty1C4DjUU1zFOzSvRdI5YuFfqisx3k0awk/gyVAAn4Y9lkuIrbTgNH+pzy/xnNPgvDI4n
	/kO5LhdrccVsxtFTxJ52KaNHK7YRdkb2wmLRz+KGtooRsqaWtkAENvS1/Sv4yqKF3xt97Lkti3e
	YpFyr+xFeNIzFWLQ1w75ftjvm95/f0/u0miHQe3kVQ==
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr422203535e9.7.1793799158430;
        Wed, 04 Nov 2026 05:32:38 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm3825694f8f.48.2026.11.04.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:32:37 -0800 (PST)
Message-ID: <4ebc023d-38fa-42e8-b89c-8febbcb0d7f8@linaro.org>
Date: Wed, 4 Nov 2026 13:32:36 +0000
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
Subject: Re: [PATCH v3] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
 manivannan.sadhasivam@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
 <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 01:11, Shuai Liu wrote:
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
> 
> With CONFIG_VIDEO_QCOM_CAMSS=y and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
> 
>    camss-csiphy.c:(.text+0x51d): undefined reference to
>    `phy_mipi_dphy_get_default_config_for_hsclk'
> 
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
> 
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes in v3:
>   - collect Reviewed-by tag
> 
> Changes in v2:
>   - drop the redundant "select GENERIC_PHY", as suggested by Loic
>     Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively
> ---
>   drivers/media/platform/qcom/camss/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index b51745c942c9..e0cef2cdd0a1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,5 +7,5 @@ config VIDEO_QCOM_CAMSS
>   	select VIDEO_V4L2_SUBDEV_API
>   	select VIDEOBUF2_DMA_SG
>   	select V4L2_FWNODE
> -	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY
>   	imply PHY_QCOM_MIPI_CSI2
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
