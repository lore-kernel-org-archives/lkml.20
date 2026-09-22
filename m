Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F32E49E15D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056955; cv=none; b=FtVrxPJkuDRHFCtHD3Hm7QAu3Z0gFTXUgO+ZbKYYJwHLax/dyPfg87nf9tbsRI50AHbVmJQQBwBAFo7ubQz5PBYbxyh0JBl6IhQm1ToT2wPKgl21RW7WH69RDe/t3x8Of8PiEdGjzD6Uofv9FNrhioOAIEAeWAiSlvdT8j/nsOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056955; c=relaxed/simple;
	bh=UTGrp+lZOAxLFmkLKsLGysXMTNUwZ9BjO56kp90DTuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVEhknAiBH5VZq0VRnG1EqHWYehziSAKyDZ6JrRF9aOfJikPBxe5krDdRqXznhIO4H5uVr8uot1cxcmrKeIFhH3hydetBejSboljVvAxU656jXOSJzBqXsqqm3QWAmzFY8OKaYzq6HmSNSq4QyhjVRAwJRU0Mqwn31sjKNYc85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHJqr6rJ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHJqr6rJ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so455559a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056953; x=1790661753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=RHJqr6rJLj0ADth1Gzp5fs7TVlYaC7iSRvFWsxRrSNeRF6snO6Up+q95yCrg867gd9
         tQ4uKmHVb6DER5yYJ5H4pIBlmQ7nN2T2nY+y+1k3rJI7rj1O/LPvgk0Kr3W0gzv31vdD
         shVbdE/5qVAHh2Fvojwki2cvkqBVWU42VSP0Dh+ESW7hTCdZDGkoJXPrlUnU9VYC7OBx
         w7XXdC60ihivG1UepRyAtbd9Z7dr0JY4TLT0Ncp7TzXDeeQNCoj4nafLsoYPwoW6Un/l
         RaJF+obAZuhob7uMBCXhII99hMXCrrh05xN6bEHkwkPOxenCCv3unmuuPkoJ3kfoTbrQ
         AYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056953; x=1790661753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=QlL0K5H4mOA3X1gpicd9Qlffot2PITDgp8tjka0n+esxvI+jhJjKGCaru2g2t4Hi4r
         6c7E5Ln0+6TKS6PmlIUMRU3CiHEsuFe70AQtwMPtGgQZqGWZ5UlJUb1p48s0WNtGhAqp
         avj+2cmfxqTVBOYLBUsfreJc77CfsX04MioJJrhSyuH5o8dGm4b3y53Vqb49OYhS5NuV
         jh9EdGLz7vkJMv56tXpZQ8Fw1T7gSGWiVlmB0K2V99XkxIvC1+JVFoWsfTM/sfheA2cC
         Fy/4RC1XK++BruasZynsCywR+/H7tyLn0tV5hw8eOn+WS2PF7jRwo0Wxihy56nQiJFe0
         RSAw==
X-Forwarded-Encrypted: i=1; AKwUvBw7fF+5z9jJc5AADhekWRX31kUBQxSa2CN1o1nJcIrRJ5zuy6nvxLLw+oOr4sQUj1V30Ja5oNosHTzqbL0=@vger.kernel.org
X-Gm-Message-State: AFuF++kdQdlISyOaubXUGHMMCh8Fi3edl0F6tfj7P2p56Q9APRcceACy
	c3VmqAKiKsM6YyIHReITyviUeTWQrZdZTGo84qYdmK5pnv1eiUrQ94dw
X-Gm-Gg: AYBFou36pECCcv+Jq9tjakjDHANrtJqB5vVsWf51sBKaKxHhCSa1+EK5XWO64Ps4xE4
	BBhwjwRTAEuCJAZ4vj3eGkFm2tnsBF4v/cwY4OwI4HayZc8D1QlLDo01ZINrOpjNf/GgJOIxx0V
	5x1sQshuQxqQkmzPOzomTAkPiMlR6Hlcs7HBC/ZguKMUo/jWvkiBwCQHFfy8gcwy/H8aN3Z836O
	zVpOp5C3Z1BJck6KPnfsZ+UD72TJ+vPixc4AKZK8bi6j5+1/3T/Esr3geCmeKR1yTkq3n+lC593
	1zq7xEiqwo2sGBfkQ3azyO0NJdrN8DGJaf40ii+DArabUxrxY3EVpgMR5/74S42e/G0Ng5zZ03e
	XSyWZY6k0gX5XvJdpe2WA6yeugQ8ye9BqIivebppzQgp3+o+KaQqpdg7bwTmidp9SLHKBG7omg9
	6sECkHVr2uP4Y3MBqDut1/hkBsIJkLH+qWYYRSe3d7mM/yxz6HtJjpew8QFFAayKt6gLUUdK+lJ
	+zDAgV7PZ/GZBOn+2E=
X-Received: by 2002:a17:90b:3fcc:b0:39d:e78d:32d2 with SMTP id 98e67ed59e1d1-3a0730cbed4mr111836a91.13.1790056953102;
        Mon, 21 Sep 2026 23:02:33 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61340e56sm3366245eec.30.2026.09.21.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:02:32 -0700 (PDT)
Message-ID: <976f828a-bf48-4788-adb1-7204c27dda60@gmail.com>
Date: Tue, 22 Sep 2026 14:02:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX EASRC hardware supports four independent conversion contexts
> (A, B, C, D). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_easrc_dai instance with an array of four DAI
> drivers to allow up to four independent conversion paths to be active
> at the same time:
> 
>   easrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   easrc-1 -- ASRC1-Playback / ASRC1-Capture
>   easrc-2 -- ASRC2-Playback / ASRC2-Capture
>   easrc-3 -- ASRC3-Playback / ASRC3-Capture
> 
> easrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original, including IEC958 subframe support on the capture side. Update
> the devm_snd_soc_register_component() call to register all four DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

