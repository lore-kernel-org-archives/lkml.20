Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046443C5DA6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615900; cv=none; b=tTmIcyYAXCw6g5f7BLMR1n31sCb5WlTpm/S4TltYef96XY8Cql6kHNEYe7sjL+xQLmUT5eLEzdRJy9KtTYifeux0e8Myyjz8kSZBL9V9c2a2glJAb9e4SmCbTPRAd+f4RGa8YwgLxeV/AppMOmbmZpobG8KNANN/CAcfqMas/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615900; c=relaxed/simple;
	bh=0V7HIKjzuBJPAXA7qD59Iv+diAc+01mso8VLfDKT7l8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckJHgX07+TKhTDxLluTCHca69BYc6YFy5hWfPyyofO12TA0UKKIQ8cPHg3/RIOD0mHygw1KKicZAIrFYy0QO/oM1S4Xk6xp/93V+GEb1+OuddjSbA5DdlwaBQUyVCIVjosYSxmQ+s1CKflTsn67TrOkzGt4hw0MGT9PWw0VSk4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/ellKJX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/ellKJX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1918756a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790615896; x=1791220696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KelzspkcKUMw6RhGKxYOinGRydrfkw9m6HM7mkwRVGg=;
        b=T/ellKJXS4vLApXY7fTa61xAFmrdFzMBzIjm77x0ofWnfMTxJ+BBfJH628cMAnT/5a
         DGd2movi1UPRasG5ipAcwKRUpi1OB5iB4XZX34CY6eIpyCIIKCWpaH+cQFrctnCljFeO
         AUJWv3H+t/Z7fsheBLIMq2dQhYZORdtEYRmIYk6XE9OhtoHbKfT0+M6R40Yk4SfUfxKo
         96oCvxT6YcalrQr3jcEYUUuKziy8pUrPPsc9Rl46pXB1fsju56aFvVLOAAeL5P65HZRA
         u38AtbWNmrpfQDZ3qMESYqPCpZK1jz92eOHjORrEoNpu8o6lutJ5Jgvl8zPTyLdYJLxt
         pbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615896; x=1791220696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KelzspkcKUMw6RhGKxYOinGRydrfkw9m6HM7mkwRVGg=;
        b=thPSufEYnCW7bGwphw5Rfk20izZ35dcybWUNls3EPAxgWvyFB5D+nl9ykw7logjbo4
         qZa6d3oONlKHaNOLcF2VYQsBX1/b4spV37bYPyMcrj4GfN1UsN8Nz8wIjOJKp+O66s5g
         jgYMienzoPY6Q/hpCo8rCXLtiIpqux3x4IcOk41XEs8r2lwhmuzNyr++gZ9MR8hOxr5t
         QB2Hd7R7MiwFD+Tf4969lnMxlc4XX0A0Fyk2z9s+8WX4zV3PIjFsiqF3a7OpsGTZ8Lsl
         eLh1jOxMv8vMu9TtzvSolyMG690dKA+C7VhRvUHjwkF0mPxA3fUjE7Y/Y4cZVZK3a3ke
         GoDA==
X-Forwarded-Encrypted: i=1; AKwUvBwWCLqEN0/a/DB3b+zmMLp77ItypHP7Mb1OzFAWs9mGNd7wO2949AJLeYsgpd1MIJLwvBNZ2jF32rp5Q4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxsAtDbANGIHaIaTHmb7Uzrr77+CHZ2zOeICFOIzQhZOPnSIu8
	pLV+3HZ10eYYFVS62Fy1QaV+ZiWWMryAmSMXn8aE9M14Guojk0zz9fQA
X-Gm-Gg: AYBFou1zZDwoJbIhDskE8dUUYqW6dxOFu2eLCebIVBOgm6kfY91Whlt0XgOXdlYbbDs
	FwyBmownNixah1JJM4umiMDm6ocKqGww40phfFJ1tgI587qhJxmTpvZI111Gar8AEHmlLZf+FHr
	zP83RzOrR0MuAt3xd6jNPxlSWRGX8IZ5YfHr3yC07xtt4GAxJQ4yZnJS0f/ILCKzbPXTxg58pcY
	gpMUW1lsUovqhcvDLJWenzP8AOsspR6MhnNC9Js9uf4KwE29sxhXlsw+lBMF2FZ2d0265+afpSH
	TRnMMLrGbH/WslsAUvMSj84myXrN4PZc2dAKQvDPIj+uyY031VeUjVT6ptv9f0GPkPSvWXgXYDB
	sn/ymRuuQ0q8lhTApKXW3rG9S6Ind5BOhi19TnmoMBk156h7SSWalIwsma9p32xSzlCdLNp5P55
	8A3XunuYewfsYZ6NfyYwodj8KFOU0N/SoH3BjNAUR128dZg1/++qZr4sMQCDZ6Xf9vrEgWDlmW6
	4PMnBmuziWhQvS4gkot7pps
X-Received: by 2002:a17:90b:5848:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3a098b3c2f0mr11268295a91.27.1790615895911;
        Mon, 28 Sep 2026 10:18:15 -0700 (PDT)
Received: from localhost.localdomain ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986bb8f6sm189139a91.0.2026.09.28.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:10 -0700 (PDT)
From: Dongliang Qin <cccccccccccc777777@gmail.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Dongliang Qin <cccccccccccc777777@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bob Pearson <rpearsonhpe@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] RDMA/rxe: Fix MW/MR lifetime races
Date: Tue, 29 Sep 2026 01:17:52 +0800
Message-ID: <20260928171756.3254016-1-cccccccccccc777777@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Soft-RoCE keeps MW-to-MR bindings and type-2 MW-to-QP references across
verbs operations and responder packets. Several paths currently assume
those references remain stable without taking the MW lock or reserving
the MR state. As a result, the responder can acquire a zero reference,
a bind can race with MR invalidation or deregistration, a type-2 MW can
outlive its QP, or the pool can force-free an object with outstanding
references. An unprivileged user with access to an RXe device can use
these races to corrupt kernel memory and escalate privileges.

This series fixes those races with four focused, individually revertible
changes:

1. Move MW lookup, validation, and MR reference acquisition under
   mw->lock.
2. Use num_mw as an atomic state reservation while an MR changes state.
3. Track and invalidate type-2 MWs bound to a QP before destroying that
   QP.
4. Stop force-freeing sleepable pool objects after a timeout.

Patch 4 is hardening: it prevents pool cleanup from turning an
outstanding reference into a use-after-free, rather than fixing the
reported bind and deregistration race directly.

Before the fix, a concurrent MW bind and MR deregistration reproducer
made KASAN report a slab use-after-free in rxe_mr_copy() from
rxe_receiver() on the RXe responder workqueue. With this series, the
same 120-second test no longer triggers KASAN. MW READ, WRITE, partial
READ, invalidate, and rebind still pass.

Changes in v2:

- Patch 3 now tracks type-2 MWs on a per-QP list instead of scanning the
  global MW pool. This fixes the pool-element type mismatch, avoids a
  concurrent MW deallocation race, and eliminates the unbounded global
  scan.
- Patch 3 clears qp->valid and stops the send task before invalidating
  MWs so a late bind cannot attach an MW after invalidation.
- Patch 3 yields between MW invalidations.
- Patches 1, 2, and 4 are unchanged.

v1: https://lore.kernel.org/linux-rdma/20260928155351.3222978-1-cccccccccccc777777@gmail.com/

Dongliang Qin (4):
  RDMA/rxe: Take MR reference under MW lock
  RDMA/rxe: Reserve MR state during MW binding
  RDMA/rxe: Invalidate MWs on QP destroy
  RDMA/rxe: Do not force cleanup on pool timeout

 drivers/infiniband/sw/rxe/rxe_loc.h   |   8 +-
 drivers/infiniband/sw/rxe/rxe_mr.c    |  70 +++++++++++++--
 drivers/infiniband/sw/rxe/rxe_mw.c    | 122 +++++++++++++++++++-------
 drivers/infiniband/sw/rxe/rxe_pool.c  |  14 +--
 drivers/infiniband/sw/rxe/rxe_qp.c    |   2 +
 drivers/infiniband/sw/rxe/rxe_resp.c  |  38 +-------
 drivers/infiniband/sw/rxe/rxe_verbs.c |  21 ++++-
 drivers/infiniband/sw/rxe/rxe_verbs.h |   3 +
 8 files changed, 190 insertions(+), 88 deletions(-)

-- 
2.43.0
