Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E355221C1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868332; cv=none; b=gOSqDNDlf8Bx7Yod7++/HFeiHVqZbSSDYmZmvASIeBxWxJbd/tC19rPSWm2DQ4h5NWL7ia6tOQIE+2Sd8dlEPMQ55fouJNA1Qut5AyQsmywaycPdk5hP11AOjl3NLkUu9WLBhYCANgGnEVi/A+nH8oEzlWSA1bBGnr+Qo0hKgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868332; c=relaxed/simple;
	bh=V6L14a1igr1FcXKQQJFwz1tBGISdVzNp8vgZBOT6NY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzEPIyjfcE7rGwJtmGI1+u/akQ6i8CtEuVSMLWPVti8eWiqm28YvVBZw3AJh29PzybQopRuKzftJp6y0YAdE/Y5O+7iPmHd24n2h05WpSlgu2SXCgOaI1sd1r9IJK6xQA8z3tXz464cyb+XJ/Q3n7I40S9fepC42jCNP2JXiZkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG5y/wl/; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG5y/wl/"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88826f3ff80so480810b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790868330; x=1791473130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ow6P9ENaq/P6weMozIYjsY54hMuiHWrHxdkamgEMjQ=;
        b=aG5y/wl/rqJwe9C1K5KRQS2iG9cp/0DG67JgucPa2RYlaesa9NYR6H/Fwrc4OSyDc7
         9BIZeqo89tepqMtsbdzGD3YDbL0XX1t4GVKRpeXki0nMKRxM6p+wb0eHBI5Sm50BLgvY
         aOl0idzuW6ziCFeJjfWAe3zkV33fN30gFjPnP6KmTCWDwg25Q3YLkOKshfjL1LkNkqYS
         mbkgTVc15H1+SFJ471cxBa0APvW/G/dHbcZ0399GmII31uNdw/2o1W/O51OgAZNK4YKy
         epokPO7BMdS4rb78HVkEmygE4b1wVUzMOPmF7X60B71GGDn843Rh7RHq/0KwQGj96ERh
         4CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868330; x=1791473130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ow6P9ENaq/P6weMozIYjsY54hMuiHWrHxdkamgEMjQ=;
        b=vC7CRZnNgrRdVAhdsN5HbZhpr2/+YS4eQPrSmXRnK0bmbuyawdpJS2VeY8gi9GJJCL
         6g4d4V6GKteeSdGR9/CX4l9nehiQ+fy4O6J3kVJjGE+tyCAfzYbDt8xrYEvUlUqo5khm
         KDqnueK5J+5gGjTRa+XeFc3mIKEkBVZ90T9Pw+6splDmcSky7wodJEf6JP69xedfgCyv
         TCuRCec4h0BE5cIO77RrqjKPkdv3ryM/FPJMQVZLvNUaIUpn0RjMtUtkuGXb5c+8dO5u
         /yOIaQMTu0RGy9v/qt80R4aUIJ/dJxOpKw0JDMwA+dop98ob3R/LuLhthOYBxD+99Tj+
         8GBg==
X-Forwarded-Encrypted: i=1; AKwUvBzjsI7ag8Zy8VDS0l1GK47LePsJCLo90HrY5/Gu7BA61fGRvoGCRBx9jXE1pS/nFmvLRUQinpapq/o0zKU=@vger.kernel.org
X-Gm-Message-State: AFuF++kjNmaN/wL/mBH0HoF+bPM0o8gl3BfojkUffLt+XLgo8DdX5HmG
	D4AdMoRMoKwv2WdWkHXgidyxilKGuj92LxO5yZgjQzsxuaKMtTpWO/Mt
X-Gm-Gg: AYBFou209NyVYcY+V3Zz5qBGHHxENfIsITvPhh5WyAHhpbnP/05IVoeMb5mTupfgOJo
	GP5MbS6F25PMLHcUj9VYBm5O0RRQ4GnaZooZw71PwPNh2YnGgFA8PvXusXPsIyTQAhIkQvC/Yp+
	60zdAg4RQ9w6LGKfADmf73/P8/J9U7oeM1j9I8e4ZVPf3UI2YSRbGCMGymyBLTfVynEcU5St8KJ
	stOoBs9gnSVm9VKp+JvQdh/GKhtxfphAZr5uE3KnDJoGgbRbzWbZ0WDNo2nmlP6+b65U9phx+b+
	0+0XTqy481gFVYHnl5qrj0q2E1KJDJ/e6ZykqA2LPbf/QeHusy6beqMDV4BZCLwMCH1DUKFHmLZ
	ag2l9W8Bywg4sF9KqnSy8pBcQ4Y0dadqioEQvNh57LsbKbkJw5TkRZWVdcX7oNi9r9Q0XGMsHK0
	ad38EYPUWc5pe+stLATY83QS4rnRkSuxAzndKaPQeOQJmVdSxCE8FT1qrxlGJ6+0pOyauTRQCjw
	RL42U46zsK4
X-Received: by 2002:a05:6a00:21cb:b0:886:458a:42e9 with SMTP id d2e1a72fcca58-8874c9d1ce6mr4160705b3a.49.1790868328827;
        Thu, 01 Oct 2026 08:25:28 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d457:2e1e::498:2b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88815996973sm1320468b3a.6.2026.10.01.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:25:28 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterx@redhat.com,
	dave.hansen@linux.intel.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com
Subject: [PATCH] mm: don't ioremap COWed anon pages in generic_access_phys()
Date: Thu,  1 Oct 2026 22:25:24 +0700
Message-ID: <20261001152524.171115-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <699ae98c.050a0220.340abe.0d31.GAE@google.com>
References: <699ae98c.050a0220.340abe.0d31.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A MAP_PRIVATE mapping of iomem (e.g. a PCI sysfs resourceN file) is a
COW pfnmap: a write fault replaces the pfn with an anonymous page, which
remap_pfn_range() allows by keeping vm_pgoff equal to the base pfn.

generic_access_phys() does not tell those COWed pages apart from the
original pfns and ioremaps whatever the PTE points to. Reading such an
address via /proc/pid/mem or ptrace then ioremaps RAM:

  ioremap on RAM at 0x0000000045623000 - 0x0000000045623fff
  WARNING: arch/x86/mm/ioremap.c:216 at __ioremap_caller.isra.0+0x4c2/0x5f0
  Call Trace:
   generic_access_phys+0x130/0x4d0 mm/memory.c:7178
   kernfs_vma_access+0x1ce/0x280 fs/kernfs/file.c:437
   __access_remote_vm+0x58f/0x890 mm/memory.c:7256
   mem_rw+0x2a1/0x670 fs/proc/base.c:912

Reject COWed pages using the same linearity rule vm_normal_page() uses.
All generic_access_phys() users set up the mapping with a full-vma
(io_)remap_pfn_range(), so the rule holds for them. The access already
fails on x86 and arm64, whose ioremap refuses RAM; elsewhere it no longer
reads the anon page through a device-memory alias.

Fixes: 28b2ee20c7cb ("access_process_vm device memory infrastructure")
Reported-by: syzbot+49b1021becba70c1f3f6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=49b1021becba70c1f3f6
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
This answers Dave's question on the syzbot thread of how a PCI BAR can
point at RAM: it doesn't. The repro mmap()s resource1 MAP_PRIVATE with
PROT_WRITE at address 0, then (via syz_ublk_add_dev() with NULL args)
writes to address 0. That write COWs the BAR page into an anonymous
page, and the later /proc/self/mem read hands its pfn to ioremap.

Forbidding MAP_PRIVATE on BARs would not cover /dev/mem, uio, cdx or
dfl-afu, which share this ->access hook, and private pfnmap COW is
deliberately supported (see get_remap_pgoff()).

Tested in QEMU (q35, virtio-net at 00:03.0) with a small program that
maps resource1 shared and private, COWs the private page and reads both
via pread(/proc/self/mem):

                  before              after
  shared          4, 0xfee01000       4, 0xfee01000
  private         4, 0xfee01000       4, 0xfee01000
  private-cowed   -1 EIO + WARN       -1 EIO, no WARN

(pread() sees EIO either way; internally generic_access_phys() went from
ioremap WARN + -ENOMEM to -EINVAL.)

plus 4 x 500 parallel runs on the patched kernel, no warnings.

Note: the syzbot report also groups an unrelated signature under the
same title (pcibios_device_add() -> memremap() of setup_data on PCI
rescan); this patch does not address that one.

 mm/memory.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3d..8551b144028d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7141,6 +7141,14 @@ void follow_pfnmap_end(struct follow_pfnmap_args *args)
 EXPORT_SYMBOL_GPL(follow_pfnmap_end);
 
 #ifdef CONFIG_HAVE_IOREMAP_PROT
+/* A write fault on a private pfnmap replaces the pfn with an anon page. */
+static bool pfnmap_pfn_is_cowed(struct vm_area_struct *vma, unsigned long addr,
+				unsigned long pfn)
+{
+	return (vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma) &&
+	       pfn != linear_page_index(vma, addr);
+}
+
 /**
  * generic_access_phys - generic implementation for iomem mmap access
  * @vma: the vma to access
@@ -7175,6 +7183,9 @@ int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
 	if ((write & FOLL_WRITE) && !writable)
 		return -EINVAL;
 
+	if (pfnmap_pfn_is_cowed(vma, addr, phys_addr >> PAGE_SHIFT))
+		return -EINVAL;
+
 	maddr = ioremap_prot(phys_addr, PAGE_ALIGN(len + offset), prot);
 	if (!maddr)
 		return -ENOMEM;
-- 
2.43.0

