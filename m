Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C848EC66
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045544; cv=none; b=UszItcd4n4GjXUL5m96QmCN+3kK6GzNf/Gw056cKsO/LdW5U/zcUbTCvv7ZOpK50xUJS6mp6P9ks4eCFYrIkolSTjk6aKmIOHG6/SEc50ie/qJJYYYOf6XdGef0LI0xMe//4ER3Av4rjbwaAKBWW3Yfr8g1Y1r96AotC72zfkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045544; c=relaxed/simple;
	bh=ydoEav6Bpml1kMo8KwImm+Q4rq504FcGaY9Lm+dCJe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JwsMYFaOWfMosOr4Opu26YyW/2u1bhGq30snpBy7OZsF5T0I4HycoBOA3OhKntKmtIUJMCiolgMSf4HkeZWec8Zqn2QjdI7aeFgOjZVGK7m9gi9XaJI6Qo42KT3pg5A/r23AeYRFSHPfDlbdOKrKGH8nDYGo4SXFl0gNRntGaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nz7SKVR/; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nz7SKVR/"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81be5042c51so970568a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791045541; x=1791650341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKJeZ90AHzCg5KqCt7ePHWHr6buLXihZVRjmawQi7xU=;
        b=nz7SKVR/8DayxrdPisWcsts6nQU13pwOLDUYEOCQWRKy+Lu04Uag+6+9JJiR5alAnp
         DeXDPTvRUSiCjRFZwBIKo8kY543NOtlhvEzJa9DqST8pxsMrBcCnMj9bTiwwdIMNdUIn
         d8CuYQjFgJXhPaLkiOtFuzdz/tqmLFUqT8KsQA74UJqltmK4kJT4sskStkxd+iPzkAxl
         KMPurTJLc3L1gX6G6d0Y0mr3mr+0slDDTDDRUsdgkL8YYpVXi+TOqzpP0zGN+jeZMdyc
         vC0k2mGDF0DN0nGecL/dlK+1AJ3mdbrbuDJLWdr3EsfCorKY1eGhLsjCBdtolgjxrg3L
         1b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791045541; x=1791650341;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKJeZ90AHzCg5KqCt7ePHWHr6buLXihZVRjmawQi7xU=;
        b=C7LpK6DvTrozs20olK8mT9VIT9uYKzHvyxKIduvSePsoD6F0P8MiHGTUzSoKgOUatg
         U0SpcmCnww1SLrqH4hpVx64wGWgloIHHERHnvTa/RjixNbV4jSPpuArmRJJCMRVXFvfL
         R02EDwYdCN6NMLDT1wobs6jooNsRfD0n7GSyAPzXzLMr4sWiPIB6Z7OnHR6Tpmc8DPkL
         mZLblKHHl7JuOZNHhIg6RB4QGYUJDt4A3cHa9Ll47hWBjaqv+q1aOe8uEHYDT7TYdufE
         cjoWTSW/qO/CHegOkWNbxxRuNSKy4D+6jTFCcgXwquVO/R4jzZoozu0Hgrsv9THTufAV
         4iBQ==
X-Forwarded-Encrypted: i=1; AKwUvByXwSE06kbBWEv88GrfrWJvJYCFNKZ8TqKZ6MLnudRb7oK7eYZ1GHi0ej3mp+/ilNO/GbN4vBXD/MFFn/8=@vger.kernel.org
X-Gm-Message-State: AFuF++nX4eSjZtfyDOR67k6tSlAW7xzPaQgvbHdy8Pe01QyxY+ndy5Uj
	o6gVFWEZ8LVkdP6V7IkhJjii8lHpDMSu5fnem4LnioMT7DSiqXirAmfW
X-Gm-Gg: AYBFou1m2SquoNRTrPK9w8fbEVFU1zTb2CnRuZkYsW7RI5pvc3syW1U7SCq+ALeIrzC
	kOrBwZzAWdaNeFwaWjhaJqCBUcLzSYRT0wSwvSjMAkbPPWiC9ZxFrrCu1Aub6D4xgkZUCAklbf7
	eeD8VaOa6E8yFJ0n9wpgUEU/0u6XewQedv9nn7BXxVMIyrYqUDeC1PV1n2LOTCtV2/cqJJ/t3mN
	vVDnRtB6MZK9WJAZk2Cw2O52hQH2SY/c2PARBJ7X93omNHdw6UWwDiGK2h6Zcv1zRH1KGIr5Y6+
	vAF/OdQA29TD3JYRTpoCutCdT1pYx1guxmyO7kesC93v4gDZ5YxBD7UdG8Oz61q5SKNFUt+xymJ
	6zDi3ffsyunujoX0Wst8najJlkv8D+gubAdm7yeBT9TDzl23WLvJZzv0aNAbJ0wGGUmTSjH2Uzd
	tpBPTRmzw/OpI9qJuTJN7ZfY6jgENX22/qwWtpOLrO8F405BJVG5QB7nnNqTN56Bs=
X-Received: by 2002:a05:6830:438d:b0:80c:d34f:5f63 with SMTP id 46e09a7af769-82283671cc3mr6660679a34.28.1791045541448;
        Sat, 03 Oct 2026 09:39:01 -0700 (PDT)
Received: from beelink.. ([187.14.126.14])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227aa6cdf1sm6723839a34.26.2026.10.03.09.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:39:00 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: maaz.mombasawala@broadcom.com,
	zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	dri-devel@lists.freedesktop.org,
	christian.koenig@amd.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: do not hand the embedded sg_table to the PRIME core
Date: Sat,  3 Oct 2026 13:38:50 -0300
Message-ID: <20261003163851.2257947-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DLUS51Y9OLMS.UQR4UY71TFUP@broadcom.com>
References: <DLUS51Y9OLMS.UQR4UY71TFUP@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maaz,

Thanks for testing.

I think the reason you could not reproduce is that the original PoC
opens two fds to the same vmwgfx render node.  When the importer
and exporter are the same device, drm_gem_prime_import_dev() hits
the drm_gem_is_prime_exported_dma_buf() check (drm_prime.c:976):
it sees dma_buf->ops == drm_gem_prime_dmabuf_ops && obj->dev == dev,
and returns dma_buf->priv directly without attaching or mapping —
so drm_gem_unmap_dma_buf() is never reached and the kfree never fires.

To hit the invalid-free, the PRIME import must go through a
different DRM device (e.g. virtio-gpu) so the full attachment
map/unmap path is taken.  In addition, the BO must be bound to a GB
surface before the import, so that vmw_ttm_map_dma() runs and
caches vsgt.sgt = &vmw_tt->sgt (the embedded member).  Without the
bind, the TTM is not DMA-mapped and get_sg_table falls through to
drm_prime_pages_to_sg(), which allocates a fresh table — no bug.

With an updated PoC that uses a second GPU for import and binds the
BO first, I was able to reproduce on mainline 7.3-rc4 (6edd14dd67d7):

  BUG: KASAN: invalid-free in drm_gem_unmap_dma_buf+0x6b/0x80
  Free of addr ffff888103c34e60 by task poc_mm04_attack/242

  CPU: 2 UID: 65534 PID: 242 Comm: poc_mm04_attack Not tainted
       7.3.0-rc4-g6edd14dd67d7-dirty #8 PREEMPT(lazy)
  Call Trace:
   <TASK>
   kasan_report_invalid_free+0xb8/0xe0
   check_slab_allocation+0xf5/0x100
   kfree+0x163/0x510
   drm_gem_unmap_dma_buf+0x6b/0x80
   dma_buf_unmap_attachment_unlocked+0x72/0xc0
   drm_gem_prime_import_dev+0x1f5/0x260
   virtgpu_gem_prime_import+0x328/0x580
   drm_gem_prime_fd_to_handle+0x116/0x370
   drm_ioctl+0x3d4/0x790

  Allocated by task 242:
   vmw_ttm_tt_create+0x4c/0x130
   ttm_tt_create+0xca/0x190
   ttm_bo_handle_move_mem+0xea/0x270
   vmw_bo_create+0x248/0x3c0
   vmw_gem_object_create_ioctl+0xa1/0x1a0

  The buggy address belongs to the cache kmalloc-192 of size 192
  The buggy address is located 96 bytes inside of
   160-byte region [ffff888103c34e00, ffff888103c34ea0)

Setup:
  - QEMU with -device vmware-svga -device virtio-gpu-pci
  - Kernel: 7.3-rc4, KASAN, CONFIG_DRM_VMWGFX=y
  - Three local-only changes to make vmwgfx probe on QEMU:
    1. pitchlock error return bypassed (hardware capability
       check, not security-relevant — VMware real passes it)
    2. SVGA_CAP_GBOBJECTS forced (QEMU does not advertise it;
       VMware real does)
    3. max_mob_pages/max_mob_size forced to 256 MB (QEMU
       returns 0; VMware real provides real values)
    None of these touch the PRIME export/import path or the
    sg_table ownership code.
  - DMA map mode: vmw_dma_map_populate (line in boot log:
    "DMA map mode: Caching DMA mappings")

Steps (runs as uid 65534):
  1. DRM_VMW_ALLOC_DMABUF(262144) on vmwgfx renderD128
  2. DRM_IOCTL_PRIME_HANDLE_TO_FD
  3. DRM_VMW_GB_SURFACE_CREATE 256x256
  4. EXECBUF BIND_GB_SURFACE(sid, mobid=handle)
     -> vmw_ttm_bind -> vmw_ttm_map_dma
     -> sets vsgt.sgt = &vmw_tt->sgt  (embedded, vmw_dma_map_populate)
  5. DRM_IOCTL_PRIME_FD_TO_HANDLE on virtio-gpu renderD129
     -> dma_buf_map_attachment -> drm_gem_map_dma_buf
        -> vmw_gem_object_get_sg_table returns &vmw_tt->sgt
     -> virtgpu_gem_prime_import_sg_table fails with -ENODEV
        (no blob resource support in this QEMU config)
     -> error cleanup: dma_buf_unmap_attachment_unlocked
        -> drm_gem_unmap_dma_buf: sg_free_table + kfree(&vmw_tt->sgt)
     => KASAN: invalid-free (interior pointer of vmw_ttm_tt)

I also found a second, related bug in the same function.  When
testing without the GBOBJECTS/MOB patches (i.e. vanilla QEMU where
BOs go to VRAM only), vmw_gem_object_get_sg_table() does
container_of(bo->ttm, ...) without checking that bo->ttm is
non-NULL.  Without MOB, the BO stays in VRAM and no TTM TT is
ever allocated, so bo->ttm is NULL and the dereference faults:

  BUG: KASAN: null-ptr-deref in vmw_gem_object_get_sg_table+0x2f/0xa0
  Read of size 8 at addr 0000000000000088 by task poc_sgtable/330

  CPU: 0 UID: 0 PID: 330 Comm: poc_sgtable Not tainted
       7.3.0-rc4-g6edd14dd67d7-dirty #7 PREEMPT(lazy)
  Call Trace:
   vmw_gem_object_get_sg_table+0x2f/0xa0
   drm_gem_map_dma_buf+0x79/0x120
   dma_buf_map_attachment+0xc1/0x4f0
   drm_gem_prime_import_dev+0xe0/0x260
   virtgpu_gem_prime_import+0x328/0x580
   drm_gem_prime_fd_to_handle+0x116/0x370

  Steps:
    1. DRM_IOCTL_MODE_CREATE_DUMB on vmwgfx (64x64x32)
    2. DRM_IOCTL_PRIME_HANDLE_TO_FD
    3. DRM_IOCTL_PRIME_FD_TO_HANDLE on virtio-gpu
    -> NULL pointer dereference at offset 0x88

I have both PoC sources and the full KASAN/dmesg logs ready.
Regarding Zack's request for igt tests: I have not written those
yet but plan to include them with v2.

Would you like me to send v2 as two patches (1/2 NULL-check,
2/2 embedded sg_table fix) in this same thread, or do you prefer
the NULL-deref fix as a separate submission?

thanks,
Aldo
