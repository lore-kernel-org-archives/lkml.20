Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264159;
	b=rHpgID5lfQHsa54GCAAawqPnEl8QXNYr5DYijxK1LkalyKx3CMfe6EGVRO5m8I2ENXaY
	 T/A2qOmpRilm6sIy1FN0De6ZHY6Buu7W8P/ToUuQg697rumUsnn553MH6GIGghgX+mJJQ
	 nUjkWumHh/5uo9ZYroMHk53nd7m4GFWoxKu3tWUsX72vBCLye2ET83E/muEGYAjwvsTK0
	 kXzIsC6k1DkX4Mr89b6yS84mqiWfZrODlc9gTM1TRCUO69jxM95SB4IzBj4PxhW/1GO9F
	 CccLBi2k31lX8D+pCuriIORWH9W4AccoacoGV0XeptU23Xbd+jYk7MtOFlFOPPkBnxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264159;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RdfKHm17/Y2Uf2JjxV/i5jrnyedmTGTyUPoJE0H7d6g=;
	b=oT6mUdsOTonJsXq4adtoEiJRY6+LXzm8dTMtoZLX+OOJQftXIOlybQMmr+m1YD55y2fb
	 wf6qrVJRrELC4bh69yW8SxcHGVQKJNH7kDuRc3QpwZC3eW6cBo4ciV3muN3PQJ7vlhTup
	 rcZTJReY9Vh4g8LRtxa5C/1vAq2NEV2VomG/QYQJG0SULihlJQP+BICTAGPuRYjJbOBP0
	 R7zMkwFxP7fzPEL3E8OJorLEkSB3Kx59hMtwUW9u/nK8DdtCxkIg4tTEWYvmXgZJ+1ZAV
	 0txtIdIjYrJVe9NFnNDIYK8s5Cm8teq/AAip2hBCjTclCS3tX+imZaaigsc3FqLYycA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpXZDJqM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE18606A339;
	Thu, 29 Oct 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpXZDJqM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0956A1F01828;
	Thu, 29 Oct 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793264159;
	bh=RdfKHm17/Y2Uf2JjxV/i5jrnyedmTGTyUPoJE0H7d6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpXZDJqMzCaDvJTvn9qbf3mmnnpfPyI1QRMgdpKld21cN3LvwinL1fPrhK9pWmIGP
	 TwqCqJY3SmpW16zXg9HXU4S7AN2iRN+GtioKkV7FUEewRLbmFkiEw+8ta9uGdyfBud
	 XgBL79pejFdZ9yi/hVloee/uSyTLHIPktA8u6mX8Mv/TTuD6Jyvd8mAGAxH+Njs1Nd
	 lHrDfxCk+YXC5nomkSh8lX4GoJtqA+EjFgNgvKF91HsJ6D6wCMc90CoTtInnsqe065
	 eiYAu//ebAvh8kuZGp/KYHl2noAOJ/uxX2u0PwN03vTAwrLJ5gZREmPhBCZA3uzsnT
	 9GX8yDa6P7Dbg==
Date: Thu, 29 Oct 2026 09:55:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Message-ID: <20261029-amiable-loutish-wolf-60a76a@quoll>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>

On Wed, Oct 28, 2026 at 08:04:42PM +0800, Qianhui Xu wrote:
> The WL2868C is a camera power management IC with seven programmable LDOs.
> LDO1 and LDO2 share the VIN12 input, LDO3 and LDO4 share VIN34, and LDO5 to
> LDO7 have one input each. LDO1 and LDO2 cover 0.496 V to 1.512 V, the other
> five cover 1.504 V to 3.544 V, all in 8 mV steps.
> 
> It is used on the Lenovo Legion Tab (TB322FC, SM8750), where the two camera
> sensors take their DVDD, AVDD and DOVDD rails from LDO1 to LDO5 and LDO7.
> Without this binding those supply references cannot be described, so the
> camera stack on that board cannot be brought up.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Please respond to comments from previous version. And not with LLM. I
still see no users of this binding.

Best regards,
Krzysztof

