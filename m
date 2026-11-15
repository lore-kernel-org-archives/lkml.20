Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760958;
	b=qLFLTQ2129IdCQpUoYIXGrNP0NaUL481n0Flzo9NwiNZ5eOihO6jFpTn2HlGlduY9/e/
	 RwG4Q2mWTakYA1oZ0bd+L0Cdim7FGpbt+UxeNDLU5JyRafTJZUFO1Zaua0Tkm68Ea3IwS
	 S9yqZSmKNTd0aENzZ5WIKw1hnvX1R3JbBLIJFFn0bAoj3uO2NNW7Hxs5KvRefi8vfryUy
	 y61MUTkMW/4NUYl5aNrcCNdonVKdjoEdxNHgsTKRbo+kD8D7A9gO4Rx8ZMJN8F4FM5rcM
	 vVaNN/mF4mhuy+QVUIKjVO9TNtLogCes8pI3urNtGK4ylJypKcdf7THXckfZ2P63j0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760958;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SKT44NERHrbeiUkH8IFwuUOsyFYZL/+SFv7p0N27XuU=;
	b=4jErt6a/D2DWnHvMId9HvskFWT7YqCDdSTsdKeg7JMvaE6c9bFsRiOl6lxMmHypfw7rD
	 YOLiMADEIsEZpcJuJlXdS1qrQ4IqTYEhozUzMx7tMR5Wsoh3iXsjYn2j878HkGGfVCWa1
	 pd9fAg1Ru3UCl8NMcMXeHnK7VHX6QgqimFfNDxanUaz1LmxGTfVTEiyy4ZdOCtMRG+NHQ
	 zCm/NC/5s3Ck0P3Qk8SltNs9IyPVXxd167BLruiEFMEZWKaIbvOh2yENL780jVW+smx0B
	 BRwxnogxq7XP172u7+tOK5Xufcc0PfmcVdtpeLfBqugr3TJZewCz/XlZ2RPaFJi4u8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOdFwUnk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816C606A329;
	Sun, 15 Nov 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOdFwUnk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D2C1F000C7;
	Sun, 15 Nov 2026 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794760958;
	bh=SKT44NERHrbeiUkH8IFwuUOsyFYZL/+SFv7p0N27XuU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eOdFwUnkinp7pD4T0EhYZE5hfW+BRu4bJKbxxvYRX/QFt4ToY8aFl8Mo9rq2xdjcc
	 nPoeud+wPqXQzdOGu1PPAHHdG3NYjQqbxIJdI6eKzG64DSkp5puyrT1PJDsc4mzmiT
	 g9t+tEbuJW7PaetNeKKIZyplOYEzH90ZqU6xYIaAmj4OgNSYnuzyA9eUYVdEglT7yK
	 uwhFVzBHWBkYDoNC1PbW9mv6Wd8eTqQHSopBx90eEEA7LLnnVgzFfpSZaBZCTkwGNV
	 QMA91KF3EUeCVT8iRxtJ132g3bqZJ/5/GOA58A9sAVl0Y5tX5ArIeD2txlb3U4AQc+
	 XjN7qA08bI8vg==
Subject: Re: [PATCH net-next v17 2/4] dt-bindings: net: dsa: add Microchip
 LAN9645x switch
From: netdev-bot+sashiko@kernel.org
To: jensemil.schulzostergaard@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 woojung.huh@microchip.com, linux@armlinux.org.uk,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, edumazet@kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Sun, 15 Nov 2026 16:42:36 +0000
Message-ID: <179476095646.2199510.9931492504412224156@kernel.org>
In-Reply-To: <20261111-dsa_lan9645x_switch_driver_base-v17-2-83a471c5bddb@microchip.com>
References: <20261111-dsa_lan9645x_switch_driver_base-v17-2-83a471c5bddb@microchip.com>
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

- [Low] Rob Herring's Reviewed-by is kept on the binding patch in Documen
  tation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml,…
- [Low] The schema does not actually limit port indexes to 0-8.
- [Low] The binding seems to leave out the register-based extraction
  interrupt.

--

dt-bindings: net: dsa: add Microchip LAN9645x switch

This adds a DT binding for the Microchip LAN9645x DSA switch family. The
SKU variants fall back to microchip,lan96455s-switch. The binding
describes 24 register targets through reg/reg-names, three interrupts and
the per-port RGMII internal delay constraints, and adds the file to
MAINTAINERS.

>     Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
>     Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
>     Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> ---
> Changes in v14:

[ ... ]

> - Describe all switch register targets in reg, and the analyzer and
>   PTP interrupts.

[ ... ]

> Changes in v12:
> - Remove Rob's Reviewed-by

[ ... ]

> - Describe the switch register targets in reg, with a matching reg-names,
>   following mscc,vsc7514-switch.yaml.

[Severity: Low]
Does Rob's Reviewed-by still apply to this version?

In v14, reg/reg-names becomes a fixed, ordered list of 24 targets. v14
also adds new interrupts and interrupt-names properties ("ptp", "ptp-ext",
"ana"). All of this is new DT ABI.

The v12 changelog dropped this tag for a similar reg/reg-names change.
Here the tag sits after the Signed-off-by, which suggests it was carried
over from an earlier posting.

Did Rob review v14? If not, should the tag be dropped so that the new
reg-names order and interrupt-names get DT maintainer review?

> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
> new file mode 100644
> index 0000000000000..517bc4c00de30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
> @@ -0,0 +1,208 @@

[ ... ]

> +  reg:
> +    items:
> +      - description: General configuration block target
> +      - description:
> +          CPU device queue system target, the register based frame injection
> +          and extraction interface

[ ... ]

> +  interrupts:
> +    items:
> +      - description: PTP timestamp ready interrupt
> +      - description: PTP synchronization interrupt from the PTP pins
> +      - description: Analyzer interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: ptp
> +      - const: ptp-ext
> +      - const: ana

[Severity: Low]
Is an interrupt for register-based extraction missing here?

The qs entry in reg is described as "the register based frame injection
and extraction interface". However, interrupts lists only ptp, ptp-ext and
ana, and there is no minItems.

The other bindings for this switch IP family all describe an xtr interrupt
next to the QS block:

  mscc,vsc7514-switch.yaml:      ptp_rdy, xtr, fdma
  microchip,lan966x-switch.yaml: xtr, fdma, ana, ptp, ptp-ext
  microchip,sparx5-switch.yaml:  xtr, fdma, ptp

The commit message names mscc,vsc7514-switch.yaml as the model. The driver
in this series also sets up manual extraction through QS_XTR_GRP_CFG(0) in
lan9645x_port_cpu_init().

If LAN9645x routes an xtr interrupt, how would this binding describe it?
Since the list is fixed, adding it later would need a fourth item plus
minItems: 3. I could not tell from the tree whether the hardware has a
separate xtr line, so this may be fine as it is.

> +  ethernet-ports:
> +    type: object
> +    additionalProperties: true
> +    patternProperties:
> +      "^(ethernet-)?port@[0-8]$":
> +        type: object
> +        description: Ethernet switch ports
> +        additionalProperties: true

[ ... ]

> +$ref: dsa.yaml#/$defs/ethernet-ports

[Severity: Low]
Does this actually limit port indexes to 0-8?

ethernet-ports has additionalProperties: true, so the local pattern only
constrains nodes that match it. The top-level $ref adds the broader
pattern from dsa.yaml:

Documentation/devicetree/bindings/net/dsa/dsa.yaml:
          "^(ethernet-)?port@[0-9a-f]+$":
            description: Ethernet switch ports
            $ref: dsa-port.yaml#
            unevaluatedProperties: false

So nodes such as ethernet-port@9 or ethernet-port@10 pass
dt_binding_check. They also skip the local RGMII rule that limits
rx/tx-internal-delay-ps to [0, 2000].

A DT like that only fails at probe time, in dsa_switch_parse_ports_of():

net/dsa/dsa.c:dsa_switch_parse_ports_of() {
    ...
		if (reg >= ds->num_ports) {
			dev_err(ds->dev, "port %pOF index %u exceeds num_ports (%u)\n",
				port, reg, ds->num_ports);
			of_node_put(port);
			err = -EINVAL;
			goto out_put_node;
    ...
}

renesas,rzn1-a5psw.yaml, which this binding follows, has the same pattern.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-dsa_lan9645x_switch_driver_base-v17-0-83a471c5bddb%40microchip.com
