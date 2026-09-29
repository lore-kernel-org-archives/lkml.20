Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987B413FEE;
	Tue, 29 Sep 2026 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720140; cv=none; b=j8kDvOcI+2j3RIFCR4Swb837lPw7/I/CBy7OoWmCLdDsvmtw0WVdv1nwEu75Q8WTdaFB5/hz5zpPlKz7+1A5vFkYSOEzs5b/YdSYPt4QzOGAzhja6ZfQSGjqEvHfnjgEb+nwIKm5bzc2TAg3EL8VpVftDauNhiQUkxMjZikTw1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720140; c=relaxed/simple;
	bh=H51gaas3B8mPCyMrG9LFGbv7zyWll3o+GBME8Mxy7Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2SpIXYhD6Grj9ho3YuayO3WdMSEkkBcSJ0bb1zVbM2qaKF5ZF4fEPzBG04587AbeOfwRF/FYtMtEyaGSsYtzIBpci49nXa4aZ0+83HF0WWQ3+ZxTrHEiEnoLKbYN2+qov58mEPZB78s26DxY/l8o5BBmzaLyQ9WMkwAWngZ534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+yXq/aE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+yXq/aE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8381F000FF;
	Tue, 29 Sep 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720139;
	bh=30VbeHI26M0iDF3RNsG6n++4Iu8TSb4QWiYPs2BLDBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A+yXq/aEAKAKi8zYNvjkSHZi61BXBaN1KMAyk/swb1dHMQEpyMCwQmsjW2KDWmkXx
	 bNHo6OTJw2OZ0Zkmx/CPKo372aa2pk7y+84DO0Nt0WeoKiKmm4DPVsIVrAiNOQFcVw
	 ertVhn2mB3xVkgF7EMyFUGu6sYy857qkbikyuFKkb8g6+j/lWolYtmEGOteLqtBnBi
	 +Mlj2HwasG7PyW1MxBSKgRMlrIy3B+MEP1YmeixppKx4FGzuI+qtVBaOI1uxK63gSC
	 TvTEJZLzy1P1vC+4GeWF9hLtpLqKXitdDYUpOgbPzNm96PuNjLl+s8dw6IZbWVGLD0
	 3nkI9YRy/aIpA==
Date: Tue, 29 Sep 2026 15:15:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <arw4icuirVisRnir@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>

On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
> Document the Milk-V Meles board compatible with the TH1520 fallback.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a5915665c6bb83309fe53 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -21,6 +21,10 @@ properties:
>          items:
>            - const: beagle,beaglev-ahead
>            - const: thead,th1520
> +      - description: Milk-V Meles single board computer
> +        items:
> +          - const: milkv,meles
> +          - const: thead,th1520
>        - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Module 4A
>          items:
>            - enum:
> 
> -- 
> 2.47.3
> 

Reviewed-by: Drew Fustini <fustini@kernel.org>
