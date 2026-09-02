Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A324AA59D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366940; cv=none; b=ZCL4XtswNVh+GWosi4tZS1ukPnVlXUwIO8gIoIV+UTJbtKs9Hy0MHYBbOV1lHI2M32GX8CQSQ3Vt61RP2DV/TIaAD/caGVEgm2CCjJI1RNOWy9Pfn1iPMgl2ZVXycUw2JVNAywUETFrR4xVBy9omfc2VuGggVSZRwNwrc47H4YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366940; c=relaxed/simple;
	bh=A13FOnUVignJpbXasU9sCFVXtYmGVFkazU7rRABCu8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q+Cvg5OBuJTSsJsQqHOdkaeOpVqEzsE2iXLd7PYGsUclPc9srVIXU9nEuCfb61lmNti43APbUzWKyfxSi6kwrp9vH/0y7G+pW28E2zHCl6eMRqMP4p07+FyVsWqerRJYqBbIANFWrnNwweE3ZzQ8yfvVa6Y2AB0VWR14z10J4XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=HV6h4lYF; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=uZrX0Ecl; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="HV6h4lYF";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="uZrX0Ecl"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682GZCiN262588
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=bWo0D08099QFy3kCZLoBK/vIKU
	Asrl1Rh6dsmdH3/1E=; b=HV6h4lYFmeEtO5zFU7Vv9mOtn9McOj54/xyW5OFW2w
	OiZFTwC1TksaVaOMIwS64wiCxEz1KvU9Dp5oX+D9rMIxe9pBDYUucJvW+P0a4kGo
	VyCd4P3kX1gZe+QFtz3tYXF0lF7gH+SKT0Q2tvpwEL7uHGHXo5FhGDVNwFtq+1G2
	OYcQb05lhWJ89/S5cDDlsdJX/NbE9Ku2pSiJOXRS0ToN5Js4eIk8dzC27jeLk9k0
	J9RZbx2angT3MHokW+ospQ9odj1O8WQT+9IZksF4QFtx1pUiFzLH0aeWL8nuVTwp
	bMC4DJidFZpPhbamtaUTeUA4Dnf/xuB27YKnD+gfFsTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gefkbkcw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:35:36 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so22352291cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788366936; x=1788971736; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bWo0D08099QFy3kCZLoBK/vIKUAsrl1Rh6dsmdH3/1E=;
        b=uZrX0EclkH81TNgoc7+VTcE9RciA7LaDSJmkx1L5CGnx/PeB+xoAg+FLl8kQKmoiCg
         qbxn6S3T1xaryXPKGUb9kwxU365MkX07QlkdtIuJsGmqtjilMC256yrtNsBchUtlsnKk
         xwN3T4j0NbfcRmsDFQNJe30sUGMkSQG/ZfTITI4wt0p0OxJkRxlvahT9/pqWdexEI1ac
         2/TTt2EmdVZ2z8ONf2WskFK2F42AubHBEGR+knNXAEJ8eDr/Om4BQj/L+sJ8qK00yRMP
         ATDkF3DSJYkA6T9qG5RJI+CXiZQOIcqKA4f0KSKbI1jVH97K7FZhJQUB/ev/r3pTe+Yc
         nvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366936; x=1788971736;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bWo0D08099QFy3kCZLoBK/vIKUAsrl1Rh6dsmdH3/1E=;
        b=Fucr2pvPpXfo3f0h46oBbmDHdZCDEiJp+UmguvcbiRzG7QJsLoDjrvJLta1VvgsBj3
         hI52I/XJ6/7KD5bGoKHUNP1903lVmBILN6EvYAdnMF/T45EmnoFF4tnj1qRHA3d6XV96
         JBxUN4MeD/wer3UyHPVsjmI1qys8jck2o4DEvh6HKZ3bOQR0h4jOv4tZCZcRj/5bX3od
         cTx3wMqbyfnLDLSNb4r4NFLJkBY8S91xYacCoZ3VjsDZUpny9GiQOqaCXsbK2EOE++Eb
         MxpljU7pUn3gCK1wRxuk2FjPDcRw3DkqTbut1XQT/kWj1V2Sh/IJuSYsAjvViS5UHkAJ
         g2lg==
X-Forwarded-Encrypted: i=1; AHgh+RqYsMjdVKpAVjbGPW2GqAMpbZKgZVUG7Ny4hzOmecYOkzk96Rlg4+Waa4SXZ0L3c5BNeXYUi8YEw5gLx8U=@vger.kernel.org
X-Gm-Message-State: AFuF++nSR2q5KrWFy0OfeWCVyhzZjoSINMKAdqd9LS52BCu4SZQ5uM9j
	56twWMBlfJvJecBNxTs0jJlChtc2bcPWmdjKawxr99vgJJMUM+Kn5En62RJUQh9sR4JOpG6Ksht
	V6YR6EDG6t3hU0Uyhd7X7btYOZLJd+QeGT/fdc4aMlSFMjwAh0kmnMZpZUA1PFA==
X-Gm-Gg: AR+sD11ntODGKciD9DDWREFYP5u9m/AFNBkoeJeneSA3jRLvJxQHkJsWMCadqTc0TJ8
	sv7Znrdvh66EngFduN9jBm5mtFwCX3jo9GzAcYs3lSv3iAtHJ5FrlZjjzR1asbgXMmu6Lgm8r26
	8lcybXoAqOwLzF2gSDhKvfxzcojRKFahx+yPbEloHfiGiwFPXer2kwlEUOvsH7SN4XSTlq1y2os
	1Q3azQOILNnO5Jolpyvmg6oN8dcz8QAgBJVHBrw/fuIwOdTLAqpjLHZmKpCblbyuCmo6SP+rdVP
	wHoApwrm9mKnF67Sm+O/mh8YxVZtSK7DVU4OzxzI0VeJ7Nw2SesJbnwN6PH/lv8qI6rqrHDxHMG
	gpdM5calJ3E/MeZx1LziWsT0JjdITk/NlMVjETrANdy4LFGGhzDAdeg==
X-Received: by 2002:ac8:7d51:0:b0:52d:824c:4856 with SMTP id d75a77b69052e-53036d12e8cmr62814781cf.31.1788366935566;
        Wed, 02 Sep 2026 09:35:35 -0700 (PDT)
X-Received: by 2002:ac8:7d51:0:b0:52d:824c:4856 with SMTP id d75a77b69052e-53036d12e8cmr62810051cf.31.1788366930328;
        Wed, 02 Sep 2026 09:35:30 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef5067sm21805726d6.34.2026.09.02.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:35:29 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/5] ceph: convert the inline data paths to folios
Date: Wed, 02 Sep 2026 12:35:06 -0400
Message-Id: <20260902-ceph-inline-folio-v2-0-6c9098112352@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADpQmGoC/32NQQ6CMBBFr0Jm7Zh2DEhceQ/CgraDjMGWtEA0h
 LsLuHf5kvffXyBxFE5wyxaIPEuS4DegUwa2a/yDUdzGQIoKVVKOlocOxffiGdvQS0B9NdYZUqr
 MFWy7IXIr76NZ1T9Ok3myHffQbnSSxhA/x+msd+9ff9ao0NGlKNrGsc7pbkM/vYw0Z3YT1Ou6f
 gHQfaPGxwAAAA==
X-Change-ID: 20260825-ceph-inline-folio-17bcdb200850
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>, Xiubo Li <xiubli@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366929; l=2006;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=A13FOnUVignJpbXasU9sCFVXtYmGVFkazU7rRABCu8E=;
 b=YyUbIgdgtl75R6iMS+Sgr4Rptbj/zuzGmODLmCXYO5GUY1FeHeozg1PUB5NTTWtc7AGYjyA3D
 28TOEfD66ABCVHc8VdF0wMFD9DfX5bbwgGxYNktpJSaZlH667UxVxvz
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: QfbtFjuRlbOORqXx4v1EJ6ya1cBix27h
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX2rMVTJV2kQG1
 bhkVi8fGPfGKNCW9w6CL7dSsUB40YN3d0a5vati5+R5PHrnHrC3O0Ep3AsTqFhUcc+Qut2KTc38
 K7vh5CryVYeYOpU1WgiErWpWBs9SV/od6Mf8NAet+zbs03usDxvE
X-Authority-Analysis: v=2.4 cv=aIzAb79m c=1 sm=1 tr=0 ts=6a985058 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=m4ctf-qRAAAA:8 a=2FfYK1p_f_zT-IZ44d8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=j2jfHXP1PwAwKcBWPe_Y:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfXx2ATJL+0RE6M
 0ca8Zsy69huRufpg2DZGnGqAkWULh/PZjthM9jeJhQSct7IKFHLmtm+ZF6zA1zg3lnxzmbvHAdM
 QvWobO9vBJrvhZcb4feBYca11zeokZkAl2pfuHQfWmakbNYGgachglcMKi/oL3R6ZpB3XJIavGt
 CttWrnujYyN8Hb1WLaSNK4Nnrb8b2u4jKdL1jVWN9pNzhOEsxhUOhZ54qD0D77taewsPA+YfgJD
 FWRYJ4yv3mqf8vPoEIn9ghEAlwMouEra2aW/Cx2psYHm5r67qvlTWvbYDcnPex8QuJ4h5XW+3Jf
 fjgxveKwZW81eN1sv/YfEEh4JlLMPsYMl9OcOrlEDTfHP3Z/HmRfuBURlExZtNLsDeUo6PrqT8l
 wCsMwJdlqc72h7XJukDcQnvLL6f4S/ZdzmVfO/QQ4ZEw54dhlx1Dvyy9X/F1DsOQ+KZApbzq15D
 sPhGQzm73nA043scuhA==
X-Proofpoint-ORIG-GUID: QfbtFjuRlbOORqXx4v1EJ6ya1cBix27h
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 adultscore=0 malwarescore=0
 bulkscore=10 clxscore=1015 impostorscore=10 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020145

This removes the last ceph callers of find_or_create_page() and
find_get_page(), and one of the five remaining calls to
__page_cache_alloc().

The remaining inline data struct page use is the single-entry page array
in ceph_uninline_data(), due to the OSD client using page-based data
types.

Inline data support is deprecated and, as of the current testing
branch, gated behind CONFIG_CEPH_FS_INLINE_DATA ahead of its eventual
removal [1]. The conversions are still worth doing in the meantime, as
they remove the last ceph users of some deprecated mm APIs that we'd
like to remove next cycle.

Compile-tested only, with CONFIG_CEPH_FS_INLINE_DATA both enabled and
disabled.

[1] https://lore.kernel.org/ceph-devel/20260729-b4-ceph-remove-inline-data-v2-1-db0c92dab8ee@clyso.com/

---
Changes in v2:
- Rebase onto the latest ceph-client testing branch
- Patch 4: Convert the CONFIG_CEPH_FS_INLINE_DATA=n stub of
  ceph_fill_inline_data() as well
- Drop the put_bvecs() patch, as it was unrelated and could underflow
  the refcount of slab pages, per Sashiko
- Link to v1: https://lore.kernel.org/r/20260825-ceph-inline-folio-v1-0-d2366fade152@columbia.edu

---
Tal Zussman (5):
      ceph: use a folio in ceph_get_caps()
      ceph: use a folio in the inline read branch of ceph_filemap_fault()
      ceph: use a folio in the READ_INLINE path of ceph_read_iter()
      ceph: convert ceph_fill_inline_data() to take a folio
      ceph: convert r_locked_page to r_locked_folio

 fs/ceph/addr.c       | 70 +++++++++++++++++++++++++---------------------------
 fs/ceph/caps.c       | 10 ++++----
 fs/ceph/file.c       | 18 +++++++-------
 fs/ceph/inode.c      | 14 +++++------
 fs/ceph/mds_client.h |  2 +-
 fs/ceph/super.h      | 12 ++++-----
 6 files changed, 61 insertions(+), 65 deletions(-)
---
base-commit: 6b039a71d37a39bb90a64c4e271f90ee0588ac4a
change-id: 20260825-ceph-inline-folio-17bcdb200850

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

