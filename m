Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801705;
	b=zrGg8Cua7hm3CDnP7MIcewMJWZYNIzNEqUyhfg2gWL5hnstDQHbb+TP9WB0cJ2HTSzC5
	 HMLFmduogHY2A5U07seYLlBPIeNCMgsE6BhezhSUVmQpriUWVVHmU2rcZncrD8ZACo/B3
	 OIzIsXGImgkLs4PFGwkCA0hxpp0pFYZHU3mh+ySii8f9r7t/v215AfCUUQ4qQ65GcHaDH
	 lPDjeFKjBYBu4INpZeZtzBZxpeRULcPGc+Lc+f0mQP28D1mwxe7uR9FJLVvotrw6PB0xm
	 X1XSHRkuHyQr+FwAfzCfX5opN8PSTCVrSmtycGr5Ui2O9p0DziJBZlBxfNkADyel6lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801705;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dlGw1Vs2nk7w7nEQo4xUi2ZyVkWq2NAceMJqFlWbasQ=;
	b=JFd0sRhh68Gz4qH9ihN09u3DwYXzCZA08LKDsVpyIt5nLf+Rq8jBbcTbl3+psD3s2m/w
	 BLbtdTD3Dn2eqmts3qXIjSkRT8WMl/cwM975iKTi0TCWjUKUC11FmAB+Dakj+42AlBkqa
	 w8dn+m6uQwafmLV8ihs2vMVnMmq3nWqYFsvAM57Z/RyiFd5twj++xcCWKKEAZll8hOQN6
	 NS0x6jn0QYKl0d0JWrWXryfuBB1oT4xsKBLLZq5b1pyXqb+YbDD27fL5ja8dk4yqo3fbS
	 PPdFPDqvdbD5wrk4nhUbGzqS9o1vGiYalypuj9wxzzV8q9NoSkD9Ep1zaML1ApUzFyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1RLMMXH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48722606A31B;
	Wed,  4 Nov 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1RLMMXH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18A71F000C1;
	Wed,  4 Nov 2026 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801705;
	bh=dlGw1Vs2nk7w7nEQo4xUi2ZyVkWq2NAceMJqFlWbasQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j1RLMMXHEyo2f6D1+nzgQCuhYaCy8BEeswjiZLJo8ntXW+jdVF1GBWevzM3w17WfZ
	 +xthdHRgLaRGDsv3+jKY9TB6VuKLHEQfuSjn8j1Quh6rFukilGSkfwftoCwF7sX9gX
	 +8Yq0YKDUOD/7Km4y/qM/JDxomv3bB8pgaPR6ENEKLYqgXEHjlYR51zXMWtxD37P9L
	 G8SH66QYQWQWROlJuKubXFvzKP08ofmjDuc9K4e1Uu3XMshNItX3wEwvlAj5VjDGn9
	 wEKx24WdcqMBV+ocQlu6VT6QerMwlB/JmFkwynL95bIikKijEyAPkojtLjRbJbcVKp
	 Bl97hZpy82pJw==
Date: Wed, 4 Nov 2026 15:14:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Message-ID: <20261104-cryptic-influential-fulmar-7d0a7a@quoll>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>

On Tue, Nov 03, 2026 at 01:47:16PM +0800, Icenowy Zheng wrote:
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

