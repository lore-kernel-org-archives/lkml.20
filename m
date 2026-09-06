Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C542FB97B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733797; cv=none; b=A1U3d52mAQLzfvgYZelVXkl+MbpIPegK2MWFvBGamOE4X25f5vwbElp+T16tIwq7hpCpH52S4xMz5XDgILJZXN+VDIoFFivdKqCPUl88Ryba9UTSAASGvZn5LFUe/AzUvLQFBUkX02qLBV/mMnZbuUWpUZO2W/iorrzH2RH+UgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733797; c=relaxed/simple;
	bh=pAju7TI5+xdoiqfY+xnpahZErsKUQ9RZaydgKBB+99o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z2740MVwgr7Nvmi7z+5tpwt/Ber5fobctDeNN51vYgPu7FH1DAnb6ciX/HJ0NXu2js7hL0RxpfOPgvSLeFhO72pU5pTNzPPkvRbedDe23yJWAYLNmiBCUxIvdndrpwySYyXNuzNOJsjHi82yE2Pk8a0y0nNHAb1DNuuyCqTtKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=iovmnKIm; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KACPj6sU; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="iovmnKIm";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KACPj6sU"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686IXSxR638416
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=li2bXN5TDm4JSY+08ek5hlL7Ae
	vTby2HYb2VklMTt7Y=; b=iovmnKImSt3w4ZsIgF6ktdxFhk26IHMO4MqwK9+qLZ
	FgwtwOONbmD9vII/zIcZMQlSEXbDlu6q/LjxXxhoI/gVwnegkHuVAulQlxbCeNWi
	ASv1b26Rfh62tURlHai5YQykRHN7gYA32389QbMde66p85wpWtgTLsojJPKpYTgf
	Zhoy3B/BQuaqfuO3zAOg3gzHdBTztr7GYJNkbmxef84KkZ4UbDAw/W/4ynpU0ZfZ
	Uq91NSIZJsHIiZ5/3+JlEG75RU9FNwR9rNJK+hJ3T0tksCWK3AbqVInaQEEsbhyT
	KCr4vfI37HDLmeKfmbLYwrBh068N4ggPt8ZNKwlHGWzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gh42ttw40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:29:53 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so73266231cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788733793; x=1789338593; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=li2bXN5TDm4JSY+08ek5hlL7AevTby2HYb2VklMTt7Y=;
        b=KACPj6sUOWvl3re6TiuewGN0gsfABKxwcyxTibHSd519nlK7FRuYQDbgm4dqzhtxpb
         cTdLb7hUoIfe7ZEiTbzzzr/D0GIzzTRRG+rXz10FpOqzi4SxYAwp+JVaZ4fOUUDvjxTl
         IaygxGAMK89ikUzGe78+dvekjlhN4OOHZN3fW3XEThEBNUSrdJazI2n+w3js7RGiPOnh
         7t4KwKRB1CB7hmKVS1F6OfxTQJPlHg/4lmKjpa10VvvrDe8XdySlp/k3XAySzT3RJg0o
         b8qD1b1NwVAK8iYC3J21MC4mMs3xJLhf/T6OlnET2ulZDI7QiwDLzCPakqyqBIM5vNRY
         ZoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733793; x=1789338593;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=li2bXN5TDm4JSY+08ek5hlL7AevTby2HYb2VklMTt7Y=;
        b=IGv2dRvOevP1Q/GcEYpTRxFMXq+fMkBBQ5ZbIV1d7MsisoBqMrFMGpoYeg6f330bB0
         WlAwq0MRb2LCZg/tkYpKs5ojUmjxzkSpcQNz/3TAWiNzg183Ll9d8HrDwNkFHvnggjK/
         A+M76H9/kvHWO3nn7EntVy50aTK3vk/r7R8v2jgmbW+ttALB7yxt7Pd7ULdTSkI5fmfD
         qK6djhd6g8gEtJjKDNQ4xBAOjzC4d0Wo7WMtOSSVLeagloV2muB6CJa4IMqlB6orcOgB
         ki6p+rJam7vHBzGwMWr18q23NFjcUSPiVOl+ib4ZgOO9Y2cNa348AQkATHmYpo82hu9m
         RfOA==
X-Forwarded-Encrypted: i=1; AKwUvBwVJDMcy+k0vmhllYuZYoDSIpGPG4e92fjKaxoSRXNMQRuhdqvvtcqlRnPcul8Ee47fwC/1wpCC6lx4pYE=@vger.kernel.org
X-Gm-Message-State: AFuF++nRG9FSPfhxd45ceu0pod6KehYTTbFKy5yWvOi+sPHRQvgcmoz7
	hTx0qzpmWQJmHLcGcvRTNREKvESWeMekgEblVH4BBhKVNrkgp5oS2XoZKDIao0wfS80PNhWE4AY
	AtFMCYaOuJaYcCDW+QeBBUk7DNgTdAHAuWdShGQAAntWz4ukg5jJ34QRI9bmK8eCmRE/mbtvd
X-Gm-Gg: AYBFou3HT+m3HJxujE4EzYFx76k+I44Kj+0e5Id7egn9Rws9PXgVhWEKqdLsjADsEPo
	WqfL+xpAaSgmV5EwY6wXkLeby4GG8TIcG9ULYVpydviFpRvZxLPsEb4EhPdaXoVsV8kD3sc32qO
	S5ZhllhH68mrC8GaXe7ejG2LwyhKFJusmmwbMYr0J6vVnY8+uGdEbKBJO90DTImV+CFvEWS+Yva
	hl0jSw1w+dfedj0ylKJszj6ElzIdjavZgu7A24pmnJ7wux9q4beLZTldIH0smnlmp7FFNwIbEQ8
	xTI5mv04a/yZ0j0ElBpkrS0zthHDRhjckjCeKpqJcBNhPZ/BXX0a9o1S3v30+xKczTJShYRRSe/
	Y+2n7uEye+OyHDfIEWZQuqMRfOL7SkFqY9UgfiXVao1/SOdhc
X-Received: by 2002:a05:622a:38b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-530549edc57mr217549831cf.35.1788733792765;
        Sun, 06 Sep 2026 15:29:52 -0700 (PDT)
X-Received: by 2002:a05:622a:38b:b0:50d:e471:2d1e with SMTP id d75a77b69052e-530549edc57mr217549571cf.35.1788733792319;
        Sun, 06 Sep 2026 15:29:52 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm73048541cf.3.2026.09.06.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:29:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 00/10] btrfs: convert some struct page users to folios
Date: Sun, 06 Sep 2026 18:29:27 -0400
Message-Id: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfpnWoC/yXMQQqDQAxA0atI1g2MUiv2KtLFGDMaKTOSWCmId
 +9ol2/x/w7GKmzwLHZQ3sQkxYzyVgBNPo6MMmRD5aqHa12N/arBMKS3JKQUN9YzMbw3be2IyuD
 JQ64X5SDf69y9/rZPPzOt5w6O4wcnh4O2ewAAAA==
X-Change-ID: 20260905-btrfs-folio-conversions-47950cc1faca
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788733791; l=2537;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=pAju7TI5+xdoiqfY+xnpahZErsKUQ9RZaydgKBB+99o=;
 b=m9O6YZTKaMkoLhwgnca592SFDIz+V6ExsQ+u2srnglyFEP3uH208UIvPp5DOX8VAysrTJfo65
 RHEtAxA+bE9AkzUbxrHKLK42LbKsqjoOs+v77nh9MQwa15sZXkoJW3q
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfXwlODzKSsO5Aw
 4M6v+IkHCfFtU8ZpEu95IXg/2/YZf49Mn1Yh88baq2VtZ48Bemjz6aAgDOwMeWexyrPtp9CpY7T
 MieFAebjxGK4lIElwPXcIbO7CCtnPTnKQlWY5WfTqT58zwYvFLaRErfgiM7QpAkZkG4biadtEvy
 PZkHqKRvpNOcBcUMBQvggfovdiLArVzttb80cjkIkbFIJY3AWTPq2GfFTCmd/ukZSeMnNmky3uh
 j4PuqtYv4gKuZK/YTlms40Vq7JITAVdMCmLR6ZHdhbmrahrWyR7kl+rpr1RxYitVaIALxb7Gl1u
 CtTda2iZfZg66xEbz+sW9EUmEveP4Baym1mqIt/emzYUsLEb3hWYb1VYo7JNwOW0Eg8wgIg7bSO
 0iMwWn6oY4uXONnV2doRTrY8SY4th6aEl0siwjyw8tllJlHHDOSRupEZeEmq07Ab7xnsRZ+e9Dw
 Xn8EZyqnts8/XsazB6A==
X-Proofpoint-GUID: 5yMx7dY7vg-JHUJm_1XFlkjyrFySu1h6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX0n3NDiVNyl93
 nU+3R4oCLx2rG/HaJDCR49M/pnqgIkF2SlfNbwOEReWdt29iWeEUdwb/Vjs/PEPM1b8u1Mwfnum
 /Ura5EhHztGvLmej4WyWqyv369nYoa5SujJPBSfI1Jnrdx+BROk6
X-Authority-Analysis: v=2.4 cv=DrhmPm/+ c=1 sm=1 tr=0 ts=6a9de961 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=HURFG2p2B0PVTFy6EJsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5yMx7dY7vg-JHUJm_1XFlkjyrFySu1h6
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=10 impostorscore=10
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=10 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060252

This series converts four areas of btrfs that still use struct page:

1. The extent-io tests. test_find_delalloc() uses the page APIs, and the
   extent buffer memory checks assume one page per folio.

2. Compression. btrfs_compr_pool_scan() walks the folio pool as struct
   page, the last use of page->lru in btrfs, and the heuristic sampler
   is the last caller of find_get_page().

3. Super block reads. btrfs_read_disk_super() and the zoned super block
   log comparison are the last page cache lookups by page in btrfs.

4. The v1 free space cache. struct btrfs_io_ctl stores pages that
   io_ctl_prepare_pages() has just converted from folios. Its mapping
   allows large folios, which the io_ctl code can't handle, so the first
   patch keeps it at order 0 to match the v1 format. While this is
   deprecated, it uses page APIs that we would like to remove, so it is
   still worth converting in the meantime.

Tested with KASAN, lockdep, DEBUG_VM and the btrfs selftests enabled.
The v1 space cache paths were tested by mounting a filesystem whose
cache was written by an older kernel. xfstests' compress group under
compress=zstd and the btrfs group both pass.

---
Tal Zussman (10):
      btrfs: tests: rename process_page_range() to process_folio_range()
      btrfs: tests: convert test_find_delalloc() to use folios
      btrfs: tests: use eb folio helpers in extent buffer memory checks
      btrfs: convert btrfs_compr_pool_scan() to use folios
      btrfs: convert heuristic_collect_sample() to use folios
      btrfs: fix stale function references in compression comments
      btrfs: use folios for reading super blocks from the block device
      btrfs: keep the free space cache inode mapping at order 0
      btrfs: convert struct btrfs_io_ctl to use folios
      btrfs: rename io_ctl page helpers to folio helpers

 fs/btrfs/btrfs_inode.h           |   7 ++
 fs/btrfs/compression.c           |  20 +++---
 fs/btrfs/disk-io.c               |   2 +-
 fs/btrfs/free-space-cache.c      | 146 +++++++++++++++++++--------------------
 fs/btrfs/free-space-cache.h      |   8 +--
 fs/btrfs/tests/extent-io-tests.c | 126 ++++++++++++++++-----------------
 fs/btrfs/volumes.c               |  16 ++---
 fs/btrfs/zoned.c                 |  12 ++--
 8 files changed, 173 insertions(+), 164 deletions(-)
---
base-commit: 966bb86e7420c64f20edaac5ea096da9b16dc458
change-id: 20260905-btrfs-folio-conversions-47950cc1faca

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

