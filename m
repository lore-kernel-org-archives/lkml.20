Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451185;
	b=TfQOsgSQkJEkezNK5pOvNYObHxVc9eCBIraveJOo0MdZ3uKrwfMcCmF9NoNQxcB2HKyN
	 xlu6lSI0Q08kGZbT4TQfuxvJRFOE93Sus3Pgn76fjvn0DMuJ28DaPibESp+AKZbgsESla
	 m/kG7wBmrCds3QK8hl5+F4gMwVN/xQLRyT05MDJOqy0tJTumeW4vfpDX+2eZRwmEi7AFG
	 zu+HulbRHCf0BX0oxwUZBcL71aiC9OoiLjlVT5MIbJz4dvNwgDyKVjo4y3AZTQXzhRiqD
	 q8Dd/FdtlKqHJH6XCrY6N0gVVDtbzWa4ro179mhIlLjuYKVpZabSw6o3G0J88Ublh2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451185;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=wsYANF54daBhggjQ4RY4e0s/Afqnu86Njwm4rLR8ebM=;
	b=nmvJ7ryJpvrKiSEhY05CuEzZSpLVEAC7ri/RtjKQaWpx/IIEo9CPzXZXPYoYtRJ2LTdy
	 AxBytetFUZBeUa1Pp3ypEcwHoQNY318voBNqFro+/keH0cMNbAlJOfemJgo/9iysIn309
	 OUoF+rx73F12x8t3g9L0x/3aRby+ARYrkxI9bZfW/dcNIDPNsZWBLO2DGNf9CozivLEHA
	 blCsp5Nl8VXAB8Efe2rTbpApzqHaz9FvWDV8fEifxhsLBlxLrA6rvZSllg8hZqlpbp3Ne
	 xWXQJqGLy6oviHl/DUAX3kEHM7iRrzW+PlNC1JYintYxgb4qFsHVdcB402B7wdScTMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=larGOYB6;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97160606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97160606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=larGOYB6
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261112023942epoutp03a326e624c5557dc5d38d1b7bf7484465~nK9e_1f_F1132111321epoutp03H
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:39:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261112023942epoutp03a326e624c5557dc5d38d1b7bf7484465~nK9e_1f_F1132111321epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794451182;
	bh=wsYANF54daBhggjQ4RY4e0s/Afqnu86Njwm4rLR8ebM=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=larGOYB68zTGF/VPNg5UcZBHaphn3WBqzwW0rBTTQweED3P78SUZdSej9Y3L88H18
	 R2Gqz3LTBeGxjTtQ3GC8I+kO3BVC/TiaBitRtzkxVw13aRSQ9LIYd4zS5iRfRERxj/
	 d4a1iRwuKUc1P5C/D+olvcl+Rha4KiZGj1GPWkBI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261112023941epcas2p3c181fe46ed8eef70fc662c6dcef368f6~nK9enBBLN2364523645epcas2p3E;
	Thu, 12 Nov 2026 02:39:41 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.209]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jQ4NY2tYcz6B9m5; Thu, 12 Nov
	2026 02:39:41 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE:(2) [PATCH v2 2/2] xfs: skip the fsync flush when a later flush
 has completed
Reply-To: daejun7.park@samsung.com
Sender: Daejun Park <daejun7.park@samsung.com>
From: Daejun Park <daejun7.park@samsung.com>
To: Brian Foster <bfoster@redhat.com>
CC: Carlos Maiolino <cem@kernel.org>, "linux-xfs@vger.kernel.org"
	<linux-xfs@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Dave Chinner
	<david@fromorbit.com>, "Darrick J. Wong" <djwong@kernel.org>, Amir Goldstein
	<amir73il@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <avR6G6TQehW08BD0@bfoster>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261112023940epcms2p691f2ef101b0e3988d15c4250877dfea3@epcms2p6>
Date: Thu, 12 Nov 2026 11:39:40 +0900
X-CMS-MailID: 20261112023940epcms2p691f2ef101b0e3988d15c4250877dfea3
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261111142234epcas2p48d80bde0c65d09a2fd8bdfdc9bdd2b1f
References: <avR6G6TQehW08BD0@bfoster>
	<20261111-xfs-fsync-flush-seq-v2-0-b5c00c25d276@samsung.com>
	<20261111-xfs-fsync-flush-seq-v2-2-b5c00c25d276@samsung.com>
	<CGME20261111142234epcas2p48d80bde0c65d09a2fd8bdfdc9bdd2b1f@epcms2p6>

On Wed, Nov 11, 2026 at 09:22:19AM -0500, Brian Foster wrote:
> Hmm.. that's kind of interesting. So IIUC unless dm can pass through a
> preflush+data bio, it will split out the flushes and ignore any error
> status in favor of the packaged data I/O..?

Yes. dm sends the empty flush first and then reissues the data without
REQ_PREFLUSH. __dm_io_complete() drops the flush error when it reissues
the data.

I sent a fix to dm-devel. With the fix, a failed preflush fails the
iclog write, and XFS shuts down:

https://lore.kernel.org/r/20261112-dm-flush-data-error-v1-1-c83d3f8f3ac4@samsung.com

[...]
> But if you have to post this again I think it would be useful to
> describe this caveat in the commit log description as well. If there
> happens to be some currently unknown flush failiure scenario that
> materializes in the future and we don't currently hit due to spamming
> enough flushes, that would be a useful clue about a subtle behavior
> change.

Thanks, agreed. If I post a v3, the dm paragraph below the --- will move
into the commit log of patch 2.

Best regards,
Daejun
