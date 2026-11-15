Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725066;
	b=sXKpzUp2SGRZe2Iva3E4/Z9Od23KOv9m+L8R8THD5ZYayovFKW0Qoc6GqIYmQf2oeqDJ
	 AkHpoTehbDNphy4aUH6ySXpgh1Yb54HEjrdogfMNjTZMF2FuLffN/vZAeWwO6byVfBLij
	 OQK85rbfP/zFE5y2ZuHeD3gqL0Kzr968n5zySdO5oUGwUXZWWooUd9i+0dHEYfeqwCCgi
	 14UxdcMBqT3+Lill9X4ViLX0xl2e/mtjUJGa4d0+whP3v9W+q1uNBFQf8fIUO86hHzD3R
	 dZVYvYEAw4UNpb6QDMecNIF2iwr4Vr4hh7KF8WRfVaeVS0gsYFWUCu2qXvuk6En6y2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725066;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nZfP+S5UZacNyW+Lf9JcRXg2idiFCnjaG4BODuy49Mo=;
	b=QJch6kJZiqNS6fhoYZwaOIEQz9o98IpAkFUp9IleqLQsyKJzU1Etz7yZq99UMTVIHu9J
	 uQ5prO+6AY1ew+r+py0ie2Z+Da59BUwTM2uLVnMBu67RS0jCdkWnJVkE8DKdHPVjU/vrj
	 VsiApU/PJwUZOXM9T8FHalfVOEhAoIPba//G/6pdti1PQTMd/6M1Bi25SpaBBaF/5UrTh
	 PrVIRKdyoJVaAdvzWapqBqOQhibyWxELFt7/Zu+kkG6luDnXxj0+mrosqUiBpBISdzCjl
	 a4Ib0tUZauF0gWZVYHv/GGyi+aGQ+2IDK3BWUVaPM/nE6nL/kLC62bzZ9hdO9vr0pxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boJmcIrg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D7A606A327;
	Sun, 15 Nov 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=boJmcIrg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3648B1F000C4;
	Sun, 15 Nov 2026 06:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794725065;
	bh=nZfP+S5UZacNyW+Lf9JcRXg2idiFCnjaG4BODuy49Mo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=boJmcIrgMuZOlVs0spqIA5UZzvpKl4wW3bRy70KABKDLroGsF4ZY5K92kiKXVbyWT
	 xKFDEa5K6vgfkR70G7Nuc1uHr5qzkd5uCpCjkZ0M7Z8F6PEDgkz5xAz4hmZ2sbHzQ3
	 woC0sIBQrSCXZWyMTxWMg7K12YPD5vqS+t9akdYrmBhttHVNKdvPkMuyJt7AY2Imtr
	 Cy/hYiW42rh3DBxIgZFf/l0MT17Nw99FcAH28olb3OKK0XnWQ7Ykp7t+N0hMaAdzbM
	 4QKdsaTldiuRd17S0YtvHvwC5Svd7NwUAL82nrvFZzSdTC9p7s2UNznWmEGKoUomLz
	 PIZ0gRNFhrNBw==
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
From: netdev-bot+sashiko@kernel.org
To: joseph@telaak.dev
Cc: florian.fainelli@broadcom.com, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 06:44:24 +0000
Message-ID: <179472506475.2199510.697226978948266850@kernel.org>
In-Reply-To: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new condition in b53_brcm_hdr_setup() calls
  `!dsa_is_cpu_port(ds, B53_CPU_PORT)` (port 8) without checking that…
- [Low] The commit fixes a user-visible bug but has no Fixes: tag.

--

net: dsa: b53: mirror BPDUs to CPU port 5 when port 8 is not a CPU port

On BCM531x5 switches where port 5 is the CPU port and port 8 is not,
this patch uses the ingress mirror to copy frames sent to the bridge
group address from the user ports to port 5. It also refuses tc
mirroring on those boards, because the switch has only one mirror.

> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

[Severity: Low]
Should this commit carry a Fixes: tag?

The notes below the --- line name 8fab459e69ab ("net: dsa: b53: Enable
Broadcom tags for 531x5/539x families"), but those notes are dropped
when the patch is applied.

That commit added the dual-IMP selection for port 5 in
b53_brcm_hdr_setup():

	else if (port == 5)
		hdr_ctl |= GC_FRM_MGMT_PORT_M;

Without the tag, nothing in the applied commit records which kernels
lose BPDUs on these boards.

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index a2a5754c413c6..6b33775c75985 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -797,6 +797,24 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
>  		hdr_ctl |= GC_FRM_MGMT_PORT_M;
>  	b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, hdr_ctl);
>  
> +	/* With port 5 as the CPU port, a BCM531x5 runs in dual-IMP mode and
> +	 * traps BPDUs from LAN ports to port 8. When port 8 is not a CPU
> +	 * port, mirror them to port 5 instead. This takes the switch's only
> +	 * mirror, so tc mirroring is refused.
> +	 */
> +	if (tag_en && port == 5 && is531x5(dev) &&
> +	    !dsa_is_cpu_port(ds, B53_CPU_PORT)) {

[Severity: High]
Can dsa_is_cpu_port(ds, B53_CPU_PORT) dereference a NULL pointer when
port 8 has no dsa_port?

DSA creates dsa_port objects only for indices below ds->num_ports
(dsa_switch_touch_ports()). b53_switch_init() derives that count from
enabled_ports:

	dev->num_ports = fls(dev->enabled_ports);

	dev->ds->num_ports = min_t(unsigned int, dev->num_ports, DSA_MAX_PORTS);

When platform data is supplied (for example, b53_spi_probe() takes it
from spi->dev.platform_data), b53_switch_register() replaces the chip
table mask:

		dev->enabled_ports = dev->pdata->enabled_ports;

Take a BCM531x5 described this way, using port 5 as the CPU port and
with BIT(8) cleared in enabled_ports (for example 0x3f). That leaves
ds->num_ports at 6, and the call chain becomes:

b53_setup()
  b53_enable_cpu_port(dev, 5)
    b53_brcm_hdr_setup(ds, 5)
      dsa_is_cpu_port(ds, 8)
        dsa_to_port(ds, 8)    <- no index 8 on dst->ports, returns NULL
        ->type                <- NULL dereference

dsa_to_port() returns NULL when no port matches, and dsa_is_cpu_port()
uses the result without checking it. Before this patch, b53 did not look
up the dsa_port for B53_CPU_PORT.

Boards probed from DT get the chip table mask, which includes port 8,
so only boards using b53_platform_data can hit this.

Could a missing port 8 count as not a CPU port, so the BPDU mirror is
still installed? Something like:

	(B53_CPU_PORT >= ds->num_ports || !dsa_is_cpu_port(ds, B53_CPU_PORT))

> +		b53_write48(dev, B53_MGMT_PAGE, B53_IG_MIR_MAC,
> +			    ether_addr_to_u64(eth_stp_addr));

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db%40telaak.dev
