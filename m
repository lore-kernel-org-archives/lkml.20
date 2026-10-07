Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F79392C27
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385509; cv=none; b=EXUDIVuajV1h7w7ekMWnpOuHq6MA7ZgWGlGqQX+gbj5EJ59fXo/Xd86qskZur6GRL02/ahzi6H/mp8yBdbPK7No641EUvf6nnZAzVssXGtj/CFE5uz020yR6+xRLoT8IKBBeJWYQDkTLDmnWBl92zfjuWWuL4GdBNm++1aSgzGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385509; c=relaxed/simple;
	bh=ypHVfCj6i7a1HTdG90VGoKIiEJx+XtBaon/Sf1u5vaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q5x8YnqQ+h8/nM8pF0EbwmPNNycyxLfBJt+xT6gBGhwtkLNe8NqEqIfFYKqjqFzZHt50MBkt3OGNpHDxSvq5eleloiPv6kds375lpOKZDtr1s9M5sjIWOswuq6om8BZk9AG8uS5JCegf4jkb9QR77RFMMXWAQCGJ98vfLQowYnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vg8QQXo/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vg8QQXo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321C31F000FF;
	Wed,  7 Oct 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385497;
	bh=5KKgn2UqrLga3ru2hCfdwq01pxA7KWr598Qy7ODuIOw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Vg8QQXo/j1cJA+7lAIWl3ieC7bbAK8CmOakSBQEx1DU3vTOaZwvEsY7z9/9+Vfxpf
	 9rJB1J52vIe8HZTeZlaifB+0Ge2/4ZOkTdXja7wheCuDq3l0g3d8Th1DVxE4fbvebX
	 ZAZ9mp8+WExsm3VNq7yT3nbpxQ/I40GPb32od1xYcBwRh+lD1k5BeE9+iz+z4y0T8W
	 +wS8EerxsldbR4lCHcHuSju760dQ9OJAaxRsrLetzKYp5VN5w4kBnOBKfbsaLpda5y
	 k+C02Xq9gcpMvs9tSzWPgQq7JGAVPbaIVGj61dGFXV6fSksk3kpUg4MI2Rv5koWqxx
	 /carN3dHoLQpw==
Date: Wed, 7 Oct 2026 09:04:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zongmin Zhou <min_halo@163.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD
 GHOSTWRITE
In-Reply-To: <20260917074843.52716-1-min_halo@163.com>
Message-ID: <1cfb2bbd-206b-4a5b-e136-7afbcde21e63@kernel.org>
References: <20260917074843.52716-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Sep 2026, Zongmin Zhou wrote:

> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> errata_probe_ghostwrite() only marks the CPU as vulnerable when it is
> called at the RISCV_ALTERNATIVES_EARLY_BOOT stage, and the mitigation
> in ghostwrite_enable_mitigation() only takes effect if the vulnerable
> state was recorded before the boot alternatives are patched.
> 
> The early boot stage is only executed when CONFIG_RISCV_ALTERNATIVE_EARLY
> is enabled, which currently is only selected by ERRATA_THEAD_MAE. In a
> kernel built with ERRATA_THEAD_GHOSTWRITE=y but ERRATA_THEAD_MAE=n, the
> early alternatives never run, so ghostwrite_state is never set to
> VULNERABLE: ghostwrite_enable_mitigation() returns false, xtheadvector
> remains enabled, and sysfs reports "Not affected" on a vulnerable
> T-Head C9xx CPU.
> 
> Select RISCV_ALTERNATIVE_EARLY from ERRATA_THEAD_GHOSTWRITE so that the
> vulnerability is detected in the early boot stage and the default
> mitigation is applied.
> 
> Fixes: 4bf97069239b ("riscv: Add ghostwrite vulnerability")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

Thanks, queued for v7.3-rc.


- Paul
