Received: from mail-dy2-f31.google.com (mail-dy2-f31.google.com [74.125.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A74489FBC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370505; cv=none; b=I8BCL6tPzXLSuvRBx+nBV9Bljoh2o2xMuSakf7zmSBYznn0HhHbo+IrS3JGDkFHi27JjmPMrl8yxc7t2SbSxnKa75Uo+VSh0ZLux0GvFZWFI73phwuUP6fC3VyyuMJlXdR7+U3KuUL1f7R7Qs6PBHHlN1463qHSIiOja6ERqikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370505; c=relaxed/simple;
	bh=9QaiYlBuXc1tYQG6YWv2nojPQWZKKzakrlIJ7L0LeZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AIiYqBLOPD/YbJqFs1TlQNQUAplH21Vtb+aZebLT6GP88fLGomiJuL7wFdGZJh5oFxHGCXCKIRb+p4BkSWtRd3Ag7VCSxn8PZrsKJnbtTJaFoTbxRI9XrdkPQCTepT4eF5jGtQSvK/arZLFgISD8fbTCKIwxDm/QoMl9TkGMzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io; spf=pass smtp.mailfrom=multikernel.io; dkim=pass (2048-bit key) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.b=aqQy9ixl; arc=none smtp.client-ip=74.125.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.b="aqQy9ixl"
Received: by mail-dy2-f31.google.com with SMTP id 5a478bee46e88-33c11ef641aso1570818eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20251104.gappssmtp.com; s=20251104; t=1790370503; x=1790975303; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0kxLCnHZXyfU0+PE9w7BNJCXXrR+/ygAn+oGlqVmlM=;
        b=aqQy9ixl1XPB/Jt6+TMBrncjryXGgsXsLrA9K6dbPSexVbbJN8ym+UNeCSxQx0kpRG
         34FLuEBvv8MVAonY2dfknwvl4wQNH8hvXX3Dy/+u0BXLR+wWu+ozJAiuZB8egDI83zPh
         O9e762ZcugvsZcxM+fbrme8F8iDQ0IsdbvJFU6DnMyuU0TvlzPFMlCj1K6QPBi7UVfeW
         flv2hsdJ0Q8Ey+9kZ5muQbJpyithf2RDZsbSknX9wPveNOCZcYdUDramuXMQhopS0SIV
         uQEG7TZRzcCWQKwEQFQqjSBX819dr4BjqGkFtoIRZi9fBUsxvWlYv4G5JGERotz1Xj3O
         Effg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370503; x=1790975303;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0kxLCnHZXyfU0+PE9w7BNJCXXrR+/ygAn+oGlqVmlM=;
        b=vqTh2nqe7nXwBLKYcUEXzjUj2LifgG4kDIlxmNc2jeFOtYkNxvScIxxfF0KnSrJEDl
         tF4IDgf7nFwjWV++EiNGj2KfnQC5o46uN7Vb57VdjGH3b5GyHszagOe4nHNNQn+esNFy
         izr8zquwhP6eZU5Jq4fqscTByxIm6YotD/2FUsOoNVx2/qsIWxfjSMmk5EXuA2VpkrGY
         x4e1ULxJ2iPOk0l/kGG/3UtFNCtjDo4JzjQy6ZaMhE3nyo9au4EsIwWh+XwO0wUp4Gdv
         YbDXZfpxfzIDhRZ8ItdszdOxqoO1Oepm3GlMm43FPrseF+Yg0Tn8i8TiFIk4HGbUsA8h
         XiNQ==
X-Gm-Message-State: AFuF++lwf1FAbcY436ZDPqGXYLZ+nqn1m7pWDc9SkjS7GgRn1JboQip7
	Ba8DyiAZKJ3mQQNCXrwyuFVSjRkEZpcFUvr+l+y33nqfFU48iEgRaYXc1Txr5bWfUkRclZ6eoi4
	Sd9sL
X-Gm-Gg: AYBFou0MFO6SoQ4qeUA4u2VSD6s5UCLhfhLdcHXY8WF3L2SWM5sIENf8h8b/lyfhAoP
	qF/G40kfejmL1fbidxX1H1XsKoyzKJF+XWpW1EzvdzZM15fsl5naG0lk6/POn6PAe7WTbWwRMYj
	S+xwEs/80KDSV4Uy7nPuXQdNOtmGTLDndTYj3sUm0suY3JGWJDnf0g7gdIfwzqL0QTx5gmL0Vsa
	bujE3e+VGhBpks3Q5cc1XqbyDLQJtMjBMuUQ/I7mgA8ibM6Y3wPIrtWXm2PUx3QfdKga+gjOALc
	SlUq+zFFN0N4ogsVxMxW9a8qM0/tKJueJy+tamiqXd9eK8/b2jdVPz1qIBbc+IMXsLPrr4WBKzt
	ItBiv2+8cjkeIpMajmgn017qhkT2uadFNbyfqt1sy2p0ZwBYPHI+GD9614rOVg12zT3Xdk0p9Na
	QhoUL1X/w3d4IxlKRYFILJPdXAZTjl6qmqwLZMDuXiB3bQ81YKzM+GnRm0jmu2aEuJ0OychVPoA
	FM2fpL0tjtGEAwzLQjdDZckCUxwMMcNIw==
X-Received: by 2002:a05:7300:d204:b0:33b:f8f9:c8e8 with SMTP id 5a478bee46e88-3426feb9da1mr1274105eec.1.1790370502465;
        Fri, 25 Sep 2026 14:08:22 -0700 (PDT)
Received: from localhost ([2601:647:4002:e210:1413:a644:998f:5f98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm13228766eec.14.2026.09.25.14.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:08:21 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:08:20 -0700
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: multikernel@lists.linux.dev
Subject: [ANNOUNCE] mklinux v7.0-mk3 and kerf 0.3.0
Message-ID: <arbixIv7xC4CbFx_@pop-os.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I am pleased to announce the third mklinux release, v7.0-mk3, together
with kerf 0.3.0, the user-space tool that manages it. The two are
released as a pair: v7.0-mk3 changes the device tree ABI between the
kernel and user space, so it needs kerf 0.3.0, and kerf 0.3.0 expects
a v7.0-mk3 kernel.

mklinux v7.0-mk3 is 58 patches on top of v7.0-mk2 (46 files changed,
3747 insertions, 1959 deletions).

The headline of this release is that a spawn kernel now boots from its
device tree, and PCI devices are identified by address and named
through standard /aliases, so the name you give a device when pooling
it is the name every later step uses.


Device tree
-----------

 - A spawn boots from its device tree. The boot manifest is the
   instance tree itself, with a /chosen node for the boot handoff, and
   the OF core owns it.

 - PCI devices are described under their host bridge in the devicetree
   PCI bus binding, identified by PCI address and named through
   /aliases. Host bridge nodes carry the ECAM window, so any PCI domain
   and extended config space are reachable.

 - A spawn creates its PCI root buses from those nodes, never probes
   for PCI topology, gates device probing on the tree rather than a
   private list, and keeps the tree as its record of PCI ownership.

 - Network devices are named from their alias, including virtio and
   USB netdevs, whose PCI function is found above them.

 - The device-names list and the baseline snapshot it resolved against
   are gone; devices are handed to an instance by PCI address. An
   instance is named by the standard model property instead of its
   root node name.

 - New of_alias_from_node() helper in the OF core, and new
   Documentation/multikernel/device-tree.rst describing the trees.


Takeover
--------

 - A backup kernel can fence its parent with reboot(mk_id 0). This NMIs
   every CPU the backup does not own, confirms each one by its presence
   in the park loop, and wakes the fenced CPUs from the adopted host
   wake slot.

 - The host tree can come from user space through instance-create and
   is emitted under the spawn's /chosen, so a backup enumerates every
   CPU in the machine. A spawn created without one gets a tree the
   kernel computes, so existing loaders keep working.

 - CPU registers are saved on the way down for a backup that will take
   a core.

 - An overlay is now taken in one write, and the boot manifest grows
   to 256 KB. Both were needed for instance-create to work on a 48-CPU
   host with 267 PCI functions.


Pool and instances
------------------

 - Pool state (CPU set, memory chunks, park area and its lock) is
   gathered in struct mk_pool. root_instance becomes mk_self, and a
   kernel's own park context is computed rather than stored.

 - Instance records are built through one alloc/publish/free path.
   Boot-restored instances show up in kernfs, the parent record is
   named "host" and marked active, and the doorbell CPU is separated
   from CPU ownership.

 - CPUs surrendered to another kernel rest in the new CPUHP_DEPARTED
   hotplug state.

 - The manifest's pool-cpus list is sorted, so a spawn's CPU numbering
   no longer depends on host history.


Spawn lifecycle
---------------

 - A spawn without a ring can be force halted, and the force halt is
   taken from the unknown-NMI chain. The NMI watchdog is back on in
   spawn kernels.

 - The spawn console registers before smp_init(), so an early panic
   reaches the host.

 - Spawn kernels inherit the host's timer calibration.


vsock
-----

 - mk_transport answers unmatched packets with a reset, which doubles
   as a liveness probe for the peer kernel.

 - Its stream_allow callback now matches the core signature.


Build
-----

 - CONFIG_MULTIKERNEL=n on x86 and CONFIG_KEXEC_FILE=n build again.

 - MULTIKERNEL depends on the memory APIs the core needs.

 - x86 details moved out of the generic core ahead of a second
   architecture.


kerf 0.3.0
----------

kerf follows the kernel's new device model:

 - Pool devices are keyed by PCI address and named through /aliases.
   An NVMe keeps its controller name, a network device keeps its
   interface name, and "=alias" overrides either. Pooling a partition
   pools the whole controller.

 - kerf create, kerf update and the validator accept an alias, a PCI
   address or a node name. kerf create hands devices over by PCI
   address against the live pool, so devices pooled after the first
   kerf init work.

 - kerf update can take devices back again, and "none" takes them all.

 - kerf init resolves a block device to its own PCI function rather
   than a bridge above it, and can be re-run with the same --devices
   when devices are already pooled or lent to instances.

 - The parser reads PCI devices from under their host bridge and takes
   the instance name from the model property.

 - kerf kill points at --force when a graceful halt times out.


Getting it
----------

Kernel:

  https://github.com/multikernel/linux.git  tag v7.0-mk3
  https://github.com/multikernel/linux/tree/v7.0-mk3

kerf:

  pip install kerf-multikernel==0.3.0
  https://github.com/multikernel/kerf/releases/tag/v0.3.0

Previous release: v7.0-mk2 with kerf 0.2.0.

Feedback, bug reports and testing on more hardware are very welcome.

Thanks,
Cong Wang
