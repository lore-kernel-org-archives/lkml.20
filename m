Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297205;
	b=ZVpcoJ/Vgc76S9Hnr471+JFaKfAE7MEkPrGIn58xyacjIDFUPBajfma76lRPUT50G/7a
	 L5qTc5WtG6pC0KZXHSvzQkTxPGODt4BIP8wQU3XajouKGBbTYPkYblIp/+oCdn3AFk451
	 e6e3570yQwFDhVzz9SIbSAlDEARQA/j1ZclLVTlZ6pRJXL1F3zgRyCl92LUQXp84uduKv
	 qoEiyMFjwpiD1xe+ueq/hLnpSOYxv1PP3Ba9xlfvf2Lh8CXcspFm2pPwsGY3BvUBFyGXv
	 RkEAgvU693Pk7U8dU9BBUiqqZNTg79/Ruq1VEPAEenklXoYxaiMWAiMquXcaAvRGRyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/Ig+VOdZjoHggEoKr5B7bwbxLSf5OSLxc9dnZMZuTIQ=;
	b=GsG7gqc9m5fxKs1JZFJf2HdPG2C29ZB5x81R+eQNyHYzy12BkbCSGh7/WRjCx9IHs9Vf
	 hYy2YA1aGqe3EjGcv82NCCO1WDocJSdsog/q6AhrkbnM47kQHOv7cGMS4yKUb0LabLA/n
	 yef3ObtTBVseUuc0ZHgx1it/6Zi7sPQZqQNy+BAGRl8NO0z+7+bbiwb13gI+MqLly3oBE
	 F16wTS6FfCa26TH7Ir6X2FHcl0adNtX8MwbNL9xL2O5J7jJor9FwvOY0jkgq3Mwfl4lAQ
	 MP3LfWaFPJ2H5yqd2xDzO2G0wo8agF17WS72n5Imp4BaCobWaKlhvRnlegil018YP2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FJpre9F2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FJpre9F2
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c37b612635bso357392166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793297203; cv=none;
        d=google.com; s=arc-20260327;
        b=gUEOzqplm7JZmM4hQuO4HsJ4LlnDD/0PYQAZcviKn+7h1+q7N+uk9HlUPLlWVUyCMx
         XtDFgXrwDi3R6WQ8w7duwSc8g2z+SmxNdXRTLWQLv8TDmfb9VVM31oN86ILU2qOR1cs/
         4TJU4xiA6g7aq9g201CLVbBVIpWhF3ZkI9EXVbZ8Xvimtqc2tugS9FFuD/no1EVsMsbG
         ScR1wnlXB1P/WJJhKWktQcAaUG4ckfr6FmgJsmFG9GAl5KeOF8PLnYLcTOHEf6u4R6E/
         f4fc3t6o4bSdToolbgMqn1Qc9KZ1Fp8meMRAm00YVEHB5xD2kHRt7SlePZDUPMxIxUJR
         eIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Ig+VOdZjoHggEoKr5B7bwbxLSf5OSLxc9dnZMZuTIQ=;
        fh=c2UMnUmDGOdsbsLhSKikmkYEJexRdJMxS1eZ08ZabRY=;
        b=IfOCSPFV87/czkzfSPnN7GCaq2XxcCN8pxdQn+cOkvoKttAJs2mMzM+888G5W+FGaa
         4R8w8JELaV54sLORTPJTmMw5cJIJPxMA4jkFzMXve+NyUkRsaTu/oaQoIoTLwSiT+Pno
         n/fBFCi4wYywEdJO5vLWKN/3I5NXjF3oilWLC4loYc6pMtfbtcKyADD+nRKGoZASf4Px
         6H8JreiqSYrhhUIZsd/pzybfoVTR0+ptfSwfOzNFD5WxWuSA/FerlFKd9JH6uXsjA146
         AmChtqNlf09hLJTuuz1XLcM4T9J2YWKyfbZ4ZfqX+LwyehbJNRO1RIL4kDeQujPI+6QF
         W6Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793297203; x=1793902003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ig+VOdZjoHggEoKr5B7bwbxLSf5OSLxc9dnZMZuTIQ=;
        b=FJpre9F2uvUqa+EXQtN9hkCpru0N72zGWwVqLJOHWFrZhHnn3K+2K1ER3QzPNFb2fJ
         L7Tr3O1hfWcqekHamOUyIqglmvmzCCzTCotU5Ki+G5f7mDv7jBU1/eNhcRlZ3Dimv2KP
         aNfK/8MOQPuinExg8eyCbTr/UVlvEcQA1TNbWJ8EYND1X4TXII02sl5qmV9IM9Z2+6E4
         FcD8M65/qZAjG/azT9k3zQ9cub4kb9fMZQ4UlhbOfadOMBekVZ9UAIG5rnEYf2DGEnqh
         aoPBDLs3pk0mtZ++RckaXNMro62AmA58rUV6kPi8zy+fIyheNm52zTXWouvYBpCg9mvH
         F35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297203; x=1793902003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ig+VOdZjoHggEoKr5B7bwbxLSf5OSLxc9dnZMZuTIQ=;
        b=AT/m9iVwwqbGx++kkfuBe35ZzTYyPt+peZe5mlsnPnPoZubkreWd99dLcbcuUry0ki
         mG/N2Odvhr31iOY6b+Na6BWalMRh9gt1P4UR0MTCOgHkLkP0KT5ioiUQPmPXGga3WQE/
         5PbOCqYkcK+HaCIaZZ7j5rqIGEnCssNgS4FmpqeMwXteKrqSQQaAIERumXHX8gfwRwy8
         /wbrYypSF9VipFQ76LDGh48nSDnSdpn8QocQj631MteIASp7AO/Hy+UMJ2CbQ1IDGlCi
         8xdqRDlIG/E7tXCQm4AyaJDBN6BAIvEg3eHfaeoEkBmXGP8rr9jqnJ1jObYS3cJozaEz
         /6sw==
X-Forwarded-Encrypted: i=1; AKwUvBwhL7r+Cd9UhGyC6Q19NRG2fJxRtof+eekluOh51+v65dINgDsTdAq7Z6Q8x6FmEe02gcJmE4zToj9ElRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE+psDLU5kR28pLobgq48HLrit13HbLPud3bB92iY8+qzwnNKt
	PsVoqoQtCHOFpepQLC+x0xSJlwFfIPDb1iwzFS6HJtkscFFZFic/F3wdVIQmwBkqNAzfVJSGHcu
	AntFAco5tOUld7NuJGiW68qs8cO9NHXAjVtcOGOvW
X-Gm-Gg: AYBFou2VAEbq0jgRXgEisNn2jcA3ynRUEswkTMXXnl+vh64moheySFoFJES8rLa9KR8
	2qcrrsimiGmVjQR7yzhflzRZfCnzjmvl7yxYWgpApEHgu/3/QITcgw6KURfu1MJYqt9LkdfJJVu
	ybHJrqm+gndD/HARF0vQiXlDoL0rnLAJ/P7wfLv4ld6PdkEaOGlsUl6U35uHSQ3N+3n9OdG6Vb8
	apOJotSvVonhV3tuedBSfpCTBgSNNZpaQSaBNkOE97Zl3eikSQbZ0c6zL1bJf1U53l7bitW0jAX
	NLefsJXqp2vKgv7mnKOSLOfUGWPapg65znfoSaOO0/zweL9AA8dCjhECJka2T2Kh19BfDLP4/sE
	nD/BC7stSzG0rQniGLDqhW1n3mtXryZIvi3CDHA==
X-Received: by 2002:a17:906:7953:b0:c40:b477:dfa0 with SMTP id
 a640c23a62f3a-c49bdf3e797mr571689566b.18.1793297202249; Thu, 29 Oct 2026
 11:06:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019213054.3157159-1-dmatlack@google.com> <20261019213054.3157159-11-dmatlack@google.com>
In-Reply-To: <20261019213054.3157159-11-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 29 Oct 2026 11:06:15 -0700
X-Gm-Features: AclHuK_cLRpus0bFwOM3qezLRphS7L77ne14GXebvql4AuxivCEsM-6MlWYX4p4
Message-ID: <CALzav=f8+pTJ3m+99=85ntwouUePzzQBA2RJQ5Ogg23J-5rfkQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] PCI: liveupdate: Avoid enabling INTx on incoming devices
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Logan Gunthorpe <logang@deltatee.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:31=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> Avoid clearing PCI_COMMAND_INTX_DISABLE on incoming preserved devices.
> Pass whether INTx masking is broken on each preserved device to the
> next kernel instead of probing it, and skip clearing
> PCI_COMMAND_INTX_DISABLE in do_pci_enable_device() for incoming
> devices.
>
> Clearing PCI_COMMAND_INTX_DISABLE enables INTx on the device, even if
> only temporarily. pci_intx_mask_broken() probes whether INTx masking
> works by toggling PCI_COMMAND_INTX_DISABLE during enumeration, and
> do_pci_enable_device() clears it when a device that is not using MSI or
> MSI-X is enabled. A preserved device may assert INTx at any point
> during the Live Update, before its driver in the next kernel has set up
> interrupt handling, so enabling INTx could result in interrupts that
> no handler claims, on a line that may be shared with other devices.
>
> Pass the result of probing as a new bit in the probed results in
> struct pci_dev_ser, PCI_DEV_SER_PROBED_BROKEN_INTX_MASKING, which
> reflects struct pci_dev::broken_intx_masking. If the previous kernel
> did not pass it, fall back to probing INTx masking.
>
> Drivers bound to incoming devices are responsible for enabling INTx once
> they are ready to handle it. pci_alloc_irq_vectors() already does so
> with pci_intx() when it falls back to INTx, and vfio-pci clears
> PCI_COMMAND_INTX_DISABLE itself in vfio_pci_core_enable().

Thinking about this a little more, and based on internal experience
with Live Update within Google, the kernel should reject preserving a
device with broken_intx_masking=3D1. Otherwise, there is no way to
ensure that the device does not assert its interrupt while the kexec
is ongoing. The kernel would be forced to mask it in the interrupt
controller, which means adding even more Live Update support across
the kernel, and which gets complicated when the interrupt line is
shared by multiple devices.

I will reject devices with broken_intx_masking=3D1 in v2.

> Assisted-by: LLM
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/pci/liveupdate.c    | 37 ++++++++++++++++++++++++++++++++++++-
>  drivers/pci/liveupdate.h    |  6 ++++++
>  drivers/pci/pci.c           |  8 ++++++++
>  drivers/pci/probe.c         | 10 ++++++++++
>  include/linux/kho/abi/pci.h |  3 +++
>  5 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> index ac4525568818..8a74762c3f7d 100644
> --- a/drivers/pci/liveupdate.c
> +++ b/drivers/pci/liveupdate.c
> @@ -216,6 +216,11 @@
>   *    bridge implements), since that would disrupt memory transactions
>   *    targeting the device or devices below it. Instead, the previous ke=
rnel
>   *    passes the results of probing in struct pci_dev_ser.
> + *
> + *  * The PCI core does not enable INTx (i.e. clear PCI_COMMAND_INTX_DIS=
ABLE)
> + *    on incoming preserved devices, neither while probing whether INTx =
masking
> + *    works nor when the device is enabled, since the device could then =
raise
> + *    interrupts before its driver is ready to handle them.
>   */
>
>  #define pr_fmt(fmt) "PCI: liveupdate: " fmt
> @@ -650,7 +655,11 @@ static void pci_liveupdate_save_bar_masks(struct pci=
_dev *dev,
>  static void pci_liveupdate_preserve_probed(struct pci_dev *dev,
>                                            struct pci_dev_ser *dev_ser)
>  {
> -       u64 supported =3D 0, probed =3D 0;
> +       u64 supported =3D PCI_DEV_SER_PROBED_BROKEN_INTX_MASKING;
> +       u64 probed =3D 0;
> +
> +       if (dev->broken_intx_masking)
> +               probed |=3D PCI_DEV_SER_PROBED_BROKEN_INTX_MASKING;
>
>         if (dev->hdr_type =3D=3D PCI_HEADER_TYPE_BRIDGE) {
>                 supported |=3D PCI_DEV_SER_PROBED_WINDOWS;
> @@ -1213,6 +1222,32 @@ int pci_liveupdate_read_bridge_windows(struct pci_=
dev *bridge)
>         return 0;
>  }
>
> +/**
> + * pci_liveupdate_intx_mask_broken() - Get whether INTx masking is broke=
n on an
> + *                                     incoming device
> + * @dev: The PCI device
> + *
> + * Get whether INTx masking is broken on @dev as determined by the previ=
ous
> + * kernel, so that INTx masking does not need to be probed.
> + *
> + * Return: 1 if INTx masking is broken, 0 if it is not, or -ENODATA if @=
dev is
> + * not incoming-preserved or the previous kernel did not pass whether IN=
Tx
> + * masking is broken on @dev.
> + */
> +int pci_liveupdate_intx_mask_broken(struct pci_dev *dev)
> +{
> +       u64 probed;
> +
> +       guard(rwsem_read)(&pci_liveupdate.rwsem);
> +
> +       if (!pci_liveupdate_read_probed(dev,
> +                                       PCI_DEV_SER_PROBED_BROKEN_INTX_MA=
SKING,
> +                                       &probed))
> +               return -ENODATA;
> +
> +       return !!probed;
> +}
> +
>  /*
>   * Check if the windows of @bridge have been read from hardware. Outside=
 of x86
>   * that does not happen during scanning.
> diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
> index 98d23e217308..7f86cc85deee 100644
> --- a/drivers/pci/liveupdate.h
> +++ b/drivers/pci/liveupdate.h
> @@ -22,6 +22,7 @@ bool pci_liveupdate_is_outgoing(struct pci_dev *dev);
>  int pci_liveupdate_read_bar_masks(struct pci_dev *dev, unsigned int nr_b=
ars,
>                                   u32 *bar_masks, u32 *rom_mask);
>  int pci_liveupdate_read_bridge_windows(struct pci_dev *bridge);
> +int pci_liveupdate_intx_mask_broken(struct pci_dev *dev);
>  void pci_liveupdate_claim_bus_resources(struct pci_bus *bus);
>  #else
>  static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
> @@ -74,6 +75,11 @@ static inline int pci_liveupdate_read_bridge_windows(s=
truct pci_dev *bridge)
>         return -EINVAL;
>  }
>
> +static inline int pci_liveupdate_intx_mask_broken(struct pci_dev *dev)
> +{
> +       return -EINVAL;
> +}
> +
>  static inline void pci_liveupdate_claim_bus_resources(struct pci_bus *bu=
s)
>  {
>  }
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 853c84a2c782..43af72d1e5c9 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2184,6 +2184,14 @@ static int do_pci_enable_device(struct pci_dev *de=
v, int bars)
>         if (dev->msi_enabled || dev->msix_enabled)
>                 return 0;
>
> +       /*
> +        * Leave INTx disabled on devices preserved across Live Update, s=
ince
> +        * the device could raise interrupts before its driver is ready. =
It is
> +        * up to the driver to enable INTx once it is ready.
> +        */
> +       if (pci_liveupdate_is_incoming(dev))
> +               return 0;
> +
>         pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
>         if (pin) {
>                 pci_read_config_word(dev, PCI_COMMAND, &cmd);
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index a53d0077a08b..badce31b34f8 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1976,6 +1976,16 @@ static u8 pci_hdr_type(struct pci_dev *dev)
>  static int pci_intx_mask_broken(struct pci_dev *dev)
>  {
>         u16 orig, toggle, new;
> +       int ret;
> +
> +       /*
> +        * Toggling PCI_COMMAND_INTX_DISABLE could let a device preserved=
 across
> +        * Live Update raise interrupts before its driver is ready, so us=
e the
> +        * result determined by the previous kernel for those devices.
> +        */
> +       ret =3D pci_liveupdate_intx_mask_broken(dev);
> +       if (ret >=3D 0)
> +               return ret;
>
>         pci_read_config_word(dev, PCI_COMMAND, &orig);
>         toggle =3D orig ^ PCI_COMMAND_INTX_DISABLE;
> diff --git a/include/linux/kho/abi/pci.h b/include/linux/kho/abi/pci.h
> index 84a1bf71eeca..badcf2f01be7 100644
> --- a/include/linux/kho/abi/pci.h
> +++ b/include/linux/kho/abi/pci.h
> @@ -95,10 +95,13 @@ struct pci_dev_ser {
>   *    window.
>   *  * PCI_DEV_SER_PROBED_PREF_64_WINDOW: The bridge's prefetchable memor=
y
>   *    window is 64-bit.
> + *  * PCI_DEV_SER_PROBED_BROKEN_INTX_MASKING: INTx masking cannot be use=
d on
> + *    the device, i.e. struct pci_dev::broken_intx_masking is set.
>   */
>  #define PCI_DEV_SER_PROBED_IO_WINDOW           BIT_ULL(0)
>  #define PCI_DEV_SER_PROBED_PREF_WINDOW         BIT_ULL(1)
>  #define PCI_DEV_SER_PROBED_PREF_64_WINDOW      BIT_ULL(2)
> +#define PCI_DEV_SER_PROBED_BROKEN_INTX_MASKING BIT_ULL(3)
>
>  /*
>   * The size of struct pci_dev_ser when this ABI was introduced. Since fi=
elds
> --
> 2.56.0.212.g129ede20d9-goog
>
