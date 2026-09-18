Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CEA4F4D11
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737387; cv=none; b=k1CikIYRihr5g0mry1RaBMYzO0S1BvFADPTyC1Xf3B1f4A5Dnz0t9opB6xOcqglAZYsp3wsFFxTkIY2CegKzU5DsSjfuKEe1bdhASvQ8z/b589B+yBHPuSIXUb0iU/jpKUpIO/QNrSRuNBK138dfLiMI2pF2Nnd64Zlfck1W/8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737387; c=relaxed/simple;
	bh=20mvTsdpLEDFfyWyGEhYqouKU7zctNL945btXR14cyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcGtur0Gc4VzSacGlzGxSmf5xqVZujloJhGtL76M43YDxh+vKkwbjIiGVjNC+wioaFNHSKYGpk8ESTtkMbWPvgr6j5TtHBuyw9fEhwNAzW4QbCjSJ8jRGyjjYh5jTRf/O1gO1jmD5E62w5+a41VtQ8GuwVX4s3XGHUg88DNhF/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghq0bGY3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghq0bGY3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso582767f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737383; x=1790342183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wyvtDe6AEfbt4jvUldi9B/KYnA6W2vv8pFn6fJzAVs=;
        b=ghq0bGY3CldwAcGX9idFKafZnQhffG2TlxArgONUWBvOSMeAl2cli43SiIasL0o0tl
         s/UptYufEN0jS2Z8Etny8kXGFbHsUDjgcTQ4iBinVNs+6q1i7cAWgNygNNgq+pgqKzQm
         57S3lYOIyQWOLXrcmczVYE1mGJL5NfRVkXdEZ7J6TZN0q3XoKJprBK6ybnBcggCVl/Z0
         rGxe6IlYMm8DHnM137EZzMhMPeArpjc4qQXdvTkUFeX9MrhhVB/UDJC3Bo/PRQDJXUUi
         1bU3lNQtE2hBCN1I7mVsepQsdKnQG08ShjslFIeA5hiPr37tXpWK0URBUvPnZN70HVIT
         XPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737383; x=1790342183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wyvtDe6AEfbt4jvUldi9B/KYnA6W2vv8pFn6fJzAVs=;
        b=Di7viceQXWysB2SjINI/E7G4JGRfuUg4UTaD5jSikH0dtiEIgwSRmpiQw9NlIb2mmX
         i5/tWmQO4oEj1azAswCkmY5dNCXvaiqGZvl9OKui+q4/+q39Qewc27a56EaQzDRbKayW
         Qi4076u/fRq709GuGjuaxp/ZUDPFVF88uhPr7B9eXkxLu7bt4YrwlcuT52xeINwqx1Xv
         9LxH7mjDUwMCmSHhpTFcSuWrG9qPCsd3N3BBGw2Rrs+Z4/L33t1RqSKyPa3sTnlrekRE
         1uK/NwJ7KpkXMEwiTSnr70083KpGwoT5cZgbgj+xof14p/4FJlPa0OYyPrbJvtRm7Eg/
         TU9g==
X-Forwarded-Encrypted: i=1; AKwUvBwW7AXYvAD3hnnIx/Qp2bFlY+CtipRusW+azfIdvZmcsg2hP0H/GDuOQicc57E5r1qzCR7su51XlKX3JIg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9ickgEcFtDgF0VwvbDQO+wZrFyhbBrZXmIRmM/QXv963YX5kJ
	xdkhUTM6YSww6wdD0whZ3ZH+cv+ZOWb0eMLsB+pGjHlxHx+y+2bYLRCC
X-Gm-Gg: AYBFou3mrgIWlMYv2iv6cjEC34R7dDjhINeOJAWuZJa2l5ZQfEFfw6xZ0JyGQptAktr
	KQz8BN/huRrz6RcGpiuvunM8ytVhtNsmpwsX+A1MVLV8QfpAmpYHrUiVkd7d6Bx+QIog0TFS9IP
	80I7PhE1rMqk1BBPK9Gv2ID7ipkA3GBAfMfCqA+zMX5aYuFE49s6k/bn1Fc8ySLvlMJzql+ORBy
	mitU+EnpGHSmkK7OD05syvULFsLOaZUNkAD6OsMf/bw1z5iFrDwJqxDf6nNmwR1TC3t/Ks87k1P
	CIb8soHrjAjtIhattlzBx1xE/9FtX8VseKjio3om2IlcTIDTPPBd1HSfE0mRWEhDxEzzLLZVqx5
	CNF2bxPWHxOQnqIi4ufb6J4EsZHn9WGC4eWDM1WCi9yXZtdGv52HTmjUVZN2TOu9Rq7G4MFJJlY
	C7LO0jZJ79PTEhE/veah3+gVDzp9ZJOL9K/CiixEHV0IPjLIsodVBy28K0IPPrJfzMiKbBPTUui
	ZKif85Dmx8=
X-Received: by 2002:a05:6000:2f87:b0:487:c3e:8df8 with SMTP id ffacd0b85a97d-4871e20f764mr6206001f8f.5.1789737382476;
        Fri, 18 Sep 2026 06:16:22 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:21 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Karol Herbst <kherbst@redhat.com>
Subject: [PATCH v3 0/4] drm/nouveau: fix list cursor use after loop in the clk pstate paths
Date: Fri, 18 Sep 2026 15:16:16 +0200
Message-ID: <20260918131620.405133-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series deals with the three places in the nouveau clk pstate code
where the list_for_each_entry() cursor is used after the loop, plus one
unrelated fix.  They are exactly the three sites Dan Carpenter listed in
2022.

The only change in v3 is the one Lyude asked for: patch 1 is Dan's
original patch again, with his authorship and his Signed-off-by
restored.  The code is unchanged from what he posted; I only expanded
the commit message and noted that below the ---.

His Signed-off-by is kept with the address he signed it with in 2022
(dan.carpenter@oracle.com); .mailmap already maps it to the address he
uses today, and I did not want to rewrite someone else's tag.  Say the
word if you would rather have error27@gmail.com in there.  Dan is Cc'd
at that address this time - the v2 went to his old linaro.org one, which
is dead, so he most likely never saw it.

Patches 2, 3 and 4 are unchanged from v2 and carry Lyude's Reviewed-by.

Only patch 1 fixes a bug that can actually be triggered:
nvkm_clk_ustate_update() takes an arbitrary pstate id from the user and
never checks that a matching entry exists, so if it does not the cursor
ends up pointing at the list head and the code reads past it.

Patches 2 and 3 fix the same pattern in nvkm_pstate_prog() and
nvkm_control_mthd_pstate_attr(), but neither is triggerable as the code
stands: the callers of nvkm_pstate_prog() clamp the index against
clk->state_nr first, and nvkm_control_mthd_pstate_attr() already rejects
args->v0.state >= clk->state_nr before the loop.  Both are hardening, not
bug fixes, and they carry no Fixes: tag on purpose.  The point is to stop
the two functions from being correct only by virtue of what their callers
do.

Patch 4 is unrelated and is a real bug, though a modest one:
nvkm_cstate_prog() overwrites the reclock status in 'ret' with the status
of the voltage/fan restore calls it makes afterwards.  The only consumer of
the return value is an error message in nvkm_pstate_work(), so the
observable effect is that a failing reclock is never reported in dmesg.

Compile-tested only.  All the affected paths are reachable only by root,
through the 'pstate' debugfs file, so I could not exercise them in any
other way.

The two follow-up patches for nvkm_pstate_prog() that Lyude also reviewed
apply on top of this series and are not resent here:
https://lore.kernel.org/dri-devel/20260727152821.128432-1-postadelmaga@gmail.com/

v3: restore Dan Carpenter's authorship on patch 1 (Lyude), collect the
Reviewed-by tags, rebase on drm-misc-next.
Link to v2:
https://lore.kernel.org/dri-devel/20260712123616.1180830-1-postadelmaga@gmail.com/
Link to Lyude's review of patch 1:
https://lore.kernel.org/dri-devel/ad023b5df1495ced25aa681d10f57628df41ac13.camel@redhat.com/
Link to Dan's original patch:
https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/

Dan Carpenter (1):
  drm/nouveau/clk: fix list cursor use after loop in
    nvkm_clk_ustate_update

Francesco Magazzu (3):
  drm/nouveau/clk: don't use the pstate cursor after the loop
  drm/nouveau/device: don't use the pstate cursor after the loop
  drm/nouveau/clk: don't clobber reclock status when restoring volt/fan

 .../gpu/drm/nouveau/nvkm/engine/device/ctrl.c |  8 ++++-
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 31 +++++++++++++------
 2 files changed, 28 insertions(+), 11 deletions(-)


base-commit: bc47d5937f21c5fc94504f03e18f1adb56d97634
-- 
2.55.0

