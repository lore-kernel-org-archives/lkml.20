Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383541;
	b=n4Wz2ydTDIDWDNwi2HVsFBavQwmsPA85V/Q20F5Kijt12v0phwv2aAJldkfPyzNp3IUk
	 Rwz5nw7NQknByEWzKGOeqbRD8yT5WqrlmlF50uVO+0QSLLoJSvq8Ob3v6PVg3t2G4UtG3
	 UDXyU9X5JqOsCPe5LDxNoW6uxBJ6hTYH18WOPwdtziWZqmmHCoqY8Dt78SfNaXlYEJ4ur
	 GKfBhdfIR4ZT2Q4Mp8Fzy5Jo0dZyz3aJHjirhhpgD94MFIrY7uE2Q6xdsJQYoNlIB7ZXP
	 RWlpbvS/bW1kvOo/2J6b8nI3/iRCWGm22DooLwfBicri8puUme0cOzO0ZZNDegz4Sfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383541;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sA8YqPjLlTYv3+ylYEgSVUN0judnUpIwnflqMVkdVcg=;
	b=r0s8DW7PTcm5t12xbXYD10BNaWVEHX18HWVoZAqJr+4xkDPuhW+G6ypm+7pGCLOua8U6
	 8UtTHxEdFUf2n+LzSt9N0oGcKd5Bf2UV6nbMG6Xnv4aoOcnVCsNVKVZ2VIkdV/wmiRnK4
	 qfhBL4SNkSSv6XcHEfNnflIC26vvqQkjRQZRUhgo5ylLpB8Wr9QnJ+ArnUBdKxez+trdK
	 J5NQackZt8MfBsLbRlg4Z742iFd99tk4HE1bRn92BAgb9nFqbbQJ4uQdHQMFgCNds01Y6
	 W8L8akhsgiGZkVGzRyNvd1vDoS4NQM8vn+PxGMb3PunDUyqAqGePYrEKISaaDsXuFsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPOcnNYN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6C60A2616;
	Wed, 11 Nov 2026 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPOcnNYN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984461F00A06;
	Wed, 11 Nov 2026 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794383541;
	bh=sA8YqPjLlTYv3+ylYEgSVUN0judnUpIwnflqMVkdVcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dPOcnNYNCMJ+3ZSzTwxy118CYCO1ku9wAuqMhieqTK00ygWFSQdnLNrJc2yNpAEZW
	 PZO0PAAfsP51fzm+ZNy03yXZo4WMKBnVuPSqj9QrHantOq3SvsMFpxPO+j8gB5PS8z
	 OH35G94VpSagKiqco0VmPgHlpadS9Odv6o8+eQnqUXXLOXMQKrCH90v5o8DB2+69+q
	 cxLV91cuNXks7Z07GdEkBitP9fbqjKyv8cerHrEhU4QceKpUgZqcuQPMSnlL7ZV0Tq
	 ynqvzm4mtActhJ4kA1BY0yTlJ14vDCOqsTHEoz59OWb/9oeiIyuudkyRRGIVfFpzb5
	 Z9Fw+L6lwRjLQ==
Message-ID: <66d48a6d-00c8-42fc-889d-d0901c8d85a6@kernel.org>
Date: Wed, 11 Nov 2026 08:52:13 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Gary Yang <Gary.Yang@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
References: <20261105011751.4058411-1-hongliang.yang@cixtech.com>
 <20261105011751.4058411-2-hongliang.yang@cixtech.com>
 <20261105-kind-macaque-of-enhancement-ee0365@quoll>
 <20261111030926.2954510-1-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261111030926.2954510-1-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 04:09, Hongliang Yang wrote:
>> So previously you had two phys, now you have only one. Confusing. Where
>> did the second phy go?
> 
> The second PHY did not go anywhere. It is the second lane of the same
> block, and it has no resources of its own.
> 
> v5 described one child node per lane:
> 
> 	usb-phy@9210000 {
> 		...
> 		usb-port@0 {
> 			reg = <0>;
> 			#phy-cells = <0>;
> 		};
> 
> 		usb-port@1 {
> 			reg = <1>;
> 			#phy-cells = <0>;
> 		};
> 	};
> 

This clearly shows two phys - each node with cell=0, means each having
one phy. Two nodes, so two phys.


> Those child nodes had no register range, clocks or resets of their own;
> everything they described belongs to the parent. Both lanes are
> programmed through the same register block, with the same clocks and
> resets, and by the same initialization sequence, so a consumer has
> nothing to configure per lane. The two children only mirrored the two
> controllers.
> 
> v6 makes the parent the provider, with #phy-cells = <0>, and both
> controllers reference the same phandle:
> 
> 	usb3_phy4: usb-phy@9210000 {
> 		compatible = "cix,sky1-usb3-phy";
> 		reg = <0x9210000 0x40000>;
> 		clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
> 			 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
> 		clock-names = "apb", "ref";
> 		resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
> 			 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
> 		reset-names = "core", "apb";
> 		#phy-cells = <0>;
> 	};

I saw the code, why are you pasting the same? What happened with the
second phy?


Best regards,
Krzysztof
