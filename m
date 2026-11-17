Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920371;
	b=zB1MUWmdwXJYT+sFSqluBaE/u/FEPySQw9XZ5HbfQG/+GxTABniSEQIPYrnQVczbjBxV
	 8/E+IuJvxD5n8lOXDEj65c9jt/ogFSnpjtta+0GAtcv7HOXDA8+X2c1X0yuEMQ88S6Q9s
	 WYpGwGCOMRZfydPrtipGNDGhvfUZ9HyOs1nPc5gNJ/zfbQap78GJJhN2vecujp4+bBOdE
	 D+qNdUv1gNPubr0I45YWNWHgr3oLW55AOhCZsSDsmoxvKHhhXfRKkM/Fdplpt/rL67bfv
	 upaxUZo5eOGK3EGc8QMf2Vbm0pNqVszRXH5+38DQtENu+PWsTqk0g2o4DWDTJfxQd1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920371;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=piP94jKN252X9YpSbK8yRvqc4/OjEoZCRHEs64da3fY=;
	b=Yi7oPdsGiQmGzx8v+stgGSkXBCL7KXgLeSy80mznmfpCX3OD2iki+xH6XI7oTqHAuJLO
	 XaNCnHTY9WGrMR5vtohgv6ifl3inuCGszTgrdPpT4TjNLmspu8XmyRVTdEPuuW56KIthC
	 i+DZNOwzYtISepYcyrvKkR2nKTCHe70UKwHhCV03JVHb6e23bNiJ3atAn1AI9l7OdN0mN
	 9noffKpiywk2XWW/0R60pZecgllFqIKp//5981DjoNoCG1+H3aJvfKZTYPwDLSHIHMHB1
	 KNg3bIU0Q5fvgFbcS2cvXfv5QYcSoyeFYfbxO5x3ZmRq1IffJeECLudJ2JlaErUWbrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=fF4W3ZnZ;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FDB606A33F;
	Tue, 17 Nov 2026 12:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FDB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=fF4W3ZnZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794920370; x=1826456370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Hkx12g+4S3H4doqVuRIJM8phsKM/79b2cvcbllHI28=;
  b=fF4W3ZnZuhOqg+/8LFJD+dVuH6n2/JIrnH5zB8Pt5P5L08EXh+d4KO1I
   S13NR74RYk0qH8iuJBvkLPhPqb7ZeC9x79r4DdAHCCa7JuSsbCdUxbr2P
   rmDZH8fYSRhJCFa8H/hemy+PwFBIQ255mAXk0OOowkA69vvtbXryUiity
   Xhu2NaYpZOEVPu66JOq0wtyWF2FZSFbseZEr8qwVcP0R8NYjYXRwyEW5+
   M+oN7AlxmszKIvaK3v2O0UwMPEWyG7kCB6/uNhqVKqQ/jfTdwxB6sSWtt
   Y2b/tqEYLouu76wYaaxXSxFDGZcRUNvmP4g3YmECT8G3fhGjbH3CgDeUI
   Q==;
X-CSE-ConnectionGUID: ZTVxzG67So2h0+c2Tz8bFw==
X-CSE-MsgGUID: GGADrFNMQtGEmwqLSxuazQ==
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="77354135"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:59:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Tue, 17 Nov 2026 05:59:28 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 17 Nov 2026 05:59:26 -0700
Date: Tue, 17 Nov 2026 13:59:25 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Haoran Wang <haoranwangsec@gmail.com>
CC: Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2] net: sparx5: check DT port reg against chip
 port count
Message-ID: <20261117125925.nlcced7kpymaetj4@DEN-DL-M70577>
References: <20261116210802.2718-1-haoranwangsec@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261116210802.2718-1-haoranwangsec@gmail.com>

> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>     sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so an out-of-range 'reg' (runtime overlay,
> corrupted or attacker-controlled DTB, kexec-supplied or bootloader
> fixed-up DT) turns probe into an out-of-bounds write.
> 
> Skip port nodes with an out-of-range 'reg', as lan966x does in
> lan966x_probe_port(). The bound is the per-chip port count from the

Actually, lan966x returns -EINVAL and fails. This patch just skips the port,
which is fine.

> match data (sparx5->data->consts->n_ports), so lan969x, which shares
> this probe path and has only 30 ports, is bounded correctly as well.
> 
> Found by a scripted scan of of_property_read_u32() call sites used to
> index fixed-size arrays, followed by manual review. Verified at runtime
> on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
> CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
> malicious DT overlay, the unmodified in-tree driver performs the store.
> reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
> write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
> with a later NULL oops. With this patch all three are skipped. The PoC
> and full logs are posted in the thread. Not tested on real hardware,
> QEMU virt (cortex-a57) and compile testing only.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

The in-body From: line from v1 is gone, so the author is now
haoranwangsec@gmail.com, which does not match the Signed-off-by.
checkpatch warns about this.

> ---
> v1 -> v2:
> 
> - Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
>   so that lan969x (30 ports), which goes through the same probe, is
>   bounded correctly as well (Daniel Machon).
> - Document how the issue was found, the runtime verification and the
>   test setup, as requested by the patch bot.
> 
>  drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 08a398a..1647067 100644
> --- a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
>                         dev_err(sparx5->dev, "port reg property error\n");
>                         continue;
>                 }
> +               if (portno >= sparx5->data->consts->n_ports) {
> +                       dev_err(sparx5->dev, "port %u: reg out of range\n",
> +                               portno);
> +                       continue;
> +               }
>                 config = &configs[idx];
>                 conf = &config->conf;
>                 conf->speed = SPEED_UNKNOWN;

The fix looks correct, however the patch is broken and does not apply.

pw-bot: cr
