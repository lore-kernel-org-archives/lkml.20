Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566588;
	b=1naenTG6/0h0qgqvis/YTPh7xWvcqyQKd/zoEg2P2XW9Dti9nXOD/MRlK7G0Cy+9BijV
	 ynLdL5BQN0D+xCMa2vv6Uhik/pPnUN0MCpX/zBPkTG9Wj6vNNt/FV9k5mk8tQDjJLP7IW
	 gBxZ8CwGudUhGDOaxqc3VRqaK4uaAYG1DJgk+tnZjsab5crhMztlNT4NLm8UC5E5i6cS8
	 JEYqKwYyOswfh2y2nKqfyrhr4Wb5EvC1S+WxtETYwm7aEPYPCCs/BvLysFrJGcRvxO8nz
	 onxp0vSsGkUWWJtphC/wYrN0dLCAvmpFACw0xeQFweGffCmTd2AfBAJtBzRJkIutFvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566588;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dOJ4YdEhB/LjAz+Uew5SnjVvbdRDY4A19cwQljrlPC0=;
	b=CoS/DTY72sOSjQvw/cUoGD+KTByog1Kz1Z3NXhIDKCzURXhiF6iCx7o8xLF+w/H5uWBP
	 8UK3oT1CT5syr3kj6IE4wttOGAy9vzSJ0VfX569v8PrXt7xgdcdk2PVSuLkY/zdbX2CZi
	 uZLpoCaFd53Fhp3qVhBNo6iZHzwh2kaWP61AtEKBFoWl7LMZHwVgCsFSWtlgyzKjBdwDs
	 g0oLVl1T0Vmb6AtK0tkBxDb+OYRHKXlln/3CLNc7qmHi9FrJ2FhE4FNk7BHZyBY4Ng06q
	 HjF44fHCLA2EaWMmwIpd7tQgbaSCMOw0j8XGcNn/xFs4jAEve1Vu4zt2lUWWQ6NcK4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DTFZn/MR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C48606A33B;
	Fri, 13 Nov 2026 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTFZn/MR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD941F000C4;
	Fri, 13 Nov 2026 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566588;
	bh=dOJ4YdEhB/LjAz+Uew5SnjVvbdRDY4A19cwQljrlPC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DTFZn/MRumNrYpwcL/0t5cWb4FDPpsRQyYBaBbgFprDvOXoaojNU7Z/H9l6awyRfy
	 br3VA5AIRX1RbzSqE9Wh+nka3X49BF0BoOg8mxEv5Ol45+RLGaa3ot1MrgeEiK77B7
	 pJCwUqqKUreFbT1Mk9O2DbVx5yOhuFCHTMLuta8eiB5hscstZlzjGIE21jgH31VUhM
	 23DejZ0QBor5b6EH31de6wEIBTnqlPG3fd83q/5KZM7FvESciFVconGW+h6PwwGxoq
	 vT5RvSUX8hDP4O2fuKu/Xd7qcE136pf5ws/l235ljjMi44QIlgwiQbVbdjX3pbJMLu
	 n84ljOHNkKskA==
Date: Fri, 13 Nov 2026 11:43:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Michael McAllister <me@michaelmcallister.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Power
Message-ID: <20261113-annoying-curvy-coua-8e89bd@quoll>
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-3-val@packett.cool>
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
In-Reply-To: <20261109221453.658316-3-val@packett.cool>

On Mon, Nov 09, 2026 at 07:14:31PM -0300, Val Packett wrote:
> Add compatibles for the Moto G9 Power smartphone, codename "cebu".
> There are several display panel variants, start with the Tianma one
> which will be the first one to get an upstream device tree.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

