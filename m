Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662684BEE43
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601956; cv=none; b=EmV2t6onJYYGoK6C4qeYOodNlxhYiUVcXY0wYylMsJ8hm4wl9kQxgO7ypy90ylMTHYH9yTcocypcZEOF+ZOZ2N8qwfM7T4wryTaR758DaRCiT9Tc/RMdkAF2ndWry8Ayogc7u+dm7TmbED2Gfi0AP8V9KxDn+W8UiGxNim/6XF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601956; c=relaxed/simple;
	bh=XeTqlOGO5UJpA5Y/ixti2g+j5EuJrE8Ky8E8O1CBHsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/CcI4QLXwQy2+vgonFRJrd3EZH2PnkZiwo+yRoYlKUJiaX6XRSi6TytahoLEmdP4/hYIN84jrIVdJEmEgESUEZJv8j9yojiCgmv0XqJBSSag2KBuCWCuCUceGjNFKcs1+pLHFT4jKUcw2garTouB4jEerN4FC0JHE5C3cqqmfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNzDdE8A; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNzDdE8A"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c169ae1cb26so5293366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790601953; x=1791206753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zVAGtWsSkfmenTzIW3+TUh6amDiHnEAZ63ReFuJwGY=;
        b=uNzDdE8AmNvXPq6K8MMxhHXPNO5wOXOwyRh8BxcUPCQANOOFQrOnm69tdjjAuQJXix
         LjNyztpTUGBq76ro/IgRvMeH8YHSqGz9/V0cZO5zmXa0iPg8QwkXQw8nnEMNT1ZDjl5r
         qeMZcsRDyDQowl+ETuu1zOUjz1FNeacEG+vlqxg7zbmSDDD6NCCul6fjaVf31vHji2gV
         enFXYFavNJnu3sKpiUWBnfC793cLmdkb6F6eVtP5VCUVSlQJ6eyDobwEoOJRcgCxMDZq
         Lhn7D4CePvyOWHInZ9ViGvnag90GXr+gyV0iGAEtt8FpFDwZMVKbcyHqhGxpUYsAYqIP
         nE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601953; x=1791206753;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zVAGtWsSkfmenTzIW3+TUh6amDiHnEAZ63ReFuJwGY=;
        b=Id8sGqBFaRLaJWY4e2uO3X8jRyRoJp+pkCtldcZAAWRMmX7BJH8u8/QzpJ1JF0tpuA
         YkMfXS4WLPkflQktxd5bWRGaLZylq6OZvEMd5tOwRPe2gNG53jHlbzEiPMyE3AP5mlG9
         nqk8/N7tMp1UqTepZYlxNz1sqXE23cs33IMQ5vo5bMaSw+lXspCOJJ/vh1uKeJ3Ty7Ig
         G/URkVSuS+0No0+ffNcKDz+rGAdIsBDTg9qaABvxyxhss7P3TjEtMmijn6JjkLySAW/K
         xwZKeMnFr+CDYmXrxF0inyJ9epX8UcQvsyQZCH+TgByc/5wA+MN89OKva8HtjqaeZjFq
         BMuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9OubskdHRCwETlFjKXxl/nPDhcfbEqUZe62DA+E70bUJVd6WukzX4QYiaQwtsp0s2Y+I04nIFzrk/DZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lyy9HzpUhOJWfZIB/0AUdoYTq/rtN/FjqU5fThxwPq7nJtpTSe
	6FfAZ90B8Tmkpg4WmOz7JmgONXLHllT69+s6wBx1iz3pUm0D8OEEA2t/sOFHP8kquxA=
X-Gm-Gg: AYBFou1k1Zd975GQXcekahQC0q6caOjQkQSJqvf+xUhEeIg6d2n+jtbFBx5R7P+gS9R
	e/ZjQN9EXf3jQUqPSvHOAy2MFoxd5oFj6v22x8WNnAvm1TXiNWUzY/Pn2uu7bdXCQYeq79c1nQ3
	kH7wcQozzRiYGkT/8ERTaUXrIRBXTZnwSqjWTDMG9LPL4mMWJ7/DWSQ/l8BmJwdrg7GEzCZ5BZr
	Q5a+XAwletej3iMid2k5Dtpmznh12a+2rrMHtljkTRkrRCSR8EqvpuVA2cWE+gQ2aoLsg8jhXG2
	+OZN/iwpmDn4rpcFFP/ZUtvz//WnRpjl+ra7nbT2Z81fYpxTGVO2KLT+1O6YyEwz8GU/Dph77+p
	prgjwupv5R728ByJpR0ehYUg+4T1Ff3am2KtT7DZDgeySj10sTLY2V7E6cedPi6KAShYzC+T9on
	rbm1T2O7pH3a19CJvw1EQgN9Wdv3iwlWg1MaiqA34gmq2dLEhERc6nDZxuDGeFz4pDifHYAUeAp
	brs9hMg4TkB
X-Received: by 2002:a17:907:db18:b0:c2a:880d:777c with SMTP id a640c23a62f3a-c2ac2245724mr1069641566b.10.1790601953464;
        Mon, 28 Sep 2026 06:25:53 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357cf3sm475547466b.17.2026.09.28.06.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:25:52 -0700 (PDT)
Message-ID: <15ab286e-23d5-46c2-a952-0be1d93409ad@linaro.org>
Date: Mon, 28 Sep 2026 14:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] media: qcom: camss: vfe: Fix VFE reset while
 another line is streaming
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ravi@ebytelogic.com
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
 <0udzjudr45cAD9iLLoskmn10mElRgfZYq9Ir2wzfaY_qUhAb9W4CfL3Gr7_j95UJI4vC_CMphfJmwiFoYiwmNQ==@protonmail.internalid>
 <20260928121508.1404808-4-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260928121508.1404808-4-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 13:15, Hitesh Patel wrote:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index c14d97a131..d20cd4dfb9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -821,7 +821,7 @@ static int vfe_disable_output(struct vfe_line *line)
>   	output->gen2.active_num = 0;
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 
> -	return vfe_reset(vfe);
> +	return 0;
>   }

This method should be void now, I'll fix it when applying.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
