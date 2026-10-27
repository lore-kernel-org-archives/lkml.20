Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093241;
	b=luZU8iD8FSxAegQSNt5Da6HQ0tyuMP1hP5Abj+dQ2tQn6cLVjQ7SEF7pg7NXAScTlLke
	 fESd/Q9k76cE6rhwUgwzgJnNlI/zty6neAwb3Rr7JM7fH3WcFAIM+4Sc1C5rmHfl5ZZyD
	 T9joj9LSZ/iKzdQwUfjYtwOKTTG2uMayyRD+MXZQTsh0UGEbX0aZX51P0UnoxQma5rvEK
	 dVELMyealeJupYzhxnDaU898UeQzbFqrw2OTmZNFf0AOOxCGcUyRslh0jM8qLTlpgc5eH
	 6bpTipQtctCICOw7I42bICfNETR1KDy1SCJnnSbw8PgUppRMKc1kFjeBN+r/MdOv+oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093241;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9KR4tQKKoouZdOn8TLp6tmMbElIQ1dBoDCjoVtfVPwU=;
	b=PopxOgwlRjau/N/GpKneIFz85czU+ZIcZhV8nFyWg2Egc3jpS3IWrMcYQM6cr8B9Ca57
	 CZzG+Qk68ShMmupGq2I9ITTafBNT+08uByRiJkau1uiGlaAnoARGCp8uz8DLAwhHLX6n5
	 HVw69eS+O6u+AccQyFQHN+iyAfIUPPCwK7Nth9A1gjdwXhIX0TA9gsdlhBNc6ZQuTZc7p
	 Epsbr+sF2FqhUKOOQbTjjgPyzWxogSLpz3t78LdhYySrfDaZuxBNRLVZv93Eoac4itExV
	 n6U/gL0r9v26vRrp2uloKorMZoCo99zhwYl2+S0G9DpNkujNJZ9BqDHmneU3dsbq1GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZiXeWzH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2219606A31A;
	Tue, 27 Oct 2026 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZiXeWzH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9670C1F01828;
	Tue, 27 Oct 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093240;
	bh=9KR4tQKKoouZdOn8TLp6tmMbElIQ1dBoDCjoVtfVPwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZiXeWzHGXuM3OWjZ9ZZmKwmS8io1B07UgzhX+UL//aC9IJce1cAv/G31tLlAqztV
	 ViI2uZ2NoO1/vLNx7FvJuVWDrtTpIT1jWBuZXgAvRdGcu9HYkiXhnGtnD5JIkJYTA3
	 lAMomG+lUtjQfxw/m5Fz+hYLY1rHcqlvIoSE9tsYVRvjwBBkKu4ergTnoHykQGz5xD
	 xwnYU9hIQxeABBklziX2I+QlAwse406Le/AcKBJ1GTYOKJmB4jfBuRpzzg+RAI/Fql
	 uab6CyyjdeXEt5UiwQOu5bDTrr45h4M7ab5oAjloQs5LvgESUo6QhFs7jJcOZ5v8eS
	 3A+MqK6uEjapA==
Date: Tue, 27 Oct 2026 09:27:14 +0000
From: Lee Jones <lee@kernel.org>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Message-ID: <20261027092714.GH2195460@google.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
 <20261027084511.1992-2-yaozhonguwl@gmail.com>
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
In-Reply-To: <20261027084511.1992-2-yaozhonguwl@gmail.com>

On Tue, 27 Oct 2026, Yaozhong Li wrote:

> Some boards route "power hold" lines from the SoC into the board's power
> circuitry. Those lines have to be held asserted while the system is
> running and released before the PMIC shutdown request is written,
> otherwise the rails can drop and come back up instead of staying off.
> 
> Add power-hold-gpios to describe those lines and power-hold-delay-ms for
> the settle time. The driver reads them for every RK8xx variant that is
> the system power controller, so add them to all seven RK8xx schemas.
> 
> The array is bounded at two entries. Firefly's vendor kernel handles
> exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
> files use one or both of them, with an RK808 and with an RK818.
> 
> The lines are released from the PMIC's power-off path, so they are only
> meaningful when the PMIC is the system power controller. Require that.
> A board adding these lines is expected to switch to the generic
> system-power-controller property at the same time, so the deprecated
> rockchip,system-power-controller spelling is not accepted here.
> 
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
>  .../bindings/mfd/rockchip,rk801.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk805.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk806.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk808.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk816.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk817.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk818.yaml          | 24 +++++++++++++++++++

Whoa! Is duplicating 200 lines really the best solution?

-- 
Lee Jones
