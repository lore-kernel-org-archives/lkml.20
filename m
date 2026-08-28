Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B646C85B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925023; cv=none; b=ay7xqJH8Jdc4tPnE1sLhW1Y9eBN5VnyfPul3j5gTMVbxory6sAv00pkx74Y/uu4sOF+HmWxE6EmnjMr1jLXQG3gzHF+Rn/xnVwv6v76dHQpBwlvVCOSPUFZmIQkJZ3Qru/NOSShIR+LdNQO3X1VWXkkXe5rjJmokyWEj4i/GkCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925023; c=relaxed/simple;
	bh=cvjM2bWwCeJz7HnW+o4BiE6Cy5HEK+ZgZMvk4q0+/sI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDE/+0D3K1cwHM+qWzWpHBWdMAR8pHUztiYUsn/ftZGCjYrUQZ334g1FAGEDWNTOygo/oUx61Btr27F7ORwgwy9gWjzxpR2OTsL/DJ9IdfaUS+T21bxLgidgCOhDQz0blt2BrQ/YjBdWuPwcaFClcDwUdAyG/mEuBfFLTfB3S4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=M3kgtPwo; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ASg5Kab5; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="M3kgtPwo";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ASg5Kab5"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCY80t1703507
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3vNQ
	+LNoQmUCg3VgcL1mBrxpYQC65W9r0CI37CzqFVA=; b=M3kgtPwoQ93zAYhvaleR
	kUktSiCzGBXI7k2zR3+L5GiCRipIlReUOtTWyTC63BK8gtPbmAQvgW2Zps0ogDiO
	Mmd5rKNSgXGbRotTd8+cgVc81s2NvM2UPBthobsO9+TSlRGh87qIbRACzxA0oTjo
	kpFWGzjH9DXjdsfQBDBNfxoJlKk5fwfUBz8tsMOaC1IDBTfZawsZ5c0Uw5k4U6cL
	+LGnVK1fHarbLAvAxY/uQaWZMgLJ+Wocw4dN1COAE/W/gokSTozRsIFq+YcFeVC7
	SIEueuBe5FmtyslfRSDMCji7vjpkqYgKTwMKfoJQrSLBCyeoqWVV6Zxdfp6pI/ty
	oA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gatc1d4k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:14 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so9281096d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1787925014; x=1788529814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vNQ+LNoQmUCg3VgcL1mBrxpYQC65W9r0CI37CzqFVA=;
        b=ASg5Kab5z0k7T5P2L1qRUg+PH3VzcHRpml40bZAjImqXnhLAj/Sw+Rw3J9S16XamRJ
         mW1Tpe3jTL2njXBJ8mzt6PlclR+t0CpUYa4XbQTSd61SIGam4AHV9ykmMJZXS5k/jQ5M
         fyqJWCiXwJoKeaD+V/KC6hQ6OnYEyIl9GDi0yCu6+ZLtFzN2/ykIZb4ymijJP/LvhU/X
         QdMN9NCxGrXgTqGbRXeaaWQYQ4gYG5kILtw3bTXbJP9gfHdHndjg+jekK7qCHFpHgtku
         /Pzh1WjHYmmOi9by3JiwZthXeUYzmTx5NaCGMFuVNB0/0CIsyFZSKSekICvHptyiZ/uh
         0jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925014; x=1788529814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vNQ+LNoQmUCg3VgcL1mBrxpYQC65W9r0CI37CzqFVA=;
        b=rtEzijAtjmBsactOdVhHA/ePBXiSk7AR3VFHZYRxNpIYlfXjlgLr2sncswlQIJ7n6F
         K83kf6ll30iipA/XmH82n5kOLLjllARrOP2MYVonhLiA/217luDm8CSTKB62slq4MQok
         J3c7An02hqpwI/N1exwOpFJBDIsT+Fo6tD7mV4pU8vNv/o0ILDi38INlFxgB/NEQKDZN
         PaquKdU0qLYiCQfT8Jfwd1lRG8dCFZZtWaVO6mVO8Z4T74l1EQTN5pEH2aQpFG/901JA
         FkK5OAUFE6Vl2aGrDgrWMIpqmmEwPEhlObW9+m6LhArbZ6hEcW3op5jfFnWTdJ5WZNdY
         EC8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkNk3cawa/HHHUN+KR6yBrTwedY3UBNWrC4H8y+w+BiO3SOkOF66whX7stURgtMZgxRXCokW9qwYyggJs=@vger.kernel.org
X-Gm-Message-State: AFuF++mkmH9y3tXcOsn7f+JTtsR/M9LiLOKBs9iTAUEJxFGTo5UiOL4E
	pKFpWfXJGF8t5MjVvNp7NYuj9tzmmgp3WT+SueArm5MYbYFE/2kEo4xDpCDM0OcH7nzYEKa71DA
	//QeOcJ0TfSEZ953VbjAJhc5WNs9gC7xu08Wny6MhdA4dZfstJpxFQszPXlwM7vR09q2a0v4ayn
	g=
X-Gm-Gg: AR+sD102XQlx+zsuUk8sdoRHu1VIKlobhcPBgERaZsKT+wm/VKl4qN4nCYhs3fMYSAJ
	6ZuDD0g/J2URphfmsC+c77TP7rgDH9vSBieIYQfc3gL1QcwrahnhfcLk27oqN+gDL866yGuhVAk
	VUBYJeejE7rIBNuoFJv1MF70XgsY6OogfLqDgvP6g1mVNTTSc19t/qb3Lb7Xc/4Ly1u97vcG+XM
	MvBbHbZroI0m4emBx7z09nV4MKt6qg+dv8IGSZFegkRXlhn5HYYGDZAQt5UzyLIUhdj7iv1oIL8
	F0Apo5IeDU8HqxAi3w91SzgrxYIk1qVrOvPT+/ZlW104nM2Xk2U+/bDQ3kKSi+idmsHx7bfUkln
	2wor8+Ych
X-Received: by 2002:a05:6214:2aa8:b0:90c:de81:6e76 with SMTP id 6a1803df08f44-90ce0bdea13mr82677216d6.6.1787925013350;
        Fri, 28 Aug 2026 06:50:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa8:b0:90c:de81:6e76 with SMTP id 6a1803df08f44-90ce0bdea13mr82676576d6.6.1787925012771;
        Fri, 28 Aug 2026 06:50:12 -0700 (PDT)
Received: from [127.0.1.1] ([45.130.83.151])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4534ebesm15645116d6.48.2026.08.28.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:50:12 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 28 Aug 2026 09:49:50 -0400
Subject: [PATCH v2 1/7] block: use iomap_dirty_folio for block devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-blkdev-fixes-v2-1-32f3f40cebed@columbia.edu>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
In-Reply-To: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925005; l=2080;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=cvjM2bWwCeJz7HnW+o4BiE6Cy5HEK+ZgZMvk4q0+/sI=;
 b=i8zsqlqEzBYmHrJwB1M3D8XEh+23kDrso9VTCckZEfshQvH5f8/F9Pzew2miCa10YzGSqCg9j
 uvM9QwyZrWOD0K8kb2ZlIvPguvMz82e7tPysKEcIuBpfgJvx5VF2Z/e
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=JKYLdcKb c=1 sm=1 tr=0 ts=6a919216 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xDWFIMX55ayQNp92vt0S/Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=lHyHCDWJ2e6pF_oXpYUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: MS_VR6QA41kfpuGgi6jer5lgebjehVmX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfX2oq5F3AK14rO
 gD7csNSqW6PXen9CzZXXJ2gC5dMrInclKpikR7e7OGwnrO9Exs36ZgwSu8jToezDBaYfq+npOLv
 l3DxVHEbDtjmU3D8B68M03JVzjMb98cxo5agkSEer4y5RktMtwdd
X-Proofpoint-GUID: MS_VR6QA41kfpuGgi6jer5lgebjehVmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfX6Tk4vPo+nS9Z
 SGFLX7HbvBQbF+EEtKhIHLzmoXE5lX4BMwEIAuqUC8fY3zXGiE+6cENUJ1x0ouBybaxM0ViKxwO
 uNZHGnWED36Cw4aSIsCnJx/0D3hUWGIX4ggS/pVjtG3Bd9K6R6wxAILpkNEkDaLEG6fwCLhi0Sm
 ZJKvTs6dzWkaTXoa0RkDoaantcL2oUp8Z7JdGxQYG1CTaoJBPzAA8PoP4A6p4gaG2uVbk4kSIcz
 EnY1qacGs6EczchKKjdy7qBTBcIBfhey8YpBkJI32jCRPdn/QZ+op4Fs2tSph9AZFlLi7i4ZMT7
 qdOTpueV49FI3cjSouYoHSGbWKQRoBjfZQTP0oS9ohZPuZMPrbcHoXMVEExa4kIbfBm9SkYg0ft
 cG85i6bjrlcQzzHKlkc9mrqs0AaRWuCkc8E0TbWuA/mcxvYXduawXRoVvKRT4Qjn4jQ1vVP5LLJ
 weq+8r4xE/IH90Ewbnw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11888
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=10 adultscore=0
 impostorscore=10 lowpriorityscore=10 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280119

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
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/fops.c b/block/fops.c
index 2ce7c6c4714e..c57784773fe1 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -560,7 +560,7 @@ static int blkdev_writepages(struct address_space *mapping,
 }
 
 const struct address_space_operations def_blk_aops = {
-	.dirty_folio	= filemap_dirty_folio,
+	.dirty_folio		= iomap_dirty_folio,
 	.release_folio		= iomap_release_folio,
 	.invalidate_folio	= iomap_invalidate_folio,
 	.read_folio		= blkdev_read_folio,

-- 
2.39.5

