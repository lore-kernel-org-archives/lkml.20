Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522853;
	b=YBy6MZsojiK1fs92ZXp2WRG3Yg29GLTD0+AAh65KA+3TeK8eQnMRLUZzF3KpfK8ujIk/
	 fGljo3li4+1yEtYub4jhLLTF4dtSxGYsg2NZeEyIe1gOaRRRU6JcnQnghU42TNKTlFzne
	 IUR9efHSjHVnc1I51Rui5uuATs+Ygr/VIHm//wjR+sSBrAkfgX4hmzJ0ScnJOIFK0zI9s
	 lV/74hSTpuZ1jOSk6O7mKrDVTJZi6gA2B9l6C54ONTHh4OP3w05HRg2/fd0Yc5WE5W/bs
	 lfcY9EPnfz5WlHjcb3y0OCwusqxt9+pyqL4WPkTNqU6z7neUKWwdpiStWyaRHEncY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522853;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RZmkQsegMJj7uMwYkqEnAyJP3f797VptXlgVvu0XiXk=;
	b=09e5s+spKLw6WwQDCE+53gisPaO8ByBnnOj5SuxnQd+DPHaDqt4ACrN4uQsXCu7eFKLC
	 dEUEAS03hOsWZtJYhcg/Duo7uLZwgLxK383gjT8CJXmeKHsiHB0zvs4FS6qcU8Hz1N5jW
	 pLoZhb6v00BUONVxDT6e+njbJA4Q2tF9v5AfxX9mg2mYb/Y0meayzfUJ2DioQQ/k22Ftw
	 ysGDdNQyaD7c553PPtEwJ5A2vwX1r6k5Yy/ixnJ/ifVezwIYIjqa4sk4UoO3XbJIYlIjY
	 wSssmuURPFKUsDqqKjR2GvSflVVdjeJdjivu/JwFC2Q13r0D9vFxnkf8LosEQCxkfuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZM+kP8bg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4536606A32D;
	Thu, 12 Nov 2026 22:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZM+kP8bg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D0D1F000C9;
	Thu, 12 Nov 2026 22:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522853;
	bh=RZmkQsegMJj7uMwYkqEnAyJP3f797VptXlgVvu0XiXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZM+kP8bg96LTcgRrl2O4tGJEin6FVZ7fV8cdLYYi9RGQjd1Ol44XopCDh7O3rYhgi
	 eYdIxmx6rQwupBV1dD3kXO1s/5tTfFLoR2gAWrjHekiffpv6X21tT/8ec1RLo9NVWX
	 hLgMaP/hzxEc+rRtp+hb8fq2/XYBeW/qDDvuWxVwzohPvW8MSB3PUelUcffzzwhMb/
	 sygPytE9j/V3kEq95ft3hExbLSJDXdN2UL+exfS7DXxiVBhhudY0xwEXQQYY+bu/WA
	 4CkKrv4Ae+GkOmdnhcQAaOTu7xtpRl5rK07scbQvWKp9484/kLciakm28D7Bx4Cmhm
	 Rsz/ThonRFqVw==
Date: Thu, 12 Nov 2026 16:34:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: linux-kernel@vger.kernel.org, Joseph Chen <chenjh@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Zhong <zyw@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Message-ID: <179452285047.1753442.18416322410277903479.robh@kernel.org>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
 <20261101154053.3874-2-yaozhonguwl@gmail.com>
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
In-Reply-To: <20261101154053.3874-2-yaozhonguwl@gmail.com>


On Sun, 01 Nov 2026 23:40:50 +0800, Yaozhong Li wrote:
> Some boards route "power hold" lines from the SoC into the board's power
> circuitry. Those lines have to be held asserted while the system is
> running and released before the PMIC shutdown request is written,
> otherwise the rails can drop and come back up instead of staying off.
> 
> Add power-hold-gpios to describe those lines and power-hold-delay-ms for
> the settle time. The driver reads them for every RK8xx variant that is
> the system power controller, so define them once, in a schema shared by
> the seven RK8xx bindings, and reference it from each. The bindings
> switch to unevaluatedProperties: false so that the shared properties are
> allowed, except rk817, which keeps additionalProperties: false and lists
> the two properties: it also references dai-common, of which it only
> allows a subset.
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
>  .../bindings/mfd/rockchip,rk801.yaml          |  5 ++-
>  .../bindings/mfd/rockchip,rk805.yaml          |  3 +-
>  .../bindings/mfd/rockchip,rk806.yaml          |  1 +
>  .../bindings/mfd/rockchip,rk808.yaml          |  5 ++-
>  .../bindings/mfd/rockchip,rk816.yaml          |  5 ++-
>  .../bindings/mfd/rockchip,rk817.yaml          |  4 ++
>  .../bindings/mfd/rockchip,rk818.yaml          |  5 ++-
>  .../mfd/rockchip,rk8xx-power-hold.yaml        | 42 +++++++++++++++++++
>  8 files changed, 65 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

