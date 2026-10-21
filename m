Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555015;
	b=4LZFtE594ewX0GaHCIaAGvZ8A0GE0BAk9htNPhTEQplezneF+NNX1ENDESuzNvlXKRas
	 Es7xgpHEncqUwRLiBMfpQUjYKzhfo47FPlSL57GQTGySRtBYz+oAdkGaOC/Wcq/cNTN6G
	 ayZpDkFDT02cRQB35wL5s+Y64l+FTm9Ryh/YUdsOVjfiFLhdQr7Qzf65r5s8tiFZlbfFk
	 WZ2oDr5tZsXN+yjsWSfpG3qnHCQtm8iPKlxPh8b5sA3gHCFhB21LLh3ecNuPyedz1iWxc
	 fwhCegCEpqcx72rFJ4e8HrsHwctycOxrrMw4iU/rDoq8Zedg9xNpAoWgRZwAqQ8YfZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9hCF0mlcp/ziupFrj3DR7yTQMLI+9lDhDQnOx2f3Cow=;
	b=J3MYe62QsjtaQ75V85D2O9573mig+BjKeYf7YUuShWDAwE6BlKmTZQAtaI+LJCW5q8jM
	 njSUJDFNwuzefbmuBlq2oOtC3czJ8HvbXzKXfk1wELqjqyF4L6vedd5kHxp5mfCm2zYJk
	 qWI8USi31qQEb59Xzk5XODQJYT3zADW+GMCAS/t7639tBd+xHav8RtsE/aA+9qHQfddky
	 4UlPmaNDNaSYemuGKQFZxMSMyOVOcAdC0L3LW8+Q6p1eWdELmOeSb4r8EOxq25prSIukK
	 uN1+c2wM3BY/cMUbyT7WPzSM8yVyin10aQGUwkhfhdlIwlOt8MB/0nvpHdduKVU2nTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t32U+W81;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t32U+W81
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36661f953e4so563895eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792555014; x=1793159814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9hCF0mlcp/ziupFrj3DR7yTQMLI+9lDhDQnOx2f3Cow=;
        b=t32U+W81DI+uRXHeY5SOqR6nLWkS2rbrPfnLWOYOVJoroMIPjGKr8szG4I8VAKLlEF
         6ktTVtCI+TfbfWuHU08TpOsNiGTRo1QPR95hbyLxgtZSDlqN4RBb2zd4WPjKoNS1/iMI
         Hv3CyDtwP0DE/Absgsqh1k8ylM1GvSMGh78wXZWxFYdxUOQf4TWUzgXSHkn9UTvl83hn
         ggKZB66C5I1KNQOyzj+fAnslridvRWku2IQI+cxpmFVxYqRTz60h2F3UV0agDFFCs6bl
         5NUinfyn75y91WkHVbmujPf9BorzkSucvQLSi6sZ6Gf3kUYk3W0IKpT2vOl5iobevJEv
         vPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555014; x=1793159814;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hCF0mlcp/ziupFrj3DR7yTQMLI+9lDhDQnOx2f3Cow=;
        b=kEprKUCtD62TMiBnlPodMQ884/DOiG4gc+Ls3PE+iHIlzv39WSVvYfFzZvf5hCfs2Q
         LxW90aC8tn2w4HBxShCmYPpPOWfajAugPvYQIAqTjeiwZqLkhXJpwmBLzhiY1+r8OlHN
         JVCyOl0mfQHlNE+y/e3wZRtfWIFjv7JYGzyGdSurf7wYyqH0xwdkPZvXQ5lfaSWUnzpY
         Vr0fuvJe67w3gjCWPH4SVW5Qzq2z57OdqQ5R8mTfIgLRq5DJUF4CPxF5axz0HMZUwZ3p
         hvqwef7KsVOiJQDgWhY0a29OowgyjzXhNuFLD93OB+RKsOrLPW6DosKe1VtnqPhp3bPi
         6Edw==
X-Forwarded-Encrypted: i=1; AKwUvBwlwTaUBm9xWrHyVm3J6Ka/RpWMGg1K1GH1Qr7n7dzS9ObFGEWVIOgxhd+Jnqt8S9vlZiuMaWuLemaU50o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj48ZANxYbAQJEio8qteudL55pL/JDh90OMM9zvwpqj1PwPPYD
	RRCIFw2HIcbHXc76jRIfBzNpSMNEq06fyXXlI3sxqkjjW4+O0vOA8r+psMxneovhBBQ=
X-Gm-Gg: AYBFou28UHmPZ9wRwIVonsNE9rTpiQhYE9aTN/+w9Xk/xCNgDkIU2YB3qYDMfkr4S9m
	DcLclLKk5TpVHK5l9EDO77Y7jWL9gJaC0/+YltX3X38tjZiZdrIAHqrvix/jdpluWHdF+3rvXa5
	R78XX4K9PdEbSH7G/ErA750vGxDSOWMZUKQa91vSrgOm1bxEFxk2zo0fR7CN0snUR7Q/kHXyu/M
	tfCW/EJuVjM56tujpjPJaspU66LwQg693z9bZ8VIj5DSMKnPeTbSeLsycR9iUXQkgLa/h96xj18
	ObYcLclIv/PxIcTyS4yNCTyf+BIvVQyavTnIaOy8dIwH6YmnRl6dZIixA7bUy1hJ9U8lRTk4TID
	8tTnDm2c/oWoZOHfKC86bgWyNX8a/ItLIdeUY31U6EH00stBfeOZ0NYtOSs3rEcUGygA0X2fouz
	nYG6w4qbZctb8RZvSD6HSGDsl4XfRozXe2ZkgFwcuyTEt7jyDUdV9ZS4I1glGzRaYw4zx8Xs34r
	P0x+m8rRvBgSBzxfYLaqOPigH+ewYIa4O21EvDtxKJViB8+gWz4fI/4ug==
X-Received: by 2002:a05:7301:d594:b0:35d:3370:d8e7 with SMTP id 5a478bee46e88-3674b53009cmr1815104eec.2.1792555013393;
        Tue, 20 Oct 2026 20:56:53 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm3507906eec.25.2026.10.20.20.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:56:51 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:26:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: longrun: fix kernel-doc warning
Message-ID: <atg4APgeoSHQWNeI@vireshk-B250M-D3H>
References: <20261020071913.1677196-2-manuelebnerli@mailbox.org>
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
In-Reply-To: <20261020071913.1677196-2-manuelebnerli@mailbox.org>

On 20-10-26, 09:19, Manuel Ebner wrote:
> Replace kernel-doc comment with normal multi-line comment thereby fixing:
> 
>   $ ./scripts/kernel-doc -none drivers/cpufreq/longrun.c
>   Warning: drivers/cpufreq/longrun.c:21 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>    * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Suggested-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

Applied. Thanks.

-- 
viresh
