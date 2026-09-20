Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42AE23ABBE
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938201; cv=none; b=cERDNOpLxgBlfIUGobTFY7We/iNPJYq42z1YrEMYBO+TT05DsdFDBuq7I3b4zV+VkcPigVe0G93uUz9LKxXhgdi7lNfVBZGVIkGGyEQpTWUKzG+xnZ2sd7OCnsKA2G3+OacLJIp1EliBLuFfO7P16KhBhgfax0VWPkd+TCZxS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938201; c=relaxed/simple;
	bh=z43xigBsXPEnTpduFQGiYPXwvtecVRpgU6Iy0Rh4unQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FU76uXmgVqVr7BhmdPOoAfvcSVeXvSHdaPVWy/di8llxgwhiB7t1c/cqRyCas1hJu2DOM8GcNSRJ+tIKFPWTSeV+nqXn8qbtkxzH/3QK8t19gPPaVC/lrUltXZ8CM5C7dBMIEq59e7sZ5YXMISjigp4s2spf8UG4CqPhZQRIJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EfZP5SHU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EfZP5SHU"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20ce3c118aso356775466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789938195; x=1790542995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/9krFwnorIHFus/adrFLSNxy9zRl+OJQG/mqpHvSik=;
        b=EfZP5SHU7rpl4ytzarGDynAb9xnaMeAZGbFotQaUJGY0YETT9d3wnbGrkW5tTgXFDw
         OEghnl+U0rnogyllLpFjHP1hv522UWzrgicrHAW8w7h9Ip3iUFH2fMJP6WTk9abChOzH
         VGHaNsf0MdsNmS/xohajR6YOXJHt1q7zkjiBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938195; x=1790542995;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/9krFwnorIHFus/adrFLSNxy9zRl+OJQG/mqpHvSik=;
        b=JYGVkDjxsnhloUjtlVeOfRJq1Kgoo4pDLqvkI4x3oSlaLLEc8bQ969ewOKfqIfbmCM
         dGa8NTVHHECWy7FaHk9Q/DL5en2Iy5V/mzhhKclPOJJkLsWPp7ccBddql/mKVa5R0uXZ
         wW3B0eQigwXWDgEqQ5/+pBVdkLMgpOgsfO18bSahjyxHyd7xR1BipsoObIHOcbX9FCIY
         swS0dGvAzL0HlFV1yq/S7kSAQNBWeTRDfDahDgpR06ZdKM3EII9Ib3y5iSeX+3+CwSaJ
         +v0t2+AyRtTPAHmkPVzTyn/j4ay099971QmoTlFj9n8447p+kyNmpBQiyHkATisdS/6E
         oBVg==
X-Gm-Message-State: AFuF++lxY7lQJFmcTr2skHBt0LVHQUxdjjxJnHyf81X7LrSSWGjPqpiv
	b/NdMpv53FQi85unECY/CECmxu9lkS74fBFFj0fYoY6mGq/OSkbyJSjgwmXRH+8AcaDdurgqyLg
	YBB3VgVw=
X-Gm-Gg: AYBFou2G/LPWfqxY+2qFj1LViMTy8W3aLtLnVzSfEW1xjufZfUg+ArtP2+UTz9hWcwF
	ZaQ0/hBjfOQmnQlrqoDdPZX636q2ZIH3EDXf4l4XkJ02p9YrPB51GU+kD3EVqH3RQPHgvJuk5ZU
	s5lSs1F0A2+qLv3lp4x3pDsvQaDNjlIzQGeEJ57iOcLW+V8a9YaHptIotVnePw94FJD7a+RXZvb
	i2U6Xqet6gnx8pNc1657CyU/vhU+d1jggc1gFH/lU4A9z+NmJZzWu0mf1ZhavePzcT75KniGlxu
	oSe929YwN3fn6HsuDFCzCz5allB0tiwmQyN1Dlpww6m4/DeBGG2RZqDwvxtgS7gPS/X/ZiDGoq3
	TsHMht2wo+8K3W2YiSjadCbYUA6WJ+xK7BRNVWswL0Pe8w7Zm2151qXYQb+1T0G43Md+Q2/7woa
	J9PQFJPceuuWWg8QPSQiQ7KOmM2YSdLXNCzXwVDfEKl3+gVL4Frl3W65plP2EgH2rTUSNn512cK
	F2Yh/TxfRAjRIKpeEjfwQi7psnydmktR/RlcRRgFFxCplpY/P+YYF9iW0s=
X-Received: by 2002:a17:907:1b24:b0:c25:f7dc:2d0 with SMTP id a640c23a62f3a-c29f542e4f5mr1108697466b.17.1789938194345;
        Sun, 20 Sep 2026 14:03:14 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d817bdsm3037864a12.6.2026.09.20.14.03.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:03:13 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c294ad260fdso373526666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:03:13 -0700 (PDT)
X-Received: by 2002:a17:907:9726:b0:c29:42ad:acd0 with SMTP id
 a640c23a62f3a-c29f54ef9cbmr1050723366b.30.1789938193073; Sun, 20 Sep 2026
 14:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2026 14:02:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3sztsYqD5GHPXt-Oi2i6W1GtLJRASc9VJ7FJ51vXFJg@mail.gmail.com>
X-Gm-Features: AcwNN1V-HF9gw1Vu66s4g0Odqlp2yo6v_E6wzWUwDiUSRqQK4V18yWZQ5NBA-AU
Message-ID: <CAHk-=wh3sztsYqD5GHPXt-Oi2i6W1GtLJRASc9VJ7FJ51vXFJg@mail.gmail.com>
Subject: Linux 7.3-rc4
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We all know the drill by now: "it's big, yadda yadda".

What I do find a bit interesting is that filesystems continue to be
quite a noticeable part of the whole "it's bigger than usual". This
time around it's smb and ntfs, so it's not like it's one particular
filesystem, it's just been that filesystems in general seem to have
been getting more attention recently.

Of course, driver changes are still the biggest part, but not as
dominatingly as they sometimes are. The patch overall seems to be
about a third drivers, a third filesystems and networking, and a third
"misc" (architecture fixes and tooling).

But it's mostly pretty small patches. I think the biggest single patch
in here is a removal of a file that was moved from lib/ to mm/ during
the merge window, but for some reason the the old copy stayed around
and got this belated removal patch.

You can see the shortlog below for details, but nothing strikes me as
_particularly_ interesting. There's a lot of error path cleanup stuff,
which various LLM's seem to be pretty good at catching, but that
typically isn't going to be all that noticeable in normal use. But
hey, if any of the issues hit *you*, you are going to care.

             Linus

---

Aamir Ahmed (1):
      Bluetooth: eir: validate service data length before reading UUID

Abdurrahman Hussain (1):
      gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found

Ackerley Tng (1):
      mm/folio: EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio)

Ahmed Naseef (1):
      net: phy: mediatek: do not report link and per-speed LED rules togeth=
er

Ai Chao (1):
      ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook B3-420

Alberto Carboneri (1):
      scsi: core: Validate MODE SENSE lengths in scsi_cdl_enable()

Aleksandr Nogikh (1):
      xfrm: add missing RCU read lock in xfrm_send_migrate_state()

Alex Bereza (2):
      dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
      dmaengine: xilinx_dma: Fix hardware buffer descriptor chain
after cyclic DMA

Alexander Chesnokov (1):
      dmaengine: ti: k3-udma-glue: fix NULL dereference in
k3_udma_glue_release_rx_chn()

Alexei Turtanov (1):
      Input: atkbd - skip deactivate for Xiaomi Redmi Book Pro 16 2026

Alexey Klimov (1):
      soc: samsung: exynos-pmu: fix use-after-free of interrupt generator n=
ode

Ali Ahmet Memis (1):
      wifi: wilc1000: fix out-of-bounds read in P2P public action frames

Alvin =C5=A0ipraga (4):
      Input: adp5588-keys - cache GPIO state before registering the gpiochi=
p
      ASoC: adau1977: make the Kconfig symbols user selectable
      ASoC: adau1977-spi: drop __maybe_unused and of_match_ptr()
      ASoC: adau1977-i2c: add OF match table for I2C

Amit Machhiwal (2):
      KVM: PPC: Book3S HV: fix use-after-free in kvmhv_emulate_tlbie_all_lp=
id()
      KVM: PPC: Book3S HV: fix secure device page leak on uv_page_in() fail=
ure

Anand Jain (1):
      btrfs: derive f_fsid with dev_t only when temp_fsid is active

Andrea Mayer (1):
      seg6: set IPSKB_L3SLAVE from IP6SKB_L3SLAVE on IPIP decapsulation

Andrea Righi (1):
      sched/core: Avoid false migration warning for proxy donors

Andrew Morton (1):
      remove old lib/alloc_tag.c

Aneesh Kumar K.V (Arm) (1):
      x86/mm: Don't force unencrypted DMA for IOMMU-backed devices

AngeloGioacchino Del Regno (2):
      phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
      phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting

Aohan Mei (1):
      rds: ib: use rds_conn_drop() on protocol version mismatch

April Cardenas (1):
      smb/client: send lease break ACKs thru correct session for
multiuser mounts

Arun Easi (1):
      scsi: fnic: Fix missed link-up when critical IRQ targets offline CPU

Asai Neko (1):
      ALSA: usb-audio: skip the broken mute control on AVerMedia GC553Pro

Baineng Shou (1):
      dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()

Bard Liao (1):
      soundwire: cadence_master: wait and cancel cdns->work before clock st=
op

Bart Van Assche (1):
      RDMA/srp: Fix srp_remove_target()

Bartosz Golaszewski (3):
      power: sequencing: don't call .post_enable() if
pwrseq_unit_enable() failed
      power: sequencing: fix NULL-pointer dereference in pwrseq_unit_new()
      power: sequencing: fix NULL-pointer dereference in
pwrseq_device_register()

Biju Das (1):
      power: sequencing: Fix build issue with COMPILE_TEST

Bogdan Nicolae (1):
      wifi: brcmfmac: cyw: pass PMKID to firmware if present

Bradley Morgan (1):
      arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc

Breno Leitao (1):
      arm64: hibernate: clone only the linear map that exists at runtime

Caleb James DeLisle (1):
      MIPS: config: Add EcoNet EN751221 defconfig

Carolina Jubran (1):
      IB/IPoIB: Avoid restoring OPER_UP after multicast flush

Catalin Marinas (1):
      arm64: mte: Fix PTRACE_{PEEK,POKE}MTETAGS error documentation

Cen Zhang (1):
      KEYS: encrypted: fix integer overflow of datablob_len

Cen Zhang (Microsoft Security FORGE Labs) (1):
      xfrm: hold net_device reference under RCU in bundle creation

Chandrashekar Devegowda (1):
      Bluetooth: btintel_pcie: validate TX skb length in send_sync

Chang S. Bae (2):
      x86/microcode/intel: Reject problematic loading on Granite Rapids sys=
tems
      x86/build/64: Prevent native builds from generating EGPR use

Cheng Xu (1):
      RDMA/erdma: Use IRQ-safe XArray helpers for QP and CQ tables

Chengfeng Ye (2):
      xfrm: serialize state GC with device state flush
      Bluetooth: hci_sync: Serialize local codec list cleanup

Chengjun Yao (1):
      drm/amdgpu: fix rmmio iounmap skipped on device removal

Chris Lu (2):
      Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
      Bluetooth: btmtksdio, btmtkuart: validate WMT event length
before struct access

Chris Sommers (1):
      Input: i8042 - add quirk for Acer Aspire Go 15 AG15-42P

Christian G=C3=B6ttsche (1):
      selinux: always fill AVC decision in avc_has_perm_noaudit()

Christian K=C3=B6nig (1):
      dma-buf/dma-fence: fix checking signaling bit for timeline and
driver name v3

Christian Lugnberg (2):
      dmaengine: sun6i: fix non-atomic read of DMA position registers
      dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

Christopher Obbard (1):
      mailmap: update entry for Christopher Obbard

Chunfeng Song (1):
      rust: net: phy: fix off-by-one bit positions in device status accesso=
rs

Claudiu Beznea (1):
      phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic context

Coiby Xu (1):
      mailmap: map Coiby Xu's address

Cong Nguyen (1):
      hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handle=
r

Daehyeon Ko (1):
      wifi: libipw: reject TKIP frames without a full MIC

Daniel Golle (1):
      net: dsa: mxl862xx: disable the stats poll on teardown

Daniel J Blueman (1):
      net: qrtr: resend HELLO on MHI resume

Daniel Linjama (1):
      btrfs: handle lack of space when cleaning up verity items

Daniel Zahka (2):
      net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_sk=
b()
      selftests: drv-net: psp: test PSP and TCP ULP mutual exclusion

David Francis (2):
      drm/amdkfd: Avoid integer underflow with ffs in EOP ring size calc
      drm/amdkfd: Avoid integer underflow in EOP ring size calculation.

David Howells (1):
      9p: Fix v9fs_issue_write() to update i_size and remote_i_size

David Hu (2):
      dma-buf: Fix silent overflow for phys vec to sgt
      dma-buf: Split sgl by largest page-aligned chunk

David Laight (1):
      x86/div64: Fix addition of large constants in mul_u64_add_u64_div_u64=
()

Devin Wittmayer (1):
      wifi: mac80211: refuse to make a monitor active when it has no queue

Dinh Nguyen (1):
      arm64: dts: socfpga: change access permission from 755 to 644

Diogo Ivo (Schneider Electric) (4):
      mmc: sdhci_am654: Move tuning_loop to local variable
      mmc: sdhci_am654: Reset command and data lines on failed tuning
      mmc: sdhci_am654: Clear ITAPDLY on tuning failure
      mmc: sdhci_am654: Fallback to DT-provided itap delay on DDR50
tuning failure

Dmitriy Chumachenko (1):
      drm/amdgpu: check ras and obj before dereference

Dmitriy Okunev (1):
      net: mvpp2: prevent buffer overflow in page_pool allocation

Dmitry Baryshkov (2):
      drm/msm: mark the fbdev framebuffer as system memory
      drm/msm/dsi: round the byte clock rate after reparenting to the PHY P=
LL

Dmitry Torokhov (3):
      Input: rmi_smbus - fix out-of-bounds read in rmi_smb_write_block()
      Input: synaptics-rmi4 - fix GPF in suspend and resume when unbound
      Input: document that no new LED codes should be added

Dong Chenchen (1):
      ipv4: icmp: reject RTN_UNREACHABLE input routes in icmp_route_lookup

Donggeun Yoo (3):
      dma-coherent: report a failed reserved memory assignment
      swiotlb: use the adjusted address for the highmem page lookup
      dma-mapping: don't trace the DMA address when the allocation fails

Doruk Tan Ozturk (1):
      wifi: mwifiex: bound the pairwise-cipher OUI walk to the IE length

Eric Dumazet (10):
      xfrm: add missing rcu_read_lock(), skb_dst_force() and
dev_hold() for xfrm_trans_reinject()
      tcp: do not let tcp_rmem be set below 4096
      pppoatm: ensure a writable skb header and linear data
      drop_monitor: synchronize tracepoint unregistration on error path
      drop_monitor: use timer_shutdown_sync() to prevent timer
rearming during teardown
      drop_monitor: use raw_cpu_ptr() in tracepoint probes
      drop_monitor: fix out-of-bounds write in reset_per_cpu_data()
      netlink: do not free nlk->groups while lockless readers can use it
      net: lock the socket in sock_gettstamp()
      net: skbuff: do not leave stale header offsets after pskb_carve()

Erich Sartison (1):
      Input: xpad - add support for Victrix Pro BFG Controller

Fan Wu (5):
      mmc: core: Cancel SDIO IRQ work before freeing host
      mmc: mmci: Fix use-after-free in busy-timeout work
      mmc: mxcmmc: cancel data work and watchdog on remove
      mmc: hsq: Fix use-after-free in retry work
      wifi: wcn36xx: Fix potential use-after-free in TX ack timer teardown

Farhad Alemi (1):
      net: remove WARN_ON_ONCE() from the dev_fill_forward_path() loop chec=
k

Felix Gu (1):
      mmc: sdio_uart: fix xmit_fifo leak when the port table is full

Fernando Fernandez Mancera (1):
      netfilter: nf_tables: fix device name and prefix match in hook lookup

Filipe Manana (5):
      btrfs: tree-checker: print dev extent offset in error message
      btrfs: tree-checker: fix error message regarding free space extent it=
ems
      btrfs: fix creation of compressed inline extents that don't save spac=
e
      btrfs: abort transaction on failure to update inode for hole
punching and reflinking
      btrfs: check if there is space for chunk item when validating
sys chunk array

Florian Maillard (1):
      mmc: rtsx_pci_sdmmc: ignore broken write-protect on ThinkPad X260

Francis Marlou Pacaro (1):
      drm/amd/display: fix MALL hysteresis timer underflow at high refresh =
rates

Frank Sorenson (9):
      smb: client: fix next_buffer UAF and NextCommand bounds in compound P=
DUs
      smb: client: validate minimum PDU size before smb2_get_data_area_len(=
)
      smb: client: fix server->total_read for compound encrypted PDUs
      smb: client: fix missing lower-bound check on DFS referral string off=
sets
      smb: client: reject short Next offsets in parse_server_interfaces()
      smb: client: fix OOB struct field reads in move_smb2_ea_to_cifs()
      smb: client: fix missing iov bounds check in parse_posix_sids()
      smb: client: fix potential OOB read in smb3_enum_snapshots()
      smb: client: fix reparse buffer bounds in cifs_query_reparse_point()

Frieder Schrempf (1):
      spi: fsl-qspi: Reprogram the clock rate when the operation
frequency changes

Gabor Juhos (1):
      spi: spi-qpic-snand: avoid writing QPIC_EBI2_ECC_BUF_CFG register

Gang Yan (1):
      RDMA/rxe: Fix integer overflow in mr_check_range() leading to OOB acc=
ess

George Emmanuel Thomas (1):
      drm/msm: remove stale perf counter XML TODO

Gris Ge (1):
      net: ip_tunnel: initialize `options_len` before referencing options

Guanghui Yang (1):
      btrfs: clear free space tree creation state on rebuild failure

Guanglei Zhu (3):
      net: wwan: mhi_wwan_mbim: guard against a cyclic NDP chain
      net: wwan: mhi_wwan_mbim: check skb_copy_bits() return value
      net: wwan: t7xx: validate the netif index in t7xx_ccmni_recv_skb()

Guangshuo Li (5):
      drm/msm/adreno: fix autosuspend cleanup during teardown
      hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
      hwmon: (w83793) release probe data through kref
      drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
      i2c: imx: disable autosuspend on remove

Guoqing Jiang (1):
      RDMA/siw: Clear association under lock if siw_qp_modify fails in
siw_accept

Hans de Goede (2):
      Input: soc_button_array - fix MS Surface Pro 11 probe failure
      Input: soc_button_array - check btns_desc->package.count

Hao-Qun Huang (1):
      spi: virtio: Use the per-transfer bits per word

Hemanth Selam (1):
      firmware: arm_scmi: Fix typo "upto" in comment

Henry Martin (1):
      xfrm: iptfs: fix runt reassembly panic from short inner tot_len

Hohyun Sim (1):
      net: fddi: skfp: fix NULL deref when setting the MAC address while do=
wn

Hongling Zeng (1):
      btrfs: take commit root semaphore when iterating in
mark_block_group_to_copy()

Huacai Chen (1):
      drm/loongson: Create blend mode property for cursor plane

HyeongJun An (1):
      ASoC: hdmi-codec: Report a change when the channel status moves

Hyunwoo Kim (1):
      exec: Cleanup POSIX timers right after de_thread()

Ian Luites (1):
      soundwire: dmi-quirks: Disable ghost Realtek on Asus GX651AX

Ibrahim Abdelkader (1):
      Bluetooth: hci_qca: Do not write to the serial port after it is close=
d

Icenowy Zheng (3):
      drm/verisilicon: set blend mode for the cursor plane
      drm/verisilicon: add primary modifier for format tables
      drm/verisilicon: remove ARGB formats from primary plane

Ilia Levi (5):
      drm/xe/mmio_gem: forbid VMA split
      drm/xe/mmio_gem: use write-back mapping for dummy page
      drm/xe/mmio_gem: simplify fault handler loop
      drm/xe/mmio_gem: cache the dummy page per object
      drm/xe/mmio_gem: fix destroy flow

Inbal Schussheim (2):
      tcp: exclude old ACKs from tcp fast path
      selftests: net: packetdrill: test exclusion of old ACK from TCP fast =
path

Itai Handler (1):
      spi: spi-zynqmp-gqspi: stop the controller on shutdown

Ivan Pustogarov (1):
      wifi: mac80211: avoid out-of-bounds read for empty PREQ elements

Iv=C3=A1n Ezequiel Rodriguez (2):
      Input: evdev - zero absinfo before partial copy in EVIOCSABS
      Input: zero ff_effect before compat copy in input_ff_effect_from_user

Jack Yu (1):
      ASoC: rt712-sdca: reconfigure PLL2 to fix calibration time-out

Jacob Moroni (1):
      RDMA/irdma: Enforce local fence for IB_WR_REG_MR

Jaeho Cho (1):
      ALSA: hda/realtek: Enable mute LEDs on HP OmniBook 7 17-dc0xxx

Jakub Kicinski (2):
      eth: fbnic: ring the doorbell if a burst ends in a drop
      dpll: reject a reference sync pin which is not on the pin's dpll

Jamal Hadi Salim (4):
      net/sched: hhf: cap hh_flows_limit at change time
      selftests/tc-testing: add hhf hh_limit cap tests
      net/sched: codel: bound the dropping loop per dequeue call
      selftests/tc-testing: add codel/fq_codel interval boundary cases

James Clark (1):
      net: macb: fix ordering around PTP timestamp read

James Seo (1):
      hwmon: (hp-wmi-sensors) Improve raw WMI string handling

Jarkko Sakkinen (1):
      KEYS: trusted: Fix tpm2_load_cmd() boundary check

Jeff Layton (1):
      nfsd: fix handling of NFSEXP_PNFS in the netlink codepath

Jeffin Philip (1):
      RDMA/core: fix refcount bug in iwpm_get_nlmsg_request()

Jeremy Nyberg (1):
      Input: xpad - fix PDP Marvel Xbox 360 controller

Jesse Casco (1):
      drm/msm/dp: skip PUSH_IDLE when the link was never enabled

Jiangshan Yi (3):
      wifi: libertas_tf: fix UAF in lbtf_free_adapter()
      wifi: brcmsmac: fix UAF in brcms_free_timer()
      ASoC: codecs: rt712-sdca-dmic: fix uninitialized stream_config->type

Jiayuan Chen (1):
      mm/shrinker: fix bogus set_shrinker_bit() with cgroup.memory=3Dnokmem

Jinke Han (1):
      x86/kprobes: Fix crash when probing CS CALL instructions

Joel Granados (1):
      sysctl: Fix type truncation in sysctl_msec_to_jiffies

Johannes Berg (34):
      .get_maintainer.ignore: add myself
      wifi: cfg80211: don't get the radio mask for netdev-less wdevs
      wifi: cfg80211: check IP header size in cfg80211_classify8021d()
      wifi: cfg80211: don't free driver-owned scan requests
      wifi: cfg80211: only group hidden BSSes with beacon entries
      wifi: cfg80211: don't filter by BSS type when removing stale entries
      wifi: cfg80211: ibss: ref BSS entry for joined event
      wifi: cfg80211: fix NAN regulatory enforcement
      wifi: cfg80211: reduce RTNL holding in regulatory enforcement
      wifi: mac80211: don't apply peer rates to off-channel frames
      wifi: mac80211: don't drop scan probe requests for lack of peer rates
      wifi: mac80211: don't start a ROC while scanning
      wifi: mac80211: don't warn when an IBSS has no channel to scan
      wifi: mac80211: don't offload TC setup on AP_VLAN interfaces
      wifi: mac80211: suppress chanctx warning for debugfs reset
      wifi: mac80211: abort chanswitch when leaving a mesh
      wifi: mac80211: reset state when starting AP fails
      wifi: mac80211: reset the LED state when ifup fails
      wifi: mac80211: only operate on TDLS peers in the TDLS code
      wifi: cfg80211: restore netns_immutable on failures
      wifi: cfg80211: undo netns switch if renaming the wiphy fails
      wifi: mac80211: unlist vifs when their netdev is unregistered
      wifi: cfg80211: get the wiphy out of a dying network namespace
      wifi: mac80211_hwsim: don't hand frames to mac80211 while stopping
      wifi: mac80211: don't allow injecting frames wider than the chanctx
      wifi: mac80211: reset the AP_VLAN tailroom counter on ifdown
      wifi: mac80211: require a peer station for TDLS setup confirm
      wifi: mac80211: don't allow link changes when iface is down
      wifi: mac80211: don't RCU-dereference the mesh CSA settings we just s=
et
      wifi: mac80211: don't access the TSF of a down interface
      wifi: mac80211: add HE 6 GHz capability in the scan elems len
      wifi: mac80211: mesh: reset the CSA state when leaving
      wifi: mac80211: mesh: release the channel if start fails
      wifi: mac80211: set up the TX info early to fix failure paths

Johannes Thumshirn (1):
      btrfs: zoned: handle RAID profiles in btrfs_can_activate_zone()

Jonghyuk Kim(MalHyuk) (1):
      drm/msm: RCU-free the scheduler-containing ring and VM objects

Joseph Qi (1):
      smb: client: fix use-after-free of iface in cifs_try_adding_channels(=
)

Juan Perdomo (1):
      Bluetooth: RFCOMM: avoid socket lock inversion in listener cleanup

Julian Braha (1):
      mips: econet: fix unmet dependencies for ECONET

J=C3=A9r=C3=A9my Jean (2):
      RDMA/siw: Bound fragmented header copies by the remaining length
      smb: client: validate absolute native symlink targets before NT fixup=
s

Karl Mehltretter (11):
      scsi: pm80xx: Fix the use_msix, use_tasklet and read_wwn
parameter descriptions
      scsi: qla2xxx: Fix the ql2xfc2target parameter description
      drm/msm: Fix the separate_gpu_kms parameter description
      drm/msm/adreno: Fix the skip_gpu parameter description
      dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels
      keys: fix lost wakeup when reaping a dead key type
      Input: trackpoint - fix the inertia attribute name in the ABI documen=
t
      drm/vc4: Use managed KMS polling to fix UAF on unbind
      wifi: brcmfmac: fix lost 802.1x TX completion wakeup
      selinux: preserve user SID across nested backing files
      selinux: recheck intermediate backing files on mprotect()

Kevin Wang (1):
      drm/amd/pm: report energy accumulator for smu 14.0.3

Kitty Makin (1):
      ALSA: usb-audio: Add capture quirk for Behringer FCA1616

Koichiro Den (1):
      arm64: dts: renesas: r8a779f0: Set UFS lane count

Krish Gulati (1):
      ALSA: hda/realtek: Add quirk for HP Victus 15-fa1xxx (MB 8BB1) mute L=
ED

Krystian Kaniewski (1):
      RDMA/core: Reject unregistering netdevs in ib_get_eth_speed

Krzysztof Kozlowski (2):
      wifi: ath12k: ahb: Revert undocumented ABI and dead code
      dt-bindings: display/msm: Use consistent indentation in the example

Kuniyuki Iwashima (9):
      neighbour: Add missing RCU annotation for neightbl_dump_info().
      neighbour: Enforce min/max to NDTPA_INTERVAL_PROBE_TIME_MS.
      neighbour: Don't render blackhole_netdev via RTM_GETNEIGHTBL.
      neighbour: Skip default parms when resumed in neightbl_dump_info().
      sysctl: Check range in  proc_dointvec_ms_jiffies_minmax
      sysctl: Check range in do_proc_ulong_conv_ms_jiffies
      tcp: Don't call skb_clone_and_charge_r() for close()d listener
in tcp_v6_do_rcv().
      af_unix: Unify scc_index when finalising SCC in __unix_walk_scc().
      selftest: af_unix: Add test case with mixed lowpoint in scm_rights.c.

Kyle Zeng (1):
      xfrm: fix compat ALLOCSPI request use-after-free

Lachlan Hodges (1):
      wifi: mac80211: include TIM bitmap control for buffered S1G mcast tra=
ffic

Laxman Acharya Padhya (1):
      Bluetooth: hci_codec: validate vendor codec count length

Leo Li (1):
      drm/amd/display: Atomize IRQ register read/modify/write ops

Leon Romanovsky (2):
      RDMA/efa: Keep admin queues alive while IRQ is registered
      RDMA/efa: Keep EQ resources alive while IRQ is registered

Li Jun (2):
      watchdog: da9062: fix suspend/resume handling of HW_RUNNING watchdog
      watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog

Li RongQing (2):
      RDMA/uverbs: Fix potential leak of resources->collection in
flow_resources_alloc()
      RDMA/mad: Fix receive buffer leak when PKey enforcement fails

Linkai Gong (3):
      Input: cyttsp5 - clamp the HID report size before memcpy
      RDMA/bnxt_re: check create_singlethread_workqueue() in DCB setup
      i2c: atr: fix dangling adapter pointer on add failure

Linmao Li (1):
      wifi: mwifiex: prevent authentication frame length truncation

Linus Torvalds (1):
      Linux 7.3-rc4

Linus Walleij (1):
      net: ethernet: cortina: Ack RX overrun interrupt correctly

Liu Zhenlong (1):
      i2c: qcom-cci: fix device_node refcount leak in cci_probe()/cci_remov=
e()

Lorenzo Bianconi (4):
      net: stmmac: fix TSO header length truncation
      net: stmmac: do not overwrite phc_index when no PTP clock is register=
ed
      net: stmmac: propagate FPE preemption-class mapping errors
      net: stmmac: preserve real_num_tx_queues on mqprio setup failure

Lorenzo Stoakes (ARM) (6):
      mm/huge_memory: bypass THP tuneables for huge pfnmap mappings
      mm/mremap: account mm->locked_vm correctly for MREMAP_DONTUNMAP
      mm/vma: correctly unaccount on mmap_prepare() failure
      x86/mm/pat: Acquire init_mm write lock on collapse to avoid UAF
      x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid U=
AF
      x86/mm/pat: Allocate split page tables as kernel page tables

Luca Coelho (1):
      drm/i915/display: check configuration index before shifting

Lucas Tanure (5):
      arm64: dts: amlogic: t7: use the real UART pclk
      arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power c=
ycled
      arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
      arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
      arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

Luiz Augusto von Dentz (2):
      Bluetooth: ISO: Fix parent socket leak in iso_conn_ready()
      Bluetooth: ISO: set BT_LISTEN before requesting a BIG sync

Lyude Paul (4):
      Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
      drm/nouveau/gsp/r570: Set GcOff =3D 0 in fbsr
      drm/nouveau/gsp/r570: Enable S/R Display workaround in GSP
      drm/nouveau/gsp: Increase delay for magic sleep in r535_gsp_fini()

Maher Azzouzi (1):
      esp: downgrade zerocopy managed frags before mutating skb frags

Maoyi Xie (1):
      keys: translate request_key_auth pid for the reading procfs instance

Mariano Baragiola (1):
      wifi: virt_wifi: free skb when disconnected

Mario Limonciello (2):
      drm/amdgpu: Fix GPU PCIe link capability reporting
      drm/amdgpu: Skip KFD mapping clear before initialization

Mark Amirkan (4):
      net: lan743x: fix RX checksum use-after-free
      net/packet: clear RX owner on VNET header error
      mptcp: return sk_wait_data() errors from recvmsg()
      net/packet: avoid truncating TPACKET_V3 private size

Mark Rutland (3):
      arm64: percpu: Fix this_cpu_write() casting
      arm64: percpu: Fix this_cpu_and() mask generation
      arm64: percpu: Fix LSE operations on {8,16}-bit types

Matthew Schwartz (2):
      x86/fred: Reconstruct the #GP context for rejected INT instructions
      selftests/x86: Check signal state for rejected software interrupts

Meijing Zhao (1):
      mm: memblock: show all region flags in debugfs

Michael Bommarito (1):
      RDMA/rxe: insert mcg into mcg_tree only after rxe_mcast_add() succeed=
s

Michail Tatas (1):
      gpiolib: Put fwnode reference on failure

Michal Koutn=C3=BD (1):
      cgroup: Avoid iteration of dying tasks with zero refcount

Mike Lothian (1):
      drm/amdgpu: hold a runtime PM reference for P2P dma-buf attachments

Mike Rapoport (Microsoft) (1):
      MAINTAINERS: update memblock tree URLs

Muhammad Bilal (1):
      hwmon: (hp-wmi-sensors) Fix use-after-free in fungible_show()

Myeonghun Pak (1):
      mmc: sdhci-of-aspeed: Remove children before releasing SDC resources

Namjae Jeon (11):
      ntfs: use dynamic MFT tail reservation
      ntfs: repack $MFT/$ATTRIBUTE LIST
      ntfs: account for MFT records added during allocation
      ntfs: protect runlist updates with the runlist lock
      ntfs: propagate folio errors
      ntfs: ignore interrupted inode reads as corruption
      ntfs: discard inodes that fail initialization
      ntfs: unhash failed inode reads
      ksmbd: follow SMB2 session expiration semantics
      ksmbd: fix partial normalized name responses
      ksmbd: keep compound responses on query info errors

Neil Armstrong (2):
      drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
      drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs

Nemesa Garg (1):
      Revert "drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable"

Nguyen Ngoc Thang (2):
      ALSA: pcm: set timer->private_data before registering the PCM timer
      ALSA: usb-audio: fix list_add double-add in push_back_to_ready_list

Nhat Pham (1):
      mm, swap: fix SWAP_USAGE_OFFLIST_BIT collision with real usage count

Nicolai Buchwitz (1):
      net: bcmgenet: restore the hardware filters on open

Nicolas Escande (1):
      wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()

Nicolas Thibert (1):
      Bluetooth: btusb: fix NXP IW610 composite device handling

Niklas Cassel (2):
      ata: libahci: clear PxCLBU and PxFBU for AHCI_HFLAG_32BIT_ONLY
      ata: libata-scsi: fix ata_dsm_trim_pages() kernel-doc

Nikolay Aleksandrov (2):
      net: bridge: mst: move switchdev call outside rcu
      net: bridge: vlan: fix bugs caused by switchdev deletion errors

Norbert Szetei (1):
      RDMA/rxe: validate access flags before swapping the MR's PD

Nuno S=C3=A1 (1):
      hwmon: (pmbus/core) increase number of phases and add new mask

Oder Chiou (1):
      ASoC: rt721: Reset codec to fix abnormal sound

Or Har-Toov (2):
      RDMA/mlx5: Remove warn on missing representor in query_port_speed
      RDMA/uverbs: Fix mmap_lock/disassociation_lock circular dependency

Orgad Shaneh (1):
      MIPS: Octeon: apply USB FDT fixups also when USB is modular

Ovidiu Panait (5):
      arm64: dts: renesas: r9a09g057: Switch GBETH TX queue scheduling to W=
RR
      arm64: dts: renesas: r9a09g056: Switch GBETH TX queue scheduling to W=
RR
      arm64: dts: renesas: r9a09g047: Switch GBETH TX queue scheduling to W=
RR
      arm64: dts: renesas: r9a09g077: Switch GBETH TX queue scheduling to W=
RR
      arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to W=
RR

Pablo Neira Ayuso (2):
      netfilter: nf_nat: unregister and release hooks on error
      netfilter: flowtable: hold reference on ct until flow is released

Paolo Abeni (3):
      mptcp: avoid unneeded actions on subflow reset
      mptcp: close race between scheduler and state change
      mptcp: fix bad accounting in __mptcp_subflow_push_pending()

Paul Hollinsky (1):
      drm/msm/adreno: Only check for PAS when a zap shader is present

Paulo Alcantara (5):
      smb: client: cancel reconnect work in clean_demultiplex_info()
      smb: client: fix rlist race and missing initialization
      smb: client: fix smbd_connection leak on cifs_get_tcp_session() error
      smb: client: fix unaligned access in WSL reparse point parser
      smb: client: fix fattr leaking on wsl_to_fattr() failure

Pedro Falcato (1):
      x86/alternatives: Exclude text poking against change_page_attr()

Peng Hao (1):
      wifi: mwifiex: fix IRQ leak using wrong index in MSI-X error path

Pengpeng Hou (2):
      ARM: socfpga: select the PL310 erratum 753970 workaround
      wifi: mwifiex: validate scan response extents

Peter Zijlstra (1):
      futex: Also allocate private hash on vfork()

Qi Zheng (1):
      fs: fix missed removal of super_fs_objects_eligible()

Qu Wenruo (1):
      btrfs: add "/dev/root" exception for device path update

Quanye Yang (2):
      RDMA/rtrs-clt: Fix CQ pool leak when connect is interrupted
      RDMA/ucma: Serialize join and leave on copy_to_user failure

Raag Jadav (1):
      drm/xe/i2c: Disable IRQ on unbind

Radek Podgorny (2):
      Bluetooth: put the peer's on-air address on air when we cannot resolv=
e
      Bluetooth: keep dst_type with dst when reusing an LE connection

Rapha=C3=ABl Larocque (1):
      Input: synaptics - disable InterTouch on ThinkPad T440p (board id 272=
2)

Richard Fitzgerald (7):
      ASoC: wm_adsp: Firmware search progress log should not look like an e=
rror
      ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
      ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
      ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec p=
arams
      ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for captur=
e
      ASoC: sdw_utils: cs_amp: Delete bogus and incorrect capture channel f=
ixup
      ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length

Richard Zhu (1):
      PCI: imx6: Move clock enable after core reset assertion

Rik van Riel (1):
      wifi: mac80211: avoid WARN in set_bitrate_mask when sdata not in driv=
er

Rob Clark (2):
      drm/ci: Update xfails for kms_cursor_legacy regression
      drm/msm/a6xx+: Increase GMU FW init timeout

Rob Herring (Arm) (1):
      Input: tsc2007 - read "ti,poll-period" as u32

Roberts Kursitis (1):
      Input: xpad - add support for Azeron devices

Roman Vivchar (1):
      dt-bindings: input: mediatek,mt6779-keypad: add mt6572

Rong Zhang (1):
      hwmon: (k10temp) Fix model id range of Zen5 Turin

Rosen Penev (1):
      crypto: caam - map job ring registers without claiming region

Roshan Kumar (1):
      xfrm: iptfs: fix stack OOB read in iptfs_skb_reset_frag_walk()

Runyu Xiao (4):
      wifi: wlcore: release runtime PM ref on regdomain config failure
      mmc: sh_mmcif: initialize IRQ-thread mutex before requesting interrup=
t
      Input: hp_sdc - shut down kicker timer on module exit
      gpio: virtuser: skip free_irq when no IRQ is installed

Ruoyu Wang (1):
      dmaengine: sprd: Fix runtime PM reference leak in probe

Ryan Mehri (1):
      RDMA/rtrs: guard against null kobj name

Sai Teja Aluvala (1):
      Bluetooth: btintel_pcie: fix off-by-one bounds check in RX submit

Saim Shujah (1):
      drm/msm/dpu: clear pending peripheral flush state

Sajal Gupta (1):
      drm/gud: fix out-of-bounds write in gud_plane_atomic_check()

Sanman Pradhan (2):
      hwmon: (pmbus/tps53679) Fix TPS53676 phase page decoding
      hwmon: (pmbus/tps53679) Select page 0 for single-page TPS53676

Sascha Hauer (1):
      dmaengine: pxa: fix double counting of the hw descriptors

Sasha Levin (1):
      ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments

Seunguk Shin (1):
      fs/dax: check zero or empty entry before converting xarray entry

Shakeel Butt (2):
      memcg: avoid charging the root memcg from obj_cgroup_charge_pages()
      mm/mlock: use the IRQ-safe accessor for NR_MLOCK in __munlock_folio()

Shengzhuo Wei (5):
      wifi: p54: validate curve data length in the calibration curve conver=
ters
      wifi: p54: require a full exp_if record in PDR_INTERFACE_LIST
      i2c: at91: release DMA channels on remove and probe error
      i2c: imx: release DMA channels on probe error
      i2c: qcom-geni: release DMA channels on probe error

Shivank Garg (4):
      dmaengine: add dma_device_get() helper
      dmaengine: Fix device kref underflow in dma_chan_put()
      dmaengine: fix use-after-free in dma_chan_put() and dma_release_chann=
el()
      dmaengine: wait for RCU readers before releasing dma_device

Shivaprasad G Bhat (1):
      powerpc/iommu: Fix the overflow validation in iommu_tce_check_ioba

Shmulik Cohen (3):
      wifi: libipw: reject too-short beacon and probe responses
      wifi: libipw: reject too-short association responses
      wifi: ipw2x00: bound management frame length to the receive buffer

Shouping Wang (1):
      perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations

Shuangpeng Bai (1):
      IB/mlx4: Fix use-after-free on pkey sysfs registration failure

Shuhei Takeshita (2):
      IB/hfi1: Resolve the credit-return buffer through the send context's =
node
      IB/hfi1: Fix the PIO_CRED credit-return mmap

Shuicheng Lin (3):
      drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy
      drm/xe/shrinker: Return the freed page count through a parameter
      drm/xe/shrinker: Take a runtime PM ref before shrinking non-system me=
mory

Siwei Zhang (1):
      xfrm: use hlist_del_init_rcu for state_cache and state_cache_input

Slavin Liu (1):
      ALSA: hda: trace PCM open only after assigning a stream

Slawomir Stepien (4):
      wifi: cfg80211: verify if AP_VLAN belongs to the correct AP
      wifi: cfg80211: do not support direct add of station to AP_VLAN inter=
faces
      wifi: cfg80211: move link_id validation earlier in nl80211_new_statio=
n()
      wifi: cfg80211: check if AP has been started or joined a mesh
before adding new station

Soheil Hassas Yeganeh (1):
      x86/cfi: Fix FineIBT hash offset in cfi_get_func_hash()

Sophie D (1):
      drm/gud: Ignore damage clips in full update mode

Sriharsha Basavapatna (1):
      RDMA/bnxt_re: Avoid exposing umdbr to userspace

Srinivasan Shanmugam (1):
      drm/amd/display: Fix NULL dereference in dcn50/dcn60 init_hw

Stanislaw Gruszka (1):
      wifi: iwlegacy: fix broadcast stations deallocation

Sudeep Holla (1):
      firmware: arm_ffa: Tear down driver during shutdown

Takashi Iwai (2):
      ALSA: bcd2000: Fix race between rawmidi and disconnect
      ALSA: core: Fix potential UAF after asynchronous card release

Tao Cui (2):
      sched_ext: Pass the initial cpu.idle state in scx_cgroup_init_args
      sched_ext: Don't deliver duplicate ops.cgroup_set_idle() for same val=
ue

Tejun Heo (7):
      sched_ext: Rename sch to root_sch in dispatch_one()
      sched_ext: Use @prev's scheduler for the keep decisions in dispatch_o=
ne()
      sched_ext: scx_qmap: Do not add IMMED to rescue inserts
      sched_ext: scx_qmap: Place only on cids whose caps are in effect
      sched_ext: scx_qmap: Fix pending partition work handoff
      sched_ext: scx_qmap: Restore unused idle claims from ops.dispatch()
      sched_ext: Maintain an online cid mask in the scheduler arena

Thadeu Lima de Souza Cascardo (1):
      drm: Fix drm_pending_vblank_event leak in error path for out_fence_pt=
r

ThangNN99 (1):
      Bluetooth: hci_core: Fix queuing tx_work after workqueue is drained

Theodor Arsenij Larionov Trichkine (1):
      netfilter: nft_nat: fully initialise new_addr in netmap setup

Thomas Gleixner (2):
      signal: Prevent exec() race
      posix-cpu-timers: Prevent freeing a timer which is queued on the
expiry list

Thomas Huth (1):
      kselftest/arm64: Fix size of thread_data values for pthread_join()

Thomas Richard (congatec GmbH) (2):
      hwmon: (cgbc-hwmon) Fix current sensors ID lookup
      hwmon: (cgbc-hwmon) Add missing sensors

Th=C3=A9o Lebrun (1):
      mips: select CONFIG_WEAK_REORDERING_BEYOND_LLSC from CONFIG_EYEQ

Tianchu Chen (2):
      wifi: rsi: fix heap OOB write on key removal
      wifi: wilc1000: fix RX buffer OOB-write in wilc_wlan_handle_isr_ext()

Troy Mitchell (1):
      dmaengine: mmp_pdma: fix wrong extended DRCMR base for SpacemiT K3

Tvrtko Ursulin (1):
      drm/sched: Fix virtual runtime race

Tzung-Bi Shih (6):
      Bluetooth: btmtksdio: Fix PM runtime reference leak in shutdown
      watchdog: digicolor: Avoid division by zero
      watchdog: rtd119x: Avoid division by zero
      watchdog: rzv2h: Avoid division by zero
      watchdog: msc313e: Propagate error code in resume()
      watchdog: msc313e: Fix premature reset during timeout update

Ulises Mendez Martinez (1):
      objtool: Validate disassembler headers in libopcodes probe

Vadim Nikitushkin (2):
      drm/ttm: fix swapped-out resources never leaving their bulk_move rang=
e
      drm/ttm: apply the swapout bulk_move fix to the intended condition

Venkat Rao Bagalkote (1):
      scsi: ibmvfc: Add Kconfig dependency to fix link failure when NVME_FC=
=3Dm

Vernon Yang (1):
      x86/mm: Fix user-space data loss with MADV_FREE and THP

Vijendar Mukunda (4):
      ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
      ASoC: amd: acp: refactor codec config count in SOF SoundWire
machine driver
      ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
      ASoC: amd: acp: fix card name length warning in SOF SoundWire
machine driver

Vinay Belgaumkar (1):
      perf: Fix null pointer access in is_include_guest_event()

Vladimir Marioukhine (1):
      drm/amdkfd: implement restore_mqd callbacks for GFX12/12.1

Wanwu Li (1):
      sched_ext: Fix NULL sched deref in kfunc sub-sched error paths

Weiming Shi (2):
      RDMA/rxe: Restore HMM_PFN_WRITE check in ODP write paths
      Bluetooth: coredump: Quiesce dump work on unregister

Wenjie Qi (1):
      mm: filemap: retain mapped dropbehind folios

Wentao Liang (4):
      ata: libahci_platform: Fix device reference leak in
ahci_platform_get_resources()
      watchdog: sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()
      watchdog: starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start(=
)
      cifs: Fix server use-after-free in cifs_chan_skip_or_disable()

William Bright (1):
      drm/msm/dp: fix link bandwidth check when wide bus is enabled

Wyatt Feng (1):
      net: xfrm: reject unrepresentable espintcp transport headers

Xavier Goffin (1):
      ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15-ax

Xiang Mei (2):
      ALSA: usb-audio: Clamp implicit feedback packet count to URB capacity
      ALSA: 6fire: fix OOB write from device-reported iso length

Xixin Liu (5):
      firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
      firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
      clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
      clk: scpi: register scpi-cpufreq once and clear on failure
      clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq

Xu Rao (1):
      mmc: spi: reset bytes_xfered before retrying CRC failures

Xuanqiang Luo (2):
      net/sched: act_api: release tail references on DELACTION failure
      selftests: tc-testing: test action batch deletion failure cleanup

Yazen Ghannam (1):
      x86/amd_node: Fix PCI device reference counting in amd_smn_init()

Yehyeong Lee (2):
      IB/iser: reject a remote invalidation of an unregistered direction
      IB/isert: wait for deferred control PDU completions before
releasing the connection

Yibo Tan (1):
      hwmon: (pwm-fan) Stop RPM timer before freeing tach data

Yifei Gao (1):
      memstick: ms_block: destroy io_queue workqueue on removal

Yige Jiang (1):
      net: netsec: fix device_node reference leak on phy_np

Yuho Choi (1):
      ALSA: virtio: reset device before deleting virtqueues

Zhao Li (1):
      wifi: mwifiex: validate action frame fixed fields

Zhiling Zou (3):
      ipv6: xfrm: use full sockets in local error paths
      xfrm: save input state data before secpath resets
      openvswitch: avoid reallocating confirmed conntrack labels

Zhu Ling (1):
      mmc: core: Fix OF node reference leak on card add failure

Zhu Tianhao (1):
      ntfs: fix $MFTMirr write offset when it spans multiple folios

Zihan Xi (1):
      wifi: virt_wifi: don't transfer operstate before register

fangqiurong (1):
      sched_ext: Close the pre-enable ops error claim window

hpp.iscas (1):
      Input: eeti_ts - publish the OF module alias
