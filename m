Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353287;
	b=GikdfP+j64E+JdtUw8yleYQ2yVG/laqP20RJZJ0iqAap1iSm35UpqZw6J0oEjNVPzbtw
	 P9WenxMu9v9caW6ukfhxEwc+Z4xkvsyYz/vhFdF+SrD4GRRcJZZFtFoyB5LMr1Uf0+V8H
	 9WeBXn5uLEOpyC6E1CfmSvnnjtewd6AjDMFIkr+WhvjbCvAJUtVq0K7V0oCWA5Vjmpvcp
	 TpTgtD8DSOJqOPccEcddOQOav1KErYUWLedX7+4td4QEqYe/iCvg1ETRbM3VCSpQrC2Gj
	 /FF8aukQVJPLUb+nvlR+cT3QJScZbHMfY9SMpE+u4cg5GSCTZoD03Ujuf7c72L9sfYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353287;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=ORyjSuKKSJN7+lfcko6IFZ37e1Surs9obtI/3rmqvUg=;
	b=y2A7r0YlRyI6TqHQHAI2uLcQ/CFJl5VtvoeauxBR9xk6rUwvFINVS3KwZtNJ6RCTv5RH
	 in+zJ6FZCM+LZECQwZoBqHk01lPzqsUo0KveTn+/NZPJDvvvCeLQmqG5BqsKjMlHOeoTu
	 4RNT/fi7m6lbM2c1/pXguTlznpSw9AoQb04zpzvFYqJ0wrQJ4OzfpI9UA+It+UjHHfCqS
	 5zDMyB3cnD9BY0w6P9uTozKgraIXwksczZaVVuGZrky8gyEMSukgLiQmsgAhtHUY7HuTk
	 Q/+FHdf91vh0DHrO9mrlBxfrTVygG84bLeja/xIJyoaXoAEZ/fLbBf+b5TGCaoy+Rgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Bvl3dIDf;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89638606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89638606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Bvl3dIDf
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261030094124epoutp043d75c4a8f1de0efe9b870dfe81f09bfb~jRU94iZsx2106621066epoutp04k
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:41:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261030094124epoutp043d75c4a8f1de0efe9b870dfe81f09bfb~jRU94iZsx2106621066epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793353284;
	bh=ORyjSuKKSJN7+lfcko6IFZ37e1Surs9obtI/3rmqvUg=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=Bvl3dIDfnyPIZZz7M7vgzqNTIK4clKgLyVXr+/9a1GXxdiS7wyTSUsOjOMt3NVkq1
	 rGZU2tQNgc57tgiDoaUUaw427u8MSdzdG3zHIM4AX11KtsQhUeSe8aEFf1mR5irl4q
	 kfIukRtrR8F26u6hCFXEnmt+f/F8cPCRPITWecNY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20261030094123epcas2p27d9272f4be076ef15bb610136586a2be~jRU9avsQu0621406214epcas2p2y;
	Fri, 30 Oct 2026 09:41:23 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.205]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jGGM72wkMz6B9m5; Fri, 30 Oct
	2026 09:41:23 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE: [PATCH] erofs: allocate file-backed mount requests from a
 bio_set
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From: Daejun Park <daejun7.park@samsung.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
CC: Yue Hu <zbestahu@gmail.com>, Jingbo Xu <jefflexu@163.com>, Sandeep
	Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, Chunhai
	Guo <guochunhai@vivo.com>, "linux-erofs@lists.ozlabs.org"
	<linux-erofs@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20261030-erofs-fileio-bioset-v1-1-caf47adbb3a3@samsung.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261030094122epcms2p6ed0246e9cb7e51134e4d89dae268c392@epcms2p6>
Date: Fri, 30 Oct 2026 18:41:22 +0900
X-CMS-MailID: 20261030094122epcms2p6ed0246e9cb7e51134e4d89dae268c392
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261030035441epcas2p11516a48f299f7e4c8ff69e07c29d8f17
References: <20261030-erofs-fileio-bioset-v1-1-caf47adbb3a3@samsung.com>
	<CGME20261030035441epcas2p11516a48f299f7e4c8ff69e07c29d8f17@epcms2p6>

> - Mount already rejects backing files on stacked fses and on
>   file-backed EROFS. A backing read cannot reach this pool again in
>   the same task.

This relies on the stacked fs check, and Sashiko pointed out that
inode_share gets around it.

A backing file on a block-backed EROFS passes the check, since that sb
has s_bdev. If that EROFS is mounted with inode_share, reads of the
file go through erofs_ishare_file_read_iter(), and erofs_real_inode()
may pick an inode of a file-backed EROFS in the same domain. So a
backing read can start another file-backed read in the same task,
while its own request is still held. I reproduced this in a QEMU guest
with the image on such an EROFS, and also with a device= blob there.
This is from the mount:

  vfs_iocb_iter_read
  erofs_fileio_rq_submit
  erofs_fileio_iomap_submit_read
  iomap_readahead
  erofs_readahead
  ...
  filemap_read
  erofs_ishare_file_read_iter
  vfs_iocb_iter_read
  erofs_fileio_rq_submit
  erofs_read_meta_folio
  ...
  erofs_fc_fill_super

With this patch both requests come from erofs_fileio_bioset, so under
memory pressure the inner allocation can wait on the pool while the
outer request still holds an element of it.

The nesting itself is older than this series. File-backed mounts can
stack this way since commit 34096ba919fd ("erofs: support unencoded
inodes for page cache share"). In v2 I will add a separate fix for
that, with a Fixes tag, which treats an EROFS mounted with inode_share
as a stacked fs, and update this paragraph.

Daejun
