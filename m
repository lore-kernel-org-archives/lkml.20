Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794219613;
	b=QoH2695O5V1dGUXqXGtec4dF8M6kQ2cpDY/KhZVtiDdpZgciTov/I5SzupldlM99M6IY
	 tXWF+H1MIlVYLgcBNfgGaYLeKQ4CAG8f0++X7GISVIAFcv70KFeZnFMxezwzzsvmIsM6t
	 wMbbWqbBl4jBwC9xRPZxGu5Cdx06hY/UyTfS8PsoguoBlcYvZ1hl+w+/YaOP5M40u/x7R
	 6wwsILuTy8AwbfCUYrwhc9MISE57uAUuiGD1eZQyAc10Hc+mbFMSrv/4QNuxBnkoo0Bxi
	 MKK/ltFvtDFrBwSndw6XpgWTWgp3t1xpo7lyscju7JGkLWJLGbNgumT3GUSpDmluxxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QhM8Qcgx+WmmqagiVy+d1gcReK3o7PM5qXyVmDVjdYs=;
	b=FWhrAWFrOwYcyQg620ctmfVPRkjXB+lCB/DBtIkjt36djA9KZsk+W/DF8SJr/eyaDeYV
	 HfbnaartIV/s43XB95tqZolIW2nR6nacQ3FGiRbs9NHHEJohqlqLrkuqNd690kyyUsu1V
	 D7HUX89GymDjojE3TmZg9a2/hrm0Rv+8a2wjvUgkgdZ2ISrpaBCR1FD8YtSYkGz3uoP5x
	 XxMUbuwKMWBVFOKgiWgmcNcArytYHzlC521OrnoII5Rrsjok+QXLr8n6+MbI6VUyGIn1y
	 iUg/8+2fGIlasHfUa3oRlbdOA4un8HPVoiYOQtGY58cQmVPlwoOrTMOk5Wq+syvmRaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSAOwXEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E273C606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E273C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSAOwXEw
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1595341eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:20:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794219611; cv=none;
        d=google.com; s=arc-20260327;
        b=CKVnEOF/7ntUt8fokWzmOvaC+vP4KedL/vK4AS+51ThePppW4HxSOQylIjLZnNm371
         +ezyXciwSyhKrKBMxTkQ/Rg4dgayb7ddnYceYmw7T+6wM45oJfaw7ticV1Wyqm/gyWjL
         ZRNRAnBwT25IBVuKutCpPoK0G4JuVvUQ78UXdWPPQnFpmllgVSB1/1jzmph11HGUUWDd
         aRvsYI0UvpaMx9MMSoXITeQvrjwJb+U/pp0ITtUHQvfTfkVLaOw+JA7xDk1qVbzd0vlw
         BZhsDVv3EpBWAb5cprmTHre4MAfpvkOF/u4Kuv5KmpEKZuw/Sk7ZkQLfzbADCNt5lcA0
         CCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhM8Qcgx+WmmqagiVy+d1gcReK3o7PM5qXyVmDVjdYs=;
        fh=pHQjymVfSM7FnxQtW4A86TUo3DRIyHEySShXBXYsh7c=;
        b=MWyXgUn2e/3VmtqAn6tEcxmiOQeR41vtHBaJpipI/PtWKvfVfxKD3sL6fHfHjNq5VC
         FMNBabZheu+pcrHAuKMi8DU4wBFwjlE3lC9gQEKR9atFar95dd89sMxCwVIlWq3S51pe
         Pk1BbphNEulH8IZIOYxyKie/30FZgKAjUR1CYLKACn1cj8i7/JUyOeAaWtFxtBpYlzm1
         OA5ZXyKtM1yK9LlT353CaTsoUCkfEV8JiL/AGgvXak5avdysA9hNJc+b/z1A0wVGZWPt
         qs9tDZFrAijrdP3544ZSj1DikbYuzKjE9W2wOJ+RC8HPud7iAYFDRTWHAUo7fJeMnpjT
         unjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794219611; x=1794824411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhM8Qcgx+WmmqagiVy+d1gcReK3o7PM5qXyVmDVjdYs=;
        b=nSAOwXEwLsU97isnQcs15mfpqxQft8hOExNO3UE1WEkRJSTN61FJ2YcSMJTifHd/75
         qodnx1ulJI+2irbEGuDOlSBa2MM+yIipn0bT2gYPMdhsd00+urCkzxz+NgAPmE1mdPuw
         /uLzpxIVBR+HjBvhQhtRjxaealyYYCcq7U9tSzvyEK2zteGqL1LYYamlP9R24ycJfdIG
         bpUBhNMiWrTluFoSca9qvyEcgWO0d/8iaccKVmU42P1n+9A8UsNpdqW5YjLSZ8PD03I/
         PZ90KIMhjVtxfGTxgkQY3+rNaQJbCqvta6l0yLAq/J6+1/EJpHjMb2GZAiGk152kiSY9
         zdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219611; x=1794824411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhM8Qcgx+WmmqagiVy+d1gcReK3o7PM5qXyVmDVjdYs=;
        b=SqidLOuHDyUdm5+Z7glm6ETwZB3UM+KOPnuM2WcxeA9W9Wsf0+b9ZuQ+ifI3QTTlfy
         7YEWN1UqL4STOhSrPECIC/8Os6zIgDmBBo1RxzWnlc4lU05sPK+fL3md61f7ot1Vp9r+
         NEGxDNK1Jk8TEzyggQjXewvH7vEtk1m+jXuUhbMoW6Y2vtW6z3OZQxOX99bsy/HL0UsW
         IDpBDbpfZdyKTwohG30QIro1hbknKRg2m6w/MKgr+e98B7SZXXe1NWwQdzSV4lWt8toO
         nOU/iBhr86NSVTGQwMAqnvgkDhAJn80+OeCfyeE/A5j7NXRJyKk8JKnt6iETu0YueHCB
         dYcg==
X-Gm-Message-State: APuU4Z9Ej336oCCLytQQTqLMsqM7Ri0rtyLnnN5Gk3WhNtB4nCeynQ0U
	Owy4+Rc+NRkmXUX1tXyG3ulwizRTGQ6mudPcsYgjROuCQkl/XQU6M5+X4BooOlrhMvj8+8g4g0b
	CUbHSbJfB0ScReOpojH8S+OsZgPKat7E=
X-Gm-Gg: AYBFou0JZNTtgsG18Mk4mLWBlStUrYFF6HFHBlwadnDsaP4YMO08PAoStaebF7q95ra
	u7kU/mCxstXQ9dxzlPTKPm90D/HV/eFDT8d3chwRiD0Lj8cXl8ChLEWoi0VUz/D6Qruj0ll8aAV
	MLsmm95grpD5pM2zrbVBMxeZ4EtvRxZnL4uspVeMNXU5qdPdazMXlcc/60jWUPGG87KA5oS0K/R
	NNJHYxuQpYGIdsA0wOCopPAzhuY6/bi+0ANStZZt1IpPppG84dR5DgXpFhTUdHwMSsx1NKGfASn
	jwvszxFn6IkiN7Mc8BnxW0vOcfZZr/NPd5nQ8bL8VJKx2J70tZLCUb+rXGx/96wJJjAsCppBQdb
	lV8EsZYd/u50oBvHf/cZjhVdwgmJyqZevS5nUnC9ePqSXgiz95W+T86lOikpIdpbSSRjx5OAMjT
	E5GKGL48yKM2ArlHaW7KzRaAQdT35OavnbbyyIurCsllxUdl0RofrLxjshWqf8R8xPTezjgqKHI
	zUnXOhFS2Ab68P89iJ8uhwGqMpT9Y9b2+7+SZsel3dIoFjWvcRZs5m/ZQ==
X-Received: by 2002:a05:7301:460e:b0:36a:12c1:3adb with SMTP id
 5a478bee46e88-3725680a956mr6779585eec.20.1794219609417; Mon, 09 Nov 2026
 02:20:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHk-=wgAHC=GJMQm7DM0iJgUCsaMpYJ1zO2FW_+FQLcGzfYZzg@mail.gmail.com>
In-Reply-To: <CAHk-=wgAHC=GJMQm7DM0iJgUCsaMpYJ1zO2FW_+FQLcGzfYZzg@mail.gmail.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Mon, 9 Nov 2026 11:19:55 +0100
X-Gm-Features: AclHuK9FvVkKA62ahwFJny9HKJvoHf_qi_A8pRmmRFRJr3r_hQeFTQC24mSGDmg
Message-ID: <CADo9pHi5+BjQycXa0-xtQUOT6J7_5CZ7FymEH7F1xUOBdZZ1Pg@mail.gmail.com>
Subject: Re: Linux 7.4-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>, Luna Jernberg <droidbittin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Works fine on my Dell laptop :)



Den m=C3=A5n 9 nov. 2026 kl 01:47 skrev Linus Torvalds
<torvalds@linux-foundation.org>:
>
> Ok, a big -rc2 to go with the largest ever -rc1. But the diffstat
> looks fairly benign, and is dominated by some automated coccinelle
> updates that I got for the merge window but left for rc2 because I
> didn't want to deal with them when I was on the road (and had a hard
> time finding the motivation to deal with them afterwards too, to be
> honest).
>
> That said, the scripted updates are largely just one- and two-liners,
> and they realy are very straightforward so they "dominate" the
> diffstat only in the sense that they are very spread out and do add a
> lot of noise.
>
> When masking that noise out from the diffstat, the shape of it changes
> - not spread out over thousands of files any more. But it does not
> look unusual: a third is drivers (gpu, networking and sound account
> for most of it, but there's a bit of everything), another third is
> networking and bpf, and the final third is "the rest" (mostly
> filesystems, mm, arch updates).
>
> And yes, much of this was driven by various AI fixes. I think I'll
> stop repeating that, and we can just take it for granted. But this
> time around Alexei claims that on the bpf side at least the fixes are
> now coming in faster than the new reports, and that sounds lovely if
> true.
>
> I think most other areas haven't reached that point yet, but it's at
> least a sign that we _may_ be starting to see the tide starting to
> turn.
>
> Don't hold your breath, but maybe cross your fingers we'll be getting
> there in the not entirely distant future.
>
> In the meantime, please keep testing,
>
>             Linus
>
> ---
>
> Adarsh Das (1):
>       btrfs: unwind device add when sysfs registration fails
>
> Adrian Ng Ho Yin (1):
>       dt-bindings: usb: add Altera Agilex5 DWC3 controller
>
> Adri=C3=A1n Garc=C3=ADa Casado (1):
>       scsi: libsas: Add __printf attribute to sas_ata_printk()
>
> Akhil Arul (1):
>       Bluetooth: hci_core: Fix queuing rx_work while workqueue is drained
>
> Akshay Jindal (1):
>       iommu/amd: Skip non-IVMD entries when parsing IVRS memory definitio=
ns
>
> Alejandro Colomar (1):
>       scripts/coccinelle: Add script for using ARRAY_END()
>
> Alex Austin (3):
>       sfc: ptp: drop the stale frequency reset in efx_ptp_start()
>       sfc: ptp: serialize host and MC synchronization transactions
>       sfc: ptp: avoid racing PPS timestamp updates
>
> Alex Hung (1):
>       drm/amd/display: Avoid closing unowned DDC pins
>
> Alex Kazinsky (2):
>       wifi: rsi: Skip TX aggregation setup for non-QoS frames
>       ALSA: cs46xx: Handle SCB creation failures before dereferencing
>
> Alexander Goodkind (1):
>       net: ethernet: mediatek: preserve sibling PPE bindings
>
> Alexandr (1):
>       ALSA: hda/realtek: Enable mute and mic-mute LEDs on HP ENVY 17-cr0x=
xx
>
> Alexandre Mergnat (2):
>       regulator: mt6363: Use 8-bit register values
>       regulator: mt6363: Fix VEMC voltage selection
>
> Alexei Solcanu (1):
>       hwmon: (gpd-fan) Reset both fans to automatic on duo boards
>
> Alexei Starovoitov (40):
>       bpf: Keep the valid bytes of a packet pointer in scalar evolution
>       selftests/bpf: Test the valid bytes of a packet pointer in a counte=
d loop
>       bpf, x86: Fix bpf_throw() in a prog with a private stack
>       selftests/bpf: Test bpf_throw() in a prog with a private stack
>       bpf: Clamp the trace length before the skip test in stackid_init()
>       bpf: Refuse to map an arena at address 0
>       bpf: Don't let bpf_arena_free_pages() see a half-set user range
>       bpf: Refuse an arena mmap() longer than max_entries pages
>       bpf: Remove the WARN from arena_get_unmapped_area()
>       selftests/bpf: Test the length and the address of an arena mmap()
>       bpf: Don't turn struct arguments of KF_ACQUIRE kfuncs into memory
>       bpf: Don't turn kfunc arguments of an empty struct type into memory
>       bpf: Compare the arguments of an extension with those of its target
>       selftests/bpf: Test the arguments of an extension prog
>       bpf: Don't let bpf_skb_adjust_room() raise gso_size to GSO_BY_FRAGS
>       bpf: Set a dst for test runs of lwt_in progs
>       bpf: Don't look for the SRH again in the End.BPF helpers
>       bpf: Don't leave a stale MAC header in bpf_lwt_push_ip_encap()
>       bpf: Reset skb->cb after an lwt prog pushes an IP header
>       bpf: Require BPF_LWT_REROUTE when an lwt_in prog changes the protoc=
ol
>       bpf: Don't let lwt_in progs call into IPv6 when it is disabled
>       bpf: Don't move a MAP_FIXED address in arena_get_unmapped_area()
>       selftests/bpf: Run arena_mmap serially and test MAP_FIXED addresses
>       bpf: Fix the join of fp+0 with a value that is not a pointer to sta=
ck
>       selftests/bpf: Test the join of fp+0 with a value that is not a
> pointer to stack
>       bpf: Don't trust pointers spilled in slots that a callee can write
>       selftests/bpf: Test a callee that overwrites a spilled pointer
> of its caller
>       bpf: Invalidate a dynptr slice when its stack buffer is written
>       selftests/bpf: Test writes to the buffer of bpf_dynptr_slice_rdwr()
>       bpf: Emit timed may_goto for JITed progs only
>       selftests/bpf: Don't cast a pointer to .bss in arena_htab_asm
>       selftests/bpf: Give the first loop of cond_break5 an end
>       selftests/bpf: End the loop of parallel_test_bitmap after 50 ms
>       s390/bpf: Support internal-only MOV instruction to resolve per-CPU =
addrs
>       bpf: Pass a pointer to arch_bpf_timed_may_goto()
>       bpf: One may_goto time slice per prog invocation
>       bpf: End bpf_loop() when the time of may_goto is up
>       selftests/bpf: Test one may_goto time slice per prog invocation
>       libbpf: Fix use-after-free in btf__add_type
>       net: reject a negative TCP header offset in qdisc_pkt_len_segs_init=
()
>
> Amir Goldstein (3):
>       ovl: inherit FMODE_NONOTIFY when opening directory realfiles
>       ovl: inherit FMODE_NONOTIFY when reading directory layers
>       selftests/fscontext_ns: expect EINVAL for overlay descendant userns=
 create
>
> Amirmohammad Eftekhar (1):
>       KVM: VMX: Add array_index_nospec() to evmcs_field_offset()
>
> Andrea Mayer (1):
>       seg6: fix transport header for inner IPv4 with IP options
>
> Andrew Luebke (1):
>       scsi: aic79xx: Fix NULL pointer dereference in device reset
>
> Andrew Morton (2):
>       openrisc: export __mulsi3 for modules
>       MAINTAINERS: add an IPC entry
>
> Andr=C3=A9 Draszik (2):
>       drm/drm_crtc: ensure dma_fence_ops remain valid during device unbin=
d
>       drm/drm_crtc: fix race with dma_fence_signal() in ::get_driver_name=
()
>
> Animesh Manna (1):
>       drm/i915/cmtg: Disable CMTG after encoder disable in hsw_crtc_disab=
le()
>
> Ankit Thakur (4):
>       9p: fix header guard comment in acl.h
>       9p: fix typos and wrong parameter docs in vfs_inode.c
>       9p: remove duplicated assignment in v9fs_fill_super()
>       9p: fix typo in file header comments
>
> Antheas Kapenekakis (1):
>       ALSA: hda/tas2781: Prevent throwing away custom calibration address=
es
>
> Anthony Iliopoulos (1):
>       xfs: skip iunlock with empty iolock flags in xfs_file_dio_write_ali=
gned
>
> Antony Antony (9):
>       xfrm: state: reject mark with bits outside its mask on add
>       xfrm: state: reject mark with bits outside its mask on ALLOCSPI
>       xfrm: policy: reject mark with bits outside its mask on add
>       xfrm: state: exact mark/mask match for SPI-keyed control-plane SA l=
ookups
>       xfrm: fix use-after-free of migrated state in xfrm_do_migrate_state=
()
>       xfrm: fix hw offload state leak on xfrm_do_migrate_state() error pa=
th
>       xfrm: include mark in MIGRATE_STATE SA collision check
>       xfrm: pass extack through to xfrm_init_replay() from xfrm_init_stat=
e()
>       docs: xfrm: include mark in XFRM_MSG_MIGRATE_STATE EEXIST tuple
>
> Anuj Gupta (1):
>       block: don't use the bvec fast path for dma-buf bios
>
> Anupama Kunkulagunta (1):
>       ALSA: hda/tegra: Add Tegra268 HDMI/DP codec ID
>
> Armin Wolf (1):
>       platform/x86: uniwill-laptop: Implement .hw_offloaded trigger callb=
ack
>
> Arpith Alexander (1):
>       spi: ljca: Don't require data in write replies
>
> Ashish Kalra (2):
>       x86/sev: Clear RMPOPT when segmented RMP is disabled by firmware
>       x86/sev: Set up RMPOPT only on an active SNP host
>
> Avi Weiss (3):
>       fsnotify: preserve 64-bit pre-content ranges
>       block: report the correct discard alignment in sysfs
>       net: skbuff: reject zero MPLS TTL before decrementing
>
> Ayushman Rout (2):
>       bpf: Fix bpf_dynptr_copy() for overlapping ranges in one packet
>       selftests/bpf: Test overlapping dynptr copies on xdp frags
>
> Babu Moger (2):
>       x86/resctrl: Correct ABMC counter ID field width
>       x86,fs/resctrl: Keep mbm_assign_mode in default mode at boot
>
> Baek Kyu, Kim (3):
>       hwmon: (corsair-cpro) Cache fan target only after a successful comm=
and
>       hwmon: (gpio-fan) Update the speed cache before dropping the PM ref=
erence
>       null_blk: reset cache state before device setup
>
> Baojun Xu (1):
>       ASoC: amd: acp: Add support for more projects on ACP7.0
>
> Baolin Wang (1):
>       mm: memory: fix truncation removing mapped folios
>
> Barret Rhoden (1):
>       9p: treat read return values of 0 as EOF
>
> Bart Van Assche (4):
>       ntfs: Fix error handling in __ntfs_create()
>       scsi: BusLogic: Pass the host pointer directly to several functions
>       scsi: BusLogic: Prepare for enabling lock context analysis
>       mctp i3c: Fix locking in an error path
>
> Bas Nieuwenhuizen (1):
>       drm/amdgpu: Check cs flags.
>
> Benjamin J Pryor (1):
>       ALSA: hda/realtek: Extend ALC1316 fixup to MSI GE76 Raider
>
> Binbin Deng (4):
>       xfs: set healthmon mount cookie before publishing it
>       Bluetooth: hci_core: Initialize IRK before publication
>       Bluetooth: hci_core: Initialize link key before publication
>       Bluetooth: hci_core: Initialize LTK before publication
>
> Bj=C3=B6rn T=C3=B6pel (1):
>       eth: fbnic: Report the logical RX queue to XDP
>
> Breno Leitao (2):
>       x86/bugs: Select the BHI mitigation based on the attack vector prop=
erly
>       x86/nmi: Ignore negative NMI handler durations
>
> Bryam Vargas (2):
>       net/iucv: take a private, writable frame before rewriting it in pla=
ce
>       net/smc: don't spin in smc_rx_recvmsg() while a pipe holds spliced =
data
>
> Calvin Owens (1):
>       Revert "drm/amd/display: Allocate DCN32/1 dmub memory to GTT"
>
> Catherine L (1):
>       Bluetooth: btintel: fix buffer over-read in fw payload
>
> Ce Sun (1):
>       drm/amdgpu: skip RAS error count reset in debug mode
>
> Cen Zhang (14):
>       Bluetooth: hci_sync: Copy the LE accept list under hdev->lock
>       Bluetooth: hci_sync: Protect resolving-list lookups
>       Bluetooth: hci_core: Keep link-key filtering inside RCU
>       Bluetooth: SMP: Protect link keys during LTK derivation
>       Bluetooth: SMP: Protect LTK encryption with RCU
>       Bluetooth: hci_sync: Copy the resolving-list IRK under RCU
>       Bluetooth: hci_core: Initialize advertising RPA work only once
>       ocfs2: validate move extents against a stable EOF
>       ocfs2: keep locking_state within the cluster connection lifetime
>       ocfs2/dlm: serialize migration MLE cleanup on failure
>       ocfs2: stop recovery before shutting down local allocators
>       ocfs2/cluster: unlink socket containers before releasing resources
>       ocfs2: wait for filecheck kobject release after a failed add
>       ocfs2: cache the mount context for dentry lock callbacks
>
> Cen Zhang (Microsoft) (1):
>       ipv6: fix fib6 walker UAF on NLM_F_REPLACE
>
> Cheng Yongkang (1):
>       net: bridge: disable MRP ports before the FDB flush in del_nbp()
>
> Chengfeng Ye (3):
>       xfrm: retry inexact policy lookup after node reinsertion
>       net/9p/usbg: clear stale request context after abort
>       batman-adv: Close OGM aggregation before transmission
>
> Chris Chiu (1):
>       ALSA: hda/realtek: Use inverted mute LED quirk for HP ZBook 8 G2a
>
> Chris Down (1):
>       mm: make swapoff interruptible when unusing mms/shmem
>
> Chris Lu (3):
>       Bluetooth: btmtk: drop zero-length ISO packets from endpoint paddin=
g
>       Bluetooth: btmtk: bound the ISO payload length by the controller's =
MTU
>       Bluetooth: btmtk: derive the firmware ISO setting from MTK_ISO_THRE=
SHOLD
>
> Chris Mason (33):
>       bpf: Reject memory for kfunc projection type args
>       bpf: Require prog fd or capability for cgroup detach
>       bpf, cgroup: Keep the skb network offset signed
>       bpf: Reject non-IPv6 packets in BPF_LWT_ENCAP_SEG6
>       bpf: Limit the SRH length in bpf_lwt_seg6_adjust_srh()
>       bpf: Move the MAC header in bpf_lwt_seg6_adjust_srh()
>       bpf: Move the transport header with the moved headers
>       bpf: Use the inner transport header after a decap
>       bpf: Check the offset in bpf_skb_generic_{push,pop}()
>       mm/mempolicy: charge shared policy nodes
>       mm/shmem: honour F_SEAL_EXEC when an ACL is set
>       mm/shmem: stop retrying folios that cannot be split
>       mm/shmem: preserve data in clean folios when splitting fails
>       mm/huge_memory: fix truncate racing with PMD zapping
>       mm/huge_memory: fix zapping migration entries for device-private TH=
Ps
>       mm/khugepaged: preserve dirty bits when collapsing PTE-mapped THPs
>       mm/gup: fix clearing folios in memfd_pin_folios()
>       mm/gup: fix out-of-bounds write for nr_pages =3D=3D 0 in GUP-fast
>       mm/mmu_notifier: set ->mm only after mmgrab()
>       mm/memory: reject remote COW faults on PFN mappings
>       mm: fix unkillable fault loop on MAP_DROPPABLE memory
>       mm: fix deadlock of mremap() against UFFDIO_MOVE
>       mm/ksm: check large swap-cache folios before mapping them
>       mm/vma: call ->may_split() before a partial merge
>       ovl: fail the mount if the casefold flag has changed
>       ovl: do not let chattr change the casefold flag
>       ovl: fix whiteout creation in casefolded directories
>       nvmet-rdma: disconnect only established queues
>       nvmet-rdma: take a device off the list last
>       nvmet-rdma: queue the release work under the mutex
>       nvmet-rdma: disconnect a queue on device removal
>       ovl: look up the index by the decoded origin
>       x86/mm: Fix global ASID handed out to two processes
>
> Chris Simpson (1):
>       ALSA: hda/realtek: Enable bass speakers on Alienware m17 R3
>
> Christian Aurich Zanettini Martins (2):
>       nvme-tcp: fix use-after-free in nvme_tcp_free_ctrl()
>       nvme-rdma: fix NULL queue->ctrl dereference on reconnect
>
> Christian Gmeiner (2):
>       drm/etnaviv: Fix NULL dereference on unbind without PPU flop reset
>       drm/etnaviv: Flush the tile status cache through both the PE and BL=
T
>
> Christian Loehle (1):
>       sched/core: Account I/O waits independently of delayed dequeue
>
> Christoph Hellwig (2):
>       zloop: fix block size query
>       xfs: fix recovery of partial attr removals
>
> Christophe JAILLET (1):
>       nvmet: pci-epf: Constify struct pci_epf_ops
>
> ChunYuZhiQiang (2):
>       can: dev: can_fill_info(): don't wake up controller if interface is=
 down
>       can: dev: can_tdc_fill_info(): don't read automatic TDCV if
> interface is down
>
> Chunfa Zhang (1):
>       spi: fix zero-length scatterlist entries for vmalloc buffers
>
> Cian Ruane (1):
>       ALSA: hda/realtek: Add quirk for Huawei MateBook X Pro 2020
>
> Cl=C3=A9ment L=C3=A9ger (1):
>       MAINTAINERS: mailmap: use Cl=C3=A9ment L=C3=A9ger's linux.dev mail =
address
>
> Colton Pawielski (1):
>       net: 8139cp: keep Rx masked while NAPI is scheduled
>
> Cong Zhang (1):
>       virtio_blk: use synchronous quiesce in virtblk_freeze_priv()
>
> Cosmin Ratiu (1):
>       wifi: wext: Limit notifier event flushes to the device's netns
>
> Cunhao Lu (3):
>       can: skb: make echo skb freeing safe in any IRQ context
>       can: skb: make CAN skb allocation failure paths IRQ-safe
>       can: dev: can_put_echo_skb(): free skb on invalid echo index
>
> Daehyeon Ko (2):
>       vhost/vsock: size receive SKBs from declared payload
>       sched/fair: Clear throttle state when leaving the fair class
>
> Daejun Park (12):
>       xfs: don't skip free extents in later batches of a whole-AG FITRIM
>       xfs: don't skip free extents of the longest length in a whole-AG FI=
TRIM
>       nvme: unregister when pr_register() is given a zero new key
>       xfs: mark the inode preallocated for pNFS write layouts past EOF
>       xfs: add a flag to convert unwritten extents without allocating blo=
cks
>       xfs: refuse a pNFS LAYOUTCOMMIT of a range without blocks
>       xfs: clamp a pNFS LAYOUTCOMMIT extent before computing its end
>       xfs: cap the block count of xfs_iomap_write_direct() at one extent
>       xfs: clamp the pNFS layout range to the maximum file size
>       xfs: take the invalidate lock while mapping a pNFS layout
>       xfs: add datasync and log_flushed arguments to xfs_log_force_inode(=
)
>       xfs: make pNFS LAYOUTCOMMIT stable the way fdatasync does
>
> Daniel Borkmann (2):
>       x86/ftrace: Mark jmp mode by clearing bit 63 of trampoline address
>       selftests/bpf: Test kprobe and fentry/fexit programs on one functio=
n
>
> Daniel Machon (2):
>       net: lan966x: don't free XDP buffers in fdma tx clear with budget 0
>       net: sparx5/lan969x: release the in-flight slot of a stale TX skb
>
> Danish Khateeb (2):
>       selftests/mm: merge: keep the far mremap() targets in the carveout
>       perf/core: Don't send SIGTRAP after exec removed the event
>
> Dariusz Marcinkiewicz (1):
>       drm/amdgpu: check amdgpu_vm_ready() in dma-buf move notify
>
> David Carlier (1):
>       spi: rtk-nor: Limit exec_op writes to one byte per operation
>
> David Hildenbrand (Arm) (37):
>       mm/shmem: discard whole new large folios on fallocate rollback
>       mm/shmem: rescan after nonuniform folio splitting
>       mm/shmem: fix truncate hang in large swap entry
>       mm/shmem: preserve allocation errors when swapping in large entries
>       mm/shmem: fix truncate loop after boundary swapin failure
>       mm/shmem: fix accounting of swapin-error markers
>       mm/shmem: fix truncation of files containing only swapin-error mark=
ers
>       fork: take mmap_lock before copying mm_struct
>       mm/shmem: make shmem_file() check the file's inode
>       mm/truncate: look again if a folio left the mapping
>       mm/filemap: finish fault cleanup before dropping the fault lock
>       mm/rmap: handle device-exclusive entries in folio_referenced_one()
>       mm/huge_memory: fix list corruption when deferred_split_scan()
> races with deferred_split_folio()
>       mm/huge_memory: properly handle refcounted PUD mappings on fork
>       mm: fix address wraparound when scanning large folio PTEs
>       mm/hugetlb: disable PMD sharing for UFFD missing mode
>       mm/vma: write lock source VMA before duplicating it in __split_vma(=
)
>       mm/madvise: preserve VMA_SOFTDIRTY_BIT when changing anonymous name=
s
>       MAINTAINERS: mention for-next branch in MEMORY MANAGEMENT - MEMORY =
MAP
>       MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
>       MAINTAINERS: add Zi Yan as co-maintainer for MEMORY MANAGEMENT - TH=
P
>       MAINTAINERS: sort entries in MM sections
>       MAINTAINERS: add missing files to MM component sections
>       MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
>       MAINTAINERS: route more MM changes through mm/core.git
>       mm/gup: recheck the PUD under PTL in follow_pud_mask()
>       mm/gup: check for overflow when converting nr_pages to bytes in GUP=
-fast
>       mm/userfaultfd: write-lock the VMA before waking waiters when
> unregistering
>       mm/userfaultfd: wake waiters when registration modes are removed
>       mm/mremap: use pudp_huge_get_and_clear() when moving huge PUDs
>       mm/mremap: recheck PUDs under the page table lock
>       mm/madvise: fix data loss from MADV_FREE on a KSM page
>       mm/ksm: reset the unstable trees of all nodes
>       mm/ksm: fix use of a freed anon_vma at swap-in
>       mm/huge_memory: split huge PUDs when adjusting VMA boundaries
>       mm/vma: don't leak the charge for stack growth
>       mm/memory-tiers: unregister empty tiers outside memory_tier_lock
>
> Davidlohr Bueso (1):
>       dma-buf: validate the attachment before asserting its reservation l=
ock
>
> Deepanshu Kartikey (2):
>       9p: don't WARN_ONCE on racy symlink fid lookup failure
>       batman-adv: avoid WARN_ON for orig_ifinfo allocation failure
>
> Devin Wittmayer (2):
>       drm/panic: Fix kmsg screen hang on a long log line
>       drm/panic: Accept a trailing newline in panic_screen
>
> Dheeraj Kumar Srivastava (1):
>       iommu/amd: Clear amd_iommu_snp_en if snp_rmptable_init() fails
>
> Dmitry Antipov (1):
>       9p: simplify v9fs_cache_session_get_cookie()
>
> Dmitry Baryshkov (1):
>       regulator: qcom_spmi: don't take a sleeping lock in the SAW IPI
>
> Dom Cobley (1):
>       drm/vc4: hdmi: power down the BCM2712 PHY when the output is disabl=
ed
>
> Dominique Martinet (1):
>       9p: optimize p9_fcall struct
>
> Drew Fustini (1):
>       MAINTAINERS: resctrl: Add myself as reviewer
>
> Dudu Lu (1):
>       vhost/vringh: Fix IOTLB permission in putu16_iotlb()
>
> Eklavya Singh (1):
>       ocfs2/heartbeat: serialize concurrent writes to a region's dev attr=
ibute
>
> Eliot Courtney (1):
>       rust: io: fix unused Flags::from_raw warning without CONFIG_PCI
>
> Ella Ma (1):
>       coccinelle: free: add a checker for `__cleanup(kfree)` usage
>
> Erhan Bilgili (2):
>       drm/amdgpu: Fix duplicate dependency fence releases
>       drm/amdgpu: Report MES ring wait timeouts.
>
> Eric Biggers (5):
>       lib/crypto: mips: Disable Octeon SHA code on little-endian kernels
>       lib/crypto: powerpc/poly1305: Remove BROKEN implementation
>       lib/crypto: mldsa: Check pk_len before doing pointer arithmetic
>       lib/crypto: mldsa: Explicitly check that 'alg' is a valid value
>       lib/crypto: mldsa: Add __must_check to mldsa_verify()
>
> Eric Dumazet (7):
>       tcp: do not let tcp_collapse() drive sk_forward_alloc negative
>       inet: frags: limit the truesize of a reassembly queue
>       soreuseport: annotate data-races around reuse->socks[] and num_sock=
s
>       xfrm: iptfs: fix skb leak on error in __input_process_payload()
>       ipmr, ip6mr: queue netlink route queries out of band
>       tcp: ipv6: do not read ireq->pktopts from tcp_v6_send_synack()
>       tcp: ipv6: free ireq->ipv6_opt after an RCU grace period
>
> Esben Haabendal (2):
>       drm/bridge: nwl-dsi: Cleanup endpoint mux control selection
>       drm/bridge: nwl-dsi: Limit LCDIF specific sync override
>
> Eugenio P=C3=A9rez (1):
>       MAINTAINERS: add missing virtio/vdpa/vduse/vhost headers
>
> Eva Kurchatova (1):
>       hugetlbfs: enforce F_SEAL_EXEC in setattr
>
> Evanshenf (3):
>       drm/loongson: Fix framebuffer selection in async cursor updates
>       drm/loongson: Fix double free on BO initialization failure
>       drm/loongson: Handle buffer mapping failures when clearing a BO
>
> Ewan D. Milne (1):
>       nvmet: don't return memory contents beyond valid data when
> reading ANA log page
>
> Fang Xieyan (4):
>       vringh: bound top-level re-entry into indirect tables
>       vringh: add regression test for cyclic indirect descriptor
>       vringh: reject empty / undersized indirect descriptor tables
>       vhost: fix used ring index wrap in vhost_add_used_n_in_order
>
> Fangzhi Zuo (2):
>       drm/edid: Parse HDMI 2.2 FRL rates from the SCDS
>       drm/amd/display: Accept HDMI 2.2 FRL rates from the sink EDID
>
> Federico Musto (1):
>       net: atl1c: drop oversized RX frames instead of panicking
>
> Fernando Fernandez Mancera (1):
>       net/smc: fix limit_smc_hs sysctl on big-endian architecture
>
> Filipe Manana (6):
>       btrfs: defrag: prevent inode truncated to zero from not being
> defragged again
>       btrfs: fix fiemap merging compressed extents
>       btrfs: scrub: fix lost error return value when scrubbing raid56
> parity stripe
>       btrfs: scrub: fix lost wakeup and hang when cancelling a scrub
> that is finishing
>       btrfs: scrub: fix race leading to use-after-free in the scrub
> progress ioctl
>       btrfs: scrub: fix race between scrub and scrub progress ioctl
>
> Finn Zeruhn (1):
>       drm/dp: keep MOT set between messages when no_zero_sized is set
>
> Florian Fainelli (7):
>       net: dsa: b53: Enable IGMP and MLD control packet CPU copies
>       net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
>       net: dsa: b53: restore the NSP IMP port 2 Gbps mode
>       MIPS: Alchemy: Register interrupt chips with the IRQ core
>       MIPS: Alchemy: Save the Ethernet address before reusing PROM memory
>       MIPS: Cobalt: Include legacy IDE ports in the PCI I/O window
>       MIPS: SB1250: Validate and update IRQ affinity
>
> Fourie Zhang (1):
>       xfrm4: use a full socket for local errors
>
> Franck Baur (1):
>       net: jme: keep RX MAC clock enabled for WoL
>
> Frederic Konrad (1):
>       spi: cadence-quadspi: Fix race between DMA completion and transfer =
start
>
> GIBEOM LEE (=EC=9D=B4=EA=B8=B0=EB=B2=94) (1):
>       regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs
>
> Gianluca Balboni (1):
>       ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 Laptop 16-by0xxx
>
> Giuseppe Piscitelli (3):
>       scsi: scsi_debug: Drain target cleanup before module exit
>       scsi: core: Balance the pseudo target reap reference
>       ata: libata-core: Check device support before querying power state
>
> Gregory Price (1):
>       mm/userfaultfd: compare exact registration modes before skipping
>
> Gregory Price (Meta) (1):
>       mm/page_alloc: let the highest memory node recover from hopeless st=
ate
>
> Guenter Roeck (22):
>       hwmon: (aquacomputer_d5next) Check maxcollection when probing
> AQUAERO devices
>       hwmon: (asus_wmi_sensors) Avoid global struct mutation
>       hwmon: (hp-wmi-sensors) Avoid global struct mutation
>       hwmon: (hp-wmi-sensors) Fix unbounded loops in scale_numeric_sensor=
()
>       hwmon: (lm87) Fix drvdata type confusion in vrm_show() and vrm_stor=
e()
>       hwmon: (nct6683) Fix incorrect struct cast in show_pwm() and store_=
pwm()
>       hwmon: (peci/dimmtemp) Fix devres leak and UAF on concurrent unbind
>       hwmon: (pmbus/q54sj108a2) Add missing NULL pointer check
>       hwmon: (pmbus) Check return value from pmbus_thermal_add_sensor()
>       hwmon: (pmbus) Release devres allocated memory after
> devm_thermal_of_zone_register error
>       hwmon: (pmbus) Fix return value check from thermal zone registratio=
n
>       hwmon: (lm75) Fix setting polarity mask for chips with 16-bit
> config register
>       hwmon: (tmp108) Fix initial conversion delay and wait until ready
>       hwmon: (coretemp) Check for NULL platform device in hotplug callbac=
ks
>       hwmon: (coretemp) Set nr_cores only after core_data allocation succ=
eeds
>       hwmon: (coretemp) Fix 32-bit jiffies wraparound in show_temp()
>       hwmon: (sht4x) Convert update_interval to jiffies in pending data c=
heck
>       hwmon: (acpi_power_meter) Fix missing locking in sysfs show
> callbacks and resume
>       hwmon: (acpi_power_meter) Prevent spurious power alarm when
> power is unknown
>       hwmon: (acpi_power_meter) Check for 32-bit and 64-bit unknown ACPI =
values
>       hwmon: (hp-wmi-sensors) Serialize alarm flag read-and-clear with
> state->lock
>       hwmon: (asus_rog_ryujin) Fix timeout when reading 0% duty cycle
>
> Guillaume Nault (1):
>       tcp: Fix dup-ack detection on non-SACK bidirectional data transfer.
>
> Guixin Liu (1):
>       nvmet-rdma: remove dead allocated field in nvmet_rdma_rsp
>
> HOYOUNG SEO (1):
>       scsi: ufs: core: Change the error check sequence for auto hibern8
>
> Haiyue Wang (1):
>       platform: arm64: drop the vacuous THERMAL dependency from EC_ASUS_G=
LYMUR
>
> Haobin Wu (3):
>       9p: skip intermediate directory entry name copy in p9dirent_read()
>       9p: skip directory entries with names longer than NAME_MAX
>       9p: skip over-long directory entry names for legacy 9p2000 too
>
> Hemanth Selam (1):
>       net/9p: fix typos in comments
>
> Hengyu Liang (3):
>       btrfs: fix chattr failing on nodatasum files that have the compress=
 flag
>       fs/proc/task_mmu: return -ENOTTY for unknown pagemap ioctls
>       l2tp: only return sessions of the given tunnel in l2tp_session_get(=
)
>
> Hongjian Dai (1):
>       spi: pic32-sqi: fail transfer when the BD ring is exhausted
>
> Hongling Zeng (2):
>       ntfs: keep the file size on a failed initialized-size extension
>       ntfs: fix a self-deadlock on writes to non-resident named streams
>
> Hugo Deco (1):
>       nvme-pci: add NO_FUA quirk for ADATA XPG GAMMIX S70 BLADE
>
> Hugo Sales (1):
>       drm/amdgpu: Clamp the ATIF backlight curve to its 99 points
>
> Hui Peng (2):
>       udf: validate vat20->lengthHeader and VAT inode size in udf_load_va=
t()
>       9p: reject RERROR/RLERROR with zero errcode
>
> Hui Su (2):
>       sched/pelt: Fix u32 truncation of the PELT period count
>       sched/topology: Balance cluster static-key updates
>
> Hungyu Lin (8):
>       ext2: preserve completed DIO bytes when buffered fallback fails
>       mm/page-writeback: avoid 32-bit overflow in dirty threshold shares
>       mm/migrate: untag addresses when querying page nodes
>       fat: fix parent link count when replacing a sibling directory
>       inotify: do not coalesce rename events
>       block: Return the soft block size for compat BLKBSZGET
>       isofs: handle Rock Ridge long-form dates before 1900
>       ext2: preserve IOMAP_F_DIRTY for extending direct writes
>
> HyeongJun An (1):
>       ALSA: ump: Fix dropped data bytes at UMP System message conversion
>
> Hyunchul Lee (3):
>       ntfs: reject negative attribute read positions
>       ntfs: initialize VCN when inserting index entries
>       ntfs: avoid overflow when limiting attribute read length
>
> Hyungjung Joo (1):
>       net/9p/usbg: clear stale client pointer on close
>
> Hyunwoo Kim (2):
>       inet: reject unhashed sockets during established lookups
>       net: restore refcount ordering for lockless socket access
>
> Ian Bridges (6):
>       ksmbd: require DELETE access for delete-on-close opens
>       ksmbd: enforce the read-only share flag when creating a stream
>       ksmbd: revert fsids on durable reconnect and replay failure
>       ksmbd: do not read past the DACL in the access denied debug message
>       ksmbd: grant a POSIX ACL group entry only to the group's members
>       ksmbd: let the owner read and change the DACL when no ACE names it
>
> Ian Rogers (2):
>       perf/core: Include perf_event_attr::defer_output in is_sb_event() c=
heck
>       perf/core: Clamp deferred callchain entry count to fit u16 header.s=
ize
>
> Ido Schimmel (1):
>       vxlan: Stop rejecting dynamic FDB entries with a nexthop ID
>
> Igor Pylypiv (1):
>       ata: libata-sata: allow re-enabling NCQ with the same queue_depth
>
> Ilia Mirkin (1):
>       drm/nouveau/devinit/gf100-: try to avoid double-running vbios scrip=
ts
>
> Imre Kaloz (8):
>       scsi: aic7xxx: Fix REQUEST SENSE allocation length on big-endian ho=
sts
>       scsi: aic7xxx: Use default settings on the SGI O2 onboard controlle=
rs
>       MIPS: SGI-IP27: print the NMI dump on an nbcon console
>       MIPS: SGI-IP30: fix the defconfig defaults for the Bridge PROM and =
RTC
>       MIPS: mm: Fix the cache error vector jump for XKPHYS kernels
>       MIPS: sgi-ip32: Mask MACE PCI interrupts in CRIME only
>       MIPS: sgi-ip32: Leave MACE PCI control alone in config accesses
>       MIPS: sgi-ip32: Report the real CRIME revision
>
> Ioannis Coward (1):
>       io_uring/wait: don't sleep on an already expired timeout
>
> Ismail Tarim (1):
>       Bluetooth: btmtk: fix error handling in btmtk_usb_isointf_init()
>
> Jack Blessed Kimani (1):
>       ksmbd: fix NULL pointer dereference in session_user_name() and
> session_account_type()
>
> Jakub Kicinski (1):
>       docs: netdev: try to force agents to disclose info for fixes
>
> Jakub Sitnicki (1):
>       bpf, sockmap: Fix psock update-side data races on sk->sk_prot and p=
rogs
>
> Jamal Hadi Salim (2):
>       bpf: Fix skb_pull() BUG in __bpf_redirect_neigh()
>       net/sched: clamp skb->queue_mapping before indexing the tx queue
>
> James Calligeros (2):
>       ASoC: tas2770: Configure transmit clock edge when setting DAI forma=
t
>       ASoC: tas2770: Fix error detection in tas2770_set_dai_tdm_idle
>
> James Clark (2):
>       net: ethernet: ti: am65-cpts: adjust perout genf following ptp chan=
ges
>       net: ethernet: ti: am65-cpsw-nuss: Enable timestamping of
> unicast PTP packets
>
> James Fantin-Hardesty (1):
>       nvmet: fix arbitration burst field mask
>
> James Hilliard (6):
>       ptp: drain virtual clock sysfs operations before unregistering chil=
dren
>       ptp: unwind partially completed virtual clock creation
>       ptp: vclock: propagate physical clock sampling errors
>       ptp: vclock: serialize extended samples with counter updates
>       ptp: vclock: preserve missing hardware timestamps
>       net: stmmac: take ownership of saved RX state at poll entry
>
> Jan Beulich (1):
>       xen-netback: defer xenvif_mcast_addr_list_free()
>
> Jan Kara (4):
>       udf: Validate extended attribute space is large enough
>       udf, ext2, quota, jbd2: Unify email addresses in MAINTAINERS
>       udf: Simplify udf_table_prealloc_blocks()
>       udf: Fix incorrect error code in udf_current_aext()
>
> Jarkko Sakkinen (1):
>       nvme-keyring: Add a missing key_put() call to nvme_tls_key_lookup()
>
> Jason Perlow (1):
>       wifi: brcmfmac: map msgbuf RX packet IDs bidirectional
>
> Javier Carrasco (11):
>       hwmon: chipcap2: fix command error diagnostics
>       hwmon: chipcap2: fix off-by-one in command mode retry loop
>       hwmon: chipcap2: fix be16 handling
>       hwmon: chipcap2: defer probe when IRQs are unavailable
>       hwmon: chipcap2: fix IRQ teardown ordering
>       hwmon: chipcap2: disable device after hwmon teardown
>       hwmon: chipcap2: enable IRQ processing when regulator is already en=
abled
>       hwmon: chipcap2: balance regulator state
>       hwmon: chipcap2: do not discard pending alarms on disable
>       hwmon: chipcap2: serialize access to the alarm indicators
>       hwmon: chipcap2: synchronize ready IRQ state
>
> Jean-Christophe Guillain (1):
>       iommu/amd: Fix NULL pointer dereference for GPUs without upstream b=
ridge
>
> Jens Axboe (2):
>       io_uring/poll: don't poll a writer for a read side hangup
>       io_uring/poll: don't poll a writer for urgent data
>
> Jerome Brunet (1):
>       ASoC: meson: axg-fifo: request the irq with the clock enabled
>
> Jesse Zhang (11):
>       drm/amdgpu: sign extend the addresses GEM_OP(GET_MAPPING_INFO) retu=
rns
>       drm/amdgpu: parse CS IBs at the BO offset their VA mapping starts a=
t
>       drm/amdgpu: keep the CS user fence BO in GTT
>       drm/amdkfd: use the queue's process info for the WPTR BO eviction f=
ence
>       drm/amdgpu/userq: validate the moved individual BOs on restore
>       drm/amdgpu/gfx12: disallow GFXOFF while updating the SPM VMID
>       drm/amdgpu: drop the dma-buf reference when a KFD import fails
>       drm/amdgpu: unlock the VM and BO when attaching a KFD BO fails
>       drm/amdgpu: rewrite all PTEs of the BOs after a VM reset
>       drm/amdgpu: don't walk the CS chunks when allocating them failed
>       drm/amdgpu: don't drop the gang dependency fence twice
>
> Jia Jia (6):
>       scsi: target: Validate REGISTER AND MOVE TransportID length
>       vhost-scsi: preserve event ordering
>       vhost-scsi: do not relock event vq mutex on send_evt fallback
>       vduse: avoid infinite loop when no affinity CPU is online
>       vhost-scsi: do not count PI bytes in the data length
>       vhost-scsi: fix page reference leak in misaligned I/O fallback
>
> Jiale Yao (1):
>       hwmon: (aquacomputer_d5next) reject short status reports
>
> Jianan Huang (1):
>       blk-mq: reset queue state on scheduler teardown
>
> Jianyun Gao (1):
>       xfs: fix temporary cursor leak in btree shift corruption paths
>
> Jinjie Ruan (1):
>       arm64: kexec_file: Fix elf_headers memory leak in retry loop
>
> Jinwang Li (1):
>       Bluetooth: L2CAP: Ignore connection responses with wrong ident
>
> Joas Antonio dos Santos (2):
>       net/mlx5: macsec: free struct mlx5_fs_id after an RCU grace period
>       tipc: raise the minimum bearer MTU to fit tunnel and crypto overhea=
d
>
> Joe Perches (1):
>       coccinelle: Add devm_kmalloc_objs conversion script
>
> Johan Hovold (1):
>       MAINTAINERS: update auxiliary bus entry
>
> Johannes Weiner (2):
>       mm: page_alloc: do not give all non-blocking requests reserve acces=
s
>       mm: page_alloc: remove ALLOC_NON_BLOCK from ALLOC_RESERVES
>
> John Ogness (1):
>       printk: Avoid multiple unregistration in unregister_console_locked(=
)
>
> Joonhoe Kim (1):
>       net: qrtr: announce local services again once our HELLO is sent
>
> Jose Fernandez (Anthropic) (1):
>       bpf: Fix jited line info off by the CFI preamble
>
> Jose Maria Casanova Crespo (1):
>       drm/v3d: Initialize timedout_batches when running a CSD job
>
> Josef Bacik (21):
>       bpf: Clamp the trace length in __bpf_get_stack() again
>       tmpfs: keep the quota soft limits of an unused id
>       tmpfs: preserve explicitly disabled quota limits
>       mm/shmem: hold off eviction in shmem_writeout()
>       mm/mglru: don't use stack pointers when walking PUD and PMD tables
>       mm/memfd: make f_pos accesses atomic
>       mm/filemap: read mapping->a_ops->free_folio under i_lock
>       mm/filemap: don't lose a folio lock wakeup to a signal
>       ext2: only flush DIRSYNC directories on every change
>       blk-mq: end the request if getting a keyslot fails
>       mm/khugepaged: always recheck the pmd in try_collapse_pte_mapped_th=
p()
>       mm/khugepaged: fix PMD table lock leak in try_collapse_pte_mapped_t=
hp()
>       mm/userfaultfd: wake all waiters on unregister
>       mm/mmu_gather: fix flushing ranges with 4 GiB or larger
>       mm/mmu_notifier: finish non-blocking interval invalidation on error
>       mm/mremap: fix moving PUD leaves
>       mm: fix unmap_mapping_range() beyond 4 GiB on 32-bit
>       nvme-loop: delete the controller if a reset fails
>       nvmet-tcp: ask for the TLS record type on every receive
>       nvmet-auth: keep the old keys if the new ones fail
>       nvmet-tcp: limit the connections accepted per work run
>
> Joseph Kain (1):
>       net: stop defer_count outliving the deferred-free list
>
> Joseph Qi (6):
>       ocfs2: read the xattr entry hash before defragmenting the bucket
>       ocfs2: find the xattr entry again after defragmenting a bucket
>       ocfs2: find the xattr entry again after converting a block to a buc=
ket
>       ocfs2: do not read the entry array of an empty xattr bucket
>       ocfs2: do not index before the entry array when dividing an empty b=
ucket
>       ocfs2: do not read the entry array of an empty xattr block
>
> Josua Mayer (1):
>       dt-bindings: usb: cypress,hx3: make peer-hub property optional
>
> Jouni H=C3=B6gander (5):
>       drm/i915/psr: Clear selective fetch area when duplicating plane sta=
te
>       drm/i915/display: Add enabled pipe planes into state for selective =
fetch
>       drm/i915/psr: Disable linked plane sel fetch as well
>       drm/i915/psr: Fix SFF and CFF CTL register bit definitions
>       drm/i915/psr: Don't clip plane state destination rectangle
>
> Jude Gyimah (5):
>       ASoC: rockchip_i2s: select REGMAP_MMIO
>       ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
>       ASoC: rockchip_pdm: select REGMAP_MMIO
>       ASoC: rockchip_sai: select REGMAP_MMIO
>       ASoC: rockchip_spdif: select REGMAP_MMIO
>
> Juergen Gross (2):
>       xen-netback: Fix UAF when reading statistics data
>       xen-blkback: Avoid UAF when reading I/O statistics
>
> Julia Lawall (1):
>       scripts/coccinelle: improve efficiency of array_end.cocci
>
> J=C3=A9r=C3=A9my Jean (1):
>       nvmet-auth: reject incomplete DHCHAP messages
>
> Kaixuan Li (1):
>       can: isotp: check the frame type, not just the length
>
> Karl Mehltretter (2):
>       dma-buf: keep the DMA flags in the DMABUF_DEBUG copy
>       virtio-spi: Fix virtio_spi_config kernel-doc
>
> Kayra Cizmeci (1):
>       sched/cache: Ignore non-fair current in alb_break_llc()
>
> Kees Cook (4):
>       9p: Add const and unsigned to wnames allocation type
>       treewide: refresh kmalloc_obj() conversions
>       coccinelle: kmalloc_obj: Include devm_kmalloc_obj conversion rules
>       treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() f=
amily
>
> Kefeng Wang (1):
>       xfs: kill xfs_trans_set/clear_context() helpers
>
> Kent Russell (1):
>       drm/amdgpu: Ensure that harvest information gets set
>
> Kevin Dewald (3):
>       Bluetooth: hci_event: Clear explicit connect state on LE connection
>       Bluetooth: MGMT: Clear disabled connection parameters when loading =
none
>       Bluetooth: MGMT: Fix discovery stuck after a failed Stop Discovery
>
> Kevin Mitchell (1):
>       iommu/amd: remove obsolete domain pointer warning on release
>
> Kevin Wang (1):
>       drm/amd/pm: populate unique ID for smu 13.0.7
>
> Kiryl Shutsemau (Meta) (3):
>       mm/hugetlb_vmemmap: map the shared tail page writable
>       arm64: sdei: Run the event handler on the kernel vectors
>       arm64: sdei: Preserve the interrupted context's exception registers
>
> Konstantin Sinyuk (1):
>       MAINTAINERS: Update habanalabs maintainer contacts and status
>
> Krystian Kaniewski (1):
>       blk-mq: fix out-of-bounds read in blk_mq_free_rqs
>
> Kuangyi Chiang (1):
>       ALSA: usb-audio: Add delay quirk for HIK camera
>
> Kuniyuki Iwashima (3):
>       ipv6: Flush exception route while replacing nexthop.
>       ipv6: Flush rt->from in rt6_uncached_list_flush_dev().
>       ipv4: Call rt_add_uncached_list() if !do_cache in ip_route_input_sl=
ow().
>
> Kyle Bader (1):
>       block: only fail dma-buf bios that need block layer PI
>
> Kyle Zeng (6):
>       batman-adv: mcast: validate tracker padding before forwarding
>       mm/khugepaged: flush deferred unmaps before dropping a failed folio
>       net/sched: sch_qfq: prevent aggregate self-replacement
>       tcp: wait for TIME_WAIT teardown before freeing per-netns ehash
>       ip6mr: Serialize multicast router socket ownership
>       mptcp: pm: kernel: use RCU to free endpoint listeners
>
> Kylie C (1):
>       drm/amd/display: Don't select zero V_TOTAL_MIN/MAX on seamless boot
>
> Lance Yang (2):
>       mm/ksm: fix userfaultfd protection during merge and unmerge
>       khugepaged: fix readahead lock inversion in collapse_file()
>
> Laveesh Bansal (1):
>       block: only serialize elevator switches of the same queue
>
> Lee Jones (1):
>       ASoC: SOF: Intel: hda-sdw-bpt: Stop active DMA before closing BPT s=
treams
>
> Leo Liu (1):
>       drm/amdgpu: cancel idle work in hw_init failure paths for vcn/uvd/v=
ce/jpeg
>
> Leo Yan (1):
>       Revert "perf/aux: Allocate non-contiguous AUX pages by default"
>
> Leon Romanovsky (1):
>       dma-buf: Restore the scatterlist entry count before freeing
>
> Li RongQing (1):
>       virtio_ring: reset IN_ORDER state in virtqueue_init()
>
> Li Zhe (2):
>       mm/hugetlb: fix mremap move length truncation
>       mm/hugetlb: fix mremap deadlock when PMD sharing is possible
>
> Linfeng Sun (8):
>       vdpa_sim: serialize IOTLB updates with dataplane access
>       vdpa: invalidate DMA mappings before releasing memory
>       vhost: fix dirty logging for in-order used ring entries
>       vhost: reject invalid IOTLB update permissions
>       vhost-scsi: validate event queue descriptor direction
>       vhost-scsi: reject delayed virtqueue setup
>       vhost: reject backend enable without a kick file
>       vhost-vdpa: initialize state before publishing cdev
>
> Linus Torvalds (2):
>       vfs: fix take_dentry_name_snapshot() semantics
>       Linux 7.4-rc2
>
> Liu Changjie (1):
>       can: peak_usb: pcan_usb_fd_decode_buf(): accept short uCAN
> end-of-list records
>
> Lorenzo Bianconi (9):
>       net: stmmac: drop split frames on AF_XDP zero-copy RX
>       net: stmmac: drop multi-buffer frames in XDP mode
>       net: stmmac: copy XDP metadata in AF_XDP zero-copy RX
>       net: stmmac: fix VLAN tag stripping on short and non-linear RX fram=
es
>       net: stmmac: fix XDP RX buffer DMA sync length
>       net: stmmac: initialize est_lock at probe time
>       net: stmmac: pass the desired EST enable state to est_configure()
>       net: stmmac: re-apply taprio offload in __stmmac_open() and
> stmmac_resume()
>       net: stmmac: set XDP metadata length on the page_pool RX path
>
> Lorenzo Stoakes (ARM) (5):
>       mm/vma: fix expansion of VMA_MIXEDMAP_BIT VMAs
>       mm: do not unintentionally overwrite atomic VMA flags
>       mm/vma: avoid losing atomic VMA flags when setting sticky VMA flags
>       mm/vma: update VMA iterator state on error in new VMA merge
>       fs/proc/task_mmu: fix missed VMAs when reading /proc/PID/maps and f=
riends
>
> Lu Yao (1):
>       drm/i915/gem: Reset err for each fence entry
>
> Lucas Tanure (2):
>       drm/vc4: hdmi: always cancel the scrambling work synchronously
>       drm/vc4: hdmi: enable scrambling before the TMDS clock starts
>
> Luiz Augusto von Dentz (4):
>       Bluetooth: hci_sync: Fix invalid Supervision_Timeout in LE Set
> Default Rate
>       Bluetooth: hci_core: Convert hci_conn flags to a bitmap
>       Bluetooth: L2CAP: Hold incoming data until encryption key size is k=
nown
>       Bluetooth: hci_sync: Update the CIS host feature when enabling LE
>
> Maoxia (1):
>       virtio_pci: add missing newline to the pmcsr error message
>
> Marco Giunta (3):
>       ALSA: hda: aw88399: use auto-cleanup for ACPI subsystem ID string
>       ALSA: hda: aw88399: add missing MODULE_AUTHOR to I2C driver
>       ASoC: aw88399: move library exports to SND_SOC_AW88399_LIB namespac=
e
>
> Marco Ziliani (1):
>       ata: libata-pmp: disable the SEMB port on Marvell 88SM9705
>
> Mario Limonciello (1):
>       drm/amd/pm: track BACO state in the SMU v11 ArmD3 sequence
>
> Mario Limonciello (AMD) (1):
>       iommu/amd: Enable PerfOpt automatically for integrated GPUs
>
> Masafumi Suzuki (1):
>       sctp: account for chunk padding in sctp_init_cause()
>
> Matheus Alves de Almeida (2):
>       fat: preallocate space before expanding in fat_cont_expand()
>       fat: hold truncate_lock in fat_write_failed()
>
> Matthew Schwartz (1):
>       drm/amd/display: Keep the nominal vtotal while VRR is inactive
>
> Matthew Whitehead (1):
>       scsi: aha1542: Remove unneeded scsi_dma_unmap() call
>
> Matthias Goergens (4):
>       udf: don't let the extent type hide an exhausted free-space table e=
xtent
>       udf: check the unallocated space table when it is loaded
>       udf: fix preallocation discarding before an empty allocation extent
>       udf: don't use eloc after the end of the unallocated space table
>
> Matus Skvarla (1):
>       net/9p: add vsock transport
>
> Maxime Chevallier (1):
>       net: Use a dedicated flag to track disabled napi instances
>
> Ma=C3=ADra Canal (3):
>       drm/vc4: Publish the output fence outside of job_lock
>       drm/vc4: Drop the BO reservations outside of job_lock
>       drm/v3d: Widen cache_clean_lock over the whole L2TCACTL sequence
>
> Melissa Wen (1):
>       drm/amd/display: Signal PQ EOTF in FreeSync infopacket for DP HDR
>
> Michael Bommarito (1):
>       9p/trans_virtio: reject mount tags longer than NAME_MAX at probe
>
> Michael Grzeschik (6):
>       net/9p/usbg: also disable endpoints on p9_usbg_close
>       net/9p/usbg: set client to Disconnected on usb9pfs_disable
>       net/9p/usbg: always reset completion when disconnecting
>       net/9p/usbg: call disable_usb9pfs() from usb9pfs_disable()
>       net/9p/usbg: fix out_req buffer leak in disable_usb9pfs
>       net/9p/usbg: remove bogus context initialization in alloc_requests
>
> Michael McAllister (1):
>       Bluetooth: qca: Fix the WCN3950 NVM baud rate offset
>
> Michal Wilczynski (1):
>       drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
>
> Micha=C5=82 Kope=C4=87 (2):
>       firmware: coreboot: Don't skip CBMEM entries outside of known memor=
y
>       ALSA: hda/core: Stop capability walk on empty capability header
>
> Miguel Ojeda (1):
>       rust: cpufreq: fix `undocumented_unsafe_blocks` in `PolicyCpu::from=
_cpu()`
>
> Mike Rapoport (Microsoft) (2):
>       mm/cma: accept memory of multi-range CMA areas
>       mm/cma: accept memory of CMA areas reserved at a fixed address
>
> Mikhail Gavrilov (1):
>       drm/amd/display: set allow_freesync before validating a new stream
>
> Milan Milicevic (2):
>       drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts for navi=
10_ih
>       drm/amdgpu: publish IH enabled before PSP programs IH_RB_CNTL
>
> Mingbing Zhai (1):
>       virtio_balloon: initialize wakeup_lock before virtqueues are set up
>
> Misha Nasledov (1):
>       drm/amd/display: Drop clock requirements on DCN32 when no
> displays are active
>
> Mitul Golani (1):
>       drm/i915/display: Allow port sync on PTL
>
> Mohamed Yassine Jebabli (1):
>       ALSA: hda/tas2781: Only accept CRC-less V1 data if all entries are =
valid
>
> Mohit Sharma (1):
>       ASoC: qcom: q6apm: Guard callbacks until probe data is ready
>
> Mukul Joshi (1):
>       drm/amdgpu: only tear down an active UALink accelerator
>
> Munique Feitoza (1):
>       drm/nouveau: Fix CE channel creation on pre-Kepler GPUs
>
> Myeonghun Pak (1):
>       hwmon: (sht15) Stop deferred work before releasing its resources
>
> Naman Jain (1):
>       x86/init: Initialize wall clock in get_rtc_noop()
>
> Namjae Jeon (1):
>       ntfs: don't allow resident values to overlap the attribute header
>
> Nathan Chancellor (2):
>       ext2: Make sbi an proper alias for EXT2_SB(sb) in ext2_fill_super()
>       lib/base64: silence clang-24 -Wconstant-conversion with diag pragma=
s
>
> Naushir Patuck (1):
>       dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
>
> Nguyen Dinh Phi (1):
>       vsock: reject negative tv_usec in SO_VM_SOCKETS_CONNECT_TIMEOUT
>
> Nguyen Ngoc Thang (1):
>       net: phy: don't require RTNL to detach a PHY from an unregistered n=
etdev
>
> Nguyen Thanh Nhat (1):
>       ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71
>
> Nickolai Zeldovich (2):
>       panic: zero the dynamically allocated taint buffer
>       sched/deadline: Fix this_bw on class change of a dying task
>
> Niklas Cassel (10):
>       ata: libata-eh: Retry non-NCQ commands when their sense data asks f=
or it
>       null_blk: fix opening closed zones at the active zone limit
>       null_blk: don't finish zones to set them read-only or offline
>       null_blk: clean up setting zones read-only or offline
>       ata: libata-scsi: fix MODE SELECT handling of data after the mode p=
age
>       ata: libata-scsi: do not accept subpage code FFh in MODE SELECT
>       ata: libata-scsi: reject MODE SELECT mode pages with a wrong SPF bi=
t
>       ata: libata-scsi: fix MODE SELECT field pointer for unsupported sub=
pages
>       ata: libata-scsi: fix MODE SELECT field pointer for block
> descriptor length
>       ata: libata-scsi: pass the whole mode page to the MODE SELECT handl=
ers
>
> Nilay Shroff (1):
>       nvmet: cache passthru reference in __nvmet_req_complete()
>
> Oliver Hartkopp (6):
>       can: replace ARPHRD_CAN type checks with can_get_ml_priv()
>       can: isotp: check the return values of can_rx_register() in isotp_b=
ind()
>       can: protect the receive lists with a per-device lock
>       can: raw, isotp: copy socket options outside of lock_sock()
>       can: proc: skip stats calculation after reset in can_stat_update()
>       can: proc: remove pointers from CAN specific proc output
>
> Omokefe Emmanuel Onanaroghene (1):
>       9p: fix kernel-doc warning for enum p9_session_flags
>
> Orkun Emin Sar=C4=B1 (1):
>       io_uring: only wait for in-flight requests if the closing task
> uses the ring
>
> Pavel Begunkov (1):
>       io_uring: add feature flag for dma-buf support
>
> Pedro Falcato (1):
>       ext2: take invalidate_lock in ext2_write_failed()
>
> Peter Hunt (1):
>       net: wwan: mhi_wwan_ctrl: send a DTR drop before it can be coalesce=
d
>
> Peter Zijlstra (2):
>       locking/osq: Switch osq_wait_next()/atomic_cmpxchg() ordering
>       locking/osq: Fix unlink queue corruption
>
> Petr Mladek (1):
>       MAINTAINERS: Add new "printk" mailing list for PRINTK, PRINTK
> INDEXING, and VSPRINTF
>
> Prasad Koya (1):
>       macvlan: fix allmulti reference counting in passthru mode
>
> Prike Liang (7):
>       drm/amdgpu/mes: skip unmap queue notification during GPU reset
>       drm/amdgpu/uvd: don't allocate or lock BOs in the direct IB test
>       drm/amdgpu/userq: wait for GPU reset before mapping or unmapping qu=
eues
>       drm/amdgpu: finish GPU recovery callbacks before restarting schedul=
ers
>       drm/amdgpu: stop the schedulers before preparing the GPU reset
>       drm/amdgpu/vce: don't allocate a scheduler fence in the direct IB t=
est
>       drm/amdgpu: stop GPU recovery wait for the JPEG/VCN idle work
>
> Puranjay Mohan (1):
>       bpf: Drop percpu_counter from the htab element count
>
> Qianghua Wang (2):
>       ASoC: Intel: soc-acpi: use dummy topology for SN624x
>       ASoC: codecs: sn624x-sdca: limit DMIC capture to 2 channels
>
> Qihang (2):
>       xfrm: interface: validate the IP header on xmit
>       cipso: fix optlen corruption in cipso_v4_delopt()
>
> Qiliang Yuan (3):
>       nvmet: drop the extra RCU grace period in nvmet_ns_disable()
>       srcu: Add list_splice_init_srcu()
>       nvme: wait for SRCU readers before splicing the namespace list
>
> Qingfang Deng (1):
>       tcp: initialize send sequence numbers before deferring TFO
>
> Qu Wenruo (4):
>       btrfs: always remove quota_root from dirty_cowonly_roots
>       btrfs: cleanup qgroup swapped blocks at root release
>       btrfs: cleanup dirty_cowonly_roots during btrfs_free_fs_roots()
>       btrfs: fix the fsverity callback where unexpected range is verified
>
> Rafael Medina (1):
>       ALSA: hda/ca0132: Restore AE-5 audio registers after LED strip send
>
> Ravi Bangoria (3):
>       perf/amd/ibs: Reset CPU0 IBS state on syscore resume
>       perf/amd/ibs: Fix kernel address leak via REGS_USER and REGS_INTR
>       perf/amd/ibs: Simplify event state handling with IBS_CAPS_DIS
>
> Ravi Singh (1):
>       xfs: mark i_mode=3D0 and shut down on attr fork inactivation failur=
e
>
> Ray Zhang (1):
>       net: count last skb of each sk_backlog pass in __release_sock()
>
> Razvan Dinculescu (1):
>       ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs
>
> Reid Downing (1):
>       xfs: fix wrong compat fields in xfs_ioctl32_bstat_copyin()
>
> Reinette Chatre (1):
>       MAINTAINERS: Add Ben Horgan as fs/resctrl reviewer
>
> Richard Fitzgerald (5):
>       firmware: cs_dsp: Fix memory leak on cs_dsp_power_up() error path
>       ASoC: wm_adsp: Prevent negative string length in wm_adsp_control_ad=
d()
>       ALSA: hda: cs35l56: Fix mixed cleanup and goto in cs35l56_hda_fw_lo=
ad()
>       ALSA: doc: cs35l56: Update calibration write failure message info
>       ALSA: hda: cs35l56: Stop cs_dsp before calling cs_dsp_power_down()
>
> Ridge Lomont (1):
>       x86/kcfi: Don't emit KCFI_REFERENCE() in modules
>
> Rik van Riel (1):
>       mm/cma: don't release CMA pages still in use
>
> Riley (1):
>       ALSA: usb-audio: Add quirk for Yamaha ZG02
>
> Ritesh Harjani (IBM) (1):
>       mm/huge_memory: set the mmu_gather page size in zap_huge_pud()
>
> Rodnei Cilto (1):
>       ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6
>
> Roman Demidov (1):
>       drm/amd/display: Fix NULL deref in dcn401_update_clocks_update_dtb_=
dto
>
> Roman Li (1):
>       drm/amd/display: Reset DET of HUBPs without a plane before
> outstanding updates
>
> Rosen Penev (8):
>       9p/xen: Use array for data rings
>       spi: acpi: only look up the IRQ of confirmed SPI devices
>       x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_m=
agic()
>       drm/nouveau/fifo: map Kepler video engine contexts non-privileged
>       drm/nouveau/nvkm: clear use.enabled when subdev init fails
>       MIPS: Avoid dead code/data elimination when using recordmcount
>       MIPS: boot: compressed: place .rodata.* and discard .MIPS.abiflags
>       MIPS: boot: compressed: fix the vmlinuz link with ld.lld
>
> Runyu Xiao (1):
>       can: proc: reset pkg_stats atomics individually
>
> SJ Park (3):
>       mm/damon/sysfs-schemes: hold damon_sysfs_lock in target_metric_stor=
e()
>       mm/damon/core: move static variable last_nr_regions to damon_ctx
>       mm/damon/core: move static variable rotation to damon_ctx
>
> Sabrina Dubroca (1):
>       xfrm: espintcp: reorder operations within espintcp_init_sk
>
> Sahil Chandna (1):
>       net: mana: Add support to process throttled EQEs
>
> Salvatore Dipietro (1):
>       mm/page_alloc: avoid direct reclaim and compaction for costly
> __GFP_NORETRY allocations
>
> Samarth Narang (1):
>       mm/ksm: keep soft-dirty when merging a page
>
> Samiullah Khawaja (1):
>       mm/gup: check folio->mapping under folio lock in memfd_pin_folios()
>
> Sasha Levin (7):
>       ALSA: memalloc: Free the new pages when WC DMA mapping fails
>       ALSA: hda/core: Fix double free on stream page allocation failure
>       rust: bindings: derive Zeroable for bindgen's opaque array wrappers
>       selftests/configfs: fix the build on 32-bit architectures
>       selftests: ublk: fix the build and file offsets on 32-bit
>       selftests/io_uring: cast optval through uintptr_t in mini_liburing.=
h
>       nvme-pci: add NVME_QUIRK_DMAPOOL_ALIGN_512 for KIOXIA XG10d
>
> Sean Christopherson (7):
>       KVM: nSVM: Check validity of vmcs01 save area copied from SMRAM on =
RSM
>       KVM: x86/mmu: Conditionally resched when retrying gPTE walk on
> A/D update failure
>       KVM: x86: Conditionally resched when restarting REP string emulatio=
n
>       KVM: nVMX: Process each host MSR entry at most once when
> unwinding failed VM-Entry
>       KVM: x86/mmu: Cap number of parent PTEs per SP at 1000 (the
> arbitrary rmap limit)
>       KVM: x86: Unconditionally reset MMU context when emulating INIT
>       KVM: x86: Flush guest TLB when emulating a RESET to strictly
> honor the spec
>
> Sean Rhodes (1):
>       firmware: coreboot: Fix CFR error-pointer handling warning
>
> Sergii Ushakov (2):
>       virtio-blk: clamp max_segments to virtqueue ring size
>       virtio-blk: clamp max_segments to virtqueue ring size
>
> Shakeel Butt (2):
>       kernfs: avoid READ_ONCE() on a kgid_t in kernfs_new_node()
>       io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thre=
ad
>
> Shang En Sim (2):
>       io_uring/cancel: count all requests that a CANCEL_ALL cancels
>       io_uring/poll: cancel all matching requests in one pass
>
> Shao Mingyin (8):
>       scsi: target: tcmu: Fix divide-by-zero in data_pages_per_blk store
>       virtio-blk: Fix zone append sector reporting in batched completion
>       zloop: fix the error code in the blk_mq_alloc_disk message
>       zloop: reject mismatched conventional zone files on restore
>       nvmet: take subsys->lock when forcing reconnects for tbkas
>       nvmet: bound the traddr and trsvcid configfs writes
>       nvmet: drop the redundant auth check in nvmet_parse_io_cmd()
>       ata: libata-scsi: set the field pointer when rejecting CDL
>
> Shivam Madlani (1):
>       ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP OmniBook 7
>
> Shuai Liu (1):
>       io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
>
> Shubham Antil (2):
>       xfrm: zero-initialise km_event in the replay-notify path
>       vhost-scsi: zero misaligned I/O bounce pages
>
> Sinan Turunc (3):
>       ALSA: line6: Reject capture buffers smaller than two packets
>       ALSA: usx2y: Require a buffer of two URBs
>       ALSA: usx2y: Guard the playback copy
>
> Sreeraj S Kurup (2):
>       nvmet: use appropriate types for authentication payload lengths
>       ALSA: control: Clear user-provided numid before adding a control
>
> Stefan Binding (2):
>       ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot=
 api
>       ASoC: cs35l41: Use common wait_for_boot and reset_and_boot apis
>
> Stefano Garzarella (1):
>       9p: fix privport option setting wrong RDMA field
>
> Stefano Radaelli (1):
>       ASoC: wm8904: Enable FLL when switching an active SYSCLK to FLL
>
> Stjepan Poljak (1):
>       ALSA: usb-audio: don't resubmit MIDI URBs at once on -EPIPE
>
> Suraj Kandpal (1):
>       drm/i915/display: Limit NVL TRANS_VTOTAL.Vtotal skip to A-step
>
> Sven Eckelmann (11):
>       batman-adv: tpmeter: fix u32 truncation of reported bytes
>       batman-adv: dat: initialize orig_node of unfilled candidate slots
>       batman-adv: fix skb leak when hard_iface is being released
>       batman-adv: stop originator purge worker before freeing TT
>       batman-adv: tt: only transmit local ROAM flag together with DEL
>       batman-adv: tt: clear ROAM flag when re-adding a pending local clie=
nt
>       batman-adv: tt: send ROAM_ADV on each roamed back client
>       batman-adv: tt: ignore ROAM flag of received ADD changes
>       batman-adv: tt: only update flags for TT events
>       batman-adv: tt: don't drop local events queued during TVLV update
>       batman-adv: tt: limit local table to single TVLV response size
>
> T.J. Mercier (1):
>       mm: memcontrol: fix NULL pointer deref and UAF from
> high_work_func() on dying memcg
>
> Takashi Iwai (1):
>       ALSA: pcm: Prevent O_APPEND open on OSS streams
>
> Takashi Sakamoto (2):
>       firewire: ohci: avoid potential deadlock when queueing AT local req=
uests
>       ALSA: firewire: fix inverted streaming speed between tx and rx stre=
ams
>
> Tal Zussman (2):
>       vhost-vdpa: fix pinned page leak in vhost_vdpa_pa_map() error path
>       vhost-vdpa: unpin mappings by range
>
> Tang Bin (1):
>       ASoC: codecs: lpass-rx-macro: fix PM ref leak in swclk_gate_enable
>
> Thomas Fourier (2):
>       btrfs: zoned: fix double free of bitmaps on clone failure
>       net: ipa: Fix double free of the interrupt structure on config erro=
r
>
> Thomas Gleixner (1):
>       x86/entry: Fix ptrace regression
>
> Thorsten Blum (3):
>       hwrng: virtio - prevent use-after-free after a failed restore
>       ALSA: usx2y: Use prepare_inurb() in usb_stream_start()
>       x86/boot: Fix off-by-one error in sme_clear_pgd()
>
> Timur Stukan (2):
>       bonding: 3ad: don't set BOND_LINK_FAIL on a slave that is not up
>       bonding: fix missing down path on speed/duplex failure after FAIL->=
UP
>
> Tobias Wilken (1):
>       Bluetooth: MGMT: Return RFKILLED for Set Powered on a blocked contr=
oller
>
> Toke H=C3=B8iland-J=C3=B8rgensen (1):
>       wifi: mac80211: reinstate IEEE80211_TX_CTL_AMPDU flag in
> ieee80211_tx_prep_agg()
>
> Tung Nguyen (1):
>       tipc: reject attaching bearer of different media to the same
> occupied device
>
> Tvrtko Ursulin (2):
>       drm/sched: Fix out of bounds entity priority check
>       drm/sched: Adjust run-queue when changing priority at runtime
>
> Valentin Kindschi (2):
>       Bluetooth: hci_sync: re-enable legacy advertising on resume
>       Bluetooth: hci_sync: pause advertising for the scan address update
>
> Vas Zayarskiy (1):
>       hwmon: (aquacomputer_d5next) Avoid truncating scaled sensor reading=
s
>
> Vidya Srinivas (2):
>       drm/i915/display: Single scaler per pipe on WCL
>       drm/i915/display: Disable pipe joiner on WCL
>
> Ville Syrj=C3=A4l=C3=A4 (1):
>       drm/i915/vrr: Fix intel_vrr_dcb_vmin_vblank_start()
>
> Vincent Cloutier (1):
>       ALSA: pcm: Allow HW_REFINE queries with mapped buffers
>
> Vincent Jardin (1):
>       hwmon: (pmbus/core) Register the thermal sensors with a 0-based ind=
ex
>
> Vincent Mailhol (1):
>       can: dev: can_dropped_invalid_skb: drop CAN XL frames on non-CAN
> XL devices
>
> Vincent YUE (1):
>       scsi: mpt3sas: Register devices during SANITIZE
>
> Vlad Poenaru (1):
>       bnxt_en: Don't keep MSI-X vectors added before FW reserves them
>
> Vladimir Zapolskiy (2):
>       drm/panel: visionox-r66451: Send the brightness value MSB first
>       drm/panel: visionox-r66451: Wait longer after the panel reset
>
> Vlastimil Babka (SUSE) (2):
>       MAINTAINERS: add Johannes as the page allocator co-maintainer
>       MAINTAINERS: move SLAB ALLOCATOR under MEMORY MANAGEMENT
>
> Wang Wensheng (1):
>       printk_ringbuffer: Fix space_used() when blk_lpos->next overflows
>
> Wayne Lin (1):
>       drm/amd/display: add missing CRC engine 1 registers
>
> Wei Lixiang (1):
>       ASoC: amd: yc: drop duplicated DMI quirk entries
>
> Wei Wang (1):
>       arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
>
> Wei-Shuo Chen (1):
>       virtio: use consistent virtqueue terminology
>
> Weibin Liu (1):
>       spi: amd: validate FIFO usage before executing message
>
> Weigang He (1):
>       wifi: mac80211: reload TDLS header pointer after skb_linearize()
>
> Wentao Liang (1):
>       ALSA: caiaq: free the EP4 URB when input setup fails
>
> Werner Sembach (1):
>       drm/i915/display: Add quirk to force backlight type on some TUXEDO =
devices
>
> Wilfred Mallawa (1):
>       xfs: fix unwind handling during xfs_mount_sysfs_init()
>
> Xia Yan (3):
>       veth: keep carrier off when resizing channels with a down peer
>       selftests: net: check veth carrier after changing channel counts
>       ipv6: fix device binding after failed datagram connect
>
> Xiang Mei (1):
>       vdpa: fix double free of the reply skb in
> vdpa_nl_cmd_dev_config_get_doit()
>
> Xu Yunxiang (2):
>       bpf: Propagate scalar precision through stack arguments
>       selftests/bpf: Exercise stack argument precision on state reuse
>
> Yafang Shao (1):
>       mm/migrate: snapshot the source nid before the misplaced migration
>
> Yehyeong Lee (1):
>       9p/xen: validate the response size from the backend
>
> Yifan Zhang (3):
>       Bluetooth: validate retained LE Create CIS command length
>       Bluetooth: validate retained LE Set CIG Parameters command length
>       ksmbd: require NUL-terminated EA names
>
> Yifei Gao (1):
>       9p/xen: fix refcount leak in p9_xen_response() on wrong tag
>
> Yili Zhang (1):
>       dma-buf: Fix IOVA offset when linking phys vecs to sgt
>
> Yilin Zhang (1):
>       mptcp: do not use Fast Open on MP_JOIN subflows
>
> Yingjie Wang (4):
>       scsi: bsg: Report synchronous data copyback failures
>       scsi: bsg: Report io_uring data copyback failures
>       ipv6: reject wrapped temporary address preferred lifetimes
>       nvmet: reject keep-alive timeouts that would overflow
>
> Yitang Yang (1):
>       ublk: add missing DEL_DEV_ASYNC to unprivileged permission check
>
> Yizhou Zhao (6):
>       9p: use fc->net_ns for network namespace in RDMA and socket transpo=
rts
>       net/9p/usbg: fix descriptor cleanup use-after-free
>       net/9p/usbg: fix prefix matching in device lookup
>       net/9p/usbg: Fix use-after-free on usb9pfs_clear_tx
>       9p/xen: drain response work after unbinding IRQ
>       net/9p/usbg: Fix use-after-free in disable_usb9pfs()
>
> Yonghong Song (1):
>       selftests/bpf: Fix callback recursion test with noipa global func
>
> YouYou Yu (1):
>       quota: initialize dquot cache before mounting rootfs
>
> Yu Zhang (3):
>       scsi: target: Fix demo-mode dynamic ACL dev-entry UAF vs LUN teardo=
wn
>       ptp: fix use-after-free in extts_fifo_show() reading tsevqs unlocke=
d
>       vhost-vdpa: drop the parent's vq callback before the call fd is rel=
eased
>
> YuanZhe Liu (6):
>       ALSA: us122l: Add missing NULL check in usb_stream_hwdep_mmap()
>       ALSA: us122l: Fix NULL dereference at hwdep open and release
>       ALSA: usx2y: Initialize idle URBs before submitting streams
>       ALSA: hwdep: Serialize DSP load requests
>       ALSA: bcd2000: Fix use-after-free of MIDI URBs on file close
>       ALSA: usx2y: Refuse a retried DSP load after a failure
>
> Yuanfu Xie (3):
>       9p: don't decrement a server-owned zero nlink
>       9p: fall back to the normal open path for non-regular files
>       9p: do not store the create fid on special files
>
> Yuanhe Shu (1):
>       scsi: target: Verify the iSCSI ISID is null-terminated
>
> Yuansheng Yang (1):
>       io_uring/rsrc: hold uring_lock across index-alloc put_user
>
> Yuho Choi (3):
>       virtio_blk: Reset device on probe error paths after DRIVER_OK
>       iommu/virtio: Reset device before deleting virtqueues on probe fail=
ure
>       vdpa/snet: Don't discard the DPU error in snet_send_ctrl_msg()
>
> Yunye Zhao (1):
>       virtio_blk: freeze the virtqueue layout at probe time
>
> Yuqiang Sun (3):
>       bpf: lwt: Free the skb when bpf_xmit() fails to expand the headroom
>       nvme: Do not drop the cdev reference twice when cdev_device_add() f=
ails
>       ALSA: usb-audio: qcom: Check the return value of qmi_handle_init()
>
> Zac Lanzon (1):
>       hwmon: (asus_rog_ryujin) Fix pump control source on the Ryujin III
>
> Zack Rusin (1):
>       x86/vmware: Fix i386 high-bandwidth hypercall arguments
>
> Zenghui Yu (Huawei) (3):
>       mm/page_alloc: mark pages freed by __free_pages_core() as not tagge=
d
>       selftests/mm: fix khugepaged_race build with older glibc
>       virtio_pci: don't take the MSI mutex under cpu_hotplug_lock
>
> Zhan Xusheng (1):
>       ntfs: don't allow compression on volumes with clusters larger than =
4K
>
> Zhang Heng (4):
>       ALSA: hda/realtek: Fix DAC binding for Lenovo Legion Pro 7 16ARX8H
>       ALSA: hda/realtek: Fix DAC binding for Legion Pro 7 16ARX8H variant
>       ALSA: hda/realtek: Fix pop noise on ASUS PRIME B650M-K
>       ALSA: hda: cs35l41: Add support for HP OmniBook 7 Laptop 16-ay0xxx
>
> Zhang Yi (1):
>       ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing
>
> Zhao Gongyi (2):
>       arm64: mm: validate /dev/mem mmap ranges without overflow
>       ata: libata-scsi: reject data-in commands with a data-out buffer
>
> Zhao Zhang (1):
>       9p: fix caches_show() out-of-bounds write
>
> Zhe Liu (1):
>       blk-iocost: account flush sequence latency only once
>
> Zhi-Jun You (4):
>       net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for W=
ED v3
>       net: ethernet: mtk_wed: fix reset condition for rx wdma
>       net: ethernet: mtk_wed: free up rings during detach
>       net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
>
> Zhou Qiuyue (1):
>       ipv6: raw: fix use-after-free in rawv6_send_hdrinc()
>
> Zhuangzhuang Wang (1):
>       locking/lockdep: Fix inverted "on"/"last" CPU label in
> lockdep_print_held_locks()
>
> Zijing Yin (1):
>       wifi: cfg80211: fix out-of-bounds read in valid_rule()
>
> Zizhi Wo (1):
>       block: partitions: reject GPT entries with starting_lba > ending_lb=
a
>
> ahmad baghereslami (1):
>       ALSA: hda/conexant: Add mute LED quirk for HP ZBook 17 G3
>
> chenglong.ma (1):
>       vduse: fix VA/PA confusion in the coherent page fault path
>
> guolingxing (3):
>       btrfs: sysfs: restore NOFS context on early return in
> btrfs_sysfs_add_block_group_type()
>       btrfs: verity: propagate orphan insertion errors when enabling veri=
ty
>       btrfs: prevent deleting the wrong subvolume by ID
>
> luyuantao (1):
>       drm/panic: Fix the loop that causes kmsg to not display correctly
>
> renpanpan (2):
>       ALSA: usb-audio: Fix card name for CVT Touch Device (1ff7:0f33)
>       drm/amdgpu: Only enable HDMI audio if display supports it
>
> sungbyeongchan (1):
>       virtio_ring: use shadow flags when detaching split descriptors
>
> yinguobing (1):
>       ALSA: hda/realtek: Add quirk for Huawei WRT-WX9 (ALC256, 19e5:320d)
>
> zhang jiao (1):
>       virtio_ring: Initialize id field in packed indirect descriptors
>
