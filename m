Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979455;
	b=VblonSfxiyypDR59fEybpH3Ys5l7Zz37t5Zk250jcagD+j/y5gbs2pKhrz3c9FWcmM4I
	 ZqzuhCf8b+gK/gnqw8oQkjs4NApj5trMcEuHJfI9D84a/tkwcXXeVEvnXGfJRy32wbUMn
	 yl91CE6DAuE/EQTjMP7diw+0RcgUvLsUBOqZBUW+eMKEh11xKA/MYL76oJp7E7Wr2cHsd
	 qlElljOyZ3FgZiuNJDGjotY6sSN35qFor/wXIammFZPxIljEp2QKN9O2chzMKGPsmSWM5
	 xfyc0fN6r/xbNlPbNvrwyWursmABTIPIO/UpAPqVmBOk44g/s7CMvdUvfSwImdarrnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979455;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GLhNh3T6LNS/9yZR92xGWcCiu/9qU5jjkLdjE8MiZSA=;
	b=IUZqhYYp8ACrcDpwpHr7aAsB6lFUFBKuf6M/TwhRK2MVeQfSVG7W2Dtwtpc1dGHyq3Ly
	 cH/U5hwj0t6G2KfltSppDGmo774QoeWbWqz2LR0dWOj/P3Uod4wZkLW5hbxYMSZg7Jz28
	 s8kSXBza+YYrNvf4z1qZ4QjTkV8TGinIzLGAU0ZPffi8/ykwzlw8BXGP3qLUSuCuxE20O
	 BCFsGJEbELvBgXAz7V9YXjkfhIzdP8ooBc+UWRmj3HXqSmYlOgm61xm5Aw1zpSy56Zx08
	 xRyw4HGp5u9L/+1B8PGouemGrcVGpyyc4YhDipTaJuTNuslJJo8k8jTrR765CeD9xiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjMIsxZJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD92606A334;
	Fri,  6 Nov 2026 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjMIsxZJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A781F008BC;
	Fri,  6 Nov 2026 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793979454;
	bh=GLhNh3T6LNS/9yZR92xGWcCiu/9qU5jjkLdjE8MiZSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AjMIsxZJttitziPbILz3M+IRamsV/kh/Ny7cJZt4jJVbluDKmBY26rXCiBPx3Str1
	 9aXxEDBrnteX6E4vE8ybq1EITPUfSVwigGDIV2pmzP943EEosUraGtFCoGDSnSovYh
	 KRr5VaIXPnNNkLIFHY3DI46QQUBXc/TPj1rZN+4lIoKPOq5ldh/VM7MpJGrHdMxtew
	 R4r+fGPHprj13RegY6U0dWbndIn0w20Fqj8KQ1LYDw1ygsgqeV7FI/fDvUbaptBWT0
	 4c7YKFjYnyuEZ3OrCIB5w+7rVV2+Mf3vZfO35HjU82gxBjzQ51J+wfOrqUN25wSp0z
	 BHRkOtY1y8GkA==
Date: Fri, 6 Nov 2026 09:37:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: Document FM34NE DSP
Message-ID: <179397945177.3643947.3460844764781016472.robh@kernel.org>
References: <20261104123249.227920-1-clamor95@gmail.com>
 <20261104123249.227920-2-clamor95@gmail.com>
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
In-Reply-To: <20261104123249.227920-2-clamor95@gmail.com>


On Wed, 04 Nov 2026 14:32:46 +0200, Svyatoslav Ryhel wrote:
> Document the FM34NE DSP based voice processor used in the ASUS Transformer
> devices.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/dsp/asus,tf201-dsp.yaml          | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

