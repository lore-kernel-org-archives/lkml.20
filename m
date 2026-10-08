Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A644A4EE4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465982; cv=none; b=LVcj7zizx+e7sdTzYfzfH+cnDaQ5jWM0j3lmF1QoZmqAT9usWKYBo1k11tPEVWtiL2D2YkDtcVd0mHZa9jp2+zOUJZP9qaVFmu+dII5T8x1y8lHRV1s20AV5qMG+JQZvRy/Hu4HixzU5CxmPW3Mjb+wws5e9o4yHrxZIuUbBGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465982; c=relaxed/simple;
	bh=+m9rnwpw7xg1jsbD5aOWtNPCYElh+Du/JGxeqetiXi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kUv2DzCxnFYBcqRQIOj/QzLZ4mhhmjFeReH/FzfZwsXOWOd2IIJ2Iv1AYdx8faaCM3TlJcdWsf1NFpdJ5tmLuJyTWYtWkbHfC7YIfBtA+JowlxNCQGbqf0M92QCNhs6+u8Wz37xreFqg06cdyHhuf5VNNtTkfvtZ7M6PexXDuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPSSCmIr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPSSCmIr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso53282025e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465977; x=1792070777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fh/Nj6C+FKLMVijEkg1F+ko3enZi3ph5WXj82YARnOg=;
        b=GPSSCmIrGgFnkcDAMmBUUvO+AOhBrdHtwXSKy2ebQ52J6YUhaDMZf5ZmD64v/G7mao
         vFr7BLRD3PifhaQUjG0Ub5+bk5lMZ3BndF8jhYcC9VFUFYL6IFs6vOsNLanSezpX7ixq
         dfpj89xgQwjWb9td+gbgDZ2VjuD4WOoJ8EBOrZOghiu9ApMPqH0aoI1OV7/OnSbGQWYV
         2yVUFO6RALalMF8cTyEyzCe9RgCkkkt1L02S4/kW+NN0BWqWceP8/pvsrJ72cGc3mydQ
         JStZMjRP04bx010oVDLEq0hxUCmpvpBu0gDONWcoHmhih68BynkDeCVO8TEVxBZ6d/gJ
         X/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465977; x=1792070777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fh/Nj6C+FKLMVijEkg1F+ko3enZi3ph5WXj82YARnOg=;
        b=alQjuAkbeQrBygQvSfs+bF7e8D1iJ7Bl0OuM8lvbqYlu5HOdc5OZtUmkuAq7fnQtR1
         vbN0HoHqlnPYD+rIA45hMkzDQfmOoWU8ym+qAV3d7vQEjlzwNtvmZBJFA+6tr49/RdHs
         qDm2mi3lfKXDW+3J32iBRVYf/jQrRHLnQQDDuFmRrFlwIa6KPKjEhjZPchCDSXfA5jPj
         RdGrz96DSEqS5DT2D2ErlpnZnPL93rY+yhZuebzz029bXGF5Nin5JHShCCTMNNm3NRox
         IBcNPPSpT77a6sOYXVW2eKQpuFuuJQib2pogLV2NNZ6gGpyonQed3uZmWczj7ok0xDMg
         SHjg==
X-Forwarded-Encrypted: i=1; AKwUvBwLM+2fYr7b9ARiTmLaGTw9oqYYX3yNCd6EGkko9QZucPhiv94L+e8ph21xh7Ne/eAtChLFLm5/MuRgFAk=@vger.kernel.org
X-Gm-Message-State: AFuF++lipUAZO2MCwhK3Xwmexyq21CWoHJgptcTPfAxIZS05rLyf1UL9
	m41b5ARj7xcKJgPzWjLiFeVz/7rKzi4k9SB6QKdpKQber2mS0IXENMo=
X-Gm-Gg: AYBFou3IIoap9UTKG/d5f0YTb9GkTCCV+en4RzPmMwxziFuvXGstDNHwAn1LsbIMKBi
	VqM6cPhq4PEDZE9pIN8mxmbw+wZyDcsaJLFpHt3QqRFaa1GHEcYlaLCRev0JLUx577yw9TbtHx5
	aRap2+4b9/cFfYvIrIKh88G4rwi5ljLIK4UBs0wO9sC2Ps0fTvcMNPvMSmJ/fJWdgt+1MldVtQE
	SaJZxZrx81WH9MygMBHIuSp1Z1hBehS4dDGyt6t8ymg/dgMyv9lEigJJBK8dYk5YhsFLmJB/Oz5
	LF5l6LddV12QEv7bUFdeUHx+Vz6m14NgZ7w6hCmmUiTXxWBCryoagmXoqZrFmXplPjN0P6ErHUo
	A895j3br1cWRLC1z3Dc0fY8qj2cjv+DcxBhym0XIwVns/Q++ghuliJ7qciaISGgox07wfRLpLVj
	HSBlpoaFWVFJ2oYeCCfE0I7eXJAhhsrOdUqi4eCQ4Eb8yQmt4EmQ48ByfqPLBM6IStePxGdqjaP
	OFXNhkd3x5GYVDERmkl1hOnLzCenwCZcr+QO6xZuN4JlrgVoW/zBis=
X-Received: by 2002:a05:600c:4f10:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a18043b5aamr106524465e9.13.1791465976910;
        Thu, 08 Oct 2026 06:26:16 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842a349bsm71479105e9.2.2026.10.08.06.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:26:16 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Thu,  8 Oct 2026 15:26:12 +0200
Message-ID: <20261008132614.2456716-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v3 is a rebase of the v2 series onto media/next; no functional change.

1/2 no longer applied there: the endpoint properties are now written
through the IPU_BRIDGE_NEXT_PROPERTY() indices and a local names
pointer, so the link-frequencies hunk had to be rewritten against that
shape. 2/2 applied unchanged.

While rebasing I noticed that commit a20c843c9bc4 ("media: ipu-bridge:
Keep the clock-noncontinuous property name out of rodata") already
fixed the third reference of this kind, the one I had reported
separately. The two remaining ones this patch moves - the
link-frequencies *values* and the "lens-focus" property *name* - are
disjoint from it, and 1/2 now says so.

Testing: the v1/v2 testing stands, on a Surface Pro 7+ (IPU6, OV5693 +
OV8865 + OV7251) running the equivalent change on 6.19: the PCI remove
-> module unload -> rescan -> modprobe sequence, fatal today (-EEXIST),
completes cleanly with the series, twice in a row, with all three
cameras streaming after each rebind. The rebased files here are
compile-tested only (gcc-13, no new warnings): that machine is not
running a media/next kernel, and it is about to leave my hands, so I
cannot promise a fresh run on it. Other Surface Pro 7+, Pro 8 and Go 4
owners are testing this hardware in
https://github.com/linux-surface/linux-surface/pull/2252 if a retest on
next is wanted before applying.

Changes since v2:
- rebased onto media/next (1/2 rewritten for the new property
  indexing); no functional change;
- 1/2 commit message notes a20c843c9bc4 and what is left after it.

v2: https://lore.kernel.org/linux-media/20260831140304.45940-1-dmanresa@gmail.com/

Changes since v1:
- shortened the 2/2 commit message;
- dev_info() -> dev_dbg() on the reuse path;
- Assisted-by: tag per Documentation/process/coding-assistants.rst.

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 38 +++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  9 +++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.43.0

