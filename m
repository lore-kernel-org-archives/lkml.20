Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A413B42C4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564623; cv=none; b=blzaINBmoxhRKKs/mPsbMWy1nAoXO8HDc3jfqF9kJcx08ZueK8aeB71HxHq7gyTTNJ3dziNmVhyQhHE+D+qr2w5vFTa3ML5nI3e0A/J+jy86AHkKuSqjRDfMXqjDqGQzyCuxpiLzo59n59iJEeWFYsb/mWGCuCde/2iHtWU6l8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564623; c=relaxed/simple;
	bh=QWCjvSArrnPRtD+0j04CDKUtmIxaPixLlth1E/uEyZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8Famqv41gz0dnRQJALF/hFGR8jsTH2B2dk1e4oqjHJ385r+nsN7a+NzPEVAGEjBuAVzGurPF5VBBZRYbs++WSgtajtXHRXqu4mGoYuYRMcBAnrmL4zLJ2cch4UR7n62HtJp2U7qt7ItLJTKVtk7sRU6JzvuvVdGqYvUumhMhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=OY9if/AI; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=4GULel6z; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="OY9if/AI";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="4GULel6z"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GYLSK3932478
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 12:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=l3JT
	rRt39SQipVSWvndi+FFbNSesn5q0JN18E/yrYeM=; b=OY9if/AIK6inCYoKOLPD
	UxP8kNZRCLIQfjKOH43P7bhel6CPP2ogbwArZ2HY8eoZGdjFAscN8I2fZJvEisMw
	ujJUe3L7FXpqNFbqDYRdWYk0gC9g91HgXjxtkSvXDoV+HhBVzojBa7P/KVjIgAFo
	MsnSO082PG9f/tpcsaPHQMkzqn0HxjWlH1Prue7ZXoyX8CYdgAJoQLqUgS4+Yddj
	htY7DzcRcW/1w492J/yQRJ8qiwXvvz/9TD8LHqLE3pQ8jcTgTOxnleL8v7QKA0Nk
	o7ZTaDYgFkrbuBZSx0wCVJ/ykDJS7h01v4uzWIOQYYFoXiA60k729nUJU8zkJnKj
	Cg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h6vkqbef1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:50:20 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53522c265f1so125280031cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791564620; x=1792169420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3JTrRt39SQipVSWvndi+FFbNSesn5q0JN18E/yrYeM=;
        b=4GULel6zbKLdY+HeYJQjSr22UXc1Ivb3dJfZVvbOhAMR7VCiGt7lxlLtGj88AAXj/2
         IUTDvXTxOQa4wt+TD8wfNx/TRKeQnRQB0PS5kOrrzWZanyekE4GhVce212Wg1dZe5W57
         UC5I6EHC19/+aITDXb2Ab8Fe8PWR4yHjy5c9czhQnpM31yczL+/LAUD3+SwumiocgfKY
         pyDy/dLuVOm58PDDRyjpds02MKyxPwX9q184kZ4YEBhjtwZ6GBqRHklRvEQOjS01u2Xt
         oOc6E1I9yJLo0VT3gCnFNfdpSOnIbT/avVcxlK5dOLxv0iMsqcYi1FWLfRT1LIlbbIPW
         yWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564620; x=1792169420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3JTrRt39SQipVSWvndi+FFbNSesn5q0JN18E/yrYeM=;
        b=Xqc+iv+d5MeI+99obs2IbPGQYfx1i7Q5j81OjbJYA1jwkNfEueajy7zua5ltVepJ+a
         0gyDFQLOZmoYLgscGbW90px+9kopDHKbFwQoUd84Wnro/Mw3LgakK6ENZCP1Npb0P6sc
         6aSBp0qo/s/hbbMxtoqVfFav58p14mbTuFEV5q+oAafaLm0oNbpnQJCSYlgCCcgJfENb
         pO6PkU7ySyfiySfr5DJfjWMIqJuJDp5T6W0SNj/RwjOwprji1YSmkb3wKi1B4BFN3Coo
         lieUUlQMOW3LLg75WG8oKQxqNTCUvIbB6jIOMZutfyCV7HaWbgrXAc4WET4j0rzb+zT8
         1Yiw==
X-Forwarded-Encrypted: i=1; AKwUvBw0vVxBiJ44gc8btc3h+gkhA+2GZ0oFSQNGL2U0JMGf6zrSb0siqPAn07ZBE+VdQLNRuc5ImZaDYGkbk8E=@vger.kernel.org
X-Gm-Message-State: AFuF++mWYy2sKVQk09gPCvDpWkO0+W+2BGys9N0X6VT5aIwXwseYzZWw
	BIMgruBHJg7+Yb5THMYuUHld4nLe6okQxOkaoo6K7CPmOzgzkgCa/Lt5H1Ouesg7DeJmNSyY27G
	EWx7McwIz94Bo3+geOmPnNhKn8CgwQweHcwNotRwKokdKBeNLnTiabbZ9APkH1g==
X-Gm-Gg: AYBFou3VjgiQQphVD57QWJF0SmV6//s4w8ACT5Xurvxucx3YVLd3s4sWMEW5AZSXkCj
	nFSgkd6k6mc5BwbdI5DUidEIFAz4238LPVBtzaCW1mTE1bTokXZ5ozDLJ5o9QW8+aOd7BhIvW5U
	BH/XiHPZWpbOpH53vK8412fU9VwLeuVnvNlUEyjQYc5FztaHgvWW9TMrO8FcKsx5kTTlMr4ZfqK
	f0GvddiIyThVHU8hhAWNggAkldzmUZeXklWr8wexZz4UMmNEgeRhgCA0rTkF9E8u+9cuHPNqGgv
	8eIfCq7yQHYqIE5OuFqH/P4kopsr3GOM0r2kIyzfq5cow6w631p4mVdkPBMSY5E3wIcoUWa0kTC
	CO1cQ3coZBZQHVR45XD939s/4LNupst/WctZr98hRsLSh4g8=
X-Received: by 2002:a05:622a:4005:b0:535:1463:ec27 with SMTP id d75a77b69052e-5359fb5a42emr38189921cf.48.1791564619469;
        Fri, 09 Oct 2026 09:50:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4005:b0:535:1463:ec27 with SMTP id d75a77b69052e-5359fb5a42emr38189271cf.48.1791564618838;
        Fri, 09 Oct 2026 09:50:18 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-194.net.columbia.edu. [128.59.178.194])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b77d0eesm22234701cf.19.2026.10.09.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:50:18 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 09 Oct 2026 12:50:09 -0400
Subject: [PATCH v6 1/9] block: use iomap_dirty_folio for block devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-blkdev-fixes-v6-1-307939c387df@columbia.edu>
References: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
In-Reply-To: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791564615; l=2128;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QWCjvSArrnPRtD+0j04CDKUtmIxaPixLlth1E/uEyZQ=;
 b=qMLmvZeuSixOMS38x6EmKAp4mC0Z6ytGiXLIW869jZX/sxWmXGZmFtbD16FIcyMxeAhASjd36
 cYbRlGpBwoXDkw8TKIZpbqkBpJXceSkdRkCWwmS9nmmdt9xDp92Ohvj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfXzp7KwSedjdsk
 ieP2hlyR9gO/RsbSNmiII0SUpPTt/emopPyTT+aBdD62l01S2cI+0erxm+Vl9C3ru7uAXMxOe8u
 H1/RSXgcgxb8EHU7MaOCDpebRtsI0i2DtlEfoDdYmVYGRn7SMlT6
X-Proofpoint-ORIG-GUID: bhifgWBqFsuTJngHPppjDr1FDj2HheFy
X-Proofpoint-GUID: bhifgWBqFsuTJngHPppjDr1FDj2HheFy
X-Authority-Analysis: v=2.4 cv=JaUpPkKV c=1 sm=1 tr=0 ts=6ac91b4c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=u0MKzLA9JmpizDwXU9Rxjg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=lHyHCDWJ2e6pF_oXpYUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NyBTYWx0ZWRfXwjxhVQFOHTbM
 0WrilhUq6DUUyYfYrWtr5DlhQ2O34LvG8vaDKFUfKGCgLkakX2u5KbpeSN5IOlrE1kgiV3mob/G
 7Nee4LJVQiDfGJaDDwJmbn58zdnLqf5SdJbn+3/CPWdXYRrjqjdhexSCZpCDnCP/ldJzB9/S8j3
 pyv2YCvVg1fzgQLffncMVU17w5/2tnm17XAWbjZrsYJmAM6mBw8TF0IrHNtRpQJiNfKHCYc/KSz
 oIZ+hCadOgj9dHUF06bkJ2fhR4N8FxFo8p1v5EqZDu3/PEmR278TamuzMKRWCAE4iDJJa9Q4RQ/
 jNUMqRa+2fUI5gOrkkuho3h9M+jKsoYZSB/Tu93qJ81Abv5A4xRdJOyKdlIzh+z5sxE7ZLyCsqJ
 VkU0MhE0yI/SKEr2Qf0nlipeyboENp9rvBIIMTQgHCcLXjbfM2DV9eNpxuwzTEHVpFnm4zog0oB
 N4mNjthLve/nB0T8sRA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11930
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 bulkscore=10 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=10 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090067

With CONFIG_BUFFER_HEAD=n, block devices are written back through iomap,
but def_blk_aops uses filemap_dirty_folio, which only sets PG_dirty. It
does not set the per-block dirty bits in the folio's iomap_folio_state,
so iomap_writeback_folio() finds no dirty range, submits no I/O and
clears PG_dirty, resulting in data loss.

Other iomap users set .dirty_folio to iomap_dirty_folio, which marks the
folio's blocks dirty before calling filemap_dirty_folio().

This is only observable with block size < folio size. With a single
block there is no iomap_folio_state to get out of sync and
iomap_writeback_folio() marks the whole folio dirty itself. For a
page-aligned device, this may require using the BLKBSZSET ioctl to set
the block size, which requires CAP_SYS_ADMIN. A device whose size is not
page aligned already gets a sub-page block size from
set_init_blocksize(), so no ioctl and no privilege is needed.

To reproduce, on a device with a sub-page block size, write a known
pattern with O_DIRECT, mmap the same range, store to it, msync() and
fsync(), then read it back with O_DIRECT. A reproducer is available at
[1].

[1] https://gist.github.com/tzussman/18ab05cba4b3fdc79cce0a69d1fd05b4

Fixes: 925c86a19bac ("fs: add CONFIG_BUFFER_HEAD")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260730-blk-dontcache-v7-0-3e8e6850068d%40columbia.edu?part=5
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/fops.c b/block/fops.c
index b917bc0f6b44..5a559fcfadf9 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -575,7 +575,7 @@ static int blkdev_writepages(struct address_space *mapping,
 }
 
 const struct address_space_operations def_blk_aops = {
-	.dirty_folio	= filemap_dirty_folio,
+	.dirty_folio		= iomap_dirty_folio,
 	.release_folio		= iomap_release_folio,
 	.invalidate_folio	= iomap_invalidate_folio,
 	.read_folio		= blkdev_read_folio,

-- 
2.39.5

