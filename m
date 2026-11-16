Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841855;
	b=lWwd4QMRPUfFgO4gSDrzPP07Hw6BWXm4EeI6E9+d+sIXDVvRQAzA9o0FE5t/RXsBVZRQ
	 Q59vuW1nOaeLGFLgWaOiT/2cYO+St8cjqPSQfqOy3fQoZq8XvyCeqNpkyLhjuzh4IDzlO
	 w98nvDGe4bn1NTsjFqOh9cOcpVMJByKBzGfUqCTnQiMRtcLVxYwxDOGe6HiMl1ci9KlNW
	 IfiUXAYRUzB+Y514qXQPflVmnVa9nzyImMs+HYr66XsmZu5UgLGZ3BNyzCtcMewEJ9q2A
	 sE4BYUSV6s3MLw635kJS7SqyYIFikQ3DdrcBYThVdjhStX+b6kPLbhCZhzmtGUvpleQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841855;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dLO2RA1iYm7aDG8/TPyvu9KtYf5vA2gWKRW9QlcTI34=;
	b=Git0KsQI88SgUpG5iVXCOJsda/JE/ipVQ6Ubx2N24b0cBuTTuZtTuhWzGNoXByF5QNJj
	 c5KsQqExDWMFkP5R/x560WMrthoZd9h/ERR1kKtZvvUqcojmYZNjO9yD4aKkB2egxOjuB
	 WpRPTbLgNJkEe8ejNc+zsrwOteSTnXPv0xdGcZJJTy7pKzl4+lUv59NXECSFKVLYbv59a
	 bazINRJ6edVggP+mqmH425jdmY10iHEO9Dr+j2zJWtz3GRv7HJi8lSR3X9uGl8DhgCzEV
	 lfQRgHFssQyA4VJsqaxYo09t8Yub/ecgzoviZ9GlMFr3cZTiNsPl59guvxzU8N2+gzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8gLEj86;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85936606A88B;
	Mon, 16 Nov 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8gLEj86
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7991F000CE;
	Mon, 16 Nov 2026 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841855;
	bh=dLO2RA1iYm7aDG8/TPyvu9KtYf5vA2gWKRW9QlcTI34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m8gLEj86xjqHFEfOoRI4Klz0nHbUnqwC7L7jiV1Qcxg2xlnIzL7Pc0WfDx3lMysf4
	 gNNI5SBH3s9NhRhzpynt3c4zC7+pqV+cLaKEOxrEtAAH9uLyq+6LLvxcMrAYUX8kG+
	 loQvnZDenHcDG09FWLIpgjZgdyppYSfvsgqAgoxgMpibYLKNpoctomt4p1EDVn43o/
	 loWIwHXP7CBnTsJHQZbO6BcnbIvwvWnE7gjtWPE5HvS4+jRYEALX/jyBf46dW1CF2U
	 kaAmaeggySuhW3rJtzP58UWQKj2kKpHJ+VkGt9qz7P/5C/hKwVEc2Tu1OMSJhNDHTS
	 tkpVbTG9eBs6A==
Date: Mon, 16 Nov 2026 09:10:52 -0600
From: Rob Herring <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v11 1/2] regulator: dt-bindings: willsemi,wl2868c: add
 the WL2868C camera PMIC
Message-ID: <20261116151052.GA1449968-robh@kernel.org>
References: <cover.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
 <9ab5e5937264bb408be43986acb8553464e44a49.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <9ab5e5937264bb408be43986acb8553464e44a49.1794557667.git.xiaqinghuan@mail.ustc.edu.cn>

On Fri, Nov 13, 2026 at 04:19:13PM +0800, Qianhui Xu wrote:
> The WL2868C is an I2C-controlled camera power management IC from Will
> Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are fed
> from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and LDO4 share
> VIN34, and LDO5 to LDO7 each have their own input, covering 1.504 V to
> 3.544 V. All outputs are programmable in 8 mV steps and are gated by
> per-output enable bits with a chip-wide SYS_EN master. The chip also
> exposes an optional active-low RST_N input.
> 
> VIN7 and VSYS are both inputs of the internal control logic, which is
> powered from the higher of the two voltages, so a device tree has to
> describe at least one of them. The remaining inputs only feed LDOs, so
> they stay optional: an input can be left unconnected when the outputs it
> feeds are unused on a given board.
> 
> The example enables ldo1, which is fed from VIN12, so it also describes
> vin12-supply; the binding says an input may only be left out when the
> outputs it feeds are unused on a given board.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Missing my Reviewed-by tag. It's your responsibility to add tags when 
sending new versions.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
