Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783698;
	b=gjxnyZa2YbhZotlGmEI/kaOljSuwbJZY3O2ugvd8QLK1PtOYx/KryUTxb7CHiyFEy7Hm
	 Job4Nq71qIzeeimtmNfTJ0Lh6wAunOpchDnBpkMoL3t4g8JhON58lK7e8N/ck77gWl7oX
	 59uA4eMEtvzKs/wXXl4s8GETJzzl45VJzHqXqBv55crBMN8U8zP0REWtvVPeuHomkMsRx
	 FJhwPPoUym1YFXD/GpR5DHQxQFUcTFUCGqdtRfvVLkN9E68Ll1j3GLD8cSXq7m7JGx39s
	 ZX94WnkDNykWFAwFjvocyXBU/CXD5y/A3HUpEIbix+xChmc1Y75WpuLyPsWFp3Ed+KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783698;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IVGnRXoqXBiU7ETbvXoL7R64i/p8KMatzMxEBMeIuV0=;
	b=wPWDNzQTkZf2upS51Bq10PP3HilbXoM+oVhcpfAHIcR4HfolAR3DW0L1+E75HHgcepzo
	 XBq/xR1S40EKnmneajHo9MKCfx+rWCorMUWPLJycLVuj2d+DFZLtG0H3U3ICt079Ue/ke
	 rWHd7yYCCVTnPIBTEvYfKn8zVnFExNaLvi2ovkj8e2yMSlVJI46xUyAlvhAN3UNRiu2ib
	 w+z6MGbfJW7lN4ZgS3JvYLYk1hb7+0suFdoafXCoHYl9VHwjp2mQ+zzgwOovoU7vA5DWK
	 KjfiL8QAijfW+9Zj9cRZ30ymilWZ0oV8lvGJqA53DLqt5yhqUCdP7TxUVPMkUZBBw/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWruc7n7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D7606A88B;
	Sun, 15 Nov 2026 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWruc7n7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA31B1F000CA;
	Sun, 15 Nov 2026 23:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794783698;
	bh=IVGnRXoqXBiU7ETbvXoL7R64i/p8KMatzMxEBMeIuV0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KWruc7n7sYbh5ua3RvNfycysbM5WxTlN0iuAlSD7iob8wTwtgGq2w865X0kicICZ1
	 KXiqGMlhoCMlW4dbqiZjSERc9Dp9uo/T0+Q+4RfIsWXKwYMCmasEBNpTkQOjlKcdTB
	 u2W6IWq+Tzp8hPCScypnp48LYy9RAGdJ2rMrPhRwtpP95JHlh4Pt3F2MhwFSh8MQui
	 saGJL5KcVnBi61zup90PZobWcMPZEua7jK0ggtYX1Htd5HbIVqmsvbCsRp225Sbovt
	 DlnKwsfPu22o3YblNKpb+6Ib4v5sDdCNXdBMBu1xt9vcb9ExWb1ZL6y7ax4cKh9/U2
	 WMeeXhanq2Mbw==
Subject: Re: [PATCH net-next v2 08/10] net: dsa: realtek: rtl8365mb: program
 the PCP of untagged frames
From: netdev-bot+sashiko@kernel.org
To: o.rempel@pengutronix.de
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linusw@kernel.org, luizluca@gmail.com,
 alvin.sipraga@analog.com, andrew@lunn.ch, olteanv@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
Date: Sun, 15 Nov 2026 23:01:37 +0000
Message-ID: <179478369746.3136.10805769576309531848@kernel.org>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
References: <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rtl8365mb_qos_set_port_prio()
  (drivers/net/dsa/realtek/rtl8365mb_qos.c) now does two separate…

--

net: dsa: realtek: rtl8365mb: program the PCP of untagged frames

With this patch, setting the port default priority also programs the PCP
the switch gives to untagged frames. Under PCP trust, that value decides
how untagged frames are classified. It is also what the switch writes into
the tag it adds on egress.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
> index 378cd6ed7fe64..2a849d0e4898a 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c

[ ... ]

> @@ -192,6 +201,13 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio)
>  	if (ret)
>  		return ret;
>  
> +	ret = rtl8365mb_qos_regmap_update_field(priv,
> +						RTL8365MB_QOS_PORT_UNTAG_PCP_REG(port),
> +						rtl8365mb_qos_sel_mask(port),
> +						untag_pcp);
> +	if (ret)
> +		return ret;
> +
>  	return rtl8365mb_qos_regmap_update_field(priv,
>  						 RTL8365MB_QOS_PORT_PRI_REG(port),
>  						 rtl8365mb_qos_sel_mask(port),

[Severity: Medium]
What happens to the untagged PCP field if the second write fails?

In rtl8365mb_qos_set_port_prio(), the UNTAG_PCP write goes to the hardware
before the PORT_PRI write. If the PORT_PRI regmap_update_bits() then fails,
for example with an SMI ACK timeout from realtek_smi_wait_for_ack() or a
bus->write() error in realtek_mdio_write(), the error is returned. The
untagged PCP is not restored.

On that error, the DSA core rolls back the software state:

net/dsa/user.c:dsa_user_dcbnl_set_default_prio() {
    ...
	err = ds->ops->port_set_default_prio(ds, port, new_prio);
	if (err) {
		dcb_ieee_delapp(dev, app);
		return err;
	}
    ...
}

dsa_user_dcbnl_del_default_prio() does the same with dcb_ieee_setapp().

After that, dcbnl reports the old default priority. So does
rtl83xx_port_get_default_prio(), because rtl8365mb_qos_get_port_prio()
reads back only RTL8365MB_QOS_PORT_PRI_REG. The switch, however, keeps
using the new untagged PCP: it tags untagged frames on egress with it and,
with PCP trust enabled, classifies them by it.

Could this leave untagged frames tagged and classified by a priority whose
request failed, with no way for software to see it, until a later set
succeeds?

Elsewhere the series avoids this kind of state. For example,
rtl8365mb_qos_set_apptrust() batches its writes "so a failed write cannot
leave the trusted table half programmed". Would it make sense to restore
the previous untagged PCP when the PORT_PRI write fails, or to order the
writes so that a failure cannot leave the two fields out of step?

The code is still the same at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99%40pengutronix.de
