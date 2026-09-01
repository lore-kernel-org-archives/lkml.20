Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC963793BB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238213; cv=none; b=Zh9IYKKyNo5vzVLiR34qYFRaCrIIvLAdGovBapO2pGlHUNF3nWSG89esUzC4JEcv/qVFnyHkV5svWQdchd63Ca5W+J0hATDgj+8wUHwVSWgDLeTy8jgicMp57wnzsy9lj3agBW8xfrsKzUmEwQVcb7c0rAAwAKfLn+7cjqRXOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238213; c=relaxed/simple;
	bh=VGJGL8L9QC4kuEP/yBDXFyx7IFPt6JsipVhIMzL9c+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBm0u5Gcjs1FzmD1qX8kOoqj2HPi6LpVIF8FRjwCqO1djQBPnP3A4jX2J+ogmPX7Z1thHrRC8YzJnveKBu1oduTDkispYMWU28pU6YxR+wkzE4n2aDlUWkRjQsKCgZJcydCTGDPkXG9S64M4EBdBIyzRgR0pABK1sZ6woEwMLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofIwZ33e; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofIwZ33e"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so433634a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788238212; x=1788843012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t4jQxeaDZy/Unn2ivO5mM9MmmCneCWF8T+UGXcYEy+U=;
        b=ofIwZ33eVcIzBo88RXKqk+Y54XEtIYN+WWwh7wrANj35DhRg9AxnL7LaYdWuYuuGUg
         eFpM+60u2SAc5JF8CpJTekemNh48CD2mvL/lcIS/GyqpxvFclJXQmzP+V8sJ8ZRUZRsv
         3t8/V3hjk3mhuMNrd4P8mJ4XBo+fCS5WKr4HCP56jcmkkdVOYx502CmfYh82xvzM66cX
         Jox6Im5bpZ6fRDYvIpy2QrWe437JEAlXVNzb6/Pz5P3D9OP8Rq30mAFwOL8AAi1cYyYi
         ZbU3n3cTS7IPhQrGFdj896VB6AbagA5GrcgSMHIS0scPB8FnQf3x7oTmJGgE/d9Dd6Fp
         AkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238212; x=1788843012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4jQxeaDZy/Unn2ivO5mM9MmmCneCWF8T+UGXcYEy+U=;
        b=P0r7AfnfrYSkWSuaRuNLKcetbFHFoE4qN2bjMGNF3GYlm705916c84mRzSFtjuOf1c
         d54uMxobCY2wXAlDGTWbtO5h/hWYrb8nRollpCvq4QefprYOeg4JN9GbQrUv5qzDOxbq
         55NZWZr+DqV6e/Vq6UgrMSMGhkR60DzBCSO6sjc6PrVUxZT3f8gT4mDp4v9sUTgxEtES
         2Fr2AH46udr4yKAXtIA25guvRkxP/dhOHwu0mVRY5aDBEHR3NtVMCLdNsgbpLXzE6Z4c
         jgcogh2/H3y3IppOUe5PH8FjVBpMktr1sIpN0sB1rmle3pCLC+MuYX4YoQNb1L39oMkD
         wOsA==
X-Forwarded-Encrypted: i=1; AKwUvByfFTL0wPTHByi/RqDhC8DEyh6aJpI5rVbgYT9snp2xRJi/v7A7LVHFkcQAdqrgUKkPbe9Uzh7y43SHiE8=@vger.kernel.org
X-Gm-Message-State: AFuF++kkyI4iK9+sAfHOMg1UfYQ1SvN0FInKmVOJRWmooxpyqzQhlSWo
	MJfulxUlVernS45cVfiFCX7PhLBAh89KOgh+Z9oBadiGdRVOZaLa3e8CGfQHZYYg0iw=
X-Gm-Gg: AYBFou3pXo5HA/CWZCDKUoBJgIVqo2Td+/nILZJc34z114mbXluYQz1SO1EwQGORBdw
	gapCVDBOdP0O1Ll0JbbpR+wickGZiZhsLbZsP/8xMPh2mJHwRIy1pfq9hf5ZcR/E59KUEcPU1B4
	Tf6yitWdiAZaLfmt3hqZNo3FfPClBU6GkLVrqFPAa42vruyyMR0qYqn+CQWsjS227yQkWOXqiIB
	Mu9Bs+YAfRCP/MANmQ46wfvHsfowQOshySeQYWLVkHwfZH0z+DMgIgdrZXjiS/PWF2c4MqSQ1Wq
	grxoNrBO4lKy4KlZYLwab0DmfhXIaMi914w8wCDPToyqvX8kDuikBqUKm3HLD/d26TR0K2mCjAI
	PMgdVL/e9HniLDjtYTWxR8Q2WDlGetWzas0ElU18ZLQrl/C9UoowQndLJCda1uykWtAnkKez6PL
	FMDnResd8eGR5SlPdE6tGdfzfdehO3XWXUqEeCu+BMGB467CRTBHfC6V8OEWURemg=
X-Received: by 2002:a17:90b:4a81:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-3991f8bd96bmr1896599a91.5.1788238211608;
        Mon, 31 Aug 2026 21:50:11 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm51016251c88.4.2026.08.31.21.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 21:50:10 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:20:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>, rafael@kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: initialize policy rwsem before sysfs publication
Message-ID: <apZZf21vsqy3o_WQ@vireshk-B250M-D3H>
References: <20260830155301.2713780-1-runyu.xiao@seu.edu.cn>
 <83f87db8-fa13-41d0-ae52-544d22e228e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83f87db8-fa13-41d0-ae52-544d22e228e6@oss.qualcomm.com>

On 31-08-26, 20:13, Zhongqiu Han wrote:
> On 8/30/2026 11:53 PM, Runyu Xiao wrote:
> > cpufreq_policy_alloc() initializes policy->rwsem after
> > kobject_init_and_add() has created the policy sysfs directory and its
> > default attributes. A sysfs access can therefore reach a policy callback
> > before the semaphore has been initialized.
> > 
> > Initialize policy->rwsem before publishing the policy kobject so sysfs
> > callbacks always see an initialized semaphore.
> > 
> > Fixes: ad7722dab729 ("cpufreq: create per policy rwsem instead of per CPU cpu_policy_rwsem")
> 
> The tag should be 2fc3384dc75b ("cpufreq: Initialize policy->kobj while
> allocating policy").

Right.

-- 
viresh
