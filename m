Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700565;
	b=Is+cBuZJ9IkJ7hgFOYk14PfVvwUPoAPrHFSfNQxXhHdwcZ5aD2bXsKuCDBqN0NinKH6r
	 TTN7ZWOeEaOyh8KKx5APKCNQXXvo7t+XGZdQD02Sgn9L6B+HAdAP7/VSSDu8RYO5cnT1z
	 XThO6u1CLw2FDc/lyyepu8cThYB7r/3VL2xV8Nqk8VsPNxkge/T0zV5Ty5YTqWG+FEkpm
	 vKlqA00uiF9ervKlYT+SQJ/DgRu+QSpCgLWB4wU4RE6fM6pL3mvN7VK+Zy3Xxmqc1fiUL
	 fFRb9nrTxONFPDCLbkXuMLdjsVRLcArieieUE+XpRYnSpMe6dhtb5he7T5fw0pHokQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700565;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YEXoGF/IDM5Kwcu5RSHR6PL4LC33xulQf2BLi/eKlAw=;
	b=m9VqgGnq7gY2dCSP/0Vvi4ORHWcIJHnljupUnuHUkbn4z1zEe2aaj3SQKovSThGDAq+c
	 yOgI082K+7KlwPoUairySIkiyGZh9FWrQ+P7jnSAwJetjcWQzBRHTsxGGBkeg3WlBd4yn
	 rAXWPQq9rGzJofn3HUpIpZyXDReoAudmOcBjqEW1fE/xNsnXTnpcpwLcicOK/BWy/RuJd
	 PYWKf9hQqy30sleOfr+WkPgcP3t2FUyM8TflsiEGAm8OyXXT8oGd3/lJTdEvIy+mNVFSC
	 II4Onmy9TJQE8P/JTcrYlUz+g6ndB7csqgykIMUHJfhN70I/jpko/s//+OgiOdci1qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FEC606A323;
	Sat, 14 Nov 2026 23:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FEC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSNaz-00000000811-2Dg5;
	Sat, 14 Nov 2026 23:55:45 +0000
Date: Sat, 14 Nov 2026 23:55:32 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Message-ID: <avj09DS5ZHCbMt_Y@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
 <90878fc566a9752eb582a82d1324d811ebb324e7.1794654074.git.daniel@makrotopia.org>
 <b4d6cc36-e986-41ce-a887-d7d9076cabd4@kernel.org>
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
In-Reply-To: <b4d6cc36-e986-41ce-a887-d7d9076cabd4@kernel.org>

On Sat, Nov 14, 2026 at 06:57:46PM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2026 12:09, Daniel Golle wrote:
> > From: Christian Hewitt <christianshewitt@gmail.com>
> > 
> > The video decoder in RK356X (vdpu346) is described in the same way as
> > the one in RK3588 (vdpu381). A new compatible is added as the decoder
> > capabilities are a subset of the vdpu381 capabilities.
> > 
> > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> > Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz64-A, NanoPi R5S
> 
> How v1 could get it?
> 
> Anyway, drop, not applicable here. You cannot test a binding on PineTab2.

This patch was previously posted (see cover letter) and received a
whoole-series Tested-by. It's true that for DT bindings that doesn't
make much sense, I just mechanically copied the tag to the patches
which have previosly been submitted and weren't changed.

