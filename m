Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD1338CFE8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789336733; cv=none; b=UAMae9t8moC/9Sh5fg9Ejgpc1t4SZxwItDJJacL5RnQU6TwFH3y4aMWZPQN3tOVzP4Yrgd18/QOiGFjTeonCS+SaUDUc04UO+6H8UEpUAHwI+AXf9aSej3ac7G91lbP8PYLmiYf+bSyJVC6no2rr19vGrLk3ieUE3Hxv3QmsuME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789336733; c=relaxed/simple;
	bh=UzMLxMyyMWvKEiI5JWk9IoW1z4psRO/iO3eC7RUKRP8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gU6EBqZn0xW7BIgo8/YU+LKZmiIC0HmNF208cjYUDbPMmu+8AFEHX2AgCqXxEVkmWvYCuERdzDgGqAiUSQFd/iwLKjp9XgmHQruHQ9t/vKJskIW2BLRGqqYxiclb5xwIOl9VP7IA13q9OcHcaHBNaHhqdB8qJ0f03hEm9bC2Q4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Msw5eu6r; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Msw5eu6r"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso260851466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789336727; x=1789941527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvro2w95iMgyL7MxY4mjZwY8AtpqA5hcg5BOr8ghP+g=;
        b=Msw5eu6rjaOvNOpeSRrl7BrnxfAUQGEyWi1iCe/ukBeAtpsqBwCalV/aZqI/IA6Q/Q
         QYzY7OQmJbL+BLAbH+axC0jdZlNopyn36GtSteAj6FU8qlK1fUM8CmYWgUEzYGLpE14D
         O00Ty4hFQr2DZ5181V2reP/izGbPnqTRvVq1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336727; x=1789941527;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mvro2w95iMgyL7MxY4mjZwY8AtpqA5hcg5BOr8ghP+g=;
        b=cIdDFLCk76TkzAg9nHYiceYC2p5uO/HXXn0Hbs6HTp26C8WU1PUx8SgaEQ0DEkZHQI
         GZs1vkJMRZvGrPD7cBB/PAW1ciugR8sjxNNvf/vkV6cUc6We136IE2Wyflr1/oNwT712
         VZe6xFgb1HkljL7E2sn8IR7TGWlWg0QDq/aorFfaCURT0liWE1f78fvT4uJkZbQHvO0o
         j0+5ZB0DeHdXKkPbEbrMBj8Tfukb6efm+a7jroHxtyRhulcXwMdjGjli2oz3sidx1l4p
         MNcLVI7XeEvgVdI2iYPnhbhmU/uIAL+K5XVMQEFObeVW2173LXr4M9H5S0E7bBePsDSg
         ZxEA==
X-Gm-Message-State: AFuF++ln2Y9nFZTnptrwna4wtVCHGpQFI3VWP1JjtyTbCq1d3U0CUKsk
	2T79p2w7yuP+cNal8ob9UEHnquVqQgM7tdZhCXt28wB+hHwJ8OAcNnIvMWTR8plILHoghajgsx9
	88WhX4jg=
X-Gm-Gg: AYBFou32RUus2wmPQRyHa8cN905pR5MviK3bsNOFWwoIhY3HaYqUxvNLk9pBgIBJ0O/
	84pH9+5rIdCy++V34T0YJldfdVtTCGcs+72942xgdqNtXlM9iJEWs0eAARV8kZKmvF1tMUMuSSy
	FeGDNhA6ag1x5qhCbZsPMh07H277kl7t2C3CO5V/RxTdEk+SJohODUwhO4M+Lp2kRw/lF1eb5Kv
	HMrpK8QVUissFClo5TdgNm9X26nWXsolzCvDuhLioutqocSgK5NRXmYul+tJdDsEvbMmg8/ygWE
	LTTJxSFElgdEq6u+2i8t6ykz8fnjpCSYt5ffYRAfMAGCPnJUn2WPsXlFOu3TVcdF7Lg4Yq0uB6F
	QXxINo3/nNmN4hrbG/4RbPKXbpRNrPH6NcRRHJMUwe8rg84BGQxujCvjIt5toe6HGrPesbmpnbl
	LNi/SJyWv6Uv4fR9lZ2H9ZlwYKjBkBn9mCfGXc7AqKQDuoQdyxJrnQ4b+b68VdiiQfA2MoFZ6KK
	nORQqx23nQFfU27FnB/tmwfC+VPmm4l4sA6W3L9iWDzG41SPKweT2eMiyJA
X-Received: by 2002:a17:907:9409:b0:c26:1648:a067 with SMTP id a640c23a62f3a-c29b874c69amr512266b.34.1789336726118;
        Sun, 13 Sep 2026 14:58:46 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608e424sm332654466b.41.2026.09.13.14.58.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 14:58:45 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so353821166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:58:45 -0700 (PDT)
X-Received: by 2002:a17:906:c14f:b0:c29:5326:5a63 with SMTP id
 a640c23a62f3a-c29b8638aa8mr1439066b.16.1789336724962; Sun, 13 Sep 2026
 14:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 14:58:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYVzcwHBPTjpe4Sh7Jd8iXJZthzqHNrwevdci5d7ChiA@mail.gmail.com>
X-Gm-Features: AcwNN1VZ5F9rH0rLWu0URmq6vC_1A6jEXAFtoMlWn-v7_zaok0bdvKs6DIpvIhA
Message-ID: <CAHk-=wgYVzcwHBPTjpe4Sh7Jd8iXJZthzqHNrwevdci5d7ChiA@mail.gmail.com>
Subject: Linux 7.3-rc3
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Another fairly large rc release, and again one with a bigger
filesystem footprint that we usually see. This time it's mainly xfs
and the smb client, with some netfs and afs fixes (but also erofs and
btrfs).

Of course, "bigger filesystem footprint that we usually see" doesn't
mean huge: the *bulk* of the rc3 patch is still the driver side.
Mainly sound and networking drivers this time around: gpu drivers show
up, but they aren't really all that big. And various other stragglers
(

The rest is all over: various core kernel and networking fixes, some
landlock fixes (and selftests), arch fixes - mainly s390 and powerpc
this time around.

Please keep testing,

                  Linus

---

Aamir Ahmed (1):
      net: hinic: fix mailbox segment buffer overflow

Aaron Welwood (1):
      ASoC: amd: yc: add quirk for Acer Nitro AN17-41 internal mic

Aboorva Devarajan (1):
      powerpc/entry: Fix double accounting of user time on interrupt entry

Adrian Hunter (1):
      perf symbol: Do not use debug file as the binary type

Ahmet Eray Karadag (1):
      adfs: fix memory leak in sb->s_fs_info

Akiva Goldberger (1):
      net/mlx5: LAG, use local tracker to update active ports

Aleksei Sviridkin (5):
      net: macb: zero the link settings taprio reads back
      net: macb: reject an unknown link speed in the taprio setup
      net: phylink: initialise link_state before a forced major config
      net: dsa: mt7530: populate lpi_interfaces to fix EEE support
      net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE suppor=
t

Alexander Graf (1):
      virtio_ring: fix stale descriptor flags after a failed packed add

Alexandra Winter (2):
      dibs: Unregister dibs_class after error
      s390/ism: folio_put() after error

Ali Ahmet Memis (4):
      ufs: create the root dentry after loading cylinder metadata
      ufs: validate cylinder group metadata before caching it
      ufs: do not treat unreadable directory blocks as empty
      hwmon: (nct6694) do not expose enable on DTIN temperature channels

Ali Ahmet Memi=C5=9F (1):
      tracing: Don't dereference trace_event_file in deferred trigger free

Alice Mikityanska (4):
      net: ipv4: Fix UDP length overflow with PMTU discover and big MTU
      net: ipv6: Fix UDP length overflow with PMTU discover and big MTU
      selftests: net: Test UDP length overflow with PMTU discover and big M=
TU
      net: ipv6: Clamp to IP6_MAX_MTU in ip6_dst_mtu_maybe_forward

Andrea Parri (1):
      hrtimer: Use hard expiry when updating timers on the same base

Andrew Stellman (1):
      virtio-pci: return IRQ_HANDLED after non-zero ISR

Andy Chiu (2):
      riscv: hwprobe: initialize pair->value in hwprobe_one_pair()
      riscv: skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS

Andy Shevchenko (1):
      thermal: sysfs: switch to use scnprintf() to suppress truncation warn=
ing

Antoine Monnet (1):
      ASoC: tas2783-sdw: split a stereo stream across the two mono amps

Antonin Godard (1):
      Documentation: hwmon: replace full-width colon by a standard ASCII co=
lon

Antonio Borneo (1):
      MAINTAINERS: Update URI for watchdog tree

Anuj Gupta (2):
      xfs: release alleged child inode on metapath unlink error
      xfs: set IOMAP_F_INTEGRITY for zoned writes on integrity devices

Aohan Mei (1):
      smb: client: reject userspace cifs.idmap descriptions

Arda Do=C4=9Fu Ari (1):
      platform/x86: hp-wmi: Fix board_params typo for 8DD6 board

Arie Miller (2):
      hwmon: (asus_rog_ryujin) Validate HID report lengths
      hwmon: (asus_rog_ryujin) Synchronize HID command and report handling

Armin Wolf (1):
      platform/x86: asus-laptop: Fix ACPI event handling

Arunpravin Paneer Selvam (1):
      drm/amdgpu: skip the VMID 0 flush for VRAM

Athira Rajeev (1):
      selftests/powerpc/pmu/ebb: fix lost_exception_test hang with
sched yield change

Binglei Wang (1):
      erofs: add missing buf->off in erofs_bread()

Bjoern Doebel (4):
      smb: client: avoid leaking refcount in cifs_queue_oplock_break()
      smb: client: avoid leaking refcount when cifs_sb_tlink() fails
      smb: client: fix heap overflow in DACL owner/group rewrite
      smb: client: fail DACL rewrite when the new DACL exceeds 64K

Caleb Sander Mateos (1):
      io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags

Carolina Jubran (4):
      net/mlx5e: Fix ETS zero BW reporting when one TC holds 100%
      net/mlx5e: Fix use-after-free race in sample_restore_put()
      net/mlx5e: Keep HW timestamp stats monotonic across reconfiguration
      net/mlx5e: Move representor vnic reporter to eswitch devlink port

Cen Zhang (Microsoft) (1):
      reboot: fix cad_pid use-after-free race

Cezary Rojewski (10):
      ALSA: hda: ext: Clean up links if their initialization fails
      ALSA: hda: ext: Clean up streams if their initialization fails
      ASoC: Intel: avs: Clean up the bus when its initialization fails
      ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
      ASoC: Intel: avs: Clean up streams if their initialization fails
      ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
      ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
      ASoC: Intel: avs: Fix unbalanced module reference count
      ASoC: Intel: avs: Refactor and fix init_config access
      ASoC: Intel: avs: hda: Constrain MSBs on startup

Chengfeng Ye (3):
      afs: Clear stale peer app data after address list changes
      netfilter: cttimeout: prevent UAF during module unload
      netfilter: nf_log: unregister loggers before per-net teardown

Chenguang Zhao (1):
      net: 6lowpan: fix mismatched comments

Chengyu Zhu (1):
      erofs: delimit inode_share cache key components

Christoph Hellwig (11):
      xfs: fix the lock annotation on xfs_iget_cache_hit
      xfs: fix the lock annotation in xfs_extent_busy_update_extent
      xfs: fix the lock annotation in xfs_mru_cache_lookup
      xfs: improve lock annotations in the log code
      xfs: add lock annotations to xfs_try_open_zone
      xfs: add lock annotations to xlog_state_shutdown_callbacks
      xfs: add a lock annotation to xlog_cil_push_background
      xfs: add lock annotations to xfs_ail_delete*
      xfs: also flush the RT device cache in xlog_write_iclog
      xfs: don't continue on error in xfs_fsync
      xfs: avoid extra cache flushes for multi-device file systems in xfs_f=
sync

Colin Ian King (1):
      OPP: of: Fix potential multiplication overflow when calculating freq

Cong Nguyen (2):
      hwmon: (applesmc) fix key backlight workqueue leak on register failur=
e
      hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()

Daasaradhi Mannava (1):
      MAINTAINERS: Drop the nonexistent vsi-iommu.h file entry

Daehyeon Ko (1):
      exit: hold a reference to thread_pid across proc_flush_pid

Dapeng Mi (2):
      perf/x86/intel: Correct pt_regs->flags update for PEBS path
      perf/x86/intel: Prevent drain_pebs() reentry

Darrick J. Wong (50):
      xfs: fix media verification ioctl for internal rt volumes
      xfs: don't spin forever on zero-length dirents when salvaging them
      xfs: don't stash removename operations with unknown ftype
      xfs: log the tempip after we convert it to extents format
      xfs: fix parent rec lookup initialization in xrep_metapath_unlink
      xfs: handle reconnecting metadir subdirectories
      xfs: lock the healthmon when inserting unmount event
      xfs: fix unit conversions in per_binval computation
      xfs: fix short ifork reaping computation in xreap_bmapi_binval
      xfs: fix name string recording in slowpath pptr tracepoints
      xfs: don't leak dqacct if rhashtable insertion fails
      xfs: fix the rtrmap and rtrefcount _maxlevels_ondisk functions
      xfs: fix xfs_rtrmapbt_mem_cursor for non-rmap filesystems
      xfs: preserve owner on in-memory btree creation
      xfs: don't leak new_bp if xfs_btree_bload_drop_buf fails
      xfs: actually recover intended file sizes in xfs_xmi_item_recover_int=
ent
      xfs: don't modify file attributes or poke fsnotify for dry runs
      xfs: fix bnobt repair space reservation disposal failure
      xfs: always set xfs_healthmon::first_event when inserting at front of=
 list
      xfs: move healthmon event merge tracepoint
      xfs: port healthmon event list to list_head
      xfs: merge healthmon insert/push helpers
      xfs: check healthmon outbuffer space correctly
      xfs: bump lost_prev_errors if we lose even the healthmon lost event
      xfs: report nonexistent parents as a filesystem corruption
      xfs: destroy seen inode bitmap when we fail to add a dirpath
      xfs: signal inode btree xref error if get_rec returns an error
      xfs: truncate quota file correctly when repairing quota file
      xfs: compute dquot checksum after resetting dd_lsn in repair
      xfs: fix backwards skipping logic in xrep_quota_block
      xfs: fix backwards mergeability logic in refcount scrubber
      xfs: cross-reference the rtgroup superblock extent, not block
      xfs: use the rtgroup extent count to find rtrefcount gaps
      xfs: strengthen the "is cow staging" helpers in scrub
      xfs: fix rtrefcount btree block counting in scrub
      xfs: make the rtsummary repair fix the file size too
      xfs: count escaped corruption errors in scrub stats
      xfs: snapshot scrub stats when rendering them
      xfs: report healthy filesystem events in scrub stats
      xfs: report runtime failures in scrub
      xfs: remove redundant function declaration
      xfs: snapshot old AGFL before rewriting it
      xfs: bail out on bitmap errors in xrep_agfl_fill
      xfs: fix under-reservation of blocks when repairing sf directories
      xfs: actually check internal-rtdev fields in the superblock
      xfs: fix rtrmap cross-referencing elision logic
      xfs: fix termination logic in xchk_bmap
      xfs: fix replaying dirent removals into the temporary directory
      xfs: reset parent pointer args before each dir tree unlink repair
      xfs: advance the findparent inode scan cursor while holding ILOCK

David Arcari (1):
      watchdog: fix hrtimer start when pretimeout is zero

David Carlier (2):
      ieee802154: hwsim: serialize pib updates to fix double-free
      ring-buffer: Check resize_disabled before publishing the new subbuf o=
rder

David Howells (12):
      netfs: Fix unbuffered/DIO write partial transfer error return
      netfs: Fix error vs transferred passed to ->ki_complete()
      netfs: Fix i_size update for partial transfer
      netfs: Fix subreq ref leak
      netfs: Fix readahead synchronisation issues by loading all folios upf=
ront
      netfs: Mark folios with COPY_TO_CACHE whilst issuing subreqs
      netfs: Fix read progress reporting
      cachefiles: Fix potential UAF/KASAN warning
      afs: Fix missing kunmap in afs_dir_search_bucket()
      afs: Fix double-unmap of directory block
      afs: Fix incorrect free in candidate cleanup in afs_lookup_server()
      block: Fix start and length check added to iov_iter_extract_bvecs()

Dawid Osuchowski (1):
      accel/ivpu: Limit firmware log name prints to field size

Deepanshu Kartikey (1):
      xfs: take hm->lock in xfs_ioc_health_monitor() before insert

Devin Wittmayer (1):
      wifi: mt76: mt792x: fix NULL dereference in ACPI SAR init during prob=
e

Diego Oliva (2):
      smb: client: reject short READ responses in CIFSSMBRead()
      smb: client: reject out-of-bounds DataOffset in CIFSSMBRead()

Dinh Nguyen (1):
      EDAC/altera: Use parent device for devres in altr_portb_setup()

Dmitry Antipov (1):
      riscv: use string helper in setup_global_riscv_enable()

Dmitry Torokhov (6):
      platform/x86: x86-android-tablets: fix Arizona GPIO swnode references
      platform/x86: x86-android-tablets: hold device reference for
secondary fwnode teardown
      platform/x86: x86-android-tablets: pass node group to
gpio_secondary_fwnode_init()
      platform/x86: x86-android-tablets: add Crystal Cove GPIO swnode suppo=
rt
      platform/x86: x86-android-tablets: drop redundant swnode group on YT3
      platform/x86: x86-android-tablets: use shared battery swnode
group on Yoga Tab 2

Donggeun Yoo (15):
      regulator: pf1550: fix which regulator is notified
      net: phy: dp83867: handle the active-high LED polarity mode
      net: phy: dp83td510: handle the active-high LED polarity mode
      fgraph: Remove unused FGRAPH_MAX_INDEX
      function_graph: Use the saved entry's size when reprinting it
      tracing: Free histogram var refs regardless of how often they
are referenced
      tracing: Free histogram the var ref when its initialization fails
      tracing: Free histogram the field rejected for a bad modifier
      tracing: Keep the entry count when the histogram stats allocation fai=
ls
      tracing: Let histogram values keep the percent and graph modifiers
      tracing: Set the trace clock before registering the histogram trigger
      tracing: Take the reference before publishing the named histogram tri=
gger
      tracing: Undo the registration when enabling the histogram trigger fa=
ils
      tracing: Fix memory corruption from the histogram stacktrace modifier
      tracing: Fix memory corruption from a "STACKTRACE" histogram key

Dongli Zhang (2):
      vhost-scsi: use kvzalloc for vq array allocation
      vhost-scsi: clamp max_io_vqs module parameter

Edward Adam Davis (2):
      netfs: break unbuffered write when netfs_alloc_subrequest() fails
      ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev

Eelco Chaudron (1):
      openvswitch: fix wrong flag value in get_ipv6_ext_hdrs()

Eric Biggers (2):
      crypto: x86/aria - add missing vzeroupper in AVX2 code
      crypto: x86/aria - add missing vzeroupper in AVX-512 code

Eric Dumazet (2):
      bonding: use skb_cow_head() in bond_do_alb_xmit() and rlb_arp_xmit()
      vxlan: initialize _md in vxlan_xmit_one()

Eric Sandeen (2):
      xfs: fix reclaimed page accounting in xfs_buf_free
      xfs: mark slab-allocated xfs_buf backing memory as __GFP_RECLAIMABLE

Esben Haabendal (1):
      drm/bridge: ti-sn65dsi83: Fix error handling in sn65dsi83_reset_work(=
)

Ethan Nelson-Moore (1):
      ata: pata_legacy: remove documentation for removed module parameters

Eugenio P=C3=A9rez (1):
      virtio: add Eugenio P=C3=A9rez as Maintainer

Faicker Mo (1):
      net: net_failover: Fix the deadlock in net_failover_slave_name_change=
()

Fan Wu (3):
      ieee802154: cc2520: fix FIFOP work use-after-free
      smb: client: fix cifsFileInfo reference leak in deferred close
      hwmon: (gpio-fan) Fix use-after-free in alarm work

Fangyu Yu (3):
      iommu/riscv: Add command queue lock
      iommu/riscv: Serialize command queue publishing
      iommu/riscv: Avoid waiting on failed command enqueue

Fangzhi Zuo (2):
      drm/amd/display: Exit IPS before connector detection on resume
      drm/amd/display: Fix HF-VSDB DSC bpc detection to be cumulative

Filipe Manana (4):
      btrfs: fix unnecessary transaction commit fallback from
btrfs_log_all_parents()
      btrfs: tree-checker: validate key offset for inode ref keys
      btrfs: tree-checker: validate parent field for inode extref items
      btrfs: tree-checker: validate name length for extref items

Florian Westphal (3):
      netfilter: nfnetlink_log: cope with concurrent instance destruction
      netfilter: arp_tables: remove the 32bit compat interface
      netfilter: ip6_tables: set F_PROTO when proto value is nonzero

Fourie Zhang (1):
      net: mpls: clear inner_protocol when the last label is popped

Fredric Cover (1):
      smb: client: fill cache fields after populating cache in copy_ref_dat=
a()

Gabriel Krisman Bertazi (2):
      io_uring/net: let io_recv_buf_select return the length of the
buffer region
      io_uring/net: don't overconsume buffers when using MSG_TRUNC

Gabriel Windlin (1):
      MAINTAINERS: fix sysfs-platform-ayaneo-ec documentation path

Gang Yan (1):
      selftests: mptcp: fix an UAF in mptcp_connect.c

Gao Xiang (1):
      erofs: disable LZ4 rolling decompression for now

Gary Guo (1):
      rust: pin-init: use irrefutable pattern for `stack_pin_init`

Geert Uytterhoeven (1):
      hwmon: (ltc4282) Make sure clk_init_data is fully initialized

Greg Marsden (1):
      net/rds: fix tcp stream corruption with large pages

Guenter Roeck (5):
      Documentation/hwmon: Document hwmon_notify_event()
      hwmon: Fix potential UAF in pec_store
      hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon de=
vice
      hwmon: (sht4x) Add missing locks
      hwmon: (sht4x) Fix return value from heater_enable_store()

Hans Holmberg (1):
      xfs: prevent race in zoned space reservations

Hans de Goede (1):
      platform/x86: x86-android-tablets: fix
gpio_secondary_fwnode_init() not working

Haotian Zhang (1):
      media: v4l2-h264: Fix memcmp() size in B1 reference list comparison

Harald Freudenberger (11):
      s390/crypto: Fix skcipher_walk return code handling in aes_s390
      s390/crypto: Fix missing scrub of temp buffers with AES ctr and
gcm algorithm
      s390/crypto: Fix use of mutex in atomic context
      s390/crypto: Fix return code handling at skcipher_walk_done in
PAES algorithms
      s390/crypto: Fix missing scrub of temp buffers with PAES algorithm
      s390/crypto: Fix use of mutex in atomic context in PAES
      s390/crypto: Fix missing cra_flags in paes_s390
      s390/crypto: Fix handling of EBUSY in PAES when req is pushed to
crypto engine
      s390/crypto: Fix handling of EBUSY in PHMAC when req is pushed
to crypto engine
      s390/crypto: Fix wrong return code to engine in asynch callbacks
      s390/crypto: Map EBUSY to EIO when key conversion fails repeatedly

Harry Wentland (1):
      dm/amdgpu: fix malformed link_settings debugfs output

Harry Yoo (Meta) (1):
      mm/slab: take n->list_lock in __slab_try_return_freelist() to avoid r=
ace

Heiko Carstens (1):
      s390/crypto: Enable CONTEXT_ANALYSIS

Helge Deller (3):
      vt: hide cursor prior to font changes to avoid out-of-bound reads
      fbdev: omapfb: Fix __be32 sparse warning in panel_enabled()
      fbcon: Fix KASAN slab-out-of-bounds Read in fbcon_prepare_logo

Hemanth Selam (3):
      iommu/amd: Fix ineffective error check in nested domain allocation
      tracing: Fix typo "availabe" in comment
      tracing: Fix typo "preceeded" in comment

Henry Martin (1):
      tracing/user_events: Don't destroy fields when event removal fails

Hui Su (2):
      sched: Account cgroup CPU time to the execution context
      sched/core: Call wq_worker_tick() for the execution context

HyeongJun An (1):
      ALSA: hda: Report a change when only the channel status bytes move

Ibrahim Hashimov (1):
      mac802154: fix use-after-free of sdata via queued RX frames

Ido Schimmel (2):
      tunnels: Drop stale dst when building an ICMP error for PMTUD
      nexthop: Initialize extack in remove_nh_grp_entry()

Igor Paunovic (2):
      drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
      drm/rockchip: rk3066_hdmi: Add missing Kconfig selects

Ilya Maximets (1):
      netfilter: report NLM_F_DUMP_FILTERED when all is filtered out

Ivan Hu (1):
      Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware

Ivy Lopez (1):
      riscv: hwprobe: simplify has_fpu() to check D extension only

Jack Yu (1):
      ASoC: rt721-sdca: Adjust latency control to fix no-sound issue

Jacob Keller (1):
      ice: add missing xa_destroy for sched_node_ids

Jairaj Arava (1):
      ASoC: Intel: sof_rt5682: Add support for nvl_max98360a_rt5682

Jakub Kicinski (6):
      net: dsa: bcm_sf2: bound the CFP rule dump by the caller's buffer siz=
e
      eth: nfp: bound the ntuple rule dump by the caller's buffer size
      eth: nfp: drop the replaced rule from the list when reprogramming fai=
ls
      net: dsa: mv88e6xxx: bound the policy rule dump by the caller's
buffer size
      ethtool: document that GRXCLSRLALL rule_cnt is a caller-provided limi=
t
      eth: ice: don't dereference pointers from TP_printk()

Jamal Hadi Salim (12):
      net: cap tx_queue_len at S16_MAX to prevent oversized ring allocation=
s
      net: reject oversized tx_queue_len at netlink parse time
      selftests: tc-testing: add tx_queue_len cap regression tests
      net/sched: fq: clamp quantum and initial_quantum in change path
      net/sched: fq_pie: clamp quantum in change path
      net/sched: sfq: clamp quantum in change path
      net/sched: hhf: clamp quantum in change and init paths
      net/sched: dualpi2: clamp psched_mtu at all call sites
      net/sched: pie: clamp psched_mtu in pie_drop_early
      net/sched: drr: clamp quantum in change class
      net/sched: ets: clamp quantum in parse and fallback paths
      selftests: tc-testing: update ETS test 41f5 for clamped quanta

James Hilliard (1):
      watchdog: sunxi_wdt: preserve boot-enabled watchdog

Jan Havran (Advantech Czech) (1):
      net: dsa: lantiq_gswip: fix GSWIP_MDIO_PHY_FCONTX_EN value

Jan Kara (1):
      ext4: Avoid entering writeback paths during fastcommit replay

Jann Horn (1):
      exec: do_close_on_exec() before taking exec_update_lock

Jared Kangas (4):
      hwmon: (ina2xx) Acquire hwmon_lock in shunt_resistor_show()
      hwmon: (ina2xx) Parameterize ina2xx_data in ina226_alert_read()
      hwmon: (ina2xx) Replace masks with enum in alert functions
      hwmon: (ina2xx) Decouple in0 and curr1 alarms

Jasjeet Rangi (1):
      x86/MCE/AMD: Fix inverted interrupt enablement during storm handling

Jason Andryuk (2):
      x86/amd_node: Avoid divide by zero on virtualized systems
      x86/amd_node: Fix potential NULL pointer dereference

Jason Winter (1):
      net: usb: cx82310_eth: drop URB after 0xffff reboot sentinel to
prevent partial_data heap overflow

Javier Carrasco (1):
      hwmon: (chipcap2) fix channels in humidity alarm notifications

Javier Tia (6):
      xfs: initialise error in xfs_defer_finish_one()
      xfs: give the deferred barrier op type a name
      xfs: report the error that made deferred work shut down the fs
      xfs: correct the parent pointer space reservation comment
      xfs: initialise args->total for parent pointer updates
      xfs: assert the reservation covers each da fork growth

Jeffin Philip (1):
      fs: autofs: fix memory leak in autofs_fill_super()

Jens Axboe (3):
      io_uring/rw: end write accounting from ->ki_complete
      sunvdc: fix -EIO issue due to lack of retries
      mailmap: update entry for Jens Axboe

Jia Jia (4):
      virtio_console: do not free control-out buffers on remove
      vhost/vdpa: reject VRING_NUM larger than device max
      vduse: validate virtqueue alignment
      vhost: invalidate vring access on IOTLB transitions

Jia Wang (2):
      dt-bindings: riscv: cpus: Fix yamllint style issues
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for UltraRISC DP100=
0 SoC

Jiajia Liu (2):
      Bluetooth: btusb: mediatek: Fix leaked runtime PM reference in reset
      Bluetooth: btusb: Fix leaked runtime PM reference in btusb_reset

Jiangshan Yi (1):
      powerpc/pseries/pci: Fix misleading VF limit error message

JinRui (1):
      riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present

Jingbo Xu (1):
      erofs: add sysfs feature entry for xattr prefixes

Jisheng Zhang (1):
      riscv: bug: Make RV32 use GENERIC_BUG_RELATIVE_POINTERS

Joas Antonio dos Santos (1):
      netfilter: nf_conntrack_sip: fix OOB read in sip_skip_whitespace()

Joe Damato (7):
      bnxt_en: Prevent queue stop with deferred completions
      bnxt_en: Only restore LRO if the device supports TPA
      bnxt_en: Don't free the live ring's TPA state on queue restart failur=
e
      bnxt_en: Propagate TPA buffer allocation failures in
bnxt_queue_mem_alloc()
      bnxt_en: Handle buffer allocation failure in bnxt_rx_ring_reset()
      bnxt_en: Propagate RX ring init failures in bnxt_init_nic()
      bnxt_en: Bound SW TPA IDs to prevent crashes

Johan Hovold (2):
      console: fix /dev/kmsg reference in flags kernel doc
      net: hso: fix TIOCMIWAIT race

Johannes Thumshirn (1):
      btrfs: set space_info before adding new free space in
btrfs_make_block_group()

John Hubbard (1):
      rust: allow `clippy::as_underscore` in the generated bindings

John Ogness (2):
      printk/nbcon: Flush nbcon_irq_work in nbcon_free()
      printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY

Josh Poimboeuf (1):
      objtool/klp: Fix checksums for constant pool references

Joshua Hay (1):
      idpf: account for VLAN header when parsing RSC packet header

Justin Chen (2):
      net: bcmasp: clear txcb->last before writing each descriptor
      net: bcmasp: fix tx_spb_ring_full() checking same slot cnt times

J=C3=A9r=C3=A9my Jean (2):
      nsfs: keep namespace tree fields stable until after RCU grace period
      ftrace: fork: Initialize function graph state before copy_exec_state(=
)

Kalpan Jani (1):
      mptcp: pm: kernel: drop pending ADD_ADDR when removing ID0

Karl Mehltretter (10):
      netfs: Fix uninitialized return value in netfs_unbuffered_write()
      smb: client: pin DFS superblock in iterator callback
      syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
      iommu/amd: Do not reallocate GA log buffers on resume
      virtio: fix use-after-free in unregister_virtio_device()
      virtio_input: stop callbacks before unregistering input device
      drm/adp: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
      drm/logicvc: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HE=
LPER
      MAINTAINERS: Update the so_txtime selftest path in SOCKET TIMESTAMPIN=
G
      tracing: Fix ring_buffer_read_page_size() kernel-doc

Kazuki Hanai (1):
      ALSA: us122l: Prevent write upgrades for read mappings

Kevin Wang (2):
      drm/amd/pm: fix gpu metrics energy accumulator for smu 13.0.0/13.0.7
      drm/amd/pm: report energy accumulator for smu 13.0.0

Kiran K (2):
      Bluetooth: btintel_pcie: validate packet_len before skb_put_data
      Bluetooth: btintel_pcie: fix tx_handle bounds off-by-one

Krish Gulati (1):
      ALSA: hda/realtek: Add quirk for HP Omen 16-wd0xxx mute LED

Krystian Kaniewski (1):
      Bluetooth: hci_sysfs: Fix NULL pointer dereference in device_del()

Kuniyuki Iwashima (4):
      af_unix: Update last skb marker in manage_oob().
      af_unix: Return immediately when manage_oob() returns NULL for
0-length buffer.
      selftest: af_unix: Add zero-buffer test for msg_oob.c
      net/sched: cls_api: Don't replay RTM_GETCHAIN in tc_ctl_chain().

Kunwu Chan (1):
      powerpc/pasemi: Add a null pointer check to the pas_setup_mce_regs

Kyle Zeng (2):
      ipvs: reject invalid states in connection template sync records
      ipvs: fix reversed sequence option serialization

Lama Kayal (1):
      net/mlx5: E-Switch, prevent mc_list repopulation during vport disable

Laurent Vivier (1):
      MAINTAINERS: Add a section for virtio-rng

Laxman Acharya Padhya (1):
      wifi: mt76: mt7921: skip unknown CLC firmware records

Leon Hwang (1):
      ftrace: Use rcu_assign_pointer() for tmp_ops filter hash

Leonardo Costa (1):
      drm/bridge: tc358768: Enforce input bus flags via atomic_check

Li Youhong (1):
      net: sun4i-emac: fix missing of_node_put() for phy_node

Lin Jiapeng (1):
      xfs: fix exchange-range reflink flag clearing issue with INO1_WRITTEN

Linfeng Sun (4):
      vdpa_sim_blk: reject out-of-range sector starts
      vdpa_sim_net: check TX pull result before RX copy
      vhost: limit outstanding IOTLB misses per virtqueue
      vduse: return compat ioctl results directly

Linmao Li (5):
      media: rppx1: describe the MAIN_POST white balance gains block
      media: rppx1: bls: read the raw pattern from the PRE2 acquisition mod=
ule
      hwmon: (corsair-cpro) Create debugfs entries after hwmon registration
      hwmon: (corsair-cpro) Remove debugfs entries when probe fails
      fbdev: atafb: Restrict SuperBlitter to supported formats

Linus Torvalds (1):
      Linux 7.3-rc3

Linus Walleij (20):
      ASoC: ab8500: Reset the audio block before configuring it
      ASoC: ab8500: Repair the DAPM capture graph
      ASoC: ab8500: Correct digital interface format setup
      ASoC: ab8500: Validate and program TDM slots correctly
      ASoC: ab8500: Remove the nonfunctional sidetone apply control
      ASoC: ab8500: Skip missing DMIC GPIOs on AB8505
      ASoC: ux500: Fix MSP stream lifecycle handling
      ASoC: ux500: Propagate MSP setup errors
      ASoC: ux500: Correct MSP frame and bit clock setup
      ASoC: ux500: Validate MSP DAI configuration
      ASoC: ux500: Deassert the MSP reset during probe
      ASoC: ux500: Request the MSP MMIO resource
      ASoC: ux500: Remove obsolete PRCMU QoS calls
      ASoC: ux500: Allow repeated MSP prepare calls
      ASoC: ux500: Program the MSP FIFO watermarks
      net: ethernet: cortina: Fix budget accounting
      net: ethernet: cortina: Finish RX updates before NAPI completion
      net: ethernet: cortina: Count dropped frames as NAPI work
      net: ethernet: cortina: Count RX drops once per frame
      net: ethernet: cortina: Count RX descriptors for freeq refill

Long Li (2):
      net: mana: Clear RDMA teardown and suspend state in mana_rdma_probe()
      net: mana: restore the XDP program pointer when pre-allocation fails

Lorenzo Bianconi (3):
      mailmap: add entries for Lorenzo Bianconi
      net: stmmac: initialize ptp_lock at probe time
      net: stmmac: fix TX descriptor availability check for TSO traffic

Lorenzo Stoakes (ARM) (2):
      scripts/mksysmap: drop the MODULE_INFO() symbols from kallsyms
      scripts/mksysmap: fix escape of '$' in the __pi_ pattern

Luiz Augusto von Dentz (2):
      Bluetooth: btusb: Fix UAF of btusb_data by rx_work
      Bluetooth: hci_sync: Fix not setting CE length properly

MD Danish Anwar (1):
      net: hsr: enable promiscuous mode on interlink port with fwd offload

Madhavan Srinivasan (1):
      MAINTAINERS: powerpc: Add Ritesh and Shrikanth

Magdalena Schulfer (2):
      accel/ivpu: Validate full buffer range in ivpu_to_cpu_addr
      accel/ivpu: Validate firmware log buffer metadata

Mahmoud Nagy Adam (1):
      selftests: ublk: install test_common.sh and trace/ scripts

Marek Vasut (1):
      net: ks8851: Fix receiver error in 100BASE-TX mode following
software power-down

Masami Hiramatsu (Google) (2):
      tools/bootconfig: Fix integer overflow and truncation in size checks
      bootconfig: Fix integer overflow in initrd size check

Matthieu Baerts (NGI0) (7):
      mptcp: subflow: no need to copy thmac during ulp_clone
      mptcp: syncookies: remember the request backup flag
      mptcp: options: handle MPC data + csum reqd + no csum
      mptcp: pm: reset retrans_time when ADD_ADDR entry is reused
      selftests: mptcp: lib: dump nstat for the right test
      selftests: mptcp: lib: get counters for the right test
      mptcp: options: fix uninit-value in mptcp_write_data_fin

Mehmet Koseoglu (1):
      rust: samples: add missing newlines in rust_print_main

Michael Bommarito (8):
      media: v4l2-ctrls: validate HEVC tile counts
      media: v4l2-ctrls: validate AV1 tile counts
      media: hevc: add bounded tile-count helpers
      media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
      media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer cap=
acity
      media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffe=
r
      media: verisilicon: rockchip: reject AV1 frames exceeding the
tile capacity
      media: mediatek: vcodec: bound AV1 tile-start copy to the array capac=
ity

Michail Tatas (1):
      powerpc/pseries/htmdump: Fix leak in htmdump_init_debugfs

Michel D=C3=A4nzer (1):
      drm/amd/display: Consult MCCS FreeSync cap only if requested & suppor=
ted

Micka=C3=ABl Sala=C3=BCn (4):
      selftests/landlock: Test abstract socket trace name limits
      landlock: Clean up ruleset validation checks
      landlock: Bound escaped trace path output
      landlock: Test trace path output boundaries

Miguel Ojeda (2):
      drm/panic: clean new `clippy::needless_range_loop` lint for Rust 1.10=
0.0
      rust: allow `unknown_lints` in generated bindings for Rust < 1.88

Mikhail Zaslonko (3):
      s390/debug: Fix NULL pointer dereference in debug_set_level()
      s390/debug: Do not repeat parameter override notice on debug_set_leve=
l()
      s390/debug: Fix race between debug area resize and event logging

Miklos Szeredi (1):
      ovl: return EINVAL instead of EIO in case of mismatched user_ns

Mitul Golani (1):
      drm/i915/dp: Gate UHBR SST SDP splitting on sink capability

Moritz Tanner (1):
      fs: don't return -EINVAL for successful nested thaw

Mukesh Kumar Chaurasiya (IBM) (1):
      powerpc/entry: Fix irq_soft_mask corruption on replayed interrupt exi=
t

Myeonghun Pak (2):
      idpf: disable DIM work before freeing q_vectors
      idpf: disable PTM on probe failure and on remove

Nagamani PV (1):
      s390/qeth: allow bridgeport queries despite OS_MISMATCH

Naman Gulati (1):
      ipv6: null-check fib6_node before accessing in __ip6_del_rt_siblings(=
)

Nathan Chancellor (2):
      drm/amd/display: Shorten hdmi_frl_status_polling_workqueue
      scripts/sorttable: Mark long_size as __maybe_unused

Nick Pegg (1):
      ALSA: usb-audio: Add quirk flags for Behringer UV1

Nicolai Buchwitz (2):
      net: macb: destroy the phylink instance on the probe error path
      net: macb: put the "mdio" child node reference on success

Nikhil (1):
      vduse: do not take dev->rwsem in the virtqueue kick path

Nikhil Gurudasani (2):
      erofs: preserve LZMA decoders on resize failure
      hwmon: (mcp9982) Propagate one-shot polling errors

Nikhil P. Rao (3):
      ionic: use netif_txq_maybe_stop() in ionic_tx()
      pds_core: fix cmd_regs access racing BAR unmap on reset
      pds_core: don't release PCI regions for VFs on reset

Niklas Schnelle (1):
      iommu/s390: Fix NULL dereference in iova_to_phys() with
ZPCI_TABLE_TYPE_RFX

Nikolay Aleksandrov (1):
      net: bridge: mcast: properly convert mglist to rcu

Niranjan H Y (1):
      ASoC: Intel: sof_sdw: add tac5xx2-sdw family

Norbert Szetei (3):
      landlock: Fix use-after-free of the source's parent directory
      net: openvswitch: fix use-after-free of the flow table mask array
      nstree: check listing permission before taking a namespace reference

Paolo Abeni (5):
      mptcp: do not reschedule the RTX timer for fallback sockets
      mptcp: prevent race between disconnect() and rtx
      mptcp: remove unneeded READ_ONCE() annotation
      mptcp: being below memory limit is a likely() condition
      mptcp: avoid pruning for OoW data

Paulo Alcantara (8):
      smb: client: fix uid/gid override in getattr with posix extensions
      smb: client: honor forceuid/forcegid when mapping SIDs to uid/gid
      smb: client: fix WSL reparse point uid/gid override
      smb: client: avoid using uninitialized SIDs in cifs_posix_to_fattr()
      smb: client: fix file type corruption in wsl_to_fattr()
      smb: client: fix file type corruption in posix_reparse_to_fattr()
      smb: client: fix file type corruption in cifs_reparse_point_to_fattr(=
)
      smb: client: fix one-byte OOB read in smb2_parse_native_symlink()

Pavel Begunkov (1):
      tcp: reject non zerocopy devmem tx

Pedro Falcato (1):
      platform/x86/amd/pmf: fix build on !CONFIG_AMD_PMF_DEBUG

Pengpeng Hou (1):
      hwmon: (aspeed-pwm-tacho) Propagate reset deassert errors

Peter Griffin (1):
      opp: fix use after free in _update_opp_table_clk()

Prike Liang (1):
      drm/amdgpu: skip gfx switch_power_profile during GPU reset

Qing Luo (1):
      mptcp: pm: userspace: fix address ID overflow

Qingfang Deng (1):
      ppp_synctty: ensure a writeable skb header

Qinyun Tan (4):
      drm/ast: create blend mode property on cursor plane
      drm/qxl: create blend mode property on primary and cursor planes
      drm/virtio: create blend mode property on cursor plane
      drm/vboxvideo: create blend mode property on planes

Ratheesh Kannoth (2):
      octeontx2-pf: reset HTB scheduler topology before freeing queues
      octeontx2-af: fix PF/CGX debugfs PCI bus lookup

Richard Fitzgerald (3):
      ASoC: cs35l56: Fix pm_runtime imbalance if suspending before first at=
tach
      ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration
      ASoC: cs35l56: Fix race between kexec and snd_soc_register_component(=
)

Ritesh Harjani (IBM) (2):
      powerpc: Don't drop _TIF_RESTOREALL on syscall restart
      powerpc: Do not restore KUAP in arch_exit_to_user_mode_prepare()

Rob Herring (Arm) (5):
      accel: ethosu: Fix ethosu_job_open() return value
      accel: ethosu: Drop IRQF_SHARED flag
      accel: ethosu: Ensure cmd stream ends with a stop op
      accel: ethosu: Ensure SRAM size is 0 on mapping failure
      accel: ethosu: Ensure SRAM region size matches job

Roman Prucha (1):
      ALSA: ctxfi: Fix CA20K2 S/PDIF passthrough

Rong Zhang (2):
      Bluetooth: Properly disable remote wakeup for MT7922/MT7925 on
Ryzen platform
      Bluetooth: btrtl: Don't leak return code when parsing firmware format=
 v2

Ruairi Anthony (1):
      ALSA: hda/realtek: Add quirk for HP Elite Dragonfly Max G2 speaker

Rudi Heitbaum (1):
      regulator: dt-bindings: fan53555: add tcs,tcs4526

Runyu Xiao (3):
      ASoC: sti: initialize IRQ lock before requesting IRQ
      cpufreq: initialize policy rwsem before sysfs publication
      net: macb: initialize PTP state before registering clock

Sahil Chandna (1):
      net: mana: Reserve extra CQ slot for the fence completion CQE

Samuel Holland (1):
      Revert "riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set"

Sascha Bischoff (1):
      irqchip/gic-v5: Preserve ICC_CR0_EL1 state

Satish Kharat (2):
      enic: preserve V2 VF carrier across netdev reopen
      enic: match mailbox replies to request numbers

Satyajit Roy (3):
      drm/amd/display: Propagate HDMI RGB quantization selectability
      drm/amd/display: Honor Broadcast RGB for BT.2020 RGB output
      drm/amd/display: Rebuild InfoFrames on output color space changes

Sebastian Andrzej Siewior (1):
      ring-buffer: Acquire the lock with irqsave in rb_wake_up_waiters()

Sebastian Dalfu=C3=9F (1):
      ALSA: usb-audio: Add boot quirk for Behringer CM1A

Sebastian Sjoholm (1):
      net: usb: qmi_wwan: add Quectel RG660QB

Sergey Zagursky (1):
      media: ipu-bridge: do not use the CVS device lookup for IVSC

Seungwon Bae (1):
      vxlan: reject dynamic fdb entries that reference a nexthop id

Shahar Shitrit (3):
      net/mlx5e: Fix missing FEC mode mapping for RS_544_514_INTERLEAVED_QU=
AD
      net/mlx5e: Fix setting RS FEC after remapping
      net/mlx5e: Fix reporting support for all RS FEC variants

Shivaprasad G Bhat (3):
      powerpc: pci-ioda: Fix the stale irq chip reference
      powerpc/eeh: Fix recursive locking on devices without EEH sensitive d=
river
      powerpc/rtas_pci: No hotplug on permanently removed device on pSeries

Shixiong Ou (1):
      drm/sched: Create a fake device for KUnit tests

Shrikanth Hegde (1):
      powerpc/entry: Clear TIF_SYSCALL_RET before syscall error return

Shuming Fan (6):
      ASoC: rt766: fix uninitialized stream_config->type
      ASoC: rt712: fix uninitialized stream_config->type
      ASoC: rt1320: fix uninitialized stream_config->type
      ASoC: rt1318: fix uninitialized stream_config->type
      ASoC: rt721: fix uninitialized stream_config->type
      ASoC: rt722: fix uninitialized stream_config->type

Sourabh Jain (2):
      powerpc/kexec_file: print configured kernel command line
      powerpc/prom: Remove redundant early_init_dt_scan_root() call

Steven Rostedt (1):
      tracing: Take trace_array reference when opening a tracer options fil=
e

Stian Halseth (1):
      sunvdc: unmap LDC cookies when the descriptor send fails

Sumeet Pawnikar (1):
      opp: Use %pe to print symbolic error name

Sun Jian (1):
      exec: Drop bprm loader before closing bprm->file

Sunil Khatri (1):
      drm/drm_exec: fix up contended obj when num_objects is 0

Syed Saba Kareem (1):
      ASoC: amd: yc: Add DMI entry for HP 255R G10 laptop

Takashi Iwai (4):
      ALSA: usb: ua101: Avoid embedded URBs
      ALSA: usb: hiface: Avoid embedded URBs
      ALSA: usb: 6fire: Avoid embedded URBs
      ALSA: hdspm: Add a new PCI device ID (1d18:3fc6) for RME HDSPe
AIO PCI express audio

Taylor Bates (1):
      mlxsw: spectrum_ptp: Fix napi_gro_receive() call from GC workqueue co=
ntext

Tetsuo Handa (1):
      printk: Don't WARN on kthread_run failure.

Thadeu Lima de Souza Cascardo (1):
      Revert "drm/amdgpu: debugfs: avoid extra EOLs in amdgpu_gem_info"

Thibault Ferrante (1):
      selftests/powerpc/tm: Fix tcheck() reading uninitialised CR value

Thomas Gleixner (2):
      tick/broadcast: Plug clockevents replacement race
      entry: Guard syscall_enter_audit() invocation with CONFIG_AUDITSYSCAL=
L

Thomas Hellstr=C3=B6m (1):
      drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches

Thomas Huth (1):
      kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__

Thomas Richter (4):
      s390/pai: Use PAI PMU index as parameter replacing event
      s390/pai: Move locking to event init and delete
      s390/pai: Support CPU hotplug for PMU PAI
      perf/core: Allow list_del during perf_event_overflow()

Thomas Wei=C3=9Fschuh (1):
      tracing: Restore :mod: trailer after parsing in ftrace_set_clr_event(=
)

Thorsten Blum (5):
      powerpc/kexec_file: Use inclusive range checks in add_usable_mem()
      powerpc/kexec: Simplify kdump_extra_elfcorehdr_size()
      powerpc/kexec_file: Use inclusive range checks for excluded memory
      powerpc/ps3: Fix repository.c build failure
      drm/i915: Fix memory leak in query_perf_config_list()

Tianchu Chen (1):
      ASoC: sprd: validate compress buffer sizes against fixed allocations

Tristan Madani (2):
      ALSA: usbusx2y: fix in04_last array size mismatch with in04_buf
      ALSA: usbusx2y: validate URB actual_length in interrupt callback

Tzung-Bi Shih (7):
      watchdog: msc313e: Fix NULL pointer dereference in PM callbacks
      watchdog: msc313e: Avoid division by zero
      watchdog: msc313e: Fix clock leak and spurious timer in settimeout()
      watchdog: msc313e: Enable clock before accessing hardware registers
      watchdog: msc313e: Fix spurious reset on suspend
      watchdog: msc313e: Fix undefined behavior
      watchdog: msc313e: Sync timeout value if WDT was running at boot

Varun Gupta (1):
      drm/xe: Guard page-fault worker with runtime PM check

Vasant Hegde (5):
      iommu/amd: Fix premature break in init_iommu_one() again
      iommu/amd: Make iommu_sva_set_dev_pasid as static
      iommu/amd: Remove redundant check in irq_remapping_select()
      iommu/amd: Remove redundant checks from interrupt handler path
      iommu/amd: Remove unused macro

Vasileios Almpanis (2):
      configfs: pin the symlink target's dirent instead of chasing ->ci_den=
try
      configfs: unhash the dentry before dropping the item in rmdir

Victor Nogueira (4):
      net/sched: cls_route: free emptied bucket on filter move
      net/sched: cls_route: Reject handle aliasing
      net/sched: cls_route: Fix in-place replace
      selftests/tc-testing: Add cls_route bucket move and change tests

Vincent Donnefort (2):
      tracing/remotes: Account for ring buffer page header in size calculat=
ion
      tracing/remotes: Catch nr_page_va overflow in ring_buffer_desc sizing

Vincent Guittot (2):
      sched/eevdf: Fix augmented max_slice
      sched/eevdf: Fix rb augmented with multi fields

Vineeth Karumanchi (1):
      net: macb: fix NULL pointer dereference on unbind with fixed-link

Vishnu Razdan (1):
      hwmon: (pmbus) Clear generic status alarms with CLEAR_FAULTS

Viswajith Murali (1):
      octeontx2-af: mcs: Clear stale X2P calibration state before calibrati=
on

Vlad Poenaru (1):
      kbuild: don't delete in-flight filechk temporaries in asm-headers

Vladislav Karmanov (1):
      net: phy: mediatek-ge: disable EEE on the MT7530 PHY

Vlastimil Babka (SUSE) (1):
      mm/slab: disallow kfree_rcu_sheaf() on PREEMPT_RT again

Vlatko Kosturjak (1):
      ppp_async: drop the errored frame instead of resetting its headroom

Wang Yan (1):
      perf powerpc-vpadtl: Fix raw_size of DTL samples

Weiming Shi (3):
      net/sched: defer qdisc freeing after failed creation
      net: dsa: tag_brcm: legacy FCS: request needed tailroom
      fbdev: vfb: defer cleanup until the last reference

Xiaofeng Yuan (2):
      riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE=
_RWX
      riscv: patch: skip fixmap mapping when kernel text is already writabl=
e

XingWang Xiang (2):
      genetlink: pin family module during policy dump
      net: mctp: i3c: serialize probe with bus removal

Xiong Weimin (8):
      virtio_mmio: disable IRQ wake before free_irq
      vdpa/pds: check virtqueue notify mapping
      vdpa: alibaba: Keep DRIVER_OK clear if IRQ setup fails
      vdpa: solidrun: Free IRQs after request failure
      vdpa: ifcvf: Put device on unsupported feature error
      vdpa: octeon_ep: Check dev_set_name() in dev add
      virtio-vdpa: Use queue id when setting vq affinity
      virtio_input: reset device if input_register_device() fails

Xixin Liu (3):
      perf: RISC-V: use BIT_ULL for u64 overflow masks
      perf: RISC-V: store available counter mask as bitmap
      perf: RISC-V: check cpu_hw_evt before dereference in overflow IRQ

Xu Rao (1):
      Bluetooth: btqcomsmd: destroy RPMsg endpoints before freeing hci_dev

Xuanqiang Luo (2):
      net/sched: act_api: release all action references on NEWACTION failur=
e
      selftests: tc-testing: test action batch failure cleanup

Yael Chemla (1):
      net/mlx5: E-Switch: fix use-after-free in mlx5_eswitch_termtbl_put

Yafang Shao (1):
      klp-build: Fix wrong index in funcs cleanup error path

Yang Xiuwei (2):
      ublk: clear force_abort in ublk_queue_reset_io_flags()
      selftests: ublk: add batch IO cases to recover_03

Yang Zi (1):
      fbdev: ssd1307fb: fix NULL pointer dereference on missing match data

Yilin Zhang (1):
      inet: frags: invalidate queues before flushing them

Yorick Rommers (1):
      ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards

Younes Akhouayri (1):
      rust: num: seal Integer

Yu Zhang (2):
      vhost-vdpa: don't install the eventfd_ctx_fdget() error in config_ctx
      vhost-vdpa: protect config_ctx from being freed under the config call=
back

Yudi Yang (1):
      drm/rockchip: analogix_dp: fix unchecked bound endpoint name length

Yukai Wu (1):
      docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation

Zhang Yi (2):
      ASoC: codecs: ES8326: issue about capture pop
      ASoC: codecs: ES8389: Prevent enable_count underflow in clk_core_disa=
ble

Zhiling Zou (3):
      ieee802154: 6lowpan: fix NULL dereference in lowpan_newlink
      ipv6: flowlabel: cap duplicate leases per socket
      net: bridge: use option bits for CFM/MRP frame handlers

Zhongqiu Han (1):
      cpufreq: zero-initialize policy cpumask before sysfs publication

Zihan Xi (3):
      ipv4: fib: bound automatic table ID allocation
      ipv6: fix fib6 walker UAF on seq stop
      ipmr: account multicast table and route memory

Zizhi Wo (1):
      xfs: remove several unused and never-implemented declarations

hanzhijian (1):
      hwmon: (yogafan) fix non-kernel-doc comment

hpp.iscas (3):
      ASoC: bcm: bcm63xx: Publish the OF module aliases
      ASoC: Intel: SST: Publish the PCI module aliases
      ASoC: mt6351: Publish the OF module alias

leixiang (1):
      KVM: PPC: Book3S HV: Set irqfd->producer only on success

longlong yan (1):
      selftests/powerpc: use MAP_FAILED instead of (void *)-1 in
tm-signal-context-force-tm

wangdicheng (2):
      ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits
      ASoC: amd: yc: fix memory leak in acp6x_pdm_dma_close()

=C8=98tefan Ghe=C8=9Bu (1):
      ASoC: fsl_micfil: balance mclk enable/disable
