Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115C29AAFA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351460; cv=none; b=ZKXxrMfJ18/dWe69VFv1/w8AukvIk8OH0+9MgsDsRTfKIJkstVtlPzHJzuCWI10zxYwqg4erF+7d3VMfkTIanzYTZeRSgDkYzdHx9t5kT4iNVxSQAdNVy3ldtIqA3Cs/uV3Xrnrby5N1NHKOqiS2MRi16zB1GtKJ6JJq4Gv7ek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351460; c=relaxed/simple;
	bh=OyHBm0aM6KH70QZ5Y8bPQRTTYqCndlWggB4rMvP7OlM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GNMHt0moCoPZULy/9ZuogFNWWBd4Cl0oNb8mOkKTxhyeRs/wkciJsrXf+WRB150jvjv7OYX6uNI51i93S5mUo6+fRJRqn9LUIWAVGnXRwzglG4BFMCcMpu67JpFEpTmxmMwjbTsKx7R/Wmn+2Ev4JRa+Yc2nddPFP793MiKODdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW6jYuqF; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW6jYuqF"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso20008236d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789351458; x=1789956258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u6VPj5Ei/NNEX3MNDuO9HYgV6AmHjtH/GQMIJlXajTU=;
        b=kW6jYuqF/JNesbCtJnh5Np5xrNfkYwcMyH19AIgvMvdOkpriIMXQfxJpjOOw9Hkhfr
         n22ESWwfwCrwCMy6EQe6eP8Z+Eqn180aB9m5DjVkzafFkF5OAsrQdgc4m1N6znZmBBxD
         GKFA7SQN7RRfT0lKhbeRU+QneE9aAIswriiIMLtSWVYfNxAw7JVcOL97DAUvFB/utM1C
         UhGL2ZA7xczQMeUrBVaVr6XSWy61tGbhjeoUO2HmBKVT8WVG+K4jRcT9VWcKzzjdKOvX
         WEcLwC6TOjElXTSPcLJrnLgnhBfzuchOoHF/MVsX7eiO9mAOcuq8g9ku86ZCJhaNliyr
         ctLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789351458; x=1789956258;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6VPj5Ei/NNEX3MNDuO9HYgV6AmHjtH/GQMIJlXajTU=;
        b=qnkEBsCuUYKlUX2IgrZSXFSqBZ+XJL0UbezFv1KWGt/3MXYwoBJcXQhh7BjMgDiesA
         inaZpK6fsf+rzBY2LYoakoC0OFn+BBb6gmMjCCHzCw/oQSmY9A4XmVdRndwlvj2j+U9O
         a/Ox6pDku6ZuIk3eUKFfL0b8dj+3Fmap8SJ6/ZsSv+itAjzKmY7LYPDx536DyfiFEC+W
         ctHsti94d/n3DULcLFOvAXTlinamttXuZD4o0RBos9+YD9q9xh46ufBrbSU0dGCJ5HHk
         M1sBzP2V16BaMfdoK5gtcK0oNI05chfGeNf0b62PnAX5kO+2xyilwAx3Qw9VPGdchkhz
         tVAA==
X-Forwarded-Encrypted: i=1; AKwUvBzEjSt/1u4OHE+hbcBGPkqxNtQB/0HPf174QJXVlqoiCIR4BcdMZacm9oATll41cGPn3r1jhIaWNkhhM/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lBo4qH9ZvH6DoQvxHGN7fSkC/v2o4k/W3uAljWdmWwFtnWc8v9
	f9Xu7hSuhNvjeeu657nXzbf/u7+OCXv8n7CkTUHmuhTomWWhvKdBoIo=
X-Gm-Gg: AYBFou2Ac9yX/MWUdkWNsJsIPs0HtztkHXqY+v8BjrAQmhFbMyYbdvlp4r+MaTSKhBA
	h8pBVOizUDl6/xkASxjfbh7QIbeXomrkWKMoa9Zhv50FNvlO2HIT5mhIJjkRKFTzvx41kYEWN3j
	dsG6UAPb2N4J1u0DTpbwsL0ShejMFF9AuWqQ0DbyKVDtYtgWUyb84KwMiC4wDH75ZwJCejm2ixs
	ljrbwVtdTy2SMBH6Qc3u8TtN1rhiFWlUvlNHIN3YiMewWw4hZvzfJj2zbN6/q7NkHAMA5IKwXrx
	wAgDP7lWZg6MbBid0iIjz9DJc+7DC2gsJeUDOBA2ludmVoNkm0pdSvvHCEH9rjlSdZYsL9hbd2/
	Quy0ZfOVOG1B97LMAPvQ+CrllPZhQ/Q8C9c+R94fi2ODx+ofbRlc6pdxO+kUjmmT4Rss1H5URQx
	mj8M+2l0dqeU821xWJXY6jTT3awprDSmioHGvxlWqE8EjhqZu4+GiGJnZHXNxyupWFgxb8z8DfY
	fnKLdZ4XAIPKG8NNtL8bi0ZJcItlDGovi1n
X-Received: by 2002:a05:620a:4885:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93a29766649mr99212785a.8.1789351458163;
        Sun, 13 Sep 2026 19:04:18 -0700 (PDT)
Received: from [120.7.1.23] (135-23-94-154.cpe.pppoe.ca. [135.23.94.154])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cd5dsm82051236d6.14.2026.09.13.19.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 19:04:17 -0700 (PDT)
Subject: Re: [PATCH 5.10 000/798] 5.10.270-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260912065516.948645775@linuxfoundation.org>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <c9cc917a-41f8-0f2a-6ee8-9f328a2d9ec4@gmail.com>
Date: Sun, 13 Sep 2026 22:04:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101
 Firefox/140.0 SeaMonkey/2.53.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260912065516.948645775@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.270 release.
> There are 798 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
Built OK for i386 architecture, installed and booted on a 32-bit EeePC.
No new issues noticed....

Wow, that was a biggy :-)

Tested-by: Woody Suwalski <terraluna977@gmail.com>

BTW: Welcome to Griffin K.H. :-)

