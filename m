Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B9F478870
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252785; cv=pass; b=rfxxFR+uR+UuEoXQI++ihCoscosZSIRCb96Wr8wAyv4YAYG1YXAUpPSGjlhsA6rLVKRFhf/C9C2vfzz7RrLHu7iskoW2oNU/SANV+iqUdJZWC3aCy7clHNatRloYQ4I+sKpG5G0DvSYJMoVCdjuGCqkgyVPyCG+8QR96p06kgcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252785; c=relaxed/simple;
	bh=9vSyr3e26Qz/fAvJZ42PLSKkIjr0FOmX+AK8aedKEO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwFsWOutvDPcFLTtTlaGpLCu6h/iPFToEf9JGU7EF9DdelTxKNh+M+Ssmy6hrV5aAPYgrEu1sReo+aWBzPqbopO6jO2E/ENolj/rBrE1wfPRp3Par5gKF8jIqWvHruok1sU+uzhMPbP7mgqgX0qrNPz3U/+eSh3ypE28K/68rks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq0LWYru; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq0LWYru"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so83525f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790252781; cv=none;
        d=google.com; s=arc-20260327;
        b=WdS4W91OIZjx6568c+Ssp+lUILRTpUrvhOndzxG3EdEPzY6faqNFt6r5J1/bB6F5Dn
         v88cWosyKzr6THicfvuqrOtxowto8Fu0pKVgAm+IDdiBEZBqMi7ff86ZF2/WFIYbSyfL
         bMyFK0Zek8iSLzZx7prF+fWIwTSnL/7CPrtmtRxrUfMA9s+GbV3LU9XNDKhKGEsRAUSx
         SkM3qACtvLpWDLCSSt4BEkGfnLBONhY2MLVjGxm7ibGHbW8BRlZ14PsTNMzMXbPE0fYO
         ug90JtyvyeIHK/Pbi7uwec1Zj6O6J6yNZvX9Ku6Yg0fHN1jFEkiKYJ5iTcxB2slcwsPs
         Z/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=44/rB8ZswRc008KoGmaclPt6xvztpmvmKKTq9AsEafQ=;
        fh=PzQ6MAfclORPRvQ9GdEBrdtzWb6NqN3DA8plNK0020o=;
        b=Svbr0gfuWjLYQ94capoZzBfSBjgq6g8I+jN/JZJZKTulwn6HGjr0MgrM3VsElbU5on
         2InkEPt+/4bxqRh72g126x2utT9ABqVNP7GbQ2dIgeYvyJ7HV0R6z7ugVQqKuDlIFtoH
         H3Q7uIaR/g3cuMu3zQJ3frmxXY1LYvkHB1jwx0N91kVQdNXRghqre1loiWEVrrVqidBl
         7Z+3j1TXwJgwuDFm7XKnDKqpFlAbstmX/g39U7eZuP6EQllAnBGzqmNQnwUYP85Zqvta
         dHmmCgXUm4V3rSiszLUbTjkxSMJ5tZAQio3+TUB2FfH0lyz7EdO2DPF7JEDoczQWFHli
         pjAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790252781; x=1790857581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44/rB8ZswRc008KoGmaclPt6xvztpmvmKKTq9AsEafQ=;
        b=jq0LWYrur3pxZgTwnaZPgTj6hdlIygHkwAAmz4wRVGVxadRYqMhDqvDKbg1fxuzHnU
         rV2FvybfnMZDhNySDh1KOIT1iqRC31HHpLeGcBdqRBAo6R1bX128VKkXJC4lHvu94vnF
         5DZ82qRc9dtzPA71B4oZ7lZ2Dlwjuvke94wvfbiisoEXClVFTC31i6ZMztPYh1uPAWAL
         U3o/8nJ2HT8x23qLmwSNHNM66+7qoTWisyQpyG6h6ppsCsz+e0hEnJ8H0hqJ2h5WlzHt
         1w1Qj9wpXkM5xCGF4vWFt2JkLePh7gkBFsMJQRhI9XgFiebH7uht4Wj4Ha+zIkuNVRrL
         KOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252781; x=1790857581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44/rB8ZswRc008KoGmaclPt6xvztpmvmKKTq9AsEafQ=;
        b=Ygw4He8BbzhBiQHz3Co0chGuUpSdayK97o8+2rkIFiCPUdGsesPG6lOF0wxoa62o4T
         1uXcC+3eQq4LxQ13AKzMUI7hOWpNOFrdPMoNCYBEdGTqiabYcHpBS2nmBNAeqNkvH/Zo
         cWaok7L3eF1Lwnnwsx1Olc5opcE0nJcVdZNF7iTbpT/3lai7ER2fM/vjjfesb6w2WcIt
         CY8fbh5t94/bP+h5Xstt+HDjNa997i3lpu7AYX1sDuL/fuFYkKKlreHwIc2MsnP5Q6bQ
         61G0J9QLYkUUb1jvXdYDnAU43A54bsQMyX9vWhfCFzaoDk97K/p3Li2v5mA5rAG5v+OI
         bL1g==
X-Forwarded-Encrypted: i=1; AKwUvBzy2v3w07pXfpUHtm0XlLDuczw5NMvjniZ7stLAyGnf7Lc7W0ldkhE1C+TuH6dyE5LykNF/hkgQBg60Zqg=@vger.kernel.org
X-Gm-Message-State: AFuF++ngbpQAQ5lPXwNGCpoYmtW8lyrPhCx5eUdWpmEMoCO+E7WnDY9i
	EiljX5+wDJR/g9t5IRYM0hkF2eksKyJmTHvX7fUlpURiW0Q0OJyJeCJUQ49O46fv90Dq6jiZhJL
	oJyOEHnmh0hWffA46XC0bVz9iP2oyWivuOLBpbyo=
X-Gm-Gg: AYBFou1QyDmGy4dxU6D2yqGjZb+HUQWTRkM4RZ4JSQu8jVrbYmUCffGpMdomd5gWCTe
	fHMFVSX6aE7LdKNPJj4U/uaC/p0oIRQwTCOlABiTjbeThQbniXVzXnuAqLpQQl21bQfXO2oovqN
	nP+8oohftkgw7+D1AP+Q03vuQNKgb2aj2677dogvURwiCIzIcxI5dA4GNcOmNzolrcrzrFw5LHD
	/CF0GvO2dejgR04w8jGnnVlQAXB4AEwvts3AXj7fnpCFgLfLb4VjGaeqFLCcJcKseM6RMITcm6R
	F7RrS46QeHJClnpL4bSJh0DbFjUuUIvZPYd61ukj2BIyLoy3k1A9thnKttpJVd3hchAj25iXXe3
	HcUsgIh/sqRHRp2Ypggj9yZvYsYq8hKnuB4FZUEtBJDQ72PwpmPJLaE2bJ1TxNF3AxIdzVrN7GQ
	==
X-Received: by 2002:a05:6000:705:b0:487:bef:31cb with SMTP id
 ffacd0b85a97d-488716ca7e9mr3905909f8f.22.1790252780878; Thu, 24 Sep 2026
 05:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-7-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-7-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:25:53 +0100
X-Gm-Features: AclHuK9gavbB6M7C_1T08SEgonhC2MdBJl0CvHQ9gIdkytsFMiv_mcHbK1pSAfU
Message-ID: <CA+V-a8t=7PGALbP3HMTYZyzB9Vp3w=Rx41yPCc_DHR-Z9+Afig@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] PCI: rzg3s-host: Move IRQ domain setup code
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:54=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Subsequent patches add support for the event IRQ to handle link
> up/down events. The event IRQ handler will use
> rzg3s_pcie_set_max_link_speed(). In preparation for adding event IRQ
> support, move the IRQ domain initialization code after
> rzg3s_pcie_set_max_link_speed().
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none
>
> Changes in v3:
> - none, this patch is new
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 147 +++++++++++------------
>  1 file changed, 73 insertions(+), 74 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 40d5ef3e347e..f4b27a77a89d 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1006,80 +1006,6 @@ static const struct irq_domain_ops rzg3s_pcie_intx=
_domain_ops =3D {
>         .xlate =3D irq_domain_xlate_onetwocell,
>  };
>
> -static void rzg3s_pcie_teardown_intx(struct rzg3s_pcie_host *host,
> -                                    int count)
> -{
> -       while (--count >=3D 0) {
> -               irq_set_chained_handler_and_data(host->intx_irqs[count], =
NULL,
> -                                                NULL);
> -       }
> -
> -       if (host->intx_domain)
> -               irq_domain_remove(host->intx_domain);
> -}
> -
> -static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
> -{
> -       struct device *dev =3D host->dev;
> -       struct platform_device *pdev =3D to_platform_device(dev);
> -       int i, ret;
> -
> -       for (i =3D 0; i < PCI_NUM_INTX; i++) {
> -               char irq_name[5] =3D {0};
> -               int irq;
> -
> -               scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + =
i);
> -
> -               irq =3D platform_get_irq_byname(pdev, irq_name);
> -               if (irq < 0) {
> -                       ret =3D irq;
> -                       dev_err_probe(dev, ret,
> -                                     "Failed to parse and map INT%c IRQ\=
n",
> -                                     'A' + i);
> -                       goto teardown_intx;
> -               }
> -
> -               host->intx_irqs[i] =3D irq;
> -               irq_set_chained_handler_and_data(irq,
> -                                                rzg3s_pcie_intx_irq_hand=
ler,
> -                                                host);
> -       }
> -
> -       host->intx_domain =3D irq_domain_create_linear(dev_fwnode(dev),
> -                                                    PCI_NUM_INTX,
> -                                                    &rzg3s_pcie_intx_dom=
ain_ops,
> -                                                    host);
> -       if (!host->intx_domain) {
> -               ret =3D -EINVAL;
> -               dev_err_probe(dev, ret,
> -                             "Failed to add irq domain for INTx IRQs\n")=
;
> -               goto teardown_intx;
> -       }
> -       irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
> -
> -       if (IS_ENABLED(CONFIG_PCI_MSI)) {
> -               ret =3D rzg3s_pcie_init_msi(host);
> -
> -               if (ret)
> -                       goto teardown_intx;
> -       }
> -
> -       return 0;
> -
> -teardown_intx:
> -       rzg3s_pcie_teardown_intx(host, i);
> -
> -       return ret;
> -}
> -
> -static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
> -{
> -       if (IS_ENABLED(CONFIG_PCI_MSI))
> -               rzg3s_pcie_teardown_msi(host);
> -
> -       rzg3s_pcie_teardown_intx(host, PCI_NUM_INTX);
> -}
> -
>  static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
>  {
>         u32 remote_supported_link_speeds, max_supported_link_speeds;
> @@ -1169,6 +1095,79 @@ static int rzg3s_pcie_set_max_link_speed(struct rz=
g3s_pcie_host *host)
>         return ret;
>  }
>
> +static void rzg3s_pcie_teardown_intx(struct rzg3s_pcie_host *host, int c=
ount)
> +{
> +       if (host->intx_domain)
> +               irq_domain_remove(host->intx_domain);
> +
> +       while (--count >=3D 0) {
> +               irq_set_chained_handler_and_data(host->intx_irqs[count], =
NULL,
> +                                                NULL);
> +       }
> +}
> +
> +static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
> +{
> +       struct device *dev =3D host->dev;
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int i, ret;
> +
> +       for (i =3D 0; i < PCI_NUM_INTX; i++) {
> +               char irq_name[5] =3D {0};
> +               int irq;
> +
> +               scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + =
i);
> +
> +               irq =3D platform_get_irq_byname(pdev, irq_name);
> +               if (irq < 0) {
> +                       ret =3D irq;
> +                       dev_err_probe(dev, ret,
> +                                     "Failed to parse and map INT%c IRQ\=
n",
> +                                     'A' + i);
> +                       goto teardown_intx;
> +               }
> +
> +               host->intx_irqs[i] =3D irq;
> +               irq_set_chained_handler_and_data(irq,
> +                                                rzg3s_pcie_intx_irq_hand=
ler,
> +                                                host);
> +       }
> +
> +       host->intx_domain =3D irq_domain_create_linear(dev_fwnode(dev),
> +                                                    PCI_NUM_INTX,
> +                                                    &rzg3s_pcie_intx_dom=
ain_ops,
> +                                                    host);
> +       if (!host->intx_domain) {
> +               ret =3D -EINVAL;
> +               dev_err_probe(dev, ret,
> +                             "Failed to add irq domain for INTx IRQs\n")=
;
> +               goto teardown_intx;
> +       }
> +       irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
> +
> +       if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +               ret =3D rzg3s_pcie_init_msi(host);
> +
> +               if (ret)
> +                       goto teardown_intx;
> +       }
> +
> +       return 0;
> +
> +teardown_intx:
> +       rzg3s_pcie_teardown_intx(host, i);
> +
> +       return ret;
> +}
> +
> +static void rzg3s_pcie_teardown_irqdomain(struct rzg3s_pcie_host *host)
> +{
> +       if (IS_ENABLED(CONFIG_PCI_MSI))
> +               rzg3s_pcie_teardown_msi(host);
> +
> +       rzg3s_pcie_teardown_intx(host, PCI_NUM_INTX);
> +}
> +
>  static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>  {
>         struct pci_host_bridge *bridge =3D pci_host_bridge_from_priv(host=
);
> --
> 2.43.0
>
>
