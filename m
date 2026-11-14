Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694533;
	b=YluI31Vd3YXuJ0MXxfywCz6mq4fB5rYZgNy8U9wuJ09SZwtC7P8qz+qz/4kPLCt8a1H8
	 arS6AGU+WkNy4hEMjNYNjiIqLwekC+UikkIkqjZadwfZsnw3jhvTzAwttBCi0dIFwcGJ9
	 ZFXiBTMiNDzY3/xecrFInU4/tr32wnkBuKWn8on0KGTKBim8pUgQELg48aGX13lAkyGnU
	 10TS8cXGQ6NjGs9OaC7wxGpGkeA8QpSM4lKfQtkKmlnwQe7n1adU+sN1yRAQZ+b2j+CuK
	 ZXtSm5o+3NjgALZH/irB5EUi8B3vT4cAIhVNh0LVCOGmoXPl8Gw6/nr4AS3yLjNKZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LY7eD84jpNGnFeoeMGuVlBCAW3DX6pueb3GVbU+lSFc=;
	b=ero6L856PQ8FkX4q5/TUa4Z9xxf4VP1jbOtfPFzhRrjDHXu42fPsb+XOI38f71X8eHJL
	 8LaF+usmDUsvQIHkIkjjefQRVRUCHBj90f5P4hPxJs5Aud5dA32J+/TUMRcvUe8LSV/u6
	 sgs7XdSabyJZAIcS+zVlxLbuCE6l/ccaXc3xUsUF+llcwu047WeKcTwDrJVMEY7xVOFjJ
	 dN8t+w1mXU7ekRcu9Xtn/D3Kpz09xi0uYESqNL+MknTbqFG+TdW0rEsnzp0Nzg0K6BOM3
	 X2nTcyK1tid/XtKo/xhSx/vf5DDw1Rpw8xKZgcV5BaFVbGPT7DDNBaKwcvWegZYPJow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIUgpIcB;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F02606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F02606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIUgpIcB
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490f38e9688so1460223f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694531; x=1795299331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LY7eD84jpNGnFeoeMGuVlBCAW3DX6pueb3GVbU+lSFc=;
        b=bIUgpIcBjIUBAC3uRiK9ymS3TlnITIof7oCzsH9wDiUZdq3RIbgjQe8L+pJu0Qq9PN
         1FW2rWyEuatqc0Pr9g8ezsjyXEeTK61iL9QPG2ia96kYG+z0dQIk7J0PZkZaeGqYNq1c
         iaIuLsr8Eq3NiXkiEhbbPk5rMg5In8xQypAaK/EWxPLSKsqFDdV/loQvPArd5PgxfacB
         G6dtMYAILXeIxB0fO0VOGU2JSifcbvnKgx/lQk29IMOuvFN8+FOWFeSBQaf6iH8kWtOG
         mU2Xi9b7h/xakcGjREiWlFwfTPObvLY0InDfWvYpWo9K7YcLG333qY306+3o203CMXmx
         AQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694531; x=1795299331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY7eD84jpNGnFeoeMGuVlBCAW3DX6pueb3GVbU+lSFc=;
        b=FIiqhpiApjXTSEZDa6+fDJu0dsGQ/TyT6eUEOnEtMkXTRNDldIBy0JzM9OZ4todZ1y
         snR9CMpTB8SgEIoMN1F86fbsVfFUuHVe4H0zypVJHYTT6H/VRu6ravDJMS5TB758VxNV
         EMJJ8nuspyBtsm6184obP0x/ig6X/o1pFSwVsdfaNPpXmfqKlm5//WKq6BQbkNF1wZWv
         52Wj8PeJ9shrs2KHLFc+iSdvpOWB5kwqJD9m0s7jyUiylnbsBGs/8nZXYPXfetDlyGHZ
         hczsgm2HjG4QDflcO+AnE/kZzZOECEL0gDlCkwMtCLm5yCQrRy8tEOQNee62aAdN+RRG
         1X0A==
X-Forwarded-Encrypted: i=1; AL+hErHF3UU53pA0uCSTeITP/x6V880fqdAPrG3Sxpe0oYJM4MGLLaffZ5HbE3KFVZxBm0kXQYA/VA3xI8T10FE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qng8iooXighfKlawNnAGao9BSOU3ShRE7OxISN746IELgPuyi
	F85FKnMb/ZS06VKkGxRn61NnSt1qiJN1OTEzthLk8JOZWFMhvsnyrIkV
X-Gm-Gg: AYBFou3Wd0982LF2tDT0F+Bqcmoe0PlmbqJngphyrBD9tAcIBcyD7Rp+cLAQgcNtTEu
	Ej5krhnSYPwxp8/4ACiMuBrF8hoMydYOD7g4r2WBmwshzKJEoiNcN6legE3pTSvtXtpAz/Ro4V8
	wCn+mgpNOtvRuE2C0EtVAFAVPr/S/fWY0yM6EFV/35VVKD5B8IZYOpa27odLaXk9BCwR0+LkXPQ
	csgW7qwCrRzh59qf51MLP3L/06ktk+Uhskgx0xTdYj9IFTWLsP+Cq0zQCYKwQp7qHP+5NN7ThMM
	QujfWLpg7UBglZGunsYxTZJR4aFWxjgYDx7ZPLeqofd9rEvaWxxp/+AVqvA7lbn2LEZriFggm8Z
	7rfGGlx+ujhJL31N7EJAKedktenQMShAwm1kAc2ksSVbZ5z9zDpt9bs6YD03TSBY28B5RppgMwM
	sbUJB+8uYuwmmRjJA8ZeJdZU1blq5pE1EQ8aZAITjjPOZdFxetqr2B46f8W9/tv0EeREiBiCC6C
	eHxHYlZ+SE+8QmkSjt5Iaj4ru3EuEfflkcH19iu590/mzRDWzyhLaL/4E99E6a6VkgGpASCdiL+
	JzEihpRjkeXeCwtI29FD4e0=
X-Received: by 2002:a05:6000:383:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-49b023a7e61mr22572636f8f.16.1794694530775;
        Sat, 14 Nov 2026 14:15:30 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:30 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 0/8] vxlan: vnifilter: bound a single request and account per-VNI memory
Date: Sun, 15 Nov 2026 01:14:04 +0300
Message-ID: <20261114221412.255825-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The VNI filter interface accepts a VNI range with no bound on either
endpoint or on how many VNIs one message may ask for, and the memory it
allocates per VNI is not charged to the caller's cgroup. Charging it
makes adding a VNI, or changing its remote, fail routinely at a cgroup
limit, which exposes two error paths that leave configuration state
inconsistent; patches 5 and 6 fix those first.

  1: range-validate both endpoints to the 24-bit VNI space.
  2: end a dumped run, and a dumped message, at the request limit.
  3: cap one request at 4096 VNIs, summed over its entries.
  4: charge the per-VNI node and its stats to the caller's cgroup.
  5: leave an FDB entry's state and flags unchanged when an update fails.
  6: roll back a VNI add that fails.
  7: charge the VNI's default FDB entry to the caller's cgroup.
  8: selftests.

uAPI changes:

  - a VNI at or above 2^24, previously accepted and stored (and
    truncated on the wire), is rejected with -ERANGE;
  - a request asking to add or delete more than 4096 VNIs, summed over
    its entries, is rejected with -EINVAL; "bridge vni add dev X vni
    1-10000" used to be accepted;
  - "bridge vni show" splits a contiguous run longer than 4096 into
    several entries, and across several messages; the set of VNIs it
    reports is unchanged;
  - a VNI add that fails no longer leaves the VNI installed or sends
    RTM_NEWTUNNEL for it;
  - an FDB update that fails, including an RTM_NEWNEIGH, no longer
    leaves the entry's state and flags changed;
  - in a cgroup at its memory limit, adding a VNI, or adding or
    changing a VNI's remote (RTM_NEWTUNNEL), fails with -ENOMEM instead
    of charging past the limit; like any GFP_KERNEL_ACCOUNT allocation,
    the per-VNI node can first invoke the cgroup's OOM killer. A new
    remote may instead be installed without its per-CPU dst cache, whose
    allocation failing is not fatal, as before.

Patches 5 and 6 fix error paths that predate the series, and carry Fixes
tags. Neither is a memory-safety issue; both leave configuration state
inconsistent. They ride here because patch 7 makes those failures
routine at a cgroup limit, and for the earlier rollback posting Jakub
suggested net-next [1]; either can be split out to net if a maintainer
prefers. The group-join failure that patch 6 fixes is deterministic at
the default net.ipv4.igmp_max_memberships (20): the VNI stays published
and notified although it never joined its group, and a retry returns 0
without joining it. The rest of the series carries no Fixes tags. The
request cap is hardening, and Jakub asked for it to target net-next
without one [2]; of the earlier range-only patch he said it was either a
security fix needing a stronger check or something making things
slightly better that did not deserve Fixes or stable [3].

[1] https://lore.kernel.org/netdev/20260915174836.464fae55@kernel.org/
[2] https://lore.kernel.org/netdev/20260914173103.539d8838@kernel.org/
[3] https://lore.kernel.org/netdev/20260905123900.23984eda@kernel.org/

Not addressed here:

  - the device-wide default-remote change (RTM_NEWLINK) reaches the
    same per-VNI FDB entries outside the request cap, and patch 7
    force-charges them rather than hard-bounding them. Its error unwind
    re-adds old entries without checking the result, so bounding the
    walk first needs that unwind fixed;
  - vxlan_vni_add_del() still leaves the earlier VNIs of a range
    installed if a later one fails; the cap bounds that to fewer than
    4096 VNIs;
  - changing the group of an existing VNI records the new group before
    joining it, so a join that fails there leaves the VNI with no
    membership, and a retry returns 0;
  - RTM_NEWNEIGH with NLM_F_APPEND on the all-zeros or a multicast MAC
    adds a remote per request with plain GFP_ATOMIC, uncharged and not
    counted against maxaddress; accounting it is planned as a follow-up,
    building on the gfp plumbing of patch 7;
  - in QEMU (production builds, 2 and 8 vCPU), adding VNIs with remotes
    up to a 32 or 128 MiB limit left 73 to 100 bytes per VNI uncharged,
    5 to 11% of what was charged: the rhashtable bucket arrays behind
    the VNI and FDB hashes, and the per-object metadata memcg keeps for
    every accounted slab object;
  - an entry carrying END without START is read as [0, END]; whether it
    should be is left open.

Tool use: AI coding and review tools were used for code analysis, patch
preparation, review and test development. The changes were validated
with QEMU reproductions, fault injection, the kernel selftests, KASAN,
KCSAN and lockdep builds, and per-commit builds.

Changes since v4:

  - v4 patch 1 was applied as commit 599d0e97610f; these are the rest.
  - new patches 5 and 6, with Fixes tags, ordered before patch 7, which
    makes their failures routine at a cgroup limit (review of v4). Patch
    6 supersedes the separately posted rollback series.
  - patch 1 states its dependency on commit 599d0e97610f (Paolo).
  - patch 7: the vxlan_changelink() rollback keeps plain GFP_ATOMIC,
    like the call it reverses; the changelog no longer claims a clean
    failure on its own (review of v4), and says a remote can be
    installed without its dst cache at the limit.
  - patches 2 and 3: the VXLAN_VNI_FILTER_MSG_MAX comment says what the
    dump does and names vxlan_vnifilter_check_msg(); patches name each
    other by subject (review of v4).
  - patches 1, 3 and 7 say how each gap was found and what it did in
    QEMU (sinfo bot).
  - patch 8: absence probes fail when "bridge vni show" fails; the dump
    is checked against the literal split; START-only and END-only
    out-of-range cases; rollback cases driven by maxaddress and the IGMP
    membership limit (review of v4).
  - patch 8: a refused replace of a VNI's permanent default entry must
    leave it permanent through an ageing pass.
  - lines wrapped to 80 columns; rebased onto net-next, which now has
    commit 7308ef8b4a67 ("vxlan: Stop rejecting dynamic FDB entries with
    a nexthop ID"); it removed a check next to patch 5's change.
  - the Assisted-by trailers are dropped; tool use is described above
    instead, following commit 1e035297ffda ("docs: remove Assisted-by
    references").

v4: https://lore.kernel.org/netdev/20261014123814.388557-1-alishmery18@gmail.com/
Superseded rollback posting:
https://lore.kernel.org/netdev/20260911215203.3054653-1-alishmery18@gmail.com/

Ali Firas (8):
  vxlan: vnifilter: reject VNIs outside the 24-bit space
  vxlan: vnifilter: clamp the dumped VNI range to the request limit
  vxlan: vnifilter: bound the number of VNIs one request may touch
  vxlan: vnifilter: account per-VNI memory to memcg
  vxlan: leave FDB state and flags unchanged when an update fails
  vxlan: vnifilter: roll back a VNI add that fails
  vxlan: vnifilter: account the default FDB entry to memcg
  selftests: net: test the vxlan vnifilter request limit and dump replay

 drivers/net/vxlan/vxlan_core.c                |  87 ++++---
 drivers/net/vxlan/vxlan_private.h             |   7 +-
 drivers/net/vxlan/vxlan_vnifilter.c           | 192 +++++++++++---
 .../selftests/net/test_vxlan_vnifiltering.sh  | 246 +++++++++++++++++-
 4 files changed, 461 insertions(+), 71 deletions(-)


base-commit: fa5196392691051963726787944db872420dfa75
-- 
2.53.0

