Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618403;
	b=GYEHjA/IWKwdOFtd5f3kVP1Od54z9XrpU14MiRkMAzXt7u4TF+TlGkWf+wv8BfL2lD8H
	 v1ZivYgoo9wFrRjCEIx+kGLSKsaZROfD4LcE9rC8CJ+YhQyNDryhGFOkUlyfXIALp23ql
	 esL4OKfznnc/KM7aNob4ObvUgv3RrsAL+qqwoRLut+dGSlZCGcicN/ClSePDiK+4gRfZp
	 wepT4wfF4xvy8kSo/K8v+DjJuSnFkBnAbbH+p9gDMu6pJdxQ7pdEicRro+X8Um1oFvaGA
	 ysFAWpIoWAN0gUV3Ldx4SeGfSgTVs4G0H90+8a5KGcVInJEsl3pC+NXO8ZIfx2E5BAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618403;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=jD+CP+pE7RBPCJtNSc2DVOHXU89eL8jOxmFiEvur1G0=;
	b=E7BPTG4BXnbYINuLKvk9MpwwP+GNcjBsF+b6rHB/xnKWpXU52JVLwV9bA83TTCVGIcZS
	 GKewEz8gsoaQX9mOy2Z3V5gjJS5SHC419i1nXYw6p1tAf8gkg9QfWE58IkAifi3glycia
	 ZXv6tsGq0x3PtyKafdH75QzQ6jH+oukBUdW75sBxlDal8Bvw5pDvEqS2rSxtViGjLNcwx
	 5r8YLXY0Ia/N0dVmINBNRBlYS+b7D/YfM0c9MRnCQfBbukG3bkZOFi51/6Qp3WrrR7rxB
	 UKI/5pzmDfB4SQJtRtTI9KBQsTw29QzAz9tAG4rBuNmSbibYLPN1SUApd+TIFhTPB9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXotG8GA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A91606A324;
	Mon,  2 Nov 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXotG8GA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1331F00A16;
	Mon,  2 Nov 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618403;
	bh=jD+CP+pE7RBPCJtNSc2DVOHXU89eL8jOxmFiEvur1G0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aXotG8GA0UmJoa+3+tiIy6WlfrUMg08oma6xReyy9soY49sVhjDuR6OanMy2wOkAd
	 aTUPfVKkIqzhd7Is8j4MKEpyjHjSBEkydSkgwM71y5Yapj2Is680XdUoJ+vTnfO1zN
	 VsK6GTlpGYbENEWnxk5tUHLj0DW09cSj34nigjGvAZn7k6hIfteGW9e/fImc5I7/cX
	 xwp62xamINvZs5W78SnUJ59aeDTWvBe0Y6JeZmnKV2RfOXYu5f1A68+y/9PrsdLH3Y
	 RCl9mFjoni+PJRxU1ZfykGwR5QhgYpHNVG6afFz9U9Bv9+7hhuw2lXwb7bAdi504Xs
	 biCN0BaNzV+WA==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Oleg Keri <okerixx@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261009082639.22662-1-okerixx@gmail.com>
References: <20261007193332.5270-1-okerixx@gmail.com>
 <20261009082639.22662-1-okerixx@gmail.com>
Subject: Re: [PATCH v2] soundwire: qcom: disable the interrupt before
 gating the clock
Message-Id: <179361840086.66001.5084108437827534516.b4-ty@kernel.org>
Date: Mon, 02 Nov 2026 16:50:00 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 09 Oct 2026 10:26:39 +0200, Oleg Keri wrote:
> swrm_runtime_suspend() gates hclk straight after the ClockStopNow
> broadcast, while the interrupt thread that completed it is still
> clearing the status and CLK_STOP_FINISHED is about to fire. Both touch
> registers with the clock going away; on x1e80100 and glymur hclk is the
> SoundWire clock itself. The next clock-stop exit then fails at random
> (bus clash, parity errors, AUTO_ENUM_FAILED) and one side of the
> speakers stays detached until reboot.
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: disable the interrupt before gating the clock
      commit: 6c067677192f054bbfa815caf04f536bb8dcdee2

Best regards,
-- 
~Vinod


