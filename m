Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073084;
	b=SQzacGrK2wxEs1FIACSPjXrcUbjyjsMCPhDjTa1vKLSKM9pH32A5qMl/l6fXcNGGPv1Q
	 rhMvKja+AyTSA1YkQbVcX9SLv0H62NRs2fsOaJFkXoXZpH9nhXJ+bkeeAIIqyVmVCnkXL
	 0tWnc1QqbyY10jYLIZtvRV8s1u1TiNviFPZtoTJs/OQpb4W9+2BkACc7rzBNSbRUXSMWY
	 XhWeXhEugQyeXOGwJzT3pgR2ngNV0xue869qV+zaao0bQ8vKXnfg4PAQQHSdUAbHoxyk8
	 HiP8p/hYOHVqqs0v4qKFf+vIZLepplt4XC5J1J0dOjMWwDJJKxxQ3zFfMGDil6W2FaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073084;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z24fIgrg332IE6A60r7YoNBcp+hbvJa6DyUXEc2zlxA=;
	b=p4xx7yOHIYNswtTOBCEC/w0RRAYkoSE7PdqdLON16pEAzJx3l/CIQMO00iUaICPB2pth
	 kGDI+fLYxvbTw06qtM4AtuvAVH+KkJyV3QrHkJsfsyzzePO1aHxlK2DUEpdID5w7USDz4
	 JboaLmJzkRNRFX3ZJXL+HzHmtXFRlmfVV/sV6aq2oaZdH+DjImU7vq0Fjhc/YRaBXuU6c
	 sfZPCLJtA95m60kxvWw3LmmTAgbynoZ5bKbxBbg/KSpqbasXrZdFBNX5L7SK43HlEtkqS
	 PrfVEdCluvQXT+maO+JX/wCrok6k1zhoGQV+w9PXnasaXxZe0yzXRqQTXr75EzKY/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H5ztWKaV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UToDImFb;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E3C606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E3C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H5ztWKaV;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UToDImFb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794073081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z24fIgrg332IE6A60r7YoNBcp+hbvJa6DyUXEc2zlxA=;
	b=H5ztWKaV7PH/3Ved7RuKZSru+bN6CAalPIaoK9/gW+tAimk3TDf2lLH1AHK05UJVovSvwy
	kfw/4zucOQw/YE7873fOkagR3Q8dhP0T7x45klS12ReDjZuouCHVpyAGxCHV8xdNu9YoNN
	yXTgpul8DerW4mKN0MN+RYZlcm6OPiQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-nRgjB-G3PRGQ6I5KXTWz0A-1; Sat, 07 Nov 2026 12:38:00 -0500
X-MC-Unique: nRgjB-G3PRGQ6I5KXTWz0A-1
X-Mimecast-MFC-AGG-ID: nRgjB-G3PRGQ6I5KXTWz0A_1794073080
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0d978e4faso24148797b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794073080; x=1794677880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z24fIgrg332IE6A60r7YoNBcp+hbvJa6DyUXEc2zlxA=;
        b=UToDImFbgIathTRFcm0KCUed+Rq+pCXk9AjiiRXnexCf10ZTT/1t33J3uGJtXxw3oo
         L2vBOwAUTi87dlYvU7h68uQrvBfEgpf708DjZkBr2gvk5zIZ0keeqITRbi86k0zyc/mT
         mzcIoBIUfUgkgWfQKM+zkRkHSZMRmalmeWRnydT7DwzfKeQ7e+KYX8G9mnzcXmIG3wFe
         Nqn8rMKoWkNxXJ3O9y2MQMNsPKI4Hqz4iMbF/3jl5LiiliNbZBXgbDQ/Duq9UgOIQzzl
         85pD+pmL7M8/NQio698gkwH2SVGby2o0OaDfot4/PflOP0uxquxVvy1e8tYTpmSess6p
         hxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073080; x=1794677880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z24fIgrg332IE6A60r7YoNBcp+hbvJa6DyUXEc2zlxA=;
        b=JAzyEJJg1eP6rvfrtva8EoaehiQOchFmpD2xV1sQRgMyZsorrFdRCCnvPRxIT059ML
         Hb6+ziYk68ltl93iJNFY2p6XloNuQVDZMtgrq2iwnLPlNcsW6pdGqs8WykU5D5CtR4JU
         U27HWpzrKZSF1QLlyo5SkeO2GaWetb5y85POkXU7FEE9DG9yG7o67nADQ899lvAWsdZt
         SE/hVY21WIUIhUk065fRJTe+OPjLo8L7EgbVeYgFsROUFyvmXR34MlqiuBb1iu8v65+p
         EoFsBzUdVvKBb2hLSok7t7+Xkp/n3G4NzE4vjDg8jpIqHbVFyJIMp0JERtkh9cCrghHU
         M3rQ==
X-Forwarded-Encrypted: i=1; AL+hErESThwYMi4IhPq3s45aFj2QDEwY89iovK8ndOaWk2c/zqjqy8QUD6XXTTPA1nOAxiu5Q6Dzdorlkrlv0To=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NDCHkPYqauQlvgtNY02wH2k7Qsuqq0xnwUNH2HUxOEUUXLoMO
	Lf1M0HwbwtDconc9WeUeiGskJ2FIQdsyZPauQO2Bf23HfIRejzGuJa0npdzF7vkcu2yj7XXP8Fy
	n7M3Ffjl1U3euq4s7XHeRIih+EWbAJhG8zsb8wc91UwqQsxGnfyXlY0JSKHI5sDdWXQ==
X-Gm-Gg: AYBFou1UbpUogbm2wXpU1cKAK/qGfKxeatIL9hvbs2XLdcTH11K7PivLZU9Vj8yZRwi
	e3f45TNt2hElSt+JzOr10qg/e/YPfEXoU+sk2gOQaFxFluFHr5AB2wH+wa2b27E/TzgpB6tww+S
	MNUz0VzCfd2gzTD4m8zT+ktXMsuG0fBAJA1/8KyyQTRAoliZCuuII3Jq0EilJrF9CRwzwU6olU5
	9oi+29yoUy7bpubXE0UwIUsRVgneRZ7OCp2gwwYCvOwqlCG5dMO+fdOpp+H+AUfTHyTc6rfFxDG
	9UKw9WWBY9sDAsnLwadUDIOxTAE85I6IFK0ampHbB1haWIRbenZysRosMqM/5gO0mMqf/DaB6ee
	Igt+3A3zerogNMuPEXYPSKR/b
X-Received: by 2002:a05:690c:dc3:b0:8b0:ecb2:883a with SMTP id 00721157ae682-8b341b65934mr35021217b3.62.1794073079981;
        Sat, 07 Nov 2026 09:37:59 -0800 (PST)
X-Received: by 2002:a05:690c:dc3:b0:8b0:ecb2:883a with SMTP id 00721157ae682-8b341b65934mr35020987b3.62.1794073079453;
        Sat, 07 Nov 2026 09:37:59 -0800 (PST)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f525fsm44439167b3.5.2026.11.07.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:37:58 -0800 (PST)
Date: Sat, 7 Nov 2026 12:37:56 -0500
From: Jennifer Berringer <jberring@redhat.com>
To: gaohan@iscas.ac.cn
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Borislav Petkov <bp@suse.de>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
	stable@vger.kernel.org, Xincheng Ji <jixincheng@ultrarisc.com>,
	Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH] firmware/sysfb: Avoid simple-framebuffer behind DT PCI
 host bridges
Message-ID: <20261107173756.1d273aa5@redhat.com>
References: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>
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
In-Reply-To: <20261107-sysfb-dt-pci-efifb-v1-1-86d6c598671a@iscas.ac.cn>

Hi,

On Sat, Nov 07, 2026 at 04:46:40PM +0800, Han Gao via B4 Relay wrote:
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
> Tested on a HiFive Unmatched with EDK2 and a PCIe graphics card, and on
> QEMU.
> 
> Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---

This issue also affects UltraRISC DP1000 boards such as Milk-V Titan.
For that system, a2d4a2d2479b ("clk: ultrarisc: Register DP1000 clock
provider earlier") was recently added to clk-next and can serve as a
workaround to make its pci driver be able to initialize before sysfb,
but only if both the clock and pci drivers are built in rather than
built as modules.

I confirmed that your patch resolves the issue on Milk-V Titan even when
building with CONFIG_PCIE_ULTRARISC=m, making a PCIe graphics card able
to initialize and function without issue. CC'd the ultrarisc developers.

Tested-by: Jennifer Berringer <jberring@redhat.com> # Milk-V Titan

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
>  __init void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd)
>  {
>  	if (si->orig_video_isVGA == VIDEO_TYPE_EFI && IS_ENABLED(CONFIG_PCI)) {
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 8833582c1883..8853a74560b9 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -164,8 +164,14 @@ static __init int sysfb_init(void)
>  		goto unlock_mutex;
>  	}
>  
> -	/* try to create a simple-framebuffer device */
> +	/*
> +	 * Try to create a simple-framebuffer device. It claims the memory
> +	 * when it is added, so a DT PCI host bridge that probes later would
> +	 * fail. Use an efi-framebuffer device there; it waits for the bridge.
> +	 */
>  	compatible = sysfb_parse_mode(si, &mode);
> +	if (compatible && !parent && sysfb_efifb_behind_dt_pci(si))
> +		compatible = false;
>  	if (compatible) {
>  		pd = sysfb_create_simplefb(si, &mode, parent);
>  		if (!IS_ERR(pd))
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index ed23d6516223..b136fdebc746 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -95,6 +95,7 @@ static inline bool sysfb_handles_screen_info(void)
>  
>  extern struct efifb_dmi_info efifb_dmi_list[];
>  void sysfb_apply_efi_quirks(struct screen_info *si);
> +bool sysfb_efifb_behind_dt_pci(const struct screen_info *si);
>  void sysfb_set_efifb_fwnode(const struct screen_info *si, struct platform_device *pd);
>  
>  #else /* CONFIG_EFI */
> @@ -103,6 +104,11 @@ static inline void sysfb_apply_efi_quirks(struct screen_info *si)
>  {
>  }
>  
> +static inline bool sysfb_efifb_behind_dt_pci(const struct screen_info *si)
> +{
> +	return false;
> +}
> +
>  static inline void sysfb_set_efifb_fwnode(const struct screen_info *si,
>  					  struct platform_device *pd)
>  {
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261107-sysfb-dt-pci-efifb-d73b08ded4b2
> 
> Best regards,
> --  
> Han Gao <gaohan@iscas.ac.cn>
> 

