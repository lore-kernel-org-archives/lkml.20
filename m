Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4724A43A7E3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452495; cv=none; b=SsSRBjiDEAXfzoNsmUEeynhkmsoOosNsUuy5IojZLeuwM6zeZ5Smrz/l1otrJ9wg6rXaRTxx6IXJ25sIJ+jP7Xk+qr7IdhevrXVX0DAa00r1IhUfvlQEFL5MNH7ljerFCKuRcxOyyiEy7a7t0CBzC4tadrISIeqLlGmF1IZUuds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452495; c=relaxed/simple;
	bh=PAuNvntAEAuzj4Nz9wV7sdS6zNhgaj7KUz8bvciwMOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jda2yo/Gx+EvyhOk1j7CxXnnja8tWXcPhox8aV5PC7A02FR6JEaRZ7b3akJ8TadkIIXmXfwqXvSmjUeYbC1L3eP/9leYNBMIopI/L7Xb4JF6Hvl16tI9X4FFnV88M3AhIQTVrxIQZjEpAtkLqu3dLBM2VkYgrrSg3JAYWZwEkGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swpShztk; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swpShztk"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398e9698a70so4308815a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789452493; x=1790057293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ/ZVEdkNsjrbjg2YrtoA+pGCWrHgTsXZF53fBuFvuY=;
        b=swpShztkdatBxzX+vvvuFwczoHYuYNBwAAjTIkjGLrG+cXahftXDvVAt00q+kwiicW
         AgokXZ4LVdqJ1TxtkBzCCQFi9511SFdWdX7iTMErNl8t0kbhkdGd3q6SBJnjJHwbWmSP
         tQoMISBy5MOSvgRLj086k2ut2V3F4uN+KUyQ4jigoU754qHrSZPrvk0CHoUrdhaHHJQO
         qRKyIZ63JDWxrlUUg1lL8/pxROVw1Wuqv7PlJDu9BjivbHJOao12GSBOUQ1JvukM/SoM
         MsNSOX9Bp/RwCZfPZCfQvvEcXWKp4b9q0reQuqIQPUBs0xHTSFe6lL/qIaavcQvqy6+u
         DuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452493; x=1790057293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJ/ZVEdkNsjrbjg2YrtoA+pGCWrHgTsXZF53fBuFvuY=;
        b=srMZtXSiB5Pqc6X4WPY/xNrKIQqCwtr1uXFjON819lYlmwjB2O4SWZbFB9oIJJTGYk
         smjRnW/3Anu9cHl9ths8V6V7KD0iOD70udc04oCy9PRaIm2vBqzLXthTvMjhPaBpDRKV
         2U5hKlpz5Qb+Rz3DQG1LWAPbFaBxCGhaU+uFUD66Jl3Sc10sRUPBa9MRd9rAtS/sk87z
         tNohf2rWFhJ5HN1G+UXf/8aWZhjAtAjwGFP3dxeetuAvFI2kaPvd6s2c+PzCp3MoE5ct
         bCihc2VdPyRaZl3ReFHkOdInrx96IwQoRaZ9Qe/HSWbFXltkxeEpjPpKpRCXrofCg614
         q8TA==
X-Forwarded-Encrypted: i=1; AKwUvBx5MDAb8C3a1Aq5K3umx3ue1RQIwU3fVKHF/2wSZPMqtSAEzzdv2AXL3jSu0J0J882JBKOyRl2DYWRXvC4=@vger.kernel.org
X-Gm-Message-State: AFuF++ns0iFsNfQ1g+ecK1ay0cMzP1diaBBnIbZB58ECMj8v179txJAH
	I7MjGtNDhYRC0viUdQOkuIGHiXm1vPvg5wuwnsFyE7IJ/RlU50gl1+Ay
X-Gm-Gg: AYBFou34u7Ax8xK7LUOGH/mYkHBGhRUCgx9ylyrRRBFqI8ISsKsbP+4f16O0SRsGibU
	0QnVOLjn08GgwY0QqYL1poLTgv35SC5UNIGJyLCuNhRg2NuGslvmImpJoT3jwsn6mMG5jvIOu+q
	dMWwDWh0d//CJKb5EwqN8nn49gspzkPENx+y2afnCDlEmKYed+YgRk622Puvon81s4d18d8EXuI
	O4Ki5ChFHYSC4+GpyQnvgZMj9KvRV+XwKHIOIwF9DThcDZ7bYTXm/VgHMT1BZXzV90gTRUl2GoC
	AoSA/6sKAIeyOZ1BN8FcUFfQ7mXG1uU2wQL1/oLhxTS0WfJVSBi/nCs1XNolELug8M1uxhxRiIo
	KAor/KdHCIoWKGBAZ/8JxTnsYpV6r6lu8kX1Vez2ogH1+vFUw1XnxworBDyWyu0F2oDDGKrWoit
	9IZ6+SLgr6KXp8s75XCzdIhmR2+j8YMLtv/WfyW3W0taqdrzeI7P4lTi7nLSBmjgy1gFmIQO4yi
	HVvLkN9R1oWR3K0gRixVpHb+/SOavjOOTRKXgnSJYsC5I5AqAX47aM=
X-Received: by 2002:a17:90b:4a8c:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e02615623mr3589464a91.23.1789452493406;
        Mon, 14 Sep 2026 23:08:13 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7d765sm3146170a91.10.2026.09.14.23.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:08:12 -0700 (PDT)
Message-ID: <4997b79c-fb9d-44be-a9ee-1af2d6e5d0f9@gmail.com>
Date: Tue, 15 Sep 2026 14:08:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: ma35d1: fix permanent clock reference/enable-count
 leak in probe
To: Cong Nguyen <congnt264@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914131850.2331670-1-congnt264@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260914131850.2331670-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
> index cfcfc28060f6..43358d68565a 100644
> --- a/drivers/rtc/rtc-ma35d1.c
> +++ b/drivers/rtc/rtc-ma35d1.c
> @@ -221,14 +221,10 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
>          if (IS_ERR(rtc->rtc_reg))
>                  return PTR_ERR(rtc->rtc_reg);
>
> -       clk = of_clk_get(pdev->dev.of_node, 0);
> +       clk = devm_clk_get_enabled(&pdev->dev, NULL);
>          if (IS_ERR(clk))
>                  return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to find rtc clock\n");
>
> -       ret = clk_prepare_enable(clk);
> -       if (ret)
> -               return ret;
> -
>          if (!(rtc_reg_read(rtc, MA35_REG_RTC_INIT) & RTC_INIT_ACTIVE)) {
>                  ret = ma35d1_rtc_init(rtc, RTC_INIT_TIMEOUT);
>                  if (ret)
> --
> 2.25.1
>

Hi Cong,

Thanks for fixing this.

The conversion to devm_clk_get_enabled() correctly fixes the
clock reference and enable-count leak while preserving the RTC
clock behavior during the device lifetime.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang
