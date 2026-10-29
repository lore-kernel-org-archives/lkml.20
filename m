Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257555;
	b=m768DebyijclXo1DtBRGBRz2suzqjy8Go/XTdqhPCW99M3IEteUQ0EUJZ7ci8tcDpZYY
	 tiwFbkARVgK4CmsRHE1mlnGF0rElfhYbRIAClsq/KkexZJViZlfJcOxfT64Pqn3+hi72U
	 GC+6xhRyzAovL4tugtoMtzs8cEsmUC6ds8UywJVOm96xb9/03a3fFGbQf0SDYO8w/FePV
	 VndREZZsIGdR/NJ5h05209tgE0X4mWkxuUJsHDsuOMue/EcK1msaC8hgsKeoiqxKnXdHA
	 S3mF0EyGxRheKQFqEPvVVpIoR5QOse48QJmT+rX8tYAr7mAeMNgfxk+J3m1r2DuvGbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=3KB0SiqPdJ76y6D/S6GzPlg+aJIPUV7CyfK0IWMQX4s=;
	b=ZVTSLh9AKQjhmXsDYvbfsUeGTjCR4//kSAd3cmgqJP2lb7zIJWYIB8g25tFnjtJ/ZxzP
	 H0mvTS7rz4MQVxSlxIOZNlK1uuwoAAAND+4HInIRfEv3DzPxI81MqEnXT0Q1jTfQX2l+4
	 x9gkxLI7Sv3Qq4TIvSpgyvWpBL+LMNM+gnj2rlOlcRqfM7wrr+Y9SOiWf6GqkamY85ONG
	 MZRPjcIVVSI4FkfJEGzJ2ROPx/5xWjASaemHWN2hdnkAEQcV7/vMbvxeehQNSmF/QX8tY
	 CWyOPhSmEKy/vxeT9/6o0gw805kMYEU80OVOoqteGi//cbQqcKMh3nf/jn3X7DoW7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FphqOMc4;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3E7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3E7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FphqOMc4
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so1305766a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793257555; x=1793862355; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3KB0SiqPdJ76y6D/S6GzPlg+aJIPUV7CyfK0IWMQX4s=;
        b=FphqOMc45SbcUWjud1RHc219clolXR9qAzBWra8p6B4xCG1KlJ4Go3K3xPCJiV/9XE
         ZujnhxHulC5jUi64ToqvvBICk6rz+xns1DYUYX9iX/jd9zOsnTq3pl4ABOVmYKn84McI
         38mFH9uXJ27YAsuv1iTDVD+7GgMH1zUTbbYy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257555; x=1793862355;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KB0SiqPdJ76y6D/S6GzPlg+aJIPUV7CyfK0IWMQX4s=;
        b=0Xd7NsKFYMdW/60T/CLKLyHv7jjxkSPtJQTcBKuZMLZJ8JeqVLpj0S6d/VVuGkFN2X
         +UHG6rYn+vuXYEVHL00koacofMxyAWSgKMB0jmtGBivkWwz6JzvDZwkYyOg+hzinC1q5
         ZjI+NErzGtIstE7CplqxDN+fqqRquo9n9XD58Vp7mbRm6iO6HLEiszSoYet1XWjbwWtG
         As0A4NYLuldwUXKNY0XLMZKLquM2N8xy/fok53e8n+qx8k7FfoZgb1vkNiH3bxqznnAI
         WJypPs4M13I951XyCgy8isIwzVCUv+g6tTpml+m/pdCDfgWWI/ra+1mkDrpn1Sto0AxQ
         kSYA==
X-Forwarded-Encrypted: i=1; AKwUvByaNAkzkNZgRKJR5p0STGBX3wlqdFPKF0ueRCivHESQfnOB/OgU8ZDYG6ft4bmZogqZeuN2bjFHhhz8vik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzMO2ED7a9XjSsS3yHotgoaH12nXvvAg/Ftpt75tBkekgTr3+M
	NzhPWa6Bhkn+8mVdjRJ31oBBqUGvqjavHWhZUUMv0wOanAN+KyCHDfdPdxV/WqWsX90=
X-Gm-Gg: AYBFou064fcnUNCdIVvDBXJSMSDYrSBWNGwfRivK/Qu+aQgUk4ZbZBg1de1bsDWP6QW
	isDGXaL9AATcBGjyXwIDCpYYiwu1opcBzVntKOSPbCdlxr9aY4ZGLdELuUlW93YcGvtkq0mIyq4
	MeLSE+W7ZdqXEijX9AnlBrWnN0OsjfTk22g1YVl3FBveTRiPyd0/teT+IjTLL6njJ9c+YM0xa7X
	4lZFDXtbQG+GYRWIw71YbDqdAEFILMx37ofk34NRo5ONCeqztpwPjSKDTSoLYAo5s7j5sPH3uR7
	OtcUCEVnFoVVetKFqbhd9I0dS7bsOSLCPTG4INqlcql9pWnfhMjcrdHaBCPz7GMdZ0Hut/RX4O8
	xrRIGldKf1ie6Kh1T3sygqeeCCpcETrdj41ZTb09uxvYwaZR9wJBJmUyC6EhbtbJDK9gI0X4Y0D
	JACIC8bUX/a+ccQML6wkv05er6KuQL/K6PqdLbWmFUkXCqRXDnm7Q3s7G6kX5egqNRmm5wIQkAU
	Esas4/ofMThHer2+PeBiH/FMxG7wMdyZqkE1qPY4CHkPHmudvXTva5NhQDnvr9d/3mMuQwhtcoI
	bH3JnH8A/if4VgWnBMTx0WbHccdgjmoBT5obJm101BdHhPAc1pCxe8gAehrcW9mSunIGXl76j7d
	yuR+A3anDlmzS1z3loIvEW896TI681DuFzmOK4hywgG/nc9cb73t+FR+U0sADNQ8NEQTPdydQ
X-Received: by 2002:a17:90a:ec84:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ae5829a339mr3971168a91.41.1793257554831;
        Thu, 29 Oct 2026 00:05:54 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm2971762a91.11.2026.10.29.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:05:54 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:05:49 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/16] printk: Separate code for adding/updating
 preferred console metadata
Message-ID: <auLwTYSza9exX3ba@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-5-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929120546.328616-5-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>The logic for adding or updating a preferred console is currently
>duplicated within __add_preferred_console(), making the code difficult
>to follow and prone to consistency issues.

I checked that the split itself has no functional change. Thanks!

>-}
>-
>-static int __add_preferred_console(const char *name, const short idx,
>-				   const char *devname, char *options,
>-				   char *brl_options, bool user_specified)
>+/** add_or_update_preferred_console - Add or update a given entry in
>+ *	the preferred_consoles[] array.
>+ * @i: index of the entry in @preferred_consoles table which should get updated.

kernel-doc needs "/**" on its own line, otherwise it silently skips the whole 
block (`scripts/kernel-doc -none -Wall` reports nothing for this function right 
now). With that fixed, -Wall then also wants a "Return:" section. 
"@preferred_consoles" also reads as a parameter, maybe just 
"preferred_consoles[]".

I agree with John about keeping the comments explaining user_specified and 
console_set_on_cmdline as well.

With the kernel-doc comment fixed:

Acked-by: Chris Down <chris@chrisdown.name>
