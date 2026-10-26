Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998528;
	b=aZd6RhygPH9sH/YqfY2oT2/Jiw5ymAJaF8CJkS/ZN2g9EMIJQt4PJMW+y3Tc1L+z2CAz
	 XjU2t+aZWpxp1bv5apRw9e1ySPpVJauxNhnvV4FMivKuuk+zL9NriO6PdNSERqD7sQ/PW
	 hWTNVWtcUtUo/P9/WFFErekssqAVWq3zr7Lcgh0x1FadNnmmy6KhUtJKptTyZdqCXgEqn
	 X4Tv0WzzMmQn6XH43GG/xw4cUp4ObjncHk7b7MX3HCMaem4vin+HfLCO6V4VW1HTPo1Qf
	 I3wAVxpRlNXPd+Sle0heOfE3crerhbp1sMU0Cs9HfZQWYbfoQa2PdeRfPZyO/Lry13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998528;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sG+9ctl/dW9U6eqe6MBanSCbG0xr4iLexnlh8IV7Kqk=;
	b=bhRd9VsBnWfNwI//PO3A+wf1vfPV1Wr+0HQjDbmnZjnqfZrb+HUwrJLWY0NOrQlbjWHe
	 vvvWchh6xe3SvS8SXXpTMOICYz5EKFF7TgyeHygjPjcIW6nKbyvbcFQisGmbmdsu2/6IK
	 iaHNyWlks0WD3D6ha21gFEuI68nybly6AhKvWHpb7wuN/3ghW98vbkRPZRZbDSerWEAzJ
	 t+93v8k1/vj9B3hHP/yMFf5HkCTH/cObhaXqTjNkI9YJOJX1YyxkzVJpiQNWLayQGHG/M
	 NqTnajdv3oxq8svROa15+sF/jkDlgkhPtxvXtYIt/aIMhURNoD/w+BxeAjsun9S/biA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOrj37d4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D921606A31A;
	Mon, 26 Oct 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOrj37d4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8101F01828;
	Mon, 26 Oct 2026 07:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792998528;
	bh=sG+9ctl/dW9U6eqe6MBanSCbG0xr4iLexnlh8IV7Kqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bOrj37d4eDd8+URwZ/ZAWqk7wwPZb9QcdPca5Vf43Umo/x4HMY0OKffScAvtDUpZb
	 pPcK1kE4kLfc4Zg+50MKyLCFa1opqmPuahEKcPjL+thf5CtlsuVkyWrRwkRXZ57yyt
	 gX1NTCEBxoZ+Lb3dIrBTcQaoVUYKJEM53LKfhRueuswKvj16yT5uG9fFbB+NKWNuUK
	 gVr85ijeGmfbaPKrwQvqjyKUVgfRcIsXJE7ZfY3a8pZ3uLdeKZER2RmbUCR+sfemQ/
	 0hHPhbEUOmGcS5khphAakJXc1noEGz+gJygG6v8XSlTWmANnCOOcOvZ1kpyARJDPkW
	 g5d4zOB6PjGIQ==
Date: Mon, 26 Oct 2026 08:08:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-rockchip@lists.infradead.org, 
	Chris Morgan <macromorgan@hotmail.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hrushiraj Gandhi <hrushirajg23@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Message-ID: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
 <20261022125339.82746-2-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261022125339.82746-2-liujianfeng1994@gmail.com>

On Thu, Oct 22, 2026 at 08:52:52PM +0800, Jianfeng Liu wrote:
> The ArmSoM Sige7s is an RK3588S-based single-board computer which
> shares its hardware design with the CoolPi 4B.

How different devices from different vendors can share design?


What is exactly is shared and how did you verify that?

> 
> Add its board compatible with coolpi,pi-4b as a fallback.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---

Best regards,
Krzysztof

