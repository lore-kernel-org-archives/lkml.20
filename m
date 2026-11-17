Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934743;
	b=Scm0a4FyXe70AZz071LYTXnehGpoXwarmDu4yTgOk4IFAm8WPOjJ5kYKAzRQ0tcdh3ci
	 Wt787xBAbM16Y6o+vfU/ABa+rR5Stux7yT1al4/6iviPusk2z0ujLRB46ZhUD31GKRXCP
	 GbrbF1AkjkcctD4c41sY2TrsYVCFRD6Nq+20vHWddL5icaZDEGEz0kpAVAmlDQfsUP5B5
	 V2zDKW72wg6brQRkaS+UrgQBoMVbyHY6fLa2vsEgP4/lGCQVRk+sbh0jZnovEOBWz+uIi
	 5f2I0W3D9tMsYYfJjSWKUObR1odBgiX893UWgalkTxAaY+7wT0Jlj3VfyA4+ME6RYLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934743;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/sExmZ117jhWvHZ7v1Er7gDQc9fAtZqbDp3VfinKnpY=;
	b=l7KTaOwDk98HwqKeldiKoc+8BYQrYXWGVPxHFDwYne1LgSilMxTkVm5g4K2VDRS0v+oJ
	 jieAi5WDg5OoeOVKqrcWpbtvQHYFCrenPZU4R1mze8e9lUmdsjzep6t6dyR9a7BLxXRcC
	 +7ElsSUf4sLYCN9ed3UbzGdTydABwIThDl5ewoNooeWvTOiD+h6+XO08COqyxFiW/myIc
	 QGOy9gQQrxy3n75PKO8gC/+W29YTJrcaKp89/5DdiWlPsEMqtb1dwhOA+e2q8yyBVmutA
	 1/rw6fI+wq3PSI+O/R3oN5v/tvLKCCYkLXoZoleOXy+eAtzUOWuNXr7OyKooHM9cHDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FboX1a6j;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C148D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C148D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FboX1a6j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 511071A167C;
	Tue, 17 Nov 2026 16:59:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 165B55FDAD;
	Tue, 17 Nov 2026 16:59:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CE8411BC0067;
	Tue, 17 Nov 2026 17:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794934735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/sExmZ117jhWvHZ7v1Er7gDQc9fAtZqbDp3VfinKnpY=;
	b=FboX1a6jpgdrVKL/ht3sgG7t6f0D8SfPrcwbol6vq5wDpxPQY7SoQdJDc3YVK2fNTVju/G
	VCMTCUrTZfxjETxJRDUXpar/89Z8mFGrpJi5ht9qzSD5TUPQgoEORfBXq0UCJINqZYtda+
	Qm/AUiI60CfwXcDYhNzeWUSFjfYWcOZ5TmAfd+2+1/GquSDcIuEp/Te1WPwZnwlKT6dNoh
	6D5P8DyLWLhzN4vM1BzzVLQpmwQCcrKLQ5m+IkUeZQpCt3/oRNYJG2sUhGEWZkPSJoUayx
	nOin4yeYWx6FgE4wEe6ghfBlRh8DAnmJklmdQHaMPjDOOZLsIIJIpYXmzi95WQ==
Message-ID: <3bb32808-2c16-4bee-a593-4e7d10dd34b4@bootlin.com>
Date: Tue, 17 Nov 2026 17:58:49 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20261113121852.334604-1-tanure@linux.com>
 <20261113121852.334604-5-tanure@linux.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/13/26 13:18, Lucas Tanure wrote:
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
> 
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

