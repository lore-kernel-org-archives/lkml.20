Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057508;
	b=N2q+AN5D6G2vEOqEUYsuVEzt255yh+KEAUaxOGsXAfjg6ns2aTShy4Qnk60aMoWIaE+F
	 cKHX4GARBOYq8jQ0FtSBzWtt7P9CcF1fXjfadEtDUAIerXRvwISGaZPNimZg1k3krGkK6
	 TlapFylBCDB0MCp0a9QzJt79hV9xCX1TGtJsrqEQ7LJESiRulv7E+bdLyPG0E/ofmPftQ
	 teJa/F0zShAVvwxkR4YzA8VT/xnhi+P4ANcPyzrvC5fT8OxmGNLHTWASrPNzlG/ucSUHG
	 PpirE+DgWckUmNT+ZmXoMDJPgUPgGQgqz8464BweqUt9J//Fe31mLthC++ZiqxmFakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=1kNsOBjiPepCZlQXn6dnkeUyVbnTvzLZsjEF/ZOxFpA=;
	b=a8btda849Zgl7Jr2ojHjVjP7oUhNah+gqmtTVFXlGZW/6/vKBQYN2ooy11IDJdzWplu4
	 ZlK3kd36fMPIYgcrUfK8PuCZEcmQYqcB1PpVJQzyZYhFjX6or/9UZ+W+3Pvm/pw84yq+n
	 SE1ItNgHvGszUijSyBMsmwWmeDNgp62S8HdHR/ou32PQ+0/HBOAZO4OrCe3jI8ewJ0Q4d
	 Cfk6+gsdDroZS0KcDxbwSR0A+Z3t/IEtSngosvWBC/96dy99acmxKuH+wt7ioUQ3xes2G
	 KZJbVIME2HPnFPTLmBgHs3npH4fk2DXqxdCWipjl/pnN5fXqSwaAv+9Qfhww/L8oZAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rvmlXMcP;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4AD606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rvmlXMcP
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1762125a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20251104.gappssmtp.com; s=20251104; t=1793057507; x=1793662307; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kNsOBjiPepCZlQXn6dnkeUyVbnTvzLZsjEF/ZOxFpA=;
        b=rvmlXMcP2IY+cbSgLxGGqlP6Ugw4/wNPiD+nwUdilbb93tD2SOSof4ValBnSM5QRss
         Yd1RGoiqDAgpZECRmEa9oHz+1SwJ923EDedcNJRlKbjSAj6sQmWZZ2tp+puDQprU6IDk
         9g/B2DwUbdyCrGtaXtWQjWAwHGZA2XWl7m0L+55GVNXaXQSLDk8jn7+pF3oOXwFXm2pf
         otfVWsRb0xmbtYKJ29J/9zhoW3pMEM5QOTfJeaF2cWASGq0tzzsvAKj/YdgWkZlxFl3I
         vfHHFDFQT6WLG0UZ753E+R4l1GY37zuce2WtqVNyzoqAKw4cxkE4IsZJY3F2Y+tvWmWi
         sSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057507; x=1793662307;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kNsOBjiPepCZlQXn6dnkeUyVbnTvzLZsjEF/ZOxFpA=;
        b=fSLO58ZJcZIymITql54Ell9NLeeyztgdsEn1H7i8sxciidyuwtipKaJk3vHPYJJDmi
         BzEvRyJ9zjA+FI4uH/7cZvJg7O0D43Qmtes4vsgWkdLZquw4P6acm3tfDxQe+1HFcAQ3
         YrrJgRtzoC7sAI2Xm2oVqV+lu+qp51p9anmkQAXPa8akZRDT2Nl4MRInMLax1Vln+Tf1
         y6gR31osPj9GLTW4nfsjKqb52vmOZKcYJGYiJSFSrtJ1HiC77AyDtvdn6DY9JpaJ2pF5
         zTJXcbusZfE7Ee36DHs48n0fSZ9NrYB2Qm28b9ourImoC71y0/I1rdHDR2vJAN4GYIei
         R6Sg==
X-Gm-Message-State: AFq9FYLA+RQjqcVojlP9iWSSswmleekTa/LA2YmIjiBXat+bt4gALNz9
	E42yDzU1/HLEEZvhVFrIf/Q+hNlEBnWGDUZ9fU1No/DuasnkuwdV3/QxojNp/uEAgu7McZD0GAW
	W4QV8/c8=
X-Gm-Gg: AYBFou0gKc8IGMCN8K8IEm/6022+Dj3dDzGEhCwUEoote1QIzN5+mgt/83gVwwPZW+V
	rghAdguH99hgieV9ftOKvKdb0Wk78SoNAsPY0TQCNKahVnKaX5dJLQUaRx0culm3jwiVIl+plYe
	/bBuv954wAhkFjh60nSsGvRm/HyNWa8ahEj+fRMIvXzIPNfSC67E76igQGF7OAtkIXa2P+abWIo
	MvwlrFcc2q09jsnWUSDGK5MOMrSBdBBlv89OnQojEQ8pfEhxjg8wNeHDU4hR1+L0FMtmRePRIEK
	7hJhnacXeXTRCZSnH0IBGuBldvYfInSPx/Hr6wOIENt+rq2Urj97ec/kJYy9iwWwapQIvrd8W6W
	djTzmTdcar9YkTjegkDNwz93GqOpPCBrg0SCVCPnpXTdQ6sZUs3d5Qo4uyHGg/CmXpA8ohIfUXp
	pwSOaq/2Wa6YYX1Pkqi45mDSc9ao7y5pIkBY7j/AP/fVOVjsXNFgjXHjwM/0nX5qV47xhxf3bq6
	AFQICKfV4ZDCpaCls9QTXuWZjEtksTBB07Tuj3IcP9WV4uJ4xdiqM9eAxFVJyHiL2Y5U0i+cJ7r
	fg+/3Hf3n5cY
X-Received: by 2002:a17:90a:d2c6:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3adeabde84emr7276945a91.34.1793057506638;
        Mon, 26 Oct 2026 16:31:46 -0700 (PDT)
Received: from localhost ([2601:647:4084:777d:f4e4:ea6:4ca0:ca08])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40455eb5sm1154323a91.12.2026.10.26.16.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:31:46 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:31:45 -0700
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: multikernel@lists.linux.dev
Subject: [ANNOUNCE] mklinux v7.0-mk4 and kerf 0.4.0
Message-ID: <at_i4aR2Jd6GcHhZ@pop-os.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

mklinux v7.0-mk4 is out. mklinux is the tree carrying the multikernel
work: several Linux kernels running side by side on one machine, each
owning its own CPUs, memory and devices, with no hypervisor underneath.
A host kernel spawns the others through kexec_file_load() and they talk
over shared-memory message rings and IPIs.

This release is 41 patches on top of v7.0-mk3.

Git:

  https://github.com/multikernel/linux.git  tag v7.0-mk4

Release page, with x86_64 .deb and .rpm packages built from the tag:

  https://github.com/multikernel/linux/releases/tag/v7.0-mk4

Use it together with kerf 0.4.0, the user-space tool that creates and
manages instances, released alongside it:

  https://github.com/multikernel/kerf/releases/tag/v0.4.0

PCI config space: a spawn no longer generates config cycles itself. The
kernel that lent its functions answers for their config space over the
message ring, the way xen-pciback answers pcifront, and filters writes
so an instance can neither move a BAR nor enable SR-IOV. The ring gains
synchronous requests that wait for their answer with interrupts off, so
the accessors work under the PCI core's lock. Each bus holding a device
of an instance is described as a root bus of its own, so the spawn never
enumerates the host's bridges. A running spawn can take a function it
did not boot with, a lone function of a slot (00:1f.2 without 00:1f.0)
is found, functions without MSI-X are lent, and a function taken back
from an instance is reset, or has bus mastering cleared, before it is
handed out again.

Takeover: a backup is told about every PCI bus of its host. Once the
fence confirms the host parked, config space switches to each bus's ECAM
window, filtered to the spawn's own functions, and a spawn can adopt a
function of its fenced host. A CPU that panicked with the NMI watchdog
running is now parked by a force halt instead of perf claiming the NMI.

Memory: pool memory is hot-removed from the host's direct map, so a
stray host write can no longer reach a spawn, and instance memory is no
longer claimed as host System RAM. Memory hotplug can remove and add
back parts of memory blocks in subsections, so pool chunks and instance
memory moves need only be multiples of 4M on x86 rather than whole
blocks; the granule is published in the device tree. A partly removed 1G
direct mapping is split first. Each instance region is exactly one chunk
of its instance pool, fixing a genalloc BUG and leaked memory on resize,
and a memory-add claims the range the kernel actually adds.

kexec: multikernel images load only through kexec_file_load(), are
published only once loaded, and fix error-path leaks, double frees and a
stale -EBUSY. The manifest page and IPI ring live in the instance. ELF
vmlinux spawn kernels can carry an appended signature, so KEXEC_SIG and
lockdown work. Starting an instance moved out of kexec into the instance
code.

x86: spawns get no host RSDP, keep ACPI off against acpi=force, reserve
no RAM buffers past their E820 regions, and never use IPI shorthands,
which had broadcast host IPIs into spawns and the other way round.

Fixes: the host doorbell is rung on the host's real boot CPU rather than
physical CPU 0, released mk_transport vsock sockets are unhashed (exec
failed after 512 runs), the spawn console starts with standard terminal
modes, and a device-add binds only where the bus would.

The binary packages are a convenience for trying the tree. They use an
Ubuntu-based config with CONFIG_MULTIKERNEL=y, modules are signed with a
per-build key, and the kernel is not Secure Boot signed.

Feedback, testing reports and review are very welcome.

Thanks,
Cong
