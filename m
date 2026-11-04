Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806302;
	b=OOOyH0jsWL9QMMun6NtDSsLRtC9NuvBLbrZT9ENYe7HHRSrRMWXJm/ok/dpRzS2sbOlR
	 TA/UCK0utLC2ve+qo97hHXozUw5kTVuhjS13V8z4OyhhcyQWXntXwJdxhF5qzSMgz+szE
	 GSZkLyD/3H9czxZv5JqydQsHkfnf3KhMN0Z37OWnNunQGg/VOsHOciZfr0gPdHJErqWMF
	 laG2TxI+z6pU9O3nD7vtRvR5ID1PuvWBnE6mafPwmcddMwokxVWeLupXi1N+83EgXlDY9
	 NLSBuIQ24LCARLIod87+QQhQGSnE/zCkDlTu2rYlMImYqXKfEU79+IO1o9Km/xA+23w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806302;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=k2iiQK3f85Qlr393A9TttaLIVgMhFvsKqdsf+QHpCns=;
	b=JQ/lum2NdFhvnxjODowQ3uOordFGGQvA9n3rJvL5jX7B25Hd94QlMfudAXbHAzNli/3/
	 1GqaqQXfg9Pu5XftkYIhn8rzgaOTraB8GSEQsNd81nI/e++adh/yTTY2dvTVHLDs8XADU
	 bKArLQHwv32w40QcAyJo3FDiAuXOkgmhFhrcPkyAUT7CjELECLMtIDNom4Tp8mLkzpSzA
	 OYq8wQEbHkCN6XGTT7vbvuj5+mp19YKjoxAU5OvBnBGdJyjBDOAMXmJaGN6WEQoToi3+p
	 8RlijRDQzgvqSiEAN5ZvYPLwbZVbQMakYTlgaP6Ur6tMPCqNAwDoPIzL3aufeg0v/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k28mOaCv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781CB606A328;
	Wed,  4 Nov 2026 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k28mOaCv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199B41F000C1;
	Wed,  4 Nov 2026 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806302;
	bh=k2iiQK3f85Qlr393A9TttaLIVgMhFvsKqdsf+QHpCns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k28mOaCv81HNgLKT4zK/GHU7yyZwzU0Q2GutM97yst02AI6AjEsV5RbZZdSSgyl3M
	 ouI1BV1B7VbpDcOz5I8Im02rGOKQLBVX2OS6ypkhVd3i6Sq15HowgIuu6Oy8+nokE5
	 vjkUZd8IiX741VYRIQIyUlb3iYkgeHUXmJ2iGDhsLxmxmPOftO0Smaa5rVkETnyT33
	 QdgH90ODJiUuMJxt1kNRn99ry4SDuHzaEoY6bec3hJd1uJNzOtrRlEFK6EeIB+hea5
	 dirnoWZLtrzelD5bZUeHSAcblGII4r7GlMRqXZS7QY0PHoJdvq2X06pRIcJuf4Fxq0
	 roM1nguPIzFkQ==
Date: Wed, 4 Nov 2026 15:31:37 +0000
From: Lee Jones <lee@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Message-ID: <20261104153137.GB1650678@google.com>
References: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
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
In-Reply-To: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>

On Tue, 03 Nov 2026, Icenowy Zheng wrote:

> T-Head TH1520 has multiple system controllers for the "subsystems" on
> the chip.
> 
> Add them to the syscon binding.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 80ff0e1caca22..b9d45f98345f2 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -126,6 +126,13 @@ properties:
>                - st,spear1340-misc
>                - stericsson,nomadik-pmu
>                - starfive,jh7100-sysmain
> +              - thead,th1520-syscon-ao
> +              - thead,th1520-syscon-ap
> +              - thead,th1520-syscon-dsp
> +              - thead,th1520-syscon-misc
> +              - thead,th1520-syscon-vo
> +              - thead,th1520-syscon-vi
> +              - thead,th1520-syscon-vp

Nit: These should be lexicographical.

>                - ti,am62-opp-efuse-table
>                - ti,am62-usb-phy-ctrl
>                - ti,am625-dss-oldi-io-ctrl
> -- 
> 2.56.0
> 

-- 
Lee Jones
