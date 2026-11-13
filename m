Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581821;
	b=j5eD0UBVcr0l0w7WKjhz5TfhgmnpDslLZDuzLRwjg8eoh9rfERxaNKzn1hRt1guJOZ1g
	 qRpJXJux3OHBUuUtN42fFNzEZjSolZYW0/BcjqtJvjg3JtgfWtPVPuojobJGMZ6WJchAM
	 IJfSpgKNTbz3H88gmTe60KqCMz1GB2icPe530rZv3574TJmnH6VyvrSJCw5oc6M+Cc3rO
	 zAwQ4GN3n21HY85QHaWBjP7qTPcpkGKDxssNRY0pT/ASwk0bFVuypaEEknOM37YnTbDbx
	 /p8JY4/E8h17F9CPBHTry7W9iX0TXqzzf8D2i4lhvqi+eOHb55aWFoopFXuLUKrYeEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581821;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iSwaC/2lj/nZb10fvErq6NCUNTMpTf7z3yMbsBav2ZQ=;
	b=n4iN5iZpcExbBFguUtjLiwU7G+X4zAvn9yCTA5DTVQ3TawSj7ecCistVKSv1ovNiNDNy
	 WPLJKLFEcz8bsqXAEA4IZ3YskZDj2yln8vdf7TRrttE4cZm5OCpNRBIscPddBBfXV7IKc
	 fs2RReUV4J7qHf4rh/G90pGVvCeoMM9l6vLKlGyc6uIjg4m06Mxw3IuVJHFXL38Bt/uT8
	 SLroD94O6Eaw9tJ5NapLI7gYUybIW0XBriB9a0FEWZ+vSsPZNjHXig7LcBTlSdsvKzvGL
	 nOEVE0IxrnaxSMArWtFm6iUkInp5uvhb4n7MRnE683WMxOU1+IG9xPNz3h1MNcY8dIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XD/jIw31";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D1606A335;
	Fri, 13 Nov 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XD/jIw31
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D201F000D2;
	Fri, 13 Nov 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581821;
	bh=iSwaC/2lj/nZb10fvErq6NCUNTMpTf7z3yMbsBav2ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XD/jIw31LH1stn9P56UZ8+13/igS6ZdzZyG3DZErX6NzwkqPT/UUwuFtxtAMEaayL
	 XJwWUVZdUZPlU30GdktbDuwtlIS7+S7zNMLkLaIg5k1Yej2NAFpFBJw4g1auqPYkf+
	 DlVi3LeicefXD5SQ+AjeaxZRbivacpFG6CcrXoNNk8oDvRENS2dDDtgeC9UxRcpWK1
	 dR5qm1NU5kEjmF3iflZI+VcH05DDsXlbDfHLjTS0RRLkrGCSUvh5hbgPtnsC+8Zwr0
	 fo5lsUQCataGAfjC10bwKA8U9qw6IiQUsyU33aDNOhl0fxvg/xnhRZ+2X7vad0AoUp
	 Jh6157xJH5hzw==
Date: Fri, 13 Nov 2026 08:56:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bin Liu <b-liu@ti.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ux500: Convert to DT schema
Message-ID: <179458181753.894992.16905074908634657648.robh@kernel.org>
References: <20261113-ux500-musb-bindings-v1-1-553aa97c5c95@kernel.org>
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
In-Reply-To: <20261113-ux500-musb-bindings-v1-1-553aa97c5c95@kernel.org>


On Fri, 13 Nov 2026 11:01:44 +0100, Linus Walleij wrote:
> Convert the Ux500 MUSB text binding to DT schema. Describe the APB
> clock and the existing ordered DMA endpoint channels, and reference
> the common dual-role USB properties.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Convert the Ux500 MUSB text binding to DT schema, describing the APB
> clock, ordered DMA endpoint channels and common dual-role USB properties.
> 
> This patch is split from the Ux500 DeviceTree validation cleanup series.
> 
> Prepared with Codex.
> ---
>  .../bindings/usb/stericsson,db8500-musb.yaml       | 79 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/ux500-usb.txt          | 50 --------------
>  2 files changed, 79 insertions(+), 50 deletions(-)
> 

Applied, thanks!

