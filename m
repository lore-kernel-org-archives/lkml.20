Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AFD4E534C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610839; cv=none; b=pzMGbnEvSUdkN2P6HBcw/dTlHX7O6dU36qCLaKkY4C2XJQiHSC2bJW0YPdRxvldHAkxAGIm2ppZcawVuphKa9ux2z/06sTxZrsuerI3dYbszhrYAAaHW+ju9uxEQmVjFoNYI2pK5L52LTDRCyPl+4hhiJeno/wRyzbih8GHHeZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610839; c=relaxed/simple;
	bh=4gppzRtfi+OooFdc4Jlje8h5Xg6dJP0tobF5btgOxgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UnakYCcHwauL0KWQ70l2neiLayfQWfqUwY+AyP2DVfFqHq1QAeDtDZALMAiXyvmvuQgXgfC9CI31GmZhP4ZyI8lf/4ZsTPCM+rYPq3yRQacsLJIVD9c1ivKG7qdPV4vA5JdDrBpNU8DxgytOc56qFTR0lUyyscixmTpE5TzhPqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrnaA7T7; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrnaA7T7"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1702575a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790610837; x=1791215637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zP4g8lXekauiwqdnSJjEc30nFtkgnAZ2P40l4bqb96k=;
        b=HrnaA7T7E+8CbuFAv1zuCqrgD7WstNAUn8a7HYU8Yytc29T74j0MW20pUEJzscF/KG
         Onz/Nlsyn0R3MdKdNOC8UfhHJ1dIpkbOtM00YpFYryJ037K/W4oJMlw6PAQpIoQwWled
         ptbmIF19hGDYS35oF824tJBEvO/yLG/GzhksTot40y0/cLJSMhkpLtfd64UdA+vi7wu7
         Xo3wx68Uw9BrvsgPnt6YTJCMcmiUzFDjK32XMENeCJuKzao3gRNPm7Iug8glqZb8EmeQ
         92HXaJLkjp/0Xc9pjuG/ADZnIi1HvCZA85oT4n7Pdu9/pLokqh0zpABL8fpA7YDYB144
         ceUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610837; x=1791215637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zP4g8lXekauiwqdnSJjEc30nFtkgnAZ2P40l4bqb96k=;
        b=zMir/+YBNZbUOA57lWCL1nq82kMMnThCGCT1cjzuTOm7/JP9lrjaHrz1VIIVBNpvnB
         bfNvuWFvWN/d5yCWxJ5giT7st7zByAY/oih4jcXZ1n5OtArNBNnFI8fEQHQT/Sv676KR
         5yHXuoAGaRUTvxwTQx5FcQTaFRSQmsJJiinSLiG4N/qKB3Ws0tMtRNEr3Ui8auqdWyP1
         6IT3KvUb4/guAGUKvU6QLMxJqR+7nU2i6d2W4H3ZtAslS1ELztOrPtN7aT8UUHrK/CO6
         uE428zCN6l54zDhSRulkgxx7ES3BkOMPFmDiwZXCr2j7XHYuEq7xAhaIJu3hJmkSooGj
         7lhQ==
X-Forwarded-Encrypted: i=1; AKwUvByWXH5BIlZlG4gRL85WzvEU4CZY0kbWi5DH3cDqEuCpp2jLYiHzdUDLdEzTK5JlG9foE5uXaaSvic5lBWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhD0EiYjdltNujZOcDo+FFeku0vmUFQcDI6V/EnSUaaTkQ5Ugc
	lPS04wilrcVqrDZz++bUvnrkO39glVOFbPZ3dh+0rZY5cpRor5OPmtnB
X-Gm-Gg: AYBFou3WedRI10dbIOeyBI3HYxOvBCq39lrqQ3PV9t89eopfWXwUfzYH2AU8s+Ljsfm
	QaVDb4RNpYaNXe/37oNZ0hmm7xhLCzLv6OS9ys2vSaDmWLOK7UD71RqTtK+8N9KJv0GinZBpRuB
	vYJcjr6idz+hvmD59if4IJt/Qq1mHIAqqijo2YxKGwDLlIx5CuCOwyANrNSdNhmEfQOEsKYKePV
	AlmjuZwF3wPejshXLQh/CHTBaAZh6oyNvK6U25sz13cBJSaZwpnvyMt95OnvwsSf2Ie2OAgKpCC
	EOT1x7+PuEz+S5mmSdgcry7ULd6OPmwP9EScWsx/ngn1DjwUGUwsjxgxfetowbYKygx4nusjYtk
	BCN2ZNcH2R0d0DHXVH4YJ04G4krwbUmSo9Elel4UU6JaDzWbFAQQmVabacPL1LB5dQDa27CnbKV
	1wPsWWaEDDUs6bIe9shwbYSlqvLjOlWPK1qSF7cj9Te3JIX8TLIGTqqdL2jgQRgGNK+zZWhWtC3
	d5Q54bvoCUVHSjsmH2YTjWb138qK8y1DlM=
X-Received: by 2002:a17:90a:e7cf:b0:3a0:e243:28fd with SMTP id 98e67ed59e1d1-3a0e243355cmr3530151a91.36.1790610837089;
        Mon, 28 Sep 2026 08:53:57 -0700 (PDT)
Received: from localhost.localdomain ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm44269a91.13.2026.09.28.08.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:53:56 -0700 (PDT)
From: Dongliang Qin <cccccccccccc777777@gmail.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Dongliang Qin <cccccccccccc777777@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bob Pearson <rpearsonhpe@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 0/4] RDMA/rxe: Fix MW/MR lifetime races
Date: Mon, 28 Sep 2026 23:53:47 +0800
Message-ID: <20260928155351.3222978-1-cccccccccccc777777@gmail.com>
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
references. An unprivileged user with access to an RXe device can use these
races to corrupt kernel memory and escalate privileges.

This series fixes those races with four focused, individually
revertible changes:

1. Move MW lookup, validation, and MR reference acquisition under
   mw->lock.
2. Use num_mw as an atomic state reservation while an MR changes state.
3. Invalidate type-2 MWs bound to a QP before destroying that QP.
4. Stop force-freeing sleepable pool objects after a timeout.

Patch 4 is hardening: it prevents pool cleanup from turning an outstanding
reference into a use-after-free, rather than fixing the reported bind and
deregistration race directly.

Before the fix, a concurrent MW bind and MR deregistration reproducer made
KASAN report a slab use-after-free in rxe_mr_copy() from rxe_receiver() on
the RXe responder workqueue. With this series, the same 120-second test no
longer triggers KASAN. MW READ, WRITE, partial READ, invalidate, and rebind
still pass.

Dongliang Qin (4):
  RDMA/rxe: Take MR reference under MW lock
  RDMA/rxe: Reserve MR state during MW binding
  RDMA/rxe: Invalidate MWs on QP destroy
  RDMA/rxe: Do not force cleanup on pool timeout

 drivers/infiniband/sw/rxe/rxe_loc.h   |  8 ++-
 drivers/infiniband/sw/rxe/rxe_mr.c    | 70 +++++++++++++++++--
 drivers/infiniband/sw/rxe/rxe_mw.c    | 99 +++++++++++++++++++--------
 drivers/infiniband/sw/rxe/rxe_pool.c  | 14 +---
 drivers/infiniband/sw/rxe/rxe_resp.c  | 38 +---------
 drivers/infiniband/sw/rxe/rxe_verbs.c | 15 +++-
 6 files changed, 159 insertions(+), 85 deletions(-)

base-commit: 93f51579e7df2
-- 
2.43.0
