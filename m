Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564684;
	b=wGG38WRJVck+4y21ddJQbPrSEcjNY69Xpom8/j0DtKmgD2ye+8Qw9h1Lkp4V7Q3CZkV0
	 12fbbu79U8M0/f/dnQNbmsm5I44e2ka2IoNOaJ7pUodEQCOXW53YvPrG2BQCiklQ9cLcg
	 aBFQZlgW9q5WPmcvOXlFTrXBcSFmmXw32bJnoKiwWYtEBsK3mBpwJ5P2I1zFvtR5zRIQe
	 YmqaWqErT+JETDbC+0qzqHmgCD74o226YP7zwC311wp8PAw8dlEa4UXdkUynqaXQpWQD9
	 LIU4WzeB8YLGtB1TFX3N5DeD/sEq0As5c8rT4Mql386qBA8bfrNXt/UpNfQnPrq+UtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564684;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5tNehFBJ33R0z8lfodFC1+DglDViXOEHspTEflqBg3Y=;
	b=xsKEajLO5+Gq4sGNy2suRqcONKoLmhBK/sTPMiw0smDN3k656rcphIyfdBUpv1PJ51nv
	 QiDzyvA2iJQ09iDO6TwqRnWUDhbXtK+joLGA00/YPczcYzjYE0MP1g2ekZHR5/ol8fEo7
	 CKYBzCmk8dgai7lhOKnNb6r29/CloXFha/EQT3/+kpWOaV7oUa3M2LCL4WXp3yfWqY1zQ
	 nSGsTn/74PowzaPIS/tJxoXnhaLGv44FO/luBbQVsRKmireaS9X22gHJwBKBoAVTa77aW
	 DYv4sIMT4IGxn7u1Jkqjb6q1LsMmKHkeHEBAAQyCZvQumQDrMMOVKUY4QMwaZ9ZFT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHMSLTL+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF284606A8AB;
	Fri, 13 Nov 2026 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHMSLTL+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54F61F000C5;
	Fri, 13 Nov 2026 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564683;
	bh=5tNehFBJ33R0z8lfodFC1+DglDViXOEHspTEflqBg3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VHMSLTL+CGbJJ2JqEzecMys5HgjhxI4zl63jUdcIScw8CEURu7pAKKL1RyX+0pAUn
	 nHtX/spyshS/I681BqHx2CfO0LOxpl5WfoSEcXRkitMHawDpl1EKB0BM8F2INP0z+c
	 kfUTsAG48m2826AxPUIw5Lvr+4LDBoQlQklRo9uozv11QOfwwE45jSqInT6dRAcYFa
	 QhWRa6GN8jFY43/lZ1EyGI04P/hLCOe7Uw2oI14YfBzweuRAa1SXxk6q2Ihpj3EjCP
	 lAv3ARVaxLVBKKKA+9hFK7dMIsNC7MMe/tlVPwxrfYfe33dXqwp7Xt9d3gRhBzZSuQ
	 ggRHW+FB1mMgg==
Date: Fri, 13 Nov 2026 11:11:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261113-roaring-relaxed-oryx-5cfa1e@quoll>
References: <20261112163703.3358164-1-lukma@nabladev.com>
 <20261112163703.3358164-2-lukma@nabladev.com>
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
In-Reply-To: <20261112163703.3358164-2-lukma@nabladev.com>

On Thu, Nov 12, 2026 at 05:37:02PM +0100, Lukasz Majewski wrote:
> Add "national,lm77" as compatible for the National (now TI) LM77
> digital I2C temperature sensor.

Are you sure this is a trivial device, not like LM75? No interrupts, no
VS supply? Datasheet disagrees.

Best regards,
Krzysztof

