Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362156;
	b=5Acg93MThZ54FozVx+zGlvTU3u5viDq+NoCld/1xo3UswbfKKJWH4q8A/7y1f2u5otSx
	 MzTUYsbQNAJOD2zQH1Ql1ezd+KhVWOpXARqGjuVfCFJltlLb8wocbbPqBJLoX0tTuLmZk
	 3RxcQaEzn3CYc/H1UoeUFQMNrZuFgzuqOBWvQWrVQYgoA9VNhD/6lTuS3n0NRCSBLhE0n
	 pCVnpQa2kSQvHu23Tyrod1a6YquDkr9QnW292OxzQ3EQVILv1nYHe9myLU8vY6wM6aNIr
	 YH1w7Eb93bu7OixJW6FiDWXE71SOXKNeLVD+gDx/EboE/6iGqOz/f96LsoS6b2JZz4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362156;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e/ifG3aJlgeryqjmhfgJsERZbxd/WJ6aLHD7syJgljY=;
	b=dKbmSY9rqdbt1qJZ/jFm8HYCTd9xntd4LV3zhy3EL5CdlQwh+yztFqop3FsG+mJD/S/l
	 V70NbezGm6sx+ckyPCPWw22jFrJNUE4LC/3f5fHRU2pmxEFCU/rj40AqgxsCoJ6uDwfTi
	 I3/JilqnLXmT05Xe16alSwLPI1TGYT8IWFsEjb6NTE+9P40wOP6q/K0mtFEeRSKLAG/Uw
	 yu5AQzlaNDOxJHIuzMwgmT26R1LwlndBJyftvWdOJwvOgCxo0i9ckUqnOCTrJxh7OMZMW
	 oe4YOl6D15cVv47q3bhBYVUB5iDacCkm+emUSLv/X3IJrz+DDHOtfAsPhQp6i1Xy17Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCXqM3MR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F769606A31D;
	Fri, 30 Oct 2026 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCXqM3MR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CECF1F00A16;
	Fri, 30 Oct 2026 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793362156;
	bh=e/ifG3aJlgeryqjmhfgJsERZbxd/WJ6aLHD7syJgljY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LCXqM3MR/ZIt2paBuHsNpEyJ2YAbBtXoJVoSL2kmhSkpHerihlzO5jP7kg3NpyZNI
	 9dFoxwwuDSGS8TI8OKIgW1Ko2OuX93Eb04SdiMzbYIfLxMK5DeSx9iA4cK4Uzx7I0k
	 R6I2nkE33bjHOZKR0egB5nVDqt0OFelbKFn6DVW418lvJI4B6VsYJ3Na4CejKYfoYp
	 E7LqHQ/Iyj+5nUH1e0c+/Q7iowpmUNhcJqV+7MmbttR3E+rq/duRTVUbXAhMgg9W6U
	 DKds7xr0/3kRf0H42LAryDxgFNcZPOLsTLA6x2IAWCsP2LcMdgQu2SY9ZKRQsehhvk
	 kzCfCDk5DUKJA==
Date: Fri, 30 Oct 2026 13:09:13 +0100
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
Message-ID: <20261030-arrogant-nano-raccoon-b67b70@quoll>
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

