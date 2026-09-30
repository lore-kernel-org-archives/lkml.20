Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B60F3515C0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740121; cv=none; b=blnraVJGwxFKspBXVpEQXiujqFXudHMoNfSpwQbMPXrk5I7HLhs+QFlFnqCR1bNPE/kwsIZnGgxQNoy1puYBueZ2p5A56wvstgpxo9NOcOP8vYo/1abGG0Mh/K2kM2DwPzztjyjN+4ZVV0arvDh9UhbT2ZGKWc3hIYRMpuS7+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740121; c=relaxed/simple;
	bh=UKI790QDojdJDY+DeD1jJ52elEwoCQln0jg4STWj20w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvtOc/HQ6LGzwcChU305jQBQONvptuiV/5fInVkj5uB0+eLFmUeN0IcDg8p0f6XT85/FDartHb+X3ahSHxK1eQwknlq4MWevtGLHmpndc7tTpDgUvsE6x3auvceHZiYysfs8HbtMEZMrcLmQXOahWf9sQS9XlXeaNpcAfgmkKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loqgK5Ka; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loqgK5Ka"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso23099765ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740119; x=1791344919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wIXIFL7vyYRyEByzr98V2DuVEMckRb61lDQSAtKhBgI=;
        b=loqgK5KazQaCH7xiTHsDc9S6tR595FSdYkigQcDuyncRBMUjibPrv9oltfbB3Rp7dV
         kBDAzXcDuy0QVBo1DfhpDKoBgYtZsmkoSortFCUhEbD3GisYvdeFRVvf3uInbGqimuRY
         fyMdPdQ/oUXZPGOQ+E0brlOx6+MdRp6aUwNgal3vxVhnWo71dy4Drf47lxyHY0I07wOj
         5WGaaKm20ryZO58bUGP2Li/GtTJDaJ5t1IaqXxoEX/kE48JnDI92YTW3UpJLwfshoT3i
         Fo6VgF0BcK5ORa4P5WL3OAKyiVeP4pLlyxvtPoEZzyNB5LjZH4AREEGgrRJyjRVL3T/1
         3mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740119; x=1791344919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIXIFL7vyYRyEByzr98V2DuVEMckRb61lDQSAtKhBgI=;
        b=QNj8x5RMkoU7YHWFwCyPDxUX7YeOGYnfHVBpnTFKsiPmUvLgtHdH6PxB3fxwxlJ7eQ
         iohVN63lWOEsCMMRnz/f/KleQdFoTBV326aFLQtmSCvDI5mgovE0OrQLKBK1aNQ+wA1i
         JsZcJnjIK9GNpjypQR0eyjfsv1PVvVesngUxq3foXMqRnsmYdtOW5vQj/SreZ9QNtVnq
         DC17ze/v01FuZGrfF233CsGN1mfITuMkm3Y56mKAN+bGXd3ahzL9t1odT+AmA47apLNQ
         XvQwLMzvIdAd6wTEEK7NmbgMxIeaXzYAb/HnuNSgYSlrrZSuSajmueBh1i3p8Nbpk9Cc
         veEg==
X-Forwarded-Encrypted: i=1; AKwUvBw7owEf6U7l15VffNUqe4aAvvwrmi5Vek8+0OXw04ZYJCdiamdUexusxZ8Vh7yov2Wv+wfgGd8xsia0im4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGsF5bfYarR24EVcJdajKUPnSXfROB19kOAnNGPXw3Gj2jeZla
	oaNHLJlE7I5lRKUVj1/kBWfd7TK2E0KbgWMffkvLTe2486bS2o8OZ3D8
X-Gm-Gg: AYBFou2kQm1KBzpKqA8/ZRURVwO5ynLj83Us0oaBaEuYY5SCXGi/wBbpQdPyhU9UWNa
	hG2cvngkQtO68wG+hBqpwED4/nYHVYWzDl4xoI90oNWxMS6sl/fz5UEtpJWpWJmVijnNliujwfK
	o0gjrK4+HCaZKCCKtvKQ6p+RXUk/xTbP9JlW6Ogfq09KrI5nzFPqp1TKcJMxdInZAoua6pkDylu
	FYziK6sanCvo/IJJPKaUTzAeBFsmQi8G10YEmyFJiuHJaVW6ip6myefhJ6AAgiSaA0a183mw1Kz
	frDBppMRt3GTfhgs8cP08CT4IhQuhCsjg3XDxSBztRufiG0w3/kEI39xcFvY8QeyVA9Xnp48fKI
	WwxzjHwmc7yR9/3DmhFa9YI2qbxegBuRktDZupPzs0Sg8zyoFkmy38P8jhZxlb4slWf3HtTXB5N
	BCa1k4BwNGuvcKTWKSSokMgb3L5Dv3c0WCfQ8HfrX8IEdPi+7kt7UIwLtHxXu+671dZnV4AKfnP
	xsVggvP3DrKIVH4kqwTknB+kSdkRD5/IMxDEuYuvti+U9n5HT6aRL4lBNapB59/QNzKUPiRg7MU
	oCY50HBjnxbj5+5FBxYlE5BXa3xUXEP1o3ZCr2FfLbUN73fSu28c59Oc2CvS
X-Received: by 2002:a17:903:2349:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e2e4ba0b86mr1471765ad.59.1790740119319;
        Tue, 29 Sep 2026 20:48:39 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:38 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] ntfs: fix the $MFT bootstrap hang and reads of unmapped runlist ranges
Date: Wed, 30 Sep 2026 11:48:29 +0800
Message-ID: <cover.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hyunchul,

This is v3, with your review of v2 and Baolin's applied:

- Patch 1: a failed retry for a vcn at or beyond allocated_size returns
  the runlist end again, as in ntfs-next; only lookups below it fail
  with -EIO.  On its own, v2's patch 1 also failed lookups past EOF,
  for instance when reading a file's last folio with 512-byte clusters
  (Baolin).  Baolin suggested moving patch 4's allocated_size check
  before the retry instead, but that skips a retry ntfs-next makes: on
  a corrupt volume whose allocated_size is cut to where a file's last
  extent record starts, the rest of the file was then read as zeros,
  where ntfs-next and v3's patch 1 read the data (with the whole series,
  patch 6 rejects that file).
- Patch 4: the if statement you asked me to merge is gone, as the
  allocated_size check now sits in patch 1, and in
  ntfs_attr_vcn_to_rl() patch 4 only extends patch 1's -EIO to
  LCN_ENOENT.  The expansion rollback restores allocated_size under
  size_lock.
- Patch 6: the comment is gone, and $MFT's own non-resident attribute
  list is checked too (Baolin); a volume where that list claims more
  data than its allocation used to mount and now fails to.

Patches 2, 3 and 5 are unchanged.

The series fixes a hang at mount when $MFT needs its own extent records
(patch 3, which needs patch 1).  Patches 1 and 2 fix reads and writes
of a runlist range held in an extent record that cannot be read, which
returned zeros with no error or silently lost buffered writes, and
patch 4 does the same for a runlist that ends before allocated_size.
Patches 5 and 6 check the sizes of $MFT's data and of every non-resident
attribute against their allocation, as fs/ntfs3 does.

Tested under qemu with KASAN and the hung-task detector on ntfs-next,
with and without the series.  Nine crafted images that hang or crash
the mount without it fail to mount with it, and six that read zeros
that are not on disk return errors instead.  Eighteen images that mount
without the series, among them eight public test volumes written by
Windows or mkntfs, read every file the same with it, and six small
mkntfs images still mount.  v3 gives the same results as v2 on all of
them.  The images and the scripts that generate them are at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist

and, for the ordinary file of patch 4, the unaligned allocated_size of
patch 6 and three of the eighteen volumes that mount, at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-v2-extra

and, for v3's changes, at

  https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-30-ntfs-v3

v2: https://lore.kernel.org/all/cover.1790417653.git.matthias.goergens@gmail.com/
v1: https://lore.kernel.org/all/20260922153931.1976405-1-matthias.goergens@gmail.com/

Thanks,
Matthias

Matthias Goergens (6):
  ntfs: do not map an unmappable runlist fragment as a hole
  ntfs: do not turn an unmappable runlist fragment into delalloc on
    write
  ntfs: fail the mount when $MFT needs its own extent records
  ntfs: do not map a vcn as a hole when its runlist lookup failed
  ntfs: fail the mount when $MFT's data size exceeds its allocation
  ntfs: reject non-resident attributes whose sizes exceed their
    allocation

 fs/ntfs/attrib.c   | 51 +++++++++++++++++++++++++++++++++++++++++-----
 fs/ntfs/attrlist.c |  8 ++++++--
 fs/ntfs/inode.c    | 46 +++++++++++++++++++++++++++++++++++++++++
 fs/ntfs/iomap.c    | 16 +++++++++++++--
 fs/ntfs/layout.h   | 13 +++++++-----
 fs/ntfs/volume.h   |  3 +++
 6 files changed, 123 insertions(+), 14 deletions(-)


base-commit: 259abb551e2944998cad4214c201954ab1ac5c8d
-- 
2.55.0

