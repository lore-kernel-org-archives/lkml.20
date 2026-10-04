Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD3C3B3C12
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127746; cv=none; b=Ppfzo2C9vh99R364TJ3BHma/t+bAMeCVRFie1fD1qh248r5Ox9o9y4i+wbLhTfI6xBF0evYX3EMlqQhD331wQ94a2snKIxmu02RfYx6XeChdrvxyWuB+GJRTufwZQD1NRt0Lrtp19/idjTSbEZXGriHQINgyWlS+3WdNUiCWWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127746; c=relaxed/simple;
	bh=X6sQTrF5sRJS4FjRxjDb+iu01tlVl/GwIKIQobzsJcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vABiH0qQeiMfTb0ZLyRuhrzt03+hw2ueVi0lCga5cNb6j/BKIExU2JUxa052/2khzkEjgJTKriIcpledbIaZNpydPEbw+4SaWG45qVgFipRVOewtptGJG0QrKmS943P2bHLh3/4TtH8uzqbPuQwmByaN07DTEqDGZlSnbeUJ7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQ2WfDFl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ2WfDFl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso5924995e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791127743; x=1791732543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=da8v9Ff4EAj7a0ycHgkCs+irzmjp0yJ76SMiIUMp9bU=;
        b=sQ2WfDFl+UnNJ3TviQGq1ZVj4X2IPH1YipRbI/LFNB/qMm1rJO3zi+BIFVPJslCWN+
         7uiVGbsx5vcL2E3VsIy7B+stPtuLgEMEY+sR+U8pFgG9EtJziVtm0J/Plcnr4ap5xxoJ
         aP8yZjZXVDLymjB7Dua1+Dvld5Tgp+zDF9Kc8/G0k+Ylf8In59JvKYJSgYK8b+OBSQTk
         BJHKpHkbsEn63liLk7c4SL3mPV2A3CgUry6XcOC2xR/lbelF7cmjO+PgucyeNWy5n/T2
         buTbRFWFz6g++Qsm5ldQ5BYRzPHTxiGK565Zgdo5nLczPV+nm3F7AmwKRSnK34z/dH6Y
         DFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127743; x=1791732543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=da8v9Ff4EAj7a0ycHgkCs+irzmjp0yJ76SMiIUMp9bU=;
        b=iNNBAe3c0g2jxp7fS8stcuwgk2Q5im8/8ZJEWIZ1xLfqQDk9mN80qfEF7nPDgYmRYP
         XSx78QB4Vgwj3IDB31QSA3qBqNK7P45UC5oMamBFK2b+LplcEPPVsczYqimsZdhVb8EM
         8TH01YWXqgZglB4bLqe/NlPHStQ7RpC+NlhHeHdp2tDh3eCxBN6NDMhoWMGZnycJC7zA
         3kEngnnRq1PlJ0I5wnFPN/nabIy3D/k4F2L7Ydt0oF/0DU+p20pTopBgDlmdWDboIkOB
         Dr0YvTr4GIAKkrFvKYcqdFej1Xl0kvwjRtyJNXKPVA/vnltBo5q0u69uek1bKtYFoOXL
         XTBg==
X-Forwarded-Encrypted: i=1; AKwUvBznQ0JhYr3z/ohKSyRS5iu5nRQXIiHqrVD7Cdlz1Oa5I2K3oHgRHHvKKywVcpFIjh/1WV/UVohU9HPnswA=@vger.kernel.org
X-Gm-Message-State: AFuF++lF8/iTqH0bYiuh36/kHDKK3Ir0ylwJiy+3Np6+UGzfRCQ7tc5K
	yqK+2GV78rd9P8teBIIZG19bYdQIPc0MCq+8B6mSrz5/WBGXCFvODAIs5a5M2/7C9WE=
X-Gm-Gg: AYBFou3FPRSItdCwAp+kNlpLY+tIewDQKfMYFe2yo+cqboTEjjQmKu2teopXg4xLINz
	K6DD4ynhMebThxNWAto6ezh4I4EgajBH49tQ4Yj1b+mJV5RM7aUXR67k8uz8+d+ulGQff1EVNbx
	f53p2KYYKi0uZnxnw22nFkLsOM4M5wos5qjJxouu6ytIZIp5BVg9aBlZYrwiwZDiy/m+O+Npp+V
	WruCJeo+GJffACPd4erpwY6QfXr95zKAefAQSJ0R6FxWWYThOBC9Ahpw0wum74xoItjHqqkuXY8
	u27q9M+i4sAQQLUfpaNgm/JEmqJB+3tPcCuSfjok4ws+8nx3XlwYh5VMk92SsF3JCIdKG+kbvaM
	bJOmeTEMfWdXrUwfYYZfU1ltDwu6+IaXrC+V0pX9ii8NuJFuHfvB8Zkoax3S6xRJQN1qv4d/Obs
	y/S46pfkn9afd5sIAJr1yotxzYKMdPiDfprcxqewzOQd+yzDRlJS0rw0YUME+DR4SB99y5i8PpD
	RC125CWGSKq9n/c1uCIp5Yf4G16M6XKZP5Gdt9L6LCK4D9JNIl872MdoTnfgRyUv6134pQOWeQ=
X-Received: by 2002:a05:600c:1552:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-4a02755f84bmr145261655e9.11.1791127743178;
        Sun, 04 Oct 2026 08:29:03 -0700 (PDT)
Received: from citron.bnl.ovh ([2001:861:44c1:870::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1698f7910sm83819735e9.3.2026.10.04.08.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:29:02 -0700 (PDT)
From: Benoit DE RANCOURT <b2rancourt@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Sasha Neftin <sasha.neftin@intel.com>,
	linux-kernel@vger.kernel.org,
	Benoit DE RANCOURT <b2rancourt@gmail.com>
Subject: [PATCH iwl-net 0/2] igc: Fix Tx hangs after NETDEV_TX_BUSY with TSO
Date: Sun,  4 Oct 2026 17:28:38 +0200
Message-ID: <20261004152840.61222-1-b2rancourt@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit db0b124f02ba ("igc: Enhance Qbv scheduling by using first
flag bit"), igc_xmit_frame_ring() requires count + 5 free descriptors,
while the queue is only stopped in advance below DESC_NEEDED =
MAX_SKB_FRAGS + 4. TSO skbs with 16 or 17 fragments then hit
NETDEV_TX_BUSY. That return skips the tail write deferred by
xmit_more, so the queue can stay stopped with descriptors the hardware
never saw, until the Tx watchdog resets the adapter.

Patch 1 aligns DESC_NEEDED with the admission check. Patch 2 writes the
tail before returning NETDEV_TX_BUSY, which remains reachable for skbs
with buffers larger than IGC_MAX_DATA_PER_TXD. Each patch was tested
alone; together they keep the queue stop logic consistent and the
remaining busy path safe.

Setup: CWWK router, Pentium Gold 8505, six I226-V (8086:125c rev 04,
NVM 2017:888d), 7.2.8, default MAX_SKB_FRAGS = 17. Load: CPU saturated
with busy loops, a remote build routed through the port, two SSH bulk
streams in each direction and short TCP bursts, 180 seconds of load
per run observed during a 195-second probe window, TSO enabled on the
egress port. bpftrace probes on igc_xmit_frame, __igc_maybe_stop_tx
and igc_poll recorded NETDEV_TX_BUSY returns, the inferred last tail
write and next_to_clean stalls.

                       runs  Tx timeouts  NETDEV_TX_BUSY  TX_OK returns
  unpatched 7.2.8         3           25           10890       7.3M
  patch 2 only            3            0           10751       9.5M
  patch 1 only            3            0               0       8.8M
  both patches            3            0               0       9.4M
  unpatched, TSO off      1            0               0      21.5M

In all 25 timeout episodes, the stalled queue had pending descriptors
after a NETDEV_TX_BUSY return. The probes inferred at least 214
descriptors beyond the last tail write. For that queue, the hardware
register dump showed TDH = TDT = the next_to_clean value recorded by
the probe.

With both patches applied, no NETDEV_TX_BUSY occurred, so the flush
path of patch 2 was not exercised in that run; its effect is shown by
the patch 2 only runs.

TX_OK returns count igc_xmit_frame() calls returning NETDEV_TX_OK,
excluding NETDEV_TX_BUSY retries. These are software call counts,
not hardware packet counters; with TSO disabled, segmentation occurs
before the driver.

Related code, not addressed in this series and not tested:

- bnxt: commit e8d8c5d80f5e ("bnxt: make sure xmit_more + errors does
  not miss doorbells") rings a pending doorbell on the drop paths. It
  leaves the busy path alone, reasoning that busy can only happen if
  start_xmit races with completions that both enable the queue, in
  which case no kick can be pending; the current code warns "ring busy
  w/ flush pending!" if that assumption breaks. In igc, patch 1
  restores that property for skbs whose buffers each fit in one
  descriptor, and patch 2 covers the remaining case.

- igc drop paths (skb_put_padto() failure in igc_xmit_frame(), out_drop
  in igc_xmit_frame_ring(), the DMA mapping error path of igc_tx_map())
  also return without writing a pending tail, the case bnxt fixed in
  e8d8c5d80f5e and 00eeab0c644a ("bnxt_en: Write doorbell when
  linearizing skb fails"). The queue is not stopped there, so pending
  descriptors are delayed until the next transmit on that queue rather
  than stranded.

- igb, ixgbe, fm10k, i40e, iavf, ice, e1000e and e1000 also defer the
  tail write with xmit_more and return NETDEV_TX_BUSY from their
  admission check without writing it. Their stop thresholds match
  their admission checks, so this should only be reachable for skbs
  needing more descriptors than the stop threshold assumes.

Not done:
- runtime test on a kernel built from this tree; the patches were
  tested on 7.2.8, where the affected code is identical, and apply
  cleanly here;
- launch time (ETF/taprio) and XDP/AF_XDP traffic, which share the
  ring and the wake threshold;
- longer runs and other I226/I225 boards;
- only the igc objects were built with W=1 under allmodconfig, not
  the full tree.

The analysis and the patches were prepared with an LLM-based coding
assistant, which also wrote the bpftrace probes; the results above come
from those probes and the kernel log on real hardware.

Benoit DE RANCOURT (2):
  igc: Fix Tx stop threshold to cover empty frame descriptors
  igc: Flush pending Tx descriptors before returning NETDEV_TX_BUSY

 drivers/net/ethernet/intel/igc/igc.h      | 8 ++++++--
 drivers/net/ethernet/intel/igc/igc_main.c | 6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)


base-commit: a83267db14681b3be481e02a4d5a38177507006c
-- 
2.55.0

