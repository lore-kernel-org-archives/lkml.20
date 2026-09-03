Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482AD50AC3E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470026; cv=none; b=huQgyKDbRMcyTaz56etL8o0CInjXyi8CeAjvaPeXV81E+n5EnRNTdy6/5J+ECKDqUWPcZSJA3Rlv3IdKSWnEnseZpVgwfIKpMGBQHmZvaVXLlyNLhO6IJcxJG5E2s6cZTLni0jgPnAhFnFCujiX/E+LRbFWOHKDtCpauVicRxMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470026; c=relaxed/simple;
	bh=b0/HSCJZuEl0PGtn9azoPzkS0dWwxnYHqdvEixO/txA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mo7TVSeVRTJzi2Jl+NbH3Yq7TUlCyCf3hlpeK/6u8B3hvbsKhlZw+qTbs7fzJDY3YTOz29LdpI6G3HlgRQC2kre7CDlzrZ5FJr7Mnmc3JXuXDQCWn1AbNyuCwrOe8HA9qpxzc6JuIFWFMqh+l5w7evH9hW4y1jnITD3Ro5Vzv8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwXtRlJz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwXtRlJz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso273599a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788470020; x=1789074820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEtsy+Nj496tWyceVNXPO2QTuND+7hvS8GahA09Q5S0=;
        b=rwXtRlJzrk7DrNzUN5tfH/9eOKUU1xx62/i3MLPpqSYw7ddJEm3HxcJb1EavrwGVtq
         cmeh1Dl4QDUjVrOSr+KWDlrZyC+bdWdOEwZ3gb8230eQ6RJJi9PCJM3r4P+4iZ9B/BN+
         ypl2iWV0FO4OEs+a45o++xhF+aEhDo6b4KTSRoUyaXPkrEoG1vBQrtyJ90wnQ36Mgq4S
         tGi+9mGaMumXklppqfUIDCQP3/6PMAz1JFYh1s/Zc0SwHdnQGqcXf26UFDwXWEb69uTt
         wjCoty/hSl6CHvi1bM9l65nBtTak3aY6bs1XSJM6ICcfR59a/EpfGgsgy0UbYBRl+/eT
         O96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470020; x=1789074820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEtsy+Nj496tWyceVNXPO2QTuND+7hvS8GahA09Q5S0=;
        b=o2TOBxPhmkog22tNLHQQQiy0Ph/J5tillrZn/D9joythqqEuMOcUc+uHZJ7+85SRhv
         MO7ixeATboaUf7QVlms+uGR8xGSerAQLbXEjhU6MFkpnS86QquVZmvX1PJJJPjwkAILg
         OTF0x0ipxWYJBePY2e2LBJRpF0Mt1aodCOneslGvGbRz13Ir/M6GWEK9yes+FopvKbKL
         AbViaTIK9vCyTGc3MFouyijc0pHmr+aELbsL3oEdJbswDuY8P62XYyUrGaJeJNt5ImqK
         QnccuBmpd6txXqZRJq+vHxrJ8mUL+SSJz32LaKp/yZooS7+Hm4j0BkOLeCtu8QGLY393
         ARzg==
X-Forwarded-Encrypted: i=1; AKwUvBxkbDhRCc5evzZYamuZynAI6gliGobxa3qUCpSG69shTdPTF2deZPc4LV4JrJIqrSZNAhfkahBfpy3fcww=@vger.kernel.org
X-Gm-Message-State: AFuF++nv+M6IL3No6KleNDDYmK1KXv3TJmpJl22ImW2o/Ssh1Sp0H2oz
	HVQkFMZ6BxPfppJETY7hTw7zb4ucIyuKqQG6MwsqV7x2Io3p2DyywN4=
X-Gm-Gg: AYBFou2R0N0GpZNEAw36QRbGRwBf7MPgnfzDKfwkF+Res9+U+mKxM28ekZnJZ/kKjbz
	BIPBX5CHIUaraqxQEDHe5xv/9MkDhZ1CI2XyT+OC/7VU5VgVnx+JrKXVOp7zzh8a9iTyJtc6aGh
	H1Z42y905io+6AAX4g7+m7xa1fP52g/ltEplXdHfsEaqM8ErQ+9HHOilgH0arHQRwsx5KDYR5pY
	3M8mERQTiyyl1KBBKFGt6HahZzTQVwW4x6Z/lv6/4BnULhfgRhakY3nlDbkENwwRM1c+mW2Znvz
	s/UJcPEORrkq5P/luBlR3ecbkD8MqNm8mXb6nmx61NqMokrY9hsNWF81LZKk8VSA3adIv6R5Pk5
	s3V0U0iQVOj+2jjFrucu96bGgfw4dDNywGaTCAvyu5NAVYPHUeGi6piuwReROR/u8d9NqY90Fpq
	td6hGvbIqoDXEPqQ2WPtKulaWyEZbZBkMj1YXF5PfO4Lbw877D6bswSRfu7O7Uow==
X-Received: by 2002:a05:6402:11ce:b0:6a6:32f9:d7cf with SMTP id 4fb4d7f45d1cf-6a7e90bd161mr434390a12.20.1788470019849;
        Thu, 03 Sep 2026 14:13:39 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm255242a12.7.2026.09.03.14.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:13:39 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Wei Wang <weiwan@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: yield the CPU on every exit of the threaded NAPI poll loop
Date: Fri,  4 Sep 2026 00:12:53 +0100
Message-ID: <20260903231253.292576-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902154836.19a497e5@kernel.org>
References: <20260902154836.19a497e5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Rebase your OOT patches on latest and test the tree you're targeting
> or keep this patch in your downstream kernel as well.

I could not produce a repro on the target tree, and the reason turns out
to matter more than my board being out of tree.

Since v7.0 the non-preempting models are gated:

  kernel/Kconfig.preempt
    config PREEMPT_NONE       depends on ARCH_NO_PREEMPT
    config PREEMPT_VOLUNTARY  depends on !ARCH_HAS_PREEMPT_LAZY

  kernel/sched/core.c, sched_dynamic_mode()
    "none" and "voluntary" are compiled out under
    !(PREEMPT_RT || ARCH_HAS_PREEMPT_LAZY)

ARCH_NO_PREEMPT is selected by m68k, hexagon and alpha only, and
ARCH_HAS_PREEMPT_LAZY by x86, arm64, powerpc, s390, riscv and loongarch.
So on those six there is no way to build a kernel, or boot one, in which
cond_resched() is anything but a nop. I checked it on an x86 guest built
from net/main: the set offered by /sys/kernel/debug/sched/preempt is
"full (lazy)", and none and voluntary are not in it.

This patch therefore does nothing on those six, and I should have said
that in v2 instead of describing PREEMPT_NONE and PREEMPT_VOLUNTARY as
what is left. What is left is PREEMPT_VOLUNTARY on arc, arm, csky,
microblaze, mips, nios2, openrisc, parisc, sh, sparc and xtensa,
PREEMPT_NONE on the three above, and 6.18 and earlier everywhere, which
is what the affected devices run and where the Fixes tag applies.

Since every number in v2 came from PREEMPT_NONE, which those
architectures can no longer select, I measured VOLUNTARY as well. Same
board, 6.18 where it is still selectable, untainted, no out-of-tree
module, 30 minute runs, the two halves differing only in this patch:

                          before        after
  mean                    13.38 s       0.19 s
  worst                  135.95 s       0.51 s
  over 1 s              10 of 55      0 of 89
  RCU stalls, classic          12            0
  RCU stalls, expedited        20            0
  packet rate           80312 p/s    81532 p/s

add, mtu and a no-op netlink call stayed at 0.01-0.41 s throughout both
halves, so the delay is the grace period and not rtnl or scheduling. The
splat names the model itself:

  rcu: INFO: rcu_sched self-detected stall on CPU
  rcu:  0-....: (5999 ticks this GP) ... (t=6001 jiffies g=861 q=830)
  CPU: 0 PID: 200 Comm: napi/qdma_eth-0 Not tainted 6.18.44 #0 VOLUNTARY

For completeness, I did try to reproduce it on net/main in a VM, with
threaded NAPI on a veth pair and the ARCH_HAS_PREEMPT_LAZY select
dropped from arch/x86/Kconfig so that voluntary preemption was
reachable at all. The worst "ip link del" went to 0.19 s against 0.01 s
at rest, but never to a stall: below the band the thread sleeps between
batches, above it repoll stays set and the existing cond_resched() runs.
I could not hold it in between, so I am not offering that as a
reproduction.

So this fixes the architectures that still have a non-preempting model,
and the stable kernels, but not the tree it is posted against. If that
makes it not worth carrying in net, say so and I will keep it
downstream. If it is worth carrying, I will send a v3 with the numbers
above in the commit message.
