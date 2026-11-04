Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785098;
	b=RofbR7O48b+ZD3KOmbEjyK6ye3oLXklhIzC0g7fVKwE9YR8s4dr3+6xaB1pa2KiLfZpr
	 BRBytzcgR6cbXEBdIqLXrE5lVyCBRYB0LgcZolB8lWbq+/5fZqYCRO/gJpLmOXXk7BOXA
	 BU7e63aCabB69lv35ehMPb4QzV0kISlR2iw0WASE+MUEppt/0DwfeTP1y12ClY87l2MBQ
	 v3jAs8kkPPdpgThl55OZ8R4XICPhh45LRMBzTAY/KssGPjIBKosyN6qetQYH/nJXAt5jl
	 Nt4wfPFalEeCIFSPLi2YPHaCjVChMPT5TWAMUYj77b3HALTa4BkyYt3ISA9Ijbpl5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785098;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5oRk43/W3Y6gddSCWn6cma4la8Lxnv8/S1acmO9S1Qo=;
	b=Fsr6t+WsX4cGCJ5NOZxMCZX5XcirJTs3J+lqpgmpC+W/WDKH/95RuvB68GSDnCwPOS8E
	 0wmh9nEzdzzSMc6pMlbFeBOsOqgILbPBcHHbr3fvymBDHLy3PrrHcKubeod/Ct9elzTkq
	 E4+mql7YI3f2C2NUhLsIvUlZC5CyoBmMXfxypYGQNji8QHv6FcZay3Sd9O/OOCd3fTKAf
	 OOCf0LQL9Ely8lgW0xGWGPch+hjX+eFTeUpMl640DK1y07dB/9/ah4lkEgINV0CeXK35w
	 OxwYUHGrr/Uaxv4rZGp5RKcdVqNxU39KwZffVV98Qb+YGPW0daYEQnZSbxrLg7ECf8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e4iWoGak;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB05606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB05606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e4iWoGak
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HPJz/VqRgF2OV0uwCCoFF4MG9ZEWJG9czJUot0f7Ois=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793785094; v=1; x=1794389894;
 b=e4iWoGakmQ8XChzuurSIdGb5es9rdgR6NbMqiq6Leu8wMokL8T+QBBO3Od6rXbQsqvn6Mr4Z
 NpOO/OejmZRmffjeb+qVruWqCRLoOa6HrBte/FAA6rAMW731+W9W7+CZF7OZIq+9Zsk0vmFtFVv
 v29KtGWdpN+W6YbssireMH2c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 44bfdfe872025a89;
	Wed, 04 Nov 2026 09:38:12 +0000
X-Mizu-Trace-ID: 44bfdfe872025a89
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 17:38:00 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: lirongqing <lirongqing@baidu.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Nikola Z . Ivanov" <zlatistiv@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] team: fix promisc/allmulti leak in team_port_add
 error path
Message-ID: <aur86WH_9VMrP9NN@fedora>
References: <20261104015217.2222-1-lirongqing@baidu.com>
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
In-Reply-To: <20261104015217.2222-1-lirongqing@baidu.com>

On Wed, Nov 04, 2026 at 09:52:17AM +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> team_port_add() increments the port's promiscuity and allmulti
> counts before calling team_dev_type_check_change(). If the latter
> fails, the error path does not undo these increments, leaving the
> port in promiscuous and allmulti mode even though it was not
> successfully added to the team.
> 
> Undo the promiscuity increment under err_set_slave_allmulti and the
> allmulti increment under err_set_dev_type, so each error label only
> reverts what was successfully applied, matching the cleanup performed
> by team_port_del().
> 
> With the promiscuity rollback now living under err_set_slave_allmulti,
> the inline dev_set_promiscuity(port_dev, -1) in the dev_set_allmulti()
> failure branch becomes redundant: that branch already jumps to
> err_set_slave_allmulti, which undoes the promiscuity increment. Drop
> the inline call to avoid doing it twice.
> 
> Found by source code audit.
> 
> Fixes: 0ae9cfc454ea ("team: Move team device type change at the end of team_port_add")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
> Diff with v1:
> 1. Remove the dev_set_promiscuity(port_dev, -1); in if (dev->flags & IFF_ALLMULTI) and move it under here.
> 2. change Fixes tag
> 
>  drivers/net/team/team_core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
> index 957cc78..cfb833c 100644
> --- a/drivers/net/team/team_core.c
> +++ b/drivers/net/team/team_core.c
> @@ -1365,11 +1365,8 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>  	/* set allmulti level to new slave */
>  	if (dev->flags & IFF_ALLMULTI) {
>  		err = dev_set_allmulti(port_dev, 1);
> -		if (err) {
> -			if (dev->flags & IFF_PROMISC)
> -				dev_set_promiscuity(port_dev, -1);
> +		if (err)
>  			goto err_set_slave_allmulti;
> -		}
>  	}
>  
>  	err = team_dev_type_check_change(dev, port_dev);
> @@ -1397,7 +1394,11 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>  	return 0;
>  
>  err_set_dev_type:
> +	if (dev->flags & IFF_ALLMULTI)
> +		dev_set_allmulti(port_dev, -1);
>  err_set_slave_allmulti:
> +	if (dev->flags & IFF_PROMISC)
> +		dev_set_promiscuity(port_dev, -1);
>  err_set_slave_promisc:
>  	__team_option_inst_del_port(team, port);
>  
> -- 
> 2.9.4
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
