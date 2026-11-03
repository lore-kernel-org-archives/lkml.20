Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704515;
	b=krufuuxUVKta2QHClFa9Dki/rjLVUW5EfLO1YhaDe0HGPoz7CpX6JYtjrEqN7bkjex8g
	 QgtUytqZ5zOZt6mVRMSfIVUoTy7Z5xba434Thue9/NH1QutG4wb2d4/YFDUpwgiQaN+r0
	 oaLSDyHVzq2eeV4d0QLLy2f9WQJONjnwqn3fqaHlBnDkqcolwiP8Oh2x2cBuRRcU3UW7T
	 sTe6wJC/haMD13Dg10Epiooi9IJ4JOaYXdqEA67h1RnM6Y8DoU4k4J79Fz1oNgdiGoxjK
	 Un2H0AdrKZWQRzTsXC25EZK9oFX8z8n5859mT38shpRybiYJu6H/CzFN+jDK3ezoIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704515;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o+P6q3DZzJVDgAtxOxsBNiFQ77g8/YvF2QELBdxcJZk=;
	b=jGymK1exdNc/1DhNfzxp5Aigix+2wUpeekpTO7ehIFv2dt0T6tMF8cprhOi43pDOo3aB
	 M1j8GdCa1F6Zp2oAC2KMfLMjBl3TgeyEGgq7zrlaQ5MNbmeO31aXXVixEXlP71geyH5N7
	 TKsbSj0xzxFCEt+2GUJGFgE3d2JbnhaB22W90uR21mvZoDD6szMCfVyw6y6OGf/GQk03J
	 hQLUOB9jYYxfbRG+yYEKFaBoPvdsrj2hE6XTJ8Nir7AJxTnqel87+NUKnZNzfHAXcH0fv
	 kObZU8G9OAUec+Zr+8doDJjvoJbHLk1iXW6R5VZuGZ+a7hvrQEjlCT49C0wgTWt4Stw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwGIH3ua;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA50606B11A;
	Tue,  3 Nov 2026 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwGIH3ua
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B77F1F00919;
	Tue,  3 Nov 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704514;
	bh=o+P6q3DZzJVDgAtxOxsBNiFQ77g8/YvF2QELBdxcJZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cwGIH3ua3/gX2aX0cyytE+vXc3lCWe1q3aM52HqhDeaorXpPMV2UxKffYso22rqyv
	 bJbe/Ldz3OmMWfkZw7F/sT4HzeWtRN8gEYLKH5MBD6dXE4eykygI+sKo3b0EZ1+qHv
	 QWqLbCmtvbKtV1+qv9cogfmhM5Eo/OCLZagDrtGmpZlkOJ+yBZ/GK4tYcHxKUVVUWe
	 L03yV20n4ka8ZfOhGk8JZRnYR6+5bnQ0OoQ7iSC7KrSntOXjQnUfrZlGiuWXiT8PEj
	 Fu28TbQ6Qrs1kImtHaR3dnISWsdUl+wdKcMMxoAecU/o3DH+FUvLi3PQ3T1DThlMih
	 /LPgp3EUYcnRQ==
Date: Tue, 3 Nov 2026 12:15:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Dave Jones <s.dave.jones@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/6] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3568
Message-ID: <20261103-therapeutic-ostrich-of-romance-b29fc9@quoll>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
 <20261030064905.2248999-2-damon.ding@rock-chips.com>
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
In-Reply-To: <20261030064905.2248999-2-damon.ding@rock-chips.com>

On Fri, Oct 30, 2026 at 02:49:00PM +0800, Damon Ding wrote:
> Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
> the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
> resets, but unlike them it does not use GRF registers, so make the
> "rockchip,grf" property conditional on the SoC.
> 
> Also document the avdd-0v9 and avdd-1v8 supplies, which are needed by
> the RK3568 eDP controller.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

