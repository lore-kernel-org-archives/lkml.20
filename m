Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD46495503
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460818; cv=pass; b=V82GUhVtN/xHIni22Tp/kfRdPmcFHMAdMQn+aRbiSJlxtqjCyaaAP/FCJvxhXLBE4U9cgAr3CFIQQkIpfV0wzVScjcjoW8qsYDDDGtjwMH1/6u2NSNFud9gSAA3nCufPgtv9fKxYvFtdSFdMETjZlS9EnbL1o1V1fyMH4LKNsJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460818; c=relaxed/simple;
	bh=nPB8HKMrWHw3m7s8Z1NEO0K4n5NwCAXwyUr1xW5XU7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIOTmgHywz/z4zYF0LwJmKbbzc5qJzxqdj3D+lafUmw9SyHw56GU1gNwkm+fernWpf832rZZBVEsF4PC1Tezx4Dyd1ty3YmyyQVlDy1PghuQ9yknpoJjme54QUD8cZDXaRGYNPBNM3lvEkmEcH6lyUegJowX/cubr1YAqu7wLFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=LGyD24N5; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="LGyD24N5"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a3490bso2877660b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789460816; cv=none;
        d=google.com; s=arc-20260327;
        b=SqWnsD4KLLr/ro2fUTDK8kJB20GkJn48J48rIa7UMQyJqDY+7lvHjAKlwfzbkcfeom
         A9Qo720LWbJqYu9f6fMscfSF1PZHQlKosadoOZUJ426lB7iJOiUe8E5TFl9Q5fQTj4eb
         v9/i7Et7xQZCH1jNl/tcI4tj0gFgjpU2S8RiFNNaGYVjlyDHr9l/s2U4tOVv/BDEcT0g
         B5fp8xcQf1qvmPQno+rccwzO7HB/twNkneGemNI3LrxfAPhPmcWs20L9WjQ2g2jE0qfh
         UZ6M5JPgWlIehul6gmVqbophs9CT8xXenS/rjK1B/BHbFGOC4sBO6CYBkfdjnbZKa3u4
         YN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lnh5CgWNygQ5nJ5BcAug/UGA2XoqYnoWr3xk+1LgwT0=;
        fh=HAug0gYFtwH5nESQWZiMXpJIw4PO54YKsJHzj2hhiHk=;
        b=NByED7Oh5TGkQDngE97nt2JZ0tXhfCwUoc7KbBRDc0C08AH/UcBWBV/j6/zfXcZ7+f
         7G1I3+z890UL8+hg7TBKDsm1XrqZAyM7V2uTzJtc6SkELSoWwcG8VPWEE9O8T9QVE+Pu
         v6aj+uagnv/gdA8nNYlspRsURr9Y1trFnCR7cEDeyVslrr5Dg302ycAHMOopP2QDqDzI
         i4g9wGvQpSYRkUbH05/RWcLPYN2fEVW1u0KXy+JrUteCffq6YcqeuD0h3FkLUvOTdH54
         ZtTJY246ailQYCAQy9a8/6rwDr/yQvLjprBi20FPC9E81zK4CPrXLqiXJgGg4jEqS8pP
         DNvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789460816; x=1790065616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lnh5CgWNygQ5nJ5BcAug/UGA2XoqYnoWr3xk+1LgwT0=;
        b=LGyD24N5l64zOz1F5J3fHUPcg+6M1qW99Yar6dgJRHRQ/M5ve/6QkiNuWBnYTnSdSA
         x1neQC61BUcK87a1lGXNkl0PTLYYh9toSY5PlqsPORHkjXGAKPA3ku28hqt0jTpp7LUb
         EWcW9Q3mpH7hWLZEMXYX8w/5JlVa0NfXXPoM1AUj80OaGhPOeDXwKnrnKIAy7YfjECEJ
         5czUC3+GUo6x6S4bZDYuxTOOv2B4/f1g2bj7URhijvuJBAGHOPFHfE7q9B+E6aASuX5b
         rTWpO119zUSVLFscBSRvBLPkLz1Yr6zmR1HZEAtsewQbZX+rtkbVtPvUNpx+hb7HGqvu
         l4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460816; x=1790065616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnh5CgWNygQ5nJ5BcAug/UGA2XoqYnoWr3xk+1LgwT0=;
        b=pysJX6Zlr8Qn3bYQOB1vMbHbmGKWWY05+gXaZMXuqbCdWx5162hJMw9tTIp/n3q1MJ
         dpmy22RDwZi3NpcMDqrDZGENamrjkTHeEGC1/+6sxyqzjctwaJiJzBS/PmIYdSJPTHHi
         uN/cbg1JC3EQ2QKI0geAIPK+e3ICVnq9E7I0RoPLJ90aGDtsAm7Wf9YHBnjJzob2hNVd
         hJV4VxIVFUYjbCwsrDaX1Bxn5SMIEp5bbF/lSpSa/D7ta2+ea5VUF8mA8HHLYZThQvSY
         EEXhw45QwDu/ibULWuRj0NWJyCK47O8/cP7+s+3xtx0A+3GvSHgxkgjmcEVYrxT+XBDw
         laDA==
X-Forwarded-Encrypted: i=1; AKwUvBx1X0Rsskn16ztp8bjyrLGE9Siz6ASAPLoJsQFTk/umpJnbuLFK9hazZMIKQIGAEtFi0wYsniZ2V2ll8Qc=@vger.kernel.org
X-Gm-Message-State: AFuF++mgfkjUt0F/uZjOcN0Ygz/JU9i57JBalDGkb8nMIRC9gs49eYj6
	bMUW2dzOCmbHuc413aEpXzS1RJhrYL9I2z/dxpY5TZ8vl4L3D12FhuubfT2IjqGHB69rFp4xVCM
	qOFKRS1z+Rdk6/rZAIlfdmLwamLjcaV+EQT4XeUpg
X-Gm-Gg: AYBFou3fueu5O2qfrEoa56pz1GiV6BHfDQjl4a1LWMl8W9xdcudw4UjKUKDvdFkpzuO
	CVuO+ZHb6TRV/5Rh2nAU9R9ppFwOM+Yo4BLks3wV8UE4RO+wBlAPefySN59xysqE17i1lZosEwN
	0CJgn4+S64UWyxrOglNrxzd27gvqsBXs40+ljzHwIkbYKLgc8T/wPDPjhE7B7GykV75J0vnELE+
	ro4S9mxRHQZmBJpw+JefjXfEBrMTogkjXJcLQI/f930oLb0tsShO8qdUWNeWDAUmgkwBhL2yUo9
	J4H8BWYvluTC2aM/eXrqhv3l1W+TRP53HLj8sElqDlS/e4+UQy+S0Efr33BKjhRMtuIH4t6UBtx
	Tix3paIIDApOmpwJuXYqRt/FIdoIoIYFCOCuKzVGSgLNdtOvS+5oXmg2I
X-Received: by 2002:a05:6a00:22d4:b0:857:7337:5db6 with SMTP id
 d2e1a72fcca58-86f857f03e4mr11800026b3a.20.1789460815852; Tue, 15 Sep 2026
 01:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915082426.703892-1-xmei5@asu.edu>
In-Reply-To: <20260915082426.703892-1-xmei5@asu.edu>
From: Xiang Mei <xmei5@asu.edu>
Date: Tue, 15 Sep 2026 01:26:44 -0700
X-Gm-Features: AcwNN1VHk4qFiOTVVqpCxopv6W4c447U28-fnrK3q7ySLfaNNx1iHuyYYDxzrTc
Message-ID: <CAPpSM+SviG8h4CYfjYf3FtowDcj8JE11ThBTip=+f690514uBw@mail.gmail.com>
Subject: Re: [PATCH net] net: bcmgenet: restore the hardware filters on open
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jakub@cloudflare.com, Nicolai Buchwitz <nb@tipi-net.de>, 
	Justin Chen <justin.chen@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore this email. It's an email sent by mistake.

I got this patch for testing and wrongly sent it out. Sorry about that.

Xiang


On Tue, Sep 15, 2026 at 1:24=E2=80=AFAM Xiang Mei <xmei5@asu.edu> wrote:
>
> From: Nicolai Buchwitz <nb@tipi-net.de>
>
> bcmgenet_hfb_init() runs INIT_LIST_HEAD() on priv->rxnfc_list, which drop=
s
> every rule off the list, and bcmgenet_open() calls it on each ifup. Every
> rule the user configured is silently lost:
>
>   # ethtool -N eth0 flow-type ether dst $MAC action 0
>   Added rule with ID 0
>   # ethtool -n eth0 | grep -c Filter:
>   1
>   # ip link set eth0 down && ip link set eth0 up
>   # ethtool -n eth0 | grep -c Filter:
>   0
>
> Initialise the lists once at probe and restore the rules on open, as
> bcmgenet_resume() already does.
>
> Fixes: 3e370952287c ("net: bcmgenet: add support for ethtool rxnfc flows"=
)
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> Reviewed-by: Justin Chen <justin.chen@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Link: https://patch.msgid.link/20260913190052.939955-1-nb@tipi-net.de
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  .../net/ethernet/broadcom/genet/bcmgenet.c    | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net=
/ethernet/broadcom/genet/bcmgenet.c
> index a2305e6428d1..b916080f4ff1 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -749,8 +749,17 @@ static void bcmgenet_hfb_init(struct bcmgenet_priv *=
priv)
>                 INIT_LIST_HEAD(&priv->rxnfc_rules[i].list);
>                 priv->rxnfc_rules[i].state =3D BCMGENET_RXNFC_STATE_UNUSE=
D;
>         }
> +}
> +
> +static void bcmgenet_hfb_restore(struct bcmgenet_priv *priv)
> +{
> +       struct bcmgenet_rxnfc_rule *rule;
>
>         bcmgenet_hfb_clear(priv);
> +
> +       list_for_each_entry(rule, &priv->rxnfc_list, list)
> +               if (rule->state !=3D BCMGENET_RXNFC_STATE_UNUSED)
> +                       bcmgenet_hfb_create_rxnfc_filter(priv, rule);
>  }
>
>  static int bcmgenet_begin(struct net_device *dev)
> @@ -3376,8 +3385,8 @@ static int bcmgenet_open(struct net_device *dev)
>
>         bcmgenet_set_hw_addr(priv, dev->dev_addr);
>
> -       /* HFB init */
> -       bcmgenet_hfb_init(priv);
> +       /* Restore the filters, the MAC was reset above */
> +       bcmgenet_hfb_restore(priv);
>
>         /* Reinitialize TDMA and RDMA and SW housekeeping */
>         ret =3D bcmgenet_init_dma(priv, true);
> @@ -4075,6 +4084,7 @@ static int bcmgenet_probe(struct platform_device *p=
dev)
>
>         /* Mii wait queue */
>         init_waitqueue_head(&priv->wq);
> +       bcmgenet_hfb_init(priv);
>         INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);
>
>         priv->clk_wol =3D devm_clk_get_optional(&priv->pdev->dev, "enet-w=
ol");
> @@ -4272,10 +4282,7 @@ static int bcmgenet_resume(struct device *d)
>         bcmgenet_set_hw_addr(priv, dev->dev_addr);
>
>         /* Restore hardware filters */
> -       bcmgenet_hfb_clear(priv);
> -       list_for_each_entry(rule, &priv->rxnfc_list, list)
> -               if (rule->state !=3D BCMGENET_RXNFC_STATE_UNUSED)
> -                       bcmgenet_hfb_create_rxnfc_filter(priv, rule);
> +       bcmgenet_hfb_restore(priv);
>
>         /* Reinitialize TDMA and RDMA and SW housekeeping */
>         ret =3D bcmgenet_init_dma(priv, false);
> --
> 2.43.0
>
