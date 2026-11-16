Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802349;
	b=Vz0+BSxmIFQ5R291l6YT8yCUTQ3fS4dV22upB3OBCD0xYfwdWscbFj/IbQppZNoy9F55
	 LVDjSnE4j6OnnmTYDqmvb2dJjt4obGkpRnmbeOtUgfZ0oEBL4af0uhFqUi/dgHfpeSjgy
	 xaSi4GMYGI8tOihqT71rlJ/PykeahbRHqApZFMmVD2v7gU6WOUBJmDowbvq+CPJypcDoh
	 UlsKMWwmH3oOCobXxQQxTdFXYODxo6v+F+C4U1O80Fj/aP2Z4U6Re83qy9ANle+9QW4tS
	 c4FqwTNZeT6OUSEtcI90JtKgmSqskNAAgMx+JJl47+sETbkpoNg5KY6BIWGYYu07zaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802349;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NHMGWMgewe8kC7ESdHx6pfUaRaII6jAZvHzMMG3ecVY=;
	b=XUdi5YPoA1O4ZO/1XBCu5YuspDtdnktIM8oNQ7MEEZFR4BJ/scad2icG3nLX0Q/sh/TQ
	 m1LH6WcPLsgFwEoUc6Hfs5U2yT16fGpeNNSYK0vBFzn2gIchX/UL8srcwFVaBsRs17UTc
	 d1cMcxyDx+0BgFtDrydcB5qcw+lR32iAmeMUG1fxKj6uMYp/WgCxMwwua+jeOJNiO3d8A
	 t9zXI9oVGoJuOKwlhOkf4HG/mP5/kqFsOLK0yqk4eFUNTZnnC1zNQuKSJdfOMiw7xBdOH
	 /gclbFWMRPICcc2KjhzGzlNXxmzTpj6ABafUdFv7tf/ZS9C/m6LhG9s3XCMZWTAMieg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWcihlbp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74500606A33A;
	Mon, 16 Nov 2026 04:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWcihlbp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC301F000C4;
	Mon, 16 Nov 2026 04:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802349;
	bh=NHMGWMgewe8kC7ESdHx6pfUaRaII6jAZvHzMMG3ecVY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QWcihlbpgfpt2SpuJ80O42O4m98vSHiyI3tHOEK5h82H6L2fGaVPdwHb1EuhqbxCu
	 K48PXFgTtPpZwIpp+VSYxR6iLzf0gN5mbcTKS18F0mnfDIFrg64xzrwEEsmmVOHlVh
	 N333wOgkynOVOjFdwuHSaU+F/eQ0zyLfpc7L3SZdAt4AaJxTEVyhfmoEtFynZMcQJ2
	 mbzAUxmqhhkPGPifgO9xo120qs0D6XqP8gYoJVG7HQljiRGbdKW/Y4VaSsrGZuLrVA
	 tCxLmJpHPLHYBwgI/CXuEd5R40wirsBqDfav9zgYpvVp3PxNCdNTaNvk2EcgYhlFof
	 zZjEvHSdIObYw==
Subject: Re: [PATCH net-next v5 2/6] dt-bindings: net: xlnx,xxv-ethernet: Add
 Xilinx XXV 10G/25G Ethernet
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:27 +0000
Message-ID: <179480234767.3136.1383853926077576761@kernel.org>
In-Reply-To: <20261114182947.2908628-3-suraj.gupta2@amd.com>
References: <20261114182947.2908628-3-suraj.gupta2@amd.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
  blocks the inherited properties that conflict with its stated design:…

--

dt-bindings: net: xlnx,xxv-ethernet: Add Xilinx XXV 10G/25G Ethernet

This commit adds a dedicated schema for the Xilinx XXV 10G/25G Ethernet
subsystem, which has an in-core PCS/PMA and uses an external AXI DMA or
MCDMA controller. It requires xlnx,rxmem and adds the optional
xlnx,has-statistics-counters property. It also disallows phy-handle, phy,
phy-device and pcs-handle, and restricts managed to in-band-status.

> diff --git a/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml
> new file mode 100644
> index 0000000000000..caf582c72a8dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/xlnx,xxv-ethernet.yaml

[ ... ]

> +  phy-mode:
> +    enum:
> +      - 10gbase-r
> +      - 25gbase-r
> +
> +  # The subsystem has no MDIO bus master and its PCS is in-core, so neither
> +  # an external PHY nor an external PCS can be attached. phy and phy-device
> +  # are the deprecated spellings of phy-handle.
> +  phy-handle: false
> +  phy: false
> +  phy-device: false
> +  pcs-handle: false
> +
> +  managed:
> +    const: in-band-status

[Severity: Low]
Should fixed-link also be set to false here?

fixed-link comes in through the ethernet-controller.yaml $ref in the same
way as the other blocked properties, so unevaluatedProperties: false does
not reject it. ethernet-controller.yaml also does not make fixed-link and
managed mutually exclusive. Its only dependencies entry is pcs-handle-names
requiring pcs-handle.

The commit message and the binding description both say "the link is
always managed in-band". Even so, this schema accepts two configurations
that go against that.

The first is a node with fixed-link alone. In drivers/net/phy/phylink.c,
phylink_parse_mode() checks fixed-link after the in-band default:

	if (pl->config->default_an_inband)
		pl->cfg_link_an_mode = MLO_AN_INBAND;

	dn = fwnode_get_named_child_node(fwnode, "fixed-link");
	if (dn || fwnode_property_present(fwnode, "fixed-link"))
		pl->cfg_link_an_mode = MLO_AN_FIXED;

This overrides the default_an_inband = true that
axienet_xxv_phylink_set_capabilities() sets in the XXV driver patch later
in this series. Carrier would then come from the emulated fixed state, not
from the PCS status that axienet_xxv_pcs_get_state() reads.

The second is a node with fixed-link plus managed = "in-band-status". The
binding allows both properties, but phylink_parse_mode() rejects the
combination:

		if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
			phylink_err(pl,
				    "can't use both fixed-link and in-band-status\n");
			return -EINVAL;
		}

So the device fails to probe from axienet_probe()->phylink_create(), even
though dt_binding_check accepted the node.

Later patches in the series don't change this binding file, so the gap is
still there at the end of the series. Adding "fixed-link: false" next to
the other blocked properties would close it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com
