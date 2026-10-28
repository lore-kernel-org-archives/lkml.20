Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180908;
	b=cgLdBQ5ETEO66AOb8gKlGEfSefTRD/3z3o00UBoc4M1aqqyxgdndMK6posGhnEVZ2O/c
	 Kit3f2145/qoKUyfgvd6unLmiyIFI5pr/1J0NwZsLwcnHhvKzvP3OiPFUhVboEChIbXOg
	 CXavusBgaZjKRtWhmheOik651bBuhhTzMiIoH2GC4CkNdR+VOBo22rhQNanPReEdxI4wr
	 e5wItaqzVJNFP+mQpusn/Ei4tb7c4rcvID11fDoj0HvnEGVbPIq1/5Cai4zLm3Ic2oE2m
	 +z19fCb2N22I4CNe1FlpibslM6SALELP8HnLpvoyvoKJxNLq1ZBS9C0XNfAdzOIos0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180908;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w/Kq4rSNjCvs9VAI8UKnVJRhqPJ5zVmjn/9rAOMb60c=;
	b=tbXROeoZxRPhG0kKkrThFB9Kap6e7Q8iSaKDuQhTOizjndxVl+/bV4xvpsnZEVL+vD2W
	 9QeG0C0CeV/aXry5f0+R1VjkZ/SNf3QcmkyELSya70rkx5WK4bOPw6I9c0jN0sqCCFNq7
	 Tco0w3oc/JVQ3sLSvU90mGGwXxR1kbFVqVBmO2SlZ2WXYp4E1Uz2lsV6mGHO3LD5KzbHl
	 npknxqd8lO3B9wR8O7/k8o5rBtywvA08wo2pytqBS3pLPI4T1K0Yml4DU52uORlI1leJU
	 sh4YhgptVabaIgOtA65ZbcbvadQ1DZD22NjdsHOyDblU42w1ZAl9dUjAe+yxBtK43ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="o/y3YkpY";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3EF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o/y3YkpY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB6E1756;
	Wed, 28 Oct 2026 02:48:23 -0700 (PDT)
Received: from [10.57.16.117] (unknown [10.57.16.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 955CA3F673;
	Wed, 28 Oct 2026 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793180906; bh=5qjmlzTnoR3IKWUCE79lFxEjxVpvS/kN7v+qA/a8N/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o/y3YkpY8LiEpwP/EqmTw7iys/V/Svusj3PGl3LWov6/QS4Nwqfkwv3YRQG1cI4OL
	 hHuGveEVOw8Yj6CoscXg0nLlzRMioHrXqZIB8pqHt2OQKexVtqQQ3VcX0gTVITWZfq
	 PDX/UiZ+C4FJITdEQNwlRpiu0NgH0d6TNf2gmcmg=
Message-ID: <4160015c-8372-4fb4-bc2b-714f18756d0d@arm.com>
Date: Wed, 28 Oct 2026 09:48:23 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: handle runtime PM resume failures
Content-Language: en-GB
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 11/09/2026 11:28, Yuanfang Zhang wrote:
> When a CoreSight component's parent power domain, such as a CPU cluster
> genpd, fails to power on, runtime resume returns a negative error. Several
> call sites ignored that error and continued to access registers on an
> unpowered device, risking an external abort.
> 
> Replace the remaining pm_runtime_get_sync() calls with
> pm_runtime_resume_and_get(), which restores the runtime PM usage count
> when resume fails. Abort before accessing hardware and propagate the
> error to the caller.
> 
> In coresight_get_ref(), unwind the module and device references. In
> debug_enable_func(), roll back the CPUs that resumed successfully before
> the failure. Finally, release the mode acquired by stm_enable() if its
> runtime resume fails.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> This patch converts the remaining CoreSight pm_runtime_get_sync() users
> to pm_runtime_resume_and_get(), propagates resume failures before
> hardware access, and completes the related module, device, CPU and mode
> unwind paths.
> ---

The patch looks good to me. Please could you rebase this on the
coresight/next branch ? (to address the conflicts)

Cheers
Suzuki

