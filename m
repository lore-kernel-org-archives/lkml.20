Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329236;
	b=JLRN8TkhOlrNUG0i0w5DJB47r8j/s6eNg/gsDZGhuiXs/884bATf7ik5pTGIzLyhXcTN
	 BI3o1/rRBZ9H5lfe7OSrtce0vI0C57cID4MWvGP4LwYIi+p38ZDX9cm8/wH7Dr2bBrIAN
	 JVwSUqg+QJe8U/PUOZ07z5F8g6OVs900nfku8s9sx2aEprWqa+Fjo+JFEHywnUcdYlg39
	 XHETvZ1waJccfJ9lcb76e62IaHuUwUtX6Gv1FBpfio2pfD8Gd9PXBJ3rhHY1skKL74ffv
	 hr7YERgF/h+x2NnAqHRCNPUCgUuwVyNiMPgpVycqsBgeuJwy7V3t6iHXktA72m8yzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WT6C7Hu6Q9Eo/dM1QL4EzHwS0urSyLblqYy3glwBl5U=;
	b=VCSHySV0QpoRxdCO5mTlLvHT2GmFb0/zvyBkwTQ0FJM2yhVpFGBPmN10gY2EH1WDifqo
	 2J0viZwoPFB0+c3TICBD8XmBVVjlahbpXhaJ7qXPsAhwZdpY7DBCseJaxwjqOGDjmZS+y
	 x0LMPdCOTThVOSJYyvLBhQCI4whx9aoTC3IxGvG9dhj6kci4szXldcUys6V38EJE7PMMd
	 1p7mHj+PJzB6/JTRYuCR7m8Zr6+qNWdBxHb0JR1cuYp8PIEhHNcbUCaJlqcEeidjxO9oW
	 iJB9jnGEhh7e8tcbACzS6W1v/5cLFLljMTN8WlmwOWSMEbArE1+1HwopdzajbyA1qxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sezp5elc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319FE606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319FE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sezp5elc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso16467325e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329234; x=1794934034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WT6C7Hu6Q9Eo/dM1QL4EzHwS0urSyLblqYy3glwBl5U=;
        b=sezp5elcG4Em77hbvn4JdN4U+FNk5o1jD1QzJ6ycnaOhkAKU5NSQjT456+rzVVADjK
         Q76LeCO2vDd+3YKdeEsPMUBr+itIK9aOLzL+FNN/HJRxMBQ+XdCSqRn0i1flhyhigwV5
         dc4KSEEDXaM4E1pl42eLpMBLkKS+xV3BDCcR2Lo1nzJtbD/TmsOZP0/xrle0Mi2hncur
         fKx/vZBjPqkoT/wJAD4WnuTEnzhHZ8cdbpncwU//5kIcONENFSHfC0pseOTmJSH82u6R
         50siBReM1UGWf0XpPC6f9aQw1WFaQEBQZGztBf7PIRfpHXxfHPHeAhEAzjtb8yhIAQhT
         ES/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329234; x=1794934034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT6C7Hu6Q9Eo/dM1QL4EzHwS0urSyLblqYy3glwBl5U=;
        b=Rm90e69ZxT7QmQXUdVycsoq2t4MBRkoQFx4PP10dtvYAXKC6+VKbEBwymwwtsH25E/
         EbJdb8RN7KhktHsA4n4QTYxNl5O+7Wr0F/EWC4PD/8MKg0cvM9bF4JO44e+K2KA2SnQE
         Qa3lfa19/pocpuIMYNMaxdfkoma4RVYcdrIXCYsya9fxSYl19kzeouHw1kUhFFs9Fymf
         g8nwaP277v9kQETb7gsZIn8TZ9JpnEtQwuvbKwrJCpengGHY4sd4SWD5f2BzzzdpuKUU
         AWj0gNuyBLaq+OBp0uVW0PXtoPUyZc1C2YQYZnwaSqkoUPHkeUs6f5MRjpI5YczSZgqX
         ttsQ==
X-Forwarded-Encrypted: i=1; AL+hErHedcjP8eY17jpOkoVdMWwocZ2R382OHdhc7Tzem+kXt8HuJvjLnZuwp+iynVCzRVYGZCXi7tn3VjxeLt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4zmxB0EtJ1G1k+D0wfIyGM+TKdAdghNSFaja8jhqiVeEV8iD8
	M1GUAlE0jeUS4zWicBejxrBM8b9ndOfPfN0GVXLgDtbJoxkBycI77tah
X-Gm-Gg: AYBFou0+3bXeAHfofg+mC46FYVRsgTdli26NO/y0ZvlSAcujZqtDSPim8QUH0gSezn+
	Xv7oY1iPgeN2nnVeA3l1ydI0k5QetXEpYcD/4Q+rA/epksoq6SxPnfQXymvoWvTH9jvte15xAeg
	sGesfltdQtbzxnUq8sxg0pQTIkjPopw7QxOQ7C06GBTtdHb5rs8WNSdxaxgRFcBYbt4yJ8rCV9f
	Hm2L4kT4pimM0OeptSuTeJzXjgB0OvqxVZEkXY5XIUJy9YiTBRbWNYYeCRTDnZ6oYo1teBlM4If
	148htep3Vxo1Wyqsdj2fgDyevwSeyb+v/r/8+5GrP6nhRFEk5pzL8yWsF1tg3TmuhJtEX+9D1XY
	4/ujCHP1PmbEkAAt7j2UoQzFndNlZRp/e9dDZZEBbya502vr8sc3vrDrHdTcWG9+DhyU/6NJJkr
	uMeyLkEA+fP7invZeJCt+9s5sLjiF+ajaOnknARQoNdUmCPKj1SH+QNY+CxAEjo+R00FXQWh7zp
	vTs02ATRNTzWaEdr3n2yk3QNf7JW0frnqlSQcKBay0k8xGbxaLnEfBJSXRZ2z0CVFBC8SImOvOc
	VECsVkuy1omp2u1nhLBm0C4mGhCkAVsko7mVnSpKnpOk5RpZwx4Tm8Gpd4kHVXLuXHQ/Au5+Jy6
	f5G2kae9DiitazHxLqR8owO9J
X-Received: by 2002:a05:600c:4e8a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ba02345745mr59161225e9.12.1794329234174;
        Tue, 10 Nov 2026 08:47:14 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.65.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm84905075e9.9.2026.11.10.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:47:13 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	haseeb.ashraf@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] KVM: arm64: Resume stage-2 unmap where the walk stopped
Date: Tue, 10 Nov 2026 21:47:05 +0500
Message-ID: <20261110164706.582879-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unmapping the whole IPA space of a shadow stage-2, as emulating TLBI
VMALLS12E1IS and TLBI ALLE1IS does, walks it one block-sized chunk at a
time. The walker steps over an invalid entry in one go, but the next
walk starts at the following chunk, so an invalid entry larger than a
chunk is visited once for every chunk it covers. Each walk also ends
with a range TLBI when FEAT_TLBIRANGE and FWB are available.

This version follows the approach of Fuad's series [2]: the walk reports
the address it reached, and the unmap loop resumes from there. The walk
already handles every entry it steps over, so nothing has to be looked
up beforehand.

An example shows what changes. Take 4K pages and a 48-bit IPA space.
The root is a level-0 table with 512 entries of 512GB each, and a chunk
is 1GB:

  Empty shadow stage-2
    before: 2^18 = 262144 walks. Each of the 512 level-0 entries is
            visited once for every one of the 512 chunks under it.
    after:  512 walks. The first walk under an invalid entry returns
            the end of that entry, and the loop resumes there.

  One populated 512GB region (RAM and devices low in the IPA space)
    before: 262144 walks.
    after:  at most 512 + 511 = 1023 walks: 512 chunks inside the
            region, and one step over each of the 511 other entries.

The example is derived from the page-table layout. Measurements follow.
The machine is an AmpereOne A192-32X (192 CPUs, bare metal, 4K pages,
48-bit IPA, FWB and TLB range maintenance present) running Xen as a KVM
guest. The workload is one create and destroy cycle of an 8GB guest
under Xen. bpftrace kprobes and kretprobes recorded every full-range
unmap (start 0, size 2^48), its walks, its range TLBIs and its duration.
"Before" is plain 6.18.29. "After" is 6.18.29 with this patch, adapted
to the older unmap loop, and with seven commits that are already in
mainline backported: 33346f8960c7 and e5843f4effaa (nested_mmus life
cycle), and a6ca6cba5959, c2778d14cd2f, 5491980c1a41, e6084aecaeef and
2064f15b0848 (guest stage-2 tracking).

                                    before          after
  full-range unmaps                    192            128
  walks per unmap                   262144     512 - 1024
  range TLBIs per unmap             262144  same as walks
  unmap duration, mean            907.8 ms        3.77 ms
  unmap duration, median          909.3 ms        2.46 ms
  unmap duration, min             815.5 ms        2.06 ms
  unmap duration, max             937.6 ms       27.8  ms
  VMALLS12E1IS trap, mean         957.0 ms        3.78 ms
  VMALLS12E1IS trap, max         1848.6 ms       27.9  ms

Walks per unmap after the change: 512 (10 unmaps), 534 (1), 546 (78),
1023 (38) and 1024 (1), mean 689. The page-table occupancy was not
recorded, so I cannot tie each count to a layout. 1024 is one more than
a single populated region gives. Before the change nine of the 177 traps
unmapped two shadow stage-2s and took about twice as long; after it
every trap unmapped one.

Patch 1 adds kvm_pgtable_stage2_unmap_range(), which returns the address
its walk reached, and has the unmap loop resume from there.
kvm_pgtable_stage2_unmap() keeps its return value for its callers at
EL2. The unmap of a shadow stage-2 also drops the guest stage-2 records
of the whole span the walk covered. The TLBI VMALLS12E1IS handler,
kvm_nested_s2_unmap() and the pending unmap of a recycled shadow stage-2
need no change.

Changes since v1 [1]:
  - Reworked as Oliver suggested: the walk reports the next IPA to the
    outer loop, as in Fuad's series [2]. This replaces
    kvm_stage2_unmap_all() and its kvm_pgtable_get_leaf() lookup.
  - No extra VMID-wide TLBI: each walk keeps its own TLB maintenance.
  - Measurements added.
  - Based on Linux 7.4-rc1, the same base as [2]. It does not depend on
    [2]; it applies with and without it.

[1] https://lore.kernel.org/r/cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com
[2] https://lore.kernel.org/r/20261106133000.453240-1-fuad.tabba@linux.dev

Tooling: the patch was drafted with AI assistance (SiemensGPT). The
statistics were collected with bpftrace, using kprobes at function entry
and kretprobes at function return.

Testing: the backport of this patch, together with the seven commits
listed above, was booted as 6.18.29 on the machine above, and the
measurements are from that kernel. The patch for 7.4-rc1 itself was only
compile-checked in isolation.
