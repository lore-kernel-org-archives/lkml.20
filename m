Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D219A439F95
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493403; cv=none; b=Fuydo7gJJgoN4xLl4Th9CVRkmarPXqvI69ZCotKYW3dcQmGZDDdjn9dTZr2n/Ayp9t7SJJcliRX5wiUS5h23S6cOcEuMTyFzyOLSLqF4InREW0oJQkTRCgIiA5Z3ApyF/GW2NGzZV+2lqmiAU6KeyHVA0CABtS/tRSEROLQDz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493403; c=relaxed/simple;
	bh=uEkT7bvpoCXxFRYilwrMqw4m/avYlKD/tw+E4y7qkfI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I5h7Ta3WEenRSsF9sC4CU/+N1kQWS16GBx92GAm1fxiI8pXNL6A5pjYTx6oF1id/eReBf+G1Ec0ju6VSULDUtk6UfZMISXZnJvEZpoubV8ZyyFEhwLZReZ0hIeTTTjr0feGA1OFm7rqglokYWIzwqwHfFfYWgKRIHL19Q3p+aQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=G0EVHt7P; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="G0EVHt7P"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53397554beaso55636101cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791493397; x=1792098197; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=veWMGuSVswTQSpRQuCY1UJnPdK7Vk9Kj0h3fikv2+bk=;
        b=G0EVHt7PaFfibpImQtM811k5wCK8pdtsUiTp4n2TtUXN8PxQwBxEfpuZ5IhQHAGrxA
         EiQVkFy/WA0XW4DJk8YPs//s6ARNj3dCZlXpmK2bfo9AVQiCwobbGfrS6CdqkKb8prkA
         4bk9JOUpgx+V/jqctFE19WdDyViX/7KVl/jczZRaBaMcbxpkQgbO1iLdQ1XF3/H0jcPm
         Gxp7sxL9sXV6kGLW+QPQWhUnakYLpDuEwWBdk2Pw9P4JyxSwJoPBzjm0B+rKfIZ7u9o7
         zRqznCIR98suqKgWV45ab7EtgMrksgbRz6wKfT5oVDz9MrRCPMk90bNHL2nsWknMok+K
         GdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493397; x=1792098197;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=veWMGuSVswTQSpRQuCY1UJnPdK7Vk9Kj0h3fikv2+bk=;
        b=MZ4yxquzFVX+SBJGASfg5fOEgudL9GeBpdZMUnM/QKJsVP654L/FQhBIWPIbLEv777
         mf1PIARryBYKzo45h7d8qlphjUGcN0kUpCnQiLoo49NhJsR+v3xxqkLInH7toHamxtcn
         kHvpRACsoX7mQRptzGlN1VKUmbVYZkNQ9+f3k6Zz2mGr9HVmGW0FYRfGIZR9XBSr3msy
         hLLBKXDPYTOavkJuiYyihgaAIFezOodtANhcB7/2qyma+NwezbOyEUqBJ98zav4GFGje
         Su2B3exdI5f/+yzWIfbgcYOpPnzgLNHkkrEx6+lVEgujk+lBWlNHTcCPnZQwIZ452Jo3
         +TrA==
X-Forwarded-Encrypted: i=1; AKwUvBwXoKMoKhNEoDNnybXMi7nbREPRumjW94Yc2fWXVGTrjJka8v74yHX6OUbZS41Bm1pMUgCF7QXEkn42Y0M=@vger.kernel.org
X-Gm-Message-State: AFuF++n3vnNFJGCYNLhRmEO+pAoW1+LV1yu0kU6aRmB2uCdt6o0lDlyT
	JFNW711coWoA0jcuFFjCMsO0A7tz3lmKxgnTBm33EEhk7XmvuAiyprQX5iI0LC58Www=
X-Gm-Gg: AYBFou00Rwywq8gNhXjr4RYGWxQ3NLj0TWeQ4ixw90qH5j2eEm0ahFieERMdIfNKnlU
	ZfYc8Hi41y992dagnrNyj9OdhOfFJ8yz1wzFNM2w1awYvVafL+jhW7xwa4iKPSjjgy1sW/Qd75s
	mahK7p18ZRCJm8bt608pFh4TKAkTAA6emBeZTuddY4XsQ1xnqdf6PctDZNmojNJhlL85ELES3LL
	iDz1/QYeuehqFoxnhTa/SVq2+ozOF8WIrwmpF3Z88UsfEwet0apk4MJELo6Pce63qIOz1oMRAR9
	qf1smlbmBMg35ayzz2VDoN/JEaYz4KuZYYVyOBSsCQ39sW3qBUh+MjraDCB1qZkkRJeRULsaeJ5
	4vvzSAJxRXKPNDB0fK/5vebBUvXWUyKZqLy7MWDx9j5A28vIWEaiXdukSrH9Kk2aXdrFqrV1zJT
	BSV8qah1X3J79Gikvc7xzpPxKJbE3Es75NyyeiytipLVjupLcmweiTcdRWMwP77jNr67MXq/irt
	hyRKQKgqi1HuuQ=
X-Received: by 2002:a05:622a:1f1b:b0:535:70b3:aa38 with SMTP id d75a77b69052e-5357573e670mr108763961cf.74.1791493396306;
        Thu, 08 Oct 2026 14:03:16 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7dd1a0sm3101431cf.27.2026.10.08.14.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:03:15 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH net-next v2 00/10] net: stop calling __pskb_pull_tail()
 from drivers
Date: Thu, 08 Oct 2026 21:02:47 +0000
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkEyGoC/32OwW6DMBBEfyXac7exLQqip/5HlYPXrMMmxFi2g
 4gi/j1Ae6x6nNmdmfeEzEk4w+fhCYknyTKGVZi3A7jehjOjdKsGo0ytlaqRKoz5Shjvw4DFyoB
 dkolTRu8rT6atK9YW1nxM7GXeu78hcMHAc4HTzyXf6cKubNXbL9nMSMkG12/WEI9UHXfz77Et0
 0suY3rs6JPeV34pm38oJ40K2w9tSHlqm4a+yjiLizZ09t2NNzgty/IC68Wn+BcBAAA=
X-Change-ID: 20261006-b4-pskb-pull-tail-drivers-ff4fb2964e1a
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493384; l=4998;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=uEkT7bvpoCXxFRYilwrMqw4m/avYlKD/tw+E4y7qkfI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCXCcPzYE6MckGlWvZs5GlcBhgvsQUwMKctcIvHVU60iM6MoRF4p5/Zxb/dlkHyUCxdBM8d4+e7
 75wiNZDfujgQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

v1: https://lore.kernel.org/all/20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com/

v1->v2:
- New 1/10: skb_drop_empty_frags(). xen-netfront, netxen and qlcnic
  relied on __pskb_pull_tail() releasing zero-length frags even when
  there's nothing to pull, which pskb_may_pull() doesn't do (Sashiko).
- xen-netfront, netxen, qlcnic: call skb_drop_empty_frags() after
  pskb_may_pull().
- skb_drop_empty_frags() checked with a boot-time test under KASAN and
  kmemleak, on cloned and uncloned skbs.

--- Original email (v1) ---

__pskb_pull_tail() is the slow path behind pskb_may_pull() and
__skb_linearize(), and drivers shouldn't be calling it directly.  It
takes the number of bytes to pull relative to the current head and does
no bounds checking on it.  Ask for more than the skb holds and it BUG()s
in skb_copy_bits().  Ask for a negative amount, which is what a caller
computing "len - skb_headlen(skb)" gets once the head is already long
enough, and skb_copy_bits() is handed a length of nearly 4GB to copy
into the head.  Under KASAN that shows up as an out-of-bounds read of
size 4294967288, after which __pskb_pull_tail() returns success with the
skb's head and paged lengths no longer matching its frags.

It also returns NULL on failure with nothing making the caller look at
it.  Eight network drivers call it directly and four of them don't
check.  All four are RX paths where a failed pull is followed by
eth_type_trans() or skb_pull(), which BUG() in __skb_pull() once the
head is shorter than what they pull.  As far as I can tell none of the
four can fail today, since the skb is fresh, isn't shared and has room
in the head, but that only holds because of how each driver happens to
allocate.

pskb_may_pull() and __skb_linearize() take the length the head should
end up with, check it against skb->len and fail cleanly, which is what
every one of these callers wants.  Convert all eight drivers to them,
check the result, and drop the packet on failure.

The last patch makes skb_condense() check its pull as well.  It can't
fail there today, but it would undercount truesize if it ever did.

The callers left in aoe and xen-netfront are fixed separately, through
the block and net trees:

  https://lore.kernel.org/r/20261007-b4-aoe-short-packets-v1-1-db5155f7bb9c@toxicpanda.com
  https://lore.kernel.org/r/20261007-b4-xen-netfront-short-head-v1-1-12d7113a7e4e@toxicpanda.com

Once those are in I'd like to stop exporting __pskb_pull_tail() so new
drivers can't pick it up.

Testing: every touched file builds with W=1 on x86_64 allmodconfig
(ftmac100 on i386, it's 32-bit only).  e1000e under QEMU, which hits
the converted TSO workaround on every TSO packet, passes TCP traffic
between two emulated 82574Ls, and with failslab failing 5% of atomic
allocations the failed pulls drop the packet and nothing falls over.
The same setup with jumbo frames and copybreak off makes
skb_condense() pull frag data into the head tens of thousands of times
a run.  xen-netfront ran as a Xen HVM guest under QEMU's KVM Xen
emulation, with the backend changed to spread frames over 18 and 19 RX
slots, which takes the converted pull in xennet_fill_frags() and its
overflow path.  The other drivers are compile tested only.

Thanks,
Josef

---
Changes in v2:
- Link to v1: https://patch.msgid.link/20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com

---
Josef Bacik (10):
      net: skbuff: add skb_drop_empty_frags()
      net: ftmac100: check for failure when pulling in the RX header
      net/mlx5e: check for failure when pulling the Ethernet header after XDP
      net: niu: check for failure when pulling in the RX header
      xen/netfront: check for failure when pulling in xennet_fill_frags()
      e1000: use pskb_may_pull() in the 82544 TSO workaround
      e1000e: use pskb_may_pull() in the 82571/2/3 TSO workaround
      netxen: use pskb_may_pull() to pull excess TX frags into the head
      qlcnic: use pskb_may_pull() to pull excess TX frags into the head
      net: skbuff: don't reset truesize in skb_condense() if the pull fails

 drivers/net/ethernet/faraday/ftmac100.c            | 10 ++++-
 drivers/net/ethernet/intel/e1000/e1000_main.c      |  5 +--
 drivers/net/ethernet/intel/e1000e/netdev.c         |  4 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c    |  9 +++--
 .../net/ethernet/qlogic/netxen/netxen_nic_main.c   |  3 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c     |  3 +-
 drivers/net/ethernet/sun/niu.c                     |  6 ++-
 drivers/net/xen-netfront.c                         | 26 +++++++------
 include/linux/skbuff.h                             |  1 +
 net/core/skbuff.c                                  | 43 +++++++++++++++++++++-
 10 files changed, 84 insertions(+), 26 deletions(-)
---
base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
change-id: 20261006-b4-pskb-pull-tail-drivers-ff4fb2964e1a

