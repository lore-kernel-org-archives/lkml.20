Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780831;
	b=Q9rUbhHsXeP/Gnhdf9YfYq9vBh5d8v473Je3TsjaVo1IolYw3t1kEd2zTo+Kungk7LlF
	 2LL+IsaEy9t+YJnr7oYfN61SNeSC5vZu+0WLWV4uoJ+8OhT7jtrn/pRlrsVeB+kk5zsNE
	 FI1Exn+aaphlxnHC+zl/PPT35aueyPEhxSGcVPvvtjs+6fjRFGyKcqKpgIX0JglOYvWqz
	 WVngowHfZdYWhzRrHTgXmjRVnbiZJTJ7N2KBUstuGf3xivmwAsGe8zK3iur4nhcmh2Ukf
	 W+O9YM+PupkDqijBQW7nPueCWth9xjmm5SkUh7OKc1odEV1cPXk1xVxn88iRShr6J+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780831;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zzM63kKTZFMMJk4aOY2Aqbh7hEVBemm6VnTiR8uQUuQ=;
	b=u4UtWjNIb951XieM8uHJlsuA2s4Vjkr/DUcjDOthEvuq40Gp66lQaoUYO3cVgFOxP7V4
	 PYTBAJDZP7gFhEr/pwv2odD8nmEulWGvCfM5OHsewV1n3BwHakL297+rlvNCl6GZ1zZdJ
	 vNBy7E0ykld+1jbsr72RliSRs5XQLYeGCxl1jrVVpuLjtWqJ7wSxEhdi2SxmbpijdUkHo
	 B8jL0xHLTZ//J2TnhS5gEYcmvueX+K39N0i6p2j9CEQ6/eDyigxE9bNuGB7U+UjwhlfXX
	 MOHm4isKN4VZdE6rETWx6/oDJep0AwRhZddKJ3ZTDOTIriWWGl2rNnSeZTGEkc1L7+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Y5MBZ8MK;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F62C606A32F;
	Sun, 15 Nov 2026 22:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F62C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Y5MBZ8MK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794780830; x=1826316830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9kE/8IZDOYjIPSl0tUGVCuxcw2o8Mkmx63fH+MtyhR0=;
  b=Y5MBZ8MKvcFoHriSgTs2DaesjYEPAcFDLzGAnGeLE5p1pNv5FEheh1Qz
   qx8lA9gmP72tbFPo/ExlgabpS9OLlTayFd0NooKGT30fiE/CvbaTcK/o9
   jYScJ1n4WqAHFUvQ1AGuf82rzj0LW8Th7on9e1vcHG8Bk0QHB/0R+YNzZ
   VvWdPbXue7/xBDLyTW3yWy/+Z7XWLaGlFyMf9MUSNXYiNysyOxkClFpfZ
   LPWm+cC+P0l15FTdt+DSjMomK1RFbttUljuWNiqcbw3WB1ga0dhbitUAb
   D0xC46n9ICNhkNhPvZYtwZ4nUwC2f8NkwmSEbZBHIlqTE0nwEpqTN+K5J
   w==;
X-CSE-ConnectionGUID: G9ThvyHeR+KS0n9uyVvf+g==
X-CSE-MsgGUID: dORnRI7RSbi+EQlfATRCnQ==
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="65572559"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Nov 2026 15:13:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 15 Nov 2026 15:13:44 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 15 Nov 2026 15:13:42 -0700
Date: Sun, 15 Nov 2026 23:13:42 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Haoran Wang <haoranwangsec@gmail.com>
CC: <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: sparx5: check DT port reg against array
 size
Message-ID: <20261115221342.nlrfhxlg4ovyaq7i@DEN-DL-M70577>
References: <179457014579.23820.10657909253312598784@gmail.com>
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
In-Reply-To: <179457014579.23820.10657909253312598784@gmail.com>

Hi,

> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> Date: Fri, 13 Nov 2026 19:42:25 +0800
> Subject: [PATCH net-next] net: sparx5: check DT port reg against array size
> 
> mchp_sparx5_probe() reads the 'reg' property of each ethernet-port DT
> node into portno and passes it to sparx5_create_port(), which uses it
> to index the fixed-size sparx5->ports[SPX5_PORTS] array:
> 
>     sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so a device tree with an out-of-range
> 'reg' value (runtime overlay, corrupted or attacker-controlled DTB,
> kexec-supplied or bootloader-fixed-up DT) turns probe into an
> out-of-bounds write, potentially far outside the allocation.

I seem to remember that these type of checks have been rejected with "device
tree is considered trusted". Though, we do the same check in lan966x, so I am
not entirely sure.

> 
> Add a range check while parsing and skip nodes with an invalid port
> number.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> ---
>  drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 08a398adf121..6616e76bd0e3 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
>  			dev_err(sparx5->dev, "port reg property error\n");
>  			continue;
>  		}
> +		if (portno >= SPX5_PORTS) {

This wont do.

SPX5_PORTS is the size of ports[], which matches the sparx5 port count.
lan969x goes through the same probe but has only 30 ports.

Instead do:

        if (portno >= sparx5->data->consts->n_ports)


> +			dev_err(sparx5->dev, "port %u: reg out of range\n",
> +				portno);
> +			continue;
> +		}
>  		config = &configs[idx];
>  		conf = &config->conf;
>  		conf->speed = SPEED_UNKNOWN;
> --
> 2.43.0

Since a v2 is needed anyway, please also add what the bot asked for to the
commit message, and properly populate To and CC with get_maintainers.pl

Thanks,
Daniel

pw-bot: cr
