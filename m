Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B4230D41B;
	Sun, 13 Sep 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292081; cv=none; b=rB80b0nDxA8vX4c4W0wjz6KztzJyouepmSs76MEhwldQV9KzLLIBWJ+j4SgVHDuGMmVmy39IyZrYwH16H/yBSYFwKKaIO9p+SqQKQKlsYO8h6sMRVRhdIc9IyRGPsvWPR9otOrahD+Z8QJipWEUsz466L0QJkK9UnWH8bkOGEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292081; c=relaxed/simple;
	bh=hviGUtohe935IIwAXM49da3usZ4zzBOHBBTribE0Exs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwSLRUYVAFtOe8AhDCJSeNti70Z+LfKUZqgYTkpQ1UoDRY9i4uKh0XFuj2UefvGsS5vMucI9yRbEUfV6gYLhRT1bEKcgzqtPy019oGPKOBE8ofORfGVN5pbc2chmmdA/H7XfsMSUvinS1ivhsER0oF/VDbBaRKqSDCNnUTvLa/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKWXfKUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKWXfKUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEFD1F000FF;
	Sun, 13 Sep 2026 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789292080;
	bh=ZkTfuIMcCGjNXiffCR6iTaAfYv3lmpMxeqnGSOZ/ADE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JKWXfKUmhRrmv3OHeOsoY1pYrxXdt3gq9xGUEmspxOU6/UMPTqkqdAbJFRMOk+1v+
	 FHm0eSVw3YfxWBHFo/ixIle8yqsZSt3GDdhUQkVrrnQk6tBVCRzSisx5KeicNJ6iin
	 agzP6y3CKM+dM1717/BJbYyOKfdjoVK9J9gTVaqPPKAjKzbdwM83rXECNJM3ra0oOh
	 gV9x6diqJRuBuGa1oiIHVc0zDed/bhAkRM+sxklQDdex4uLrZpVLTNkbpSrNzvG5Fs
	 dTze1G4S2/IGjI9KqcZjjpCiI0mx4u2RUIZrb3KXKB6XbYO0wVXZ82NzbfZWBAfpsr
	 cB0lrEt5EiJfA==
Date: Sun, 13 Sep 2026 11:34:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Enzo Frese <freseenzo@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: panel: mipi-dbi-spi: add
 sitronix,st7789v-tft28
Message-ID: <20260913-easygoing-chubby-sidewinder-67beb9@quoll>
References: <20260911203342.76692-1-freseenzo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911203342.76692-1-freseenzo@gmail.com>

On Fri, Sep 11, 2026 at 05:33:42PM -0300, Enzo Frese wrote:
> This is a generic 2.8" 240x320 RGB LCD panel with a MIPI DBI compatible
> SPI interface, based on the Sitronix ST7789V controller. It is commonly
> sold by various resellers without an identifiable original manufacturer
> name printed on the PCB.
> 
> A basic mipi-dbi-cmd[1] script to get the display running looks like
> this:
> 
> $ cat sitronix,st7789v-tft28.txt
> command 0x11
> delay 120
> command 0x3a 0x55
> command 0xb2 0x05 0x05 0x00 0x33 0x33
> command 0xb7 0x75
> command 0xc2 0x01 0xff
> command 0xc3 0x13
> command 0xc4 0x20
> command 0xbb 0x22
> command 0xc5 0x20
> command 0xd0 0xa4 0xa1
> command 0xe0 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x44 0x45 0x0f 0x17 0x16 0x2b 0x33
> command 0xe1 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x43 0x45 0x0f 0x16 0x16 0x2b 0x33
> command 0x36 0x00
> command 0x29
> command 0x21
> 
> $ mipi-dbi-cmd sitronix,st7789v-tft28.bin sitronix,st7789v-tft28.txt
> 
> Tested on a Raspberry Pi 4B using the panel-mipi-dbi driver.
> 
> [1]: https://github.com/notro/panel-mipi-dbi
> 
> Signed-off-by: Enzo Frese <freseenzo@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

So v2 send in a few minutes, with different subject so Patchwork could
not detect that it is v2, thus I spent time there.

Same comments.

Best regards,
Krzysztof

