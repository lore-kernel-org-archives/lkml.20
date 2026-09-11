Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0061248641D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164572; cv=none; b=scR9vFeCRQBb3zhj9cJKf+N6HZk/y/SIM2Czfpyl8cVfnR3MGxxN0sSRKMPEYEimO6EDSMaggYLp0nKmwRCCu47iP7BQEWAkAbHo8gwkhAnCRTmA4/IS7b108bEzbAXZTgll7+M3ZUCsJBSb373Fvh5yxPFu1x/LebuceAH2Yfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164572; c=relaxed/simple;
	bh=/R8G2rUpeGdvgZtyaJUbEvh1Zo+WC84WR+inH5thUNk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=jsZP6ww6HyfnMuuuKO/rD4vbgAeYdccMTNdu5AG22+JYH/gbxZCj3lUsQF7oatsFtIEvBuGYNbC+KN6R17Tz0T9HoE/dBYNflR4AaAQjgvhev1fVlvLjHdUAmoJ5gmEi57hL8NwIls7tFlzB0QxUsx549WB7qMCYuMAqP4+N+lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=U9n2bPzD; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="U9n2bPzD"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5306d609317so13998331cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789164569; x=1789769369; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REcGNRrG3IgyeW+W01iwNpi3SPP7pS0X2/2+s4p9Ep8=;
        b=U9n2bPzDNh3hi3J9W0QQ2UNGVEKLaQ/ZwtFwa55+fQNvrZB85ePcVdljoFKIJD5HiG
         XqSjDGbbbQpWzyNtG+BfW/6ChTV64Gg6+M+aovfGzCHDzSa9Ts7WhnSkMY47ChKaX690
         9XHhmKXw+xGf9wZK+vMlmbOkpBWcCVJBjLidyM36XBVySGz49RHGzjZP+7MKF4mjDlb9
         j2fx8w0oVdojWBYygC7GnGpJ89Kmj1HJyKzahe2QtH5KDaMc6hEr1t0h8EJ2tjKtXgNz
         lP/ZP8jkS1Mw1wVadm1lCe0Nu3bxRrtJGJ6Uwm04S/0lXj52vgmByya1AzxeF0GkMh1S
         uegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164569; x=1789769369;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REcGNRrG3IgyeW+W01iwNpi3SPP7pS0X2/2+s4p9Ep8=;
        b=XJl9ALl4OGRgmnszXsaE5UqtjVGrgcnxK2DTzQaqVkRsFSQl4L7uDrfN307Eg7QnVk
         m/LmUCfN4HeUXO8NWYSYK099ZtcEf5dAOGTzKIA0PZH/aHBT7m/NzCSZRhXBmMr4nS93
         sL9S+RkHhDK6COqBDwby22iqH6wu1XMpXBHLlNj3JlkDOszlhnTG9KTJ+3aojvFtzXHb
         eWAuG4wLCYDmZd2L5rX48d8699H43GQr6QslG8cRR6JPaQuijkg1LZ2ajg6ZzKVLOKG7
         ORR4oRhpImzl/q9KM4hDukgBmu9E9KbfcXygL6jQcuyGBB2lzjxszIUIRCGSqzQNc1T7
         PmcA==
X-Forwarded-Encrypted: i=1; AKwUvBxyagb5gFlsgtacQcFASBPRBN26MIr4SFZaNb7lVmzuMwZz6bX0foC6e3MHJm9LoKKj5JWcgf/6xMTOYno=@vger.kernel.org
X-Gm-Message-State: AFuF++m/VAEBRVpgiGyf8xM9XR7E6rf/gwmmQTWqRFgGd/NpGobsHhdG
	mZmLdovd8LSV2zKJO4S66cY+hHr7nmyIOgYTZho+RNNrUVNkz3jNuyAPTax7TEZYoUENWZUh8o7
	LNzMbJA==
X-Gm-Gg: AYBFou30AMKuWsZWdT0ZTlgGxEzFa6mzzCyZnCpsfgX9pAWEm2jTXxgA+clgiNaLwab
	bKmCwfOD9oJX5RD7rhkieLBm0/R3OOrjC3uG2Lo3iL5gkRindpDzDUIVM/llgEAY0rqPm1uNBqg
	HvpTNbODmiuMuYP9T7Qfug6CJg38Q8oofRoecyzMzs2Tfgvk/MRngFZy0PKmyGQ50mZogEgh78B
	nHladg7jyQXgCCF9ZmClchNToQdN8IhxS04n0TScvA7zcMRY3TsNWEp+OQfb+kdsZsvpipexdCw
	6AX8GxVY02MjI9AQXmpTOnXQlv1SRtXaepiDS5cOaLIhd1KFVBwRmRxdL2GoAYalVV5HwoEul3S
	rjhRaasXhttDB/rBhx632/n7q98MJxXa5nbDTqC8u9mgqsoOw96e3jWhrtx1bQpy1bM1ldyQhnT
	hOHZzKMbCJ+DzdhRWSAfmDKj+J7KpmtyVYry7JZA72XYCXH6OhCHIgfZdJdOCP56JGXAkavk6IG
	S6ojGjI0mh7Bxjk9/a0O577he4dPrK6v19aC8+NqXgF4jagjHJpFw816vITaK/jW0dbRn5yiIXL
X-Received: by 2002:a05:622a:588a:b0:516:dda7:51e0 with SMTP id d75a77b69052e-530c854284emr105918091cf.17.1789164568783;
        Fri, 11 Sep 2026 15:09:28 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4b9c54sm29928441cf.20.2026.09.11.15.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:09:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:09:26 -0400
Message-ID: <7af3da1c32e9b388771aa7406dd42098@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260911_1254/pstg-lib:20260910_1848/pstg-pwork:20260911_1254
From: Paul Moore <paul@paul-moore.com>
To: Lincoln Wallace <locnnil0@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp, rdunlap@infradead.org, Lincoln Wallace <locnnil0@gmail.com>
Subject: Re: [PATCH 2/2] doc: LSM: fix module ordering description for  /sys/kernel/security/lsm
References: <20260714013832.977443-3-locnnil0@gmail.com>
In-Reply-To: <20260714013832.977443-3-locnnil0@gmail.com>

On Jul 13, 2026 Lincoln Wallace <locnnil0@gmail.com> wrote:
> 
> The LSM usage document states that the capability module will always
> be first in /sys/kernel/security/lsm, followed by any "minor" modules
> and then the one "major" module.
> 
> This does not match the current LSM infrastructure:
> 
>  - When CONFIG_SECURITY_LOCKDOWN_LSM_EARLY is enabled, lockdown is
>    initialized as an early LSM, before all other modules including
>    capability, and appears first in the list.
> 
>  - The integrity modules (e.g. IMA and EVM) register with
>    LSM_ORDER_LAST and are always placed at the end of the list,
>    regardless of the position of the major module.
> 
>  - The relative order of the remaining modules is not fixed by the
>    framework; it follows CONFIG_LSM or the "lsm=" kernel command
>    line parameter.
> 
> Rewrite the paragraph to describe the actual ordering: lockdown
> first when early lockdown is enabled, capability otherwise,
> integrity modules at the end, and the remaining modules in the
> configured order.
> 
> Signed-off-by: Lincoln Wallace <locnnil0@gmail.com>
> ---
>  Documentation/admin-guide/LSM/index.rst | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Merged into lsm/dev, thanks!

--
paul-moore.com
