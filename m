Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A743AFCF7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843333; cv=none; b=uwItHcpZmP8qeAysEhmVoMfOT7G9Ebe0CH8QyuUCr80yb2YJMu5s71927gGXlyb8daxHcS1je6V4adsec/VQjgguZegUr4Fn2nFuFjSp04Q4BFJpnf+HxCkO4lLLawfTIkdoh6A34x+pUUKmlNC2Y+3a4qZ8ol+j/ZzUG99f1ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843333; c=relaxed/simple;
	bh=NitxRrE7nrVBrmnFCZJDYgc2QEB5feA2IIImzJxxjPo=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=rbJ9b+1ng7UexpD73lIFbpObKrA+TqVANrcgpRXuSLx2CKyhDUpa/8Q6Ekzln6K8CuLVg6Vp16TmY+KIFhaOqijAvP5eBX3qdpJ6NqIgSiV/RR1GeltqR08JuM49oH0JjQ4NNI/S6WBoaESLyV3h5mxIGqeF8gW2LI9BaMIoRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aS3/O4L+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aS3/O4L+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE381F000FF;
	Thu,  1 Oct 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843332;
	bh=jtlnioyZElbz8ugOrc7hlVY7Dm6ti5mP/kZWdCnL0xI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=aS3/O4L+0prg4o9Ac7Pz8qUr0Hvf6tmu2Hz2EpAjfJEV68bRJHJvHUB+i8jk/XuWY
	 p4U1+0dwJqg+Okw0T/5wLUkajLTkA0aKK+971zYluVCI5ISDiV0oDMu7T8SRlTkWsO
	 +ZxmCoDEJf1TtpqpBbasTXa7jNTMz4/LtnVUeXBVMv3ZcMR4y5PrJb6/skmOIjNcxK
	 N+eTUVDTxzPGeZoQXYma/2QIi7hIJ5VwBF+YF4VlsBDktAy73fjTJ+t8LcA70mPrcg
	 39z3KQVbFUPjg1S92GJw7XsyK1KvkAHHjAf2Yi1s9/x6L1iFTxryG61XZUw2IP5D8r
	 VZaFd0S9NlROA==
Message-ID: <f90b5b37f0afda1ebf866a16c1502780@kernel.org>
Date: Thu, 01 Oct 2026 08:28:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 1/2] drm/rockchip: rk3066_hdmi: Convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 1 Oct 2026 11:25:11 +0300, Cristian Ciocaltea wrote:
> Bridge drivers are expected to use devm_drm_bridge_alloc() instead of
> devm_kzalloc() for allocating and partially initializing a private
> driver struct embedding a struct drm_bridge.
> 
> Perform the API conversion and drop the now redundant manual
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
