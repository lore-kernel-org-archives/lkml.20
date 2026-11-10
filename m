Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794271976;
	b=Bw6r2BpdZ+N5qqSxcvUP6NF384ulXVdqP1gw6VWJXnSFOUAx7hC4gl4qMuy4aUiied19
	 M8rdcLcSvFQQNHkXdskYrsKxPbGWGNxtM7ac8UYT03x1iZz8T5nrirWmej2MwUqYLArfM
	 p7GBbDXs+F43ahy1LpTQc3K38721N9+2JpDRG/l+4AgULaCJVMk7o8rfR5FFUnhwr1Ciw
	 /yp3BV1Afn2PE5IhI9mToCxP6EdQQoH4QlIDUauu0OAkAbEkLBDAglOOJKE60H315W7uq
	 qL5z4bbKmLeOdwsB38neXICf6TBudIFUE+vNv8OsvLQL8l0reNCm33KHxfV9LoNWxtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
	b=C7alWk5BVQ0BJEkgXl7o1QcTFGmFtmNGxzsDG8xmfDBXyy50T2eGRjlv9Bp1y4M/PLdV
	 4gn5YNHxuNCst1fUfREKOhvC3LBkKcJgMQWfh7q/aobYNdrOT+D8dkWaEgCPltA9gkkHg
	 wAECuupVyRhkfLGwkfq3vGcB8uN/ssqcIm6scPsKHs0aSWPJtqXZYjxV2X2sc6bZwkFFw
	 e742GIjrVdOkvjwhegKXDBLL6x1H0lbgzgwy9NWSBYPWK69Fqw9/NFY7KnQjteDmHNAVZ
	 hxQ/RXw0uyxXK2eofujsLi1EvWcNYm66+sWvsF7YNvxnGeswQ2AiJHGYQnHZDjonnLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X/B9Xzob";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DEB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8DEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X/B9Xzob
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93cbc3ab2fdso77110885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271974; cv=none;
        d=google.com; s=arc-20260327;
        b=PiyLYB9eVxBoX2TB0LJPv1v1ptv4WrJOHosvkbRhgrvX5SglFneMkSFGO2mI1NnnVz
         zflf8cFUYvrSzAyV9AngTa+JBKEBXTXXyfuR5wloEDxySDm3r447DTJwxIFlxcffhwxm
         nGnEbvVvS+d+cjuALeQxHkvOLpLwIsxKxqKbx+yrieNFTjrl6SNi8ypZ+ALSsBAXRkgO
         Y5H9b8cCatUBsu6kuAqVl+poXMZWhFP6VWUx9EhLENVnnJEWvW52/KvbbIfOT24kBO7P
         EeN8XF1stecufgQqeODvJEh76v8Cs9Nmc2DzXKwH/twUquhv5B9nnumzxwmTSzV80oeP
         fvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
        fh=tntFDvLh59nFzi37nQE6qRoLDyD1s2F/fApcFLESUV0=;
        b=Yi2X8G2rCNQxeU0Us/OmdiSqBLtsM95IEUJWu7qJ8MiuCoVIC9/RPQWMLsCJeLeGMw
         yj9EwMQ3tOVRRkML+fQMIOKSXKTIVkm4ObjiaSprRJlfgH/Ly9SKW2Gfz5GWLBr6nWTo
         hx6DnAqROuifL8LSXJE8QUM8FIWgRm0+0Q1aVlQBlXqgjBDmkZDLLpLzpuNmdUGL8nSr
         Q3iI6y5m0KvPcicsf9LKz7X+CaRaTI9ux5knlJllHDTFWVyLR6Du/7VFMYVZNro2+wGY
         8x3eD1Ap7EfKYxE+Cu35vnV/nc+MjV+khjydkmMcs+EO0QVXe9stAe3k4YAD/MKEA6ym
         5Syw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271974; x=1794876774; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
        b=X/B9XzobqNl7rIyEA2BdIqIiAJWqgA8Hp7aJLSZoS3LWnr+xZy9TZZ2COuQFGT4SGz
         +841fKGY0cYCLT0901VcgHuFBAPr/tuU6YJFHD90ofTLiUd5HZoi2nJ7asgRgBetRaML
         pzVsM0F2La3QmECrP9I9JgnjC/5dDZ5steO3GbkAbxbHTIZdQQKsKlXtKWRuflIqIbM1
         D59OJ952Dnt/B4TSjWV7v+7deOuGGLgzBlipZVLlPzJNdLHuBYRA68ifBQ6JsbQRB3/i
         2z3Ih0QeKkuMPI30QRkJL+/EzLGuUmRHCzTGrae2GKvaV0jDXt7k7nkWMAfzKXrnwFZ9
         FDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271974; x=1794876774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
        b=ft1BlVI9ZjSE3C6ZQh+z06IJpNkDtGZCp+jSB3ur0cWcRLv3LYfe0OPbeznynaLBrw
         4dX2t4yqBARsdW9RXeiloHLJvAsJtZ83KP1oRpOy9Xpt3DDxyhQpkK8rw674Zogdatd3
         kWBzSq1jC8P7C1dSJohZ22+IE33FGZkgwiB5u/8BSxQewsaMK7SB96jAYwMYl0VGNNrT
         F4NPLMKiQ5MLUeUhOL582ykBlidrrmh3KeXlV9R5WZkGUvOqIOXiyOC4K/t7L5zI+uFg
         PHbxzpdeFrKnIFew0FA2+Nxx7wA5xc+zVIRWdNejMa2ez27fXYQb2JWrbmdFyfpNfjIk
         ZriQ==
X-Forwarded-Encrypted: i=1; AL+hErHuOzKVmSRn7FFqDo1IzCEleByIfTGYYqkLl2kMF9FmEGZMtHuRqaXaTljsOnV+RV1pl4Dl/+jsb8VwYsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VxLIMprAQpRGUdhP6Oom5GKVonX0hxDQDhBai1Ozt1s0T9XiS
	Y0+/c5SK+0ZBXREP0bCxVy2gC5ic6lzQab0P2pZajWw0NQ+HHrIO8F3dxl6bxb2S3yP2Je1seKs
	qERoVRarX5XX3NH+ffbqIbex1yl5kRxk=
X-Gm-Gg: AYBFou0LoYw77Su8pqqhUwwMgBcg5DrlxIOzPFrCcYwv2rzhKld3wybgZSM1ztsaCds
	DgmbonxbPcg63yKYH04UsyBz96AMs7psaui+Ow8BSSiACu8ky1sDbVbx8pzS27eWYFRnF5VhAoy
	0KYmsTygdaaAUwVHeeLR6gVd63uIKBNhiT9vv8lEfmqJ3Aw81bETTMo5WAEKh/5jjZT8qyLc7G8
	HMusq4Bi901Smse97q2eMj4W8rJA4Q3ZU5phM/3COOp744pB+HpW98La7O/MImIhLg2VEcWG2Df
	0OzgT2IAUZcemZ1W8jVqxrqkDRd25RjP1oH6dMC2xaqreeXylUz83Es7ifqb8fJqyiQyL+trY40
	jzszK1xTbrldk26jdL+M+xkSjh3ofgLeeFi7LPIWwoUsmIagNon7nGjJUebSNsxy1276WgyjVAf
	y7jnNP7i4Zk0KjfuU0s+lnOg==
X-Received: by 2002:a05:620a:4693:b0:93e:c12c:fbcd with SMTP id
 af79cd13be357-9479f35eedemr193057885a.73.1794271974270; Mon, 09 Nov 2026
 16:52:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <629c8bdedca971d38b08ffd32acec1a804ff7d7d.camel.ref@aol.com> <629c8bdedca971d38b08ffd32acec1a804ff7d7d.camel@aol.com>
In-Reply-To: <629c8bdedca971d38b08ffd32acec1a804ff7d7d.camel@aol.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 10 Nov 2026 10:52:42 +1000
X-Gm-Features: AclHuK8Ki-kawuemorAfz7rrtZVSws_7w7m2uRxFuzWM_1_yfCTSwNT-D28Rts4
Message-ID: <CAPM=9tzS3qS=Xn1y+6fveWJxayOsBei9AuygLJV=dw3_H4QY=A@mail.gmail.com>
Subject: Re: [REGRESSION] nouveau oops on 7.4-rc2
To: Ruben Wauters <rubenru09@aol.com>
Cc: lyude@redhat.com, dakr@kernel.org, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 07:06, Ruben Wauters <rubenru09@aol.com> wrote:
>
> Since 7.4, I have been encountering the following oops when booting my
> computer. The issue is present in rc1 and rc2, 7.3 boots fine.
> The kernel booted fine and passed to init, which then tried to start
> gdm, gdm did not launch, leading me to dig and encounter the following
> oops in the journal.
>
> It is worth noting that my laptop, where I encountered this oops, has
> two gpus in a hybrid system, one intel integrated, and one nvidia.

Can you boot with drm.debug=0x10 and attach the complete dmesg?

I've booted a Fedora 44 GP107 laptop this morning with a intel/nvidia
combo on 7.4-rc2 and not seeing anything, so we will need more info.

Also:
https://gitlab.freedesktop.org/drm/nouveau/-/work_items?sort=cr

might be an easier place to keep track of things.

Dave.

>
> It looks to me like something return an -ENOPROTOOPT (likely due to the
> hybrid GPU situation) and then another func tried to deference this
> without checking for errors.
>
> Some quick digging shows that it could potentially be related to atomic
> mode setting being enabled in 7.4, whereas it wasn't before.
>
> I tried to take a look myself at a patch, but unfortunately I got a bit
> lost in nouveau, sorry for not being able to fix it, I hope you're able
> to. If you need any further information, please don't hesitate to
> contact me.
>
> Ruben Wauters
>
> Oops: Oops: 0010 [#1] SMP NOPTI
> CPU: 6 UID: 0 PID: 464 Comm: (udev-worker) Not tainted 7.4.0-rc2 #1
> PREEMPT(lazy)
> Hardware name: ASUSTeK COMPUTER INC. Vivobook_ASUSLaptop
> X3500PCB_K3500PC/X3500PCB, BIOS X3500PCB.305 10/13/2023
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> RSP: 0018:ffffce1000a37668 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff8dff8a97d300 RCX: ffffffffaff4b406
> RDX: 0000000000000000 RSI: ffff8dff8a97d300 RDI: ffff8dff86b91000
> RBP: ffff8dff86b91000 R08: ffff8dff8a97d300 R09: 0000000000000000
> R10: 0000000000000010 R11: 0000000000000000 R12: ffff8dff86b91000
> R13: 0000000000000001 R14: ffff8dff86b91000 R15: ffff8dff8299fa00
> FS:  00007f9bcede9880(0000) GS:ffff8e0349bd8000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000104854004 CR4: 0000000000f72ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  drm_atomic_commit+0xb1/0xe0
>  ? __pfx___drm_printfn_info+0x10/0x10
>  drm_client_modeset_commit_atomic+0x25c/0x2d0
>  drm_client_modeset_commit_locked+0x61/0x180
>  ? drm_master_internal_acquire+0x1d/0x40
>  drm_client_modeset_commit+0x25/0x40
>  drm_fb_helper_single_fb_probe+0x1aa/0x1c0 [drm_client_lib]
>  __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0 [drm_client_lib]
>  drm_fbdev_client_hotplug+0x79/0xb0 [drm_client_lib]
>  ? drm_client_init+0x116/0x150
>  drm_client_register+0x79/0xc0
>  drm_fbdev_client_setup+0xc9/0x1e0 [drm_client_lib]
>  drm_client_setup+0x6a/0x90 [drm_client_lib]
>  nouveau_drm_probe+0x15b/0x1e0 [nouveau]
>  local_pci_probe+0x4a/0x90
>  ? cpu_hotplug_disable+0x15/0x30
>  pci_call_probe+0x5a/0x1a0
>  pci_device_probe+0xdb/0x180
>  call_driver_probe+0x23/0x100
>  ? driver_sysfs_add+0x55/0xc0
>  really_probe+0xd7/0x2d0
>  ? __pm_runtime_resume+0x50/0x60
>  __driver_probe_device+0x9c/0x1b0
>  driver_probe_device+0x1f/0x80
>  ? __pfx___driver_attach+0x10/0x10
>  __driver_attach+0xcc/0x200
>  bus_for_each_dev+0x9c/0x100
>  ? bus_add_driver+0x84/0x280
>  bus_add_driver+0x1d0/0x280
>  ? __pfx_init_module+0x10/0x10 [nouveau]
>  ? __pfx_init_module+0x10/0x10 [nouveau]
>  driver_register+0x75/0xe0
>  nouveau_drm_init+0x60/0xff0 [nouveau]
>  do_one_initcall+0x89/0x340
>  do_init_module+0x8e/0x2b0
>  init_module_from_file+0xfe/0x170
>  idempotent_init_module+0x23e/0x360
>  __x64_sys_finit_module+0x7f/0x110
>  do_syscall_64+0xc2/0x4d0
>  ? switch_fpu_return+0x5e/0xf0
>  ? ksys_pread64+0x61/0xd0
>  ? arch_exit_to_user_mode_prepare.isra.0+0x84/0xa0
>  ? do_syscall_64+0xff/0x4d0
>  ? do_sys_openat2+0x75/0xe0
>  ? switch_fpu_return+0x5e/0xf0
>  ? arch_exit_to_user_mode_prepare.isra.0+0x84/0xa0
>  ? do_syscall_64+0xff/0x4d0
>  ? do_syscall_64+0xff/0x4d0
>  ? clear_bhb_loop+0x60/0xb0
>  ? do_syscall_64+0x37/0x4d0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f9bce71f95d
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89
> f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
> f0 ff ff 73 01 c3 48 8b 0d 6b 64 0d 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffdb99bcab8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 0000564b33e33130 RCX: 00007f9bce71f95d
> RDX: 0000000000000000 RSI: 00007f9bced703af RDI: 000000000000004a
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000564b33e30d90
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f9bced703af
> R13: 0000000000020000 R14: 0000564b33e2dd30 R15: 0000000000000000
>  </TASK>
> Modules linked in: drm_gpusvm_helper drm_suballoc_helper snd_hda_intel
> snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic
> soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common
> snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda
> soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils
> snd_soc_acpi_intel_match vfat snd_soc_acpi_intel_sdca_quirks fat
> nouveau(+) soundwire_generic_allocation snd_soc_sdw_utils snd_soc_acpi
> crc8 i915 soundwire_bus snd_soc_sdca intel_rapl_msr
> intel_uncore_frequency intel_uncore_frequency_common snd_soc_avs
> intel_tcc_cooling x86_pkg_temp_thermal intel_powerclamp coretemp
> snd_soc_hda_codec mt7921e snd_hda_ext_core mt7921_common snd_hda_codec
> kvm_intel mt792x_lib snd_hda_core mt76_connac_lib mt76 snd_intel_dspcfg
> snd_intel_sdw_acpi snd_hwdep snd_ctl_led kvm snd_soc_core asus_nb_wmi
> mac80211 snd_compress ac97_bus btusb asus_armoury snd_pcm_dmaengine
> btmtk irqbypass uvcvideo spi_nor snd_pcm drm_gpuvm btrtl rapl mxm_wmi
> btbcm
>  intel_cstate mtd uvc drm_ttm_helper firmware_attributes_class iTCO_wdt
> drm_buddy btintel videobuf2_vmalloc intel_pmc_bxt
> processor_thermal_device_pci_legacy ttm snd_timer mei_pxp >
>  fsdev_dax ucsi_acpi typec_ucsi typec hid_multitouch i2c_hid_acpi
> i2c_hid video wmi thunderbolt pinctrl_tigerlake intel_oc_wdt vmd
> serio_raw rtsx_usb_sdmmc mmc_core rtsx_usb
> CR2: 0000000000000000
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> RSP: 0018:ffffce1000a37668 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff8dff8a97d300 RCX: ffffffffaff4b406
> RDX: 0000000000000000 RSI: ffff8dff8a97d300 RDI: ffff8dff86b91000
> RBP: ffff8dff86b91000 R08: ffff8dff8a97d300 R09: 0000000000000000
> R10: 0000000000000010 R11: 0000000000000000 R12: ffff8dff86b91000
> R13: 0000000000000001 R14: ffff8dff86b91000 R15: ffff8dff8299fa00
> FS:  00007f9bcede9880(0000) GS:ffff8e0349bd8000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000104854004 CR4: 0000000000f72ef0
> PKRU: 55555554
