Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753614;
	b=v/oWv+wdYF4bI9pCGnjJkLAQme7mYlbIf0hnx6EVvXHSmaVXRN6FekrHJLDvQtIZ3yxB
	 v6WWvZ5MCJtW4FSNq8t+CUMybhtDxuXBJipb+it07+chmhKPLYw5IWxb7GAfDuBc4a7bo
	 A+/iOtJclpDcnlidekdvcYNJsXog0Xf4LLCiN45x8+aPSEBJnXCP1qovW4qibuQkws3ci
	 WO2CdkKpnHZEQIs6fg7M4wdai8AI+g5KIqVsL+4BiYhBmXdH6YYe6y1Qh7sqBaR6MA+uE
	 02hko1VI8xbSobXWWvrxE77R/DG6YyK2fqBkQ6fawo2DfkeA3h7czdfXIb2fCS7yeMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S1SsyVWmFN/K3FnAnSvhcSztrShloDWtZn+HQ2qgOL8=;
	b=riNDjD0Yp16uKMyOyHHIqswda9e1zCqgZUDqhCW0PsL9pOppPSTO004VhF8VteJpbqPI
	 Ii6pLSWf9u+WTvt5EbXEyHnGfoqMbdv0AcO1Ii3T45JLbMIIfVxPxW0UlaEAdTsUIl4TH
	 w+Yl9GljI9PqPzyiUAaZdDtsj9wGUswtKSreXWTVbw/L6tq78UOSlvx43F+QxMzBpnZcz
	 P1PJ05lcXd/J4V6CGHwvtUoAmoH1yGwxKRVXNW2cKrBLKy+UtAoWWnDty7JHSrsHSz+LS
	 x8GC3mi78S10VesJj4pTw1/xNpkEHvCnXvfsX/udY+0pvTbuiepHe+kN0JEhuQDXUFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpZWTHSp;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F289E606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F289E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpZWTHSp
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so1452305e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753612; x=1794358412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1SsyVWmFN/K3FnAnSvhcSztrShloDWtZn+HQ2qgOL8=;
        b=TpZWTHSp3XI2HlV5SyPj702wB3fTkW5MoFJcmd3OwxRVxd5x+fnWfkQYGk7jGXrh4U
         LYDX9f/LcVtY3i5adkOhw0DJ2h7+p3bI8jxmh9p+FQnRejjtNa6drOPtf8VitgdEtbos
         Dog5iOXEYcYmE/O1IMhgaxe/Knm0NP9ry5WU0woP0DMXuEUPteDeSV7MDqaodonxMIdo
         F7F19GbBl6UqYo0iuaKrCJ+9oCJ9SWYoou5St0p4kuI5/u4CfgZLDy8tW94GjH3k9xPf
         bnjYiGtPTQzCBmp1ouVs7cBeFIY8r7geyHbt5ycGwhGBrjCmtx/c95B92R+p+VzvSKQe
         PdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753612; x=1794358412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1SsyVWmFN/K3FnAnSvhcSztrShloDWtZn+HQ2qgOL8=;
        b=HyYttO2Bq/peYepLLb4jIXElMequDSBggTfAJ0A/JvR7LIsAgspNAaiU5bSOJNJg7V
         dFxeblniUFrRHUiRubOJtQgD2j95yUnstch6rfD4l+Zo3hIGh7//tHY0AaU9JCevulvr
         OT+JQ7KdaNGWajwL2iETwcVOZmrcC/RFaXpxf9YvJ5QJ07i0eS5pMkDmfOl5KppYcWBP
         2l1wJ0FioKZI8njTxaZvKhjkmS8PeeJH1jlGZPkUWepXUMwtVf/RXTO+eu77Tc+uPXgE
         1AvUuMilA54LK806KbPuzDGkmQbbtouQlA6M2hi8Gg0QSxwrmU77nEWTmINfvQ0Jmvhg
         7AHA==
X-Forwarded-Encrypted: i=1; AKwUvBzytcJH/fhFAW6CsWOesMwOImg+MlO6s/QPBtgUt11hDgoZVvkiNXT59KMki9J6A7/2AU0V2GkrHePgSfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LgpHOIX1hTcgvo8vdttoKltFaNA1NQvSdx1kH3PfKwiI2PAqo
	vH5aXZkPBll3o5ldrGw2NqTBJOi389m6sNm3Yet4D6tXx+u7c3Xidg3+
X-Gm-Gg: AYBFou2SMKzUsGM0eHIncr7GnRGqn/13DdXanOJlm23RT6yX9tSJovshCqjGgNvR3h0
	FO+5JvTuZLmxFUi0n8pvcvnJ3wRtc0N1LSSm1WxWRABy2TJ0KGBMBntq8rGE4orp1yAaAFKzIn3
	m8CmvJvY/tnhPcpnSnsxlQiVyJkURJAHiK9WvGkWWZbstJaSwhTZOLfwUV/OyNLIKimJSxWEHWq
	LCJsrMzW+MGJaeVWYuAAFcPON+CI1y1wTVryUVkek0tZaf08r/RviY3yTEMGrs6qd7HJecAGUM0
	msayPxyV6F3uImnkepv0GXIA7Ue8fMvPA2HGnh6HYLFc6cjJOiN1w4lQz6Y1VwlDvVPyNZtXKSL
	cH28AxU347lvFLjrx9yqiWncgn4xC/IQ4eQH7fOOG5oBZfZk7ZMBLhuTQRsW9QYg5IZg68u4O4B
	933DHjQbgW9PzIqIVmO/BHFzm0yE3BULUPmvytbdd+17X5D4eNtFmawFttjpKT3JcSnaBuOrids
	P+/7rG0PFfjuhx8+nBB//RnX+WKUmxkM/dM13nTeR9mqRDtnrTiPeYwPV7AEvH44YPyEZ5RseaX
	KQ+R6K1Tz9Hv6lQg/3hdv8+JcRb0cyUg2g2J1GVrC0jokaqI8kAKZveAhzF19IyC7XVXCghgF4Y
	Gj2NZFxoJi9/0N1Fk5hqt5+X0POqpABdZrsL/w7SHWHp84y3Qym4U5l+CeGpdjCSWnQ==
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ac1709aa77mr317867705e9.16.1793753612056;
        Tue, 03 Nov 2026 16:53:32 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ed95sm11899275e9.4.2026.11.03.16.53.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:53:31 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>,
	James Houghton <jthoughton@google.com>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/5] KVM: x86/mmu: Allocate memslot rmaps on demand
Date: Wed,  4 Nov 2026 00:53:26 +0000
Message-ID: <20261104005331.50600-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

When an L1 guest runs a nested guest, KVM allocates rmaps for all of
L1's memory the first time it creates a shadow root, one 8-byte head
per 4 KiB page. For an L1 with 4 TiB of memory that is 8 GiB, allocated
at once on the first nested VM-Enter, whether L2 maps 1% or all of L1's
memory. Sean pointed at this cost on Mushahid's lpage_info patch [1].

This RFC allocates rmaps in page-sized chunks instead, when the first
SPTE in a chunk's range is added. Each memslot keeps a per-level
directory of chunks, 8 bytes per 2 MiB at the 4 KiB level, so the 4 TiB
L1 above allocates 16 MiB on the first nested VM-Enter. A missing chunk
reads as empty rmaps and slot walks skip it. When L2 maps every gfn,
rmaps cost what they did before plus the directory.

Patches 1 and 2 prepare the slot walk and the debugfs rmap statistics,
with no functional change. Patch 3 does the chunking. Patches 4 and 5
add a selftest in which L2 writes pages around chunk boundaries and
checks the dirty log after the memslot is write-protected, including
eager splitting of nested huge pages.

I would like feedback on:
  - The data structure. A directory of page-sized chunks keeps lookups
    to one extra load. An xarray would be simpler to grow but adds a
    tree walk to every rmap lookup.
  - Freeing chunks once they are empty. That would let the shadow MMU
    page limit bound rmap memory too, but lockless aging reads chunks
    without mmu_lock, so freeing needs an RCU grace period. I left it
    out of this RFC.
  - Doing the same for gfn_write_track, 2 bytes per 4 KiB page, which
    is still allocated for every memslot on the first shadow root.

Limitations:
  - Chunks are only freed with the memslot.
  - Eager page splitting on dirty-log enable splits L2's huge mappings,
    so every 2 MiB that L2 mapped with a huge page then gets a chunk.

The series is based on kvm.git next.

[1] https://lore.kernel.org/all/arr1VgGZmgUmY4hc@google.com/

Fred


Fred Griffoul (5):
  KVM: x86/mmu: Walk memslot rmaps by index
  KVM: x86: Count rmaps per level in a debugfs helper
  KVM: x86/mmu: Allocate memslot rmaps in on-demand chunks
  KVM: selftests: Declare __tdp_map() in the x86 processor header
  KVM: selftests: Test dirty logging of sparse nested mappings

 arch/x86/include/asm/kvm_host.h               |  22 +-
 arch/x86/kvm/debugfs.c                        |  46 ++-
 arch/x86/kvm/mmu/mmu.c                        | 126 +++++++-
 arch/x86/kvm/x86.c                            |  22 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/include/x86/processor.h     |   1 +
 .../kvm/x86/nested_dirty_log_sparse_test.c    | 275 ++++++++++++++++++
 7 files changed, 460 insertions(+), 33 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/nested_dirty_log_sparse_test.c


base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
-- 
2.47.3

