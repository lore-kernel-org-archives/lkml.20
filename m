Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21003BED38
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543708; cv=none; b=dWBvK6aBqPg6OIpoRAhjn6ZafW/QzUUNfSqs8Iahp8sgK5DLDCH4jQcdRb6vi+zoCnVqrW1i4uv6ff5QCuCCCZB1Ctju7D9sUir3KbFC6gJTpxzeI/kKcwbJCTnVfShXwlpcKj8G1K95MwSJugweuZtKZCwJNfOrTnGJItaNd7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543708; c=relaxed/simple;
	bh=HkALv63WHvrLIVQj5yJZmy/2axrRShmdpAoSlBFv4nE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bckixbIryJYkVedQYVMR9oabOhY210TeweYC+nJo137zz/ds6rfkYtnSuoZwNL73afCjipdKijMzSDcv0HR7eNtAS5VGbo89Kg5VD4FSIarfodpozkgvCPm01Y+vPlpdoSBW05cfCDKJ9ZXuKtIu0ZmBEXiKk/hNBUWCyLPNHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PSZF2mlK; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PSZF2mlK"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so193690166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790543702; x=1791148502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YmFR9gyADm8cc2ClVndRSo4k2fecbxIIKRks+pLdO0=;
        b=PSZF2mlKeKDPKUHFVoEUV71VKGzQiyYRJVK8AYfKNnKBjHGwx73418oH19QmslMTY/
         GIcOhdV0bvAauHbpv8TM3yTlW94NMOq03zTm4cxojn4/7bEg7kyw93vSSUYin9G7tw4A
         SYmTJcz45tgmxKDmvM8AFNG3VIVlc1WW3OgD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543702; x=1791148502;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YmFR9gyADm8cc2ClVndRSo4k2fecbxIIKRks+pLdO0=;
        b=q4W+KoKNGcOZHI9Kzgi1u6yLzBPZ8h8om2z9U5Xi3JroBj9CR6GJD3Ic2p3xMdKJoA
         oYCzw5dP5hkeBlde/Yzm5NMujTlBvRCYqJtSKfGf1b6J+iAntiqi/WLXdvgroDx1U+0f
         LQtMEtqJFRzIpQ42+xyxi/mmETpugyJOBu0vrJNthII3ueAZCh1a7lQWcPDvaVUwg0jz
         ahF41THsB/hQW/zpbhQvB+iDEhycLnb8Fl6x9QDA4OKEki/QOUjU8eAN81OA8lfgASJd
         ehSp1GCIpmT+JizJZcm66CUU2TRFZeergFH9DE5+BeROGdogjWY3Tu5vQRIJWyn4MJyQ
         Vzug==
X-Gm-Message-State: AFuF++nTZu1gqWlmfdJYGft3KyK0uHymPqnvIOcKbIp43KiBdQxqk7q/
	OGO3CZFciPj1J5pqXs2q0asRu/InmhO4AL3HN4TcvxmB9WiKG0nqhfyHM/r6GaXjvG9b6PK+j46
	pJZlZbdc=
X-Gm-Gg: AYBFou0b8Mkwjku5bIA7FJtoQXF2rl0fNJtfKkCIWEOXkkrhxu5pt9xiKfjSpUvovOo
	o8nSNXy221o/nsgE+7IjkfeRk4x0/rFgegqy0YAHlMinLfWa+UAJB6nqtw9LoDOAXP7Yhn6Lwnv
	3IkyYp07bh45Hnd7G/o09Su52in67DsY8ZC7P8GWmT4QEJPR06iFZM6CJzua/7pRDSKjzSWIGRi
	UCYhNCWtBUimcrAl63KAwweQZVR9enTlOacFZAOGSmZ1BpxC1GbPKP4inQYmBcMoVYYdsDKz8XR
	wgh3zQC/2v7ExtoAF2kr1HdUWJ7yE7incwvLIhhZx3LeT7Sn66bHKaC5clyNGkwjwgJ6uxjpMjQ
	CBHzkKPBXvzE9kfvfJ4o3lTCFxEMsfuMNeEtWYLWylUm/WUPMUw8Ux+HwbKo0HFj9YKrucFcWay
	lsOXNlbFrFcuzCxLgNBnrOcSaO3aFkICBsaW59phh6O3fo2K1kVTUbBYXOZ2DEivoJhIqUSeQmo
	aFbATBMN7YdVWhT7DrMkofRrI1LmCRuFhFCeqAzQZ5QlUG6EQ==
X-Received: by 2002:a17:907:ea7:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c2ac230f4b2mr965750066b.2.1790543701426;
        Sun, 27 Sep 2026 14:15:01 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcacfsm182511166b.74.2026.09.27.14.15.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 14:15:01 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15c1so304922366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:15:01 -0700 (PDT)
X-Received: by 2002:a17:907:3e10:b0:c2d:bd87:7fa7 with SMTP id
 a640c23a62f3a-c2dbd878d07mr282137766b.24.1790543700250; Sun, 27 Sep 2026
 14:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Sep 2026 14:14:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi-0ue4KWEGBfGFJTEkjh0-oMNpG=wNJ7pj4Ox1Eta67g@mail.gmail.com>
X-Gm-Features: AclHuK_fecCiqAcFmGqHg3nWpe0wF94oa7VUbBkvaOZ0M86QhPdYDhv0jvFNrGU
Message-ID: <CAHk-=wi-0ue4KWEGBfGFJTEkjh0-oMNpG=wNJ7pj4Ox1Eta67g@mail.gmail.com>
Subject: Linux 7.3-rc5
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Another week, another large rc.

The diffstat looks a bit unusual. Less than a third of the patch is
drivers, and a quarter is just selftests. Now, that's admittedly a bit
misleading: most of the driver patches are rather small, and some of
the selftest patches are much bigger (the biggest patch in here is the
arm64 kvm ITS table test, I think). So counting the number of commits
it skews quite differently. But that diffstat is still a bit unusual.

Not *bad* unusual, just not what I typically see.

The rest is mostly architecture fixes (largely kvm-related, some perf)
and a fair amount of core kernel (both scheduler and bpf). And
networking, of course. Most of the driver side is networking too (with
drm showing up as a close second). That part is decidedly _not_
unusual.

There's various other scattered fixes in here too - core vfs, some
xfs. I don't think there's any real pattern to it other than "big".
But nothing looks particularly alarming, I think that despite the
difftstat it's just the same old, same old.

Please keep testing,

                  Linus

---

Aamir Ahmed (2):
      net: usb: catc: bound the RX packet length in catc_rx_done()
      nfc: llcp: drop truncated I/RR/RNR PDUs in nfc_llcp_recv_hdlc()

Abhishek Ojha (1):
      net: phy: micrel: Advance register data pointer in write loop

Adarsh Das (1):
      smb: client: delete compound mids on send failure before unlock

Aldo Ariel Panzardo (9):
      Bluetooth: hci_conn: fix CIS hold ownership on reuse
      Bluetooth: ISO: release unused CIS holds after channel attach
      Bluetooth: hci_sock: reject out-of-range OCF values
      Bluetooth: hci_sock: validate event length before filtering
      Bluetooth: ISO: balance the parent hold in hci_bind_bis()
      Bluetooth: L2CAP: validate frame length before control and FCS access
      Bluetooth: mgmt: fix race in read_unconf_index_list()
      vsock: ignore empty child namespace mode writes
      nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm(=
)

Aleksei Sviridkin (3):
      net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
      net: dsa: mt7530: leave the MDIO IRQ mappings to regmap-irq
      net: phylink: record the PHY only once bringup cannot fail

Alex Deucher (1):
      drm/amd/display: Bump frame warning limit for all builds of dml

Alex Hung (1):
      drm/amd/display: Relax DML frame limit with UBSAN

Alexander Duyck (5):
      net: ethtool: keep rtnl_lock for the ioctl self test
      eth: fbnic: use the Rx queue napi pointer to find the napi vector
      eth: fbnic: reset num_napi when the napi vectors are freed
      eth: fbnic: Set AW_FLUSH_MODE alongside AW_FLUSH when flushing the ma=
ilbox
      eth: fbnic: Handle FW mailbox completions flagged with an error

Alexander Sverdlin (1):
      net: phy: intel-xway: workaround 100BASE-TX Link-Up issue

Allison Henderson (1):
      net/rds: size a connection's path set by the transport it ends up wit=
h

Amir Goldstein (1):
      ovl: fix UAF in ovl_do_mkdir() debug print

Andre Przywara (1):
      pinctrl: sunxi: A523: fix voltage withstand encoding

Andrea Parri (3):
      net/mlx5e: fix swapped IPv6 IPsec policy masks
      kprobes: Fix permanent hang when flushing the kprobe optimizer
      bpf: fs/xattr: don't assume the inode is locked in path_unlink/path_r=
mdir

Andres Diaz (1):
      HID: logitech-hidpp: Add support for G502 X Lightspeed USB mouse

Andy Moreton (1):
      sfc: add X4D PF support

Angel J (1):
      PCI: of_property: Omit bus properties without a subordinate bus

Ankit Nautiyal (1):
      drm/i915/quirks: Limit eDP rate to HBR2 on HP Pavilion Plus 14-ew1

Anthony Krowiak (1):
      s390/vfio-ap: fix KVM GISC and page leak when queue removed from
host config

Anuj Gupta (1):
      xfs: remove unused xfs_reflink_remap_range declaration

Aohan Mei (2):
      netfilter: nf_tables: skip expired catchall elements on insert and de=
lete
      sctp: discard the rest of the packet on a stale-cookie error

Arnd Bergmann (2):
      scsi: leapraid: Avoid -Wformat-security warning
      landlock: Work around gcc-16 -Wuninitialized warning

Asad Kamal (1):
      drm/amdkfd: fix use-after-free and multi-container gap in kfd_dev_map=
ping

Baolin Wang (1):
      MAINTAINERS: add Baoquan and Baolin as MGLRU reviewers

Bart Van Assche (1):
      scsi: megaraid_sas: Protect megasas_get_ctrl_info() in megasas_resume=
()

Bartosz Golaszewski (1):
      gpio: cdev: fix kernel stack leak to user-space in error path

Benjamin Leggett (1):
      drm/virtio: sync shmem backing on guest-bound transfers

Benjamin Tissoires (3):
      selftests/hid: add define for commonly used buf size
      HID: bpf: fix __hid_bpf_hw_check_params report length
      selftests/hid: add unnumbered variant to the hid_bpf tests

Berke Durak (1):
      HID: elecom: Add support for ELECOM M-XT4DRBK (018E)

Bernard Ladenthin (1):
      net/sched: fix potential stack infoleak in em_text_dump()

Bernardo Soares (2):
      net/mlx5: Bridge, don't fail switchdev events of sibling eswitch port=
s
      net/mlx5: Bridge, don't fail unlink of untracked/unsupported peer por=
ts

Bj=C3=B6rn T=C3=B6pel (3):
      eth: fbnic: Fix payload page pool error cleanup
      eth: fbnic: Handle maximum standalone channels
      eth: fbnic: Avoid rounding zero ring sizes

Brajesh Gupta (2):
      drm/imagination: Propagate map failures correctly from pvr_mmu_map_sg=
l()
      drm/imagination: Fix page count for page table for map() interface

Chaithanya Lagisetty (1):
      selftests: nci: Fix uninitialized family ID on missing attribute

Chen Changcheng (2):
      HID: alps: unregister DualPoint Stick input device on remove
      HID: alps: fix use-after-free on input2 registration failure

Chen Yu (1):
      sched/cache: Skip kernel threads for cache aware scheduling to
rubustify the code

Chris Gellermann (2):
      selftests/nci: Fix out-of-bounds store on thread join
      nfc: virtual_ncidev: Add missing ioctl compat handler

Chris Mason (2):
      binfmt_misc: fix OOB read in bpf_binprm_select_interp()
      binfmt_misc: fix racy checks in bpf set_interp kfuncs

Christian Brauner (5):
      fs/ntfs3: use d_instantiate_new() in ntfs_create_inode() and
murder syzbot's "WARNING in do_new_mount" saga
      fs: don't create the private nullfs mount under namespace_sem
      Revert "selftests/filesystems: add mntns cleanup test"
      Revert "put_mnt_ns(): leave mounts connected"
      super: make iterate_supers_type() deletion-safe

Christian K=C3=B6nig (1):
      drm/i915: fix incorrect RCU teardown order

Christian Lamparter (1):
      net: emac: move setting of netops to fix crash

Christiano Amora (1):
      Bluetooth: SMP: reject Security Request over BR/EDR

Christoph Hellwig (1):
      xfs: don't try to get a reference to a NULL oz in xfs_get_cached_zone

Claudio Imbrenda (8):
      KVM: s390: Fix dirty marking in adapter_indicators_set*()
      KVM: s390: Fix compile warning for kvm_s390_update_cmma_dirty()
      KVM: s390: Fix _gaccess_shadow_fault()
      KVM: s390: Refactor dat_set_slot()
      KVM: s390: Move all code into s390_kvm_mmu_prepare_memory_region()
      KVM: s390: Add missing srcu in kvm_s390_set_irq_state()
      KVM: s390: Fix potential races in dat skey functions
      KVM: s390: Fix race in _destroy_pages_crste()

Coia Prant (2):
      net: pcs: xpcs: fix clock reference leak on xpcs_init_clks failure
      net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the
PHY clock fails

Cong Nguyen (1):
      nfc: llcp: fix sdreq TLV list leak on parse/alloc/send failure

Conor Dooley (2):
      pinctrl: mpfs-mssio: fix width of unused bank voltage setting
      pinctrl: mpfs-mssio: use correct regmap function to set bank voltage

Dairui Zhang (1):
      af_packet: fix integer overflow in prb_calc_retire_blk_tmo()

Dan Carpenter (1):
      drm/nouveau/clk: fix list cursor use after loop in nvkm_clk_ustate_up=
date

Daniel Borkmann (7):
      bpf: Fix bpf_skb_change_tail wrt csum partial skbs
      selftests/bpf: Add test for bpf_skb_change_tail on csum partial skbs
      bpf: Add KF_PERFMON kfunc flag
      bpf: Require CAP_PERFMON for kfuncs reading memory
      bpf: Require CAP_PERFMON for untrusted read-only memory reads
      selftests/bpf: Add tests for the KF_PERFMON gates
      bpf: Clear scalar delta on narrowing stack spill

Dapeng Mi (12):
      perf/x86/intel: Fix GRT PEBS load/store direction for latency
events, to fix sample classification
      perf/x86/intel: Fix CMT PEBS load/store direction for latency
events, to fix sample classification
      perf/x86/intel: Fix DKT PEBS load/store direction for latency
events, to fix sample classification
      perf/x86/intel: Update arw_latency_data() mem-op direction handling
      perf/x86/intel: Remove incorrect LionCove PEBS data-source constraint=
s
      perf/x86/intel: Remove incorrect Panther Cove PEBS data-source constr=
aints
      perf/x86/intel: Fix Panther Cove PEBS data-source snoop states
      perf/x86/intel: Delete dead NVL PEBS data-source initcall
      perf/x86/intel: Constrain Panther Cove UOPS_DISPATCHED events to PMCs=
 0-3
      perf/x86/intel: Fix precise OMR event scheduling for DMR/NVL
      perf/x86/intel: Rename DMR offcore_rsp attribute to offmodule_rsp
      perf/x86/intel: Rename NVL offcore_rsp attribute to offmodule_rsp

Darrick J. Wong (22):
      xfs: guard against igrab failure in xrep_findparent_from_dcache
      xfs: don't assert when XFS_SCRUB_TYPE_HEALTHY scans return corruption
      xfs: fix attr fork block count checks in xrep_inode_blockcounts
      xfs: release orphanage dir inode if chown fails
      xfs: release AGFL after walking it during rmapbt repair
      xfs: use correct jiffies comparison function in xchk_maybe_relax
      xfs: check padding field in xfs_ioc_commit_range
      xfs: don't call xfs_exchange_range_finish for a dry run
      xfs: use the correct reservations for rtrmap/refcount recovery
      xfs: fix integer overflows in xbitmap set functions
      xfs: only flag zero padding for dir3 data blocks, not dir3 block bloc=
ks
      xfs: check di_forkoff correctly in scrub
      xfs: call xfs_dquot_set_prealloc_limits if we installed default rtb l=
imits
      xfs: fix rtgroup repair estimations
      xfs: don't cross reference rmapbt with bitmaps if they're incomplete
      xfs: don't let memory failures leak blocks and kill repairs
      xfs: don't merge different file IO error types
      xfs: fix blockgc group quota scanning when usrquota isn't enforced
      xfs: fix cursor and pointer handling when recovering iunlink buckets
      xfs: drop dquot flush lock when we can't find a buffer to flush
      xfs: don't let hidden_space go negative in xfs_metafile_resv_init
      xfs: fix wild memcpy access when formatting ondisk rtrefcount btree r=
oots

Davi Chaves Azevedo (1):
      sched/cache: Refresh LLC capacity across CPU hotplug, to fix
capacity underestimation bug

David Ballesteros (1):
      KVM: Ensure memory attributes xarray nodes are accounted to the
caller's memcg

David Carlier (2):
      fprobe: Terminate the fgraph_data list when the reservation is not fi=
lled
      arm64: errata: match the target implementation CPU's own MIDR

David Dai (1):
      bonding: crypto offload enabled, non-offload slave failover, rekey fa=
iled

David Howells (3):
      block: Fix start and length check added to iov_iter_extract_bvecs()
      netfs: Fix netfs_read_gaps() to use separate sink folios
      netfs, afs: Fix symlink reading

Deepanshu Kartikey (1):
      nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()

Disha Goel (1):
      selftests/filesystems: fix missing and stale TARGETS entries

Dmitry Antipov (1):
      HID: roccat: fix locking in roccat_connect() and roccat_disconnect()

Dmitry Osipenko (1):
      Revert "drm/virtio: Allow importing prime buffers when 3D is enabled"

Donggeun Yoo (4):
      bpf, arm64: set up the frame pointer for the exception callback
      selftests/bpf: cover the exception callback using its own BPF stack
      bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash eleme=
nt
      selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created ele=
ment

Dongliang Qin (1):
      rds: ib: Clear the sg list when mapping an MR fails

Doruk Tan Ozturk (1):
      nfc: port100: reject frames whose declared length exceeds the
received data

Drif Abdelmalek Mohamed Said (1):
      dcache: unpoison the inline name buffer in __d_alloc()

Eddie Phillips (1):
      gve: fix TX drop when GSO MSS is too small for hw

Emil Tsalapatis (8):
      bpf: Fix bounds check for skb-backed dynptrs
      selftests/bpf: Test dynptr slices past end of skb
      bpf: Fix bpf_sock context code generation
      selftests/bpf: Add selftests for rx_queue_mapping context access
      bpf: Reject pkt arguments in mutating subprogs
      selftests/bpf: Test rejection of pkt args to mutating subprogs
      bpf: Prevent variable arena/non-arena register contents
      selftests/bpf: Test for mixed arena/nonarena code paths

Eric Dumazet (8):
      tipc: reject invalid and unexpected GRP_ACK_MSG to prevent
bc_ackers underflow
      net: flush skb_defer_nodes in dev_cpu_dead()
      gve: DQO: fix header length used by gve_can_send_tso() for UDP GSO
      gve: DQO: reject TSO packets with an out of range MSS
      llc: fix skb UAF and leaks on llc_mac_hdr_init() failure
      bridge: check llc_mac_hdr_init() return value in br_send_bpdu()
      net/sched: sch_teql: fix shadowed err in __teql_resolve()
      vlan: ensure sufficient headroom in vlan_dev_hard_header()

Erik H=C3=A5kansson (1):
      HID: steelseries: Add support for Arctis 7 (2018)

Ethan Nelson-Moore (1):
      parisc: remove unused <asm/compat_ucontext.h> header

Eva Kurchatova (1):
      selftests: cgroup: give the O_TMPFILE open in get_temp_fd() a mode

Ewan D. Milne (1):
      scsi: devinfo: Add BLIST_SKIP_IO_HINTS for EMC Symmetrix

Fan Wu (2):
      ipe: fix use-after-free when auditing a newly loaded policy
      ipe: protect the dm-verity root hash with RCU

Fang Xieyan (1):
      net/sched: act_ife: validate metadata length before decoding

Florian Fainelli (5):
      net: bcmgenet: fix 64-bit RTNL stats reading in ethtool on 32-bit sys=
tems
      net: bcmgenet: initialize u64 stats seq counter for all queues
      net: bcmgenet: do not skip WoL power up on GENET V1
      net: bcmgenet: validate Ethernet address in bcmgenet_set_mac_addr
      net: bcmgenet: mask DMA_TIMEOUT_MASK when reading DMA_RING0_TIMEOUT

Florian Schmaus (1):
      PM: hibernate: Freeze kernel threads after image preallocation

Florian Westphal (1):
      netfilter: nfnetlink_queue: hold nfnl mutex in event notifier

Fourie Zhang (1):
      net: bridge: mdb: restart port group walk after deletion

Francesco Magazzu (3):
      drm/nouveau/clk: don't use the pstate cursor after the loop
      drm/nouveau/device: don't use the pstate cursor after the loop
      drm/nouveau/clk: don't clobber reclock status when restoring volt/fan

Frank Wunderlich (1):
      gpiolib: use of_node_name if line-name is missing

Fredric Cover (1):
      smb: client: use GFP_KERNEL in get_targets()

Fuad Tabba (14):
      KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
      Revert "KVM: arm64: vgic-its: Don't save collections the table
cannot hold"
      KVM: arm64: vgic-its: Skip unreachable devices instead of failing the=
 save
      KVM: arm64: selftests: Add ITS table save tests
      KVM: arm64: Validate the SVE vector length in pkvm_vcpu_init_sve()
      KVM: arm64: Do not clear VM-wide SVE feature on vCPU init failure
      KVM: arm64: Key unpin_host_sve_state() on the state it unpins
      KVM: arm64: Derive GUEST_HAS_SVE from the SVE feature bit at EL2
      KVM: arm64: Transfer the hyp stack pages out of the host stage-2
      KVM: arm64: Match hyp text by physical address in fix_host_ownership(=
)
      KVM: arm64: Move the private VA allocation cursor to __io_map_next
      KVM: arm64: Check every private mapping is hyp-owned at pKVM init
      KVM: arm64: Don't WARN on an unknown VM ioctl in protected mode
      arm64/boot: Disable trapping of PMZR_EL0 writes to EL2

Gajdos Tam=C3=A1s (3):
      net: atl1c: fix soft lockup on out-of-range tpd_cons read
      net: atl1e: fix soft lockup on out-of-range hw_next_to_clean read
      net: atl1: fix soft lockup on out-of-range cmb_tpd_next_to_clean read

Geert Uytterhoeven (1):
      scsi: ufs: pltfrm: Add quirk for R-Car S4 lacking lanes-per-direction

Geliang Tang (1):
      bpf, sockmap: Fix self-redirect copied_seq double-counting

Gilberto Conde (1):
      net: usb: qmi_wwan: add Quectel EG120K-EA

Ginger Li (1):
      tipc: Fix a data race on mon->peer_cnt in mon_timeout()

Giuseppe Ranieri (1):
      drm/nouveau/disp: don't reject HDMI config on cards without SCDC

Guangshuo Li (3):
      drm/nouveau: fix autosuspend cleanup during teardown
      net: ena: fix PHC cleanup on probe failure
      net: ena: fix MMIO read buffer leak on probe failure

Guopeng Zhang (1):
      cgroup/pids: Restore pids.events notifications in local mode

Hao Ge (1):
      netfs: Fix missing alloc tagging of direct mempool allocations

Haowen Bai (1):
      mailmap: update Haowen Bai's email address

Haseeb Malik (1):
      macsec: initialize SecY before registering the netdevice

Helge Deller (1):
      parisc: Increase kernel stack size to 32kb

Hemanth Selam (2):
      xfs: fix typos and repeated words in comments
      s390: Fix typos in comments

Heyang Tan (1):
      octeontx2-af: use seq_file for rsrc_alloc debugfs

Holger Dengler (1):
      crypto: s390/hmac - Generate intermediate CV for API partial
block handling

Hui Peng (8):
      Bluetooth: bnep: fix out-of-bounds reads on short RX/TX frames
and control fallthrough
      Bluetooth: RFCOMM: fix NULL dereference of dlc->session in RFCOMM_CON=
NINFO
      Bluetooth: RFCOMM: Reject short EA=3D0 frames in rfcomm_recv_frame()
      ipv6: sr: enforce exact attribute length for SEG6_ATTR_DST
      fou: reject omitted FOU_ATTR_IPPROTO on FOU_ENCAP_DIRECT
      mctp: route: iterate socket tag list in mctp_lookup_prealloc_tag()
      autofs: fix sbi->pipe file reference leak in autofs_kill_sb()
      cgroup/cpuset: Return PERR_NOCPUS in remote_partition_enable()
on subpartitions_cpus conflict

Ido Schimmel (1):
      vrf: Stop corrupting skb->csum when capturing CHECKSUM_COMPLETE packe=
ts

Ilya Maximets (6):
      net: openvswitch: conntrack: avoid modifying shared unconfirmed ct en=
try
      net: openvswitch: conntrack: remove 'add_helper' dead code
      net: openvswitch: conntrack: fix helper UAF due to extensions realloc
      net/sched: act_ct: avoid modifying shared unconfirmed ct entry
      net/sched: act_ct: remove 'add_helper' dead code
      net/sched: act_ct: fix helper UAF due to extensions realloc

Ilya Titov (1):
      pinctrl: sunxi: keep a shadow copy of the data register output latche=
s

Imre Deak (2):
      drm/i915/dp_mst: Fix configuring FEC for a disconnected stream
      drm/i915/dp_mst: Fix configuring TUs for a disconnected stream

Ivan Delalande (1):
      tg3: use random MAC address when tg3_get_device_address fails

Ivan Lipski (1):
      drm/amd/display: Bump frame warning limit for clang builds of dml

Ivan Vecera (1):
      dpll: use exact lookup for reference sync pin id

Jaewook You (1):
      mm/hugetlb: preserve mremap address delta when skipping page tables

Jakub Kicinski (3):
      genetlink: report the real command id for dump-only ops in policy dum=
ps
      selftests: net: nl_nlctrl: check the op ids in the policy map
      veth: manage XDP program pointers during channel resize

Jakub Pawlak (1):
      accel/ivpu: Use separate flag for job timeout

Jamal Hadi Salim (4):
      net/sched: cls_u32: fix manual hash table handle IDR aliasing
      selftests/tc-testing: add u32 manual table handle IDR tests
      net/sched: sch_hfsc: bound the classify inner-filter walk with a
drift budget
      selftests: tc-testing: add a lateral-drift hfsc classify-walk test

Jan Kara (1):
      isofs: Fix handling of directories with tight blocks

Jani Nikula (1):
      drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit helpers

Jiangshan Yi (1):
      xfs: remove duplicate INO1_WRITTEN check

Jiawen Wu (1):
      net: libwx: fix races in Tx timestamp handling

Jiayuan Chen (6):
      bpf: Fix divide-by-zero in btf_struct_walk()
      selftests/bpf: Test BTF walk into a flexible array of zero-sized elem=
ents
      bpf: Fix out-of-bounds read of sk_protocol in bpf_sock_destroy()
      tcp: Skip cond_resched() in inet_csk_listen_stop() under BPF context
      selftests/bpf: Test bpf_sock_destroy() on TIME_WAIT and listener sock=
s
      bpf: Fix out-of-bounds read of rtt_min in sock_ops

Jim Mattson (1):
      KVM: x86/pmu: Move Intel PMU global MSRs to intel_is_valid_msr()

Jinjiang Tu (1):
      mm/rmap: fix missing barrier between anon_vma init and
vma->anon_vma publish

Johan Almbladh (2):
      bpf: Fix immediate JMP JEQ/JNE on MIPS32
      bpf: Fix BSWAP 32 and 16 on MIPS64

Jonas Jelonek (1):
      net: mdio: realtek-rtl9300: fix RTL931x C22 extended page selection

Jonghyuk Kim(MalHyuk) (1):
      drm/nouveau: RCU-free the scheduler-containing nouveau_sched

Jose Fernandez (Anthropic) (1):
      bpf: Avoid soft lockup in __htab_map_lookup_and_delete_batch()

Josef Bacik (1):
      writeback: report a Tasks-RCU quiescent state per cgwb drain pass

Joseph Qi (1):
      ocfs2: make ocfs2_calc_xattr_init() return void

Joshua Hahn (1):
      selftests/cgroup: account for zswap shrinker writeback

Julia Lawall (1):
      HID: fix semantic patch and improve its performance

Julian Anastasov (1):
      ipvs: revalidate ihl before icmp_send

Julian Sun (1):
      fs: avoid repeated scans in evict_inodes()

Junjie Cao (1):
      HID: quirks: add ALWAYS_POLL quirk for SDINNOVATION gaming keyboard

Junrui Luo (5):
      drm/nouveau/dmem: pin VRAM for the whole registered range
      drm/virtio: fix object leak when drm_gem_handle_create() fails
      drm/virtio: fix object leak in virtio_gpu_resource_create_ioctl()
      drm/virtio: fix object leaks in virtio_gpu_resource_create_blob_ioctl=
()
      drm/virtio: release the GEM object on virtio_gpu_vram_create() errors

J=C3=A9r=C3=A9my Jean (2):
      netfilter: flowtable: publish HW_DEAD after worker is done
      net: gue: reject invalid REMCSUM offsets

Karl Mehltretter (8):
      KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
      KVM: arm64: selftests: Test empty SMCCC filter range at base 0
      s390/pci/docs: Fix sriov_numvfs attribute name
      netfilter: nft_synproxy: use the family-aware checksum helper
      KVM: arm64: Fix AArch32 DBGBXVR<n> handling
      gpio: tps65219: Fix GPIO input value reads
      gpio: tps65219: Use the variant-specific direction callback
      gpio: tps65219: Fix TPS65214 GPIO direction programming

Kumar Kartikeya Dwivedi (16):
      bpf: Verify global subprogs in each sleepability context
      selftests/bpf: Test global subprog callback contexts
      bpf: Make post-verification instruction rewrites killable
      bpf: Preserve packet pointer class displacement in regsafe()
      selftests/bpf: Test packet pointer class displacement pruning
      bpf: Apply CO-RE relocations before subprogram validation
      selftests/bpf: Test early in-kernel CO-RE relocation
      bpf: Restrict CO-RE poisoning to relocatable instructions
      selftests/bpf: Test CO-RE instruction poisoning restrictions
      bpf: Assign lock identity to callback map values
      selftests/bpf: Check callback map value lock identity
      libbpf: Reject truncated ldimm64 CO-RE relocations
      bpf: Compare stack frames in regs_exact()
      selftests/bpf: Cover frame changes in bounded loops
      bpf: Bound ownership depth through local kptrs and graph roots
      selftests/bpf: Check local object ownership depth

Kuniyuki Iwashima (3):
      ip6_gre: Call ip6erspan_tunnel_unlink_md() in ip6erspan_changelink().
      ipv6: Prevent rt6_insert_exception() for dying fib6_info.
      ipv6: Fix dst leak for uncached routes.

Kyle Hendry (1):
      net: pcs: rzn1-miic: Fix config array initialization

Lee Jones (2):
      Bluetooth: mgmt: Dequeue pending mesh_send_sync entries on cancel
      nfc: llcp: Fix race condition in accept_queue lifecycle

Lei Zhu (1):
      selftests: nci: Correct pthread_create return value check

Li Youhong (1):
      drm/bridge: samsung-dsim: fix TE GPIO lifetime for host attach

Liang Luo (1):
      sched_ext: Count SCX_EV_SUB_BYPASS_DISPATCH in the dispatch fallback

Liew Rui Yan (2):
      mm/damon/core: allow esz to be set to zero
      mm/damon/core: fix unconditionally skip last region

Linkui Xiao (1):
      ipv4: fib: fix data-race and stale genid check around nh->nh_saddr

Linus Torvalds (1):
      Linux 7.3-rc5

Liz Fong-Jones (1):
      PCI: Fix BAR resize for devices on a root bus

Longlong Xia (1):
      mm/hugetlb: do not dissolve gigantic pages without runtime support

Lorenzo Bianconi (2):
      net: ethernet: mtk_eth_soc: unregister net_devices in case of
probe failure
      net: stmmac: clear stale buf->page after recycling on skb build failu=
re

Lorenzo Stoakes (ARM) (2):
      KVM: arm64: Fix spurious warning for benign stage 2 teardown race
      KVM: arm64: nv: Fix null ptr deref on nested wp/unmap, teardown race

Lovekesh Solanki (1):
      HID: multitouch: Add report ID mismatch quirk for ASUS ROG Z13 Folio

Lu Wang (1):
      sched/cache: Honor migrate_llc_task semantics in active load
balance, to fix LLC mis-scheduling bug

Luxiao Xu (2):
      netfilter: ip6t_rt: fix zero-address non-strict match out-of-bounds r=
ead
      nfc: fix use-after-free in nfc_get_local_general_bytes

Lyude Paul (5):
      drm/nouveau/gsp/r570: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
      drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
      drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
      drm/nouveau/gsp/r570: Start saving comptag backing stores
      drm/nouveau/gsp/r570: Enable Gcoff in fbsr again

Manaf Meethalavalappu Pallikunhi (1):
      thermal: gov_step_wise: Fix stale mitigation vote with non-zero
lower bounds

Marc Zyngier (2):
      KVM: arm64: nv: Fix life cycle of the nested_mmus array
      KVM: arm64: nv: Delay freeing of shadow S2 structures until VM destru=
ction

Mario Limonciello (1):
      x86/PCI: Disable enhanced atomics on AMD NBIO 7.7 and 7.11

Mark Brown (1):
      KVM: arm64: Fix FGT mapping for HFGITR_EL2.nGCSEPP

Masami Hiramatsu (Google) (1):
      x86/mce: Fix hardware debug register corruption on task migration

Masoud Aghasi (1):
      bpf: Fix u32 overflow issue in map batch operations

Matthew Auld (1):
      drm/xe/vm: nuke PTs only after unlinking contested VMAs

Matthew Brost (1):
      drm/xe: Keep walking on SVM eviction failure

Matthias Goergens (2):
      ata: libata-scsi: bound the ATA passthru sense descriptor writes
      MAINTAINERS: name the libata/linux for-next branch

Maxime Chevallier (7):
      net: stmmac: selftests: Support running selftests on DSA conduits
      net: stmmac: selftests: Validate EEE based on the actual LPI timer va=
lue
      net: stmmac: selftests: Check the dev->features for S-TAG offload tes=
ting
      net: stmmac: selftests: Capture all packets for vlan checks
      net: stmmac: dwmac4: Use the correct bufzise when the len is exactly =
8K
      net: stmmac: size the RX buffers from the frame length, not the MTU
      net: stmmac: selftests: Account for alignment shift on dwmac1000
for Jumbo test

Meijing Zhao (1):
      mm: memblock: add missing HugeTLB flag name

Melody Wang (1):
      x86/sev: Make vTPM SVSM calls preemption-safe

Micka=C3=ABl Sala=C3=BCn (10):
      landlock: Fix tracepoint fixed-width type names
      landlock: Fix filesystem denial blocker reporting
      landlock: Fix rule tracepoint context
      landlock: Fix network denial trace context
      landlock: Report the actual ptrace tracer
      landlock: Report the effective signal number
      selftests/landlock: Test filesystem denial blockers
      selftests/landlock: Test network denial context
      landlock: Fix tracepoint contract documentation
      landlock: Widen ruleset versions to 64 bits

Mikhail Gavrilov (1):
      debugfs: don't warn about uninitialized debugfs for an error parent

Mikhail Zaslonko (3):
      s390/debug: Reject NULL debug info in debug_dump()
      s390/debug: Do not register views for failed static debug areas
      s390/debug: Fix NULL pointer dereference in debug_info_copy()

Mina Almasry (1):
      net: devmem: document that bind-tx is unprivileged by design

Ming Wang (1):
      net: usb: cdc_mbim: add MeiG Smart SRM821 to ZLP whitelist

Mostafa Saleh (1):
      remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage

Muhammad Bilal (1):
      net: spacemit: clear TX descriptor on fragment mapping failure

Myeonghun Pak (6):
      RISC-V: KVM: Synchronize hrtimer callback during teardown
      pinctrl: single: free the IRQ on domain creation failure
      tg3: clean up PHYLIB resources on probe failure
      nfc: trf7970a: power down on startup RX gain failure
      net: airoha: npu: cancel wdt_work after releasing the WDT IRQ
      bna: prevent IOC timer rearm during teardown

Naman Gulati (1):
      netfilter: ctnetlink: fix suspicious RCU usage in expect_iter_name

Namhyung Kim (1):
      perf/core: Fix a refcount leak in attach_perf_ctx_data()

Namjae Jeon (1):
      smb: client: use finish_no_open() for non-regular inodes

Nathan Gao (1):
      mm/damon/ops-common: use a page-aligned address in damon_ptep_mkold()

Nemesa Garg (1):
      drm/i915/psr: Clear stale sel fetch enable bits on sel fetch disable

Nguyen Ngoc Thang (1):
      net/sched: act_ct: don't WARN on benign flow_offload_alloc() failure

Nicolai Buchwitz (3):
      net: don't require the hwtstamp NDOs when a PHY provides timestamping
      MAINTAINERS: add Nicolai Buchwitz as GENET maintainer
      net: bcmgenet: stop Tx NAPI before disabling the queues

Nicolo Giuliani (1):
      net: dsa: mv88e6xxx: 88E6191X and 88E6193X have no PTP

Niklas Cassel (2):
      ata: libata-core: Extend Samsung LPM quirk to AMD controllers
      ata: libata: Correct libata.force parameter documentation

Niklas Schnelle (4):
      s390/pci: Fix leak of struct pci_dev reference in zpci_report_status(=
)
      s390/pci: Fix missing device lock in zpci_report_status()
      s390/pci: Report SCLP status on error events when no pdev is associat=
ed
      s390/pci: Don't report recovery success on skipped recovery

Norbert Szetei (2):
      ipv6: do not let ipv6_find_hdr() return an offset past the packet end
      net: xps: reject an out of range traffic class

Oleg Keri (1):
      HID: i2c-hid: add reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard

Oscar Priego Verdugo (1):
      HID: elecom: fix bus type for M-XGL20DLBK

Patrick Lu (Anthropic) (1):
      writeback: bound cleanup_offline_cgwb() rescans by rotating scanned i=
nodes

Paul Hollinsky (1):
      remoteproc: qcom_q6v5_mss: Don't require PAS for memory protection

Pavankumar Kondeti (1):
      workqueue: Fix NULL current_pwq deref in flush dependency check

Peiyang He (5):
      drm/nouveau: fix double-free in nvif_vmm_dtor
      drm/nouveau/uvmm: fix UAF in nouveau_uvmm_sm when BO is in TTM_PL_SYS=
TEM
      drm/nouveau: don't bump pin count on failed re-pin in
nouveau_bo_pin_locked()
      drm/virtio: fix memory leak of fence event on execbuffer failure
      drm/virtio: fix NULL pointer dereference on fence allocation failure

Pengpeng Hou (5):
      net: usb: sr9700: include receive overhead in the length check
      nfc: nfcmrvl: validate helper command length before pull
      nfc: st21nfca: validate received frame size
      nfc: st21nfca: validate ISO15693 inventory length
      drm/imagination: clamp freelist reconstruction requests

Peter Oberparleiter (1):
      s390/cmf: Fix virtual vs physical address confusion

Prathamesh Shete (1):
      pinctrl: tegra238: Fix register bank for AON pin groups

Prike Liang (1):
      drm/amdgpu: move userq fence wait out of signalling section

Pu Lehui (1):
      bpf: Fix UAF due to concurrent consumption of ttrace lists in alloc_b=
ulk

Puranjay Mohan (3):
      perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
      perf/core: Run sched_task() for PMUs with only CPU-wide events
      perf/core: Fill branch entries with a single assignment

Quentin Armitage (1):
      net: allow IFLA_INET_CONF messages when NLA_F_NESTED unset

Ralf Lici (12):
      net/mlx5e: advertise MACsec offload only when supported
      ovpn: preserve IPv6 scope id for netlink peer endpoints
      ovpn: skip UDP source validation for unspecified addresses
      ovpn: track UDP socket route key for peer dst cache
      ovpn: validate peer state before caching UDP dst
      ovpn: replace bind when learning local endpoint
      ovpn: replace bind when clearing stale local source
      ovpn: always unhash old VPN addresses before rehashing
      ovpn: reject duplicate peer VPN addresses
      ovpn: reject multipeer peers without VPN addresses
      ovpn: reject invalid peer VPN addresses
      selftests: ovpn: validate peer VPN addresses

Ran Hongyun (1):
      squashfs: Add dictionary size range check to prevent shift-out-of-bou=
nds

Ratheesh Kannoth (1):
      octeontx2-af: Fix memory scaling limitation in SR-IOV mode

Ravindra (1):
      Bluetooth: btintel_pcie: validate device-supplied DMA indices

Ren=C3=A9 Onier (1):
      HID: winwing: fix use-after-free in force feedback teardown

Ridham Khurana (1):
      gpio: zynq: fix runtime PM leak on request error path

Robin Murphy (1):
      perf/arm-cmn: Fix multi-filter encoding

Rosen Penev (1):
      gpio: mvebu: keep resume masks within the irqchip cache

SJ Park (2):
      mm/damon/vaddr: avoid hw-driven pte updates during damon_hugetlb_mkol=
d()
      mm/damon/core: reset invalid quota->charge_target_from

Sang-Hoon Choi (1):
      nfp: hold IPsec RX state under the XArray lock

Sanghyun Park (1):
      vxlan: use one headroom snapshot for neighbour replies

Sarah Emery (1):
      pinctrl: generic: serialise pinctrl_generic_dt_node_to_map()

Sean Anderson (1):
      pinctrl: meson: Fix typo in s4 group name

Sean Christopherson (10):
      KVM: selftests: Use __GLIBC__, not _GNU_SOURCE, to detect actual glib=
c
      KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
      perf/x86/intel: Ensure KVM guest PEBS path doesn't set unwanted
PERF_GLOBAL_CTRL bits
      perf/x86/intel: Don't write PEBS_ENABLED on host<=3D>guest xfers
if CPU has PEBS isolation, to fix stuck PEBS_ENABLED
      perf/x86/intel: Don't pointlessly context switch DS_AREA (and
PEBS config) if PEBS is unused
      perf/x86/intel: Make @data a mandatory param for intel_guest_get_msrs=
()
      KVM: x86: Re-pend GET_NESTED_STATE_PAGES if getting said pages fails
      KVM: x86: Fill kvm_run exit fields in common
get_nested_state_pages() error paths
      KVM: SEV: Free have_run_cpus during VM destruction even if VM is
no longer SEV
      KVM: SEV: Do cache maintenance on the source VM during
intra-host migration

Sean Young (1):
      parisc: unwind: Replace open-coded binary search with bsearch()

Sebastian Ott (1):
      KVM: selftests: fix steal_time for arm64 with host page size > 4K

SeungJu Cheon (3):
      RISC-V: KVM: Preserve firmware counter value across stop/start
      RISC-V: KVM: Report snapshot write failure to the guest
      RISC-V: KVM: Fix perf-backed counter accounting across stop and read

Shardul Bankar (2):
      udp: relocate a connected socket in the 4-tuple hash table on re-conn=
ect
      udp: remove a disconnected socket from the 4-tuple hash table

Shawn Guo (2):
      remoteproc: qcom: q6v5_pas: Don't enable handover IRQ on attach
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions

Shay Drory (3):
      net/mlx5: devcom, Base component size on linked devices
      net/mlx5: SD, unload reps on shared FDB create error path
      net/mlx5: LAG, reload IB reps of LAG master before the rest

Shihuang Liu (1):
      net: skbuff: fix pull-bound underflow in skb_checksum_setup_ipv6()

Shixiong Ou (1):
      drm/virtio: Add pixel blend mode property to cursor plane

Shuicheng Lin (1):
      drm/xe/tlb_inval: Treat wedged-device invalidations as complete

Siddharth Chintamaneni (2):
      bpf: Allow terminal gotox instructions
      selftests/bpf: Test terminal gotox instructions

Sidraya Jayagond (1):
      net/smc: fix UAF on lgr list traversal in smcr_port_err()

Sk Anirban (1):
      drm/xe/gt_throttle: Report power brake as a throttle reason on CRI

Slawomir Stepien (1):
      HID: amd_sfh: Validate PCI BAR size before mapping

Stanley Jhu (1):
      scsi: ufs: core: Keep internal commands dispatchable during error han=
dling

Steffen Eiden (2):
      s390/uv: Fix loop condition in uv_find_secrets
      s390/uv: Prevent potential out-of-bounds read

Stuart Hayhurst (1):
      HID: corsair-void: Fix firmware event packet description

Sunil Khatri (3):
      drm/amdgpu/userq: fix double jiffies conversion in hang detect timeou=
t
      drm/amdgpu/vcn5.0.1: fix video_timeout unit mismatch in jpeg reset wa=
it
      drm/amdgpu/vcn4.0.3: fix video_timeout unit mismatch in jpeg reset wa=
it

Sven Schnelle (1):
      selftests/ftrace: Fix unique symbol check in kprobe_non_uniq_symbol.t=
c

Szymon Aceda=C5=84ski (1):
      drm/xe: Limit sg segment size to PAGE_SIZE on Xen PV

Takashi Sakamoto (1):
      firewire: cdev: fix back-transition for iso_resource_auto client reso=
urce

Tan Chi (1):
      RISC-V: KVM: Fix HSM hart status error propagation

Tangudu Tilak Tirumalesh (2):
      drm/xe: harden adjust_idledly() against divide-by-zero and overflow
      drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

Tejun Heo (5):
      sched_ext: Wait for SCX_OPSS_DISPATCHING before reenqueueing a task
      sched_ext: Derive SCX_RQ_IN_WAKEUP from the core enqueue flags
      sched_ext: Pass the initial cmask to cid-form ops.enable()
      selftests/sched_ext: Check the cmask cid-form ops.enable() receives
      sched_ext: Add a size argument to scx_bpf_cid_topo() so struct
scx_cid_topo can grow

Th=C3=A9o Lebrun (1):
      net: macb: fix dma_alloc_coherent() leak on macb_alloc() error paths

Tim Chen (3):
      sched/cache: Keep nr_pref_llc_running in the runnable domain, to
fix LLC mis-scheduling bug
      sched/cache: Decouple sched_cache_group from mm to fix UAF
      sched/cache: Introduce task_struct->sched_cache_grp to fix UAF

Tingmao Wang (1):
      landlock: Add counted_by in landlock_domain

Tristan Madani (1):
      HID: hid-oxp: use cancel_delayed_work_sync() in remove

Victor Nogueira (1):
      net/sched: act_gate: budget the per-entry list in get_fill_size

Vignesh Viswanathan (1):
      remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop()

Viken Dadhaniya (1):
      i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL

Vineeth Vijayan (4):
      s390/cio: Fix cio_update_schib() to not cache invalid schib
      s390/cio: Check pmcw.dnv before pmcw.ena in I/O entry points
      s390/cio: Guard PMCW field accesses with dnv check
      s390/cio: Fix NULL pointer dereference in ccw_device_get_util_str()

Wei Jie LAW (1):
      HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()

Wei Wang (1):
      mailmap: add entry for Wei Wang

Weiming Shi (5):
      bpf: Disallow bpf_skb_pull_data() for LWT_SEG6LOCAL
      bpf: Skip unsettled links in link iterator
      netfilter: ip6t_rpfilter: reject routes without inet6_dev
      net/sched: reject IDR error pointers when deleting actions
      bpf: Reject dev-bound-only programs on other devices

Wentao Liang (13):
      gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
      drm/nouveau: Fix bridge reference leak in nv1a_ram_new()
      drm/nouveau: Fix gem reference leak in validate_init()
      drm/nouveau: Fix runtime PM leak in nouveau_connector_detect()
      fsl/fman: Fix clk reference leak in read_dts_node()
      net: hisilicon: hns_dsaf_mac: fix mdio device leak in
hns_mac_register_phy()
      net: usb: lan78xx: Fix URB reference leak in
lan78xx_submit_deferred_urbs()
      net/mlx5: Fix rev_entry reference leak in mlx5_tc_ct_shared_counter_g=
et()
      drm/amd/display: Fix dc stream excess put in dm_update_crtc_state()
      drm/amdgpu: Fix vmid_wait fence leak in amdgpu_ring_init()
      drm/amdgpu: Fix acpi device leak in amdgpu_acpi_enumerate_xcc()
      drm/amdgpu: Fix last_update fence leak in amdgpu_vm_init()
      drm/amdgpu: Fix runtime PM leak in amdgpu_debugfs_test_ib_show()

Willem de Bruijn (3):
      virtio_net: copy zerocopy frags in start_xmit without NAPI
      packet: use ubuf_info completion for TX_RING packets
      tcp: prevent collapsing skbs across boundary in rtx queue

Xiang Mei (1):
      vlan: require the MAC header to be present in __vlan_insert_inner_tag=
()

Xie Bo (3):
      RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
      RISC-V: KVM: Release unused page after MMU invalidation
      RISC-V: KVM: Propagate interrupted G-stage faults

Xin Long (1):
      sctp: hold asoc or transport before mod_timer() in timer handlers

Xu Xin (1):
      MAINTAINERS: update Xu Xin's email

Xu Yunxiang (2):
      bpf: Reject non-negative offsets in stack_slot_obj_get_spi()
      selftests/bpf: Reject iterator destruction through fp+0

Xuanqiang Luo (1):
      ip_gre: Reject enabling collect metadata through changelink

Yehyeong Lee (1):
      scsi: libiscsi_tcp: Check the data direction of a Data-In PDU

Yicong Yang (1):
      RISC-V: KVM: Fix the conversion between vsip and hvip

Yilin Zhang (1):
      tcp: fix use-after-free of retransmit_skb_hint in tcp_send_synack()

Yiqi Sun (1):
      sctp: avoid livelock while updating retransmit path

Youth Cao (1):
      HID: i2c-hid: Add i2c-hid-quirk-bad-input-size quirk for 0911:5288 de=
vice

Yuqi Xu (2):
      bpf: Check params size before reading reserved fields
      net: ipconfig: bound DHCP option construction

Yureka Lilian (1):
      arm64: Add override for WFxT

Yuya Kusakabe (2):
      selftests: net: fix CONFIG_SYSCTL sort order in configs
      net: ipv6: keep room for the mac header in dst_dev_overhead()

ZHOU Jiaxiang (2):
      scsi: block: Fix zones_cond out-of-bounds write on zone report
      scsi: sd_zbc: Reject disks with too many zones

Zeng Chi (2):
      KVM: Don't treat reserved xarray entries as having memory attributes
      KVM: Don't pre-reserve xarray entries when storing empty/NULL attribu=
tes

Zeng Heng (1):
      arm64: io: Reject non-user protection in ioremap_prot()

Zhan Xusheng (1):
      sched/core: Account PSI IRQ time to the execution context, not
the scheduling context

Zhang Yunfei (1):
      net: txgbe: fix FDIR filter restore for VF rules

ZhangGuoDong (1):
      smb: client: update POSIX extension specification references

Zhao Gongyi (1):
      bpf, sockmap: Reject max_entries > INT_MAX in sock_map_alloc

Zhenghui Hao (1):
      parisc: parse early parameters in setup_arch()

Zhiling Zou (1):
      xsk: Use a 32-bit compare in xsk_map_gen_lookup

Zhixing Chen (1):
      bpf: Use kvfree() in xdp_test_run_teardown()

Zihan Xi (6):
      smb: client: fix create context out-of-bounds reads
      smb: client: validate POSIX create context length
      smb: client: close handle after create-context parsing failure
      smb: client: clean up failed cached directory opens
      smb: client: close completed creates on compound wait errors
      smb: client: preserve create-context parsing errors

Zijie Huang (1):
      net: arp: terminate device name before lookup

Zijun Hu (1):
      Bluetooth: btnxpuart: Fix skb leak in nxp_process_fw_dump()

Zixuan Chai (1):
      llc: reserve device headroom for allocated frames

Zongmin Zhou (2):
      KVM: riscv: Fix NACL hfence entry update order
      RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_s=
hmem

bui duc phuc (1):
      net: ethernet: ti: netcp: fix pm_runtime usage counter leak on error

fangqiurong (2):
      sched_ext: Don't run ops.dequeue() with a DSQ lock held
      selftests/sched_ext: Test that ops.dequeue() can iterate the consumed=
 DSQ

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

shechenglong (1):
      drm/client: fix restore of partially initialized client

=C3=96mer Mete Kaya (3):
      nfc: llcp: fix -ENOMEM on connect with zero-length service name
      nfc: llcp: fix WKS SAP hijacking via prefix match in nfc_llcp_wks_sap=
()
      nfc: llcp: fix slab-out-of-bounds reads when logging service names
