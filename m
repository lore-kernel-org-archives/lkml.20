Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630BE4CCDFD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788737218; cv=none; b=pXIF1suEvsUv1YaaUq3OBFebjKvF6AarNk6nDWWySEMGpWcXX8Qye5ohaC0Oo/EbWcBmTWWpL4seKs1GWnAiKckWENNPelEl6JdYKZSAQzavKQ6egUcWvy+CM2wzuDf9BgP7AeFiFp75pM8LSPycdgEZZd7VSvCUql/oIYqTINY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788737218; c=relaxed/simple;
	bh=S8VBvtjhK71Ize4Y/dwqG1G/VefUA7N1oPmpvCuoaDM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=BQcfdwdhyK2bx0UnjDylRCtM+kz9M9p9t+ZBkFbnpC+A6cozJ7BIf7bsMdqhqfThPutBZpPsfqOi7VRFw6+DQR+2Qr+OzyJtG9Oqr957YTENg4MzTQgC4eYEaoxYjOhk2TgG9XL6bl1YFRXGkSoDuIZeHnc5f8Y7qDvYVekKfCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EaWZ9kHm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EaWZ9kHm"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4231717a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788737212; x=1789342012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1aV4VA4pBps1mSRt1uCNSbbHY2unpm9QLlLdbaSc9E=;
        b=EaWZ9kHm6yAz+qJfPyn1zkEkoHhxvp+ZS+gIq5X0LrZQqxJMfEnjUk0jsWn9sraKy0
         nw5w/UCRHbwQI0FQ1JI7ot61J4MjbJNbXtzZBq+CvHC19BopHKPKocvwgdZ39VHdoTfo
         YjyisL3mqNJpmIO7NSbLsRmpKbEHywv5mdtQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788737212; x=1789342012;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1aV4VA4pBps1mSRt1uCNSbbHY2unpm9QLlLdbaSc9E=;
        b=FIOS3cDQOi94R7GW0btSu+ZFfUeZDeiFyb8i8v0SCounpXxb4CLPf53Y0eFwO6FXhv
         pwO5Ihv1mCK9W+tTgrMBdB5N3WiV2CJ8B76AZCsWiEXsWS8e7j6k8xIYuyT/aZsJIJx3
         JdzdPDWx89ENTdEehcxh/08LCJ9VvLVDfrC0l2nI9L3JlySJIrUpw9LpuqqVCny9xTpX
         FQzPOzKKC1AKq+mhF0MyBYmelxPcCDwk4H0tsd3ejth2zgJD2MxBAzvm1HVxWvqAlLd6
         9aLeY6Fn4G/RgBd0bkBVrkQoxQCzzsEW5cO/NZUDQi7SUK5lirj/RloTcwTqLV2m22my
         v5FA==
X-Gm-Message-State: AFuF++leIKoVA5CWcqISrLRPQfDt1CWhel2MpHET2MDBR7JhNbKKA2/7
	SGMWmzy37g3+hh/NUrCe7KBKXk2r9o6IOhf0wevqoN1uDQ1cGpNiAXZ1jws6QTAxuqB+pVaAKlV
	vkdH1zwk=
X-Gm-Gg: AYBFou2FQNuUy2EdFVmudllBQJrrBYpWQbmF83ioNTsIxsWVrRwowXFm4mmypDmvpW9
	IPlriihHzzXm8z7HIj0C+odu0mfOLG2crh3KYWmV4E2GGNTS6CUJG8FelPRag0G+Jy2TtHlGhVG
	1oRm+lHck1bMV3YASp8NkmDjQ05EfTDBc9GUAdt3FJdyoTplJ2qJPhjFGbXpvqdR6Go4iH7dTAs
	WCpqrzY6inNCvQTAu+AOSq4vuaNHF6klx2PWRUgGdTi74W26kG/gnOGP3bfXTVnxxGZANBWfLvE
	vQoVE67Mk7aGLacYbxN3lU89JMmYbT5gaKri6QrsOzj9Vvm5pnrZGBkh7Z+fJ2MwXW8XMm6Uu7K
	ZCO2QWVmNlMLJn8eZyKUGjGjAjQjR039nm/UffL4CjVzjkj98H8q6Dxq12MGAsXHosXcTTXBDdu
	pIU/6ONwyqGhoTPsW4G30q9DpsYJkcUhNgVynMpOqAkR8OBC9aKxpqSCIlED/YV31mGkMGlj9XK
	OVK8WzJknb0cq0GF2wCRjffVYCOZ71FERZBsA==
X-Received: by 2002:a05:6402:454f:b0:6a6:7d56:7977 with SMTP id 4fb4d7f45d1cf-6a7e90abb2dmr5215137a12.22.1788737211468;
        Sun, 06 Sep 2026 16:26:51 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d57fd88sm374065266b.44.2026.09.06.16.26.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 16:26:50 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c207cb16cf5so441106466b.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:26:50 -0700 (PDT)
X-Received: by 2002:a17:906:4fd5:b0:c25:9102:fa with SMTP id
 a640c23a62f3a-c260c8b140fmr685081566b.8.1788737210192; Sun, 06 Sep 2026
 16:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Sep 2026 16:26:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjzW9f50_ETY+23zP=8RHf2ZxdQVkUYhi9tWA6V8Ci4vQ@mail.gmail.com>
X-Gm-Features: AcwNN1XbVqgXUzH6sdKMkQHcnQTcj4lSY9bmTf4cZMs8k1ZN64c6nzK0B50n-Z0
Message-ID: <CAHk-=wjzW9f50_ETY+23zP=8RHf2ZxdQVkUYhi9tWA6V8Ci4vQ@mail.gmail.com>
Subject: Linux 7.3-rc2
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Another Sunday afternoon, another -rc.

This didn't *feel* like a particularly busy rc2, but it clearly was.
rc2 is usually the quietest time when people take a breather after the
merge window and it takes a while to start finding bugs. But not this
time - this is a "full fat" rc release.

And it's not some single cause. I'd like to point to the late EDAC
pull that was forgotten and didn't happen during the merge window, but
honestly, that's a fairl small thing. No, rc2 had several filesystems
sending in their fixes, and there's a fairly sizable drm pull with
lots of scattered fixes. Along with networking and bpf sending in
fixes. *And* a number of driver trees too.

So there's a bit of everything in here - including tooling, that
accounts for roughly 20% of the whole patch (mostly sched_ext and
selftests). In fact, outside of the drivers (which always dominates),
tooling is the biggest source of changes (then filesystems, core
kernel and then networking).

Nothing looks particularly odd, even if the rc2 timing is a bit
unusual. It might be just random, but we'll obviously all blame it on
AI, because whether that's really the cause or not, it's an easy thing
to blame ;)

               Linus

---

Aaron Tomlin (1):
      tools/workqueue/wq_dump.py: Support backward compatibility for
wq->attrs rename

Abdifatah Suruur (1):
      ksmbd: fix use-after-free in oplock break notification

Abel Vesa (1):
      Revert "pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power
domains for Eliza"

Abhinav Ananthu (1):
      EDAC/sysfs: Use sysfs_emit_at() in dimmdev_location_show()

Aditya Garg (1):
      MAINTAINERS, mailmap: use Aditya Garg's linux.dev account

Aleksandr Khromov (3):
      ksmbd: zero the FS_OBJECT_ID_INFORMATION buffer before filling it in
      ksmbd: initialize FileSystemControlFlags in FS_CONTROL_INFORMATION
      ksmbd: fill in FileSysIdentifier in FS_POSIX_INFORMATION

Aleksandr Nogikh (2):
      Bluetooth: hci_core: Fix race condition during device registration
      usb: gadget: midi2: Fix null-pointer dereference in f_midi2_free_ep_r=
eqs

Alex Deucher (1):
      drm/amdgpu/gfx8: only apply compute quantums to KCQs

Alex Markuze (1):
      ceph: apply nearfull_sync option on remount

Allison Henderson (5):
      net/rds: use wq_has_sleeper() in release_in_xmit()
      net/rds: use clear_bit_unlock() in release_refill()
      net/rds: clear cp_flags bits individually in rds_conn_path_reset()
      net/rds: acquire RDS_IN_XMIT in rds_tcp_reset_callbacks()
      net/rds: don't let rds_conn_shutdown() consume a concurrent drop

Alon Shakevsky (2):
      ksmbd: validate normalized name response length
      ksmbd: validate COPYCHUNK source and target ranges

Amber Lin (1):
      drm/amdgpu: Update queue reset support version

Amit Sunil Dhamne (1):
      usb: typec: tcpm: constrain TCPM_SOURCING_VBUS event handling

Andi Kleen (1):
      uprobes: guard trace cleanup against error pointers

Andy Shevchenko (2):
      smb: client: transport: Fix debug printing in __release_mid()
      usb: f_mass_storage: Bump local buffer size in fsg_common_create_luns=
()

Anthony Iliopoulos (1):
      LoongArch: Remove unused setup_profiling_timer() function

Anuj Bolewar (1):
      drm/virtio: reclaim pending vbufs before tearing down vqs

Aohan Mei (1):
      net/sched: cls_flower: validate mask pointer after nla_next()

Arthur Gautier (1):
      xhci: fix lost bounce buffers on TDs spanning several ring segments

Arvind Yadav (2):
      drm/pagemap: Prevent double migration of device pages
      drm/pagemap: Reset migration page count on eviction retry

Aswin Karuvally (1):
      s390/ctcm: Prevent XID null dereference

Austin Zheng (1):
      drm/amd/display: Remove const Qualifier From Non-Pointer Fields

Avi Weiss (1):
      btrfs: send: fix lost error return value in will_overwrite_ref()

Baineng Shou (4):
      dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
      misc: fastrpc: don't publish fd before copy_to_user() succeeds
      drm/prime: use dma_buf_fd_install() to preserve export tracing
      selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test

Baolin Liu (9):
      ntfs: return DT_UNKNOWN on inode lookup failure in readdir
      ntfs: propagate reparse index insertion failure
      ntfs: return -ERANGE for undersized xattr buffer
      ntfs: preserve error code in ntfs_resident_attr_record_add()
      ntfs: return real error from ntfs_non_resident_attr_record_add()
      ntfs: fix kmap_local leak in write_mft_record_nolock() error paths
      ntfs: only count successfully cleared runs when freeing clusters
      ntfs: skip free cluster decrement when rollback fails
      ntfs: leave HasEA flag untouched on setxattr failure

Baolin Wang (1):
      mm: fix incorrect vm_flags usage when checking allowable orders for t=
mpfs

Baul Lee (1):
      vxlan: mdb: Fix use-after-free in vxlan_mdb_remote_src_del()

Ben Cressey (3):
      dm-crypt: fix a tiny race condition in crypt_dec_pending
      dm-integrity: fix buffer overflow with keyed discard
      dm-integrity: fix infinite loop on discard with large tag size

Benjamin Leggett (1):
      drm/virtio: use the DMA API for resource backing on Xen

Benjamin Marzinski (1):
      dm cache: fix issue with background work locking

Benjamin Tissoires (3):
      HID: bpf: mark struct hid_device as safe BPF pointer
      selftests/hid: Add a test to ensure we can write fields in hid_device
      selftests/hid: prepare test_rdesc_fixup_get_data_overflow for
the new verifier

Bibo Mao (1):
      LoongArch: KVM: Remove unused function
kvm_arch_flush_remote_tlbs_memslot()

Boqun Feng (2):
      interrupt: Disable interrupt before modifying hardirq_disable counter
      preempt: Remove hardirq_disable_count()

Borislav Petkov (AMD) (3):
      EDAC/mpc85xx: Orphan it
      EDAC/device_sysfs: Cleanup around edac_device_ctl_poll_msec_store()
      EDAC/thunderx: Orphan it

Bradley Morgan (1):
      ima: Check for ERR_PTR from dentry_path() in validate_hash_algo()

Breno Leitao (2):
      arm64: trans_pgd: clone only the linear map that exists at runtime
      virtio_console: allocate the port_buffer with the caller's gfp

Bryam Vargas (1):
      net/iucv: fix the recvmsg window update

Bryan Lim (1):
      userfaultfd: reset err to be 0 when move_pages_ptes succeeded

Carlos Maiolino (5):
      xfs: fix capability check in xfs
      capability: Add new capable_noaudit
      quota: Don't issue audit messages on quota enforcing
      xfs: replace ns_capable_noaudit
      capability: unexport has_capability_noaudit

Cen Zhang (Microsoft Security FORGE Labs) (3):
      tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
      tcp: fix use-after-free in do_tcp_getsockopt(TCP_CC_INFO)
      ksmbd: fix tree connection use-after-free in smb2_tree_connect()

Chaitanya Kumar Borah (1):
      drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config() call

Chaithanya Lagisetty (3):
      LoongArch: KVM: Free init resources if kvm_init() fails
      LoongArch: KVM: Add unregister helpers for the KVM interrupt devices
      LoongArch: KVM: Fix resource leak in kvm_loongarch_env_init() error p=
ath

Chang Wu (1):
      usb: typec: hd3ss3220: track VBUS enable state per consumer

Changwoo Min (1):
      sched_ext: Allow ops.cgroup_set_bandwidth() to be sleepable

Chao Shi (1):
      nvme: skip the zoned limits update if the zone info query failed

Charles Vosburgh (1):
      sctp: validate chunk length in the inqueue parser

Chen Cheng (1):
      dm-integrity: require stable writes for internal hash modes

Chen Pei (1):
      bpf, riscv: Make arena support depend on ZACAS

Chen-Yu Tsai (1):
      usb: xhci: Fix HCS_ERST_MAX conversion

Cheng Lingfei (1):
      docs: cgroup-v2: fix misc.events key format description

Chengfeng Ye (1):
      tipc: protect node reset trace dump with node lock

Chris Lew (1):
      net: qrtr: Send HELLO message on endpoint register

Chris Mason (1):
      MAINTAINERS: update Chris Mason's email address

Christian Marangi (1):
      pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig

Christoph Hellwig (9):
      xfs: split an assert in xfs_trans_log_buf
      xfs: don't flush and invalidate internal RT device twice in
xfs_shutdown_devices
      xfs: use inode_init_always_gfp with __GFP_NOFAIL in xfs_inode_alloc
      xfs: handle NULL open_zone for merged ioends in xfs_ioend_put_open_zo=
nes
      xfs: fix racy open zone caching
      xfs: fix zoned write iomap flags assignments
      xfs: factor out a xfs_iomap_set_anon_write helper
      xfs: split ioend handling into a separate source file
      xfs: restore bi_bdev in xfs_zone_gc_write_chunk

Daehyeon Ko (2):
      vsock/virtio: validate packet source for connected sockets
      vsock/vmci: validate packet source for connected sockets

Damien Le Moal (2):
      block: flag zoned disks with GENHD_FL_NO_PART
      ata: libata-scsi: do not raise UA for storage element
depopulation and restoration

Dan Carpenter (1):
      drm/virtio: Fix a NULL vs ERR_PTR() bug in
virtio_gpu_user_framebuffer_create()

Dave Airlie (1):
      nouveau/instmem: handle iomapping already existing

Dave Carey (1):
      HID: multitouch: Fix stale MT slots when contact count drops to zero

David Laight (1):
      tipc: Dont send random pad bytes in RESET/ACTIVATE messages

Deepanshu Kartikey (2):
      drm/gud: NUL-terminate TV mode names read from the device
      drm/i915: Guard against NULL driver_data in i915_pci_probe()

Dennis Tighe (4):
      ntfs: do not mark the volume clean in sync_fs when errors were record=
ed
      ntfs: bound $AttrDef table walk to the loaded table size
      ntfs: reject invalid sectors_per_cluster in the boot sector
      ntfs: compute bi_sector in 512-byte units

Dong Chenchen (1):
      net: iptunnel: fix stale transport header during tunnel decapsulation

Eduard Zingerman (33):
      bpf: check_cond_jmp_op(): properly infer if register is null
      selftests/bpf: a demo for check_cond_jmp_op() non-null inference bug
      bpf: don't downgrade half-dead scalar zero spills to STACK_ZERO
      selftests/bpf: half-dead scalar zero stack spill test
      bpf: backtrack_insn(): Handle ld_{abs,ind} subprog exit edge
      selftests/bpf: Precision tracking across BPF_ABS subprog exit
      bpf: backtracking shouldn't clear outer frame R1-R5 for callbacks
      selftests/bpf: test case for unsafe pruning of bpf_loop checkpoints
      bpf: reject BPF_PSEUDO_FUNC reference to the main program
      selftests/bpf: BPF_PSEUDO_FUNC reference to the main program
      bpf: zero extend the result of an arena 32-bit cmpxchg
      bpf: update disasm.c to print BPF_PROBE_ATOMIC as atomics
      selftests/bpf: check zero extension of an arena 32-bit cmpxchg
      bpf: don't rewrite bpf_fastcall patterns entered by a jump
      selftests/bpf: bpf_fastcall patterns entered by a jump
      bpf: Don't infer non-NULL from a pointer with an unbounded offset
      selftests/bpf: No non-NULL inference from unbounded offset pointers
      bpf: Don't resurrect a scalar id dropped by collect_linked_regs()
      selftests/bpf: Check the linked regs cap for the compared register
      bpf: Don't predict JMP32 pointer vs zero comparisons
      selftests/bpf: Check that JMP32 pointer vs zero jumps are not predict=
ed
      bpf: Mark the zero register precise for a register-form NULL check
      selftests/bpf: No non-NULL inference from an imprecise zero register
      bpf: mark a NULL call argument precise
      selftests/bpf: precision of a NULL helper argument
      bpf: mark a NULL memory argument of a call precise
      selftests/bpf: precision of a NULL global subprogram memory argument
      bpf: mark a NULL kfunc argument precise
      selftests/bpf: precision of a NULL kfunc argument
      bpf: mark a NULL BTF_ID argument of a global subprogram precise
      selftests/bpf: precision of a NULL global subprogram BTF_ID argument
      bpf: propagate mark_chain_precision() errors out of loop_flag_is_zero=
()
      bpf: use mark_arg_precision() in check_mem_size_reg()

Elson Serrao (1):
      usb: dwc3: clear forceRM when issuing EndTransfer

Eric Dumazet (16):
      net: icmp: avoid invalid transport header access in icmp_send tracepo=
int
      tcp: use GFP_ATOMIC in tcp_send_active_reset()
      igmp: convert struct ip_sf_list to RCU
      ipv6: mcast: fix RCU list diversion in ip6_mc_del1_src()
      ipv6: mcast: use copy-on-write RCU updates in ip6_mc_source()
      ipv6: mcast: fix delay calculation in igmp6_join_group()
      ipv6: mcast: use rcu_assign_pointer() for __rcu list updates
      ipv6: mcast: use jiffies_delta_to_clock_t() in igmp6_mc_seq_show()
      ip6_gre: check tunnel info before xmit in ip6gre_tunnel_xmit
      ipv6: sr: restore network header before routing and forwarding
      net: bonding: annotate lockless writes with WRITE_ONCE()
      bonding: alb: fix uninitialized transport header access in
alb_determine_nd()
      mm/mempolicy: fix sleeping allocation in
alloc_pages_bulk_weighted_interleave()
      Revert "once: don't use a work queue to reset sleepable static key"
      locking/lockdep: Invalidate stale class_cache entries for zapped clas=
ses
      bonding: do not clear curr_active_slave prematurely when
releasing all slaves

Etienne Perot (2):
      cgroup: fix spurious SIGKILL of CLONE_INTO_CGROUP children
      selftests/cgroup: test clone3() into a previously killed cgroup

FAN YE (1):
      btrfs: zstd: fix lost wakeup when waiting for a workspace

Faith Ekstrand (1):
      drm/nouveau: Use write-combined maps for coherent

Fan Wu (3):
      usb: typec: qcom-pmic: cancel reset_work on stop
      usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on stop
      usb: typec: qcom-pmic-typec: drain cc_debounce_dwork if port_start() =
fails

Florian Schauer (1):
      page_pool: keep frag_offset aligned for odd-sized requests

Florian Westphal (1):
      selftests/bpf: Add tests to assert that netfilter progs cannot
write to skb

Frank Sorenson (3):
      cifs: add revalidation on FSCTL failure in smb2_duplicate_extents()
      smb: client: fix heap overflow in cifs_do_set_acl()
      cifs: don't update i_size in cifs_do_truncate without a cached handle

Frederick Lawler (2):
      configfs: move CONFIGFS_MAGIC definition to magic.h
      ima: don't measure/appraise files on configfs

Fuad Tabba (1):
      arm64: Don't read GMID_EL1 when MTE is disabled

Geert Uytterhoeven (2):
      drivers: base: test: DRIVER_PE_KUNIT_TEST should not select OF
      MAINTAINERS: cover all of RAID

Genjian Zhang (1):
      dm-ebs: fix incorrect device offset check in ebs_ctr()

Gerd Rausch (1):
      net/rds: tcp: don't force RDS_CONN_RESETTING over a concurrent shutdo=
wn

Gongwei Li (1):
      Bluetooth: hci_mrvl: Fix wrong return value check of wait_on_bit_time=
out()

Griffin Kroah-Hartman (1):
      usb: image: mdc800: change kmalloc() to kzalloc()

Guanghui Yang (3):
      btrfs: clean up target device if block group marking fails
      btrfs: detach failed sprout device from transaction update list
      btrfs: restore active device pointers after failed sprout

GuoHan Zhao (2):
      accel/ethosu: check MMIO mapping errors in probe
      accel/ethosu: fix job completion fence cleanup

Guopeng Zhang (3):
      selftests/cgroup: Drop invalid boot isolation comparison
      cgroup/cpuset: Preserve boot-isolated CPUs on partition release
      selftests/cgroup: Add test for preserving boot-isolated CPUs

HW He (1):
      net: gro: Fix nesting of TCP GSO SKBs in skb_gro_receive_list()

Haiyong Sun (1):
      perf build: Add clang and rust target flags for LoongArch

Hajo Noerenberg (1):
      ata: ahci: work around lost interrupts on Marvell 88SE61xx

Harald Freudenberger (1):
      s390/zcrypt: Fix uninitialized padding in CRT key structure

Hari Mishal (1):
      drm/amd/display: fix division by zero in get_estimated_bw()

Heiko Carstens (3):
      s390/time: Use jiffies instead of jiffies_64
      s390/pai: Reduce excessive debug feature size
      s390/mm: Simplify crst_table_upgrade()

Hemanth Selam (2):
      selftests/cgroup: set the test plan after the setup checks
      LoongArch: Fix typo "avaliable" in comment of vmlinux.lds.S

Hengyu Liang (1):
      kernfs: preserve security xattrs without allocating iattrs

Henry Martin (2):
      sctp: fix soft lockup from unpadded ASCONF-ACK parameter iteration
      tracing/probes: Fix use-after-free on field name/type of events
with multiple probes

Holger Dengler (1):
      s390/zcrypt: Validate length in reply before using it

Hongfu Li (1):
      selftests/cgroup: Fix cg_run_in_subcgroups ignoring arg parameter

Hongling Zeng (7):
      ntfs: fix incorrect MFT record pointer passed to ntfs_attr_record_res=
ize
      ntfs: fix undefined behavior in mft/index record size calculation
      ntfs: fix memmove overlap in ntfs_new_attr_flags
      ntfs: fix race between fallocate and mmap reads
      ntfs: handle signal interruption in fallocate
      ntfs: take invalidate_lock in ntfs_setattr_size()
      ntfs: take invalidate_lock in ntfs_filemap_page_mkwrite()

Hui Su (5):
      bpf: Fix infinite loop in pcpu_freelist push with one possible CPU
      bpf: Fix BPF_F_CPU validation for sparse CPU IDs
      bpf: Fix percpu map update indexing with sparse CPU IDs
      staging: fbtft: make dirty_lock IRQ-safe
      mm/migrate_device: avoid out-of-bounds writes for compound folios

Huiwen He (7):
      smb/client: validate new EOF for insert range
      smb/client: validate new EOF for zero range
      smb/client: mark file sparse before emulating insert range
      smb/client: fix data corruption in emulated insert range
      smb/client: fix integer truncation in collapse range
      smb/client: fix stale page cache in insert/collapse range
      smb/client: invalidate fscache for fallocate range operations

HyeongJun An (4):
      ALSA: usb-audio: fix OOB write in snd_usbmidi_us122l_output()
      ALSA: dummy: Report a change when one capture switch channel moves
      ALSA: rawmidi: Return the error from snd_rawmidi_input_params()
      selftests/alsa: Fix the step check for INTEGER controls

H=C3=A5kon Bugge (1):
      net/rds: acquire the fastpath locks in rds_conn_shutdown()

Ian Lin (1):
      net: usb: qmi_wwan: add Compal EXM-G1x support

Ibrahim Hashimov (1):
      HID: wacom: validate report length in wacom_intuos_pro2_bt_irq

Ido Schimmel (4):
      ipv6: Fix redirect exception creation for UDP/RAW sockets
      ipv4: udp: Create exceptions before socket matching
      ipv6: udp: Create exceptions before socket matching
      selftests: net: Add exception cache tests

Ilya Leoshkevich (1):
      s390/cpacf: Unpoison instruction results

Ilya Maximets (2):
      netlink: specs: fix the conntrack filter type
      netlink: specs: add missing mask attributes for conntrack dump

Ivan Lipski (1):
      drm/amd/display: Fix DCN5/6 DML2 compilation warnings

Ivy Lopez (2):
      usb: gadget: f_midi2: fix use-after-free in string attribute show pat=
h
      scsi: mpt3sas: Avoid out-of-bounds cpumask_of_node() call in
_base_assign_reply_queues()

Jacopo Labardi (1):
      ntfs: fix FITRIM range alignment

Jad Keskes (1):
      EDAC/device_sysfs: Use kstrtouint() for poll_msec to prevent truncati=
on

Jamal Hadi Salim (2):
      net/sched: cls_u32: fix duplicate handle when node ID pool is exhaust=
ed
      selftests: tc-testing: add u32 node ID pool exhaustion test

James C. Owens (1):
      btrfs: scrub: report the failing sector's address, not the stripe bas=
e

James Nugraha (1):
      net: amd-xgbe: discard rx packets with bad FCS

Jameson Thies (1):
      usb: typec: ucsi: displayport: Fix OOB altmode array index

Jeffin Philip (3):
      usb: gadget: f_midi: initialize work in f_midi_alloc()
      usb: gadget: f_mass_storage: fix null pointer dereference in
fsg_common_set_num_buffers()
      usb: gadget: fix null pointer dereference in usb_put_function_instanc=
e()

Jerome Tollet (2):
      net/mlx5e: Prevent stale XSK buffer release on refill retry
      net/mlx5e: Prevent stale XSK buffer release on MPWQE refill retry

Jiacheng Xu (1):
      workqueue: reject watchdog thresholds that overflow jiffies

Jiayuan Chen (8):
      bpf: Fix REG INVARIANTS VIOLATION on speculative pointer arithmetic
      selftests/bpf: Add reg-invariants test for speculative pointer arithm=
etic
      bpf: Reject key-less BTF for hash maps
      bpf: Fix NULL-ptr-deref when showing a void BTF type
      bpf: Fix NULL-ptr-deref in btf_var_show()
      selftests/bpf: Add test for key-less BTF hash map
      selftests/bpf: Add test for showing a void BTF type
      selftests/bpf: Fix flaky bpf_nf test when random NAT port is 0

Jiri Kosina (2):
      HID: hyperv: fix build breakage with certain configs
      HID: hyperv: make pointer arithmetics understandable for FORTIFY_SOUR=
CE

Jiri Slaby (SUSE) (1):
      irqdomain: Delete irq_domain_add_linear()

Johannes Thumshirn (2):
      btrfs: zoned: finish active block group cleanup if
call_zone_finish() fails
      btrfs: zoned: propagate do_zone_finish() error in
btrfs_zone_finish_endio()

Jonne Vuorela (1):
      ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2

Ju Nan (1):
      irqchip/stm32mp-exti: Fix the unit of the hwspinlock timeout

Julian Braha (1):
      ima: allow users to specify the pcr index with IMA_MEASURE_PCR_IDX

Jun Yang (1):
      net: bridge: mcast: don't truncate the port group walk on teardown

J=C3=A9r=C3=A9my Jean (1):
      LoongArch: Avoid preempt count underflow without probe

Kaiwen Shi (1):
      mac802154: fix data race and NULL deref on local->assoc_dev

Kanala Ramalingeswara Reddy (1):
      drm/amdgpu: Skip accessing psp rum time db for APUs

Kanchan Joshi (2):
      nvme: set ns->head in nvme_alloc_ns_head
      nvme: fix racy access to FDP placement id array

Kanishka De Silva (1):
      ublk: clear VM_MAYWRITE on read-only ublk char device mmap

Karl Mehltretter (1):
      arm64: mm: Fix the lockless page-table walk in show_pte()

Kazuki Hanai (1):
      nvmet-auth: Synchronize timeout work during SQ teardown

Kees Cook (2):
      drm/amd/display: Fix harmless type mismatch in allocation
      treewide: refresh kmalloc_obj() conversions

Keith Busch (3):
      block: save page offset gaps in cloned bio
      loop, zloop: fix dma_alignment for large or unreported limits
      MAINTAINERS: update nvme entry

Khushit Shah (1):
      arm64: errata: pass REVIDR when matching target implementation CPUs

Kiran K (1):
      Bluetooth: btintel_pcie: Clear automask on spurious interrupts

Kiran Kumar K (1):
      octeontx2-af: fix CN20K default MCAM rule removal on port cleanup

Kiryl Shutsemau (Meta) (1):
      MAINTAINERS: add Kiryl as a THP reviewer

Koichiro Den (1):
      net: ntb_netdev: Fix statistics races

Kumar Kartikeya Dwivedi (31):
      bpf: Reject invalid LDSX instruction in disassembly
      selftests/bpf: Test invalid DW LDSX diagnostics
      bpf: Mark signal tracepoint siginfo arguments as scalar
      selftests/bpf: Cover signal tracepoint siginfo sentinels
      bpf: Reject tail calls directly from callback frames
      selftests/bpf: Test direct tail calls from callbacks
      bpf: Reject resilient lock operations in rbtree callbacks
      selftests/bpf: Reject resilient unlock in rbtree callback
      bpf: Mark sched_process_wait argument as nullable
      selftests/bpf: Test sched_process_wait nullable argument
      bpf: Mark syscall helpers as sleepable
      selftests/bpf: Check syscall helpers in timer callbacks
      bpf: Check ancestor frames for rbtree callbacks
      selftests/bpf: Check rbtree callback restrictions in subprogs
      bpf: Mark bpf_btf_find_by_name_kind() as sleepable
      selftests/bpf: Test btf lookup helper sleepability
      bpf: Mark faultable stack helpers as sleepable
      selftests/bpf: Check faultable stack helper contexts
      bpf: Reject legacy packet loads from callbacks
      selftests/bpf: Reject legacy packet loads from callbacks
      bpf: Require MEM_PERCPU for percpu kptr stores
      selftests/bpf: Reject non-percpu values in percpu kptr fields
      bpf: Clear NON_OWN_REF after RCU protection ends
      selftests/bpf: Reject graph kptr use after RCU unlock
      selftests/bpf: Test timer field on recycled rhtab element
      bpf: Mark NULL kptr stores precise
      selftests/bpf: Test imprecise scalar kptr stores
      bpf: Preserve inner map identity in callback frames
      selftests/bpf: Test inner map identities in callbacks
      bpf: Reject non-scalar bpf_loop iteration counts
      selftests/bpf: Test pointer bpf_loop iteration count rejection

Kuniyuki Iwashima (2):
      af_packet: Don't cast tpacket_hdr.tp_len to int in tpacket_parse_head=
er().
      net: Remove conflicting altnames for dying netns in
__dev_change_net_namespace().

Lance Yang (1):
      MAINTAINERS: add Lance Yang as a hung task detector co-maintainer

Laurence Oberman (1):
      scsi: mpi3mr: Fix use-after-free on tgt_dev->starget during
target device refresh/update

Laxman Acharya Padhya (3):
      Bluetooth: btintel: validate version TLV value lengths
      Bluetooth: btintel: bound firmware ID by TLV length
      Bluetooth: btintel: propagate version TLV parsing errors

Leo Martins (1):
      btrfs: abort transaction before releasing tree_log_mutex on commit fa=
ilure

Leo Yan (1):
      perf/core: Skip empty AUX records with only format flags

Liang Luo (3):
      sched_ext: Fix nonexistent field in sched-ext.rst example
      Docs/admin-guide/cgroup-v2: document BPF scheduler callbacks for
cpu.max and cpu.idle
      sched_ext: Fix missing @slice and @vtime descriptions in
finish_dispatch() kernel-doc

Linkai Gong (1):
      cpuidle: dt_idle_genpd: kfree() the original name allocation

Linmao Li (1):
      scsi: fnic: Initialize the NVMe local port info before registering

Linus Torvalds (1):
      Linux 7.3-rc2

Liu Qi (1):
      usb-storage: ene_ub6250: fix race between scan work and probe

Lizhi Hou (1):
      accel/amdxdna: Remove __counted_by from struct amdxdna_cmd_chain

Longlong Xia (1):
      mm/hugetlb: keep max_huge_pages when dissolving surplus folios

Lorenzo Bianconi (3):
      net: stmmac: fix dma mapping leak in stmmac_tso_xmit()
      net: airoha: enable RX_DONE interrupt for RX queue 31
      net: stmmac: reconfigure RX packet parser table in
stmmac_hw_setup() after reset

Lorenzo Stoakes (ARM) (3):
      MAINTAINERS: remove Lorenzo as THP co-maintainer
      mm/mremap: reset unfaulted VMA page offset for MREMAP_DONTUNMAP
      mm/secretmem: properly account locked pages

Lovekesh Solanki (1):
      USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()

Lu Yao (1):
      drm/xe/oa: Remove sysfs entry on idr_alloc failure in
xe_oa_add_config_ioctl()

Lyude Paul (1):
      drm/nouveau/disp/r535: Add scanline position support + head state sup=
port

Maciej Fijalkowski (1):
      ipvlan: unregister upper devices outside pnodes_lock

Marek Czernohous (1):
      drm/nouveau: unsubscribe the channel-kill event before the fence cont=
ext

Marek Vasut (2):
      usb: typec: mux: Fix typec_switch_match()
      usb: typec: mux: avoid duplicated mux switches

Mario Limonciello (3):
      x86/itmt: Don't make ITMT enablement depend on debugfs
      drm/amdgpu: restrict BAR0 fallback read to SR-IOV VFs only
      drm/amdkfd: fix scope of mqd_mgr dereference in pqm_debugfs_mqds

Mark Brown (1):
      hardening: Default randstruct off with rust for better
allmodconfig support

Masami Hiramatsu (Google) (5):
      tracing/probes: Fix anon_stack check for unnamed bitfields in
btf_find_struct_member
      tracing/probes: Fix BTF kflag check for anonymous struct member acces=
s
      tracing/probes: Fix code indent in get_bitoffset_of_field()
      kprobes: Protect kprobe_blacklist with RCU
      tracing: Fix to avoid creating trace instances with duplicate names

Matthew Auld (1):
      drm/xe/vram: report FLAT_CCS base misalignment

Matthew Brost (2):
      drm/pagemap: dma-unmap pages before handling migration errors
      drm/pagemap: Fix folio allocation fallback and use-after-put

Maurizio Lombardi (1):
      scsi: target: iscsi: Fix hang for aborted WRITE_PENDING commands

Max Kellermann (1):
      ceph: lock mutex in ceph_mds_check_access()

Melissa Wen (5):
      drm/atomic-state-helper: set pixel_blend_mode to prop default on rese=
t
      drm/amd/display: fix missing blend-mode-prop warning for DCN
      drm/amd/display: advertise PIXEL_NONE and PREMULTI blend mode for DCE
      drm/amd/display: use halving distribution for all encode-to-linear cu=
rves
      drm/amd/display: use plane color_mgmt_changed to track colorop change=
s

Mete Durlu (1):
      s390/topology: Switch to common cpu capacity code

Michal Pecio (1):
      usb: xhci: Fix isochronous scheduling regression

Mike Rapoport (Microsoft) (1):
      x86/bpf: Make arch_bpf_trampoline_size allocate from EXECMEM_MODULE_D=
ATA

Mikulas Patocka (1):
      dm-integrity: fix NULL pointer dereference when the 'R' flag is used

Milan P. Gandhi (2):
      scsi: mpi3mr: Fix NULL pointer dereference in mpi3mr_sas_port_add()
      scsi: mpi3mr: Fix target device refcount leak in mpi3mr_sas_port_add(=
)

Ming-Hung Tsai (1):
      dm cache: fix demotion stats in passthrough mode

Mohamed Ahmed (8):
      drm/nouveau/disp: move GSP head-timing ISR and vblank helpers to tu10=
2.c
      drm/nouveau/disp: move the GSP HDMI GCP AVMute write to engine/disp
      drm/nouveau/disp: route GSP-RM display MMIO through nvkm_disp_func ho=
oks
      drm/nouveau/disp: fix HDMI vendor infoframes on GB20x
      drm/nouveau/disp: fix HDMI GCP AVMute register offsets on GB20x
      drm/nouveau/gsp: use per-version DP_CONFIG_STREAM params on r570 firm=
ware
      drm/nouveau/disp: fix head state readback on GB20x
      drm/nouveau/gsp: fix vblank interrupts on GB20x

Mohamed Khalfella (4):
      nvme: add opcode filtering for fault injection
      nvme: remove stale namespaces by NSID range during scan
      nvme: print namespace IDs as unsigned 32bit value
      nvmet: print namespace IDs as unsigned 32bit value

Muhammad Bilal (4):
      staging: rtl8723bs: fix OOB read / stack overflow in rtw_get_wps_attr=
()
      staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
      staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
      staging: sm750fb: fix mono image source stride mismatch in
lynxfb_ops_imageblit()

Muhammad Falak R Wani (2):
      scsi: ibmvfc: Fix kernel-doc name for ibmvfc_scsi_relogin()
      scsi: ibmvfc: Document protocol parameter of ibmvfc_alloc_target()

Myeonghun Pak (1):
      usb: storage: realtek_cr: fix use-after-free on disconnect

Namjae Jeon (9):
      MAINTAINERS: Add Paulo Alcantara as an SMBDIRECT co-maintainer
      MAINTAINERS: Update the KSMBD entry
      ksmbd: safely drain sessions during logoff
      ksmbd: zero pipe read compound padding
      ksmbd: propagate DACL parsing errors
      ksmbd: rate limit unmapped SID errors
      ksmbd: prevent out-of-bounds reads in share config responses
      ksmbd: fix listener task lifetime on netdev events
      ksmbd: fix sparc build with atomic work state

Narek Jilavyan (1):
      mm/hugetlb_cgroup: call page_counter_set_max() outside VM_BUG_ON()

Nathan Chancellor (1):
      LoongArch: Do not select HAVE_RUST when KASAN is enabled

Nemesa Garg (1):
      drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable

Nicolai Buchwitz (1):
      net: macb: exclude software FCS from TX byte statistics

Niklas Cassel (1):
      nvme-fc: fix double free of fabrics options when nvme_add_ctrl() fail=
s

Niklas Schnelle (1):
      s390/pci: Fix leak of uninitialized kernel data in SCLP report

Ning Ding (4):
      bpf: Keep refcount_acquire nullable for borrowed RCU kptrs
      selftests/bpf: Test borrowed refcount acquisition nullability
      bpf: Reject untrusted allocated-object pointers
      selftests/bpf: Reject refcount acquisition after RCU unlock

Nitin Rawat (2):
      scsi: ufs: ufs-qcom: Restore HS/LS link startup mode for
Qualcomm UFS controller v6.2+
      scsi: ufs: ufs-qcom: Fix sequential read variance

Norbert Szetei (1):
      net: psp: do not inherit the Rx association on clone

Nuoqi Gui (2):
      bpf: Cancel special fields when recycling rhtab elements
      selftests/bpf: Test rhtab kptr cancellation semantics

Oleksandr Kovalov (1):
      ALSA: hda/realtek: Fix cold-boot headset misdetection on Acer
Aspire A515-57G

Ondrej Mosn=C3=A1=C4=8Dek (1):
      MAINTAINERS, mailmap: update email address for Ondrej Mosn=C3=A1=C4=
=8Dek

Pan Chuang (1):
      EDAC: Remove redundant dev_err()

Paul Moore (1):
      selinux: fix BPF token permission checks

Pauli Virtanen (3):
      Bluetooth: L2CAP: fix chan mode for LE_CONN_REQ + EXT_FLOWCTL pchan
      Bluetooth: L2CAP: fix out-of-bounds write in l2cap_ecred_connect
      Bluetooth: L2CAP: clear FLAG_DEFER_SETUP only for same PID/PSM

Paulo Alcantara (2):
      smb: client: fix multiuser mount with krb5
      smb: client: fix data corruption with concurrent writes and O_TRUNC

Pawel Laszczak (1):
      usb: cdnsp: fix wakeup from S3 after controller context loss

Peter Drabik (1):
      ALSA: usb-audio: Add mixer map quirk for Audient iD24

Priya Hosur (1):
      drm/amdkfd: Add TLB flush after MES queue eviction/suspension

Qingfang Deng (2):
      ppp: ppp_async: simplify tty disc_data access
      ppp: ppp_synctty: simplify tty disc_data access

Qingyu Zhang (1):
      ALSA: ump: do not touch legacy_rmidi before it exists

Qiuxu Zhuo (11):
      EDAC/ie31200: Decouple DIMM width decoding from enum order
      EDAC/igen6: Fix interleave boundary condition
      EDAC/igen6: Fix channel selection hash
      EDAC/igen6: Fix channel address decode for non-hash mode
      EDAC/igen6: Fix Raptor Lake-P logged error address
      EDAC/igen6: Remove unnecessary XOR on the zero-valued interleave bit
      EDAC/igen6: Simplify compute die ID comments
      EDAC/igen6: Detect present memory controllers at runtime
      EDAC/igen6: Remove redundant resource configuration tables
      EDAC/igen6: Refactor address translation logic
      EDAC/igen6: Add Intel Starfire SoCs support

Qu Wenruo (4):
      btrfs: fix the possible bioc_list memory leak during error
      btrfs: return proper negative error code for update_raid_extent_item(=
)
      btrfs: do not force reloc root creation during qgroup_account_snapsho=
t()
      btrfs: tests: do not touch page cache if root/inode allocation failed

Radhey Shyam Pandey (2):
      MAINTAINERS: Add Radhey Shyam Pandey as Xilinx EDAC reviewer
      usb: dwc3: google: Initialise probe properties with
DWC3_DEFAULT_PROPERTIES

Rafael J. Wysocki (1):
      ACPI: bus: Drop two fields from struct acpi_device_pnp

Rahul Chandelkar (1):
      scsi: bsg: Fix TOCTOU in io_uring passthrough command setup

Randy Dunlap (2):
      dma-buf: fix some kernel-doc warnings
      nvme-tcp.h: drop kernel-doc comments, fix a few descriptions

Riku Matsumura (1):
      ALSA: hda/realtek: Add quirk for VAIO VJS131

Roman Li (2):
      drm/amd/display: Set gpuvm min page size to 4K on dcn35/36
      drm/amd/display: Fix backlight control for luminance-capable OLED

Rounak Das (2):
      EDAC/altera: Use ECC manager compatible to select A10/S10 IRQ layout
      EDAC/altera: Remove remaining CONFIG_64BIT ifdefs in the DB-error pat=
h

Runyu Xiao (2):
      scsi: pm8001: Use rollback index when freeing MSI-X vectors
      ALSA: harmony: initialize locks before requesting IRQ

Russ Weight (3):
      firmware_loader: Change contact for sysfs nodes
      CREDITS: Add CREDITS entry for Firmware Upload
      MAINTAINERS: Remove Russ Weight from Firmware Loader

Sajal Gupta (1):
      drm/gud: validate GUD_ROTATION_0 is present in supported rotations

Sam Ho (1):
      btrfs: preserve the compression property when other inode flags chang=
e

Sang-Heon Jeon (1):
      RAS/AMD/ATL: Remove conditional return with no effect

Sebastian Andrzej Siewior (1):
      futex: Provide rt_mutex_.*_schedule() equivalents for futex schedulin=
g

Seiji Nishikawa (1):
      sched/rt,dl: Skip migrate-disabled tasks when picking a push candidat=
e

Selvamani Rajagopal (4):
      net: ethernet: oa_tc6: Protect skb pointer used by two different
kernel instances
      net: ethernet: oa_tc6: Improve the error recovery
      net: ethernet: oa_tc6: Disable tx queues on fatal error
      net: ethernet: oa_tc6: Fix for the wrong data type

Seokgyu Choi (1):
      nvmet: reject namespace enable without device path

Shakeel Butt (1):
      memcg: make the v1 soft limit knob inert

Shen Yongchao (1):
      HID: bpf: serialize device reference release in struct_ops destroy pa=
th

Shivam Kumar (2):
      nvmet-tcp: fix out-of-bounds write when receiving an over-long PDU
      nvmet-tcp: reject unsolicited H2CData PDUs

Shixiong Ou (2):
      drm/sysfb: ofdrm: Fix integer overflow in fb_size calculation
      drm/sysfb: ofdrm: Fix is_avivo() constant comparison bug

Shuangpeng Bai (1):
      btrfs: fix transaction use-after-free in raid stripe insertion

Shubhang Kaushik (Ampere) (1):
      sched/core: Skip rq->avg_idle update without a valid idle_stamp

Slawomir Stepien (1):
      drm/cirrus-qemu: Validate BAR0 size during probe

Sophon Zhang (1):
      rust: pci: reject IRQ vector indices that do not fit in u32

Sourav Panda (1):
      mm/hugetlb_cma: fix null nodemask dereference in
hugetlb_cma_alloc_frozen_folio

Steven Rostedt (7):
      tracing: Have show_event_filters/triggers files take trace array ref
      ftrace: Take trace_array reference before accessing its ftrace_ops
      ftrace: Synchronize the initialization of ftrace_ops
      tracing: Take trace_array reference when opening options file
      ring-buffer: Add checking nr_subbufs to persistent ring buffer valida=
tion
      tracing: Fix comment in tracing_buffers_splice_read()
      ring-buffer: Use a macro for static buffer bits

Sujal Tuladhar (1):
      scsi: target: iscsi: Reserve a terminator byte for the login payload

Sumanth Korikkar (1):
      s390/diag324: Preserve -EBUSY return code

Sunil Goutham (1):
      octeontx2-af: Fix limiting SRIOV VF count logic

Sunil Khatri (6):
      drm/amdgpu: use AMDGPU_GPU_PAGE_SHIFT instead of PAGE_SHIFT
      drm/amdgpu: fix Idle BOs list in VM debugfs status info
      drm/amdgpu: fix byte/dword unit mismatch in coredump IB dump
      drm/amdgpu: update the fw version for gfx11 userqueues
      drm/amdgpu: update the fw version for gfx12 userqueues
      drm/amdgpu/userq: dont overwrite the error of subsequent map call

Suraj Kandpal (3):
      drm/i915/ddi: add helper to compute DDI clock frequency
      drm/i915/cx0: program DDI_CLK_VALFREQ with DDI clock frequency
      drm/i915/lt_phy: program DDI_CLK_VALFREQ with DDI clock frequency

Sven Peter (1):
      usb: typec: tipd: Fix Thunderbolt altmode VDOs for cd321x

Taimuraz Kaitmazov (4):
      accel/amdxdna: return early from a zero-length flush
      accel/amdxdna: reject a command chain that carries no commands
      accel/amdxdna: put the chained BO when its mapping fails
      accel/amdxdna: refuse to flush an imported BO

Takashi Iwai (2):
      ALSA: pcm: Fix race between non-atomic ops and trigger-start
      ALSA: caiaq: Fix potential double-free at error path

Tal Zussman (2):
      xfs: remove kmem_to_page()
      libceph: remove pinning assertion in ceph_msg_data_iter_next()

Tao Cui (2):
      docs/sched_ext: document that cgroup CPU knobs are scheduler-dependen=
t
      LoongArch: KVM: Fix TOCTOU race on pv_features

Tao Yu (1):
      drm/gud: validate TV mode names before creating enum property

Tejun Heo (4):
      workqueue: Annotate cb_lock nesting when draining a dead BH pool
      sched_ext: Sync tools autogen enum headers from the scx repo
      sched_ext: Sync common and compat headers from the scx repo
      sched_ext: Fix spurious aborts in scx_bpf_dsq_move() on
ownership change races

Thadeu Lima de Souza Cascardo (2):
      drm/atomic: remove bogus check for file_priv
      drm: Fix drm_crtc_commit leak if signaled when PAGE_FLIP_EVENT is use=
d

Thierry Reding (1):
      drm/tegra: Add blend mode properties

Thomas Lamprecht (1):
      scsi: megaraid_sas: Limit NVMe request size to the PRP chain frame

Thomas Richter (1):
      s390/pai: Handle multiple PMU stop callback invocations

Thorsten Blum (1):
      MAINTAINERS: mailmap: update entries for Thorsten Blum

Tiezhu Yang (1):
      LoongArch: BPF: Fix off-by-one error for insn_is_cast_user()

Tim Chen (1):
      sched/fair: Avoid creating misfits during cache-aware balancing

Tomeu Vizoso (1):
      accel: ethosu: Don't read the U65 rounding mode as a storage mode

Tristan Madani (1):
      nvme: add missing SRCU grace period in error path

Tung Nguyen (1):
      tipc: fix NULL deref in tipc_named_node_up() on empty publication lis=
t

Ulf Hansson (1):
      cpuidle: psci: Fix support for probe deferral by dropping the faux de=
vice

Usama Arif (1):
      mm/huge_memory: transfer the pmd dirty bit to the folio on zap

Uwe Kleine-K=C3=B6nig (1):
      MAINTAINERS: Remove Mark Gross from relevant entries

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      s390/ap: Drop unused member from ap_device_id

Vadim Klishko (1):
      HID: i2c-hid: Add a quirk for a Cirque I2C device.

Vasily Gorbik (5):
      s390/ipl: Fix NULL deref in kdump without re-IPL parm block
      s390/ipl: Fix NULL deref in dump_reipl without re-IPL parm block
      s390/boot: Fix physical memory search range
      s390/boot: Avoid IPL parameter append past command line
      s390/boot: Bound command line facility ranges

Victor Nogueira (3):
      net/sched: act_api: budget all shared attributes in notify skbs
      net/sched: act_api: size the RTM_GETACTION reply from the actions
      net/sched: act_api: fix skb sizing and action leak on reoffload delet=
e

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915/cdclk: Avoid spurious cdclk sanitization on PTL+
      drm/i915/cdclk: Fix dg2_power_well_count() return type

Vincent Donnefort (4):
      ring-buffer: Allow splice reads on static buffers
      tracing: Fix subbuf resize races with trace_pipe_raw readers
      ring-buffer: Cap static ring buffer nr_pages
      ring-buffer: Prevent truncation of nr_pages / nr_subbufs

Wanwu Li (6):
      sched_ext: Fix timer pinning and return value in scx_central
      sched_ext: Fix vtime delta loss in scx_flatcg cgroup migration
      sched_ext: Check bpf_timer_start return values in scx_qmap
      sched_ext: Fix several comment issues
      sched/fair: Use cfs_rq->h_curr in throttle_cfs_rq()
      sched/fair: Use cfs_rq->h_curr in distribute_cfs_runtime()

Wei Jie Law (1):
      HID: rmi: fix OOB access with undersized RMI reports

Wentao Guan (2):
      ntfs: treat any nonzero dio zero-range return as an error
      LoongArch: Do not save/restore percpu base register in rethook trampo=
line

Will Porter (6):
      ALSA: usb-audio: Add PM guard to Studio 1810c controls
      ALSA: usb-audio: Add PM guards to US-16x08 transfers
      ALSA: usb-audio: Add PM guard to Scarlett meter reads
      ALSA: usb-audio: Guard Scarlett2 protocol transfers
      ALSA: usb-audio: Add PM guards to RME Digiface controls
      ALSA: usb-audio: Guard FCP protocol transfers

Wupeng Ma (1):
      mm/hugetlb: fix missing migratable flag on same-node hugetlb migratio=
n

Xin Long (1):
      sctp: fix a TOCTOU race in SCTP_CMD_TIMER_START

Xixin Liu (3):
      nvme-rdma: fix -EIO cleanup order in queue_rq
      nvmet-rdma: fix queue leak when connect backlog is exceeded
      nvme-tcp: defer TLS inline send to io_work

Xu Rao (3):
      scsi: sg: Report request-table problems when any status is set
      ALSA: hda: restore MFG widget enumeration after core split
      nvme-fabrics: fix DHCHAP secret leak on parse failure

Xuanqiang Luo (1):
      raw: annotate disconnect-side IPv4 match writers

Yang Xiuwei (1):
      scsi: bsg: Cap io_uring sense copy to max_response_len

Yao Kai (2):
      workqueue: Fix unbound pool lifetime for pending pwqs
      futex: Prevent rcuwait use-after-free during requeue PI

Yazen Ghannam (2):
      EDAC/debugfs: Remove the fake_inject debugfs interface
      RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed

Yehyeong Lee (2):
      nvme-tcp: check the data direction of a C2HData PDU
      nvme-tcp: return -EPROTO for a C2HData on a write

Yilin Zhang (2):
      ALSA: pcm: Serialize PCM mmap with buffer reallocation to fix page UA=
F
      perf: Fix use-after-free when perf mmap() revival races with the
last munmap()

Yogesh Mohan Marimuthu (1):
      drm/amdgpu/userq: fix struct drm_amdgpu_info_device padding for
32bit compile

Yonghong Song (1):
      selftests/bpf: Bound the offset accumulator in __tld_fetch_key()

Youssef Samir (1):
      accel/qaic: Address potential out-of-bounds read in resp_worker()

Yuan Chen (1):
      bpf: Preserve special fields in recycled rhtab elements

Yuling Li (1):
      drm/amd/display: Fix cursor disable with horizontally split planes

Yun Zhou (1):
      xfs: don't hold buffer locks across sync transaction commit in
xfs_sync_sb_buf

Yunpeng Tian (1):
      smb: client: reject SetEA requests that do not fit the request buffer

Zeng Chi (2):
      LoongArch: KVM: Preserve memslot arch flags on KVM_MR_FLAGS_ONLY
      LoongArch: KVM: Validate MSI data before routing it to EIOINTC

Zhan Xusheng (2):
      ntfs: read WOF chunks outside the decompression lock
      sched/fair: Use update_curr_eevdf() for the remaining root cfs_rq cal=
lers

Zhang Heng (2):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 9 14ILL10
      ALSA: hda/realtek: Add quirk for Acer Predator PHN16-72

ZhengYuan Huang (1):
      btrfs: send: reject extents for non-regular inodes

Zhenhao Wan (5):
      drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
      drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
      drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPA=
RSE
      drm/nouveau/dmem: fix mismatched DMA unmap size for large folios
      drm/nouveau/dmem: fix callocated underflow on large folio split

Zihan Xi (1):
      ipv4: avoid divide by zero in fib_rebalance

Zqiang (1):
      workqueue: Use raise_softirq() to trigger softirq in irq_work handler

caina (1):
      Revert "irqchip/mbigen: Fix mbigen node address layout"

feng liu (1):
      ALSA: hda/conexant:Fix abnormal Mic/Speaker functionality on
SN6140 after S3 wake-up

sangram kumar yerra (2):
      scsi: ufs: ufs-pci: Add support for Intel UFS 4.0 HS-Gear5
      scsi: ufs: ufs-pci: Add MCQ support for Intel UFS 4.0 controllers

shechenglong (1):
      drm/virtio: check return value of vgdev_output_init()
