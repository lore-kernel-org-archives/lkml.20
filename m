Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3393EB11C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875683; cv=none; b=NfcDmgeexhF5O6FuDPjlb+XDGtW+NA618pkWr8M0DcY1fIHZBlPvt7718emByna2gkuLaQeJaMq7CmQuyP2/LLEeidTUogqvp1r3uMOfOLCtqJkuDH6OcS3G2+m2dcbVyURiBXzNhUFqTOFLLSufuI145HSGn9cBsE/mxkeHL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875683; c=relaxed/simple;
	bh=cXTuVa3KGjH8lyOe0ao4EW5q0wlCixpiZlI7i4j48U4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EtZtlcmiXkdc6PX66Ix9Xktjfq6U7HJy0kBORrVYGxHfPANzBEb1ieQ1GLFx7SzKhq7k6TjtscXhCKwj/149wiIjIK25uC/yDLGbQnHU8ekHT6VrJrcgzBe1fXRAPnMmK3mZlehO65hHs6hNN6antdil6MKp8SFPaT5e9frPwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bk8fI6Nn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bk8fI6Nn"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso1974561f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791875679; x=1792480479; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/3uZKTyrNaRvsXwszDYWZ0D2uuc7O2dM/xJ/2Buikg=;
        b=Bk8fI6NncvVLBjXXXxFmxyBnmtq+i7ERE6tKWEMKRR0oGSc+H7TrU9BxN/qzyRrDm3
         hqTpFiqdTqnrzn+T/4L0zfkzFFOSgSltMbQkRk19KWrq78v/X6RqlUHYXIJia5BnpsP9
         njM9nEWdPQXoyymKcXuXeaALmaubAr9X79CofOrkrXOTEMIxWATxozSsa3hfQz82vFCD
         VRrI+Waayr7TAngKYOnORh2HQB4oqzbqGwlBugpkm4atJEZMsxm8iThfpbwXaC3YI5oW
         N9u8CFhOOTlwWLHz3XKUObSQN+mGM+yNRnaJihZWd5mApwcHwDOlgnJAENgdu0/lMT8p
         vt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875679; x=1792480479;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/3uZKTyrNaRvsXwszDYWZ0D2uuc7O2dM/xJ/2Buikg=;
        b=dNHB1tRRoTYhR2gl+sEbaD5k1M+uctyn+ReeZwKeF86QUhkbEik4Uq5qXjcsArwRoj
         04tyBGPR+svl1LO1m0KccJQlPAhz0J4UeZ/Hn7IP9zDMTu5BdQ1DYQ8W/cff7pPFDS5Q
         pQnBR2PduBiMLI4yaHRYjCEh5RNpBz1wDsBmit8V/guj9L/aVlFPtpWSqqDSe+rCUJxp
         uR/3y/2MeBh6F6OmABCCV03286nTUC9TfwASZEWuPwEfGfL88vuj3RYP8Id5o8N0XHVt
         bIFdnGdySBazt187yg8IR8Ln9+/AlU63qc6ZbrSfs4pzQfx6Yst+FDT/uzWZu1FdDYvX
         jxLA==
X-Forwarded-Encrypted: i=1; AKwUvBzjIxoCsgqFN/5USMiwgTjmMzL3vaQNLBh/wz/R0L/TMZKZVoDiIeyLIiNL3MOj1XZonDPr1uwlUPzYgEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIqcdDfPdoDZxolwf5RUdKH4dup5xVXIGxwgn3Hsk1vb/NfIXG
	oiEDcB0r2P5M1AcqzfOgyKdbvQDFjKYWTNvQdSme7q2+8W8EXEDdPCNf7QOAc4SzHpU=
X-Gm-Gg: AYBFou0WWZJpQjdhLQ+3zdkWVz7CeTTIQTWF5kuuS0J+Z9PEXKFBMgRi2g9Sbv3kBsS
	5yXE4nulSSHsZavDM0x04Jbp5z2HNg7BhVloyrhX52qtiZ82CVNd7tb+Kfx2l8RUuHFxfEqzAkG
	2gk9wPNFyqLWmUZ+hI00HeJ16Xt9ID/Q7zH5axpdIwVrjcDamptZ9gtr49W/eeyPjYRFbk6cCxD
	gB94sFjCuO+zD6p2huBAO2My3pL3Tcuymd5pCGYDth+E41XozaHvC8QSDjrt+X+sE2ttiBmUkhg
	M8UGFKXtq4UpByG1QtxFNJlCuwBrycnkoGlT+eiXyL2mNpmn3aRGH7FgB4W9VBljEUvAwMrc1fs
	Yx5NVBvRm2rcjj5wP6ekMFN3J3iQFUuGuatTfHn3F5/QMxsLkN6NvlQlwWd5ONSML+VHVfmGkI/
	usY5+kXLdcWBL2WqPmLIAnMRAuSgsKw76wbLLTsqu2IwI+AMNPep7uL5xJiRIyyzMCLEr+8dSWk
	1jY14L4gSZ1etzfzg==
X-Received: by 2002:a5d:5846:0:b0:48b:180:b900 with SMTP id ffacd0b85a97d-48dbaadb302mr21043691f8f.16.1791875679329;
        Tue, 13 Oct 2026 00:14:39 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm3925157f8f.30.2026.10.13.00.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:14:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
In-Reply-To: <20261010105900.247342-9-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
Date: Tue, 13 Oct 2026 09:14:38 +0200
Message-ID: <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 10 oct. 2026 at 11:59, Lucas Tanure <tanure@linux.com> wrote:

> The informative section explains in prose how phy-mode, the delay
> properties in the MAC node and the mode handed to the PHY fit together,
> and says itself that developers often get this wrong. A reader has to
> work through several paragraphs before answering the one question they
> usually have: for this phy-mode and these properties, which part adds
> which delay.
>
> Add a table that answers it at a glance, with one row for every
> combination the properties allow.
>
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 1bafd687dcb1..bba27a9feb61 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -339,6 +339,24 @@ additionalProperties: true
>  # has added. Failure to remove the delay will result in a
>  # non-functioning link.
>  #
> +# Put together, with the two properties in the MAC node, this is who
> +# adds each delay:
> +#
> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
> +#   rgmii       -                     -                     PCB trace   PCB trace
> +#   rgmii-id    -                     -                     PHY         PHY
> +#   rgmii-id    present               -                     MAC         PHY
> +#   rgmii-id    -                     present               PHY         MAC
> +#   rgmii-id    present               present               MAC         MAC
> +#   rgmii-txid  -                     -                     PHY         PCB trace
> +#   rgmii-txid  present               -                     MAC         PCB trace
> +#   rgmii-rxid  -                     -                     PCB trace   PHY
> +#   rgmii-rxid  -                     present               PCB trace   MAC
> +#

That would match how the HW is working on the A733 Allwinner too but I'm
not entirely sure this is what Andrew had in mind from our previous
discussion [1]. Adding him to the thread

[1]: https://lore.kernel.org/linux-sunxi/491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch/

> +# A property for a clock the PCB already delays is not in this table.
> +# It is either the fine tuning described next, or a mistake the MAC
> +# should report as a fatal error.
> +#
>  # Sometimes there is a need to fine tune the delays. Often the MAC or
>  # PHY can perform this fine tuning. In the MAC node, the Device Tree
>  # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> -- 
> 2.56.0
>

-- 
Jerome
