Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837257;
	b=1O0PRMqqk2sLzUi9imQOa69KptmgmxeA8oSdVeIutJH2SJeI0ZuJ1nQMZfivGYZJQQ4O
	 OAJfshSBO8bzhfl0nKhvwHZpR9PkEQD6q1AsxfTmCoVk3nSw4qs2zodP0MRQ6BQr17DoS
	 WEz+0qidmwVjC3eQ09pKV0+ZV9X17gtKoAtBhaDhIkaqZo2DVnFw2eHmNe74UBFWBRklJ
	 uuckS+G4GOwoit6tbNDMUn+RY+yaZ4keEom6UzoczY5RIzQw69LXVG5e5e/QlIDNq6Hze
	 v2lzaH/4EgLKhmk2IfuU7h2ib/1w4UqUjPVQBZZyjJSSVmVFQIe3vYI0LoTB9qGjF9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837257;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/IkU5tW0YII2MEyQTcF8gz9ioztuqMFX7WFdUsByRRI=;
	b=iQ6t4FRr8bVuMXC0ws+TJCE9CKGHVSmkA8yFm1v5gJkAOXCcy6jRe+X1mRtB862ua/u8
	 hbA57y1AsNSAyZopZXLKJQTPpziH4k68s/rSi6bJbVJaZZJxtvhrashRxH61JwDQlWTlU
	 tyhoRLG0c2JtrCdThOqXnfErP1KI1UoNdFez1B1eAi5mygLAnbN4CFNQeiKYCWj0Yq4Ni
	 4a051yztyKrkaVRn9+16fYU1sKTqhvedvzQLoR/6MySplnsJcQc+a34BouicXbD4saCX0
	 9kHrNMjSg0+eFIneFfyaQcXbbwaJuxplsUHTZUEHdzcCnvlhIlU6YrnZdzw4P4Y5bHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UjKw0yGx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA05606A88B;
	Mon, 16 Nov 2026 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UjKw0yGx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092F91F000C9;
	Mon, 16 Nov 2026 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837256;
	bh=/IkU5tW0YII2MEyQTcF8gz9ioztuqMFX7WFdUsByRRI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UjKw0yGxV5vw0AqGxEO9d8ErsVtalvGoYT9Tw8yCMKwHVui0rcTxUTC7EvkOQEN1f
	 LQ4bkWhN4eAz7l34gpNvlkh+8lOw6P5WPbZqbQUTrJ2Lz8FUXvyVa6KnK0gzWMkWAo
	 UF0OdcnQShhImSWJ50CHnvMfZwt2BLNyNR/OFcBxShaSZSfvcU0mDc5haaHeN5R1ur
	 GQRcy1HL+l6GKRlNKqm8uJQjVo9adafjbLJoj9JV4VcW8mcYv0fvmOZ5e6nFiFxML8
	 ZwZou5fWcR/K83SQp6OrgjD4R0j+F/Ij8nBJbnCC7UCXjCHQL1Niy3FE4srxLThLJ+
	 uggWx/kV/ALxg==
Subject: Re: [PATCH net-next v6 2/7] dt-bindings: net: ftgmac100: Add AST2700
 compatible
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 16 Nov 2026 13:54:15 +0000
Message-ID: <179483725554.3136.8359940788845125105@kernel.org>
In-Reply-To: <20261112-support_ast2700-v6-2-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-2-238020bf46cf@aspeedtech.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In
  Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml,…
- [Medium] dt-bindings: net: ftgmac100: requiring phy-mode on AST2700
  breaks use-ncsi
- [Low] This commit adds a new allOf block (faraday,ftgmac100.yaml lines
  90-97) that makes `phy-mode` mandatory for `aspeed,ast2700-mac`.

--

dt-bindings: net: ftgmac100: Add AST2700 compatible

This commit adds aspeed,ast2700-mac to the FTGMAC100 binding as a
standalone compatible. It extends the resets and clocks conditionals to
cover AST2700, and it makes phy-mode a required property for AST2700.

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index 9d352e3686aaf..613d4f1caa4fa 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -16,6 +16,7 @@ properties:
>        - aspeed,ast2400-mac
>        - aspeed,ast2500-mac
>        - aspeed,ast2600-mac
> +      - aspeed,ast2700-mac
>  
>    reg:
>      maxItems: 1

[Severity: Medium]
An earlier patch in this series ("dt-bindings: net: ftgmac100: Make Aspeed
compatibles standalone") turned properties:compatible into a flat enum.
That enum accepts only a single string:

  compatible:
    enum:
      - faraday,ftgmac100
      - aspeed,ast2400-mac
      - aspeed,ast2500-mac
      - aspeed,ast2600-mac
      - aspeed,ast2700-mac

dt-schema expands this into a list that holds one item. A compatible with
two entries then fails with "is too long".

Do the in-tree Aspeed MAC nodes still validate? At the end of the series
they all still use the two-string form:

arch/arm/boot/dts/aspeed/aspeed-g4.dtsi:
    compatible = "aspeed,ast2400-mac", "faraday,ftgmac100";

arch/arm/boot/dts/aspeed/aspeed-g5.dtsi:
    compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";

arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:
    compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";

No patch in the series updates these nodes. If that is right, dtbs_check
fails for every AST2400/AST2500/AST2600 board.

The binding also seems to contradict itself. This patch extends the
if/contains blocks for resets, phy-mode and clocks. Those blocks are
written for compatible lists with more than one entry, but the top-level
enum never lets such a list validate.

Could the binding use a oneOf that accepts both the standalone form and
the legacy pair of aspeed,*-mac plus faraday,ftgmac100? The other option
is to convert the in-tree DTS files in the same series.

[ ... ]

> @@ -79,12 +80,21 @@ allOf:
>            contains:
>              enum:
>                - aspeed,ast2600-mac
> +              - aspeed,ast2700-mac
>      then:
>        properties:
>          resets: true
>      else:
>        properties:
>          resets: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2700-mac
> +    then:
> +      required:
> +        - phy-mode

[Severity: Medium]
Is phy-mode really mandatory for every AST2700 MAC node? The binding
also documents the use-ncsi boolean. That mode runs the NC-SI stack
over RMII instead of talking to an MDIO PHY. The first example in this
file sets use-ncsi and has no phy-mode property, and that is a valid
setup on the earlier Aspeed parts.

With this rule, an aspeed,ast2700-mac node that uses use-ncsi fails
dtbs_check unless it also carries a redundant phy-mode.

The driver does not seem to need phy-mode in that case either.
ftgmac100_probe_dt() checks use-ncsi first and calls
ftgmac100_probe_ncsi(). That path registers a fixed PHY and connects
it with PHY_INTERFACE_MODE_RMII without ever reading phy-mode.

The commit message says the rule matches the driver's probe-time
requirement. However, the check added later in this series ("net:
ftgmac100: Require phy-mode for AST2700") sits in ftgmac100_mii_probe().
That function only runs for the legacy MDIO bus scan, which happens
only when there is no use-ncsi, fixed-link, phy-handle or mdio child
node. On AST2600 and AST2700 that path returns -ENODEV anyway, because
ftgmac100_setup_mdio() is only called for Faraday, AST2400 and
AST2500.

A binding should also describe hardware constraints rather than what
one version of the Linux driver checks at probe time.

Should the requirement be dropped? Or should it apply only to nodes
without use-ncsi, for example by adding a not/required use-ncsi
condition to the if clause?

[Severity: Low]
Can every AST2700 MAC instance meet this new requirement? The local
phy-mode enum allows only RGMII and RMII modes:

  phy-mode:
    enum:
      - rgmii
      - rgmii-id
      - rgmii-rxid
      - rgmii-txid
      - rmii

AST2700 SoC1 appears to have three MACs. There are three resets
(SCU1_RESET_MAC0/1/2) and three gate clocks (SCU1_CLK_GATE_MAC0CLK,
MAC1CLK and MAC2CLK).

However, there are only two RMII reference clocks (SCU1_CLK_MAC0RCLK and
SCU1_CLK_MAC1RCLK). The only RGMII/RMII pin groups are RGMII0, RGMII1,
RMII0 and RMII1. There is also an SGMII group in
arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi:

	pinctrl_sgmii_default: sgmii-default-state {
		function = "SGMII";
		groups = "SGMII";

This suggests the third MAC supports only SGMII. That is an inference
from the pinctrl, clock and reset headers, not from a datasheet.

If so, a node for that MAC fails validation either way. Without phy-mode
it breaks the new required rule, and phy-mode = "sgmii" is rejected by
the enum.

Should sgmii be allowed for aspeed,ast2700-mac, so the binding describes
every instance of the hardware even before the driver supports SGMII?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-support_ast2700-v6-0-238020bf46cf%40aspeedtech.com
