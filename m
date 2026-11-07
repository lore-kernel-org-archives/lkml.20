Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060009;
	b=19PEm7zHJsm5PBncnpgA6rm2ZwORP4KkaOhui6ukKFT6GjHd97viuDw+3s+F7nEwJnaD
	 S8N55BWUpKmdfAw/NLI1UA1facKxa2hIvccrhMScXwDrA8ItQW90MgaxFAL7Q27Z4PbZW
	 F/+zrT0ZhSqsaojesV5RD1U3PQrK9WplIRm+Ch8C8kbqIinPsIs5XXzz9YjrN5lFHDBnO
	 9RT56mhRGY0oKc39H0ee6sHuAsBCe0/4ygQWeREfNKWbKLjFaDh49ZLSgjwCukst58iT+
	 z0v332FscyFFT3SEJLdyvUxQ226XHGA58qkkgbNVkWhUEk4SjvGRIhP7R78wS5QAJOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060009;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WXcTlxWH4qnX8oi9ZX69BAlVnoTYRMBFIYfdkKu3cX4=;
	b=VcgP8kB+XozrP9q2wfFLHKA0boOP99H3oxv/XCfnIgEueGWdFKjMptkT08AThXJlFwUL
	 ZjtgyFgwdFEM4Mg459Dod3D6kByJw05sBC8zS3k5oXju98HOlXHE1O3ytHZdCD1oLkDoj
	 OdvVoK0lswG+ZJyzeIeEznFkMHz3IIdMY9hJahlstSamXGqDNVd65BMn33FQhwuMkbfjr
	 +CWUVwt4qQ9VrD50Tlh1gKoQ1eMJdENl1a40/EjwOzW76W3bIAIp+2CmtaRUdLkpajrUE
	 XBG+us3slPC/y2z3tKa6ScyZSgw9ySbuTOquTy8nHVikPmw1iinTqL/V9F8je5jazng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Gg2YvsR3;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F82E606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F82E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Gg2YvsR3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WXcT
	lxWH4qnX8oi9ZX69BAlVnoTYRMBFIYfdkKu3cX4=; b=Gg2YvsR33DGzJN72X8qy
	CNy30T0OsdlC2V3QdKzLrxWCZxrgLQ3WXmpjul/Jp/9UjYgiupHoOxGuSFh2q+y4
	r85SE3TLVp4BroH+vipZ4z4ZYYyrnaAm5nW6uFGjt72OpMhIrdhcg5xAO+kqafxd
	KIr5rHlZ7l0w4PPpDvC/2IJZaB+k8ihGX5iNmSWu42B+PHin7lPFkr7R5cR+20dY
	JuhBuw9Q7xSbk8YYUgT0JqTQlMf0rJxD8UGoGomUxj4gk0wHphw+OvoEFWwmbRrp
	QP8b0tHkfIvV/y85LV7TQ8JfJbIOnWKKYqZGKMnnJLcT5S6ffYUb+o+I8v9lOEO2
	6g==
Received: (qmail 2523875 invoked from network); 7 Nov 2026 15:00:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:00:01 +0100
X-UD-Smtp-Session: l3s3148p1@i+zUJLBfUdQFFu4k
Date: Sat, 7 Nov 2026 15:59:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: apple,i2c: Add t8140-i2c compatible
Message-ID: <au8u3Ndnx3v6RV6p@shikoro>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
 <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-3-6c757966a99e@cyberchaos.dev>
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
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-3-6c757966a99e@cyberchaos.dev>

On Mon, Oct 12, 2026 at 01:52:34PM +0200, Yureka Lilian wrote:
> The i2c block on the Apple Silicon T8140 (A18 Pro) SoC is compatible
> with t8103. Add "apple,t8140-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Andi, since there is no driver change associated, I guess it is easier
if this goes via the apple tree?

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

