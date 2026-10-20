Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484833;
	b=MqXKvekiAJG8V1wGuTwr/TldcJcVwXwiHW2jmzFHktRe/G6c/QITJF4mRH5TGMPfPdQ/
	 Oi1QXOWGPEKZva+VvQ0QEV4mlTASmL47Y3hAMlDtcEMKQyEplME4Gb8jtI/zVE2eM0RUu
	 J9WiKNjB6H+7dN6yzgYcFbg9QWZGw2foAT7ZsmwqT3dPO4jxJo6j8RlRTWjrhq0WL/wqT
	 A30USIhqasauYJpyhURqhPr3CnJNBu4P9S3dUXDyOJ8SIWgaAjOx2Wf70NA8dyjWtIII3
	 AOhKT7Xkw+MCSa7ineivHWMSawLvHA2rQ9g/HlWYEaCuyNkF/a0hwssNX/AcS+c7Grw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484833;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HScs7BYx1mULjt0N93TtDjLfdWYun+9YwohQQd+Ha1A=;
	b=LdIF+9k66muWGdU91kvSaBqlfYNRFtKBdttlwqa6FMjfhokSsZwjfyF1XxRs3xDW7aUJ
	 FatABdw8L3O/HbSgqraSjG8pNwkni2FHwUZTt3L2oBqMhGrxHcG1oSGbppxuw/bAyBOb3
	 7anGSO7VK5Vy5vdGpxaCR/dgDgBE89mWfQqcQYvgUcSTh7MrCACyzdfCqVx8I2Z4OYV/y
	 lcHG3BRypFyg7doj5hyjix+Dje0GmtjNAd86bQhihM740WcpdVDMwOT6/z5l4nalYQ/UE
	 JKr8Wr18yvgQD5xnhbkg37xRJeJHBOL78ruEWtMHe7mPaX5cloE5SviRed9nVPEQvoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2CCbtUi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB060A262F;
	Tue, 20 Oct 2026 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2CCbtUi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B961F000C6;
	Tue, 20 Oct 2026 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484832;
	bh=HScs7BYx1mULjt0N93TtDjLfdWYun+9YwohQQd+Ha1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2CCbtUiS6mzs6xjxsGIOSC7JI3lMdplrD1JhTGT6c5i6kXVAdHaDC7KLDhHJbK24
	 TwDLmwS1ibDNk314tE7l8Kw3wiSTTNzqxuXgzaZRb5Op7/KjtyIdD64/61K+2apOlG
	 AJzDV/aLf9sIWbQl3fJ3eoByAbpiULqVEgGb8yE7QKUNL+WLBRIIN/G5SRm8z8bgLT
	 q+TyF4/TUAsQ8/Ydu1F2XNxbr1Fz55CGLuJKAd7ct0lBayHj2cNWV4f8d2xgXoWgTU
	 XuiPUwsGyPjN0+42kn7fjGJZK2JcB1Z8imZONPclbsmvz7xF6oqS75++KQC+qPb0vl
	 qNuQ4ON/cf2ww==
Date: Tue, 20 Oct 2026 10:27:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: i2c: Add ST VD55G0 camera sensor
Message-ID: <20261020-cute-peccary-of-attack-2376af@quoll>
References: <20261019162722.25587-1-lsa.uz@pm.me>
 <20261019162722.25587-2-lsa.uz@pm.me>
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
In-Reply-To: <20261019162722.25587-2-lsa.uz@pm.me>

On Mon, Oct 19, 2026 at 04:27:38PM +0000, Sergey Lebedev wrote:
> The VD55G0 is a monochrome global shutter sensor with a 644x604 active
> array, sending over a single MIPI CSI-2 lane.
> 
> Merged from ST's own binding in STMicroelectronics/vd55g0-linux-driver,
> which gives the supply voltages, and st,vd55g1.yaml, whose conventions and
> property list it follows. ST's st,out-sync and st,in-sync are left out, as
> in vd55g1. Link frequencies run from 375 to 600 MHz, for the sensor's MIPI
> rate of 750 to 1200 Mbps (UM2829, 13.1).
> 
> Co-developed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> The properties follow st,vd55g1.yaml nearly line for line. If a
> compatible in that file is preferred, with an if/then for the
> link-frequency minimum, I can fold it in there.


https://lore.kernel.org/all/20260902204549.657228-3-pm@petermarshall.ca/

Best regards,
Krzysztof

