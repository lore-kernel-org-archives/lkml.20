Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783025;
	b=cY7+3a+Qu6a779im+BVLUKQhja3gAdP/PfjFLa2b57+chmopn2mbSqcgOr4Qo7BEFxEX
	 e0hRsDzVA56x3eHUNqTwp3KP7/TFY14eovjp1/67Vd5q+FXHmf9GDVdWW2CkKnEv5vkb3
	 QwgZmCgvfjrHCdGBZ6MxN9/Zuuy5vQiVuX1KIRrR5mkygQxr0CF/ffXqtgMY/qcOZeXvA
	 kpo3X9pmVuwZQ80DIwGKeoU6pMFsVisIuUAttuj8rdcRzVRzKsmlFD+42ly8+mzRu1Otn
	 0VSdz7SS16zq2wxEFntVmIEYSqpgnVeJ12f4cAFrY2HsylYhMr18tN3+auSe12+ZVwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=axumWjAn/22/8pjpgkNZOiD4mgjGZkL1rKamiFRRQFM=;
	b=ClGAxn2j7FrzVTusaMkf8Q48b0Qm+PbLH3oEufwvJT5cO2P5H2ox3W7/qTZvysq5ToZs
	 o7CMw4bVMF9unlvsIkpeXLb+ZcvADCNji3aN1DgWIwE6/xtZ9V6PM92XjacsP89CMs6o2
	 m9AaGJeejOkzrzhpgOTLCrfqXOgHLASurD7dLtH+77baLiiSgGbWpZc0ObGY5GBHdQglN
	 KL1CaESqYIVgjV9XIPJAz4Jq9bFDBMKpi0MJxi2RaEAtg8CoN1313XYvyPu6Q0YjW1rmz
	 GsOpINfOjU7c5UEWdpC5dprn4AtxtFizf+J/njUoLRqFb8pfBtiiCmPYYXTBGX3thUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KOSL7Bz0;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D683606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D683606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KOSL7Bz0
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so1729527a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794783022; x=1795387822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axumWjAn/22/8pjpgkNZOiD4mgjGZkL1rKamiFRRQFM=;
        b=KOSL7Bz0U3+poJqV0FhRa8IoHfvY9P8W4+v6I8tszO9zkFFmAdgFQxkg63833jgv05
         1zM6DaEq4ovc9giFfh+jQB2mXxQoJb/xwO5aA1GH6hA6Epjog772zZXvOT8vjxii+g6U
         6xUP/vUiCorwOI0oEtzYc3Y9sV2hTFfOdY/qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794783022; x=1795387822;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axumWjAn/22/8pjpgkNZOiD4mgjGZkL1rKamiFRRQFM=;
        b=z9lvcgQLD2l9dvK/Bq2xanGAywXNSBJqLqCzhFD23zVrUTgDI8MHMG9XcYaBOKq5lU
         sww6+aiipFNFmpLBuKoWiOyZ0DJPAYOFFd6Rf3SiAVGOoOEzuHHSofSmyKgNP2zSKcao
         0tzu/mp8g1sSrdPmssmwZDQWq3mjeX5GcQYM0txIpKgTfIkK5yIEGpedRLAb/LFbD2Oc
         8q3hsoINB13hKXAPhHmBosC34bQOpSrHBiLzqDZvGiSpXt5mxoMxlWIQV8UcZ5aOafx6
         ALzkbOJBmUh8RpjS+pCpDHa8ELcEeHs+Xv9HQ7rVFfSUpbWV22mVd+cxPyZRZH6gyiMN
         4NCQ==
X-Gm-Message-State: APuU4Z/3Bpy1eqYrg4qSvihIzwvzTg2KrJ6DJFK5wQ9SblLd8rqJ/SUX
	enieYTdxKSfLtExmJiBJ5d+TJk/e2opwuqcS9q9PEZY2tTV0h4Q4JCmMOAa6UUOfuXgAM0eWDtN
	vMQAgglLtHw==
X-Gm-Gg: AYBFou2Ihc43/uP4GaXE1TvkwNPxN8ud6NYxEX5wcXWSMTYJ7TJWuc+rVGsGnaBexOC
	DEOOmvekJVgxERVEsYGB7l5m/zNL4wj3FKAopJzCfZ5tANwcdx2x/2cA6yqtT5g/wLu7Qlh+qD3
	EvVjNeruSv6fM+hJQetjX+sKwIorpZKytIkVSIbxT2EfV37yow9f8FhxhhlQRHUYRdbsWQhLODv
	BrEhRg2MprMjieMuHiCddfNlllX0YhwqhwZQv8fs0EmRlTPGBvLJL1w+ow1knJqgXvHcZA0Cuds
	4eGe5M7feSIuvLv9BuHXH7SJFUzMVrJflWDf/uryFrA5Wmnx4akVCHYYT6IIVk6qDV79DCq8Gaa
	qACtDVMPv28jl/wqo2ZIrwg1kuZVm4+c062kgBvGvm3wnyvkR/bsSpLPIHAo4dpVh773aVCK6lw
	2xk6kFPEH2CyPx+EWMcuQeGba+C/TolMEpNVW5MDtd2c4wyli3wYNSuCh/kc+LRgutAj5jiLsVw
	WUCKI0S5i2KbPmKFCFDU5UFinlgkSNhxguAGQc0QI5EzBtAKeEkecdEAsnBT+VzgLEQLwoTQNjt
	bdxW+8aOzSznsqEDXzTz8aSuN65+QkHpbIC/ILZASdTcM9eg4vHHAULg/n1Bu2lQr+uVuqaU035
	liW4=
X-Received: by 2002:a05:6402:450a:b0:6b7:6485:23cf with SMTP id 4fb4d7f45d1cf-6b7c0c71b38mr6456107a12.42.1794783021069;
        Sun, 15 Nov 2026 14:50:21 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c672asm3739457a12.15.2026.11.15.14.50.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:50:20 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so4776061a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:50:20 -0800 (PST)
X-Received: by 2002:a17:907:968b:b0:c40:6ed9:b962 with SMTP id
 a640c23a62f3a-c50963fc222mr721772066b.26.1794783019665; Sun, 15 Nov 2026
 14:50:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Nov 2026 14:50:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wguRDYogK6+8yabjOhFPEfEpOfC=hG2GKfsCBXaKBL5=A@mail.gmail.com>
X-Gm-Features: AclHuK_V0XJ5S0R34o-XFeREaRuBJkrgrDe8_aRurvOZnMahaSHtRsDvJLHaMi8
Message-ID: <CAHk-=wguRDYogK6+8yabjOhFPEfEpOfC=hG2GKfsCBXaKBL5=A@mail.gmail.com>
Subject: Linux 7.4-rc3
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

.. another week, another big -rc.

It looks fairly normal, with drivers (networking and gpu) leading the
charge. There's lots and lots of changes, but most of the actual
patches are tiny.

Filesystems actually show in in the diffstat because we have a couple
of bigger patches in there, notably a calling convention change for
iomap that ends up being fairly trivial but large, and a few smb
client fixes.

We also have various selftests and some documentation updates.

.. and the usual noise all over.

                Linus

---

Abbott Liu (1):
      initrd: flush deferred fput() before mounting root

Adri=C3=A1n Larumbe (1):
      drm/panfrost: Fix race when restoring reset state in perfcnt

Alexander Duyck (6):
      fbnic: Take the instance lock to restore filters after a FW crash
      fbnic: Fix service task races with ndo_stop and PM suspend
      fbnic: Disable PTP completions during the Tx force-flush
      fbnic: Suspend phylink after taking the datapath down in ndo_stop
      fbnic: Wait for the outbound flush to complete on mailbox teardown
      net: Segment CHECKSUM_UNNECESSARY GSO skbs other than fraglist

Alexandra Winter (1):
      MAINTAINERS: Add Hidayath as net/iucv maintainer

Alexandre Cassen (1):
      net/mlx5: HWS, fix flow meter release on FTE update

Alexei Lazar (1):
      net/mlx5e: Fix false WARN_ON_ONCE in flow steering cleanup on RX
init failure

Alexei Starovoitov (1):
      ipv6: Check the Home Address option again before its address is used

Amir Goldstein (5):
      ovl: do not read the flags of a put upper dentry in lookup
      ovl: fix leak of lowerdata redirect on ovl_get_inode() failure
      ovl: do not check the deferred lowerdata redirect on index lookup
      ovl: do not allow nfs_export with data-only layers
      ovl: report the requested redirect_dir mode in conflicting options

Anandu Padinhare (1):
      net: stmmac: count XDP_PASS frames in rx_packets on the XSK zero-copy=
 path

Andrea Parri (5):
      iov_iter: take an unsigned long segment count in import_iovec()
      sched/deadline: Fix spurious -EPERM for migration-disabled tasks
      sched/uclamp: Reject clamp values above SCHED_CAPACITY_SCALE
      sched/core: Fix cpuset_mutex double unlock in __sched_setscheduler()
      hv_sock: Report no unread data before a channel is available

Andrea Righi (1):
      sched_ext: Avoid unnecessary IMMED reenqueues on idle CPUs

Andrei Krautsou (1):
      drm/amdgpu: enable MGCG/FGCG/PERF_CLK for GC 11.0.2

Andrew Davison (1):
      ALSA: hda: Fix [codec] ID matching in patch files for IDs with bit 31=
 set

Andrey Misiurov (3):
      smb: client: fix OOB write when compounding SMB2_IOCTL with encryptio=
n
      sctp: fix ASCONF address change on single-homed hosts
      xen/gntdev: fix deadlock between map ioctl and mmap

Anfernee Cao (2):
      mmc: mmci: fix DMA channel leak when mmc_add_host() fails
      mmc: sunxi: fix clock and runtime PM leaks on probe failure

Angel J (1):
      ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone

Anil Kaushik (1):
      netlink: Do not call the unbind callback with the table locked

Anton Lundin (1):
      hwmon: (nct6775) Handle dual use registers

Antonio Quartulli (1):
      udp_tunnel: don't treat IPv4 sockets bound to an address as wildcard

Apurv Mishra (1):
      drm/amdkfd: Don't reuse a VRAM page that is still referenced

Arnd Bergmann (2):
      net: octeontx2: fix building without DEBUGFS
      drm: xe: select configfs

Arvind Yadav (2):
      drm/xe: Rebind BOs evicted before the first LR queue
      drm/xe/svm: Preserve default PAT index when resetting VMA attributes

Avi Weiss (19):
      gpio: omap: Propagate runtime PM failures in probe and request
      fs: clamp FIONREAD result to int range
      splice, net: avoid MSG_MORE when the bvec array fills
      timekeeping: Reject cross timestamps for invalid AUX clocks
      timekeeping: Refresh auxiliary base before offset validation
      NFSv4.1: retain MDS I/O until both thresholds are met
      NFS: honor UTIME_NOW atime with explicit mtime
      NFS: update ctime for atime-only UTIME_NOW requests
      NFS: Fix inverted cross-directory rename check
      NFS: restore directory index when resuming readdir
      SUNRPC: wake poll waiters when an empty pipe is unlinked
      sunrpc: instantiate rpc_pipefs dentry before publishing it
      SUNRPC: preserve fatal network errors during RPC binding
      SUNRPC: preserve timeout policy when cloning clients
      SUNRPC: preserve transport security policy when cloning clients
      SUNRPC: Fix TCP-with-TLS transport class identification
      SUNRPC: Balance switch queue length on transport removal
      SUNRPC: Balance queue accounting when relocating a task
      net: ena: avoid RX copybreak for multi-descriptor packets

Badal Nilawar (1):
      drm/xe/xe_late_bind_fw: Fix firmware leak on missing manifest entry

Baochen Qiang (1):
      wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support=
 it

Baoli Zhang (1):
      ASoC: SOF: ipc4-topology: Fix pin format leak in process widget setup

Bartosz Golaszewski (12):
      gpio: of: fix potential misconfiguration of hogged lines
      software node: only let the owner release a managed node
      power: sequencing: core: add a note on descriptor serialization
      gpiolib: synchronize updates of descriptor labels
      gpio: mvebu: fix sleeping-while-atomic in mvebu_gpio_level_irq_mask()
      gpio: virtuser: fix interrupt leak and UAF
      power: sequencing: pcie-m2: fix use-after-free in
pwrseq_pcie_m2_vregs_enable()
      power: sequencing: pcie-m2: use devm_mutex_init()
      gpio: sodaville: fix use-after-free bug when registering the irqchip
      gpio: shared: fix a race in shared desc release path
      gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
      power: sequencing: pcie-m2: fix serdev controller reference leak

Beata Michalska (2):
      arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
      arm64: errata: Add Cortex-A715/A720 AMU core counter workaround

Ben Grisdale (2):
      regulator: dt-bindings: fan53555: Add Silergy SYM827
      regulator: fan53555: Add support for Silergy SYM827

Benjamin Berg (2):
      wifi: mac80211: do not switch to invalid link
      wifi: mac80211: find STA for beacons belonging to non-TX BSS

Benjamin Segall (1):
      perf: Fix racy update of cpc->hrtimer_interval

Benoit Masson (1):
      wifi: ath12k: assign device id from the WSI index

Bibo Mao (2):
      ACPI: LoongArch: Fix incorrect pointer in acpi_iovt_init()
      ACPI: LoongArch: Add checksum validation for ACPI IOVT table

Billy Tsai (2):
      gpio: aspeed: Clear only the acked line's G4 interrupt status
      gpio: aspeed: Preserve the pending G7 interrupt status on control wri=
tes

Boris Brezillon (1):
      drm/panfrost: Enable cycle counting when perfcnt is enabled

Borislav Petkov (AMD) (1):
      x86/bugs: Mitigate TSA on AMD Zen5

Breno Leitao (3):
      ACPI: APEI: GHES: Fix severity check in ghes_log_hwerr()
      net/mlx5e: Fix queue stats access to queues without stats
      net: ena: Keep the RX buffer mapped if skb allocation fails

Brian Norris (1):
      PM: runtime: Only queue an idle check for RPM-linked suppliers (part =
2)

Bryan Cochrane (1):
      bnxt_en: Take RTNL before netif_close() when aborting FW reset

Carolina Jubran (1):
      net/mlx5: Use only loaded devices for PTP clock operations

Cen Zhang (1):
      KEYS: Protect the update method check against type removal

Cen Zhang (Microsoft) (1):
      netfilter: xt_recent: do not call remove_proc_entry() under recent_lo=
ck

Changyul Lee (1):
      net/mlx5: macsec: Don't remove fs_id when adding a rule fails

Chase Hiltz (1):
      ipv4: route: don't blackhole in-use routes when retiring fnhe routes

Chen Cheng (2):
      dm snapshot: split discards on chunk boundaries
      dm snapshot: fix discard writing into the next COW chunk

Chen Linxuan (1):
      pidfd: restrict task access ioctls to the caller's pid namespace

Chen Ridong (1):
      cpuset: add early empty cpumask check in partition_xcpus_add/del

Chen, Junjia (1):
      drm/xe: Unwrap sync fences before adding them as job dependencies

Cheng Yongkang (4):
      btrfs: reject refs=3D0 subvolume without DEAD in SUBVOL_SYNC_WAIT
      btrfs: handle zero num_stripes in btrfs_chunk_item_size()
      fs/proc: fix the write length returned by proc_sys_call_handler()
      fs/splice: clamp an over-reported write_iter result

Chengfeng Ye (2):
      ipvs: Defer application parent freeing until after RCU readers
      ipvs: fix protocol data lifetime during namespace teardown

Chenguang Zhao (1):
      i40e: xsk: fix multi-buffer XDP_PASS skb construction

Chris Down (1):
      arm64: hugetlb: Prevent write fault livelocks on stale TLB entries

Chris Mason (3):
      backing-file: pass RWF_NOAPPEND to synchronous writes
      net: skbuff: uncharge trimmed zerocopy frags on error
      tcp: Drop any segments if DEFER_CONNECT is set.

Christian Aurich Zanettini Martins (1):
      liveupdate: check for duplicate session before growing block set

Christian Brauner (24):
      libfs: make i_rwsem the lock of the offset tree
      libfs: walk offset directories in offset order
      libfs: end offset readdir at positions past DIR_OFFSET_EOD
      aio: don't let exit_aio() return before complete() is done
      fs: fix the SEEK_CUR f_lock condition
      ext2: add ext2_inode_block() helper
      ext2: don't read the inode block in ext2_sync_inode_metadata()
      ext4: use sb_find_get_block_nonatomic() in ext4_get_inode_loc_noio()
      ext4: don't read the inode block in ext4_sync_inode_metadata()
      minix: add minix_inode_block() helper
      minix: don't read the inode block in minix_sync_inode_metadata()
      udf: don't allocate the inode block in udf_sync_inode_metadata()
      fs: set I_METADATA_WRITEBACK in mmb_mark_buffer_dirty()
      fs: don't strand I_METADATA_WRITEBACK inodes outside the LRU
      ext2: drop mmb_sync() from ext2_evict_inode()
      ext4: drop mmb_sync() from ext4_evict_inode()
      minix: drop mmb_sync() from minix_evict_inode()
      udf: drop mmb_sync() from udf_evict_inode()
      fat: drop mmb_sync() from fat_evict_inode()
      dcache: let d_invalidate() wait for a d_set_mounted() in flight
      bpf: don't mark namespace_init and namespace_free arguments as truste=
d
      ns: allocate the namespace id before the namespace_init hook
      nstree: drop ns_tree_add_raw()
      memcg: make MEMCG select BLK_CGROUP

Christian K=C3=B6nig (1):
      drm/amdgpu: fix TLB invalidation fence handling v4

Christian Loehle (3):
      cpufreq: Hold the policy write lock when changing boost state
      cpufreq: Preserve global boost state on failed updates
      cpufreq: Serialize global boost updates

Chuck Lever (3):
      tls: Consume empty data records in tls_sw_splice_read()
      selftests: tls: Skip the zero_len tests when TLS is unavailable
      selftests: tls: Extend coverage for zero-length records

Cinq Prairie (1):
      io_uring/napi: don't end the single NAPI busy poll early on need_resc=
hed()

Cosmin Ratiu (9):
      net/mlx5e: Release IPsec root table reference on RX setup failure
      net/mlx5e: Serialize ipsec encap reservations with eswitch operations
      net/mlx5e: Take HCA devcom lock before esw->mode_lock
      net/mlx5e: Fix E-Switch races in uplink unbind
      net/mlx5e: Fix ipsec core device access during profile changes
      net/mlx5e: Block E-Switch mode changes during IPsec policy creation
      net/mlx5e: Block E-Switch mode changes during IPsec state creation
      net/mlx5e: Serialize TC and IPsec offload exclusion counters
      net/mlx5e: IPsec, don't match upper proto selectors in crypto offload=
 TX

Cristian Ciocaltea (3):
      drm/display: hdmi: Prevent NULL pointer dereference in sync_scdc()
      drm/display: hdmi: Use committed state to decide on SCDC resync
      drm/display: hdmi: Reset sink scrambling on non-scrambled modesets

Cunhao Lu (1):
      gpio: rockchip: Fix debounce arithmetic for GPIO v2

Daejun Park (4):
      erofs: apply the stacked fs check to extra file-backed devices
      erofs: treat files shared by inode_share as stacked
      ovl: bump the impure dir version when linking a file with origin
      dm: fail a REQ_PREFLUSH bio with data when its preflush fails

Daniel Charles (1):
      drm/xe/pm: Apply tile workarounds after PCODE initialization

Daniel Machon (1):
      MAINTAINERS: Add myself as maintainer of the lan966x driver

Daniele Ceraolo Spurio (1):
      drm/xe/gsc: Fix NVL-S GSC compatibility number

Dani=C3=ABl Trujillo (1):
      ipv4: fib_trie: prevent speculative out-of-bounds child access

Dave Airlie (1):
      drm/nouveau/disp: Set
drm_mode_config_funcs.atomic_(check|commit) (attempt 2)

Dave Hansen (1):
      x86/mm: Ensure write visibility during LDT installation

Dave Young (1):
      Remove myself as a kdump reviewer

David Carlier (2):
      tracing/eprobe: Install the trigger for every instance that
enables the eprobe
      wifi: mac80211: fix unlocked STA statistics fallback

David Francis (2):
      drm/amdkfd: Acquire buffers in CRIU queue restore (again)
      drm/amdkfd: Acquire cwsr buffer during CRIU resume

David Rosca (1):
      drm/amdgpu: Fix VCE buffer size check for DPB and input surface

David Yang (4):
      net: dsa: motorcomm: Reread port flags on bridge joining
      net: dsa: motorcomm: Fix extack message on unsupported TC actions
      net: dsa: motorcomm: Resolve the flower action list to one ACL verdic=
t
      net: dsa: motorcomm: Delete the ACL rule of the port being unbound

Davidlohr Bueso (1):
      mctp: accept MSG_CMSG_COMPAT in recvmsg

Debarghya Kundu (1):
      gve: Fix backward stats when interface goes down or
configuration is adjusted

Denis V. Lunev (1):
      ovl: release the upperdir/workdir in-use locks before the umount sync

Dennis Chen (1):
      Revert "powercap: intel_rapl: Expose all package CPUs in PMU cpumask"

Devajith Jijush (1):
      ALSA: hda/conexant: Add quirk for Acer TravelLite TL05-41M

Dmitry Torokhov (4):
      gpio: sa1100: defer GPIO chip registration to postcore_initcall
      gpiolib: fix GPIO descriptor leak in gpiod_get_array()
      gpiolib: fix fast-path cancellation in gpiod_get_array()
      gpiolib: of: return -ENOENT from of_gpio_count() stub

Dnyaneshwar Bhadane (1):
      drm/xe/pat: Return error from xe_pat_init_early() on unknown platform

Eduardo Mucelli Rezende Oliveira (2):
      tools/bootconfig: Close only opened braces in compact output
      bootconfig: Trim unquoted values at end of file

Edward Adam Davis (1):
      dm cache: reject kcopyd client destory if it setup failed

Edward Cree (1):
      MAINTAINERS: remove and replace myself as sfc maintainer

Emanuele Ghidoli (1):
      ASoC: soc-core: reset rtd->num_components after allocation

Eric Biggers (1):
      tpm: Check return value of crypto_kpp_set_secret()

Eric Dumazet (17):
      tcp: bound snd_cwnd_clamp to TCP_MAX_SND_CWND
      calipso: do not charge request socket options to the listener
      tcp: rate limit receive queue collapsing
      net: gro: do not undo remote checksum offload on merged packets
      net: gro: invalidate frag0 after a pull
      net: wait for in-flight device unregistrations before netns dismantle
      inet: frags: bound the wmem charge of the socket completing a reassem=
bly
      bonding: fix slave_cnt leak on XDP enslave failure
      fou: gue: check IP version of held packets for direct IP encapsulatio=
n
      tcp: do not resurrect a former listener with SO_ATTACH_REUSEPORT_[CE]=
BPF
      udp: do not use a cross-family sk_rx_dst in early demux
      net: gro: compare skb->protocol in gro_list_prepare()
      net: virtio: fix UDP tunnel GSO header of VLAN tagged packets
      tun: clear stale skb->protocol of NAPI frags skbs
      net: virtio: validate outer protocol of UDP tunnel GSO packets
      nsh: limit recursion in nsh_gso_segment()
      selftests: net: add a test for NSH GSO

Erni Sri Satya Vennela (1):
      hv_netvsc: Stop PPI parsing on invalid metadata

Fa-Iz Faadhillah Ibrahim (1):
      ALSA: hda/realtek: Update quirk for Acer Predator PHN16-72

Felix Radensky (1):
      hwmon: (pmbus/mp2975) Get vout fault limits dynamically

Fernando Fernandez Mancera (2):
      netfilter: nft_reject: prevent unbounded recursion in output hooks
      netfilter: x_tables: check target name before accessing verdict

Filipe Manana (1):
      btrfs: zstd: prevent leak of workspace below maximum level

Filippo Falezza (1):
      wifi: ath10k: Stop unanswered temperature reads

Florian Bezdeka (2):
      entry: Fix return type of syscall_trace_enter()
      entry: Complete syscall_enter_from_user_mode_work() to bool migration

Florian Westphal (1):
      netfilter: nat: zero newrange before filling it in

Francesco Valla (1):
      spi: virtio: move teardown to .remove()

Fredric Cover (2):
      smb: client: fix out-of-bounds read in dfs_parse_target_referral()
      smb: client: fix double conversion of DFS path in setup_dfs_ref()

Gal Pressman (1):
      net/mlx5: Bridge, fix bogus MDB offload errors

Gao Xiang (1):
      docs: erofs: refine the on-disk overview

Gichoon Han (1):
      ALSA: usb-audio: Drop capture packets with bogus actual_length

Giuseppe Scrivano (3):
      ovl: do not always clear absolute_redirect
      ovl: follow lower to lowerdata redirects from any lower layer
      ovl: return EIO if the lowerdata is missing

Greg Thelen (1):
      kho: check fdt_phys in is_kho_boot()

Gregory Price (Meta) (11):
      mm/page_alloc: reset can_retry_reserves when the slowpath restarts
      mm/page_alloc: detect zonelist rebuilds from memory hot-add
      mm/mmzone: read the zoneref slot once in zonelist_zone()
      mm/page_alloc: snapshot the preferred zone against shrink rebuilds
      mm/mmzone: read each zoneref slot once when filtering by nodemask
      mm/page_alloc: retry allocations that raced with a zonelist rebuild
      mm/hugetlb: retry the pool walk when the zonelist is rebuilt
      mm/page_alloc: retry alloc_contig_pages() when the zonelist is rebuil=
t
      mm/mempolicy: read the zoneref slot once in mempolicy_slab_node()
      mm/mmzone: remove zonelist_node_idx()
      mm/page_alloc: don't undo another isolation in alloc_contig_range

Guanglei Zhu (1):
      tpm: eventlog: check the payload size before reading tag events

Guangshuo Li (2):
      gpio: brcmstb: fix UAF after IRQ domain setup failure
      gpio: mpc8xxx: Fix potential use-after-free of IRQ domain

Guenter Roeck (4):
      watchdog: sp5100_tco: Use release_mem_region() for EFCH MMIO resource
      watchdog: mediatek: Register reset controller before watchdog device
      hwmon: (gpio-fan) Fix runtime PM imbalance in probe and teardown
      watchdog: omap: Fix early_enable handling in omap_wdt_probe()

Guixiong Wei (1):
      KEYS: do not let an unmatched key decide the search result

Gustavo Sousa (1):
      drm/xe: Sync Wa_16023105232 in xe_was to match OOB rule

Hamza Mahfooz (2):
      MAINTAINERS: add myself as a maintainer for the Hyper-V DRM driver
      net: mana: report RX checksum offload for IPv6

Hangbin Liu (1):
      mailmap: add entries for Hangbin Liu

Helen Koike (1):
      drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET programming for pre-Xe=
2

Hengyu Liang (1):
      x86/video: Preserve the default VGA fallback for legacy modes

Heyang Tan (1):
      wifi: nxpwifi: validate monitor RX extra-header length

Huacai Chen (1):
      ACPI: LoongArch: Validate ACPI IOVT device entries

Hungyu Lin (4):
      vfs: preserve subsecond timestamps at filesystem time limits
      timekeeping: Read getboottime64() offsets under the sequence counter
      tsacct: Keep task begin times stable across suspend
      coda: honor the append state of each write

HyeongJun An (2):
      ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420
      fs/adfs: bound directory entry name length in adfs_fplus_getnext()

Hyunjung Ko (1):
      tpm: flush timeout work outside buffer_mutex to avoid deadlock

Hyunwoo Kim (2):
      tcp: do not coalesce segments after FIN
      tcp: fix request_sock use-after-free during Fast Open accept()

Ian Bridges (6):
      ksmbd: grant a caller what its groups and OWNER RIGHTS ACEs allow
      ksmbd: skip metadata-only opens in sharing checks
      ksmbd: skip metadata-only stream opens in the delete check
      ksmbd: evaluate the DACL in order for explicit access requests
      ksmbd: let the parent's DACL grant DELETE and FILE_READ_ATTRIBUTES
      ksmbd: keep group denials when a POSIX ACL entry decides access

Ian Ray (1):
      mmc: sdhci-esdhc-imx: map unsupported driver type to Type B

Ian Rogers (2):
      vdso: Add VDSO_UNALIGNED_PACKED config option
      tools headers: Update the vdso/unaligned.h copy with the kernel sourc=
es

Igor Velkov (6):
      mmc: meson-gx: name the limit of the CMD_CFG timeout field
      mmc: meson-gx: honour the busy timeout for R1b commands
      mmc: meson-gx: report busy from DAT0 alone
      mmc: meson-gx: report the longest busy wait the controller can do
      watchdog: orion_wdt: load the pretimeout counter on Armada 370/XP sta=
rt
      watchdog: meson_gxbb_wdt: fix suspend/resume handling of
HW_RUNNING watchdog

Imre Deak (6):
      drm/i915/dp_aux: Take the TypeC port lock after the PPS lock
      drm/i915/pps: Hold a TypeC link reference for PPS VDD
      drm/i915/pps: Reset PPS state after TypeC port init on resume
      drm/i915/ptl+: Add TypeC HPD pin selection for port B
      drm/i915/mtl+: Use PHY type to identify TypeC ports in PLL ID lookup
      drm/i915/ptl+: Fix TypeC detection for eDP on port B

Isaac Adjei (1):
      gpio: mpfs: reject unsupported interrupt types

Iustin Stolniceanu (1):
      net: phy: c45: select BASE-T1 type for the forced speed

Ivan Lipski (1):
      drm/amd/display: Fix __udivdi3 link error in DCN6 DML2

Ivan Vecera (3):
      dpll: notify about a reference sync pair only if it was added
      ice: dpll: serialize changes of the SyncE CGU registers
      ice: dpll: set the SyncE divider only for the port driving the output

Iv=C3=A1n Ezequiel Rodriguez (1):
      netfs: preserve prepare_write errno on reissue

Jaehoon Kim (2):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
      ASoC: amd: acp70: Add rt713 + rt1320 SoundWire machine for LG gram 16=
Z95U

Jaewon Jung (1):
      selftests/ftrace: Add missing spaces after ! in probe syntax tests

Jagmeet Randhawa (2):
      drm/xe/guc: Fix race around q->guc->suspend_pending access
      drm/xe/guc: Do not attribute a TDR disable to a pending suspend

Jakub Kicinski (2):
      tls: Break the connection after a burst of empty data records
      selftests: tls: Cover the cap on consecutive empty records

Jamal Hadi Salim (4):
      net/sched: act_ife: encode configured zero metadata values
      net/sched: act_ife: require a full Ethernet header on egress
      net/sched: sch_teql: reject qdiscs from another network namespace
      selftests: tc-testing: teql: cover each attach rejection on its own

James Clark (1):
      net: stmmac: ptp: fix support for PTP_EXTTS_REQUEST2 ioctl

Jan Beulich (1):
      Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()

Jann Horn (1):
      cipso: stop modifying live ip_options_rcu

Janne Grunau (1):
      ASoC: apple: mca: Fix clock selection for clock consumer FEs

Jarkko Sakkinen (3):
      KEYS: Expand key->{datalen,quotalen} to unsigned int
      KEYS: Reject descriptions larger than KEY_MAX_DESC_SIZE
      KEYS: Verify the key identity in __key_unlink_begin

Jason Andryuk (1):
      x86/CPU/AMD: Don't print reset reason in VMs

Jay Vadayath (1):
      dm-raid: bound array_position before indexing failed_devices

Jean-Paul Sergent (1):
      net: dst_metadata: fix memcmp overread in skb_metadata_dst_cmp

Jeff Layton (4):
      statx: don't leak STATX_ATTR_CHANGE_MONOTONIC in stx_attributes_mask
      NFS: don't let delegated c/mtime stamps go backward
      NFS: stamp after the server's ctime when truncating under delegated t=
imes
      NFS: stamp after the server's ctime following a CLONE

Jens Axboe (1):
      net: leave O_NONBLOCK to the sendmsg and recvmsg syscalls

Jerome Mohm (1):
      vsock/virtio: clear vqs[] to avoid a UAF on a failed PM restore

Jesper L. Nielsen (1):
      net: ethernet: ti: am65-cpts: keep port and direction when
matching PTPv1 TX timestamps

Jesse Zhang (3):
      drm/amdkfd: skip GPUs without a VM when checkpointing the BO mappings
      drm/amdgpu: fix the error handling of amdgpu_vm_init_entities()
      drm/amdgpu: release the IMU firmware with the other GFX microcode

Jiabin Deng (1):
      net/mlx5e: SHAMPO, Disable end padding when relaxed ordering is suppo=
rted

Jiahao Xu (1):
      net: usb: cdc_ncm: don't underflow the NDP room check

Jiayuan Chen (1):
      net: raw: fix ICMP unreachable sent when receive queue is full

Jinjie Ruan (3):
      LoongArch: kexec_file: Fix a modified cmdline leak
      LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
      arm64: kexec_file: Do not use CMA for images with a non-zero text_off=
set

Jinseob Kim (1):
      gpiolib: reset lookup flags for each hogged line

Jiwoo Kim (1):
      ksmbd: pin parent dentries in SMB2 CREATE ACL path

Joanne Koong (5):
      nilfs2: convert iomap ops to ->iomap_next()
      fuse: convert ext_map iomap ops to ->iomap_next()
      iomap: remove ->iomap_begin()/->iomap_end() legacy path
      iomap: pass iomap_iter_next_fn directly instead of struct iomap_ops
      Documentation: iomap: update docs to reflect iomap_iter_next model

Joas Antonio dos Santos (3):
      netfilter: nf_conntrack_sip: fix OOB read in ct_sip_parse_transport()
      openvswitch: advance by the real header length in get_ipv6_ext_hdrs()
      gtp: free the skb after handling an echo response

Joe Finzel (1):
      drm/nouveau/gsp: only handle GSP interrupts routed to the host

Johannes Berg (3):
      wifi: mac80211: mesh: don't linearize SKBs unnecessarily
      wifi: mac80211: fix use-after-free on TTLM disconnect
      wifi: nl80211: fix ERR_PTR use on wdev disappearance

Johannes Thumshirn (6):
      btrfs: zoned: only change active zone counter on successful (de)activ=
ation
      btrfs: zoned: fix possible UAF in wait_eb_writebacks()
      btrfs: zoned: requeue block group if zone reset bails out
      btrfs: zoned: avoid underflow of space info bytes_zone_unusable
      btrfs: zoned: don't wait for ordered extents in do_zone_finish()
      btrfs: zoned: fix lockdep splat on mount

Josef Bacik (8):
      mm/page_alloc: keep the pagesets of an empty zone
      mm, page_alloc: pass zone pointer to trace_reclaim_retry_zone
      mm/page_alloc: clear ->private of deferred free pages
      mm: page_frag: refill the cache for large fragments
      mm: page_isolation: do not take slab pages for free
      mm/memory_hotplug: resize zones under their seqlock
      dcache: wait for a racing eviction of a secondary root
      dcache: let umount find a disconnected ex-mountpoint

Josef Schlehofer (1):
      dm-crypt: defer async write submission to write thread

Joseph Qi (3):
      smb: client: skip NULL channel in __cifs_put_smb_ses()
      smb: client: hold server ref while queueing reconnect work
      smb: client: hold the inode across cifs_oplock_break()

Joshua Mulloy (1):
      memstick: core: don't clear dev->driver in memstick_device_remove()

Jouni H=C3=B6gander (4):
      drm/i915/psr: Flush on cursor update also when not using Selective Fe=
tch
      drm/i915/display: Flush the fbdev frontbuffer
      drm/i915/psr: Re-arm PSR after flush
      drm/i915/psr: Clear CFF state on flip flush

Jude Gyimah (1):
      ALSA: aw2-alsa: select SND_PCM

Juergen Gross (1):
      xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest

Jun Yang (1):
      net: bridge: use one headroom snapshot for ND replies

Junyoung Jang (1):
      igmp: use the joined device when leaving a multicast group

J=C3=A9r=C3=A9my Jean (5):
      crypto: caam - reject overlong RSA CRT parameters
      crypto: essiv - fix use-after-free in AEAD path
      tcp: fix authentication bypass via unsupported TCP auth options
      ovl: reject different lower idmaps on the same fs
      selftests: overlayfs: reject different lower idmaps on same fs

Kailang Yang (1):
      ALSA: hda/realtek - remove headphone MIC support for Dell Pro QC1255

Kalpesh Solanki (1):
      tun: disallow setting IEEE 802.15.4 and 6LoWPAN link types via TUNSET=
LINK

Kanala Ramalingeswara Reddy (1):
      drm/amdgpu: use supported SMU clock messages on SMU 15.0.0

Kang Chen (1):
      sched_ext: make DSQ iterator stay drained after NULL

Kang Yang (1):
      wifi: ath12k: set MSDU payload correctly

Karl Mehltretter (1):
      mmc: sdhci-brcmstb: don't log an error for missing BOOT registers

Karthik Poosa (5):
      drm/xe/hwmon: Fix pcode power limit handling
      drm/xe/hwmon: Decode mailbox temperature as sign-magnitude
      drm/xe/hwmon: Fix thermal sensor data handling
      drm/xe/hwmon: Add helpers to validate thermal sensor readings
      drm/xe/hwmon: Handle unavailable memory controller sensors

Kavitha Daula (1):
      xen/grant-table: annotate on-stack work in gnttab_unmap_refs_sync()

Kees Cook (1):
      spi: axi-spi-engine: Start the program length at zero

Kirtikumar Anandrao Ramchandani (2):
      dm: Reject table setup after queue or disk teardown
      dm cache: validate the discard block size before narrowing

Kiryl Shutsemau (Meta) (4):
      virtio_console: copy pipe buffers in splice_write()
      fuse: don't move pipe buffers into the page cache
      splice: remove pipe buffer stealing
      splice: replace nosteal_pipe_buf_ops with default_pipe_buf_ops

Kuba Piecuch (1):
      sched_ext: Read exit_kind before flushing in scx_flush_disable_work()

Kuniyuki Iwashima (6):
      af_unix: Convert unsigned long to u64 for GC.
      af_unix: Remove gc_in_progress check in unix_peek_fpl().
      net: Fix memory_allocated leak in __sk_mem_raise_allocated().
      tcp: Clear DEFER_CONNECT before tcp_connect() and in tcp_abort().
      selftest: packetdrill: Add test for DEFER_CONNECT.
      tcp: Pass req->rsk_listener to inet_csk_reqsk_queue_drop() in
tcp_check_req().

Kyle Pepper (1):
      Bluetooth: reject invalid LE supervision timeout relationships

Kyle Zeng (11):
      macsec: reject frames that decapsulate into runt Ethernet frames
      ipv4: keep XFRM headers out of corked skb lengths
      net: skbuff: preserve fclone lifetime when freeing stolen heads
      net: protect negative destination advice with RCU
      net: require a full socket in sock_confirm_neigh()
      ipvlan: make outbound skb headers writable
      net: gro: avoid parsing headers from shared fragments
      mptcp: reject DATA_ACKs against a reversed send interval
      udp: check frag_list IP family before using skb_segment_list()
      net/rds: Do not unpin a page after a failed atomic pin
      sctp: avoid requeueing pending control chunks

Kyrylo Biryuk (2):
      dm zoned: back off when reclaim cannot make progress
      dm zoned: do not reclaim a random zone into another random zone

Lachlan Hodges (1):
      wifi: mm81x: report non-1MHz frames on the 1MHz control freq

Lad Prabhakar (2):
      watchdog: rzv2h: Use pm_runtime_put_sync()
      watchdog: rzv2h: Drop runtime PM handling from WDTDCR init

Laveesh Bansal (1):
      netfilter: bridge: use DEBUG_NET_WARN_ON_ONCE in nf_ct_bridge_refrag(=
)

Li RongQing (2):
      cpufreq: acpi-cpufreq: fix P-state index mismatch in extract_io()
      team: fix promisc/allmulti leak in team_port_add error path

Li Youhong (1):
      dm-raid: fix use-after-free in raid_dtr()

Li Zhaoxin (1):
      cpufreq: intel_pstate: Use rdmsrq_safe() to read MSR_MISC_PWR_MGMT

LiangCheng Wang (1):
      ASoC: max98090: keep the MIC boost across mic input power-up

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for RYDZ
Technology Piva AC20

Lijo Lazar (1):
      drm/amdgpu: Allow cancelling a requested NPS mode

Linus Torvalds (1):
      Linux 7.4-rc3

Linus Walleij (1):
      spi: dt-bindings: pl022: Allow a power domain

Long Zhao (1):
      gpio: regmap: free the irqchip if adding the irq domain fails

Lorenzo Bianconi (1):
      wifi: ath12k: fix decap of MSDUs spanning multiple RX buffers

Lo=C3=AFc Kassel (1):
      wifi: mac80211_hwsim: use CLOCK_BOOTTIME for the beacon timer

Luiz Augusto von Dentz (1):
      Bluetooth: Fix not updating of hdev->commands[] after reset

Luka Gejak (2):
      wifi: rtw88: move the bmc high queue decision to tx.c
      wifi: rtw88: sdio: limit the high queue to DTIM delivery

Maciej Fijalkowski (8):
      xsk: fix list corruption in xsk_buff_add_frag()
      i40e: xsk: fix xsk_buff_add_frag() error handling in Rx
      ice: xsk: fix leaking Rx buffers in multi-buffer path
      ice: xsk: do not free in-flight frags on XDP_TX completion
      libeth: xsk: do not free in-flight frags on XDP_TX completion
      xsk: do not clear frags flag when acquiring a buffer
      ice: xsk: free stashed Rx frame when cleaning the ring
      idpf: free stashed XSk Rx frame when releasing the queue

Mahanta Jambigi (2):
      net/smc: fix lgr/lnk lifetime vs diag reader race
      net/smc: fix link group ownership in handshake abort

Mani Tofigh (7):
      cgroup: arm the notify timer only while the file exists
      eventpoll: wake the next waiter when a woken waiter is killed
      cgroup/freezer: walk exiting tasks in the v1 freezer
      kprobes: Disarm disabled optprobe on forced unoptimization
      kprobes: Do not disarm unhashed optprobe on dispatch
      kprobes: Arm reused optprobe on cooling list
      btrfs: fix bio counter and bioc leak when async checksumming fails

Manuel Ebner (1):
      docs, kprobes: Fix bracket

Mario Limonciello (1):
      ASoC: SOF: amd: Load alternatively signed firmware with an "_l" suffi=
x

Mark Bloch (1):
      net/mlx5: Lag, free steering resources on LAG destroy failure

Mark Brown (3):
      arm64: suspend: Save POR_EL0 over suspend
      arm64: suspend: Save GCS state over suspend
      arm64/gcs: Ignore attempts to change GCS mode during signal return

Mark Bundschuh (1):
      dm: fix infinite loop in dm_blk_do_report_zones()

Mark Korenberg (2):
      ublk: publish a new device by its id only once it is set up
      ublk: don't take ublk_ctl_mutex in DEL_DEV

Masami Hiramatsu (Google) (19):
      kprobes: Fix error return and slot leak in __register_kprobe()
      kprobes: Fix double free and NULL deref in unregister_kretprobes()
      kprobes: Validate re-registration earlier in register_kretprobe()
      samples/kprobes: Use trace_printk() in probe handlers
      samples/fprobe: Use trace_printk() and trace_dump_stack()
      docs: trace: Warn against using printk() in probe handlers
      kprobes: Switch ftrace ops when adding probe with post_handler
      kprobes: Fix UAF and queue cooling probes on forced unoptimization
      kprobes: Do not overwrite jump instruction when re-arming
unoptimizing probe
      kprobes: Re-optimize blocked sibling probe when cooling finishes
      tracing/probes: Check enabled and busy state before unlinking
sibling probes
      tracing/probes: Enable newly appended probe when target event is enab=
led
      tracing/probes: Fix BTF bitfield parsing and out-of-bounds buffer wri=
te
      tracing/probes: Fix missing BTF kind checks in char pointer/array hel=
pers
      tracing/eprobe: Fix 1-byte signed field fetch in get_event_field()
      tracing/eprobe: Disallow attaching eprobes to fprobe events
      tracing/probes: Fix user-space dereference string array store type
      tracing/probes: Reject array count on non-dereference string sources
      tracing/uprobes: Fix memory leak of tail in __trace_uprobe_create()

Matthew Auld (1):
      drm/xe/madvise: use already clamped pat_index

Ma=C3=ADra Canal (3):
      drm/vc4: Hold a runtime PM reference while allocating the binner BO
      drm/vc4: Rebuild the V3D interrupt mask on every power transition
      drm/vc4: Re-enable the V3D interrupt after a GPU reset

Mehmet Fide (3):
      wifi: ath9k_htc: do not start ANI before the first channel is set
      wifi: ath9k_htc: start ANI when an AP interface begins to beacon
      wifi: mac80211: abort chanswitch when leaving an IBSS

Miaoqing Pan (1):
      wifi: ath12k: Fix failure to create ath12k_dp_peer on MLO reconnect

Michael Buesch (1):
      wireless: Remove me as ssb maintainer

Michael McAllister (1):
      ASoC: qcom: q6asm: Reset PCM positions when preparing a stream

Michael Roth (1):
      crypto: ccp - Make usage of sev_cmd_mutex more granular

Michail Andreas Michalopoulos (2):
      netfilter: flowtable: extend ct timeout of offloaded GRE flows
      ksmbd: refuse reauthentication of an expired session as another user

Miguel Ojeda (1):
      kbuild: rust: support stabilized flag `-Cprofile-sample-use` for
Rust >=3D 1.100

Mikael Magnusson (1):
      ALSA: pcm: update state after xrun

Mike Rapoport (Microsoft) (1):
      LoongArch: Restore KFENCE pages through DMW on resume

Mike Snitzer (3):
      NFS/localio: hold the client across an asynchronous LOCALIO probe
      NFS/localio: probe again for LOCALIO when localio_enabled is set to Y
      NFS/localio: give the LOCALIO probe a short timeout of its own

Mikulas Patocka (10):
      dm-sysfs: fix misbehavior if kobject_init_and_add fails
      dm-cache: fix NULL pointer dereference on open failure
      dm-cache: fix ending a cursor that never began
      dm-thin: fix data corruption if discard races with regular I/O
      dm-thin: fix leak if __set_snapshot_details fails
      dm-thin: fix parsing of feature arguments
      dm persistent data: test return value of node_copy
      dm persistent data: don't ignore writeback errors
      dm persistent data: don't leak bufio buffer if find_leaf fails
      dm-integrity: don't attempt to commit journal on disabled device

Ming-Hung Tsai (1):
      dm: fix use-after-free when dm_get_device() widens the open mode

Namjae Jeon (1):
      ntfs: silence kmalloc/kvfree mismatch warning

Nitin Gote (1):
      drm/xe/tuning: Restrict Anyhit NULL-query tuning to render engines

Ofri Zangi (1):
      tls: fix async encryption race on weakly ordered architectures

Olga Kornievskaia (2):
      NFSv4: wake blocking lock waiters when a delegated lock is released
      NFSv4: remember that the server may send CB_NOTIFY_LOCK

Olivier Louvignes (2):
      mmc: jz4740: Remove the host before resetting the controller
      ASoC: cs43130: Power the playback path down when the stream closes

Omar Ramadan (1):
      amt: tear down every amt device on an unregistering lower

Or Har-Toov (1):
      net/mlx5e: Add missing Ethernet multicast octets to vport_rx_bytes su=
m

Orgad Shaneh (1):
      net: mana: fix XDP_REDIRECT of pre-allocated RX buffers

P Praneesh (1):
      wifi: ath12k: fix IRQ disable imbalance in AHB ext interrupt handler

Pablo Mazzini (1):
      hwmon: (sy7636a) fix negative temperatures

Pablo Neira Ayuso (1):
      netfilter: nf_tables: fix memleak when rule deletion fails with
hardware offload

Paolo Bertinetti (2):
      tracing/perf: Clear stop state in perf_trace_add()
      perf/hw_breakpoint: Clear stop state in hw_breakpoint_add()

Paulo Alcantara (19):
      smb: client: don't write back through O_DIRECT handles
      netfs: keep the prepare_read errno when abandoning read retries
      netfs: don't hang a read whose retry is abandoned
      smb: client: let umount -f abort retried reads and writes
      smb: client: don't give up writeback on the first replayable error
      smb: client: don't retry failed writes forever regardless of mount op=
tions
      smb: client: don't spend read retries on reads cut short by a reconne=
ct
      smb: client: don't block dying tasks waiting for writeback on close
      smb: client: issue writes from a worker if the task is dying
      smb: client: don't fail writeback preparation if the task is dying
      smb: client: retry writeback on interrupts and allocation failures
      smb: client: don't block dying tasks waiting for writeback on fsync
      smb: client: retry writes that couldn't be issued due to a reconnect
      smb: client: retry writeback after losing the connection, share or ha=
ndle
      smb: client: let umount -f stop waiting for reconnects on hard mounts
      smb: client: don't replay handle reopens inside SMB2_open()
      smb: client: fail writeback sends and reopens fast when the server is=
 gone
      smb: client: stop reconnecting and replaying during a forced unmount
      smb: client: flush deferred handles of other names before a hard link=
 open

Pengpeng Hou (1):
      drm/bridge: sii902x: validate I2S data lane values

Perry Yuan (1):
      drm/amdkfd: check CRIU SVM priv data bounds before allocating

Phat Dinh (1):
      perf/core: Do not resurrect cpuctx->cgrp after last cgroup event exit

Pin-yen Lin (3):
      gve: Fix race between stats query and queue reconfig
      gve: Block invalid ring sizes when device options are 0
      gve: Fix link flap after ethtool ops

Prathamesh Deshpande (1):
      net/mlx5e: IPoIB, Fix QPN lookup race

Qihang (1):
      xen/privcmd: fix double free when an irqfd is shut down twice

Qiwen Gong (1):
      watchdog: sc1200wdt: add missing MODULE_DEVICE_TABLE()

Qu Wenruo (1):
      btrfs: do not insert the data reloc tree into fs_roots_radix

Raag Jadav (8):
      drm/xe/ras: Fix sysctrl and drm-ras discrepancy
      drm/xe/gt: Use GT ordered workqueue for wedging
      drm/xe: Drop xe_device_set_wedged_method()
      drm/xe/hw_error: Guard csc_hw_error_work() with runtime PM
      drm/xe: Move xe_device_wedged_fini() registration to
xe_device_probe_early()
      drm/xe: Make xe_device_declare_wedged() IRQ safe
      drm/xe/pci_error: Flush GT wedge worker before bus reset
      drm/xe/amc: Guard xe_amc_work() with runtime PM

Rafael J. Wysocki (6):
      cpufreq: Improve suspend-resume synchronization
      cpufreq: Force passing target frequency to driver during resume
      cpufreq: intel_pstate: Clear last written P-state value on suspend
      cpufreq: Cache post-resolution target frequency in __resolve_freq()
      cpufreq: Fix updates of cached resolved frequency and index
      PM: runtime: Update last_busy in rpm_resume() for active devices

Rahad Bhuiya (1):
      sched_ext: Reset task fields on exit of an SCX_TASK_READY task

Randy Dunlap (1):
      fs: porting.rst: use literal string to avoid warning

Ridong Chen (5):
      cgroup/cpuset: Reset partition data when an invalid partition
stays invalid
      cpuset: settle isolation state when CPUs are given back to parent
      cpuset: generalize the validate_partition() interface
      cgroup/cpuset: Remove redundant WARN_ON_ONCE() in remote_cpus_update(=
)
      cgroup/cpuset: Don't revive invalid partition without active CPU
on hotplug

Rishikesh Jethwani (2):
      tls: only install push_pending_record for a TX context
      selftests: net: add TLS 1.2 hardware offload tests

Rodrigo Vivi (1):
      drm/xe: Fix build with DRM_XE=3Dy and CONFIGFS_FS=3Dm

Rongzheng Wang (2):
      xsk: defer software checksum until the skb is complete
      selftests/bpf: cover AF_XDP multi-buffer TX software checksum

Runyu Xiao (1):
      mmc: omap: synchronize clock timer before disabling fclk

Rupesh Majhi (1):
      hwmon: (aht10) Fix update_interval overflow on 64-bit

Samuel Leyva (2):
      ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
      ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec outp=
ut

Sandipan Das (1):
      perf/x86/amd/uncore: Avoid context migration from non-owners

Saranya Gopal (1):
      ACPI: s2idle: Handle shared _Ixx GPEs without an EC

Sasha Levin (6):
      ACPI: scan: Print the offline failure message in acpi_bus_offline()
      ACPI: scan: Do not hold physical_node_lock across
device_offline() and device_online()
      selftests/statmount: fix format warnings on 32-bit and s390
      selftests/mount_setattr: build with a 64-bit off_t
      selftests: probe for sanitizer support in fchmodat2 and openat2
      selftests/fs/mount-notify: fix the indentation in the fsmount test

Satyanarayana K V P (4):
      drm/xe: Prevent VF memory IRQ from accessing a torn-down engine
      drm/xe/guc: Protect timeout handling from device unplug
      drm/xe/gt: Disable GT reset worker before engine teardown
      drm/xe/pf: Program LMTT directory pointer from each GT's init path

Seiji Nishikawa (1):
      sched/core: Do not touch SMT siblings that have not joined the core y=
et

Sergei Nizovtsev (1):
      ALSA: caiaq: Kill EP1 URB before unregistering the input device

Shashank Mohan Jain (2):
      errseq: don't let errseq_check_and_advance() hide later errors
      lib/tests: errseq: add a concurrent check_and_advance test

Shawn Guo (4):
      gpio: shared-proxy: Fix race between concurrent first users
      gpio: shared-proxy: Drop the vote of a released proxy on write failur=
e
      gpio: shared-proxy: Drive the default value when no votes are cast
      gpio: shared-proxy: Drop the vote when switching to input

Shay Drory (1):
      net/mlx5: E-switch, Restore host PF enable for ECPF that isn't
E-switch manager

Shengyu Qu (1):
      ALSA: usb-audio: Add native DSD support for NiceHCK Octave

Shigeaki Asai (1):
      drm/meson: encoder_dsi: load ENCL gamma table while ENCL is disabled

Shuah Khan (1):
      selftests/filesystems: Fix run_fat_tests hang

Shuai Zhang (1):
      power: sequencing: qcom-wcn: increase WCN7850 power-up delay

Shubhang Kaushik (Ampere) (1):
      sched_ext: Reject scx_bpf_destroy_dsq() in tracing programs

Shuicheng Lin (1):
      drm/xe: Mark xe_vma_ops_alloc() noinline for error injection

Siddharth Chintamaneni (2):
      fs: reject negative offsets for SEEK_DATA and SEEK_HOLE in
default_llseek()
      fs: use must_set_pos() in default_llseek()

Siddharth Mishra (1):
      btrfs: tree-checker: reject extent owner ref without simple quota

Sinan Polat (1):
      dm-integrity: don't recalculate with HMAC because of a dirty bitmap

Stanislav Aleksandrov (4):
      hwmon: (max31760) Fix the local temperature limit registers
      hwmon: (max31760) Leave standby mode at probe
      hwmon: (max31760) Report 0 RPM before the first fan speed measurement
      watchdog: gunyah_wdt: Re-enable the watchdog on resume

Stanislavs Nilovs (1):
      Bluetooth: qca: Disable SoC debug logging for WCN3950

Stanley Jhu (1):
      PM: runtime: Update runtime_pm.rst for non-fatal resume errors

Stefan Binding (1):
      ALSA: hda: cs35l41: Override malformed _DSD properties for various la=
ptops

Stefan Haberland (4):
      s390/dasd: Fix typo 'immediatly' -> 'immediately'
      s390/dasd: Re-initialize RCD buffer with "V1.0" before every start
      s390/dasd: Fix wrong free and refcount leak in build_check_tcw error =
path
      s390/dasd: Don't trust userspace-supplied result field in format chec=
k

Stefano Munari (1):
      net: usb: lan78xx: resume phylink on non-reset USB resume

Steffen Klassert (1):
      MAINTAINERS: Add the new IPsec list and patchwork instance

Steven Rostedt (1):
      tracing/selftests: Fix false bashism in kprobe_non_uniq_symbol.tc

Sudeep Holla (2):
      hwmon: (scmi) Check channel config allocation
      hwmon: (scmi) Configure sensors before exposing channels

Suravee Suthikulpanit (1):
      iommu/amd: Force device table to maximum size

Svyatoslav Ryhel (1):
      drm/bridge: ssd2825: Fix panel enable sequence

Takashi Iwai (2):
      tpm: acpi: Fix memory leak at tpm_read_log_acpi() error path
      Revert "ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2"

Tao Cui (4):
      LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
      LoongArch: KVM: Propagate real error code in kvm_pch_pic_create()
      LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
      sched_ext: Reject DSQ iterator kfuncs in tracing programs

Tapio Reijonen (1):
      net: dsa: microchip: initialize the IRQ access mutex

Tejas Upadhyay (3):
      drm/xe: Re-validate external pin under resv lock before VRAM purge
      drm/xe: Drop RCU list handling for VRAM bad-page tracking, use mgr->l=
ock
      drm/xe: Keep VRAM fault injection within the usable range

Tejun Heo (6):
      sched_ext: Fix scx_bpf_dsq_reenq() kerneldoc claiming NMI calls
are allowed
      sched_ext: Call ops.sub_attach() only while the cgroup is online
      sched_ext: Fix stale pick when the donor changes during dispatch
      sched_ext: Factor out drain_offline_rq()
      sched_ext: Fix ops.enqueue/dispatch() calls before ops.cpu_online()
      cgroup/freezer: Fix exiting tasks left frozen forever after rmdir

Teshan Kannangara (1):
      xen/platform-pci: Disable device before releasing PCI regions

Thomas Fourier (1):
      net/mlx5e: TC, Fix double free of branch in failure

Thomas Hellstr=C3=B6m (1):
      drm/xe: Don't abort the shrinker walk on -EBUSY

Tianyi Gao (2):
      net: fix mac_len of skbs copied by generic XDP
      selftests: drv-net: ping: test generic XDP redirect to cpumap

Tiezhu Yang (2):
      LoongArch: BPF: Make arena support depend on 128-bit cmpxchg
      LoongArch: BPF: Make use of beqz and bnez for trampoline branches

Tim Budding (4):
      sctp: abort unordered partial delivery when its message is skipped
      sctp: report the partially delivered MID in PARTIAL_DELIVERY_ABORTED
      sctp: fix I-FORWARD-TSN handling of fragments on other streams
      selftests: net: add SCTP I-FORWARD-TSN tests with message interleavin=
g

Tim Menninger (5):
      xprtrdma: serialize unmap_sync with xprt_disconnect
      pNFS: avoid repeatedly cancelling I/O for the same lseg
      SUNRPC: add request-scoped disconnects when cancelling tasks
      NFSv4/flexfiles: limit transport disconnects when cancelling I/O
      NFSv4: Prevent indefinite waits for out-of-order OPEN stateids

Timur Krist=C3=B3f (1):
      drm/amdgpu/vce1: Fix checking whether VCE1 is idle

Tristan Madani (1):
      wifi: nxpwifi: validate scan response TLV sizes before indexed access

Tu Dinh (2):
      xen-netback: Fix XenBus connection failure cleanup
      xen-netback: Zero out sring pointers on unmap

Tvrtko Ursulin (1):
      drm/sched: Ensure stopped entity cannot be re-added to the run-queue

Tyler Baker (2):
      ASoC: soc-core: copy the DAI link names into the card
      ASoC: qcom: x1e80100: recreate the headset jack on card rebind

Uladzislau Zhauniarovich (1):
      arm64: suspend: Only track cpuidle context for idle tasks

Umang Pokhriyal (1):
      tun: delete the flow entries of the moved queue on detach

Uri Dar (1):
      net/mlx5: Lag, Return error when enabling MPESW without LAG support

Varun Gupta (1):
      drm/xe/guc: Demote uncorrectable local error log on CRI

Viacheslav-Illia Detsyk (1):
      ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41

Vijendar Mukunda (2):
      ASoC: amd: ps: guard adata->sdw dereferences with NULL check in
IRQ handler
      ASoC: SOF: amd: guard adata->sdw dereferences with NULL check in
IRQ handler

Vinay Belgaumkar (2):
      drm/xe: Toggle the D3Cold enable flag at runtime resume
      drm/xe: Access GT MMIO after pcode init

Vishal Gupta (1):
      wifi: nxpwifi: synchronize scan cancellation state

Vishwaroop A (3):
      spi: tegra210-quad: don't overwrite refreshed status with
lost-IRQ snapshot
      spi: tegra210-quad: Track DMA mapping state
      spi: tegra210-quad: Unmap DMA buffers on transfer timeout

Vlastimil Babka (SUSE) (1):
      mm/page_alloc: remove the zone_spans_pfn() check from
get_pfnblock_bitmap_bitidx()

Wahid Khan (5):
      ntfs: check the file name against the key length of an index entry
      ntfs: do not read an index block outside $INDEX_ALLOCATION
      ntfs: open the index allocation before reading or writing an index bl=
ock
      ksmbd: refuse to read a handle that is not open for reading
      wifi: cfg80211: don't truncate the merged MBSSID profile length

Waiman Long (6):
      cgroup/cpuset: Fix incorrect CPU accounting with parent's
effective_xcpus expansion
      cgroup/cpuset: Recompute effective cpumask in
update_cpumasks_hier() after calling update_parent_effective_cpumask()
      cgroup/cpuset: Do housekeeping check when isolated child with
root parent may get more xcpus
      selftests/cgroup: Fix "test_cpuset_prs.sh -v" failures
      cgroup/cpuset: Protect current->mems_allowed read in cpuset_fork()
      cgroup/cpuset: Correctly set isolated_cpus when switching partition s=
tate

Wei Wang (2):
      net: Make PSP skb extension survive packet scrubbing
      selftests/net: psp: test bidirectional data transfer

Weijiang Zhou (1):
      dm-verity: don't restart or panic on errors during system shutdown

Weiming Shi (1):
      sctp: reset stored flag for each association

Wenbo Sun (2):
      af_unix: Inherit SO_INQ in unix_stream_connect()
      amt: use ipv6_hdr() in amt_mldv1_leave_handler()

Wentao Liang (2):
      gpio: keep the chip reference when deferred setup fails
      drm/vc4: Fix firmware reference leak in vc4_hvs_bind()

Wenwen Fu (1):
      tracing: skip boot kprobe setup when no events were requested

Willem de Bruijn (1):
      docs: netdev: fix iproute2 process documentation

Xia Yan (2):
      ipv6: fix cached route reuse for control messages
      selftests: net: exercise SO_MARK on connected sockets

Xingyuan Mo (2):
      netfilter: nft_set_rbtree: check catchall_sync return before queue_do=
ne
      ntfs: fix out-of-bounds write race in NTFS_IOC_LIST_STREAMS

Xu Rao (1):
      hwmon: (scmi) Enable temperature sensors using their sensor IDs

Xuanqiang Luo (1):
      net/mlx5e: kTLS, Fix missing error unwind when enabling RX offload

Yaohan Li (1):
      dm: avoid double-dropping the zone reset submission reference

Yaroslav Dudkov (2):
      ipv6: ignore link state in gateway check
      selftests: fib_tests: Add carrier gateway test

Yehyeong Lee (5):
      wifi: nxpwifi: guard the 11ax response handlers against a
detached command buffer
      wifi: nxpwifi: read the 11AX_CFG extension ID at the right offset
      wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response
      xen/pvcalls: unwind pvcalls_new_active_socket() step by step
      xen/pvcalls: destroy the per-socket workqueue on release

Yifan Zhang (2):
      tracing/probes: bound symstr stores to reserved length
      smb: client: bound invalid NTLMSSP signature diagnostic

Yingjie Wang (4):
      dm thin: avoid wrapping no_space_timeout
      dm mpath: cap queue_if_no_path_timeout_secs
      tcp: free saved_syn after an RCU grace period
      ipv6: reject routes without an inet6_dev

Yu Zhang (1):
      gpio: virtuser: remove the debugfs files before freeing the line data

YuanZhe Liu (4):
      Bluetooth: hci_qca: fix use-after-free in ibs debugfs files
      Bluetooth: btusb: fix use-after-free in force_poll_sync
      net: usb: lan78xx: let unregister_netdev() stop phylink
      drm/gud: avoid divide error in gud_stats_debugfs

Yuansheng Yang (1):
      KEYS: Protect pkey method checks against type removal

Yuho Choi (1):
      ptp: kvm: x86: Leak clock_pair page if changing its encryption fails

Zachary Huang (1):
      ASoC: es9356: fix the capture gain dB scale

Zexin Wang (1):
      watchdog: sbsa_gwdt: Limit the MediaTek WS0 race workaround to revisi=
on 0

Zhan Xusheng (2):
      sched/cache: Don't use fits_capacity() to compare thread and CPU coun=
ts
      erofs: reset buf->off in erofs_init_metabuf()

Zhang Heng (3):
      ASoC: amd: yc: Fall back to DMI quirk table when _WOV returns 0
      ASoC: amd: yc: Add DMI quirk for ASUS TUF Gaming A16 FA607NUQ
      ASoC: amd: acp: Add Lenovo Legion 5 15AGP11 to ACP70 override table

Zhang Qiao (1):
      sched_ext: Fix partial-SMT core counting in calc_shard_layout()

Zhao Feng (2):
      dm crypt: fix use of uninitialized percpu_counter in ctr error path
      watchdog: npcm: fix clock prepare leak when setting timeout on a
running watchdog

Zhao Gongyi (2):
      net: netns: fix INT_MAX nsid cleanup
      arm64: ptrace: don't warn on missing siginfo in a group-stop

Zhao Li (15):
      Bluetooth: L2CAP: Only accept LE responses to outstanding requests
      Bluetooth: L2CAP: Clear request identifiers on incoming LE connection=
s
      Bluetooth: L2CAP: Keep recvmsg from resuming a closed channel
      wifi: mac80211: fix use-after-free when MLO link setup is rolled back
      wifi: mac80211: drain link readers before stopping removed links
      wifi: cfg80211: release rejected nontransmitted BSS reference
      wifi: mac80211_hwsim: ignore non-generic netlink releases
      wifi: mac80211: recheck injected headers after removing FCS
      wifi: mac80211: restore dormant links when link updates fail
      wifi: cfg80211: preserve mesh A-MSDU lengths when adding mesh headers
      wifi: mac80211: reject invalid EHT guard intervals in airtime estimat=
es
      wifi: mac80211: recheck the IBSS station limit before insertion
      wifi: mac80211: bound pending IBSS station allocations
      wifi: mac80211: recheck the OCB station limit before insertion
      wifi: mac80211: bound pending OCB station allocations

Zhiqi Zhang (2):
      bootconfig: Allow keys with the maximum supported depth
      tools/bootconfig: Test listing keys at the maximum depth

Zhou Minqiang (1):
      PM: runtime: Fix check_flush_dependency warning from pm_runtime_remov=
e

Zihan Xi (1):
      netfilter: nf_dup: preserve guard across NFQUEUE reinjection

Zijun Hu (1):
      Bluetooth: hci_conn: Fix SCO/eSCO Transport_Unit_Size for HCI data pa=
th

Zixuan Chai (1):
      seg6: validate state in netfilter continuations

guolingxing (1):
      dm-pcache: do not advance dirty_tail after backing flush failure

liuyong (2):
      smb: client: validate descriptor headers before query result allocati=
on
      smb: client: compare owner and group SIDs using their encoded lengths

shao.mingyin@zte.com.cn (2):
      dm mpath: fix buffer overflow in parse_hw_handler()
      dm log userspace: drop the device reference on error

wuyuehong (1):
      dm snapshot: fix discard_granularity unit in snapshot_io_hints

xietangxin (1):
      dm-crypt: reject integrity_key_size with non-authenc AEAD ciphers

zoan37 (1):
      watchdog: mtk_wdt: Stop a running watchdog over system sleep
even if not opened
