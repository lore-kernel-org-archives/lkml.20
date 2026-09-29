Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1184FD7AF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675338; cv=none; b=tYHNOaOmaEVzLUbzVS5GbQEfeCw65RaNyyvNMBWfynuMOhnNkEcWmEuOpxblU/ZkFc9IzNBmu0UKCLwAQ4GiODfjXYsTOIa/v6ayAHnjaIXmU0eTGiPA/J9tcOo3ajT2TJwN14BsV1R112+eMYGw7hcEio0m+R9Y0NEZ6yA25do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675338; c=relaxed/simple;
	bh=YMe3Zk2nXuE8XEhwN2Qg/UDmrwPc+8BaHH88zc+1zLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLi2cGH8m7hxojlPznwG27dNdNM8vI64itdQchL8lcK+m8midFaFylBYRhRBmuzyiXUzjt+MV9wPwrLqOZILTMdBaXweqWU4FgMrIpdbL/b7Kl0zJU7xF9KMF0uiGAS6sDY8z9F9KlGkE2akqZNy4Nst9YFVMtrOgXJaJl2kmgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlV43skT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlV43skT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so29930265e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675333; x=1791280133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOzpqRSnyNj37ljU8ynQoOyLs4dzHeG6uqIOfEfXILY=;
        b=XlV43skTG8bYwiqHCZ8Xr0UZD/mrQ9TMsW5hzGtrxshxiKyYCmqE6TKXsqaf9D3gdv
         ifmLFRykpqeaerNuFr2vJKin3GlRGJ2zUI6h/dINEn+Bc3eAW7ze2unvMNes4CmGtA+k
         kARuHP6gkIKwOkVzZDgvSIjw7hBiXig3Ko4nOWpKgf4pkw2iDatkkyPLNX05OIPSf7Cv
         Y+XTATCpAVG4y1uptDxyRrJOvPgvcKu9r46BJnJHH0Zn/c1HvGAf5ZRe26Q2krIN+yBk
         VaRaHRS3nCJK5NeF9rXFA1WvZJKJ5E0B+aIABu67qdeEgDQfVuLRIUvULVKWJfkME3rK
         A2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675333; x=1791280133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOzpqRSnyNj37ljU8ynQoOyLs4dzHeG6uqIOfEfXILY=;
        b=PuvcQbCThRTU/tREz8B33++xRbpauwEppY7PydZRc7mHKaIpWX5QSe/bVeQZzm4aIy
         DFcYLZhCVidRFOSSyj68S0C2ja/3R19bp+aSJLP/7jQLf3Jl5dSksOxelhrzp4tJCfRL
         cpDzm0Sev9JnfwXN1oNZqsNtrWoLwZp5ENJLvmmTaX7/Y3Dan0k1ElrtMFaaEUWKGnYC
         6kvrCYGaZ0cwJoS22EqlygUNagOw2Mwa+BWltOxIfq61i8mkchXgv+OG1RMMDJYGucpF
         AMEboPfJcp4egk6QGSscnnRQmUQsqrEhv+0tiy9QBGJHZ3aED0K0XDuypFM9u0VQJRTp
         qyTw==
X-Forwarded-Encrypted: i=1; AKwUvBysY5FgaXPY5XmLPMUdzeHV80kfO6N0cv+JAmvgHwnT06YeLMZENc+k3OZ8Og7+5kiW0IyaVjpXJzObBb4=@vger.kernel.org
X-Gm-Message-State: AFuF++kYCRZgVSnC0dqU2Ah0bnqKlxgU+a5Tec8MoYDXk6EdQ1E7tCN+
	Iziv+6l3GCBT2tVfVqe+oKHZRo1t8/pZ79XUTSPJNCu9Gfd0ngXNlwGm
X-Gm-Gg: AYBFou1fvLu6mZtFllkmhlaoPhiaOsFQcGsbg0KNbay93IIDIHu/d9BV3ni8QQ84Knr
	J8Wja+rUyoL6xyVUfHMpw1VAJurHNbBidlC5sd7aWWxmU702kj+zn3cxc/T7lwFmjNV8ih3YaFU
	VE1a27MfQP6Eew+tPPv9MeYtcDXOPMZoPbLpD2dxxDpnWtgYjrZ3Yt857foetT9qogdD3KlPSi6
	XIVBgifWQub1T4alMA4P9KxPu8oshCTepeSldk6N1KTwE+QJeKkz6EPAla0ywFSy0Jqoz7OLEaZ
	jncZ43uVE8namYfFTKHD/7GhgTRuORfEbxmqAdvNiU652TWRAkXbC6z2oN5j5mNSNqOcYrAeifb
	Dnjq6kERcHw1m7YW/sgSNbVMvYkHY0c4CvRm/fyF2q5B5PJmTcrG+T+2/mxbqwIG17ROF7/a7Io
	mAyORWrOKV+iVCIhjMB8vnXyt/ipMU8F0ZrjK657x3V3osoEbHBoLKLCpECrKpSEdBvjIjKtTRS
	wpW
X-Received: by 2002:a05:600c:3b14:b0:4a0:12d6:33b6 with SMTP id 5b1f17b1804b1-4a012d633bamr9144675e9.8.1790675333021;
        Tue, 29 Sep 2026 02:48:53 -0700 (PDT)
Received: from SurHub.localdomain ([196.188.113.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm89821455e9.9.2026.09.29.02.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:52 -0700 (PDT)
From: Abdifatah Suruur <suruurism@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex@shazbot.org,
	eric.auger@redhat.com,
	smostafa@google.com,
	praan@google.com,
	ioana.ciornei@nxp.com,
	nipun.gupta@amd.com,
	nikhil.agarwal@amd.com
Subject: [PATCH v2 0/7] vfio: mmap()/mprotect() hygiene for MMIO region mappings
Date: Tue, 29 Sep 2026 12:48:41 +0300
Message-ID: <20260929094848.7439-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 changes (per Alex Williamson's review of v1):
- 2/7, 3/7: consolidated the duplicated !WRITE flag test into a single
  block, as Pranjal Shrivastava suggested and 1/7 already does.
- 4/7: carried Eric Auger's Reviewed-by.
- Rebuilt with git format-patch from commits, so every patch carries a
  proper diffstat.

These seven patches are hygiene/hardening cleanups of the MMIO region
mmap() paths in vfio-platform, vfio/fsl-mc and vfio/cdx, all in the
same class as commit a5edadbae57e ("ptp: vmclock: prevent read-only
mappings from becoming writable").  They do two things:

 1. Clear VM_MAYWRITE on regions without VFIO_REGION_INFO_FLAG_WRITE
    so that mprotect() cannot upgrade a read-only MMIO mapping to
    writable (patches 1-3).

 2. Keep vma->vm_pgoff in the logical VFIO offset space instead of
    overwriting it with the physical frame number, and reject
    non-shared mmaps where the remap_pfn_range() COW special case
    would overwrite it anyway (patches 4-7).

Proper scoping: no in-tree platform, fsl-mc or cdx device currently
publishes a region without the WRITE flag, and none of the three
drivers calls unmap_mapping_range(), so none of these issues is
reachable today.  The vm_pgoff changes preserve the documented VFIO
core contract that every device mmap is linked to the device inode's
i_mapping so it can be revoked; that shared namespace came from
commit b7c5e64fecfa ("vfio: Create vfio_fs_type with inode per device"), so
Fixes: tags were dropped from patches 4-7 and kept on patches 1-3,
pointing at the commits that added each driver's MMIO mmap support.

Previously posted as standalone patches, then as a series per Alex's
request.  Reviewed-by tags from those reviews are carried on the
affected patches.


Abdifatah Suruur (7):
  vfio/platform: prevent read-only region mappings from becoming
    writable
  vfio/fsl-mc: prevent read-only region mappings from becoming writable
  vfio/cdx: prevent read-only region mappings from becoming writable
  vfio/platform: keep logical vm_pgoff in MMIO region mmap
  vfio/fsl-mc: keep logical vm_pgoff in MMIO region mmap
  vfio/cdx: keep logical vm_pgoff in MMIO region mmap
  vfio/cdx: reject non-shared MMIO mmaps

 drivers/vfio/cdx/main.c                      | 17 ++++++++++++-----
 drivers/vfio/fsl-mc/vfio_fsl_mc.c            | 15 +++++++++------
 drivers/vfio/platform/vfio_platform_common.c | 15 +++++++++------
 3 files changed, 30 insertions(+), 17 deletions(-)

-- 
2.53.0

