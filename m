Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826774;
	b=QWu1YnPx91IMwDlhPBR/FFM0x2MgNYzuW5xkg2UU3b+B+H2gEVgAZSA6nmfGPV2G/yGK
	 8RTMs74eMyeRWEgsvf8znLtPvDIiEw1cR1QZJc6ENX2z0bwn8cKbxCdX483DK4ZA77tlV
	 SXq+ewNg7oau1NlpgWV+JL5LGyKxZ5aJd117j7FTEAmqTjtfP6ho8SoxL8iC5V61pcO+l
	 /PRdAVLOXvsU+xf7BG0Hfk8Dcu/kzxkFYzD2YPFoTaCXz5rF/QrKwc0Pabw52BrPMZ7k7
	 AeQmsuBsyMGXGzi6krGyJuf8WJ0409lh0QP21CVuKnvZJBYR9BoUqyxq3gGXPxkEzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826774;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=mJaN0b3PvIpi2y0OVrA15M2BP9AXuuHR0w2trP7Mx30=;
	b=3vFHBUHZodcVUgtDUxyrTuK1XjiVW8h7oiErvLZ/u8Jp2tM+oTF+bIONQZRaq6kJZswM
	 PPIJJCvP6iBaoVTOSMh6Nvh9ctW9ok33mU1iF6DWte2eqsYi4ezb8oIor9hyc5JjU53jp
	 pJI+cIsp85KdLziLH9alsyqdQu+vcnWHI4gXz6t5dj7H59NwgUyO4Cvi8ZMezlrr5WW0B
	 CmJ132/Wui+KtblxXedjl/yIRTPigVKz9FsyxnU5Jv5k1E0VzeDN8oTx5N2D/aC3Ha0xE
	 fN9uIMa8pzhDnMD6PsbN174TvA5D9SXz2NRppNRD1r3cqDlo2CTZ4b5JVhz91eVFXrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="PXoua/tt";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dE9pU4lL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1294E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1294E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PXoua/tt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dE9pU4lL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794826773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJaN0b3PvIpi2y0OVrA15M2BP9AXuuHR0w2trP7Mx30=;
	b=PXoua/ttbs2TYeeA0HoOhRUDMnm4elkBV+egkvn/oxMiNQdLi/87FTb65EoHOIRvbolaQI
	2EbKV7HqfuvRL2S5/SzFqzaIsrYMFLSh2OlyX/LwyG/UGS9v6jU+NOn1GP5ZjoeuVs0DOX
	iDShwsfqBYAS9iOcULlvfLXZP0LTp3s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-J47xBNfUOVydwMGfy5C4sQ-1; Mon, 16 Nov 2026 05:59:31 -0500
X-MC-Unique: J47xBNfUOVydwMGfy5C4sQ-1
X-Mimecast-MFC-AGG-ID: J47xBNfUOVydwMGfy5C4sQ_1794826770
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so2367899f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794826770; x=1795431570; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJaN0b3PvIpi2y0OVrA15M2BP9AXuuHR0w2trP7Mx30=;
        b=dE9pU4lLn+uj6JDxjwu2uledLA1yRp98d8PVwi78uar4h0XfPCiW2fPnvVjvIHEu5o
         OBGF/awNMYRBwv9S5FywKBG0xzkQmb5vDmMU8uV2z/c0LflBpQsIyhBz4X9eJCm7R2tO
         765xVe2Vc2TyZXfFqf6jYaCUUj4XIyTDqTVTcpU1CL0Qjrfq/Zi6csQmA0WfqIygIQmu
         LNew0tgk0rKAGRuZ/jt8iHGdOugmCzuVxLsbptgJyzi3ECPudXnItUib/A4B9/JltMCm
         Gn38qa0L9b9SdJOBfJDtBHNE9s6Af5vmM14WxBxb1rDCo8Sa8mH/VjRRRDjfjRbonOEh
         Hgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826770; x=1795431570;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mJaN0b3PvIpi2y0OVrA15M2BP9AXuuHR0w2trP7Mx30=;
        b=hu5atszpPfmqD9nV/2qsc4ZwQkgjj5Om9bTALjSj2b/68um2NJjbrWgWGYbUQJEjxA
         8C5vCZLeZ2GiXCQszZa6zrTdCz8JWG9K807gWxjXROCVJMHd508gyrL59NhFZqjLXVcc
         tG/ZkzexB6WB2drTqJ2aP0yukz+PsP/hNd94ykquCBQ049gBHQaiS6pZE5BHeFU02WMG
         vSPI3GGeVUl+4Ep/MTAYfNku+tJqZO/REaDEemB1gsObpOU12da8Wns2uK+hjMPCJ1Kc
         o0TpAmA4ydmpmOh/gqJmKsQQbvMvy5/cHDjpYw9KeIMwycl04Tm28pOMp6ziaGka+TMM
         pQuw==
X-Forwarded-Encrypted: i=1; AL+hErGRA5bE7ihAZsXueFJl2f/Cio9M5Qefag0LdhJDTdhnIGK6I+eLzgtlwg5xjxCOunPk8UhM+HURd2rqrE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/htsQIrnLZdqB0u2Am8f17WIK2WIKZdmStwZXxJAu6+lsKSpSq
	y1HZO5aZwUYa7PUjvh3b4M9Mv5L8Fqkcu3ZjYBVgmfS1P4bsjxth1SPJ1ALLshZmuyC0IlamPra
	/2V9Al4cDD6sjERrd2noJ1mlgwL9sHRIVvn+mdiZX26Nh3aiOqt9NGlZ7BXTL4U2UQQ==
X-Gm-Gg: AZFdTZfom9LHlijk6uiZo6lgEOYvFu5Rsx1RkpgVv2hnjXKUUZCNMaTDDnHbH+O/j9Y
	2YZrKdYMvpkl30xhk31ZBYdiK1cr0zs+4UOIBi/0fUVVky57wWx+lSLgCCWtkiKN7PYZCsgXjLp
	H+Q8g2I60WdG6Egbke/ttADh3x9LwzuGs8PbyBtcCO7pfheUZ9DwWrF2ltAtEgPLMxa6kPdvK55
	lhVu+5NUFHxX4yhJMryRkMeHaEalYr4C90gjeTpigLq9EZ9Y3U6lQh6te7tlm7TLBN3nBlppzGW
	mJ8z0mKg29PRD4Y9spRN9hwtmUn7nSnIBm2EoZgdFaOWJHTq6X0jfGQVTEcN3uo9XjT64VA5RU9
	LilQTE27VHDzeP/+xDmT2HCAJ7Tl+QELYbH8fJvtM1gTqApZrqT3+1cb0DvP/M11Yoe2iPkH7sc
	Gl54fPcUfLM8V7nhkzLrSeKCITOdk3vRTg+4kkQnA=
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr15496737f8f.46.1794826769927;
        Mon, 16 Nov 2026 02:59:29 -0800 (PST)
X-Received: by 2002:a05:6000:1614:b0:48e:7b12:aca5 with SMTP id ffacd0b85a97d-49c72e85eadmr15496699f8f.46.1794826769302;
        Mon, 16 Nov 2026 02:59:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm20381961f8f.34.2026.11.16.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:59:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Borislav Petkov <bp@suse.de>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, Han Gao
 <rabenda.cn@gmail.com>, stable@vger.kernel.org, Han Gao
 <gaohan@iscas.ac.cn>
Subject: Re: [PATCH] firmware/sysfb: Avoid simple-framebuffer behind DT PCI
 host bridges
In-Reply-To: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
References: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
Date: Mon, 16 Nov 2026 11:59:27 +0100
Message-ID: <xlv1fqx1rqi8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org> writes:

Hello Han Gao,

> From: Han Gao <gaohan@iscas.ac.cn>
>
> With SYSFB_SIMPLEFB, sysfb registers a simple-framebuffer device that
> claims the framebuffer memory when it is added. On DT systems, the PCI
> host bridge may probe later and then fails to claim its memory window.
> On QEMU RISC-V virt with EDK2, a bochs-display and pci-host-generic
> built as a module:
>
>   [    0.703813] pci-host-generic 30000000.pci: resource collision: [mem 0x40000000-0x7fffffff] conflicts with BOOTFB [mem 0x40000000-0x403e7fff]
>
> In that case, register an efi-framebuffer device instead. It claims no
> memory before it probes, and commit 64c8a0cd0a53 ("efi/arm: Defer probe
> of PCIe backed efifb on DT systems") makes it wait for the host bridge.
>

I think this is a workaround and it just works because sysfb does not add
a resource (using the platform_device_add_resources() helper) when adding
the platform data for the device.

> Tested on a HiFive Unmatched with EDK2 and a PCIe graphics card, and on
> QEMU.
>
> Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> In QEMU, efifb takes over with SYSFB_SIMPLEFB and efidrm without it.
> With pci-host-generic built in, simpledrm is still used.
> ---
>  drivers/firmware/efi/sysfb_efi.c | 16 ++++++++++++++++
>  drivers/firmware/sysfb.c         |  8 +++++++-
>  include/linux/sysfb.h            |  6 ++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index 2338de73c62c..5c2cb87178ff 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -421,6 +421,22 @@ __init void sysfb_apply_efi_quirks(struct screen_info *si)
>  		dmi_check_system(efifb_dmi_swap_width_height);
>  }
>  
> +/* Returns true if the EFI framebuffer is in a DT PCI host bridge window */
> +__init bool sysfb_efifb_behind_dt_pci(const struct screen_info *si)
> +{
> +	struct device_node *np;
> +
> +	if (si->orig_video_isVGA != VIDEO_TYPE_EFI || !IS_ENABLED(CONFIG_PCI))
> +		return false;
> +
> +	np = find_pci_overlap_node();
> +	if (!np)
> +		return false;
> +
> +	of_node_put(np);
> +	return true;
> +}
> +

I don't think this that much. I feel that is adding DT + PCI logic that is
platform specific. Instead, maybe what can be done instead is make the sysfb 
logic consistent between "efi-framebuffer" and "simple-framebuffer" platform
data setup.

That is, not add a IORESOURCE_MEM to prevent platform_device_add() to add it
to the global memory resource list. Instead, the framebuffer address + size
could be passed to the simpledrm driver through the simplefb_platform_data.

The simpledrm driver then could claim the memory at probe time, which is what
efidrm does as well.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

