Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298734;
	b=Tgvg5GUzB9clPqY4AEwwAocO5+BR4kzm7yz8Af5f9QXYwO0W9FOjMn0cqBTgsMeE2/wL
	 oaP0+RCE8EiwST4/vzEZWVeD8rGEj/2vb3LaM7DZhhoEcuCuKQRqfrjxwk6gDlENJkzzN
	 dWc1/6X1GCnUB4EX7iDLbVqxPxBslPSYfwLApoJ1/glGrIWX0KoNT+EhunnVvXK+QfLlR
	 JvtlOGLb9RJA16I/nrDsWUOJezz8ugNfoE/VNnKPUn6/4AemkpEa2cYnYW713lQNB2DpC
	 ZnbE4ItYNYzua/Eeygv3xMA3D8jAKUS79FbcK9bmt2eF98c30whQlgjZ4NmfTCdLDhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298734;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ip1VUC9MnNuE0hONR/E/VP2OIYv8tzluGRt97LQ2g5I=;
	b=uy1XVAuf2+KKxtz2nYsKZs5NHi9hmvffshXwba6TyOxHVI9szvHFfZT2X6xXbJoe1qrj
	 BOCc4N4dprZteWMCfGEQ9mh+adlqVZ5bIdGU+8nJwOe7jPvJI4utODyblfwu7+EzDhT2W
	 hnCG0OdXtSJKRpRZYUXEKRtKpZeLM3c4JVzAKKOmkC8D1uv4kauC0+YT6py5BMviCDrCT
	 PxRy5RydqXb1WVo7+mp05mSs1IdadlenO10AXLu8VsilUMdk1CYPfFBCaxAcfB8zIv3Uv
	 YP7MnEfbfGeTpMHyAAQjUcatRfeIDrNIB2glQLimwcbdsVfy1hDBpMP4KdwpNxaurTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K89tUFv2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458C960A2609;
	Tue, 10 Nov 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K89tUFv2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D861F008A3;
	Tue, 10 Nov 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298733;
	bh=ip1VUC9MnNuE0hONR/E/VP2OIYv8tzluGRt97LQ2g5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K89tUFv2ckrb+9Um9Hu6XQHAItAFc4czB5C78wk3n+s3n3QEJo6ytMiYPqnmI/jgz
	 PbdnxVPt9+QphsuvSJh7l+B+j50421yu40oQ9RM4/FEMN7vAe6Rb160tr4Kl4Zl9BC
	 00L+PF3YgHztdD5XmFjCCYqtsmRAqKgEAQ73AD1PGROta0gZVp0eouXAyZnqfgpzQd
	 P4ikb0wJgOakZwuzYAl9jaYCliCbG07SRFFgEvg5zzkotd3uMn2nToOJOPZJmRWkUw
	 AvkayQLi/c3Xsywl1osMKms9br6O3AQvLB8OLw1i7lOrDL577rcw5HkhZxUkV6jZpT
	 +N7M+7o7ge0ug==
Date: Tue, 10 Nov 2026 09:18:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Suman <gauravsuman007@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: media: i2c: Add Samsung S5KGD1 image
 sensor
Message-ID: <20261110-quantum-magnificent-stingray-67cb4c@quoll>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-5-3d2e7b407516@gmail.com>
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
In-Reply-To: <20261109-sm8150-camera-v1-5-3d2e7b407516@gmail.com>

On Mon, Nov 09, 2026 at 10:38:23PM +0000, Gaurav Suman wrote:
> Add bindings for the Samsung S5KGD1 (ISOCELL GD1) 32MP quad-Bayer
> sensor, used as the front camera of the LG G8x ThinQ.
> 
> This was written and tested with the help of an AI coding assistant
> (Claude Opus 5.5, Anthropic); I reviewed the change and the results.
> 
> Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
> ---
>  .../bindings/media/i2c/samsung,s5kgd1.yaml         | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 

More of AI slop not really reviewed.

Best regards,
Krzysztof

