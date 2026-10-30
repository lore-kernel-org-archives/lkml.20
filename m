Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362145;
	b=xLe2h3EBuzttMUYkYAZKs1AtIyg5SkdYa4koVIgvOJoOa65RHDBZs4i4CziYxMxtTGjJ
	 FUS4zIXkx3ve/nLDIyhw93h7Gjd6lZiKjnMptvWIlOVdokKcHT1JTJ+Cspr1+36G3qx/c
	 6LLNu4oopF0+jcXt6xKBV99JoujH3F6Ab3uMkUJ0jvWob49DFxZuyc2w4JcRTtDO+DQYf
	 e67b64UN+TJqSUd+ZWQBH/MPsbf3KFSatGitq/0Ja5LFdmvp3D6qtlRohYqf4PNAvr4sF
	 ta8kOle9m2hmN7alBcaCs5cwpLNX10IvSU/ZN3GD5Cv5OiMvOg0c0qjszRdNKsN5qNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362145;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e/ifG3aJlgeryqjmhfgJsERZbxd/WJ6aLHD7syJgljY=;
	b=H1kFirSMXrOAeobaEYJBYH/NAdJ+17uCm9wLJX/h1Z0glnZvQCa0tOaQhHo5iZBMf/KS
	 2b9zqsrUgCGMicmCIHV9tOZSM1ah/SfLbf7ulm9TofGQT89wsyfO+gz09o1PBwhr/8+OT
	 3SSx1YDxiQZ5si6dDefY7cMI0+IZ5xFw8qsidRGiKNWbj2H57D3KpzjwwF57Oz12WXWWj
	 WEUJa7d2HdBze7XBQy5ri/pHkbj7ChFHn+vnGCk/FT7eMNN4UQXOAM3R64VO0hTniBXzU
	 JC9f1Ae2Blt24Pnzy6epghJQjWGaOLNBRESOqfhXHOYc6o6l+0iKKO0J5qbicLDu33Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7UAC0b7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BF3606A31A;
	Fri, 30 Oct 2026 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7UAC0b7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85031F00A1A;
	Fri, 30 Oct 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793362144;
	bh=e/ifG3aJlgeryqjmhfgJsERZbxd/WJ6aLHD7syJgljY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D7UAC0b7L48KpLvUD05JLaAsirj5ksVOsXi1stFE13QefMe3BmP6nPxON3Mo0UZpz
	 pYKfXI/qMaba/FVlHJKxVM3ngc4OdYRe+zwLiH8lPiHVunTd1vGZE4JslLyaSHOFtA
	 NDq/aTJpoMbYdSoRiei+bUGfdY1WKMZvgp9QEAlDXpRKoquWm73eX1qCZiGGMBYe1T
	 hiQ3jHLOVpXZQHD79GJAWSEroJL2kBM49kyOFkBgl5dVDdL0CYJsH97+jOAjCuwQNI
	 43eqpb0PZO4ccY5QFPslPz5D6ietREw1MwbvaF4Fi7TzHE5XybTPEn7MNZCTmfEzo0
	 KxRGvDecU6Gxg==
Date: Fri, 30 Oct 2026 13:09:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 2/4] dt-bindings: ili9881c: add compatible string for
 Mingjun MJ070BI30IA2
Message-ID: <20261030-nostalgic-eccentric-dodo-0fed47@quoll>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
 <20261030-mj070bi30ia2-v1-2-a0f65b65c290@iscas.ac.cn>
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
In-Reply-To: <20261030-mj070bi30ia2-v1-2-a0f65b65c290@iscas.ac.cn>

On Fri, Oct 30, 2026 at 01:44:13PM +0800, Icenowy Zheng wrote:
> Mingjun MJ070BI30IA2 is the LCD panel used by Sipeed Lichee Console 4A,
> and its initialization sequence seems to match ILI9881C controller.
> 
> Add its compatible string to the ILI9881C binding.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

