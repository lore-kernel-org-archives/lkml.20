Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC4347FC0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375878; cv=none; b=Lsb0FwWmr2YmXiu3Vl8u+acvD1vc8y4PGQLHW22Z9P+hbrllqPf77iVHid6WXErrTt2Y4WaFSQU61a8Uh4y4SletdimdeB1kAoYUzy37+astovTMhy+lM6aRWNxslfMUIl4dTaQzjS0p8ypBFJwa1RxnXyMDsio0C0qxetIi3z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375878; c=relaxed/simple;
	bh=wxoW0aT2RHLJSmw422NSIU8DuZaWXgM5+CO93cYfqNY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=s3qe1RHbRvvmyg+bqYj7VXsScqXxEJ18TD3lVTE5+4zeZ4DQETGtFj71CHFl9IfG5tJiJQgL2AEIPvGjNZhSa7Kd3eDloc5gRiw0skPNiLB3QQCILJPAa9xdPu01SAdsMXSHqSQW/YOLgjerW3xRbMdMbFq1cfK20JpD1x64k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MqI+Zsxt; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MqI+Zsxt"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so1931346e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375876; x=1792980676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YAWJPU0bKj56z57yKFJ+IjOtblegGIXvDvyM4kHd1kM=;
        b=MqI+ZsxtKDw2aduUWuMip3r+QkiJCfwdnaax2ogon1fQ9R1bHvYLpuy8URs+dXTRbf
         YMs1Y57So8tMhIvoR/nkWBq6nFmDDtYV0c7rHQFikRuKA8L3yMw44xvOpoKidZsWbUM/
         ZZT42bneeIwA2hU/Dm2xty35o1m8HEpwcU7BBwSmO/Ct8DleqSjQfwUCfauc1yRjVzoO
         QR6PILKh+sP4oe0bypXyzxbdV2GJbHnwxOy/cyfUvNas0ohActA0XRRDq6AOl+055Z+j
         FIFrL9bGm28hkutKghXgrP2VOKGHghzqEhK7TYSF7+XRnHSBpFvBtuLoHpR2DPAHHqjx
         LDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375876; x=1792980676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YAWJPU0bKj56z57yKFJ+IjOtblegGIXvDvyM4kHd1kM=;
        b=YzhrIC37jjQySyMdrz9VYwMXTKgs/pY4XKsTqxNt7oni4gBe5lBHIbvWg/PzmAqkbo
         DDTPcbb9nTk7fJWvBu2H9kUWOSCbAGeN6nqRPRzzHuGpY/oY3nW/l38IG35n8qGBhviw
         sxxrAZdvTbtYE2tW0/Vk9OR8kxLytC6VpQ/naZR3z6GwsEqVTr0a1mJmuuFywpYmivyK
         IuKcaaYrBEAWSLzPUlXT0lGDKNM1pUzNoH4D7E9RJtrBbN/+F9zVq9Cm9F4jke5fR9Yd
         O7jm5UUm83SejOpu48nI5cEzwgvdxiuWH0CAFhyFVNHEdyf8P0OKMVqhoRMIC5GScUil
         /REw==
X-Forwarded-Encrypted: i=1; AKwUvBzH92Y6Hg+JCJwSEdRS/rP6JmXL9z/Cr+kMUHOaBbuzpmIjLXhZyznikO0orCCz8tiDOGUIp1aH0SS7vCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI28rGQPEJUlimrSHLu7MERFb6J0wodYdgqyTDhUg89neYfACjT
	FUHlyhSeBSgOxz+2DQM5BTGJwpPidlwVbFdF9xKj4cBojKzXhnh/7yXFY80Kb5CFhj8=
X-Gm-Gg: AYBFou0vFDj1wfcylgSV3mEVP/BEdvg7C/DoVlrG6kyIJNX3ItK/8tVLe91VGWF/agE
	Oo84VvAkP+tgv4fXoj+TVQOMleD6EiaxdFjylppFDAlItB/ef4NeOSuSNbVZo82l7SkUjKR+Ah/
	wzR5oW+ZT5keu9kRJP/orFlp4lC3jvzGF2VD7hJVD4b9Z/RNG9c1qD4dM20sGy9ZbHw/Y1jHic6
	O9bfs6ORaK3BN4WQ47hOrtOGdLJqyb0ReogY66U5X6/M+4tg9PPJm50n4+y4PDv4ah6q6BwKSd9
	11tBB3VkjboZcJ+DpcZk2qUR8/Mg/Ib2vuP/8Ai5uUenFtCgzlOs496kanEx8wD4f7WpU8ahLr2
	yn2uXvScYDTSpcuwG1HZvKnTh/eMb1mDTA+/wltnhx2zKBz2loOOHT1v3O28N4xMJFvgBNUJPCS
	1CkTAgfN/MLNxonia1lN+OkM7QaOxrahq6ajOXNIjOgooPup+u34Kz3c42f/zByiEp3nN2aolMq
	TbqRysX4J2PN8KWCa2zxKklFFKriFhd7Bzmay9Rx7M66COTURA/m5qE2x3hXymo2lOo/9MFPSb+
	aj2Uw/B0LD46oS14Uoqf
X-Received: by 2002:a05:6122:4f87:b0:5ea:a21b:31c6 with SMTP id 71dfb90a1353d-5eaaa0fd89amr2353045e0c.2.1792375876111;
        Sun, 18 Oct 2026 19:11:16 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:15 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 0/8] kho: add read-only Kexec Handover mode
Date: Sun, 18 Oct 2026 22:11:03 -0400
Message-ID: <20261019021111.990394-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a read-only Kexec Handover mode, enabled at boot
via 'kho_ro=<pa>' pointing to the physical address of the KHO FDT.

In standard KHO, the target kernel takes ownership of preserved memory
during early boot, initializes struct pages for preserved folios, and
reclaims KHO metadata and preserved pages back into the page allocator
as they are restored.

In some scenarios (such as a caretaker, inspection kernel, firmware), a
kernel needs to inspect and consume preserved KHO subtrees, radix trees,
and serialized metadata without taking ownership of or modifying the KHO
state, leaving the preserved KHO tree intact for a subsequent kernel.
In this mode, the KHO physical memory lies outside the kernel's direct
map.

To support this cleanly without duplicating KHO traversal logic:
- Patch 1 exposes the physical address of the outgoing KHO FDT via
  /sys/kernel/debug/kho/out/fdt_phys so userspace tooling can pass it
  to a 'kho_ro=<pa>' kernel.
- Patch 2 moves the shared radix-tree key encoding and indexing,
  vmalloc flag conversion, and FDT validation and subtree lookup helpers
  to kernel/liveupdate/kexec_handover_internal.h so they can be shared
  between standard and read-only KHO.
- Patch 3 hardens kho_restore_vmalloc() by introducing
  kho_vmalloc_validate() in kernel/liveupdate/kexec_handover_internal.h
  to validate the preservation metadata header and flags before
  restoring the vmalloc area.
- Patch 4 avoids modifying ser->next and bs->head_pa in kho_block_add()
  and kho_block_set_shrink_one() when operating on an incoming block
  set, as the chain is already linked and incoming blocks must not be
  modified in KHO read-only mode.
- Patch 5 adds CONFIG_KEXEC_HANDOVER_READONLY and
  kernel/liveupdate/kexec_handover_ro.c. When booted with
  'kho_ro=<pa>', preserved KHO metadata is mapped read-only
  (PAGE_KERNEL_RO), with the FDT and radix-tree nodes mapped lazily on
  first visit and kept cached, providing read-only implementations of
  kho_retrieve_subtree(), kho_restore_vmalloc(),
  kho_ro_lookup_folio_order(), kho_ro_map_folio(), and kho_ro_unmap().
- Patch 6 updates kho_block to map incoming serialized blocks read-only
  via kho_ro_map_folio() and unmap them via kho_ro_unmap() in read-only
  KHO mode.
- Patches 7 and 8 extend test_kho and tools/testing/selftests/kho/vmtest.sh
  to test read-only KHO handover when preserved memory lies outside
  the boot kernel's initial memory range on both x86_64 and arm64.

Pasha Tatashin (8):
  kho: expose physical address of outgoing FDT
  kho: move radix tree, vmalloc, and FDT helpers to internal header
  kho: validate preservation metadata in kho_restore_vmalloc()
  kho: do not modify incoming serialized blocks
  kho: add read-only Kexec Handover mode
  kho: support read-only KHO mode in kho_block
  kho: test: support read-only KHO mode in test_kho
  selftests: kho: add read-only KHO test to vmtest.sh

 .../admin-guide/kernel-parameters.txt         |   6 +
 Documentation/admin-guide/mm/kho.rst          |   3 +
 include/linux/kexec_handover.h                |  53 ++-
 kernel/liveupdate/Kconfig                     |  16 +
 kernel/liveupdate/Makefile                    |   4 +-
 kernel/liveupdate/kexec_handover.c            | 142 +------
 kernel/liveupdate/kexec_handover_debugfs.c    |  22 +-
 kernel/liveupdate/kexec_handover_internal.h   | 171 +++++++-
 kernel/liveupdate/kexec_handover_ro.c         | 378 ++++++++++++++++++
 kernel/liveupdate/kho_block.c                 |  92 +++--
 lib/Kconfig.debug                             |   2 +-
 lib/test_kho.c                                |  68 +++-
 tools/testing/selftests/kho/arm64.conf        |   3 +
 tools/testing/selftests/kho/init.c            |  38 +-
 tools/testing/selftests/kho/vmtest.sh         | 103 +++--
 tools/testing/selftests/kho/x86.conf          |   1 +
 16 files changed, 881 insertions(+), 221 deletions(-)
 create mode 100644 kernel/liveupdate/kexec_handover_ro.c


base-commit: 27be83a12b246b6b3783e7d3ac5c378ff7520f25
-- 
2.56.0.176.g3575e65682-goog

