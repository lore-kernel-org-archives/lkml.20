Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556965;
	b=apCuZe/CK7jr5crSFB9mnLRhZ3ipx9STWMz331yEc90i26lb883/kDj9/5B5UecVXpfd
	 +ynbG8hcFhuncBq9mNhZJYuuf5XJpoqdcmMHODDJaG8XrJpAIA786eW+Cr7eBYCrn4Slz
	 QAS21KKD7jGDwann8gdZkcGYcelrK4fiiOKJFfQa1dejIK67iyJMTa+WZLvhPFAIoqqYu
	 kdXYGR6cqhi2SW6isenWb3ocGKb+Xx2c705TYmAOMwpV2krS3t/vcz9uQT9GHxtwqo4sc
	 WtgmACLF1ZgC6ZBGTqj4GN/kPuqgyKcQxG0moc388k5EdtSZE3ZxdcDEaZu5NK2BxSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m2yVRZxHwu+H87tnkegJ2BGDddelTKfG+o3rRUob1Ps=;
	b=DxB5UTtu+kuDHaWtIfP9viMzU3IythSla1zUdIaNlxUzs3/eKXxoZdeuERcSiTCZ6CQR
	 GnZyHaGp6r9HP1JjXxy6LsOBjg6U59WRc5hXY1MQ9iso9cWvve7H5+WhsP/Xy/ZwdckGX
	 nN2j8xHC6TfsVYXxz/YUoUgeE0LbmV9ZfwqOY9ZeQUV0sCaLTzUUZ71BiXIZo/BvHe3Z2
	 eWKzyzVylL3VO4UTHgwqkM85g28G+QLfCNHAjk9t54aRjyKzXcLX2lvynYDDuwAzbYwrU
	 wZeDcctudOw8/9zyHPLZ21eCgugOITva/vULXZHkFqr3CNdoITMJoNIvj3uEFlGsP+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqLmU9Oz;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C552D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqLmU9Oz
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so3521675e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556963; x=1795161763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2yVRZxHwu+H87tnkegJ2BGDddelTKfG+o3rRUob1Ps=;
        b=GqLmU9OzwUI4MJGPjQobF2aW0Wds9OuPXe3h2Gy0J2xJ+E0dvJnIEyjSSlKmbhr7ON
         OGapBU7mTsOe8X34Ce82GgS7tDGbueQThBdFhDDC45yxdn8lky4N3gWj0fuTqSoxK7tv
         omRi0fIlMu9Yn7+aOPHpCmsZtuepx2Ted4E8HeebOJvz1oF+Qog5ScCKLXXXXQbQTw9A
         LrSQTJxz1nQa1z88ZoSZsV6Z4Xx3jmqNKPeaE1BTn+uRjQ/d3dYr7MP4c27DV9ixVQZm
         G41RdwURexiGlppF6ELUyC00Uf2XvRZw4YeANQZT9GBV+oUogiCQWjm8pwKm6C0+LATm
         HkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556963; x=1795161763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2yVRZxHwu+H87tnkegJ2BGDddelTKfG+o3rRUob1Ps=;
        b=19kfgTbRxsOWvthZ1/TWPdTB4DN5L++rmRUu4bjZl3KXt1joIs3p7SNdcw7Ssdu7IS
         7hxwoCG9Wt3yj0ovv0qCEQGzfkz0MGNDenq7B7A/rpBj2XaL3KcsMsAK0saypPFUR3m+
         O6uOpybxxGiRF18OBpW6v75OtTIC+vr1HEcW50nX4iuvT9bQOwcQK8hwkdwve3otUfen
         6NEs9qO0sYwvCQgUxxKbYcXCfbfadyZ0LfvW9TQL7D/wXzjx8+EX0jGWuRcSQpTqGbBR
         YVQ93Izy5m6pVSdNPSkZCiY5HS6EDCWtlrYhqgrCaVys/CHMmZnTt8C1vG0os5GsuIt3
         2NlA==
X-Forwarded-Encrypted: i=1; AL+hErEj5RZPvFmE3ui4LRyZ90ls1J9ypyXxklPUjbysNpNcAvSytLNytnP8pSuMP+YNg9cDg82RAzL2Buw2uxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bnJwVK9i8J24lQ3qKTcUtqPdhah0+PIfrVlj+15NtiPX+dVc2
	XAXArQ7KDn2ngjJwK+iDfuwaJZvHs2YLGFzOK+6l9zV2B83SNWCrMdpv
X-Gm-Gg: AYBFou1bs1XyWHs0oXMHyMCgc68tiT1LlTJ8CD7wJJeX5nFFquENTnE9IlHfu42fmKp
	nsGw1zLw7Oxi3HWUlrO+O47zFxUyW1hw7EEguHo4MWiwCvJo27CxOIbSCsKzFb49MU5MVRutaUy
	ZuBVyFUtjbDzkAmSGbr/n1iYgw/ng7deFXzPYB9+HuVJsz8ffJIO2NgLVdEoOMKBxR2u/N6AiIb
	8eAgMd9vsVklpy/IBXpwPb2pWY2u4Ds67zGrjayRzVZQ8cLbqKCpJIJqHKE4nHbhl9EJM/w2Nyr
	SPRGNfWjdnDOxcBVd7SOojdU08OzQtfqvGr/U1J5nGXwkW8HZ0WfRb+8micLlOVDhj+yksdNCNc
	QIQRofT/obosrrHfmHAYLI3FLWi7Rr+PGzcj26+WW0ape5pggs7h2ZYO71pxngz3HWBW1KO4gc8
	vEe+6g3xEjn4huBMBS7UKjrhmJ+TNdo3txmDoZgnY32ZDFBNubvSK9vd4I5WlV0pp+MsIYibs6i
	TBQSxiKXVnL2o5RlyoGe91EU52xt5L/kR6w98Tu1UCGclR03Bc+9JW+3U8DieGDSw5q5uoSK276
	x+Ate6Q1X/aZn5PpswH1x401TlfMD5ZX9T6Wq52TDOS5VGgICorEy3qwlEr3Whn1N/qyB4hKlPX
	nhyNBx/Nb5bCQes897X6ySXU5
X-Received: by 2002:a05:600c:8b8c:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4bb55a7a460mr31197555e9.19.1794556962979;
        Fri, 13 Nov 2026 00:02:42 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.13.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm31815065e9.2.2026.11.13.00.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:02:41 -0800 (PST)
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
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] KVM: arm64: Resume stage-2 range walks where they stopped
Date: Fri, 13 Nov 2026 13:02:32 +0500
Message-ID: <20261113080233.640539-1-haseebashraf091@gmail.com>
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

stage2_apply_range() walks a range one block-sized chunk at a time. The
walker steps over an invalid entry in one go, but the next walk starts
at the following chunk, so an invalid entry larger than a chunk is
visited once for every chunk it covers. Each walk also ends with a range
TLBI when FEAT_TLBIRANGE and FWB are available. Unmapping the whole IPA
space of a shadow stage-2, as emulating TLBI VMALLS12E1IS and TLBI
ALLE1IS does, takes 2^18 walks with 4K pages and a 48-bit IPA space,
however little it maps.

As in v2, the walk reports the address it reached and the loop resumes
from there, as in Fuad's series [2]. v3 does this for every user of
stage2_apply_range(), as Wei-Lin suggested, so there is one loop: unmap,
write-protect and flush get it, and their pKVM counterparts report the
end of the range. The walk handles every entry it steps over, so
nothing has to be looked up beforehand.

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
  full-range unmaps                    226            672
  walks per unmap                   262144     512 - 1023
  range TLBIs per unmap             262144  same as walks
  unmap duration, mean            905.8 ms        4.06 ms
  unmap duration, median          906.8 ms        3.31 ms
  unmap duration, min             842.7 ms        2.08 ms
  unmap duration, max             941.6 ms        45.4 ms
  VMALLS12E1IS trap, mean         899.7 ms        4.06 ms
  VMALLS12E1IS trap, max          941.7 ms        45.5 ms

Walks per unmap after the change: 512 (8 unmaps), 534 (1), 546 (366),
547 (1) and 1023 (296), mean 756. The page-table occupancy was not
recorded, so I cannot tell which layout each count reflects.

Patch 1 makes stage2_apply_range() take a function that returns the
address its walk reached, or a negative error code, and resume from
there. kvm_pgtable_stage2_unmap(), kvm_pgtable_stage2_wrprotect() and
kvm_pgtable_stage2_flush() are that function for unmap, write-protect
and flush, and so are their pKVM counterparts, which return the end of
the range as they do not walk page tables. The other callers of unmap
and wrprotect, in nested.c and at EL2, only looked for an error: they
now check for a negative value, and those that pass the result on turn
it back into 0. The unmap of a shadow stage-2 also drops the guest
stage-2 records of the whole span the walk covered. The TLBI
VMALLS12E1IS handler, kvm_nested_s2_unmap() and the pending unmap of a
recycled shadow stage-2 need no change.

Changes since v2 [3]:
  - One loop for all users of stage2_apply_range(), as Wei-Lin
    suggested. stage2_apply_unmap_range() is gone. Unmap, write-protect,
    flush and the pKVM functions report where they stopped, under their
    existing names. Their other callers, in nested.c and at EL2, are
    adapted to the new return value.
  - The walks go through one helper that kvm_pgtable_walk() shares, so
    they keep its walk_begin() and walk_end() calls. v2 called
    _kvm_pgtable_walk() directly.
  - Measurements repeated with this version (the 6.18.29 backport of
    it). The ones in v2 came from its unmap-only code.

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
[3] https://lore.kernel.org/r/20261110164706.582879-1-haseebashraf091@gmail.com

Tooling: the patch was drafted with AI assistance (SiemensGPT). The
statistics were collected with bpftrace, using kprobes at function entry
and kretprobes at function return.

Testing: the measurements above are from the 6.18.29 backport of this
version, booted on the machine above with Xen as the guest hypervisor.
For pKVM I booted a 6.18.35-based L1 kernel with kvm-arm.mode=protected
(protected hVHE) as a guest of that machine, with and without this
patch, and ran a non-protected 8GB guest. One create and power-off
cycle made 11 pKVM unmap calls: all returned 0 without this patch, all
returned addr + size with this patch. Ballooning the guest made
2097163 calls (4K pages and ten 64MB memslot flushes), all returning
addr + size, with no new dmesg warning and a clean shutdown. That runs
__pkvm_host_unshare_guest() at EL2. Write-protect (dirty logging),
flush and the other EL2 callers have not been run on hardware; for
them I rely on a user-space check of the changed functions on random
48-bit 4K page tables, which gave results identical to the code before
the patch.
