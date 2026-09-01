Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184B3D9DC5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227228; cv=none; b=txP/hGas+ZLzSp5WAgCcc5nHqqxb93gf1Is+LI2d0tL0nBMJO28ScOP22sXLkwjNRpYePiFUrLSn3lONOtDoxE8C2s730+bDc5ZTWPNi0C6kXjbv6enrhi2cYeLGv0t0sdHHuMyWCiWAMI1Aia0Yq0LOLQGBDRzTJqRpB8lli1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227228; c=relaxed/simple;
	bh=WmIWt8sclQYC6aVL1FoXqC06hsOZBkmHb2WjqLvNwc8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o9EpV7XU5MwfY6X99IW9TssVppjVLLuw6tT9D49mRseNWRGdPu6LVChEnGbwtrrpxxnGKJiErjQt8U3YlMqiArAWwTfb+1i5Kiish0G6Les3/ztRM1hm1u80J7Z5G5ppjGSJDJGLWvIEMnHXF/4iIgaO++cm0Jx7EjNu0fQdkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Au87SR5U; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Au87SR5U"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso4891596a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788227218; x=1788832018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oF3hHSmjXNzkrH0jOeW++TVcT0uT7txPwkCx0tulNXs=;
        b=Au87SR5UbabgCvpWbi8FFp3STObpF/AEuY7CvU5ykhmf3QkZb6XP8Lg6VJGEpjVq8h
         E8kkNU7eM8Lo2Z221ZdbzBSlxGMKHWyt21+UwCx5aCh3IN9AG2JDqN5Hv5SISVDcnNgV
         CTIA7ZVczAB/DaJxW2q666U3OgCevaXfqdX5w7HF5xn0HqPN5VqHALw18c/NwC30LuM1
         6aEJZIoQr9KyflclwsQBCmiXTCubTNtFdNx/BLlbA8/srD/+41rw0CvL42Hbx48LT+us
         K3yK/RWJdP466YgJcH4gm5MwvbkHEsZIaOhajrxO7kWCterMynoVxLjYugd6PDrccbI1
         oq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227218; x=1788832018;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oF3hHSmjXNzkrH0jOeW++TVcT0uT7txPwkCx0tulNXs=;
        b=Mqt23dmJ+BuOJog7XCrnt2oKEhmT1jq1ofvr5DFRXUucg95+z2jgGbVRp67IG9Pc9C
         7H2rBKuLVTcknNRaRZGmGBUljbb+1nYoFlEmVQfbUbDZCr6xDZBUpbBHGQskWfC/u4el
         FV4QNj9APP3Vk4GU3crjl3Rk8uj3FsrXSS0HcXoImW7hhYIE6ihWOTWm6XmY63VKGEei
         GDqm8ztJR9ynU9id2jfcLN7npBTMPF8qD0fNA7l8THJ9SZmIJtqslb9eV3ZTMMiTLBLe
         azmNQXNGAKIW3NVSGjwLBb6pzfMoM2V/8Zpla8r/jab8asOAnIfvTRHXHaikVAItCXI6
         H/QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN+Eyf6ujRmkxtJHJWuHb3aAtcjqoHNZ3IhspEkyHlVcyzyWiafDGNvsYXXzEYEdzqc50RGlIm4m70jGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mSNVV1lulK9YW+ZtI5U26I1Mpa7OP1r7Ts+egAB09yF2gnWq3X
	O3By/AianrybP02FRXmCwtUprlaQ9cP0sHM8iLTPkgqhW5wVhXB73VgV
X-Gm-Gg: AYBFou3E11aCCEMOeOoclEZIAgj7lj7MP14kv6WDmpPYJEqTnr9An2EzhtaESy8o5hD
	CcIAACSqPScw3yNBzGJWSFYokh0AzYum023o/xm8nUUcnIDDwevl2yEVUB58C8d85ZPYWWPDNJq
	Nuc/vAHcu2XckBAQ/KmFxoNlyEbd6LNk/4kQvlsz8B41gnvy/sS186Gx3uq2Li+tUhzLDww8xfU
	3ndoCnm+mww0LoZehx+svtWJPxCwQ2/yQL7ViAJt/e1mYi+03ak3Om2lh0DlOmWNRVDvd5jRRlQ
	akOBGosPHhRnmo6v5bRLtthy0t/mEliY38kgtz9dSNZs8wn6qI6HTdQXzyr3K4hIipVR1KIPSWZ
	SBm2UhHBLZmHIox2kDnEp6TF2wZ3WYoIWhuSkEQ/c+jGlI2coiK/ordftGyPCLS17TtyKDqpNXm
	30da7Uo1z3AO7iaK/94E0yE7ETKk32mJHoK8QSRX+40mnolITtqasfCUqgPZGnal7qe5dHiDQrt
	czJSQ==
X-Received: by 2002:a17:90b:1a85:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39907f04d76mr4922554a91.24.1788227218247;
        Mon, 31 Aug 2026 18:46:58 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm2561122a91.16.2026.08.31.18.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:46:57 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: mst@redhat.com,
	eperezma@redhat.com,
	linux-kernel@vger.kernel.org,
	xuanzhuo@linux.alibaba.com,
	jasowangio@gmail.com,
	linux-scsi@vger.kernel.org,
	mkp@kernel.org,
	virtualization@lists.linux.dev,
	James.Bottomley@HansenPartnership.com
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 0/2] scsi: Initial commit of VirtIO PCIe Endpoint Driver
Date: Tue,  1 Sep 2026 11:46:48 +1000
Message-ID: <20260901014650.2728658-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

This series adds a VirtIO SCSI endpoint built on top of the VirtIO PCIe
endpoint. This is a similar approach to the NVMe PCIe Endpoint
(drivers/nvme/target/pci-epf.c) but for SCSI.

This does end up being somewhat similar to the pci-epf.c code, but
re-written for SCSI.

This approach allows a PCIe Endpoint device (tested on a
radxa-rock5b) to setup what appears to be a SCSI device, using an
existing SCSI backend (tested using scsi_debug).

At this point a host can connect over PCIe, ensure virtio_pci and
virtio_scsi is loaded and on PCIe rescan will see a scsi device.

There are a few pain points with this approach though:
 1. We have to use the Legacy SCSI VirtIO driver. This is because the
    Raxda Rock5b (and AFAIK all PCIe Endpoint hardware) can't add
    capabilities. So we can't advertise the VirtIO Common configuration
    capability, which means we can't be a modern VirtIO SCSI device.

    This is unfortunate, but there doesn't seem to be any way around
    this, at least with the current hardware.

 1.2. Legacy virtio devices only have 32 feature bits and therefore can't
    set the VIRTIO_F_ACCESS_PLATFORM (bit 33) feature. This means the
    vring_use_map_api() function will return false.

    Currently Linux endpoint devices use the legacy virtio interface as
    they aren't able to advertise the Common configuration capability.
    As most PCI endpoint capable PCIe controllers do not allow modifying the
    capability list, and thus are unable to advertise the Common configuration
    capability. This means the device's inbound TLPs fault on the host
    SMMU because the vring descriptors carry raw physical addresses.

    This series adds a quirk that forces a subset of legacy virtio devices
    to use the DMA Map API (vring_use_map_api() will return true),
    which fixes this issue.

    It's unideal that we have to hard code a quirk to basically just
    advertise the VIRTIO_F_ACCESS_PLATFORM feature, but (see 1) as we
    are stuck with legacy virtio devices there isn't much else we can do.

 2. We have to pin scsit_pci_epf_poll_cfg_thread() on a CPU in order to
    respond fast enough to the host. This means we effectivly burn a CPU
    to read and write some values. But as there are no intterupts
    generated on these events and we need to be very quick there isn't
    another option.

With two Raxda Rock5bs connected together and the IOMMU turned off I see
performance numbers like this

root@radxa-rock5b:~# fio-test.sh /dev/sda
Running on /dev/sda...
  Rnd read,    4KB,  QD=1, 1 job :  IOPS=223, BW=895KiB/s (917kB/s)
  Rnd read,    4KB, QD=32, 1 job :  IOPS=7415, BW=29.0MiB/s (30.4MB/s)
  Rnd read,    4KB, QD=32, 4 jobs:  IOPS=20.2k, BW=79.0MiB/s (82.8MB/s)
  Rnd read,  128KB,  QD=1, 1 job :  IOPS=213, BW=26.7MiB/s (28.0MB/s)
  Rnd read,  128KB, QD=32, 1 job :  IOPS=1482, BW=185MiB/s (194MB/s)
  Rnd read,  128KB, QD=32, 4 jobs:  IOPS=2599, BW=325MiB/s (341MB/s)
  Rnd read,  512KB,  QD=1, 1 job :  IOPS=184, BW=92.1MiB/s (96.6MB/s)
  Rnd read,  512KB, QD=32, 1 job :  IOPS=1079, BW=540MiB/s (566MB/s)
  Rnd read,  512KB, QD=32, 4 jobs:  IOPS=1284, BW=642MiB/s (674MB/s)
  Rnd write,   4KB,  QD=1, 1 job :  IOPS=222, BW=889KiB/s (911kB/s)
  Rnd write,   4KB, QD=32, 1 job :  IOPS=7433, BW=29.0MiB/s (30.4MB/s)
  Rnd write,   4KB, QD=32, 4 jobs:  IOPS=20.3k, BW=79.1MiB/s (83.0MB/s)
  Rnd write, 128KB,  QD=1, 1 job :  IOPS=203, BW=25.5MiB/s (26.7MB/s)
  Rnd write, 128KB, QD=32, 1 job :  IOPS=1521, BW=190MiB/s (199MB/s)
  Rnd write, 128KB, QD=32, 4 jobs:  IOPS=2927, BW=366MiB/s (384MB/s)
  Seq read,  128KB,  QD=1, 1 job :  IOPS=207, BW=25.9MiB/s (27.2MB/s)
  Seq read,  128KB, QD=32, 1 job :  IOPS=1538, BW=192MiB/s (202MB/s)
  Seq read,  512KB,  QD=1, 1 job :  IOPS=183, BW=91.7MiB/s (96.2MB/s)
  Seq read,  512KB, QD=32, 1 job :  IOPS=1356, BW=678MiB/s (711MB/s)
  Seq read,    1MB, QD=32, 1 job :  IOPS=646, BW=647MiB/s (678MB/s)
  Seq write, 128KB,  QD=1, 1 job :  IOPS=209, BW=26.1MiB/s (27.4MB/s)
  Seq write, 128KB, QD=32, 1 job :  IOPS=1576, BW=197MiB/s (207MB/s)
  Seq write, 512KB,  QD=1, 1 job :  IOPS=166, BW=83.3MiB/s (87.4MB/s)
  Seq write, 512KB, QD=32, 1 job :  IOPS=891, BW=446MiB/s (468MB/s)
  Seq write,   1MB, QD=32, 1 job :  IOPS=539, BW=540MiB/s (566MB/s)
  Rnd rdwr, 4K..1MB, QD=8, 4 jobs:  IOPS=453, BW=228MiB/s (239MB/s)
 IOPS=478, BW=241MiB/s (253MB/s)

claude-opus-4-8 was used to parse the crash dumps and IOMMU faults
during testing to narrow down where issues where are how to fix them

Alistair Francis (2):
  virtio_pci: Add a quirk to force DMA Map API for certain legacy
    devices
  scsi: Initial commit of VirtIO PCIe Endpoint Driver

 drivers/scsi/Kconfig               |   12 +
 drivers/scsi/Makefile              |    1 +
 drivers/scsi/virtio-scsi-pci-epf.c | 3099 ++++++++++++++++++++++++++++
 drivers/virtio/virtio_pci_legacy.c |   27 +
 drivers/virtio/virtio_ring.c       |    7 +
 include/linux/virtio.h             |    5 +
 6 files changed, 3151 insertions(+)
 create mode 100644 drivers/scsi/virtio-scsi-pci-epf.c

-- 
2.55.0

