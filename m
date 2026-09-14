Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597B93914EB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417456; cv=none; b=OFEW1MlziI6hUqH8Rpq8Bnjk1tyzXxCQiJfzLY3jhR0YsX3onnyfwlf33TNukLASWg6xijnWlQ5SPOcIMXWaUAOiQRA9DMltp4MLOvGjub3nrW+dW8bzAh5zgQYVOzlQW9GI+eGV4a3Nst9sqkuy0fKbDs6puP+MmYhp74/LAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417456; c=relaxed/simple;
	bh=V6WNtKQ4jADi8tTtCkgNPx6V5ss41Ldy2khPHqgLAco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uivj22CKDUE/dfhN7BjEJE8N0aylisgmaqik+7f9oYLvvls8bOm2+gI/+yczz76NilXW0n8oqMNHsOXbPnpa3MDZAyPUfJjjsISshgsOz7HyUGXtCcvfJRTOk6rbWS9hXCJ5EDTPoDsUQsdxulQ1/xoA6/D/7k0h9TXVyfsVRrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LXXWgAtR; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LXXWgAtR"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7f57db8b5a4so3352042a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417454; x=1790022254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zKVHktddFg18lNwT1KKe1iRzZT/GYvNrBGD0jhLiuz0=;
        b=UwVz17r+x5b434QXrLOxegNUKmYhve0hVsBi9ctboxirH1zS0padMR8+tlFLI1AoCh
         7/fMsuEStqpQGr5q9NCOdrNBVZP/j1gYsD7icGnmBDULNY82CDn/xGLJE3v1uxgHHrCz
         6X+EqAUFCJIEOQ/EDKgq8l5awMzRRfrNnQwwekmQpKnp6LQC23OQ4EA+hsl7aEVqkYMd
         bf87Ibr3r3bgWHqUcnTXvosn3te2zq95mdIcGTmtAGMyGxg3Ynkja652DNGL/na/Lu0G
         rh3QABbR8NE2boDk+PRW6fL8M7k5BnyCdwLI+2LV80J8Pd1hbeG8Xm9vtP2x+PVoJQ+G
         r9xg==
X-Forwarded-Encrypted: i=1; AKwUvBxUh26Vv8ZhRjkT1J8so5ncw4skg0qmF8h6+cxuPn/ciZ0kMqFR1evwFuS4vo17HYdrkxX5K0eAJMEOmKI=@vger.kernel.org
X-Gm-Message-State: AFuF++m0o5Kd3M7z5c0gtZm+0yncWp4zosATByZ+n3nPg0h6mxRDz+xd
	HGOgS/ULAAirA+Swjm9FOpunDEOSRa0BoegEqMqv8f/ZoHfaK75c8MOvFT3YtWNddywBVNwIkVw
	vza82oGvW7PudoXZ9PX/tCR2EOiiiBsFjhmrAkrjvAFyhI3kl/2zdJIUyMLDpQNnnpKiiN0RCXP
	UeoEH5KRdLW9QxScLtUQ37j75jzp+aHQWUsPxQXVQTQiuZXKlsrRDpVGBiqZz+OTTJBP7tcOAVi
	aAabO29FXh4bk2L6H1a4w==
X-Gm-Gg: AYBFou0ncZPKzpVQH8NSAibJqdSajAGGiEd80FmO3TbYDCiaBOZ7sQVBiMfrD1JnhA9
	+5nG0Z1NbXAc/iv1KxJxwYp/tOpzexRy0kmZfEoJcY1PA/g9p/MO9gV4DNG4u5cPqvGwO4mUmsW
	jikxvzAQvrcO7DCMGPjrNPR38ik+uLPofy1Iy1ONMVHxvPAlKTlBFGUhbQkaw89FiqKLp9lDTmQ
	3ZOwDCAtkPlhH8bk5TlgXGu9b+lFI7tETTr+XS4jmrQOVatFsajQ+HGNVE6a39ozB7Di0FijUYl
	3yV41cfoDfe02HWAMJbmpvFZEQv8TV5L91tPkHce6cG/V78k4GXgmAqtlPeQKHu2ruQepfOXvOM
	/tVyMJtXrzvjBU+Aif+3cM4uwLU+svhxoyKiBD/oAUkQtmt9SuzunUcX8qRpjRPP2hiAH/L/WSG
	IdTpZo8a6hHDZfigq2ixW6ImqRA1H2mKs6Iv0PpQ==
X-Received: by 2002:a05:6830:6d0e:b0:7f4:e011:6b3f with SMTP id 46e09a7af769-808992673ccmr2895902a34.14.1789417454276;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-806850da62dsm3722063a34.7.2026.09.14.13.24.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46ac13882ccso3545931fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417453; x=1790022253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKVHktddFg18lNwT1KKe1iRzZT/GYvNrBGD0jhLiuz0=;
        b=LXXWgAtRdDLCS8M+l7EHZkrjJ0md5DM6P12pvUYV/yqlSiJZzKI9jQtiW8121zi/3a
         ISyjZv7RmlC2me1nHS6+/nGoB71K7mGcF0sEM/y2jgr5cO1nymFI39XwoAuPK6LySWiy
         mXfRbz4KrbuufZcFhrGGWjHrTaM0Gy72TYkE8=
X-Forwarded-Encrypted: i=1; AKwUvBywdtf1aM/bnHps0k/4YnNFME4mJN6cXBy1EqSi93ijygCs6vZc9ywABo89Fzu1m1KBTh6PZ3VypOMF1S4=@vger.kernel.org
X-Received: by 2002:a05:6871:580e:b0:481:1dfe:89f5 with SMTP id 586e51a60fabf-481f990179fmr2535705fac.20.1789417452840;
        Mon, 14 Sep 2026 13:24:12 -0700 (PDT)
X-Received: by 2002:a05:6871:580e:b0:481:1dfe:89f5 with SMTP id 586e51a60fabf-481f990179fmr2535682fac.20.1789417452313;
        Mon, 14 Sep 2026 13:24:12 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:11 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 0/4] misc: vmw_zerocopy: VMware zero-copy buffer sharing driver
Date: Mon, 14 Sep 2026 13:22:05 -0700
Message-ID: <cover.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- 1/4 reserves a VMCI datagram resource id for the hypervisor-side
  zero-copy service
- 2/4 adds the vmw_zerocopy driver: /dev/vmw_zc, a single ioctl, page
  pinning and the VMCI datagram transport
- 3/4 documents the userspace interface
- 4/4 adds a kselftest covering the ioctl input-validation paths

This series adds a misc character device, /dev/vmw_zc, that lets guest
userspace hand a buffer to a VMware hypervisor-side peer without copying
it. The driver pins the user pages, collects their guest physical frame
numbers and sends that list over a VMCI datagram; the hypervisor then
reads the buffer directly out of guest memory. An optional metadata
buffer is pinned writable so the peer can return a result through the
same mechanism.

Why not vsock or virtio: this is not paravirtual I/O. The guest is not
sending data to a virtual device; it hands page frame numbers to the
hypervisor and reads the results back inline in those same pages, with
no copy and no ring buffer. Two properties have no mapping onto an
existing virtio device type:

- PFN-level zero copy without ownership transfer. virtio-vsock copies
  through the virtqueue ring. virtio-mem and virtio-balloon transfer
  page ownership to the host; here the guest keeps its pages and unpins
  them when the ioctl returns.
- Per-ioctl synchronous feedback. The metadata pages are pinned
  writable and the peer stores status directly into them, so userspace
  reads the result on ioctl return. storvsc and hv_balloon return
  status in a separate ring packet instead; Xen gntdev's writable
  grants and UNMAP_NOTIFY_CLEAR_BYTE serve persistent ring lifecycles,
  not per-call results.

The established upstream shape for this is a thin guest driver over the
vendor's native transport: Hyper-V builds a PFN list for the host with
vmbus_establish_gpadl(), Xen shares frames through the grant table and
exposes that to userspace in gntdev, and VMware already has vmxnet3,
vmw_pvscsi and vmw_balloon on its own protocols. This driver is the
VMCI equivalent. Discussed in full in the v2 thread (linked below);
2/4 carries the short form.

v2 was posted as a single patch and is split here into a reviewable
series along file boundaries: every file belongs entirely to one patch,
so each commit builds on its own. 1/4 comes first because 2/4 sends to
the resource id it reserves, and because it has a different maintainer
set. vmw_zerocopy_core.c and vmw_zerocopy_vmci.c stay in one patch as
they form a single module and reference each other.

Changes since v2:
- Split the single patch into this four-patch series
- The destination is now owned by the kernel: the userspace-supplied
  peer_id is gone, and that word is a reserved field that must be zero
- Dropped VMW_ZC_MSG_INIT and struct vmw_zc_ioctl_config; the device
  needs no configuration step
- Release metadata pages with unpin_user_pages_dirty_lock(..., true);
  the peer stores through the physical frame, so nothing else marks
  those pages dirty
- Split the VMCI transport out behind a small transport ops struct
- Dropped the out-of-tree KBUILD_EXTMOD build logic from
  drivers/misc/Makefile (Greg Kroah-Hartman)
- Removed __user from struct vmw_zc_guest_raw_buffer; it has no place
  in an ioctl structure (Greg Kroah-Hartman)
- Registered ioctl magic 0xDC in ioctl-number.rst
- Added driver documentation (3/4) and a selftest (4/4)
- Rebased onto v7.3-rc3

Userspace built against the v2 header must be rebuilt: the peer_id field
and the configuration ioctl it used no longer exist. Nothing is merged
upstream, so no stable ABI is affected.

Testing:
- Every commit builds on x86_64 with CONFIG_VMW_ZC=m, and
  make headers_install succeeds at each one
- checkpatch.pl --strict reports nothing on 1/4 and 2/4; on 3/4 and 4/4
  only the MAINTAINERS advisory for newly added files
- The selftest builds, and skips cleanly when /dev/vmw_zc is absent

Link to v2:
https://lore.kernel.org/lkml/20260619182710.2498154-1-rishi.chhibber@broadcom.com/

Transport choice, discussed in the v2 thread:
https://lore.kernel.org/lkml/CABJwUKKCwGxYB0is-U84EgAm6Co9_bfxbkZi56jZNLkzihDRyw@mail.gmail.com/

Rishi Chhibber (4):
  misc: vmw_vmci: Reserve a datagram resource id for zero-copy buffer
    sharing
  misc: vmw_zerocopy: Add VMware zero-copy buffer sharing driver
  Documentation: misc: Add vmw_zerocopy driver documentation
  selftests: misc: Add vmw_zerocopy selftest

 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/vmw_zerocopy.rst   | 278 ++++++++++++++++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |  10 +
 drivers/misc/Kconfig                          |  23 ++
 drivers/misc/Makefile                         |   2 +
 drivers/misc/vmw_zerocopy_core.c              | 267 +++++++++++++++++
 drivers/misc/vmw_zerocopy_priv.h              |  66 +++++
 drivers/misc/vmw_zerocopy_vmci.c              | 132 +++++++++
 include/linux/vmw_vmci_defs.h                 |   3 +-
 include/uapi/linux/vmw_zerocopy.h             |  67 +++++
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/misc/vmw_zerocopy/.gitignore      |   1 +
 .../drivers/misc/vmw_zerocopy/Makefile        |  20 ++
 .../drivers/misc/vmw_zerocopy/config          |   2 +
 .../misc/vmw_zerocopy/test_vmw_zerocopy.c     | 276 +++++++++++++++++
 16 files changed, 1149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/misc-devices/vmw_zerocopy.rst
 create mode 100644 drivers/misc/vmw_zerocopy_core.c
 create mode 100644 drivers/misc/vmw_zerocopy_priv.h
 create mode 100644 drivers/misc/vmw_zerocopy_vmci.c
 create mode 100644 include/uapi/linux/vmw_zerocopy.h
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/config
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.52.0

