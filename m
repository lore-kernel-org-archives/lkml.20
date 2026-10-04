Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB2B4A6CD8
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147577; cv=none; b=ehV3UkJSeB25UOOxur77x1h4XKq0zBRCsxTwMgH6I1ibC/u23Cm1MtthdukNdDBIreGF8KudizDDUgRmn4YBriOzbOcz0tJwJkFlmo/BRWVJOUkeewl84p5EIBkt8STke1/6TFouobdCcWlbc+hBsmNZEAi7F9Kvh1LeRoqONo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147577; c=relaxed/simple;
	bh=rOuGuT39pRrugfjSDrdiopZW69mgBzQ2kQkBoz4mGkg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pOz40/pVZH8H9EwXZXun22us4IWEw+PmP+CHiPK96rf4Kf7qTez1fmJIK96z7ic01Cl5eqBoMacOdA7gwlUY6xjuoUqI9OW+6fVUv2Ok7nefl/oVGwHznP/2WIYLdhGV3/g0HApXeMNYKwOC6nkycJVS9mPjk4VZAr/QocmdxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eKdZVRQ3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eKdZVRQ3"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1933721a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791147571; x=1791752371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02PeYJqhpr/5a25r2Z69tKW9wYtIpTPDwXeKIz9Ab9Y=;
        b=eKdZVRQ3aIEGd1O1I9mep6KOyAbr1H73nUMD65OPZnjXV3o5tmWd0SFGgC7zFCWszT
         uzcuLBOwY5EOWiZqEVLq3dQ2X8X4ZSda600ndh/nesJxFpzy7YrN86aJ1PZzyl2HhCLd
         QV1hH9Hgy3kBUYqjn4n9Dpp24kKAz959mTgPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791147571; x=1791752371;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02PeYJqhpr/5a25r2Z69tKW9wYtIpTPDwXeKIz9Ab9Y=;
        b=QMbb0b+wM2BZ+mVrVldRrqp+iHeMbajiTBK3RQ2sfBez8JYKlYPAGmUoOdYvI1o5GX
         vq4ciAPurX0lK00NcWJ4avXKFyV5O1v7g5CHB2HVWQ6NRA11keNzE/xa3Q6H0FLBve6B
         DQxCxEAx/NsmKzwOB3diaaVSJoziVyXsvnrFsU/lQ6s+woyKOqiDp87CoteA0/t4QEKg
         vuuZQ2Y2FjOkW8uyT/3nvnjA5rmcRWbhUNU5HEVyDAaYYORC5KytiVM1uszY3nxyOwN/
         qDDVomjRjM0GIjo7G7iJc+VI8i3rVe8Bw21XUlLlXMJDCwVDp4E7ECZBTeVTvAyUaO0c
         DH9Q==
X-Gm-Message-State: AFq9FYL6DwWQbABQVCgUZU34FCtKJiEJle4mkikyb0Pxm3mX0tfZR/YP
	jIz3XrDE8Ti30VIC+ZO0VCHnFWtcON3c+eot37gft8J9bbBuSoIkR4h8qACfNDmqNYABWAhfapy
	FI2cVjNo=
X-Gm-Gg: AYBFou0nPr7+uJGTlMO0DMOdUaHO6iRC6ERcb+q55Zv3J1xM09m4vXJag4TPfJNoJMz
	b4tymi16i92+fZ5Dl7YyimujsPK24kL5ANcQVr8z344QEAEn2NfefdYtnGx2FyOOz7Hrr4LWGQc
	QK0mqduaKWGZ5s3BLyMY5okURz6zUmTkU6ZioF/NhHA9nkZEfU33y8kec4Enh1q83rRpdsdcuqX
	Glur+Ip1LFtTtMVxIil7i+ZoVugXfXnylknaOIq/6t6kWV8UCqezkHdM5pSIWnSbHzrCi2XQqpk
	n3ZB/oCxfE0YHO+0v/mMZj18wXHYi8U4lxjXyoTCqqY/m+/6MLKmYFWHIWiGDgTxFTJStd/hATp
	FItlrfvZQJ8f7pgeBo7ssqilqU5x+YEv1cRL12nMES3a52oInmLAVgU5PVUFmSnvXspwwDHJ8MU
	UM0G6EfGxTyHOVbB4auAznavsOUo5g/4eT3Kdzoc5mRIrgmyyFu15+jswAJ6VIZ4FwFXFQ7bAc+
	eBokL+Qy8mFo5PxZOH749L5tNCdrQM5O9yG16+43lsOLCQ/
X-Received: by 2002:a05:6402:50c9:b0:6ac:8dba:e36e with SMTP id 4fb4d7f45d1cf-6afada23aa9mr5013542a12.40.1791147571004;
        Sun, 04 Oct 2026 13:59:31 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01fdd47sm2502934a12.17.2026.10.04.13.59.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 13:59:30 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso1779523a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 13:59:30 -0700 (PDT)
X-Received: by 2002:a05:6402:28ce:b0:6ab:dc3:7ee1 with SMTP id
 4fb4d7f45d1cf-6afada22b23mr4392757a12.38.1791147569442; Sun, 04 Oct 2026
 13:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 Oct 2026 13:59:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYMaZik+wZYTE1bv7x5OUNsorG0WU16gFSZpX4TomMbQ@mail.gmail.com>
X-Gm-Features: AclHuK9bHKq1ZdeqoTAs8WkGFYU9HL4xEyG4rFgstWxBpBl1faz5GdNPzirbfAQ
Message-ID: <CAHk-=wgYMaZik+wZYTE1bv7x5OUNsorG0WU16gFSZpX4TomMbQ@mail.gmail.com>
Subject: Linux 7.3-rc6
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nothing looks strange this week - unlike last week's slightly unusual
diffstat, we're back to the normal "half the diff is driver fixes" so
we're back to normality. The driver side is all over: gpu, networking,
usb, tty, iio, sound... A little bit of everything, in other words.

The commit counts are also normal (for the new "AI normal" with a lot
of small error path handling fixes etc).

Aside from the driver side, the usual suspects show up: architecture
updates (mostly kvm-related again), core networking, some filesystem
work (mainly smb client this time), bpf... And a number of new
selftests too.

Next week might look a bit different: we've got the annual maintainer
summit and the Linux plumbers conference going on , so I'll be on the
road, as will a number of other maintainers. That may or may not end
up changing the stats for -rc7. But it's unlikely to affect the
release schedule, although the fact that I have my yearly family
vacation the week after that might make the next merge window a bit
wonky. We will see.

In the meantime, please keep testing.

            Linus

---

Aamir Ahmed (3):
      wifi: wfx: validate MIB read length before copying to caller
      rtc: ac100: Assign .num before accessing .hws
      rtc: ac100: Fix clock provider use-after-free on probe failure

Aaron Kling (1):
      ALSA: hda/tegra: Re-enable SDO workaround for Tegra194

Abdurrahman Hussain (7):
      of/overlay: put property on deadprops only after changeset add succee=
ds
      of/overlay: only treat a positive changeset id as registered
      of/overlay: don't leak fragment references when changeset init fails
      of/overlay: don't create "//" paths for fragments targeting the root
      i2c: xiic: preserve PEC byte length in SMBus block read setup
      i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
      i2c: xiic: don't clobber msg->len to signal block-read completion

Abel Vesa (1):
      serial: qcom-geni: Fix unbalanced runtime PM resume for no_console_su=
spend

Achilles Zhang (1):
      ALSA: usb-audio: Add native DSD quirk for HiBy FC4

Adrian Betschart (2):
      drm/amd/display: Default HDMI RGB output to limited range on CTA mode=
s
      drm/amd/display: Try RGB before YCbCr 4:4:4 in stream validation

Alan Stern (1):
      USB: gadget: dummy-hcd: Fix wait for outstanding request completions

Aldo Ariel Panzardo (1):
      HID: multitouch: stop the release timer from being rearmed on remove

Alex Deucher (3):
      drm/amdgpu/gmc12: properly pass flush_type to gmc_v12_0_flush_vm_hub(=
)
      drm/amdgpu: drop userq callback assignment for sdma 7.1
      drm/amdgpu/gmc12.1: properly pass flush_type to gmc_v12_1_flush_vm_hu=
b()

Alexei Starovoitov (6):
      bpf: Fix overflow of jump offset in constant blinding
      bpf: Fix packet range of pointers sharing an id
      selftests/bpf: Test packet range of pointers sharing an id
      bpf: Factor out __do_call_rcu_ttrace()
      bpf: Fix objects stuck in free_by_rcu_ttrace
      selftests/bpf: Add a test for objects stuck in free_by_rcu_ttrace

Alice Ryhl (2):
      rust_binder: cancel deferred work items in thread exit
      rust_binder: reschedule node refcount update on thread exit

Alireza Asgari (2):
      net: fix checksum offsets in skb_splice_from_iter()
      selftests: net: cover UDP splice checksum fragment alignment

Amit Sunil Dhamne (1):
      usb: typec: tcpm: recover after failure to start the frs ams

Andrea Mayer (1):
      seg6: ensure packet data is writable before modifying SRH and IPv6 DA

Andrea Parri (1):
      arm64: mm: Fix the break-before-make flush range for erratum 2645198

Andreas Kemnade (1):
      clk: ti: composite: resolve parent clocks by name again

Andrew Martin (1):
      drm/amdkfd: Fix always mapped range mapping to all ACCESS GPUs

Andrey Ryabinin (1):
      kasan: unpoison task stack below watermark only in generic mode

Anirudh Virdi (1):
      net/mlx5: Fix slab-out-of-bounds when handling team device events

Anthony Iliopoulos (1):
      arc: remove unused profile.h includes

Antoniu Miclaus (3):
      iio: adc: ade9000: request interrupts after powering the device
      iio: adc: ade9000: fix overlapping scan_index for current and
voltage channels
      iio: adc: ade9000: handle Phase C dip events in IRQ1 handler

Aohan Mei (1):
      netfilter: nft_flow_offload: drop flowtable reference on init error p=
ath

Arka Mondal (3):
      iio: imu: adis16480: fix unprotected debugfs reads
      iio: imu: adis16400: fix unprotected debugfs reads
      iio: gyro: adis16136: fix unprotected debugfs reads

Arnd Bergmann (6):
      ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
      serial: qcom-geni: avoid unused-function warning
      drbd: remove unused drbd_nl_mcgrps[] array
      nvme: work around -Wformat-security warning
      nvme: work around all -Wformat-security warnings
      alloc_tag: avoid implicit padding in uapi

Arthur Heymans (1):
      drm/amd/display: Preserve eDP mode on initial ASSR failure

Baha Mesleh (1):
      octeontx2-af: mcs: Fix SC resource cleanup loop

Baolin Wang (1):
      mm: shmem: ignore sysfs configs for shmem forced collapse

Bartosz Brom (1):
      ALSA: hda/realtek: Add mute LED quirks for HP Pavilion
15-eh3174nw and HP Laptop 15-dw1xxx

Bartosz Golaszewski (1):
      net: phy: aquantia: fix system interface type not updated in forced m=
ode

Bean Huo (1):
      nvme-pci: add NVME_QUIRK_DMAPOOL_ALIGN_512 for Micron 4100AT

Beata Michalska (2):
      arm64: errata: Factor out broken AMU const counter cap
      arm64: errata: Add Cortex-A725 erratum 3821522 workaround

Benjamin Tissoires (3):
      Revert "HID: logitech: add Bolt receiver support for Logitech
HID++ devices"
      HID: bpf: cast size to ssize_t when checking hid_bpf_hw_request
      selftest/hid: add test for negative return codes for hid_bpf_hw_reque=
st

Binbin Deng (1):
      net/mctp: publish the mctp_dev only after it is initialised

Carlo Szelinsky (1):
      USB: serial: option: add Quectel EG060W

Carlos Llamas (1):
      rust_binderfs: add transaction_report feature entry

Cen Zhang (Microsoft) (1):
      wifi: mac80211: fix slab-out-of-bounds read in
ieee80211_monitor_select_queue()

Cezary Rojewski (2):
      ASoC: codecs: rt286: Revert delay value for jack setup
      ASoC: codecs: rt274: Fix format setting for 44100 rate

Chandrashekar Devegowda (3):
      Bluetooth: btintel: fix buffer over-read in btintel_hw_error()
      Bluetooth: btintel_pcie: fix plen overflow in btintel_pcie_recv_frame=
()
      Bluetooth: btintel_pcie: reject oversized TX packets in send_frame()

Charles Keepax (1):
      ASoC: Intel: Add quirk to block match table for Lenovo Yoga Slim 7

Chengfeng Ye (7):
      Bluetooth: hci_conn: Lock parent access during enhanced SCO setup
      Bluetooth: hci_core: Serialize fragmented ISO packet queueing
      Bluetooth: hci_sync: Fix inquiry cache use-after-free
      Bluetooth: RFCOMM: Fix initial port reference race
      Bluetooth: Serialize SMP remote OOB data access
      Bluetooth: hci_core: Serialize ACL scheduling with channel deletion
      Bluetooth: hci_core: Serialize SCO and ISO scheduling with teardown

Chris Mason (1):
      futex: Fix private hash use-after-free on resize

Christian Melendez (1):
      MAINTAINERS: add missing entry for b53.rst

Cong Nguyen (2):
      iio: adc: max1363: sign-extend bipolar differential channel reads
      iio: proximity: pulsedlight: fix iio_device left registered on
PM setup failure

Daehyeon Ko (3):
      thunderbolt: Reject oversized XDomain properties responses
      nvme-multipath: fix underflow in ANA log bounds checks
      nvmet: pci-epf: reject too-short SGL segments

Daniel Ortiz (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP

Daniel Starke (1):
      tty: n_gsm: fix missing modem controls after DLCI open in
convergence layer type 2

David Heidelberg (1):
      Input: s6sy761 - fix resume ordering and restore sensing

David Hildenbrand (Arm) (3):
      MAINTAINERS: split up MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
      MAINTAINERS: move memory tiering under MEMORY MANAGEMENT - NUMA PLACE=
MENT
      MAINTAINERS: make Gregory a co-maintainer of MEMORY MANAGEMENT -
NUMA PLACEMENT

Dinh Nguyen (4):
      EDAC/altera: Do not allow driver unbinding
      EDAC/altera: Drop __init from ECC setup paths for re-probe safety
      EDAC/altera: Fix memory leak on dci allocation failure
      EDAC/altera: Fix use-after-free in error paths

Dirk Gouders (1):
      selftests: ublk: fix unused_result error

Donggeun Yoo (1):
      iio: proximity: vl53l0x-i2c: claim direct mode for raw reads

Eric Biggers (1):
      crypto: aes - Fix undesired override of some optimized AES modes

Eric Dumazet (4):
      MAINTAINERS: update Eric Dumazet's email address
      nvme-tcp: delay nvme_tcp_reclassify_socket()
      net: restrict SO_RESERVE_MEM to TCP sockets and cap max value
      ipv6: sr: use skb_get_hash_net() in seg6_make_flowlabel()

Even Xu (2):
      HID: Intel-thc-hid: Intel-quicki2c: Fix buffer overflow
      HID: Intel-thc-hid: Intel-quickspi: Fix buffer overflow

Fabrice Gasnier (2):
      iio: adc: stm32-adc: fix check on internal channel availability
      iio: adc: stm32-adc: fix possible division by zero in processed chann=
el

Fan Wu (9):
      iio: light: gp2ap020a00f: drain irq_work after free_irq
      iio: adc: xilinx-xadc: free IRQ before cancelling the unmask
worker on unbind
      iio: trigger: cancel reenable_work before freeing trigger
      usb: typec: ucsi: glink: fix use-after-free of ucsi on remove
      usb: cdns3: fix use-after-free in cdns3_gadget_exit()
      serial: 8250_bcm7271: fix use-after-free in brcmuart_remove()
      iio: adc: ad_sigma_delta: fix use-after-free on unbind
      usb: gadget: aspeed-vhub: cancel wake work on device removal
      tty: serial: max3100: shut down timer before freeing port

Fedor Pchelkin (1):
      thunderbolt: Fix NULL dereference in tb_remove_work()

Felix Fietkau (2):
      wifi: mac80211: prevent AP VLAN tx from other interfaces
      wifi: mac80211: set info->band for 802.3 encap offload frames

Felix Gu (2):
      iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
      iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration fail=
ure

Fernando Fernandez Mancera (1):
      netfilter: bpf: reject invalid NAT manipulation types

Florent Revest (Anthropic) (3):
      bpf: Wait for an RCU tasks grace period before freeing trampoline pro=
gs
      bpf: Skip detached progs in trampoline images that are still in use
      selftests/bpf: Detach a trampoline prog while a task sleeps before it

Florian Fainelli (2):
      net: systemport: Fix buffer overflow in bcm_sysport_get_stats()
      net: systemport: Fix RUNT MIB counter register offset calculation

Florian Westphal (1):
      netfilter: ipset: do not update comments from kernel-side adds

Francisco Beltr=C3=A1n Millal=C3=A9n (1):
      drm/amdgpu: reset VI ASIC on MacBookPro14,3

Frank Sorenson (1):
      smb: client: split cifsFileInfo bitfields to avoid shared-byte RMW ra=
ces

Fuad Tabba (4):
      KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
      KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
      KVM: arm64: Use the host's HCR_EL2 for non-protected VMs in pKVM
      KVM: arm64: selftests: Check a feature hidden in an ID register is UN=
DEF

Geert Uytterhoeven (1):
      iio: frequency: adf4377: Fully initialize clk_init_data and
clk_parent_data

Geetha sowjanya (1):
      octeontx2-pf: Fix aura BPID assignment when CONFIG_DCB is enabled

Georgios Karantzas (1):
      wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE

Greg Kroah-Hartman (1):
      Revert "usb: dwc3: gadget: fix IRQ storm on invalid event buffer coun=
t"

Guangshuo Li (5):
      wifi: iwlegacy: 3945: free EEPROM data on remove
      EDAC/versalnet: Drop remote processor handle refcount on driver remov=
al
      drm/amdgpu: fix IP instance memory leak on kobject add failure
      drm/amdgpu: fix ACP MFD device leak on init failure
      drm/mediatek: Fix ovl adaptor platform device leak

Guixin Liu (2):
      nvmet: copy the hostid into the ctrl before creating PR pc_refs
      nvme-multipath: set BLK_FEAT_ZONED only after the zone info is known

Han Xu (1):
      mtd: spinand: Enable QE on all dies

Hannu Varjoranta (1):
      gve: DQO: accept TSO packets with non-protocol gso_type bits

Hao Ge (1):
      module: fix lost error code from codetag_load_module()

Hao Zhang (1):
      blk-cgroup: save IRQ state in blkg_tryget_closest()

Haojie Li (1):
      drm/mediatek: Add missing IS_ERR check for ovl_adaptor platform devic=
e

Hari Mishal (1):
      drm/amd/display: guard dc_sink dereferences in MST mode validation

Harin Lee (1):
      ALSA: ctxfi: Fix silent playback on Titanium HD (SB1270)

Harrison Lucas (1):
      ALSA: hda/realtek: Fix mute and micmute LEDs on HP ENVY x360 15-ey0xx=
x

Harry Yoo (Meta) (1):
      mm/slab: do not wake up kswapd in __kfree_rcu_sheaf()

Harshit Mogalapalli (1):
      net: microchip: vcap: stop scanning after deleting key field

Hemanth Selam (1):
      random: vDSO: fix repeated word 'to' in comment

Hernan Ganzo (1):
      ALSA: hda/realtek: Limit internal mic boost on HP Pavilion 15 (103c:2=
164)

Heyang Tan (1):
      wifi: p54: validate firmware record lengths

Hongjian Dai (1):
      i2c: at91: release DMA channels when probe defers

Hui Peng (6):
      io_uring/bpf_filter: mark source as COW when cloning filters
      io_uring: only post the dummy skip CQE on CQE_MIXED rings
      io_uring: fix free entry check for 32b CQEs on CQE32 rings
      io_uring: zero big_cqe for aux CQEs on CQE32 rings
      usb: core: clear both ep_in and ep_out for non-ep0 control endpoints
      vt: selection: Fix unsigned underflow and slab-out-of-bounds
read in paste_selection()

Hui Su (1):
      iio: pressure: bmp280: fix out-of-bounds access in sampling
frequency lookup

HyeongJun An (1):
      ASoC: wm8903: Move the DRC QR threshold to the register that holds it

Ian Lin (2):
      USB: serial: option: add Compal EXM-G1x support
      USB: serial: option: add Compal EXC-T1 support

Ian Rogers (1):
      perf: Replace perf_event_header__init_id with full header init

Igor Paunovic (1):
      usb: typec: tcpm: fix use-after-free of the kthread worker on
port unregister

Ilkka Lappetel=C3=A4inen (1):
      net/packet: prevent TX_RING byte count overflow

Imre Kaloz (1):
      drm/radeon: Read the VRAM VBIOS signature with readb()

Jakub Gawlik (1):
      ALSA: hda/realtek: Add micmute LED quirk for Acer Swift SFG16-72

Jamal Hadi Salim (4):
      net/sched: cls_api: reclaim an empty proto on the error path
      net/sched: fq_codel: match the no-drop threshold to the packet size
      net/sched: sch_codel: match the no-drop threshold to the packet size
      net: cap skb->queue_mapping when the tx queue is picked

Jameson Thies (1):
      usb: typec: ucsi: displayport: Current CAM OOB index fixup

Janani Sunil (1):
      iio: adc: adi-axi-adc: Initialize state mutex

Jari Sepp=C3=A4l=C3=A4 (1):
      octeontx2-pf: Fix RSS indirection table size

Jason A. Donenfeld (1):
      virt: vmgenid: move to using dev_set/get_drvdata

Jasper Firth (1):
      ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8 with generic
DMI strings

Jean-Baptiste Maneyrol (1):
      iio: inv_sensors: fix estimated value larger than interrupt timestamp

Jeff Jo (2):
      tcp: refresh TS.Recent for accepted old ACKs
      selftests: net: check timestamp echo after an old ACK

Jens Axboe (1):
      io_uring: fix task_work add use-after-free with SQPOLL

Jesse Zhang (4):
      drm/amdgpu: support non-guilty job save on ring backup
      drm/amdgpu: fix empty fence backup and replay intervals
      drm/amdgpu/gfx12: set KMD_QUEUE for kernel gfx queues
      drm/amdgpu/gfx11: set KMD_QUEUE for kernel gfx queues

Jiale Yao (1):
      iio: accel: kxcjk-1013: reject duplicate event disable

Jiangshan Yi (6):
      ASoC: codecs: max98363: fix uninitialized stream_config->type
      ASoC: codecs: rt1017-sdca-sdw: fix uninitialized stream_config->type
      tpm: Fix heap buffer overflow in tpm_transmit_cmd()
      tpm: Fix auth session leak in tpm2_get_random() error path
      tpm: fix off-by-four bounds check in tpm2_get_random()
      drm/amd/display: check dc_state_create_copy() for NULL in dm_suspend

Jianyu Zhou (1):
      ALSA: hda/realtek: Add quirk for IPASON SmartBook S1

Jiazi Liu (2):
      usb: dwc3: gadget: fix IRQ storm on invalid event buffer count
      usb: dwc3: gadget: fix IRQ storm on invalid event buffer count

Jie Deng (1):
      usb: cdns3: Fix NULL pointer dereference in cdns3_pci_probe

Jinseob Kim (1):
      iio: buffer: serialize buffer teardown with mode claims

Johan Hovold (19):
      USB: serial: fix port tear down use-after-free
      USB: serial: fix dynamic id driver deregistration race
      USB: serial: fix driver deregistration order
      USB: serial: use iterator for driver deregistration
      USB: serial: fix ioctl hangup race
      USB: cdc-acm: fix racy TIOCMIWAIT implementation
      USB: serial: ssu100: fix baud rate overflow
      USB: serial: quatech2: fix baud rate overflow
      tty: abort break signalling on hangup
      tty: tty_port: restore TTY_IO_ERROR on activation failure
      tty: port: fix tty_port_tty_vhangup() race
      serial: revert guards in uart_wait_modem_status()
      serial: fix ioctl hangup race
      serial: fix TIOCMIWAIT race
      serial: abort TIOCMIWAIT on hangup
      tty: amiserial: fix broken TIOCMIWAIT
      tty: add break_wait kernel-doc
      tty: fix saved termios reset race
      tty: add missing driver flag kernel-doc colon

John Ogness (1):
      serial: 8250: Change console_msr_work to IRQ_WORK_LAZY

Johnny.Fan (1):
      rtc: efi: restore alarm support with runtime capability probe

Jonathan Cameron (1):
      iio: buffer: Ensure bounce buffer used for unaligned case is zeroed.

Joseph Qi (1):
      MAINTAINERS: add Heming Zhao as ocfs2 reviewer

Joshua Rogers (2):
      tty: vcc: zero-initialize control packet in vcc_send_ctl()
      tty: vcc: hold port lock when clearing tty pointer in vcc_cleanup

Julian Anastasov (3):
      ipvs: fix missing counter decrement in lblc
      ipvs: do not create invisible templates
      ipvs: filter some flags received in the backup server

Julian Braha (1):
      ARC: cleanup dead ARC_CANT_LLSC option in Kconfig

Julian Sun (1):
      nvmet: preserve device path on allocation failure

Julien Stephan (1):
      drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG register offset

Jun Yang (1):
      sctp: check RCV_SHUTDOWN after the sendmsg connect wait

Junyuan Feng (1):
      io_uring/zcrx: requeue multishot receives stopped by a local resource

J=C3=A9r=C3=A9my Carrat (1):
      USB: serial: cp210x: add Corsair AX1500i Power Supply

J=C3=A9r=C3=A9my Jean (2):
      audit: fix exe mark UAF in kill_rules()
      tipc: prevent GCM nonce reuse on peer key changes

KIM MinWoo (1):
      ALSA: hda/realtek: Add quirk for Lenovo ThinkBook 16p Gen 3 ARH (21EK=
)

Kailang Yang (1):
      ALSA: hda/realtek - Add headset mode for Dell Pro QC1255

Karl Mehltretter (5):
      mtd: core: avoid double-free of OTP NVMEM device
      mtd: core: call _get_device() with the master MTD
      mtd: cfi_cmdset_0001: shrink do_write_buffer() stack frame
      random: fix vgetrandom_opaque_params kernel-doc
      hrtimer: Use the mask to clear TIF_HRTIMER_REARM from the exit work

Keith Busch (2):
      blk-mq: set RQF_USE_SCHED when the operation is known
      blk-mq: allow cached requests to be used for flush operations

Kendall Willis (1):
      serial: 8250_omap: fix wake irq cleared during suspend

Konrad Dybcio (1):
      serial: qcom-geni: keep registered console runtime active

Krish Gulati (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx

Kuan-Wei Chiu (1):
      irq: Make refcount_interrupt kunit test selectable

Kumar Kartikeya Dwivedi (1):
      bpf: Hold map BTF for the memory allocator destructor record

Kurt Lieber (1):
      thunderbolt: Disable CL states for the Anker Prime TB5 dock

Kyle Zeng (1):
      ALSA: seq: Serialize compat port-info ioctls

Laurent Wandrebeck (1):
      x86/mm: Don't apply va_align to hugetlb mappings on AMD F15h

Laxman Acharya Padhya (1):
      iio: proximity: aw96103: validate firmware data length

Leon Hwang (1):
      kprobes: Skip disarmed probes when checking optkprobe overlap

Linkai Gong (1):
      usb: typec: anx7411 - stop the IRQ before destroying the workqueue

Linmao Li (4):
      Bluetooth: hci_core: Fix inquiry cache timestamps on 64-bit systems
      iio: imu: inv_icm42607: propagate runtime suspend errors
      iio: imu: inv_icm42607: restore runtime PM on system resume errors
      iio: adc: ade9000: fix NULL pointer dereference in clkout registratio=
n

Linus Torvalds (1):
      Linux 7.3-rc6

Liu Chao (1):
      usb: gadget: f_uac1_legacy: validate bRequest index in
generic_{set,get}_cmd

Liu Dalin (1):
      rtc: dev: zero-initialize struct rtc_wkalrm to prevent information le=
ak

Liviu Nicoara (1):
      ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume
after enabling clocks

Lorenzo Bianconi (2):
      net: stmmac: fix rx Scatter-Gather support
      net: mvneta: clear XDP pfmemalloc flag between frames

Lorenzo Stoakes (ARM) (1):
      mm/vma: predicate setting mmap_prepare VMA fields on new vma alloc

Lovekesh Solanki (3):
      usb: hub: use shorter 120ms post resume hold for SS root hubs
      Input: synaptics - add LEN205b entry to smbus_pnp_ids for ThinkPad T4=
90
      Input: i8042 - add nomux quirk for Fujitsu LIFEBOOK U7410

Luis Banha (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-ec1xxx

Luo Gengkun (1):
      perf: Fix race between perf_event_exit_task() and perf_pending_task()

Maciej Strozek (2):
      ASoC: SDCA: Set suspended flag after resuming within system suspend
      ASoC: SDCA: Add better pm_runtime error handling in func probe

Maciej W. Rozycki (1):
      MAINTAINERS: Add self for the sb1250-duart serial driver

Manush Prajwal (1):
      rtc: mpfs: fix unchecked devm_clk_get() error pointer in probe()

Marc Zyngier (4):
      Revert "interconnect: qcom: x1e80100: enable QoS configuration"
      KVM: arm64: vgic: Allow last_lr_irq to be NULL when LRs are not
overflowing
      KVM: arm64: vgic: Take a refcount on IRQs referenced by last_lr_irq
      KVM: arm64: vgic-its: Fix MOVALL handling of source redistributor

Marcelo Schmitt (1):
      iio: adc: ad7173: Fix digital filter configuration

Marcin Bernatowicz (1):
      drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled

Marco Chen (1):
      iio: health: max30102: fix NULL dereference in interrupt handler

Marek Maslanka (1):
      usb: typec: port-mapper: Only match USB4 port if host interface
is available

Marian Rotariu (1):
      usb: typec: tipd: don't send GAID when probe fails in APP mode

Mario Limonciello (1):
      Revert "thunderbolt: Add quirk to reset host interface on DMA
path teardown for AMD USB4 routers"

Mark Rutland (1):
      arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only sy=
stems

Martino Papero (1):
      Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3 15IWC11

Masami Hiramatsu (Google) (1):
      fprobe: Use guard(rcu_sched_notrace) and check rcu_is_watching()

Matt Barr (1):
      ALSA: hda/realtek: Drop Yoga Pro 9 16IAH10 PCI SSID quirk

Matti Vaittinen (10):
      iio: adc: rohm-bd79124: Fix rising alarm
      iio: adc: rohm-bd79124: Fix channel initialization
      iio: adc: rohm-bd79124: Fix GPIO mask check
      iio: adc: rohm-bd79124: Catch regmap errors at measurement start/stop
      iio: dac: rohm-bd79703: Do not allow writing SCALE
      iio: pressure: rohm-bm1390: Return error when read fails
      iio: light: rohm-bu27034: Fix error return
      iio: accel: kionix-kx022a: Fix array boundary check
      iio: light: rohm-bu27034: Fix infinite delay on error
      iio: accel: kionix-kx022a: Prevent memory leak and fix state

Maurizio Lombardi (2):
      nvme-fc: do not warn on controller removal race
      nvme: do not reset controllers in NVME_CTRL_NEW state

Mehmet Fide (2):
      mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes o=
f OOB
      mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages

Menachem Adin (1):
      mtd: mtd_intel_dg: reset poll counter for each erase

Michael Hennerich (1):
      iio: buffer-dmaengine: fix sg entry iteration when building dma_vecs

Michal Wajdeczko (1):
      drm/xe/pf: Refactor VF LMEM BAR resize helper function

Mika Westerberg (4):
      thunderbolt: Fix KASAN reported use-after-free when request is cancel=
ed
      thunderbolt: Use separate lock class for each ring
      Revert "thunderbolt: xdomain: Notify peers after enumeration"
      thunderbolt: stream: Announce support for FMODE_NOWAIT

Mikhail Gavrilov (1):
      x86/mm: Drop unnecessary PMD page copy when freeing

Mina Almasry (1):
      net: page_pool: fix use-after-free in page_pool_recycle_ring_bulk()

Mingyu Wang (1):
      tty: vt: fix memory leak in vc_allocate()

Mitul Golani (1):
      drm/i915/vrr: Disable DC balance by default

Mohamad Raizudeen (1):
      crypto: x86/aes-gcm - fix always true check for last AAD segment

Mostafa Saleh (1):
      KVM: arm64: Use stage-1 leaf size for VM_PFNMAP

Muhtasham Nawr al-Mahmud (1):
      ALSA: hda/realtek: Fix speakers on ASUS PM3406CHA

Myeonghun Pak (5):
      usb: chipidea: tegra: disable runtime PM on resume failure
      usb: ohci-da8xx: disable controller wakeup on cleanup
      usb: ohci-s3c2410: disable controller wakeup on removal
      usb: ohci-spear: disable controller wakeup on removal
      usb: ohci-st: disable controller wakeup on removal

Nathan Chancellor (1):
      random: vDSO: avoid call to memset() when zeroing reserved parameter

Nguyen Ngoc Thang (2):
      ALSA: caiaq: unregister the input device when probe fails
      Bluetooth: hci_sync: don't drain cmd_sync backlog on unregister

Nick Desaulniers (1):
      {x86,um}/uapi/ptrace: Guard register offset macros with
__ASSEMBLER__ or __FRAME_OFFSETS

Nicolai Buchwitz (3):
      net: bcmgenet: allocate RX buffers as page fragments
      net: ethtool: let tsconfig reach a PHY-only timestamp provider
      net: bcmgenet: fix NULL dereference in set_coalesce before first open

Nicolas Escande (1):
      wifi: ath11k: reset ar->num_stations on hardware start

Niklas Cassel (1):
      virtio_blk: set the zone write granularity

Nikola Prica (1):
      PCI: Accept AtomicOps already enabled by the hypervisor

Nilay Shroff (2):
      nvmet: defer setting ns->enabled to false in nvmet_ns_disable()
      nvmet: don't allow I/O admission after percpu ns reference is killed

Nuno S=C3=A1 (2):
      mtd: spinand: fix NULL pointer dereference with no ECC engine
      mtd: spinand: fix zero oobavail when no ECC engine is used

Oleg Keri (1):
      arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz

Oleksij Rempel (1):
      r8169: disable EEE on RTL8168h/8111h

Orgad Shaneh (3):
      usb: octeon-hcd: fix the FIFO-flush timeout computation
      usb: octeon-hcd: fail the probe when the USB core does not respond
      usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers

Pablo Neira Ayuso (2):
      netfilter: flowtable: generalize pending status bit
      netfilter: flowtable: restore ieee80211 forward path

Pannarat Wiriyaarritham (1):
      usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro ANV15-41

Paul Mbewe (3):
      serial: sc16is7xx: fix TX gap caused by kfifo circular buffer wrap-ar=
ound
      serial: sc16is7xx: refill TX FIFO below trigger using fresh TXLVL
      serial: sc16is7xx: reduce TX refill rate with half-FIFO trigger

Paulo Alcantara (15):
      netfs: clear post-EOF pagecache when extending a file via write
      smb: client: clear post-EOF pagecache when extending a file via trunc=
ate
      smb: client: discard post-EOF pagecache when extending a file
via zero range
      smb: client: discard post-EOF pagecache when extending a file
via copy range
      smb: client: discard post-EOF pagecache when extending a file
via clone range
      smb: client: flush and commit data before querying allocated ranges
      smb: client: drain outstanding I/O before truncating on O_TRUNC open
      smb: client: flush dirty data before zeroing a range
      smb: client: drain and invalidate before server-side copy/clone
      smb: client: only require read lease for size-extending zero range
      netfs: zero gaps in read-gaps folio to avoid writing back stale data
      smb: client: only require read lease for size-extending preallocate
      netfs: zero the tail of a short DIO/unbuffered read
      smb: client: distinguish real EOF from a stale remote_i_size on read
      smb: client: require stable pages for signed connections

Pei Xiao (1):
      mtd: block2mtd: Fix divide error when erase_size is zero

Peiyang He (1):
      binderfs: fix UAF write in binder_add_device

Pengpeng Hou (3):
      iio: adc: aspeed: propagate reset deassert errors
      wifi: ath9k: reject short WMI command responses
      iio: cdc: ad7150: fix OF matching and publish module aliases

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: implement workaround for sdma dcc corruption

Prashanth K (1):
      usb: typec: ucsi: Get the connector fwnode based on reg value

Prathamesh Deshpande (1):
      net/mlx5e: Fix AF_XDP TX timestamp teardown NULL dereference

Preston Lam (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Laptop 15-fd2xxx

Qishuai Liu (1):
      ipv6: fix prefix route expiry in modify_prefix_route()

Quentin Freimanis (2):
      net: sparx5: skip ptp deinit if init was skipped
      net: sparx5: make ports inherit the switch base mac address type

Radhey Shyam Pandey (3):
      usb: dwc3: am62: Fix runtime PM usage count leak on probe error path
      usb: typec: tipd: fix uninitialized typec_partner_desc in
tps6598x_connect()
      usb: typec: tipd: fix uninitialized typec_partner_desc in
cd321x_update_work()

Rafael J. Wysocki (1):
      cpufreq: intel_pstate: Fix max_freq fallback in cpufreq_update_pressu=
re()

Randy Dunlap (1):
      siphash: clean up kernel-doc comments

Rapha=C3=ABl Larocque (1):
      Input: synaptics - limit T440p InterTouch quirk to LEN0036

Ray Wu (1):
      drm/amd/display: map PWM brightness through custom backlight curve

Reinhard Speyerer (1):
      net: usb: qmi_wwan: add Rolling Wireless RN947R

Richard Fitzgerald (1):
      spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260

Roman Bolotov (1):
      ALSA: usb-audio: Add quirk flag for ASUS SupremeFX Hi-Fi

Rosen Penev (1):
      tty: serial: mpc52xx_uart: move static declarations up.

Rounak Das (1):
      EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup

Ruide Cao (1):
      wifi: mac80211: reject invalid 320 MHz CSA bandwidth

Runyu Xiao (5):
      iio: admv1013: initialize callback mutex before registering notifier
      mtd: rawnand: cadence: Initialize IRQ state before requesting IRQ
      USB: dwc2: shut down wakeup timer before freeing HCD state
      mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
      rtc: spear: initialize IRQ state before requesting alarm IRQ

Ruslan Valiyev (1):
      serial: core: fix NULL pointer dereference in
serial_core_unregister_port()

SJ Park (1):
      mm/damon/core: don't skip damos_adjust_quota() while esz is not zero

Sagar Taunk (1):
      rust: net: netlink: validate attribute length before casting to `c_in=
t`

Sagnik Sasmal (1):
      mtd: spinand: Do not update the QE bit on devices without one

Sai Teja Aluvala (1):
      Bluetooth: btintel: validate DDC record lengths

Salah Triki (5):
      iio: accel: sca3000: fix frequency divider condition check
      iio: frequency: admv1013: fix wrong channel field used in
admv1013_read_raw()
      iio: proximity: vcnl3020: fix ISR bitmask check in IRQ handler
      iio: proximity: isl29501: Fix return type of isl29501_register_write
      iio: adc: ad4030: fix invalid oversampling_ratio validation

Sandeep Haemoon (1):
      net: ethernet: mtk_eth_soc: allocate dummy netdev sooner

Sang-Hoon Choi (1):
      Bluetooth: hci_core: free the HCI ID if naming fails

Sasha Levin (1):
      drm/amd/display: Fix sanitizer check for the DML frame size limit

Sean Christopherson (21):
      KVM: Reject attempts to lock all vCPUs if vCPU creation is in-progres=
s
      KVM: arm64: vgic: Rely on vCPU creation check in "trylock all vCPUs"
      KVM: RISC-V: Use kvm_is_vcpu_creation_in_progress() instead of
open-coded equivalent
      KVM: Protect all of kvm_vm_ioctl_create_vcpu() with kvm->lock
      KVM: Move check for existing vCPU ID to the top of vCPU creation
      Revert "KVM: Check for duplicate vcpu_id as early as possible"
      KVM: WARN if vCPU creation is in-progress when locking all vCPUs
      KVM: x86/mmu: Bail from shadow walks if the root is invalid or a dumm=
y
      KVM: SVM: Preserve TLB control (i.e. pending TLB flush) on failed VMR=
UN
      KVM: SVM: Update control fields on #VMEXIT if and only if VMRUN succe=
eded
      KVM: SVM: Don't mark ASID fields as dirty when setting control.tlb_ct=
l
      KVM: SVM: Sync guest's PERF_CNTR_GLOBAL_CTL from h/w only on
successful VMRUN
      KVM: SVM: Use the active VMCB's MSR bitmap when checking if MSR
is intercepted
      KVM: nVMX: Force MSR bitmap refresh if runtime eVMCS controls are mod=
ified
      KVM: selftests: Add x2APIC MSR test for inhibiting APICv while nested
      KVM: selftests: Run the nested x2APIC with and without APICv
being inhibited in L2
      KVM: selftests: Verify that L0's TPR doesn't get clobbered
      KVM: selftests: Extend nested x2APIC test to validate disabling
x2APIC virt
      KVM: selftests: Extend nested x2APIC test to validate using
eVMCS for vmcs12
      KVM: SEV: Nullify "have run CPUs" mask pointer when freeing it
      KVM: SEV: Do cache maintenance on the source VM *before*
clearing SEV state

Sebastian Sjoholm (1):
      USB: serial: option: add Quectel RG660QB

Seiji Adachi (1):
      ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2 (21JN) to quirks

Sheetal (1):
      ASoC: tegra: Fix ASRC Stream6 input threshold control

Shin'ichiro Kawasaki (1):
      Revert "nvme-tcp: lockdep: use dynamic lockdep keys per socket instan=
ce"

Simon Gassner (1):
      serial: tegra: don't clear the Tx FIFO on an Rx-only reset

Simon Polack (1):
      drm/amd/display: Fix stale replay_events after mod_power stream remov=
al

Slavin Liu (1):
      iio: adc: pac1934: check ACPI label duplication

Stanislaw Gruszka (1):
      wifi: cfg80211: fix RTS threshold setting for single-radio PHY

Surendran Kanagaraj (1):
      tpm: Disable TPM on null key name mismatch

Sven Peter (6):
      thunderbolt: Hold a router reference for each allocated HopID
      thunderbolt: Make the DP tunnel activation callback mandatory
      thunderbolt: Fix domain reference leak when DPRX read is canceled
      thunderbolt: Don't access a DP tunnel after its DPRX read was cancele=
d
      thunderbolt: Mark discovered tunnels as active
      thunderbolt: Tear down inactive DP tunnels when the domain is stopped

Syed Labeeq Sajid Bukhari (1):
      usb: storage: sierra_ms: reject short SWoC info transfers

Syed Saba Kareem (1):
      ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine

Takashi Iwai (5):
      usb: gadget: midi2: Fix the jack descriptor array sizes
      ALSA: usb-audio: Apply boot quirk for Behringer models generically
      ALSA: usb-audio: Apply IGNORE_CTL_ERROR quirk to all Audient devices
      ALSA: core: Define auto-cleanup for snd_card_free()
      ALSA: ice1712: Fix the error handling via auto-cleanup at probe

Tarun Noonemunthala (1):
      ALSA: hda/realtek: Add quirk for HP ENVY 13-aq1xxx

Theo Andersen Carton (1):
      drm/amdgpu: skip the noirq suspend reset for a switcheroo-parked GPU

Tianchu Chen (1):
      wifi: cw1200: fix TX padding OOB read leaking heap data to device

Timur Krist=C3=B3f (5):
      drm/amd/display: Fix fast updates on DCE 6.x
      drm/amd/display: Fix fast updates on DCE 8.1
      drm/amd/display: Mark DCE 6.4 as not APU
      drm/amd/pm/si: Check AMD_IS_MOBILITY flag for PPSMC_SYSTEMFLAG_GPIO_D=
C
      drm/amd/pm/si: Fix updating clock limits on AC/DC

Toke H=C3=B8iland-J=C3=B8rgensen (1):
      wifi: ath9k: Clean up device initialisation guards

Tomasz Bojanowski (1):
      ALSA: usb-audio: Add mixer mapping for MSI MAG B850M MORTAR WIFI

Tomasz Paku=C5=82a (1):
      HID: universal-pidff: Add support for Turtle Beach VelocityOne Race

Tomer Pomeranc (2):
      binder: fix leaked fd fixups on TF_UPDATE_TXN supersede
      binder: fix is_failure flag for superseded transaction cleanup

Troy Mitchell (1):
      clk: spacemit: k3: add CPU PLL rate tables

Tuna K=C4=B1l=C4=B1=C3=A7 (1):
      iio: dac: mcp47a1: Allow full-scale output

Viken Dadhaniya (2):
      soc: qcom: geni-se: Correct QUP Core ICC vote constants
      tty: serial: qcom_geni_serial: Keep console RX functional after deep =
idle

Vineet Gupta (1):
      ARC: arch_cmpxchg_relaxed to use size of pointed type not pointer

Vitaly Kuznetsov (1):
      virt: vmgenid: remap memory as decrypted

Vladislav Leonov (2):
      dt-bindings: iio: adc: rockchip-saradc: Group single-entries
into an enum list
      dt-bindings: iio: adc: rockchip-saradc: Fix RV1106 compatible

Vladyslav Ivashchenko (1):
      iio: adc: axp288: Add TS bias override for Haier HV103H

Vlastimil Babka (SUSE) (1):
      MAINTAINERS: update slab.git URL

Weiming Shi (2):
      nvmet-auth: fix out-of-bounds write in nvmet_auth_challenge()
      netfilter: nft_set_rbtree: skip transaction elements during GC

Wentao Liang (7):
      wifi: wlcore: Fix runtime PM leak in wlcore_remove()
      serial: ma35d1: Fix clock reference leak in ma35d1serial_probe()
      kgdboc: Fix tty driver reference leak in configure_kgdboc()
      serial: vt8500: Fix clock reference leak in vt8500_serial_probe()
      of/irq: Fix remaining refcount leaks in of_irq_init()
      drm/mediatek: Fix pdev reference leak in mtk_drm_bind()
      drm/mediatek: Fix runtime PM leak in mtk_hdmi_ddc_v2_probe()

Willem de Bruijn (1):
      net: extend IPv6 exthdr detection of tunneled packets

Willian Oliveira (1):
      drm/amdgpu/gfx6: fix firmware leak on teardown

Xiang Mei (2):
      ALSA: ua101: reject mismatched capture/playback packet sizes
      ALSA: line6: reject oversized playback packets

Xuanqiang Luo (1):
      pfcp: fix socket lifetime on netdevice registration failure

Yang Xiuwei (1):
      block: reject polled dio with user integrity metadata

Yao Kai (1):
      io_uring: initialize task context before running the BPF loop

Yao Sang (1):
      nvme: fix command effects log lifetime for multipath heads

Yi Yang (1):
      vc_screen: reload vc pointer before if (ret) in vcs_write() to avoid =
UAF

Yongzhao Chen (1):
      net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values

Yoshihisa Yamamoto (1):
      net: pcs: rzn1-miic: Clear MIIC protection state before unprotect seq=
uence

Yu-Hsiang Tseng (1):
      ALSA: hda/realtek: Fix silent speaker on Higole F9B

Yuchao Zhang (3):
      wifi: mac80211: drop oversized fragments to avoid extra_len overflow
      usb: gadget: f_fs: Fix NULL pointer dereference in
FUNCTIONFS_ENDPOINT_DESC
      USB: cdc-acm: skip URB restart in port_shutdown if disconnected

Yuho Choi (1):
      of: Put coreboot node after compatibility check

Yuqi Xu (3):
      wifi: mac80211: minstrel_ht: validate fixed rate index
      wifi: mac80211: handle empty FILS association request payload
      wifi: mac80211: validate TX status rate metadata

Yuxiao Wang (1):
      nitro_enclaves: fix use-after-free on SLOT_ALLOC failure

Zeyu Li (1):
      ALSA: hda/realtek: Add ALC235 support for headset mode

Zhan Xusheng (2):
      sysctl: Negate before converting in the int read path
      time/jiffies: Saturate in mult_hz() instead of wrapping

Zhang Heng (7):
      ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 14ASP9
      ALSA: hda/realtek: Add quirk for Acer Nitro ANV16-41
      ALSA: hda/realtek: Fix square wave output on ASUS Strix G615LR
      ALSA: hda/realtek: Add quirk for Lenovo ThinkBook G8+
      ALSA: hda/realtek: Add quirk for Acer Nitro AN515-45
      ASoC: amd: acp-config: Add ACP70 DMI quirk for ASUS UM5406GA
      ALSA: hda/realtek: Add quirk for HP Pavilion AiO 24 speaker

Zhang Jie (1):
      iio: proximity: sx9324: Correct proximity channel resolution

Zhao Dongdong (1):
      USB: serial: option: add support for SIMCom SIM8260C

Zhao Li (6):
      wifi: mac80211: release mesh path quota on failed additions
      wifi: mac80211: account proxy paths against the mesh path limit
      wifi: mac80211: drain PS delivery work during station teardown
      wifi: mac80211: shut down RX BA session timer on teardown
      wifi: mac80211: keep fallback association elements alive
      wifi: cfg80211: preserve hidden-group beacon IE ownership

Zhengchuan Liang (1):
      perf: Require kernel access for text poke events

Zhichen Wang (1):
      virt: vmgenid: set driver_data before registering notification handle=
rs

Zhiling Zou (3):
      wifi: mac80211: count only matching reservations in reserved switch
      wifi: mac80211: keep paired old chanctx alive
      ipvs: bound LBLCR and LBLC cache growth

Zihan Xi (2):
      wifi: mac80211: fix mesh fast xmit path deletion UAF
      net: gso: limit recursive IP-in-IP segmentation

Zimeng Li (1):
      ASoC: qcom: lpass-cpu: use DAI table index for playback constraints

Zizhi Wo (1):
      vt: skip screen update for DEC alignment test on backgroup consoles

blaze (1):
      arc: kernel: Fix clk reference leak in show_cpuinfo()

lollipopkit (1):
      io_uring/cmd_net: end TX_TIMESTAMP multishot when the CQ is full

renpanpan (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 14-dv1001TU

=C3=96mer Mete Kaya (1):
      bpf: Fix missing migration protection in
__rhtab_map_lookup_and_delete_batch()
