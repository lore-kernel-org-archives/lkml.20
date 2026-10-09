Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DA4396D38
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564621; cv=none; b=nut3/+ktNKBT51tgYKpCYxD3IkCyENlwbckCxpXOPYiw8F5WF4lRs8f9eRu1GhV5RKGmGJGIs+VG9X/1pp5UBlo7iLtrcGziQrDxTvQJm2fRm4jnbbjP4kcyYHlQF0p9D/ynIbZhJIezeTC7/PftaqspZEf7yW91pywplx5eaik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564621; c=relaxed/simple;
	bh=JF6s8qbTTePX822mM29KsuR4mH18TBbEc536oN0csNw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UTmzRdyAezVTSFaajNlHuaA5bW0obqs7HeXJj2B2by0Ufx9pC71i21ZBIvrrT7mteQFp3RYr4mpzkJNeB6g3aoYDHqJH3O8lMzCYCerokrR1HTWFjJyBg9N/qUmPmj59ljeB9O+rs8m9PTF/oPFDaLMWiOZ1cIdnsCe46g/qZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Dpde/sm/; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=s8osUtyC; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Dpde/sm/";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="s8osUtyC"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GYZ3e1243628
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 12:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=5O/hboigZvBqAzLbHkmcV76M/u
	wEBHnwXTN6so0C9To=; b=Dpde/sm/s0LoY5N92Pw49EXt6XD9QdyHJ4lfDxfvJs
	aC7Ks5XgLh7r3lXoGuAPQi8l8mPIIuuORLRA2kDZ90nHbAQTNSUK6HXhK0ieL3IA
	06cftOnYsyp3MbuI/LKpLqImMKNguAFjd52dcXcv5kzlBzy9PCdkoj5xQHqfLRPP
	2/5E+VJw/epwXmkqw4Cfy1emQtLvtBEObgR42uktaiPhzSO4txMMNWngospHl6hX
	oyLfn7C4eMBhw/1bOQYQrThGMRIgN2WxeHm8s/0KjVheS5wPnvOGzePUV4l+gLZQ
	2soEo0BwaYF5sOyNqPWHpCqsnHXKefk6ZDvamDhsXP5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h6we3kd15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:50:19 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53514717b2bso54766561cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791564618; x=1792169418; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5O/hboigZvBqAzLbHkmcV76M/uwEBHnwXTN6so0C9To=;
        b=s8osUtyCRAGUV+UN5Zv0bSAhfNBWY2ADoMdwGrn4u5sFhRFbx2wWg4b3FcBvysyZr6
         geNGflLzAkEpKDgq4CpT1uS6sZzyz41GltzpgyPcmb8rbAq6+g8ZFmgkzw6KxeL+BtI4
         KsGueZpQcSmxgxIIFBnY9v46ncoINgMFETcvFkywTdbUnnC03itkEcQaTsJvo8oVfWxL
         m82r5PvbLOEyRSB76E4YsrTxSxyhetaMZHBjRxza8631YZZHekRAmpdS20d8bt4NM/PZ
         sJ2BR2QZraGNP2VBIllNyd4YYdTsyfNqaXX6+XQ/Rcz4543rKd0IIG4M8eIqPP8IdJuF
         wE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564618; x=1792169418;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5O/hboigZvBqAzLbHkmcV76M/uwEBHnwXTN6so0C9To=;
        b=Q/2RVs73m6YTNtB4t54UbixYxV514MHmvauf3rBHODlb/e3s94SRGP7cbwUkf+qSFe
         d/B/0lPSdh8EiV6moLOf6S6kIpzcaAMM7L/JLF9TlFIWljUg/cuTCP5EXUdz9pGOoLwf
         b4S2CzF0QzwV+iigVQLXVCJQSv3vU+hJrZkQAY5fOVOiim6cUJ9cgBkGxB1HoriDdbUm
         cD6yfH89NU4+SWCyG54jFD2zrD8rtEO0B4MSCEoACeBM6sYcyDiY6ekRogOhJfIprtPH
         mqklJOzLL0DqTjmtWJDo1aBAzaCF8tWufwIMu/Z4r3IHbxahZAjPdu/Xwhpe+pnW4uOV
         CpTA==
X-Forwarded-Encrypted: i=1; AKwUvByDV5AbILBkZ81T31501oHyZG/bYwE+eLzsodyrt/Ovk2nxjP/GwiOVeiNcAOopDvGPzQ8WpSxzzo82huE=@vger.kernel.org
X-Gm-Message-State: AFuF++meGQ3esEjwM5Zhgb9iVE5V1+cQfAkHjUYd0zyXlHpGMiVJT8WW
	v+kbR2TwPNhi2gR4X8m9k+CPets9P9uwHdIpdQbdaW4o/Lsgi8BASqYSmFyOJu54Atay32Vzez0
	HNIXKklI/T9kLt4ZAXjZPVyDt++V5x8XKGN5VDSqvY2SwyCEiet7wtWTJBD1MGg==
X-Gm-Gg: AYBFou14uqriKyQ62NirFcGq1sO/d8T3jprTychkjvksg2H1dQjQmbyRWuKqXlLAZDN
	YohL/m6T2xQ+AvjjnzuHAeFKL7Dh7+7iAU/+t3UIYw7KGoh9oUZKaYvxNJ7nz9fLh5YqTVJs6Nl
	4Jz51qrocSGSnaTAC2cClz0a3Dj2eR2HZ4jcjfBYETdwGpvGq7OZ09p8SxxKt18QdnK9+KeHhfk
	Z3q7vwzHsElISrVO/iQZGUPNDl+gQXOtQnvvyfFGTCqnZbeQtOQof1txL6DVy/fteaDieuVuQLJ
	AIGT+KzZ8r93dAfPII0LqZgwiuTRXEmjmh/ijkjHMt0Ek35EN/7H+hFfngBu+dwgkHCNX3bgrfQ
	cOzpqGMxtBPYYb/HPls+6q/Ce5HavjYfDvNux9U6u0phCjZ4=
X-Received: by 2002:ac8:5f49:0:b0:535:70b3:fa06 with SMTP id d75a77b69052e-535a62612b8mr27667271cf.34.1791564618441;
        Fri, 09 Oct 2026 09:50:18 -0700 (PDT)
X-Received: by 2002:ac8:5f49:0:b0:535:70b3:fa06 with SMTP id d75a77b69052e-535a62612b8mr27666741cf.34.1791564617824;
        Fri, 09 Oct 2026 09:50:17 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-194.net.columbia.edu. [128.59.178.194])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b77d0eesm22234701cf.19.2026.10.09.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:50:17 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v6 0/9] block device fixes for large block sizes,
 IOCB_NOWAIT, and direct I/O
Date: Fri, 09 Oct 2026 12:50:08 -0400
Message-Id: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAbyWoC/23QTW7DIBAF4KtErEsEA8bQVe9RdcHPkJCmcWVi1
 Cry3YNTVXWRl08z3xtpbiTjmDCT592NjFhSTsOlBvW0I/5oLwekKdRMgIFimnHqzu8BC43pCzP
 te+64F1yic6SSzxEfgype335yntwJ/XXpWDaOKV+H8ftxr/Bl77ca/lcXThm1GqLvpImhly9+O
 E8fLtk9hoks7QVWHnTjoXoBUUTJPDoMG178ecNM40X13HYA4BVqu+XlykPzmiKrR6gviz3HgGb
 Dd2svGt9Vrw0qFpRCJ3Tj53m+A6qGsK29AQAA
X-Change-ID: 20260801-blkdev-fixes-771b1c314ebb
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.garry@linux.dev>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791564615; l=4400;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=JF6s8qbTTePX822mM29KsuR4mH18TBbEc536oN0csNw=;
 b=4T3IvPSeuowhSS6xdpm10yiXeIGJdrr/FDWL4GRG8Y2XY60aQsIqj+jHJn3dqyGHJNYuvpiat
 YjO7rAiQoOBAg9wtSdfo/kSvDJCppXU2WYRZalHF3fT0kUMxRYr+OQf
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: r3jexwdCHshbNlhnKuhh8SwOoFwl-qND
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX56QQnil6ea1R
 WkpXc4VSDHqQlrbomjZsuzrZsa4tOHpH6HRlZil5y06KbS0I0UiVRRfl/wgkqXfOuA92iNWUw5+
 d0DylllJ066jET5e7ZR6vjUcjXLk7bGteTXaYGPNi4zaFlaqB7Su
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfX2d0vOnRoj2Ag
 U/7SgXJIuQiv35aYyhKwX0sKz3BPl7TC8Hj7Nbe6JDcwbctcCYcSIrkp9+yBgDL3vW0vtsP9jL3
 r7k7ODE+Q0j3qISPterD+MeINiMOD0ItN+4Fg0PFXkTLiXECqdZrXZLc9Hpqr6RYNOlFev65PTg
 8X7swg8BoHAHNlt6BlF88Zu32xorcVVHnLQuLd1xZCg3wmFn+kwOfNooCrzzFtOTZK+OtFawoet
 i/yCeLRraiEjJ+Rbek7pvAdvbp5ixAwrRn8n7MgRtyKDnSA0Q4dKnvRBz6NZhXFHRN8xPcVxm/6
 MtkhMc8I8fbkt3DGiIBzbv5pR9sTJDqycZLYn9JFaksKrGNVGVQEhq/0CTvMf1d1ufWhcbQNQxi
 Sr4Vzi97B2i6V+F0cQa88Q+rcs8mVeg3w1NbmpdO2z/VSyBC5PjFmd2/qb5WMmTUricR9YMP0hE
 rH0JmPF0L/ae7vFuxMA==
X-Authority-Analysis: v=2.4 cv=eYio7LEH c=1 sm=1 tr=0 ts=6ac91b4b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=u0MKzLA9JmpizDwXU9Rxjg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=z3ezfp2eeGpP4QRtFEIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: r3jexwdCHshbNlhnKuhh8SwOoFwl-qND
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11930
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=10
 clxscore=1015 impostorscore=10 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090067

A set of independent fixes for the block device file operations. The
first two were found by Sashiko while reviewing the RWF_DONTCACHE series
[1]. The fourth and fifth were found by Sashiko's review of v1 of this
series, and the rest came from asking an LLM to find any similar or
related issues. Each issue has been reproduced, with the fixes resolving
the issues.

Patch 1 fixes silently lost mmap writes with CONFIG_BUFFER_HEAD=n.

Patches 2 and 3 take i_rwsem around the direct I/O write fallback and
the splice read path, which race set_blocksize() changing the mapping's
minimum folio order.

Patch 4 makes the buffered read path honor IOCB_NOWAIT instead of
blocking on i_rwsem.

Patch 5 makes IOCB_ATOMIC writes fail instead of tearing, and patch 6
stops the buffered fallback from retrying an atomic write. Block
devices can reject both paths into the fallback before submitting any
I/O, so we fail rather than issue a WARN() like ext4 does. Patch 7
makes iomap_file_buffered_write() reject IOCB_ATOMIC, so no other
buffered fallback can complete an atomic write either.

Patch 8 fixes leaked page pins in bio_iov_iter_align_down(), and patch
9 removes dead metadata handling in the async direct I/O path.

These issues are currently unlikely to be hit in practice due to the
specific configurations required to trigger them.

The reproducer for patch 1 is in blktests as block/048, and tests for
patches 2, 3 and 8 are posted at [2].

[1] https://lore.kernel.org/all/20260730-blk-dontcache-v7-0-3e8e6850068d@columbia.edu/
[2] https://lore.kernel.org/linux-block/20260909-blkdev-fixes-tests-v1-0-1f8af8665d16@columbia.edu/

---
Changes in v6:
- Rebase onto for-7.4/block.
- Add tags from v5 (thanks Hannes, John!)
- Patch 2: Adapt the IOCB_NOWAIT short-write return to the new
  FUA-aware need_sync handling, due to the rebase.
- Link to v5: https://patch.msgid.link/20260923-blkdev-fixes-v5-0-89e60d66eb38@columbia.edu

Changes in v5:
- Add tags from v4 (thanks Hannes, John, Christoph!).
- Patch 5: Use a common error label, per John.
- New patch 7: Reject IOCB_ATOMIC in iomap_file_buffered_write(), per
  John.
- Link to v4: https://patch.msgid.link/20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu

Changes in v4:
- Rebase onto block-7.3.
- Add tags from v3 (thanks Hannes, Shin'ichiro!).
- Split patch 5 into two patches, per John.
- Patch 5: Rename len variable to size, per John.
- Patch 5: Move the IOCB_NOWAIT check up too, per John.
- Patch 7: Expand the comment on counting the trimmed pages.
- Link to v3: https://patch.msgid.link/20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu

Changes in v3:
- Add tags from v2 (thanks Hannes, Christoph!).
- 5/7: Check for a short atomic pin in bio_iov_iter_get_pages() and
  return -EINVAL, per John. Dropped the tags.
- 6/7: Use bvec_unpin() for dropped bvecs.
- Link to v2: https://lore.kernel.org/r/20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu

Changes in v2:
- Rebase on current master.
- 1/7: Add Christoph's Reviewed-by and submit the reproducer to
  blktests.
- 2/7: Skip the buffered fallback for IOCB_NOWAIT direct writes, per
  Sashiko.
- 2/7: Change the Fixes: commit from c0e473a0d226 to 3c20917120ce
- 3/7 to 7/7: New patches.
- Link to v1: https://lore.kernel.org/r/20260802-blkdev-fixes-v1-0-a82fc549fd74@columbia.edu

---
Tal Zussman (9):
      block: use iomap_dirty_folio for block devices
      block: take i_rwsem for the direct I/O write fallback
      block: take i_rwsem for the splice read path
      block: honor IOCB_NOWAIT in the block device buffered read path
      block: fail a short atomic pin in bio_iov_iter_get_pages()
      block: don't fall back to buffered I/O for atomic writes
      iomap: reject atomic writes in iomap_file_buffered_write()
      block: unpin all pages of a bvec in bio_iov_iter_align_down()
      block: remove dead metadata handling from the async direct I/O path

 block/bio.c            | 85 +++++++++++++++++++++++++++++++++-----------------
 block/fops.c           | 78 ++++++++++++++++++++++++++++++++-------------
 fs/iomap/buffered-io.c |  4 +++
 3 files changed, 117 insertions(+), 50 deletions(-)
---
base-commit: 69ae59173a5668d015ab2733c8628ed542f00ccc
change-id: 20260801-blkdev-fixes-771b1c314ebb

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

