Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E0925B2F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253046; cv=pass; b=RdLWKOxe/34hdPdO2Zln6WNQMGJvCyIoqrGrF5yDcHOn2FyIzleGpfkVI9Vr4MhfbHoxfusF7s20sOBDSIoi9x/kz9csccMLZmURm3TXTz9RkzqZxXDSQl+aJZ6Mr8tngj/ocptS1JcrWfkYHqK6OQJnxRVQo7oKII/Rbb6nY2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253046; c=relaxed/simple;
	bh=+lsajvPrcwVHpdvopAQISLJ331bLt5xGidWZJHo/TxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lg6CYox+1kK11Ut2H1XgzUcmIyLrjYKdjlT1PoSnfcxZ3JMrVkJ073iFAd5MnPuwL+4vJNYA3lmW5e7Wo38B6strdRYb1VnM4k9s5QZ1j2vNlufgzZiFpJvAM5tf1FAuIl4gcvnSAndRPMliHsmN7zpZPfkbaQityCX8FfsSu20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=borLmFGT; arc=pass smtp.client-ip=74.125.225.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="borLmFGT"
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1316156f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790253042; cv=none;
        d=google.com; s=arc-20260327;
        b=PIlg5PoHmCNjHioXx7TNc6vvVOnEQdXo9kgYQnp4AMw4fyf9SKpQDqXlJ54gLc0OMA
         8pmic6+LMOGCdl/7l2cFmn3MulowB21cH9khEIka2qYr/8mCosyATmdq7ImERLX3T/Mz
         BxgpVBR6+8sasqOY4l+ff9mPVy5FXc0FvtFt4bIWiaNmqsuDpznrmmgfIgsOQucsodfG
         r5Yf/41Guk9HJatCb27Z2z4l6QfA/+OYuBx70CkAlO9r4HDVOtP6bUWlQ4+3DsKpqR1m
         z4f4ijus6GpATTrHPT9PJbQekmTz91ojoTmCdlo0mh1LmDLqaGyMeI0C3P1XjpUJaZt8
         IW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KchI2yh+e0/Y+qqc5spT0X4ywaHGKY+StJYN1UKsgj4=;
        fh=YKZ9XnEkWWn9urO45vJHb+5XF4xOE2BLGfD9n+hm+/s=;
        b=JbNt1vmc5E/UC+cBb1ThAw3LYBf3kcfYLFkS/kKDAeSyWymeokdygkOd2uZNWDwKli
         10WGOSVNf8RYklGK1dG5KgRIMRvHq9eB+b8+DpDV/2G87RdSe3TaRD6yCjzi6VdH/QDc
         e44VL9c3VHFTB6iQI6auTsRcDjMWPbrHBCZRJUiH0ybmyMvemRvHUM+jjYLrblOFOIjs
         K+hGJR9vF2dL/xpXG1qD0T2gI8wIEuXGjEdr04Mk1i4sxF0xR4TkNxTgcO2zGAoE1I2V
         w0Zq0y63IKRNbQ+mngQYI2DcOd7K0SJOd6C3U4HNHvPghQ67dmBSs2w43xfx/I/qAyH6
         gnsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253042; x=1790857842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KchI2yh+e0/Y+qqc5spT0X4ywaHGKY+StJYN1UKsgj4=;
        b=borLmFGT4mdmp/aG1n7LDJ5+49VgNjD7hOZJRZkxhiofqun6HsfqWXNXoPeRGLht7m
         qvPjs59j1QZvRG1KAsThyA0OH1sSx+wTStqaL+zNgK/Bi+PPdSV+dxwMIcI8D8ogwRYZ
         Jlmhq86rGMo3uY/CBoqkZr+m0kFW3cJ8x5ot1aN1rRxD0xpowDeiyJETIlSgbRoAgl3s
         HzmXz7mo+RlvKYAqkTpMDT0xj3f+izkn8no7sJ5t/zX34CRTpz5vGnnhQ+sQpyYGIc7Z
         +WfH3jLSq+1o2pRkm95SJ0YPWAgF7RhyFAyCieyfvdwVtd9OOekbJ71wEyp9imIhqya8
         dOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253042; x=1790857842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KchI2yh+e0/Y+qqc5spT0X4ywaHGKY+StJYN1UKsgj4=;
        b=l6dTv+CFh9sy7PyQE0ltKzBGEI4N46cz9eOTwBRgD24pldWcSgzGGJn2SRnAawMf4t
         CHDw+x9wn/yGMrI+p0g/7N4H+XoCtiNErld7i7FQ5w82jN/5AxrMq4LszPySshTGtM4g
         YsCKGYT7Qvr/WZnhOZvFFPWFGuGn4rM2EP3IHi0/0WeYKovr2lIkRIiZ+NqzjWO9xys0
         M/f24ewdOL9vs7e0uQ8erThDrlXMhG2bCOvcje2e4uIx/snY/OiNwI7lyNUXtY/NXN5j
         J8OIMDThKwWMPKq59bq61mudsPwnPUqP2tZrqZpmDi25g0xGLRlPB99HAGiCv9h8NnQE
         4uQA==
X-Forwarded-Encrypted: i=1; AKwUvBw1jxXvPPQQ0/wyKBdgdvYAgTr75iMNtFeyHb5lxdZNFJ+R7k+HTL8eyVgX+6MLS5zatXPyjdoLKT8EA3E=@vger.kernel.org
X-Gm-Message-State: AFuF++n2k+Ay74eNqVwzu6iVGTQ0YoinWRRzbKxpUEzZpeb6M7nZD5Wv
	9N7tVdiFd9eTkPIU4R2lXi3uI+3PK+fk7J9BLpQUuTHoGOvBe/ubUU1LQCFqbadpvE3Oo2dn2EM
	cMQbwN89cuwQR/2Cm5yL2FCKwXP46EFo=
X-Gm-Gg: AYBFou0JsUoLuFEH7fAdeVtJcZZPm3x1NVaku5wHFJV8+g1bWnBxqZWihBle1lgmJtu
	fHm0hJjHuYvhfhtjx57GWwovzhSrAG+1Ebqr+I+VQa5xeGTtSK5XO022mmY1CQ7dFK0HT9T7TIF
	VvGyXP99EebUnJ3r3VQjSr2OEyaD5yRboR8Xw3brZVL0p0Z/80iLbO6bkElS2JphXy8iVs5X65X
	ycqXho5zY4MBMX0OulrOs8ikYTwR6irQmIpU8VbsMmng6YmTlCpJHeXQdMWhRoh3w2OFks9C5lH
	2sCI5kj67c17rcfAsEiCmzDWxmBbZI3+u0WpMjGpG+oOfH5Pr2rTAmj/T0FEJwbfZi2E42iQ6RU
	6OEpyo4T6USfeLX+ehDzndbeWg86yyDJYYOUFRPndamCVT7YJHlQsd3KUN/pUE8B/YW+ylBjx+Q
	==
X-Received: by 2002:a05:6000:3106:b0:487:403:84f1 with SMTP id
 ffacd0b85a97d-4887166de8bmr4451754f8f.9.1790253042465; Thu, 24 Sep 2026
 05:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922144629.586997-1-claudiu.beznea@kernel.org> <20260922144629.586997-9-claudiu.beznea@kernel.org>
In-Reply-To: <20260922144629.586997-9-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:30:15 +0100
X-Gm-Features: AclHuK8LT7REVPwwlcdlSrsYzoU8cyK6IUa0HajitJ8BO7GGQhxKGrn4EpV_TKQ
Message-ID: <CA+V-a8vh2bhmFV_kesEmsadg-5Q4v38ZD+iBXd0iMu06hhKzNQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] PCI: rzg3s-host: Add bridge::reset_root_port()
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:55=E2=80=AFPM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add bridge::reset_root_port(). This allows, on some devices, performing
> reads and writes to an NVMe endpoint after a link down/link up cycle
> without failures.
>
> The implementation of struct pci_host_bridge::reset_root_port() masks all
> enabled interrupts and synchronizes them before resetting the controller
> to prevent asynchronous events from interfering with the reset operation.
>
> struct rzg3s_pcie_host::started boolean was added to keep track of the
> controller state, since rzg3s_pcie_host_start() and rzg3s_pcie_host_stop(=
)
> are called from multiple paths: .reset_root_port(), .suspend_noirq() and
> .resume_noirq(). The flag prevents double start/stop and breaking
> reference counters for clocks and resets.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - this patch is new and is a split from patch 7 of v3
> - use a boolean to keep track of the controller start state; with this
>   the state management code from patch 7 of v3 was dropped
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 77 +++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 1c0353598b59..9cba898a9536 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -328,6 +328,7 @@ struct rzg3s_pcie_port {
>   * @intx_irqs: INTx interrupts
>   * @max_link_speed: maximum supported link speed
>   * @controller_id: PCIe controller identifier, used for System Controlle=
r access
> + * @started: The PCIe controller state (started or not)
>   * @num_lanes: The number of lanes
>   */
>  struct rzg3s_pcie_host {
> @@ -346,6 +347,7 @@ struct rzg3s_pcie_host {
>         int intx_irqs[PCI_NUM_INTX];
>         int max_link_speed;
>         enum rzg3s_pcie_controller_id controller_id;
> +       bool started;
>         u8 num_lanes;
>  };
>
> @@ -1110,6 +1112,11 @@ static void rzg3s_pcie_link_event(struct rzg3s_pci=
e_host *host)
>
>                 dev_info(host->dev, "PCIe link down, removing devices\n")=
;
>
> +               for_each_pci_bridge(dev, bridge->bus) {
> +                       if (pci_pcie_type(dev) =3D=3D PCI_EXP_TYPE_ROOT_P=
ORT)
> +                               pci_host_handle_link_down(dev);
> +               }
> +
>                 pci_lock_rescan_remove();
>                 list_for_each_entry_safe_reverse(dev, tmp, &bus->devices,
>                                                  bus_list)
> @@ -1855,6 +1862,9 @@ static int rzg3s_pcie_host_stop(struct rzg3s_pcie_h=
ost *host)
>         struct rzg3s_sysc *sysc =3D host->sysc;
>         int ret;
>
> +       if (!host->started)
> +               return 0;
> +
>         clk_disable_unprepare(port->refclk);
>
>         /* SoC-specific de-initialization */
> @@ -1876,6 +1886,8 @@ static int rzg3s_pcie_host_stop(struct rzg3s_pcie_h=
ost *host)
>         if (ret)
>                 goto power_resets_restore;
>
> +       host->started =3D false;
> +
>         return 0;
>
>         /* Restore the previous state if any error happens */
> @@ -1891,12 +1903,15 @@ static int rzg3s_pcie_host_stop(struct rzg3s_pcie=
_host *host)
>         return ret;
>  }
>
> -static int rzg3s_pcie_host_start(struct rzg3s_pcie_host *host)
> +static int rzg3s_pcie_host_start(struct rzg3s_pcie_host *host, bool set_=
started)
>  {
>         const struct rzg3s_pcie_soc_data *data =3D host->data;
>         struct rzg3s_sysc *sysc =3D host->sysc;
>         int ret;
>
> +       if (host->started)
> +               return 0;
> +
>         ret =3D rzg3s_sysc_config_func(sysc, RZG3S_SYSC_FUNC_ID_MODE, 1);
>         if (ret)
>                 return ret;
> @@ -1929,6 +1944,9 @@ static int rzg3s_pcie_host_start(struct rzg3s_pcie_=
host *host)
>         if (ret)
>                 goto assert_power_resets;
>
> +       if (set_started)
> +               host->started =3D true;
> +
>         return 0;
>
>         /*
> @@ -1942,6 +1960,58 @@ static int rzg3s_pcie_host_start(struct rzg3s_pcie=
_host *host)
>         return ret;
>  }
>
> +static int rzg3s_pcie_host_reset_root_port(struct pci_host_bridge *bridg=
e,
> +                                          struct pci_dev *pdev)
> +{
> +       struct rzg3s_pcie_host *host =3D pci_host_bridge_priv(bridge);
> +       u32 irqs;
> +       int ret;
> +
> +       /* Mask link up/down interrupts. */
> +       writel(0, host->axi + RZG3S_PCI_PEIE0);
> +
> +       /* Mask INTx and MSI interrupts. */
> +       irqs =3D readl_relaxed(host->axi + RZG3S_PCI_PINTRCVIE);
> +       writel(0, host->axi + RZG3S_PCI_PINTRCVIE);
> +
> +       /*
> +        * Make sure the next operations are not disturbed by any pending
> +        * IRQs.
> +        */
> +       synchronize_irq(host->msi.irq);
> +       for (unsigned int i =3D 0; i < PCI_NUM_INTX; i++)
> +               synchronize_irq(host->intx_irqs[i]);
> +
> +       ret =3D rzg3s_pcie_host_stop(host);
> +       if (ret) {
> +               dev_err(host->dev, "Failed to stop the host!\n");
> +               goto unmask_irqs;
> +       }
> +
> +       ret =3D rzg3s_pcie_host_start(host, false);
> +       if (ret) {
> +               dev_err(host->dev, "Failed to start the host!\n");
> +
> +               /*
> +                * Don't unmask IRQs. We are in a bad state here and we
> +                * can recover only through a suspend/resume cycle. Just
> +                * return and preserve the stop state.
> +                */
> +               return ret;
> +       }
> +
> +unmask_irqs:
> +       /* Unmask INTx and MSI interrupts. */
> +       writel_relaxed(irqs, host->axi + RZG3S_PCI_PINTRCVIE);
> +
> +       /* Unmask link up/down interrupts. */
> +       writel(RZG3S_PCI_PEIE0_DL_UPDOWN, host->axi + RZG3S_PCI_PEIE0);
> +
> +       host->started =3D true;
> +
> +       return ret;
> +}
> +
>  static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
>  {
>         struct device_node *np =3D host->dev->of_node;
> @@ -2104,9 +2174,12 @@ static int rzg3s_pcie_probe(struct platform_device=
 *pdev)
>         if (ret)
>                 goto power_resets_assert;
>
> +       host->started =3D true;
> +
>         bridge->sysdata =3D host;
>         bridge->ops =3D &rzg3s_pcie_root_ops;
>         bridge->child_ops =3D &rzg3s_pcie_child_ops;
> +       bridge->reset_root_port =3D rzg3s_pcie_host_reset_root_port;
>         ret =3D pci_host_probe(bridge);
>         if (ret)
>                 goto host_probe_teardown;
> @@ -2156,7 +2229,7 @@ static int rzg3s_pcie_resume_noirq(struct device *d=
ev)
>         struct rzg3s_pcie_host *host =3D dev_get_drvdata(dev);
>         int ret;
>
> -       ret =3D rzg3s_pcie_host_start(host);
> +       ret =3D rzg3s_pcie_host_start(host, true);
>         if (ret)
>                 return ret;
>
> --
> 2.43.0
>
>
