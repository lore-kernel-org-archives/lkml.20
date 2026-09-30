Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A013F86EF;
	Wed, 30 Sep 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762393; cv=none; b=aQXngoiIC5bnqwe3PvqA0b3AZEd/n21jgJ5H3+Z2t+s/7VGqU2JNcVSpfmF4XbaDZV+B/DlB75xu1GhWaUyXYMnBuE7wLoEmtdc1RemviuSb5kXR+wj+OJrivC8uyxfeltdWUN/7CNIKi3+ZfjNpP+Yx0MWtW0xnXQ6YNiY8aXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762393; c=relaxed/simple;
	bh=mziF0FXj0213RsOYJ1FBXmK74st/TjYAJy7IhAG4w7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYPnzi4UnIh5H2zYlKFcy4cNZyn6cdOO9RDZCQ9o4C0wxyyEIRPJdY7C/v9L6QEPsSnpJBarDfb0nLZ0qIGEEdPE8ze2QhV9q/gP3XulU630VkjTGfJjwGtW56uwDz77KJzMD1b3yGZevss8pabtIsxQ5xuqyoPDMbo35bDLPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGCu08CW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGCu08CW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1631F000FF;
	Wed, 30 Sep 2026 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762391;
	bh=fcZCpP6kxzypYHCcA9Y6Fe3LYElLJlu/QUBiiAX4hj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QGCu08CWmtyZAgsSl1TpA6dkctpRNZV+QllHJYvd4QS8MUl94IqF7qEqzIWTUU1Le
	 Ub5f1uM90s/YBo0sQ2jKgpDAnVQwU37bZJBdP7yBnFXe4I7m3pQWtauH/KAPOXntoQ
	 e6sC+nF4CrDJWI++BYDBWYPc3+BRJmIaga7Y/jKeEqKi/DErLH9x5SMcCvKQ4lYNZL
	 Dv9dJ7jjxyXz2E9snzDpREL6VA2pfukWkoNWxv4IiFV/Suq9FcdifrZK8f8PTWSXz1
	 za12emyXxvN0ods8cc8s1xVz+ziAwXFLLjTnMtEuzOareEgaGXvkWrt4jKlltIqcCS
	 xclPFzKydafrQ==
Date: Wed, 30 Sep 2026 11:59:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Tim Harvey <tharvey@gateworks.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/8] dt-bindings: embedded-controller: remove
 #address-cells and #size-cells from required
Message-ID: <20260930-light-whippet-of-fruition-faf077@quoll>
References: <20260925-cleanup_dtb_warning-v1-0-f999fafbca60@nxp.com>
 <20260925-cleanup_dtb_warning-v1-2-f999fafbca60@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-cleanup_dtb_warning-v1-2-f999fafbca60@nxp.com>

On Fri, Sep 25, 2026 at 12:37:51PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The "^fan-controller@[0-9a-f]+$" child node is optional, so it is not

Why is it optional? Hardware can be fan-less? This should be the reason
here.

Best regards,
Krzysztof

