Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C204F055A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567069; cv=none; b=k8UIwoQX+vFyTGbklUlSXb9olrnr8Xfqxmp2UQe44nhFjgeRhB46rBbvg4v3hqKTJZraorp0rMSe0a0VDc7XbrvbqL/jE1VqaTWK92NItZNOW0Bj83ITwc9bY6uv6K+cwYPV2W6FId9Odknb4tznvr3RJ61Gfoyfki4QPw3HJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567069; c=relaxed/simple;
	bh=hk4+HMQnsllYIyOf3j57LkJbNZU74QO2e4hXgGvM1F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0AEtJHB1ym4AFaqJgEKKoY9SMhBRYSuU5GKLteTX9/x+0VmvJz5iY2Wp+mfp3tStWnTJ/COdCAMP7i1R3OUHTOQ3eyIIFHRd94yu8mUs4yFztKGd1BmaKO0UbWM0vtuK4h4oXLk2GyMel5/ylSnojd9mU8FMXrBS8VCyuB3BtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqpSxXjU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqpSxXjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E7F1F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789567060;
	bh=uKnJW8f/FSk1pppP1uAfhlE6zh8Ga0yCHU2CLx9f9Xw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TqpSxXjU8XlX0VMxfJb32ADGVHsrKy+hl9kM3ptEqaqiS5rndUE8bU2j5hm2Aag8q
	 mlYtPYEvr+KAWkpQrZVCSANexOjGMG2fdHnGwe9U14Xk1v91rrkXygu529xXI3YQNt
	 /9LBIsp4HXDpzbDxQIHI1ymQ+WlqUm+kkdiM+d6MsJuKS3Wl6V4BDEXLz9S+FII9/n
	 kLChUFdSlSysYMrDgy9xoHMxMnYEh+IgqQwWTnJgmiFN7Ng0YhWuDAL4V207lK6pZs
	 63RUYoIxj21ZSo6lxf2VurtMRjfjyeJA+9S+XoxHK4xSM8zcl7WMLH2IIky3xni6pB
	 TE+J9SPC9WnsQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a306a4f797so7607101fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9omwfznwAJhPTkjVm+yeFhw6dGKU6z3ez/Wbctara15epEilgRXJIR98CzKc9SPJYelf6a4xryChK7mM=@vger.kernel.org
X-Gm-Message-State: AFuF++nauZS8Z27mQKyJoC71e/M9RuWy9tOUhbn7oc9VOhCM4vt4geRL
	OyRsQ458/prbL9S2wrYEv82tuNSid2DK/+EQsGNUZel81j854c/l7C1/RRKiK4c7jUy9u5Z4WSR
	dK9xCQRsUPAm/nv7qBYVY0h1nhwEvANg=
X-Received: by 2002:a2e:a596:0:b0:3a1:30c4:d95 with SMTP id
 38308e7fff4ca-3a5dc9722b4mr5269891fa.5.1789567059264; Wed, 16 Sep 2026
 06:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916051034.180226-1-mario.limonciello@amd.com> <20260916051034.180226-3-mario.limonciello@amd.com>
In-Reply-To: <20260916051034.180226-3-mario.limonciello@amd.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 16 Sep 2026 15:56:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gZ11m=CYQXp6S_PL81JZCx4sQCgh-qa+_2sm7nSTe1SQ@mail.gmail.com>
X-Gm-Features: AcwNN1U4NVC2eEoFtln5IEyBPEY_uTbbCovKTLH5yK8bF8iUAlcHlT1zrpYWbl0
Message-ID: <CAJZ5v0gZ11m=CYQXp6S_PL81JZCx4sQCgh-qa+_2sm7nSTe1SQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] PCI: Put PCIe bridges with downstream devices into
 D3 at hibernate
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-pm@vger.kernel.org, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Denis Benato <benato.denis96@gmail.com>, =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>, 
	Eric Naim <dnaim@cachyos.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 7:10=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> From: "Mario Limonciello (AMD)" <superm1@kernel.org>
>
> During S3 suspend, pci_pm_suspend_noirq() puts PCIe bridges with
> downstream devices into a low-power state (D3hot or D3cold) when the
> platform allows it.  The hibernate poweroff_noirq path never did this:
> it only called pci_prepare_to_sleep() for devices with no subordinate,
> so bridges with active children were left in D0.
>
> The platform firmware leaves bridges alone when the system enters S4.

Well, that depends.  IIRC there were platforms on which it actually
removed power from them unless wakeup was enabled in the past.

> This prevents being able to meet various energy certification criteria
> for different parts of the world, particularly in designs with a dGPU.

Fair enough.

> Align the hibernate flow with suspend by making pci_pm_poweroff_noirq()
> use pci_pm_suspend_noirq_common() instead of the open-coded
> pci_prepare_to_sleep() call.  This reuses exactly the logic the S3
> suspend path uses, including the skip_bus_pm handling that keeps a
> bridge in D0 when a downstream device must stay in D0 (e.g. a
> configured wakeup source) and the pm_suspend_no_platform() bus-PM skip.

And that's key here, so the patch subject should be something like
"PCI: Align hibernate poweroff flow with suspend flow for bridges".

> No restore-side change is needed: the hibernation image is snapshotted
> during the freeze phase, before poweroff_noirq runs, so the powered-down
> bridge state is never part of the image, and resuming from it goes
> through a full boot that re-enumerates and retrains the PCIe links.
>
> Because the poweroff_noirq path now mirrors the already-shipping
> suspend_noirq path and is guarded identically, bridges that must remain
> in D0 are unaffected; only bridges that S3 suspend would have powered
> down are now also powered down at hibernate.
>
> Cc: AceLan Kao <acelan.kao@canonical.com>
> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> Cc: Denis Benato <benato.denis96@gmail.com>
> Cc: Merthan Karaka=C5=9F <m3rthn.k@gmail.com>
> Tested-by: Eric Naim <dnaim@cachyos.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

With the above addressed

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/pci/pci-driver.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 8334214f8c1ed..3f80c8e6e0e52 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -818,7 +818,7 @@ static void pci_pm_complete(struct device *dev)
>
>  #endif /* !CONFIG_PM_SLEEP */
>
> -#if defined(CONFIG_SUSPEND)
> +#if defined(CONFIG_SUSPEND) || defined(CONFIG_HIBERNATE_CALLBACKS)
>  /**
>   * pci_pm_suspend_noirq_common - prepare a device to enter a low-power s=
tate
>   * @pci_dev: pci device
> @@ -862,7 +862,7 @@ static bool pci_pm_suspend_noirq_common(struct pci_de=
v *pci_dev)
>
>         return false;
>  }
> -#endif /* CONFIG_SUSPEND */
> +#endif /* CONFIG_SUSPEND || CONFIG_HIBERNATE_CALLBACKS */
>
>  #ifdef CONFIG_SUSPEND
>  static void pcie_pme_root_status_cleanup(struct pci_dev *pci_dev)
> @@ -1217,6 +1217,8 @@ static int pci_pm_poweroff(struct device *dev)
>         struct pci_dev *pci_dev =3D to_pci_dev(dev);
>         const struct dev_pm_ops *pm =3D dev->driver ? dev->driver->pm : N=
ULL;
>
> +       pci_dev->skip_bus_pm =3D false;
> +
>         if (pci_has_legacy_pm_support(pci_dev))
>                 return pci_legacy_suspend(dev, PMSG_HIBERNATE);
>
> @@ -1259,6 +1261,7 @@ static int pci_pm_poweroff_noirq(struct device *dev=
)
>  {
>         struct pci_dev *pci_dev =3D to_pci_dev(dev);
>         const struct dev_pm_ops *pm =3D dev->driver ? dev->driver->pm : N=
ULL;
> +       bool skip_bus_pm;
>
>         if (dev_pm_skip_suspend(dev))
>                 return 0;
> @@ -1280,8 +1283,9 @@ static int pci_pm_poweroff_noirq(struct device *dev=
)
>                         return error;
>         }
>
> -       if (!pci_dev->state_saved && !pci_has_subordinate(pci_dev))
> -               pci_prepare_to_sleep(pci_dev);
> +       skip_bus_pm =3D pci_pm_suspend_noirq_common(pci_dev);
> +       if (skip_bus_pm)
> +               goto Fixup;
>
>         /*
>          * The reason for doing this here is the same as for the analogou=
s code
> @@ -1290,6 +1294,7 @@ static int pci_pm_poweroff_noirq(struct device *dev=
)
>         if (pci_dev->class =3D=3D PCI_CLASS_SERIAL_USB_EHCI)
>                 pci_write_config_word(pci_dev, PCI_COMMAND, 0);
>
> +Fixup:
>         pci_fixup_device(pci_fixup_suspend_late, pci_dev);
>
>         return 0;
> --
> 2.43.0
>
>
