Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6563321C2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779193; cv=none; b=mZn3LOv17qUAzLDPvv+WNZdiJjF27oaAQ94+yTjYVwk+4qOMkRyyKZIWNBRn6/p7JnQdR45IkDQiMVGKuZOEqL594mZpIUfMB7vzsb0FkfUZtchPagf+HG9+ErIoWEMTj51LENR9RI2VishKyj0Jg05z8JSdUJx3US/ZqJsRGgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779193; c=relaxed/simple;
	bh=aiBAhlv2Ev/TS2fJoaSo8lPZ16KTHkhhUdlu5+WAv2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEdFQqUWqd2no6gDRuCFiv62e/jWH0mB+wUS3AZq5FRpYYzhnmyMo+5ROzTlUmd2jvsm7wxUCNvrvkM7CKHXVNzXgMyz4oiZ+npsf6waCaEX9n919cHgqNj7pGWVnK+N8/oaypXRXOK5sDiZ36rGFc9E5qOUoRMaRrG8rTh2ncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIyXC9ZR; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIyXC9ZR"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so2057207eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791779190; x=1792383990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HtE6pXgrE7ezeCTTTPF8rtN8BUz+TwVSZ4PqyPsxjA=;
        b=lIyXC9ZRTxk0Pyu64Ps6Qb9V02ILbh9g5XbSzkL0vx4eHhch9/qQBj6ylSEqehzdvz
         Zha3CnGBtiFrgmk6rm+7foq8F49NK8BTYp7e3gNRlXTQahGSrC4FCVZ4p+qxWWVwDyZc
         GpQE17ly6+9N7L9x+8If7gJCGZhFns/vuAx0jRiaNkx/3XlY5vNFfbo3A/UqYlHMqoov
         uQ/ErFPg63Q75WcVxYrQ2+0UvzlAJf1Do09BILXCksPOuVdDmhNsM59ihCxAQYrqj6fs
         7cQDUIJlCRvVAv3t68M/+Rt2ubc40kafOE4xITlWT3ukS4iMLtFEHLLLoOwtnZ5+ajf1
         L/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779190; x=1792383990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HtE6pXgrE7ezeCTTTPF8rtN8BUz+TwVSZ4PqyPsxjA=;
        b=u3P8SNal2m9HyzzMKoOZEfKLlC6/0tUcYIUNPcLKJGg3qJA+F/f89LAaiYhWsnwHBX
         hOW2i5Ldv0MADROF1YfFISC93rKkmdjgHJnF9AnnjavDM1UEv4VrVDdbCFRVfO/d+M11
         B1wvb5gODhJReaKp+++I6/VPZKjeZ+3w7I3dDeHlggf70q27IWOGGzC/wsFzJbKMDet6
         hWOiklYV8DMabR4yRemZ+pbjf+KkXddMyW/hxaVZQwHuwRfzh1xYIS08Vzi69sK0q69f
         xP+vf9tkiZdeRKY+XvZRevafcQCfty3qPDX3p+vSW47VXzkClamMFD9YQajnVmxtdkh6
         eBIA==
X-Forwarded-Encrypted: i=1; AKwUvBwdtpCWifvW+O+JxKDKwtbF0/yrgXMFh2ZZMrrIRI+WTWmzSW964IMy430CCga29Q8E2ohffBGr62N3/Ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4ITEK+MX6mwWmixjaaX3kJwN0ixm/VzQY42l9oGNqF+t1fu1u
	ZgwM8VtTOGm8xq7ZxAvmTpujon1lg23Er695guvHj91IHsxyltwayhrjj0EO8avNLvg=
X-Gm-Gg: AYBFou3msLzscV8pyUrRPvJspCzCdZt4/OOPIyCJvOLEfi9FK7An/Pjp1/N9bxiXeEv
	RD8lojfTvmh1i7Ix6t1kq5JYzqQWmeTZHUVKbXfWMAMduFdC8q84JUUIv8JIEG1XuCUnHZkeO3G
	t1jNqQm0Hlki9LSbrSXvhnN5Uy/LQft8KIcv8xIsnV8KwvgLcR1H0CtbFtBEQSPr1ksNjSEwpCz
	lYgdv2ebU5b8hkyfyO93/eSdI0l86sGEB+EaRnIWoMEyErCWs4UzVWURuip8o3szCGPpHEjUj7p
	WHGaTqMOfKNoZpiLNctbY0G8gv5TtVMb/zISQ9bCBzkJVidMnGQIssPiSl/lmc6jJ4ek+UPI6H0
	dzX1c6vFznpiJu9wKy0bCaBdVeJ/cYNJXRXMo3qXfC9I7U3hxFos1cLbOapR/RYXtZQrv4B0UkJ
	WjsxwDn8TYkrwdqzAuz6r9l14y5bLEzglayR/kLYVPooj5BRVPJh2pGSPCrJCI5BsE/Rodu3TQ7
	A==
X-Received: by 2002:a05:7300:ce94:b0:345:84eb:7153 with SMTP id 5a478bee46e88-3537e033341mr12296308eec.11.1791779189344;
        Sun, 11 Oct 2026 21:26:29 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm32289042eec.0.2026.10.11.21.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:26:28 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:56:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xiong yining <xiongyining1480@phytium.com.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, chenbaozi@phytium.com.cn
Subject: Re: [PATCH] selftests: cpufreq: stop CPU hotplug loop after cpufreq
 update test
Message-ID: <asxhcagRL3myS3m_@vireshk-B250M-D3H>
References: <20261010100148.297720-1-xiongyining1480@phytium.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010100148.297720-1-xiongyining1480@phytium.com.cn>

On 10-10-26, 18:01, xiong yining wrote:
> Original test uses a fixed 5000 iteration loop to trigger CPU hotplug
> for verifying cpufreq synchronization between CPU hotplug and sysfs
> writes.
> 
> Two issues exist:
> 1. Background hotplug task keeps running after test completes, causing
> redundant CPU on/offline operations.
> 2. When cpufreq frequency setup is slow, the hotplug loop may exit
> before frequency updates finish, which breaks test purpose.
> 
> Introduce a file-based stop flag to control the infinite hotplug loop.
> After all cpufreq updates complete, create the stop flag file and
> wait for the hotplug task to exit.
> 
> This makes hotplug run only during cpufreq sysfs write test,
> align with test objective.
> 
> Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>
> ---
>  tools/testing/selftests/cpufreq/special-tests.sh | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
