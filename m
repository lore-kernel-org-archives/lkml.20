Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE732363C5F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791775397; cv=none; b=XrGVSaNYGbREFck4678OnupS+8JkpZHDW8VMFFh2iKdTiN749xDr1Bj1FiAFlAmFfYnSF51q7S5dtD9Ul/LzpANlhW79IxsHAnh8iOZbmAVOqmITZ4hCfAz29l80tj5Wqhk3A6xqsccS3HBqYD/ssKBuBSf6unWw4YsKT024nww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791775397; c=relaxed/simple;
	bh=JXwW2QKTj9TlzecWm0ES94eEG5ROJuu/gEo4QnRKJIk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fRpBWjL6FQqb4o3RnoQ/unFK7BDcuWVotvcL3IX8Ux3jAEl1xCKLwcZUJrA+VNtcjEuIJ2+5Q4QbwcdKeL2fYk7LzxkK+DfwWdBoM6E8HGSaYIkQWLPc3tSst5IRH8KrLdNpOiAlBVOXDBBuaXyNcOR86RLuhq4O2N7yL26AKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XCL+k3jh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XCL+k3jh"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c31a34de844so213445166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791775392; x=1792380192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAQgl+kdc827T1zI7d6hapsQUFhbAUNMOgKNeZ4eYWc=;
        b=XCL+k3jhtBgFNvWyW3Miy9e6SGfh6BsOsNwDz5uI56dI3IAg3AqxLgD0v43R7t+z8R
         xgaiyvC/ESrds+TiqKcA2PkIYqxLSute/Fs78vxgXSRnmGqOcgiQKMFKgod9NrAUQgv+
         5LcK+BXFLx9QATElDB1wxq1GpZrcVgoDNlMWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791775392; x=1792380192;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAQgl+kdc827T1zI7d6hapsQUFhbAUNMOgKNeZ4eYWc=;
        b=wcipo8J5fBe3ORjQBGBBPH3Z0d+YUIe0PC0DY/pUyGHT3FwsdZNV+QB3AYGdEyFUOS
         RxhlFes9ETjXHwZby7RH93/vIA0ql+GHSctLRc62T0brjj6o9mkvZd3gpVjfqSbSUD4t
         ld/scD6kEmKeSOKgKLZTbC96hw20sVeEOAKhoF7qiDb+qN02nrUA4LrrGjVolu0hdZGY
         cqM7GB6UD27lKMNsx0TCEV5VUxoTrUiRKAXs9bQPEjNr06OlrLVOxIf9Mb5t4z5IC5+A
         RBIY0qREWzkz+V3nb2jUm4fdRjbd8ncbYYr3+XXd84DzKHIrXqyNKiitJENgqAJW/2E2
         b9sw==
X-Gm-Message-State: AFq9FYKF0evlJEdsGUaBZ8mGZ0b0rOORh0Gq8iOnntpa+xTCHwV7+42X
	4VH55VBbdVFEmW38pLUe6RDFJgQWrzq4RDAB2IH8IhifNdyBjXarAKICghEsgz3+HdxXTtjCDjU
	iKvXXYjY=
X-Gm-Gg: AYBFou3OmrJHWoWOy2wx/fC54LgaJBhrcqSDhSTTrxYLylmDmqH0E+V474AxvMZHNdp
	fEQl9EO0nvtlvfogZ+1HBFFtf69krRyWUsrDZ7dVriL0yJVr/v9kaoSgV/5qUIy0BBCqX5F/n7s
	dO9B5nSNVKgHOTC8zQsl0I7KX76kschBo+OBvWBwt+OLjMiSvnwPDZe+Yg4GPi3tUvkwkXb9GTE
	VkZkdRcqlOmr0iIrzBZg7BDYMH/8f5ctDir6ARAiJeIB6GSbOq/Ir3GAr9xrVGdIIxpS0akiYvD
	+KMdWD1D3iRopouYBfSt7SDRdIRQP3sXYEUFVZZbBZm21WBO3PrNMga2s7/UP2EnTMUC0M1JFdX
	5BfVCbJRq1oeS8PakBHwdrPDH3pLOpUadC04qg7dRYo5gF6b1ow1VRqR6KPLzf9uWUyNzzhPbEq
	su3DGiZVHzZpFw67aNTbje42Gss3+ulu/RlUnp7wc37VCLVSXZMchguchEhgpsZ5qM+cFEIQpZC
	PyRfrQSL2GYUGLomIxa+BVqRsDs/NQJZtv77/1y5yrZPhDbfl84K8/MtJU=
X-Received: by 2002:a17:907:9705:b0:c2a:f5c2:5cfb with SMTP id a640c23a62f3a-c31a9a28f7amr853293066b.7.1791775391042;
        Sun, 11 Oct 2026 20:23:11 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac62a7sm401211166b.63.2026.10.11.20.23.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 20:23:10 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e62319cfaso128841366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:23:10 -0700 (PDT)
X-Received: by 2002:a17:907:6e92:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c31aa065995mr826449966b.30.1791775389826; Sun, 11 Oct 2026
 20:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 11 Oct 2026 20:22:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqcR3MLXB=8ysNcevoHPF=SseBj9uHJ84hXn1f=9SHbg@mail.gmail.com>
X-Gm-Features: AclHuK__b2-KyRFPtBUBZ5h2LRF_xkdhuPyYozB3xjUwbWiZ3yDSLfytoUJxU3M
Message-ID: <CAHk-=wgqcR3MLXB=8ysNcevoHPF=SseBj9uHJ84hXn1f=9SHbg@mail.gmail.com>
Subject: Linux 7.3-rc7
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, so this is six hours late. Not because of any issues, but purely
due to incompetence. I'd like to say that I was jetlagged to the
travel for the kernel maintainer summit and LPC, but the reality is
that - probably still due to said travel - I was mentally off by a
whole day and was thinking it was Saturday the whole day.

Until it struck me over dinner that no, it's Sunday, and I should have
done the rc earlier this afternoon.

Oops.

Anyway, here we are, and at least I got this last rc out the right
day. If barely.

The diffstat is slightly strange, with half the rc7 patch being
selftests. Most of that is because there were several mount-related
bugs fixed, and while the fixes themselves were fairly small, the
selftests for the fixes are more noticeable.

If you ignore the tools/testing/ directory, things look normal: half
drivers (drm and networking), and the rest is spread all over the
place, although the vfs layer is somewhat prominent due to
aforementioned mount fixes (along with some smaller normal
filesystem-specific fixes). All the usual suspects: core networking
and architecture fixes etc.

Shortlog appended.  As always, I would have preferred to see a smaller
rc, but it's not like anything in here looks like a reason to delay
the final release. So that's still set for next weekend unless
something new comes up.

Please do keep testing,

                Linus

---

Aaron Ma (1):
      wifi: mt76: mt7925: restore the legacy BSS after MLO teardown

Abhishek Ojha (1):
      regulator: ltc3676: don't read the write-only HRST and CLIRQ register=
s

Adrian Betschart (1):
      drm/amd/display: Don't replace a sink mode that shares the native tot=
als

Ahmed Abdelhaleem Ahmed (1):
      scsi: ch: Do not keep references to data transfer element devices

Alan Previn (1):
      drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums

Aldo Ariel Panzardo (1):
      Bluetooth: SCO: serialise sco_conn lifetime against sco_recv_scodata(=
)

Alex Deucher (1):
      drm/amdgpu: make Mac FB workaround generic

Alexey Charkov (3):
      power: sequencing: pcie-m2: Fix leaking array from
of_regulator_bulk_get_all()
      regulator: of: fill in supply names in of_regulator_bulk_get_all()
      regulator: of: state who owns the array from of_regulator_bulk_get_al=
l()

Alvin =C5=A0ipraga (2):
      ASoC: adau1372: allow sleepy powerdown GPIOs
      ASoC: adau1372: fix invalid default state of output ASRC and DAC muxe=
s

Andy Yan (1):
      mailmap: update entry for Andy Yan

Arnd Bergmann (1):
      riscv: limit sifive errata to CONFIG_64BIT

Aurelien Jarno (1):
      riscv: vector: Fix output operands in context save

Babanpreet Singh (1):
      tee: qcomtee: fix kernel-doc warnings

Ben Cressey (2):
      dm-integrity: fix buffer overflow in inline mode with large tag size
      dm-crypt: reject the lmk IV mode with AEAD ciphers

Bihaan Sen (1):
      Input: xpad - add support for 8BitDo Pro 2 Wired Controller for Xbox

Borislav Petkov (AMD) (1):
      x86/CPU/AMD: Fix AMD TLBI Erratum #1718

Bryan Fraschetti (1):
      ice: Restore Ordered MMIO Writes for Tx Doorbells

Carlos Llamas (1):
      selftests/mm: cleanup -Wformat issues in hugetlb-mmap

Cen Zhang (Microsoft Security FORGE Labs) (1):
      io_uring/cancel: don't spin on local work the task can't run

Chen Pei (1):
      riscv: ptrace: reject CFI regset access when extensions are absent

Chengfeng Ye (6):
      tipc: hold a reference to nodes found by link name
      Bluetooth: hci_sock: Serialize dead-device detachment
      Bluetooth: hci_sync: Fix command skb lifetime during scan setup
      Bluetooth: ISO: Reject concurrent BIS listener setup
      Bluetooth: ISO: Serialize concurrent connect calls
      net/smc: protect clcsock lifetime in smc_getname

Christian Brauner (58):
      mount: keep a copied mount unbindable
      selftests/filesystems: check that a copied mount namespace keeps
unbindable
      mount: refuse MOVE_MOUNT_SET_GROUP on an unbindable mount
      selftests/move_mount_set_group: check that an unbindable target is re=
fused
      fs: don't silently unmount busy mounts
      selftests/filesystems: check that a busy propagated copy blocks
a synchronous umount
      fs: don't let a migrating task hide its reference from do_umount()
      docs: update the unmount propagation rule
      namespace: reset the old parent's ->overmount in mnt_change_mountpoin=
t()
      statmount: read the parent of an unmounted mount under mount_lock
      namespace: don't inherit MNT_UMOUNT in clone_mnt()
      namespace: don't copy an unmounted mount tree
      namespace: check the target before walking it in do_mount_setattr()
      fs: refuse fspick() on internal superblocks
      fs: put the old fs_struct before the old namespaces in unshare()
      namespace: drop the file's reference first in dissolve_on_fput()
      selftests/filesystems: check that an unmounted mount tree isn't walke=
d
      selftests/filesystems: check that a dead mount's overmount isn't foll=
owed
      namespace: queue a mount only once for mount notifications
      namespace: check a submount for references right before unmounting it
      selftests/filesystems: check that a busy submount survives a
synchronous umount
      namespace: check a recursive bind mount for mount namespace loops
      selftests/filesystems: check that a recursive bind mount can't
pin the caller's mount namespace
      namespace: keep covered mounts covered in OPEN_TREE_NAMESPACE
      selftests/filesystems: check that OPEN_TREE_NAMESPACE keeps mounts co=
vered
      namespace: look at the topmost mount for a mount namespace file
      selftests/filesystems: check that a mount namespace file on top
doesn't bury a mount
      namespace: check the mounts before reading their parents in pivot_roo=
t()
      namespace: don't reconfigure internal superblocks via remount and umo=
unt
      selftests/filesystems: check that the nullfs root can't be reconfigur=
ed
      namespace: remove the fsnotify marks of a mount namespace in
process context
      dcache: don't put a mountpoint on a dentry that's being removed
      unshare: don't drop active namespace references that were never taken
      namespace: don't let a pseudo dentry become the root of a mount
      namespace: unhash a dentry before detaching the mounts on it
      namei: don't reveal overmounted entries in refwalk
      fcntl: refuse F_SET_RW_HINT on an immutable inode
      selftests/filesystems: check that an immutable inode takes no write h=
int
      namespace: refuse an automount below a mount that is in no namespace
      namespace: handle mount locking for automounts correctly
      nullfs: don't update the access time
      namespace: never expire a locked mount
      namespace: keep the lock on a mount that a propagated copy is
moved beneath
      selftests/filesystems: check that a lock lands on the right
mount and stays
      selftests/filesystems: check the atime of the empty mount namespace r=
oot
      selftests/filesystems: check that an automount below an overlay
layer is refused
      fhandle: decide the subtree check under mount_lock
      namespace: keep the private nullfs instance in knullfs
      namespace: nothing is mounted on or written through knullfs
      fsnotify: let a filesystem refuse marks on its objects
      nullfs: refuse file locks
      readdir: take no inode lock on an immutable directory
      selftests/filesystems: add a helper that holds a readdir in a page fa=
ult
      selftests/filesystems: check that reading the root of an empty
mount namespace stalls nobody
      nullfs: add an empty immutable regular file
      namespace: rework connected mounts
      selftests/filesystems: test covered mounts
      namespace: simplify disconnect_mount()

Christian G=C3=B6ttsche (1):
      selinux: fix data race on AVC latest_notif

Cristian Ciocaltea (2):
      drm/bridge: Fix unlocked list_del in drm_bridge_add()
      drm/bridge: Fix unlocked list access in drm_bridge_attach()

Cristian Papa (1):
      wifi: mt76: mt7603: initialize global station WCID

Daehyeon Ko (9):
      tcp: reject net_iov in zerocopy receive mapping hints
      ip6_gre: remove obsolete ERSPAN PMTU update
      vsock/virtio: account only unread bytes in read_skb()
      ipv4: stop PMTU walk when nexthop group shrinks
      ipv4: stop exception dump when nexthop group shrinks
      ipv4: stop route notification sizing when nexthop group shrinks
      cipso: adjust cached option offsets when removing CIPSO
      ipv4: do not warn on route notification size race
      ipv6: do not warn on route notification size race

Dale Whinham (1):
      arm64: dts: qcom: x1-denali: Fix microphone distortion

Daniel Machon (1):
      net: sparx5: free the matchall entry on destroy

Darrick J. Wong (1):
      xfs: fix exchange-range-to-eof file size exchange

Dave Airlie (1):
      nouveau: check gsp->rm as well as gsp pointer before gcx ready

David Carlier (2):
      wifi: nxpwifi: fix inverted check in Tx BA stream entry deletion
      wifi: nxpwifi: do not delete Rx reorder entries under RCU

Denis V. Lunev (1):
      openvswitch: fix soft lockup in the netlink flow dump

Devin Wittmayer (2):
      wifi: mt76: mt7925: don't put the band auto marker in TGID
      wifi: mt76: mt792x: pick the SAR table layout from the table itself

Eckhart Mohr (1):
      ALSA: hda/realtek: Add quirk for ASRock NUC BOX-358H

Eric Biggers (1):
      fsverity: RCU-delay the freeing of struct fsverity_info

Eric Dumazet (6):
      ipv4: free inet_opt and ireq_opt after an RCU grace period
      flow_dissector: avoid u16 truncation of skb->len when computing thoff
      net: always dissect GSO packets in __virtio_net_hdr_to_skb()
      selftests: net: tun: add test for VLAN-tagged GSO without NEEDS_CSUM
      bnxt_en: fix DMA mapping length for padded small packets
      flow_dissector: avoid u16 truncation of hlen in bpf_flow_dissect()

Eugene Gvozdetsky (1):
      io_uring/register: don't exempt disabled rings from task restrictions

Fan Wu (3):
      drm/vc4: drain the hangcheck timer and works on V3D unbind
      gpio: mpsse: fix race when arming the IRQ poll worker
      drm/xe/i2c: cancel the client work on remove

Felix Fietkau (4):
      wifi: mt76: mt7996: program a link again if the driver holds it
      wifi: mt76: mt7996: take over connection monitoring
      wifi: mt76: account non-AQL frames per peer rather than per link
      wifi: mt76: use ALTX queue for packets to disassociated stations

Felix Gu (2):
      drm/bridge: th1520-dw-hdmi: Fix error check on dw_hdmi_probe()
return value
      drm/bridge: th1520-dw-hdmi: Fix remove() callback

Fernando Fernandez Mancera (1):
      net: openvswitch: validate transport header presence in set_ipv6_addr

Filipe Manana (3):
      btrfs: clear BTRFS_ROOT_IN_TRANS_SETUP on early exit from
record_root_in_trans()
      btrfs: fix xattr replace when multiple xattrs are packed in the same =
item
      btrfs: fix lost error return value in btrfs_listxattr()

Frank Li (1):
      net: allwinner: remove dmaengine_desc_free()

Fran=C3=A7ois Roux (1):
      wifi: mac80211: don't estimate airtime for unsupported rate widths

Fredrik Nyberg (1):
      net: usb: ax88179_178a: fix rx frame length for non-last packets

Fuad Tabba (1):
      arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3

Georgiy Osokin (1):
      tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()

Guangshuo Li (3):
      mmc: sdhci-sprd: disable runtime PM on remove
      mmc: cavium-octeon: destroy slot platform devices on remove
      mmc: cavium-thunderx: destroy slot platform devices on remove

Guixin Liu (1):
      nvmet: return Invalid Field for invalid NSIDs feature 82h

Gyeyoung Baek (2):
      drm/imagination: Fix reference and vm_bo handling in remap()
      drm/imagination: Size page table preallocation by device address

Haibo Chen (1):
      spi: spi-nxp-fspi: exit stop mode before waiting for DLL lock

Haishuang Yan (3):
      devlink: fix devlink_rel reference leak when notify work is pending
      pfcp: make sure the SEID is linear before reading it
      bareudp: set the inner protocol to the protocol of the packet

Hamza Mahfooz (1):
      net: mana: reserve RX buffer headroom to fix forwarding performance

Han Gao (2):
      spi: sg2044-nor: Return transfer errors
      spi: sg2044-nor: Honor SPI clock limits

Hans de Goede (1):
      power: sequencing: pcie-m2: Add Lenovo ThinkPad T14s gen6
WCN7850 subsystem PCI ids

Haojie Li (1):
      drm/amdkfd: fix dma_buf reference leak in get_dmabuf_info

Haotian Zhang (1):
      Input: ati_remote2 - fix type confusion in device attribute handlers

Harin Lee (1):
      ALSA: ctxfi: Fix memory leakage when clearing DAO input mappers

Hengyu Liang (2):
      ata: libata-scsi: do not lose CHECK CONDITION for failed ATAPI comman=
ds
      io_uring: do not charge the SQ/CQ rings to RLIMIT_MEMLOCK

Hui Peng (1):
      sctp: copy zeroed stats to user in
sctp_getsockopt_pr_streamstatus() when !streamoute

Ian Forbes (1):
      drm/vmwgfx: Add blend mode property

Iaroslav Voitovych (1):
      Bluetooth: MGMT: Fix status of pending commands flushed on power off

Ilia Gavrilov (1):
      vsock: Fix memory leak in vmci_transport_recv_dgram_cb()

Imre Kaloz (1):
      MAINTAINERS: update my email address

Jaidheer Sirigineedi (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eg3xxx
(103c:8bfd)

Jakub Kicinski (3):
      bonding: fix the program leak when XDP is replaced
      net: make dev_xdp_sb_prog_count() see programs attached through a lin=
k
      Revert "net: stmmac: propagate PTP addend and system time
programming errors"

Jamal Hadi Salim (1):
      net/sched: em_text: reject unterminated algo before autoload

Jason A. Donenfeld (1):
      wireguard: noise: reject response consumption after intermediate
initiation

Jens Axboe (1):
      io_uring/kbuf: don't charge provided buffer rings to RLIMIT_MEMLOCK

Jesse Zhang (2):
      drm/amdgpu/userq: only accept doorbell BOs as queue doorbell
      drm/amdgpu/userq: return the memdup_user() error for the user MQD

Ji-Ze Hong (Peter Hong) (1):
      usb: f81604: fix struct f81604_int_data size mismatch

Jisheng Zhang (1):
      spi: dt-bindings: snps,dw-apb-ssi: Add Synaptics sl2610 spi

Johannes Berg (1):
      Revert "wifi: libertas: reject short monitor TX frames"

John Garry (1):
      mailmap: update addresses for John Garry

Jose Ignacio Tornos Martinez (3):
      i40e: skip unnecessary VF reset when setting trust
      iavf: send MAC change request synchronously
      ice: skip unnecessary VF reset when setting trust

Josef Bacik (3):
      net: skbuff: don't leave stale bytes in skb_copy_and_csum_bits()
      xen/netfront: drop RX packets with a short Ethernet header
      xen/netfront: don't leak the skb when xennet_fill_frags() fails

Joshua Washington (3):
      gve: fix XSK buffer leak when rings are stopped
      gve: fix XSK buffer leak on error descriptor
      gve: fix napi_disable deadlock when attempting to disable XSK pools

Junjie Cao (1):
      wifi: mt76: mt792x: treat 0xff ACPI SAR entries as no limit

Justin Chen (1):
      net: bcmgenet: if UMAC was suspended in SW_RESET, restore it to SW_RE=
SET

Karl Bonde Torp (1):
      nvme: fix swapped ZRASF zone state values for full and read only

Karl Mehltretter (3):
      keys: finalize persistent keyring timeout after link attempt
      arm64: irq: exclude the softirq stack switch from KCOV
      riscv: fix load_unaligned_zeropad() fixup for RV32

Keith Busch (1):
      Revert "nvme: do not reset controllers in NVME_CTRL_NEW state"

Krzysztof Furman (1):
      Input: xpad - add support for Corsair Novablade Pro

Krzysztof Karas (2):
      drm/i915/gem: Prevent overstepping exec array boundary
      drm/i915/gt: Unmask interrupts only when ACTIVE is true

Kuba Piecuch (3):
      sched_ext: Call ops.dequeue() when a task arrives on a remote local D=
SQ
      selftests/sched_ext: Add a test for ops.dequeue() on remote
local DSQ moves
      sched_ext: Generate qseq from a per-task counter

Leo Li (2):
      drm/amd/display: Fix direct scanout alpha on some DRM_FORMATs
      drm/amd/display: disable self-refresh on tearing flips

Leo Yu-Chi Liang (1):
      riscv: fix NR_CPUS range leaking 64-bit default onto 32-bit builds

Leto Liu (=E5=88=98=E6=B6=9B) (1):
      net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()

Li RongQing (1):
      net/mlx5e: Order ICOSQ cc update after CQ doorbell

Linmao Li (7):
      wifi: nxpwifi: protect sta_list against concurrent add and delete
      wifi: nxpwifi: delete the station entry on the uAP deauth event
      wifi: nxpwifi: wait for the wakeup timer before the adapter is freed
      wifi: nxpwifi: free the aggregation buffer when the RA list disappear=
s
      wifi: nxpwifi: zero the channel statistics array
      wifi: nxpwifi: fix the authentication frame length handling
      wifi: nxpwifi: handle authentication frame allocation failures

Linus Torvalds (1):
      Linux 7.3-rc7

Lorenzo Bianconi (1):
      net: stmmac: propagate PTP addend and system time programming errors

Lorenzo Stoakes (ARM) (3):
      mm/mremap: fix locked_vm leak from MREMAP_DONTUNMAP self-merge
      mm/mremap: fix locked_vm leak by splitting VMA for MREMAP_DONTUNMAP
      drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero correctly

Lu Huang (1):
      wifi: mt76: mt7996: fix uninitialized buf read in
mt7996_variant_fem_init()

Luca Weiss (3):
      clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks

Lukas Wunner (1):
      PCI/AER: Skip error recovery on false alarms

Ma Xinmeng (1):
      dm-snap: reject the transient exception store for snapshot-merge

Mahantesh Salimath (1):
      tee: optee: ffa: support shared memory offsets on large-page kernels

Mallesh Koujalagi (1):
      drm/xe/sysctrl: Fix mailbox header handling

Marek Szyprowski (2):
      ASoC: samsung: i2s: enable op_clk in probe to balance runtime PM
      swiotlb: fix default_swiotlb_limit() for non-growable default pool

Mary Guillemard (1):
      drm/nouveau: Skip the Turing CE workaround object for non-GR channels

Matthias Goergens (1):
      MAINTAINERS: name the ext4 dev branch

Matus Gajdos (1):
      ALSA: usb-audio: Add native DSD support for Cambridge Audio streamers

Maxim Skokov (1):
      Bluetooth: RFCOMM: free the skb when the DLC has no owner

Ma=C3=ADra Canal (4):
      drm/vc4: Free the BO cache size list on teardown
      drm/vc4: Use kvmalloc_objs() for the BO cache size list
      drm/vc4: Disable the V3D interrupt across runtime suspend
      drm/vc4: Fix binner slot allocation failing on an idle GPU

Michael Chan (2):
      bnxt_en: Add bnxt_clear_bars() helper
      bnxt_en: Fix driver init in kdump kernel

Michael Garland (1):
      ASoC: amd: yc: Add DMI quirk for Acer Aspire Go 15 (AG15-21P)

Michael S. Tsirkin (1):
      ipv4: validate checksum_start before completing checksum

Michele Dionisio (1):
      wifi: brcmfmac: fix P2P device removal race in brcmf_detach()

Mikhail Gavrilov (3):
      Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
      mm: don't schedule deferred kernel page table freeing while booting
      drm/amdgpu: copy debugfs register data outside the GRBM/SRBM locks

Mikulas Patocka (2):
      dm: fix reading free memory in do_resume
      dm-integrity: validate the superblock on resume

Ming Qian (1):
      pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domai=
ns

Mingming Cao (2):
      ibmveth: h_free logical LAN on open-fail after register
      ibmveth: fix TX LTB and filter unwind on open-fail

Miquel Raynal (1):
      spi: cadence-qspi: Fix status polling with octal DTR chips

Mohamed Yassine Jebabli (1):
      ALSA: hda/tas2781: Accept V1 calibration data without CRC

Myeonghun Pak (1):
      drm/aspeed: Balance the display clock enable on teardown

Naomi Chu (1):
      scsi: ufs: core: Hold a clock reference across the probe

Natasha Klaus (1):
      io_uring/net: populate CONNECT filter fields for 24-byte sockaddr_in6

Nguyen Ngoc Thang (3):
      memstick: rtsx_usb_ms: complete requests after eject instead of
dropping them
      drm/fb-helper: defer setup when fbdev_probe() fails, not just on -EAG=
AIN
      landlock: Drop __counted_by from landlock_domain.handled_masks

Nicolai Buchwitz (2):
      net: macb: check TX ring before modifying skb
      net: macb: copy shared skbs before appending the FCS

Nicolas Cavallari (1):
      wifi: mt76: mt7915: disable rx napi when removing device

Norbert Szetei (1):
      xfs: stop exchanging reflink flags when exchanging mappings

Oleg Keri (1):
      drm/dp: don't mark the AUX backlight enabled when enabling failed

Oliver Hartkopp (1):
      can: fix unique skb identifier regression under RPS

Omar Ramadan (2):
      amt: send the relay's General Query directly from the receive path
      selftests: net: amt: check that the relay's queries bypass the amt de=
vice

Or Har-Toov (2):
      net/mlx5: Lag, split aggregate speed into oper and max helpers
      Revert "net/mlx5: E-Switch, preserve max tx speed on vport state
modification"

Osama Abdelkader (1):
      drm/panthor: validate userspace queue count against initialized
firmware slot count

Ovidiu Panait (5):
      net: stmmac: Remove VLAN perfect matching dead code
      net: stmmac: Stop toggling the EDVLP bit
      net: stmmac: Rename double VLAN references to svlan
      net: stmmac: Do not advertise S-VLAN stripping when it is disabled
      net: stmmac: Disable S-Tag processing on dwmac4

Palla Raghunath (3):
      dm ioctl: don't let data_start run past the buffer
      Bluetooth: RFCOMM: Fix NULL tty_dev dereference in rfcomm_dev_shutdow=
n
      nvme-multipath: revalidate head zones after unfreezing the head queue

Pavan Chebbi (1):
      bnxt_en: Re-write the BARs following any type of PCIe errors

Pavankumar Kondeti (1):
      workqueue: Fix NULL current_pwq deref in chained work check

Peng Fan (1):
      iommu/dma: skip swiotlb bounce for DMA_ATTR_MMIO in iommu_dma_map_phy=
s

Pengpeng Hou (1):
      scsi: ufs: mediatek: Handle mPHY power-on failures

Petr Machata (2):
      mlxsw: spectrum_flower: Fix port range register leak in tmplt_create(=
)
      selftests: mlxsw: Test port range occupancy on template create

Petr Mladek (1):
      braille: nbcon: Allow to use a serial console with NBCON API as
Braille console

Quchaosheng (1):
      net/packet: guard the ll header push in packet_rcv_spkt()

Quentin Freimanis (1):
      net: sparx5: start the TOD counters on non-PTP lan969x variants

Rahul Pon (1):
      i2c: qcom-geni: release runtime PM reference when set_rate fails

Raj Ojha (1):
      memstick: core: wait for request completion before freeing card

Ramses de Norre (1):
      wireguard: queueing: preserve tstamp_type when encapsulating packet

Ravindra (1):
      Bluetooth: btintel_pcie: fix TX descriptor bounds check

Richard Fitzgerald (2):
      ASoC: cs35l56: Add DAI for SDCA OT25 stream
      ASoC: sdw_utils: Switch CS35L56/57/62/63 to use OT25 DAI

Ridham Khurana (2):
      gpio: xilinx: fix runtime PM leak on request error path
      regulator: tps6594-regulator: Fix n_linear_ranges for TPS65224 BUCK2-=
4

Rohinthan P (1):
      media: em28xx: use video_unregister_device for radio_dev

Runyu Xiao (2):
      scsi: qedi: Initialize callback state before registration
      Bluetooth: btintel_pcie: use managed IRQ teardown

Sabrina Dubroca (1):
      strparser: make sure __strp_recv isn't running before tearing
down the parser

Sai Teja Aluvala (1):
      Bluetooth: btintel_pcie: Add shared HW reset for clean start

Sajal Gupta (1):
      drm/gud: don't keep a connector without a CRTC as connector_state

Saleel Kudchadker (1):
      drm/amdkfd: align SDMA doorbell base for shader doorbell writes

Sang-Hoon Choi (3):
      gpio: exar: initialize the ID before registering its cleanup
      cxgb4/ch_ktls: disable softirqs around tid_list erases
      nvmet: use the local P2P device on metadata allocation failure

Sebastien Royen (1):
      net: dsa: microchip: fix KSZ8765 fiber detection

Shao Mingyin (1):
      riscv: lib: Fix ZBB strnlen wrap-around regression on huge counts

Shao-Fu Chen (1):
      optee: register TEE devices only once fully initialized

Shashank Mohan Jain (2):
      lib/dim: fix 32-bit overflow in dim_calc_stats() rates
      lib/dim: add KUnit test for dim_calc_stats()

Shawn Lin (3):
      pmdomain: rockchip: propagate subdomain add errors
      pmdomain: rockchip: fix clock leak on domain probe failure
      pmdomain: rockchip: don't ignore clock lookup errors on attach

Shin'ichiro Kawasaki (1):
      zloop: zero out only the unread tail of short reads

Simon Trimmer (2):
      ASoC: amd: acp: Add DMI override for ASUS EXPERTBOOK AM7406CKA
      ASoC: amd: acp: Add more ACP7.0 match entries for Cirrus Logic parts

Stanley Jhu (2):
      scsi: ufs: core: Avoid unsafe MMIO reads in
ufshcd_mcq_compl_all_cqes_lock()
      scsi: ufs: core: Decouple CQ sweep from request iterator in MCQ

Stefano Radaelli (1):
      arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply

Stephen Smalley (1):
      selinux: preserve NATIVE_LABELS on already-initialized sb in set_mnt_=
opts

Sunho Park (1):
      srcu: Fix WARN_ON() for rcu_segcblist_n_cbs() in cleanup_srcu_struct(=
)

Suraj Gupta (1):
      net: xilinx: axienet: Free outstanding DMA buffers on dmaengine stop

Taniya Das (2):
      clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable

Tao Gong (1):
      wifi: mt76: mt7996: fix struct mt7996_mcu_wed_rro_ba_delete_event lay=
out

Tejun Heo (1):
      sched_ext: Fix CPU hotplug hang when a dying CPU's tasks sit in
the BPF scheduler

Theodore Ts'o (1):
      ext4: mark data=3Djournal as deprecated and will be removed in Januar=
y 2028.

Thomas Hellstr=C3=B6m (2):
      drm/xe: Fix shrinker accounting double-subtraction on nested external=
 pins
      drm/xe: Fix stale pinned_link entry when fb-pin performs the final un=
pin

Tianyi Gao (2):
      veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after GRO is toggled while dow=
n
      selftests: net: veth: test peer ndo-xmit after GRO toggle while down

Tony Nguyen (1):
      e1000e: add system to disable K1 list

Tristan Madani (1):
      ice: fix metadata_dst refcount handling on representor teardown

Troy Mitchell (1):
      riscv: vector: Fix data pointer constraints in context save/restore

Tvrtko Ursulin (1):
      drm/xe: Do not emit Wa_16010904313 twice

Vadim Fedorenko (1):
      ptp: ocp: fix PCIe delay estimation calculation

Victor Nogueira (2):
      net/sched: cls_route: reject change with no routing attribute
      selftests: tc-testing: add cls_route no-routing-attribute change test=
s

Vincent Jardin (3):
      arm64: dts: lx2160a: fix incorrect pinmux
      arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-sing=
le
      arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value

Vishal Badole (1):
      EDAC/amd64: Mask UMC chip select to the four implemented selects

Vitaly Prosyak (1):
      drm/amdgpu: serialize vblank counter reads against GPU reset

Vladimir Murzin (1):
      usb: mtu3: Fix double dereference in TP_printk

Waiman Long (3):
      cgroup/cpuset: Don't access cpuset_cgrp_subsys.root in is_in_v2_mode(=
)
      cgroup/cpuset: Handle cpu hotplug race in guarantee_active_cpus()
      cgroup/cpuset: Call is_in_v2_mode() after acquiring cpuset_mutex
in cpuset_handle_hotplug()

Wei-Jie Hung (1):
      riscv: patch: fix handling of bpf-jit execmem addresses

Weiming Shi (2):
      net: team: stop reusing skb after queue override
      net: team: free skb when broadcast has no txable port

Wentao Liang (2):
      drm/vc4: Fix firmware reference leak in vc4_drm_bind()
      btrfs: scrub: fix local_root reference leak in scrub_print_warning_in=
ode()

Willem de Bruijn (1):
      net/packet: call packet_parse_headers after virtio_net_hdr_to_skb

Xuanqiang Luo (1):
      ice: fix use-after-free in dynamic port cleanup

Yang Xiuwei (4):
      btrfs: always return -EIOCBQUEUED after btrfs_uring_read_extent_endio
      btrfs: free iov when btrfs_uring_read_extent() fails
      btrfs: unlock inode and extent in caller when io_uring read extent fa=
ils
      btrfs: don't stash io_uring encoded data across -EAGAIN

Yibo Tan (1):
      mmc: mtk-sd: Cancel request timeout work on remove

Yingying Tang (1):
      Revert "wifi: ath12k: add panic handler"

Yong-Xuan Wang (2):
      RISC-V: errata: Add SiFive MAL-9092 workaround
      RISC-V: Clear HSTATUS.HU on CPU initialization

Yuqi Xu (1):
      tipc: destroy topsrv workqueues before closing connections

Zack Rusin (1):
      drm/vmwgfx: validate pitch coming from userspace

Zixuan Chai (1):
      net: bridge: avoid recursive multicast port cleanup

Ziyi Guo (2):
      riscv: futex: untag the user pointer before the atomic access
      riscv: entry: gate shadow call stack reload on sstatus.SPP, not tp

Zongmin Zhou (3):
      riscv: hwprobe: use _BITULL() rather than BIT() in MIPS vendor uapi h=
eader
      riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD GHOSTWRITE
      riscv: ptrace: Zero-initialize regset buffers before copyin

zjamg (1):
      can: dev: init_can_skb(): restore skb header initialization

=EC=84=B1=EB=B3=91=EC=B0=AC (1):
      KEYS: Fix add_key() race with keyring restriction
