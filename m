Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890793F8890
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925019; cv=none; b=KvNxaPzVa1/XMJ5TGVf1z6QBs5QZhbODXiFs7Bmhz1Ity9ACCGbCzla2PGgyv9yZ9hc4bEbtE1LLeF2cVOhCdyj/jvkuQ53grc+Xu975UCxuGVepJjnE5GbUFq13kSS3uW3XjlPYd/6QdI/xfkc6DveedkAeUQTfJ4VBxDiz3AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925019; c=relaxed/simple;
	bh=FBiwWIXesQMkdhk3e/cLvGwV5QrzsTRu1YLYMmprXHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J6UMNESFJgx8s1Gl72Z2jOrB9cTAW2s1NaGh0dAlKrizwpvAlVSpMLC/oIHvZ5LgQWCDh1OaUJS+s9ILPPvxhvwhNSvXVRlYm+blyyfcWsbYcWG+EkRHLpraY+Cl0GYvN5QeljryJXER8MLLIg92uMSaAyDiv6h8ZA0C1yB0rjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=S2rCquF/; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=eMgsthfD; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="S2rCquF/";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="eMgsthfD"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCYCFZ3231992
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=oZ58YFd+c2Gnp/VNf6JZQqY8oY
	Hxsd/2NjagsE9004c=; b=S2rCquF/LD3aXIkzpWnRhhLCz51+IXlJERyRb2oLny
	EioZZgI14hnHr+slYiSv0sfmVCRyytn66p5QppsZsYradXmwa3G0PYTnwjPxuooJ
	XzYupItLPMu0upHSJeNiM1993AQBgqNcP1uU3rulzS4+GfmpF8jZYiPlSlW9FFWj
	xWnzxOteB7XVhnU5qbFJAeGvJ1km3muXBtHGcXYdwngLAwXeBUOsH55vciDJ94sX
	WHVlbGFPFCyhMZMgeaE5mb5WSyqXRbWOC/xtodp87RLUJu1EHFUpu8IiZ1tIKv2k
	m6Paf4EAkerkdQT54NAidoefVNzXQ0FvVXXpnCe/AUtQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gaufkvgb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:11 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90a602a4e6fso25479456d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1787925010; x=1788529810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oZ58YFd+c2Gnp/VNf6JZQqY8oYHxsd/2NjagsE9004c=;
        b=eMgsthfDZB6mPU6b0Yc0CzuQQaRZg1bidHzpAFx/g5CjkFjsGlPlYbJmg/E4XGixuK
         9818mKtVGpQfF0dpYDQtW+2VMvjVlKXj88+JQvlwuyvwLvmgOjVwz91C8NewvIgESY3v
         w89Zy8zBPyqVkICEEJ9Ds9q6lU8wCgt/J9dF872RLX36aMFiqCT3PxaebY09wo4AbHPK
         u2Rq6CdWNg/abtD7Apcw7q9L1D7jgKkRAwhU378gf1XyaE53w1croJ+XHZMHvzloAZsg
         httRNkb3DL2O74D4pxqb5HPAGZ6JQ8tFCvcE2CVVU80dJBcjf7n6do4e7PfN9PZSjU9J
         c0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925010; x=1788529810;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZ58YFd+c2Gnp/VNf6JZQqY8oYHxsd/2NjagsE9004c=;
        b=tJLC7nVA78RLuytM4wX2VL9wfAuKZX9/u8GoYumJBYIJAifL8UEbmrSE9jgG7mB/cz
         ofuO8NA5LXBLQOL0w1DuADcUXTZ1DOLJn3es8YLj5CrpkqLnAJTB2eXujWrKVLgqYkA+
         EhLhczdJ7VxtVv70McMiHl7Z+QZcY4ijj4teDpQpARDVGP/c3qFEE07Y+f5/T2l1iq92
         bGA6yRIeTXddiD9zlPWfthrfaGkpelhGEJvYUtXq/c+xE1E600Bb9v2D5by/hvZ++S/e
         fAFGpfOWKHCWayakAtfRZgOm8dcRgJEXOpcVsWtL3ipGneEhdQVWNRn3RqXXrjU3/uvf
         p23Q==
X-Forwarded-Encrypted: i=1; AHgh+Rokl4h7o/MhnV9ALK8+ZdXER4A9mTBsG0Wec3mqfb5uTau/bXFgtI/vgUA60kcU8pDOqMBVyEAxDuk48rc=@vger.kernel.org
X-Gm-Message-State: AFuF++mNZiqm3JBtLVqcgltccss1XIi+2dx/tkZ+Kcq545tqmnDrHDJ1
	6OrsAYUeb7mT2ZAdazP5pgYFpMcUm6GFenAN4tcgrxA6eWaNtwEc+FnZsLTzdP/SRIkQnRD6zug
	HDnu1Gs0s3+i7kvXT85wtU/bIQf9RQWkEFIKg0xXroMplUnAQQbzIEpyH/leIyA==
X-Gm-Gg: AR+sD11LF/5rtpEpYRr4H5BlchqbyPo7Gs0CAeR0rSDUlDwuUB77yacrp/nLnndD09P
	lJTy9JAAP08CwREx+i5gR5/PUvHbKNhNo0K3lgbgeWQauPRSaDuOf3LbWLzp0dQ5i9Ou535fUf+
	cYNhrLAqJWqW/OmGNiE5V121qcKBi++rYWG+37zbTdcH6WUJLVRvNh/NQ2wo6MYo3/7BeaA2LYi
	1RZr/Wv/R7gvmXrZesw4aie1jGzhzf5pCwyIr1r729dshL+YZ7bCbucS3xiA8AEeYvTCyvdTmgk
	3lfB5vzHoZF74lKaflXLiakkkBFPG+C+vNnqPa0ckN479xpF4RmUBbhGeY2y+Bk6cC3tYICzUyf
	zst+7neFh
X-Received: by 2002:a05:6214:d4d:b0:90c:4ac2:82f5 with SMTP id 6a1803df08f44-90ce0eaa3a2mr80604016d6.15.1787925009948;
        Fri, 28 Aug 2026 06:50:09 -0700 (PDT)
X-Received: by 2002:a05:6214:d4d:b0:90c:4ac2:82f5 with SMTP id 6a1803df08f44-90ce0eaa3a2mr80603176d6.15.1787925009247;
        Fri, 28 Aug 2026 06:50:09 -0700 (PDT)
Received: from [127.0.1.1] ([45.130.83.151])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4534ebesm15645116d6.48.2026.08.28.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:50:08 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/7] block device fixes for large block sizes,
 IOCB_NOWAIT, and direct I/O
Date: Fri, 28 Aug 2026 09:49:49 -0400
Message-Id: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2RkWoC/1WNQQ7CIBREr9L8tRhAtNWV9zBdFPi1X2sx0BJNw
 92lNS5cvszMmxkCesIAp2IGj5ECuSGD3BRguma4IiObGSSXB15xwXR/txhZSy8MrCyFFmYnFGo
 NefL0uAZ5cam/HCZ9QzMujqXRURidf69/USy9n1r+q6NgnDWVbM1eHVtbqrNx/fTQ1GzRTlCnl
 D7qDzV0vQAAAA==
X-Change-ID: 20260801-blkdev-fixes-771b1c314ebb
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925005; l=2622;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=FBiwWIXesQMkdhk3e/cLvGwV5QrzsTRu1YLYMmprXHU=;
 b=Xmqbzj2FbKXZ211dQopEDUHk7gfUQoDQkO0DAE6+8KcrvBO4IullglzzryYu9v9NxBIU2kHAo
 4sfHbgb4k/0CmlKmEhpG+0SWO+NT1q4/LqrbhfSvx8tnYeh+r9RH5jX
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a919213 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xDWFIMX55ayQNp92vt0S/Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=NVfozeXJUobmx_1PM40A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfX9pjtXri96H3c
 mp5QacdC0XWGtdYLGQCov4MHR0PmWVUP23quK70tO96yGTv7TvUgY/uHjxs/SA8cYIuvV8+yFkh
 HOQM15d44PD3JMicMsFxFOYTaMWLvv2PrU521JOKlTSAFTQOPR4uu9IFjR7ganekmgweWIOFx+9
 refPX0f1aMR7Do/E+bocTULNDUuU2YPkiFC6VES7Pa6xn14MMFcSU+nJ0iGieW1pOCEX7J9cKuZ
 nu5dfCegjcumoyUNEhGRg65UhIf1THgu5vqZ175vv4ocZmAmktHcjcKJxGzBpsefHHiZBwQTmhW
 ZQjCPmL6K/ogDrtdoZO9ezcf7MqUVSw7KNpav1Amu5PBNbK9Ab0RtpNt6q2Eu8ZS3dxInewwtbp
 pk0dKg5+jG4aCjEBtcBuV1GnrhVM8Zw+tnCI+NjBVRC//ai70Hk0ShMn65yp60C1iXhydphetBB
 GnmJJd9N/U0gmANDSpQ==
X-Proofpoint-ORIG-GUID: I5ISSeYEft-QwE9KFoRJ3CRuWzPLfBkz
X-Proofpoint-GUID: I5ISSeYEft-QwE9KFoRJ3CRuWzPLfBkz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfXwSkMd27lP1sd
 14vkkJfoG3bikVJA3W9w4jrBK+KoirZFk6aLrNJ45QAgC/ix5mc0nZ9+yF/KKq3szRD+aE4HHyP
 Q8/8CcJ6QmbsrR4YcHsRhskCMZrj1wkJsP+Vo2iwxGRTWdw05RIj
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11888
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 lowpriorityscore=10 impostorscore=10 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280119

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

Patch 5 makes IOCB_ATOMIC writes fail instead of tearing and falling
back to buffered I/O. Block devices can reject both paths into the
fallback before submitting any I/O, so we fail rather than issue a
WARN() like ext4 does.

Patch 6 fixes leaked page pins in bio_iov_iter_align_down(), and patch
7 removes dead metadata handling in the async direct I/O path.

These issues are currently unlikely to be hit in practice due to the
specific configurations required to trigger them.

The reproducer for patch 1 has been submitted to blktests [2].

[1] https://lore.kernel.org/all/20260730-blk-dontcache-v7-0-3e8e6850068d@columbia.edu/
[2] https://github.com/linux-blktests/blktests/pull/258

---
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
Tal Zussman (7):
      block: use iomap_dirty_folio for block devices
      block: take i_rwsem for the direct I/O write fallback
      block: take i_rwsem for the splice read path
      block: honor IOCB_NOWAIT in the block device buffered read path
      block: fail atomic writes instead of falling back to buffered I/O
      block: unpin all pages of a bvec in bio_iov_iter_align_down()
      block: remove dead metadata handling from the async direct I/O path

 block/bio.c  | 18 ++++++++++++-
 block/fops.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 84 insertions(+), 18 deletions(-)
---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260801-blkdev-fixes-771b1c314ebb

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>

