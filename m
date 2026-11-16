Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853845;
	b=lwvD70hXsiEKOghHZWBeemlsSm99/hdXmMX8mcRiPDjQ3CRvODBQePMoC/QqKe7XrOpr
	 9KTPPWVf0tXkGZKLp3Luxw02d90VWYCQbBjqIHSqas8iaZOpLw9ssWEhRMIl8lQqH0WDH
	 qfU3BPI6jWfrO0eSL88mpSjCxgF0WkVBteZPSLXsMedlSdR97RKB7mIYnwsZihsdPgfPY
	 iRT3e5PeP4+mfFNA+L0B5US6rNyJVaK4D4bmbrWaQ72URCOTDIC0lZ+zyjP9v2gTXrWI/
	 5Yuo0/+nv88i19+Myp5me7h4plSrvgyRDlJgqrqPp5sfprPbt7xzTbQ2YLI7wbjzFSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853845;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rewy0ibnC08oq2JgMwkp6Yjf6IPGQzWpE7cWP71uC4A=;
	b=FaAUM6q0KSVCG4xZv3GU9qZj4JY6VgARx9JMDVo8OkEItPBol60YvjLE/naUbaUxoelt
	 k3Js895KDvkcY1gRsh9UKhjrwUH6uSli4pv1Yd3fr6JUvxzZXrDyOhVHZorGUHY0tU5dX
	 gaVG8jb5EbqD2mhPK8rTPuT4jSzbjSN+Nszs/cKnkMFIIL0gN/XWMk5hcJ9HkT6mZGLeE
	 g07X1Fpdm28va4SdIuwEUzvNyN84mCcoKLLGv7/LYC47oqdXuuCJmmQAsvJB/NE3bBWHK
	 lBAcZO9CR6qWFYtVGW8R5JxwZMDiGOSPfRqTDDakK9i3KJsaEr4/SS0Ig4n6IS/HmEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0YqxNVn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD0606A31C;
	Mon, 16 Nov 2026 18:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0YqxNVn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA441F000CA;
	Mon, 16 Nov 2026 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853844;
	bh=rewy0ibnC08oq2JgMwkp6Yjf6IPGQzWpE7cWP71uC4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P0YqxNVnx5vn5/8mPynFjKI5U4UXVy0i7s8C/pXqxjLXXIUgBMq7kbUqrreIsoza7
	 4RVaC05Cb+FplNTDYXP48vA01lCb+xeKmp3qCfMN2jZy1GCT5CBIw9vy0Kr0R98aPa
	 VB+b71Wm33eUVnyH6eZXtR/BaNXpq8OnO++deZ1mw+0CC0arHgb327M+4rLUqAjnGh
	 tMawlrMNzwCNYpCXxmgoQvDc2t6RFx/4y28Z4nfoqn4zJJLSeZSjtZQVYzxHZh34xO
	 wU9HlRBvYTwI/ZtzlQMDB4DavtvkYfgzw9AMyM4CyMX/rroKQVqC78zNhZXR6pC+XD
	 Wxvejlet+XZoQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Date: Mon, 16 Nov 2026 18:30:37 +0000
Message-ID: <179485376698.1193522.16982734764156586093.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
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
Content-Transfer-Encoding: 8bit

On Thu, 05 Nov 2026 16:34:13 -0600, Rob Herring (Arm) wrote:
> This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd
> boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is
> included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch
> 2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For
> 32-bit boards, this cuts the remaining warnings in ~half.
> 
> I verified the config-bus devices still probe after moving 'mcc' node
> with arm/vexpress-v2p-ca15-tc1.dts on QEMU.
> 
> [...]

Applied to sudeep.holla/linux (for-next/vexpress/updates), thanks!

[1/7] dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
      https://git.kernel.org/sudeep.holla/c/cf8e899d84ab
[2/7] ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus" node into sysreg node
      https://git.kernel.org/sudeep.holla/c/f23b85b795a1
[3/7] ARM: dts: arm/vexpress-v2m: Move regulator and led nodes out of bus
      https://git.kernel.org/sudeep.holla/c/f0d311aa312f
[4/7] ARM: dts: arm: Use standard node names
      https://git.kernel.org/sudeep.holla/c/e7c38fdf57c4
[5/7] ARM: dts: arm: Add missing "#dma-cells"
      https://git.kernel.org/sudeep.holla/c/d2875dd198cb
[6/7] ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
      https://git.kernel.org/sudeep.holla/c/0c135a68ff05
[7/7] ARM: dts: arm-realview-eb-mp: Move "pmu" node to top-level
      https://git.kernel.org/sudeep.holla/c/ce28870a8e60
-- 
Regards,
Sudeep

