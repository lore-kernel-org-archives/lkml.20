Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0439E6C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045663; cv=none; b=Yy18yRbC1frmguUPGDdHTT7bzjpCtZNiRK42LT1BEXKAaClwvHmsww40mvezzSJ7h1iPxlDvp7saJcP0mJtWgcSIvpcrTi0Hza8abjywJL/7cqswh2uQBVRv75Tzo0894nIZvOuvAcb9ECuHrEgqZ0QcWCOoaFR1uzhUVy9rBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045663; c=relaxed/simple;
	bh=c22FXI/yBAiFiP+IXJLY78+gOs/orKSY6ViRpYhhCRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoDk0PxpWse8zsxYIDfy4qF65fwcfiMKRG2YEWJaEwfk9QYBbxXgv0eiu4NPXfMqX9qrSyqzITpQ9v5agQvZ49UR+63uvFtJkGCQ7B5t+YAnXhUnxX/7+V8Va1L5ltr64yN08lY1LlZGZjzAkttpQ1skTDx9ILQFCXKcdLLElNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ALm5Erja; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=1uPSm7St; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ALm5Erja";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="1uPSm7St"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2WxV51444163
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=GFCH
	X+CoYPEwVk2r0S6WYakXL0Z4yMswhTz3nIDnaZw=; b=ALm5ErjaR7B0g25ne9Cd
	TJH4de4s9Mpn6ImW+vl4AkjIz6Ij2PecbQqdNQP/+h+PwYQrSzyuxqhdruV6zKWv
	1IK1gqeh8MGor6+ldLOx9p3TzJxgS1cGAH8Qc0XXpaj7VsIocfCY6WT1iscKjAYO
	tkzYcEMfsyrMa08YDTH3OfqyC1nioks6atP9SrVwF8yf7z54MJC92AjeVYvUdfXt
	Wy5SzdYf3DJLCEsafhJRKdhcVdiFmn/TuFDTv/MbmgQg58yCcEFNl/6VQKqishKN
	awQKlFijrsjSVH3/DKOacNRfDARmFPlfv+Zw8/vpakfq8+O0eF7OCnEmO6B5ChTv
	6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gudres2t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:13 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532abbd5a51so63132261cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045653; x=1790650453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFCHX+CoYPEwVk2r0S6WYakXL0Z4yMswhTz3nIDnaZw=;
        b=1uPSm7StHJeXbA4Zl4+3+b/+vKFMBsYisFhQ4EUjuThyugQsHnCRSNCxsBpvzccldr
         8S2Si3prGFsS7907oLOII9oDP7LMqDBlAeiMdQkxKMbxPZl3dCwNUGw2YsMNaOTUkWpr
         tipJDtvCDntBv5MBxlmIQlIfWsBGzgbX5lbfDhEOkpOMGscVdlSCk2mRpXNY1LaAiQf4
         Jhzi0mjeZ0f8C7t3svaLj3TsyCwqZd3a9SWL1n36Cm/B/Uz+ACjgv/p+7dY9WSx4G9Hk
         v0gzDZE8Sik5dHrBqOO+msO9r7YBTIqVHeZ4Dk54NyKJnXVFiaKbL8CQ2VKWNqd6asQf
         YsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045653; x=1790650453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFCHX+CoYPEwVk2r0S6WYakXL0Z4yMswhTz3nIDnaZw=;
        b=Enj5UmbrhdGCx4BB69oB07vDN2nPoH1I5oX96vwb7SqSxF2BOUGAqbHgZLxmWxpn1l
         1L9ucj7PjmmhFHcZwFX/hIRTblKJCcbEjZaOC3Ol88zH8ZcNcO/YPRqZn33rHGrVBCNW
         7MOnwWU8zz7RHm2h+Lh/7Nu/NtEpOIn7nb7xrSwuEjiMWff1rmL7U6MJhtLfpVv9ZZbP
         2EUODj0icweadc2xKozeYIYSfXY0E5qRH0JZjDRYTlXzqrT2F8B3CYaA3EH6SXxnbFVv
         GSwyN3MjLwTLrgkpCcgQuZKEjiyzg5KOcF/8in7j/0ZtNQESxiZCZY0Kyu8kknYCoPmv
         huAg==
X-Forwarded-Encrypted: i=1; AKwUvBzNFiZUQWgqYQpkA0tph88kljASYC/BYYULKAZ/ifIO/kQ9EzhtMXJ3PGnPZtZElJNyQBMIC6aLyvEyjaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kASbR6Oj0xhau0vx7NI2hNIVVi7i06Q9P4XXYaaMivO3CPiSF1
	IbMPNajhAN3WHbtW3iq7TaFUvmHW9Y01BPjfG2LkchwaA1Js6FrlcBJpOCLkfY/xu3hI7PAcSOm
	dG4ucef4FQe5F8HCyux9hsw26wewz56zPT/NK2+/in7mfim61E8gVY0RLIFPF9Q==
X-Gm-Gg: AYBFou0ezSYUg9nLOMS4RMs3oAHzUdUx6dXPipF2lUIuM/rt1aJE2xI+c2VI2Y6+40w
	hEV3iGD5ZO7lEbfaqvGPYskwWSGvmWVPBvxt6tZXUnRoZm7RqFatsyycAued7RjnQDJQrdlXY0i
	mib0jZT6bgdWTH6a3mo+z1yOtVie5PqhuXe+2F6tHxrMZbTupq7lHoVteHZIoAgbFcs62Qd2LMD
	juu8mq2F5TSAcdQ6SlMzKwOgvvJvRJfQ1ehFiTh0of4tDcYUlgvpdmV0CswKlS5Tl8rnEjgQFCf
	rLLvvtwRDxlo4OJtIsjARGzZxR6zrYY0qVxPvDCpHtLZuRzoPT1EO/z+WK/J4jFhFkQjtQ5A5NK
	YskmgHmALgAyf3rhPNANIZNxIeQ5nbDZ5GixCKBEFdNRa
X-Received: by 2002:a05:622a:4a8b:b0:532:9adc:63a0 with SMTP id d75a77b69052e-532d8e70eb5mr36236671cf.68.1790045652941;
        Mon, 21 Sep 2026 19:54:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:532:9adc:63a0 with SMTP id d75a77b69052e-532d8e70eb5mr36236551cf.68.1790045652486;
        Mon, 21 Sep 2026 19:54:12 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:12 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:53:58 -0400
Subject: [PATCH v4 1/8] block: use iomap_dirty_folio for block devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-1-e2801f71ede9@columbia.edu>
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
In-Reply-To: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
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
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=2128;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=c22FXI/yBAiFiP+IXJLY78+gOs/orKSY6ViRpYhhCRU=;
 b=E0jg/mA+TgCvunpLEHsylFuItt8N7gX1yjeXv6y5xZN0zRIn5xZkffjGjTyRGZjerXFz8MxAI
 f9bAwEccsSeDa6qVnE040yvX+TE7xOTXD62PK5IbDIhlmaGwDs6u4kw
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX6LfTkAwpScpW
 uUC2afI2e11daIcTzWKweUZvIeR3cC6ji+zXPO/rUK2FvBOVMbWDfxu+Fv1Yh2CxKuSMFor0Do8
 6Uh5K2YTdyZkr50uXNziWBjjV+pXYz9fwiRjAXr0T/woIUieOgXRhM42uX/4Cbz/+nKvv6vrmzG
 iCiEbCFkvhPMvclls0sRCyj0ljAYT4mdWu4L1R09tOz4xWSG/i1c68Ld3twRqLyBz2PztMofy91
 ioDRJ7h31SS6gLEC3VeZghnQNt5k0sialp2vnuqnYWT0oE+mlndQTkzcOGeYQJPUcyUek0NZzPj
 M/F8eSVy38fywLO1gSH926kUP2c8WztSAyslZcUHEIp0kpCOu2egm9Vd1xUnF/CZFwh+/giLR0N
 aXlLMKsTH0j2xymhGS3wSQor2SsJr0rxLSB1VqYUOhzsEzd2gs2++Gs0Qkvw9psWzgZv+4vBOWv
 VYNL6VJnf1LAh8r23pg==
X-Authority-Analysis: v=2.4 cv=be3+w+PB c=1 sm=1 tr=0 ts=6ab1edd5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=lHyHCDWJ2e6pF_oXpYUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX27jtJrnHSy7H
 TEDPl2DbeDOfTe8I9kRTDSBDzxs7boLlPVoB2zQpdkDFr77mjtFuh4rrBfSGtebLpSLlIkq3DVe
 f1tOUsBLjK0iseolLYZDNpaOPbLetRIcBb56PKNPs5P0ppr0y90h
X-Proofpoint-ORIG-GUID: -fkmSMboPTpb_p3CZlP04UYUgO-WaGCQ
X-Proofpoint-GUID: -fkmSMboPTpb_p3CZlP04UYUgO-WaGCQ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=10 adultscore=0
 phishscore=0 lowpriorityscore=10 malwarescore=0 clxscore=1015 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

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

