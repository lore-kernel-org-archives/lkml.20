Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A94A43B3E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277188; cv=none; b=gPrPwDLI7Nw4vhaHyUOaQyIBqzekJCcQybHk7+z0QAaEcOkc6OCzuX93BDa4VQJPmfQFahhRtBnyNYarzyGlmA/hjUDqsXRME0hjYAJ8daBy/m8KD4leWkRLbAEwRQw4ARQzIQCBNQMjgv4eU4/mKR2Nn5Dt1lmtvaH6Nz4IYVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277188; c=relaxed/simple;
	bh=TCYNIjoDAeYSIymyfn+nSuDQt/fXh6oAAWKwvpxl1Vs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bAnk/wXeoOzDvDV5KgzdL7Nu2B3yY9dAGhJYze3B9PxmEHR7dJKSuJcgtCAyRl6cHJTUB0Eb3QSrGV6g+8HQy7x+2o8Jd9vCjMvr4JLXJWiPaa8xlBeFcTNcYeYK+UtKZPWBEV6R34ZhfN2VglaTmOY1gIx4Xy9JF9TIvcFdC6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+BMI8M2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+BMI8M2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6E71F01567;
	Tue,  1 Sep 2026 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788277187;
	bh=fx47gJqPCj9SCA0JB2cyQLIosoTWKzO+g7yTHtgtM6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B+BMI8M2fCGxW62EK9NXrJh+RUMPMFvhnxkbKcFZEFDTCB6uEAi5yb03VP4tIHlB9
	 n00LKNqpN/R6pAJaaHK7XipYRi0k8knnrQzggr0K/hNCf73zyO+WIWQi87K5Voxgv0
	 jz+nfv7GsXZ3goTqKxm4XZSxV+ARG/LLnOylYpHEyY5bMs0clD59A+Djleo01MLTdQ
	 XQkvLOU51OPAThJn4dpjy3aJlNmyg3cwBQWYQqHdrQlXqnUUdSdvJsqRRsZVFoAjz8
	 HpJmyV83/JZKbV+Mrov4t5rGYFepO8eEzmkESGWH4d3rIfOg1eNqfw+HYBfMq2rzDq
	 5pZM0wZoGLxag==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mmayer@broadcom.com, florian.fainelli@broadcom.com, 
 Danesh Petigara <danesh.petigara@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
References: <20260826201500.3000125-1-danesh.petigara@broadcom.com>
Subject: Re: [PATCH 0/2] Harden DPFE driver against buggy/malicious DCPU
Message-Id: <178827718509.210805.1672029094153389566.b4-ty@b4>
Date: Tue, 01 Sep 2026 17:39:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 26 Aug 2026 13:14:57 -0700, Danesh Petigara wrote:
> This patch series hardens the Broadcom STB DPFE driver against potential
> exploitation through a buggy or compromised DCPU coprocessor.
> 
> The DPFE driver exchanges messages with the DCPU over shared memory-mapped
> regions and currently trusts DCPU supplied values without bounds checking
> them before use.
> 
> [...]

Applied, thanks!

[1/2] memory: brcmstb_dpfe: Fix out-of-bounds access due to DCPU offset
      https://git.kernel.org/krzk/linux-mem-ctrl/c/7c0b82d087908765c6c7daeb06943e21b78d523e
[2/2] memory: brcmstb_dpfe: Bounds check DCPU-supplied MSG_ARG_COUNT
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6b07f8c06caca015a0db69e3f323b5186469bc66

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

