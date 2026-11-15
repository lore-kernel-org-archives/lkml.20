Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773641;
	b=GbWuoIgxD6gowWfnIwMBHte8Cm+a6SogeilmfwFrZ1FYVrDAE8HtxJ46240IXikVDGQ+
	 dvrUZTAIOH+zcv2cnUMZVdIEOkPG0pLsOw+lkZ3CeJ1XHnBKF/TZaKPT4VbpP2Gsi4n85
	 ubCW6DS0LJs7FrYA3C2QBAiYNYiKOssLWWzSvBRVNE9jAuYFnXFuuGHbRKJrrtWIL8Ze8
	 QhcDuijWpUq2Tvd5hIRW8LE3FkBEllyk2f/u65VzSlpDG/HMbLOyu6awDagUYQ0ev64mK
	 UAuyTd5SRf9vytshxzIzDojDnmI6oa1jB67D3iC0iKH9bkqDR/0eFdgJrPbNryJ7DaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773641;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TtL3KqSBk5DVOvfn0ak4MET3pxYYw6bVU6RQLBouPhw=;
	b=Gq4NN6mKbvR4B4IvZh4MaexTzLz8LRZr6BHOmF9a3ee8m6s2591/JkX8+U09/JWRtr2c
	 UbIM8/HwRLAFKTYnCgNKP0Ue5zrdkNFMHg+EndndwVyIzcR7hR7VR5RmCYZh+SFaRRFpi
	 GmkdqwfUUys7INNbZ4etguyAR9dFcssitxHNoeX9p0V9giS13pNJs/xQY3/qj6SNzxtU1
	 FBqX83MxhySA++sDQVg61WvDaXzyGb4w/7U5qS2j/L7/47OBCRHqw6H4MyftJ4+bUAtaB
	 syK5AhyCNmyQhZ+8IKeY1lf0QOde6xvOVj/f4Vg1tXdDe99F2JkkGUT2tYSxhbYIDhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8nshdp+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412B1606A31F;
	Sun, 15 Nov 2026 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8nshdp+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1AF1F000C4;
	Sun, 15 Nov 2026 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773640;
	bh=TtL3KqSBk5DVOvfn0ak4MET3pxYYw6bVU6RQLBouPhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8nshdp+1cTplpWg+u6HgSU7CEFtJe60caolIUkF0dIR2yYAjATUBxxFqtWPOz+oq
	 j6/0Wp5hxIf9CTn6FJZyxJdrJf5RXeqtFUPCsoDFZes3Q3XWqiIqDUo0GMBUHih+ok
	 WJuyL+qnoLFvSpiAFHs+h8uUTGYH6ljAga6S/3lvCukI47sRcq6+M35w9cFBRbCcFu
	 8jfLGZEqs0DvJMzUDvL1O/VoyPUFZGDsTcD6HN7Vpl2/EBP7EpiBL3zBNqHmifNoQ8
	 BW2y+yuz6G1YXZIFa37k6z9N+KVyKB70L+UeXlay6NpXgCUjA1mPBfrRMMWCKGE5jY
	 IFLquyDox7uFw==
Date: Sun, 15 Nov 2026 22:13:54 +0200
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Kendall Willis <k-willis@ti.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, s-kochidanadu@ti.com, a-kaur@ti.com, s-tripathi1@ti.com, 
	vishalm@ti.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: at91-kizbox3-hs: consolidate
 gpio-keys pinctrl
Message-ID: <adyxu4zmj4e4wuzokolhpixrkvigvbx7skddz6rwvpc6yq6nl6@lxo2l7tzxqfg>
References: <20260928-gpio-dt-binding-fix-v1-1-552e4b324a36@ti.com>
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
In-Reply-To: <20260928-gpio-dt-binding-fix-v1-1-552e4b324a36@ti.com>

On Mon, Sep 28, 2026 at 03:33:03PM -0500, Kendall Willis wrote:
> The gpio-keys node had five pinctrl entries (pinctrl-0 through pinctrl-4)
> all mapped to the same state name "default". Merge all phandles into a
> single pinctrl-0 property with one "default" state name. This causes no
> functional change, but is inline with the current kernel style of one
> pinctrl entry per state.
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Applied to at91-dt, thanks!
