Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383586;
	b=T5pDDsnF52IQ6LapLLi6cGyoOERsDe2fN0jPTkPvu8TNaDxoApQ5QX/XncOksCZPMLXk
	 uqt6hZMLPLwunhWozYUYhbqXO7FzgLvN3HO4x0HUjBEygHMlueh7SJleUNRKITx87aZ6C
	 6DXKE+Kyoaa/yl7qcSSe75c2BzyNRQBE++QtXyjrrvOt5sFxL8o9P1d86vHK6ott9npGW
	 kplbsgOvUqzagS3vHB6F33rcEalhuklFSNTSe4aXlfvtmOVNAv+3Z2UHQJFs8h9RHHi9a
	 P6aKnTELDcfa5jvb4t3Hm6u7B9jXlkl3X5VpQaHFtNx1A8IBAzogHaVz67EqnLV+ueg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=OO34thgIpfnBLKDxy+V7gJ/LfMCRQ5G6mslroPjHH60=;
	b=OtXLk++iZTP+gosIeoZhBJpZZc8uNnq8YZgUFVSMAL6EhTd+937MM1OJ0gPYOfOG4hT4
	 rPwz6m0VzTmJKhfRo3uJjlWECXFTYX7hhvQ9saH0b1/uMCdb9QaKIaHVzBwXBqEfe3hG/
	 Ry5nbgRzoYLPc1bjYD9o7RkYXZ0GQCNAOSckDPkCHig7zXlBhwstMS0qsj78vZ9IUKui/
	 vO+YAyoUt4ABy9S4TzTznUWgnZUjsBabVy4ktu1cCe94vMP5/CGQqvRCEjmNQKq8K3M+Q
	 jQCp6LHYy16XUINIqqlCUrT8tghOaWAWdfEEb9sWxYVJmWbMBNkYDNpAu+pqM+TBQOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qh9LCOAD;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B45606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B45606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qh9LCOAD
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so23229135e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383584; x=1794988384; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OO34thgIpfnBLKDxy+V7gJ/LfMCRQ5G6mslroPjHH60=;
        b=qh9LCOADWEzmdiA75k2jWPNA0yBkjcxg5am/zcWGrzyzxcPxj7HPRox/Oa3brD1NcL
         JuXhUs0YWmoz/GUqgeUUom1FHtCXUO1eJnyrm6j1KAAShstl/Q8QAyyuxuAt14eq2G/B
         yOpjPxWgYdBpuiNdPO8eTYjd5FuDD4HLBWXh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383584; x=1794988384;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OO34thgIpfnBLKDxy+V7gJ/LfMCRQ5G6mslroPjHH60=;
        b=GoxVJ6ldqJeVdcXJkFZhXsVWEon+yAfaqKo8zeSAs5P2ZyU0aN1s6sxt+/509Y2D8Q
         tVsdsyRhDYpqF0NqtpeVXmTzpTvWwhDU/8NbQSIuc4hBAbhbRsDTDkaHqMwrTVjWlfte
         nZL/auIFM6qs2LfgVM9CPIFdNPsuYTC4VHGBiJNJ/d1Nc58G9V1hg/9aB5O4Z3Ek6gKk
         XV31oO9XrhJYlcPybDeCoDP9XoeBIpdpwPMiG1mkjSTUrsm2VW6LjL+jYT7caDtLT2oj
         wBDMVLXriZyoZL3bwwGHsPPwTCu5dRxx7SMzL9f1ChCG1N2InBn0+5Bq4jKlVON3Mecn
         hk7w==
X-Forwarded-Encrypted: i=1; AL+hErHgRT0aRnZFljiIi5sxFsne4ggdd1NPFK8Y2ZdXSyBJManoEZfviZzts6WSQmf98V9aWi8EGaE51Z1TVP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GONUW1Cr30K2ljgEaSpbZMiXvC7r5VUYB59izGO5YCRjUTiG3
	1gxXWH/o9iH5AfPmvx0iBdrm9qgbmK3Gs8+kc4Tnn/Fu4ia+iLrRnzSsMLZN8OeMJ9gLRt+TuHo
	XE+YNzwMPdzFq2S0=
X-Gm-Gg: AYBFou3KEmVXL7tppHONIQAqDtEaFgSCETWLaIVhnp402n5E/ctZkP13vbEtr1YBwu7
	vBluua7hRXb6Oac3RL0qNSFxYedYJ1R3FIkOQnoQVvZVThH6CMwfYjEBIHywiDX2e4qKKPxFsxB
	gMR+GgkNa1MmigMQZ+muzLMOVpGHjKqsGFZIkXA6WHtwOLgdC0SmE8cSFohnLrtCWH37hTQOMjn
	r7YYSROIpsZzEAb4+z8sRx1e88NOYA69YsIQr+g3zLk9Z958a8MkIzRv2gQOUsXrlsEnwk8/0/v
	LC2aWLfp+0sbKMXoj17hLrsMSFmH3v+0l+Fiy9K2ppPO0RkeZ5mv+g/Rj3N2j8XIh6/opi35vlH
	xKwdGDFYmVDjrrscB066NZkLhnBr2f7nlZPyKoIhi74h3u7cQWxOz2CN42Vy4HY8bqtS3vMQb1m
	36Wu8WJZ9w7ry2KLpSbiY6xr4e6+mxvxARxj+WGUAriUXHV58tsWUdTJsSW+h5Fy5qH6rLHS2EC
	5WgTJYxaPCBh0jIXFTpRdIQUsh1ya8f6cVuiSeXplQxOWlE0O6ZpdPVbyuZ0YiFHWR+GNF1v2OD
	v4URahj1+qUsW/t72EbGgpa96T9XlcOkNmIe0mZ2P04CqONeIUF0gzHeoztEFKJCJIPZdzDG0bW
	zoXrNxAGZlgXnzgUMYsd7KLTURMU8f2tglmZzR1bc+9WqtMdipprePR7K9Kvb1VTgUWfKjGdFNz
	LVgU4Ei0l7CoaGK/lYpbxwEq770VAKtkdjp4gmW132PW+OWAPB90N7
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4ba093811c8mr23533605e9.5.1794383584057;
        Tue, 10 Nov 2026 23:53:04 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a763sm120391615e9.4.2026.11.10.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:03 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:01 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
 monitoring
Message-ID: <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

We want to use live update at Meta to upgrade hypervisors whose VMs
can't be migrated away first. But this poses a problem: whether we can
enable KHO on a class of host depends on how much memory it leaves
available for unmovable allocations. In an early test, a 64 GiB host
with hugetlb_cma=6G set aside about 30 GiB of bootmem, which the running
kernel can only use for movable allocations.

The reservation varies with the kernel, memory size, NUMA layout and
command line. Our fleet collector needs the actual size from each host
so we can decide where to enable KHO and catch a kernel release that
takes those hosts over their bootmem budget.

Today the collector would have to sum kho/out/bootmem_len in debugfs,
which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma
count in /proc/zoneinfo includes bootmem after a cold boot but not after
a KHO kexec. On an 8 GiB QEMU guest booted with
kho_bootmem=32M,1536M,512M:

                CmaTotal  CmaFree     zoneinfo cma (all zones)
    cold boot   0 kB      2127872 kB  2129920 kB
    KHO kexec   0 kB       881336 kB  0 kB

Even if bootmem becomes a CMA area, CmaTotal will still include other
areas such as hugetlb CMA, so inferring the bootmem size is still
error-prone.

Let's report the total bootmem reservation in bytes at
/sys/kernel/kexec/kho_bootmem_size.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../ABI/testing/sysfs-kernel-kexec-kdump          |  8 ++++++++
 Documentation/admin-guide/mm/kho.rst              |  9 +++++++++
 include/linux/kexec_handover.h                    |  1 +
 kernel/kexec_core.c                               | 13 +++++++++++++
 kernel/liveupdate/kexec_handover.c                | 15 +++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index f59051b5d96d..80941a7d8a7c 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -59,3 +59,11 @@ Description:	read only
 		to the crash (kdump) kernel. It lists the start and end physical
 		addresses of CMA regions assigned for crashkernel use.
 User:		kdump service
+
+What:		/sys/kernel/kexec/kho_bootmem_size
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Total size of the KHO bootmem regions in bytes. Returns 0
+		when KHO is disabled.
+User:		system monitoring
diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index f9d2cc5999ee..c329d720bf25 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -81,6 +81,15 @@ At scale, correlating crashes to the previous kernel version enables
 faster root cause analysis when issues only occur in specific kernel
 transition scenarios.
 
+sysfs Interfaces
+================
+
+``/sys/kernel/kexec/kho_bootmem_size``
+    Total size of the KHO bootmem regions in bytes, or 0 when KHO is
+    disabled.
+
+See Documentation/ABI/testing/sysfs-kernel-kexec-kdump for the sysfs ABI.
+
 debugfs Interfaces
 ==================
 
diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index ef2b188c8ed0..736d51e79fd2 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -40,6 +40,7 @@ void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t bootmem_phys,
 		  u64 bootmem_len);
 
 bool kho_bootmem_overlap(phys_addr_t phys, size_t size);
+phys_addr_t kho_bootmem_size(void);
 
 static inline enum migratetype kho_bootmem_migratetype(unsigned long pfn,
 						       enum migratetype mt)
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index f4a31565c447..ed105e6351eb 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/kexec.h>
+#include <linux/kexec_handover.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
@@ -1324,6 +1325,15 @@ static struct kobj_attribute crash_elfcorehdr_size_attr = __ATTR_RO(crash_elfcor
 #endif /* CONFIG_CRASH_HOTPLUG */
 #endif /* CONFIG_CRASH_DUMP */
 
+#ifdef CONFIG_KEXEC_HANDOVER
+static ssize_t kho_bootmem_size_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)kho_bootmem_size());
+}
+static struct kobj_attribute kho_bootmem_size_attr = __ATTR_RO(kho_bootmem_size);
+#endif
+
 static struct attribute *kexec_attrs[] = {
 	&loaded_attr.attr,
 #ifdef CONFIG_CRASH_DUMP
@@ -1335,6 +1345,9 @@ static struct attribute *kexec_attrs[] = {
 #ifdef CONFIG_CRASH_HOTPLUG
 	&crash_elfcorehdr_size_attr.attr,
 #endif
+#endif
+#ifdef CONFIG_KEXEC_HANDOVER
+	&kho_bootmem_size_attr.attr,
 #endif
 	NULL
 };
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 3046b89e5db4..21d77e29d2bb 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -942,6 +942,21 @@ static void __init kho_reserve_bootmem(void)
 	kho_enable = false;
 }
 
+phys_addr_t kho_bootmem_size(void)
+{
+	phys_addr_t size = 0;
+	unsigned int i;
+
+	/* kho_init() can disable KHO without clearing kho_bootmem_cnt. */
+	if (!kho_enable)
+		return 0;
+
+	for (i = 0; i < kho_bootmem_cnt; i++)
+		size += kho_bootmem[i].size;
+
+	return size;
+}
+
 /*
  * Look for free blocks of 1G. This is a heuristic chosen to work efficiently
  * with large systems with hundreds of gigabytes of memory. It will work poorly
-- 
2.54.0

