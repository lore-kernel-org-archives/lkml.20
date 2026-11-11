Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359145;
	b=LhaZ0SGtwjC8u0fJR5YgQEVNxEMfzHhuba9ijkL1K8qbnGJvuVsI5Kq4ycPzQ5gMnX90
	 UFNvfxoTQDgX6CimJn2CeZOeNXbPq83VJjD3YtLmf/KK/xdPtzWYXonx/q+wO19CXMA4D
	 c+GYhMvA+Y8/yhSmlnzvmWTZT14LRb4cPHzDZCz/YsWTJGS2bAquR0OP0hNd/iIVmPjW5
	 /JyVO2q7ynqHHVVi2MDqJWShSCgvm8X5/cfaOl5bTnwS6deO4vy9BR0vlWLlf87vv5Aw9
	 tzKwmW8RuN0m8wVltXmNioFAFMrfDFmcCTgK83/P5ezavptLBlxRA9u7zXco+vWo7Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359145;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=pkbznhaBkCFi1U32w1V8mYszmNFl3w7n8yFnD+biYIw=;
	b=0mxlo6jSqQi4qmOy8ywA2MV1CeFu5oLiol4DlduDI8VPSsG/fAkdg4IgDKsrESy7anpO
	 CkZrCYz+dmInpQuSFUoPAeMRoZ5nfuNKD56yzbJRI7M1M1RzTY2sd27TG/LOtcIciMdZh
	 w2QmTIL2A6n350GoKxgRrHYGIyLJlnOKhcxZeYEay0QPA78cpzhwiwIJQWG0bul8oB4by
	 I4Yavkq/1t/oHKygkhZ5sXtHMLeE1BRWWWpgEZ6z38nI5J3NDKg9SZUz5mS62dCvuKIFm
	 KT+2SyfPBbUoVPgF2Jw8QezzbEAGqWzPaqEY7WJ1PPElBwQhmW9ViP3e1kod9OVPilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=roQgUXRE;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2C2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=roQgUXRE
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261111010542epoutp02d13839da58c424a648c4b185200a23ee~m2CIYokoI1281212812epoutp02G
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:05:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261111010542epoutp02d13839da58c424a648c4b185200a23ee~m2CIYokoI1281212812epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794359142;
	bh=pkbznhaBkCFi1U32w1V8mYszmNFl3w7n8yFnD+biYIw=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=roQgUXREzBn4PfbSNNPJFipYYxMKmlJNlUFuGkW9D9DrheXqA54S5ACaUV9czG+Qa
	 VmHowaBd2VR8xflhxYJImrXBVePSubzCN2QUCj7fxh7lOOEXpNefErry18kT5Jw9DX
	 5D1Bo/hg7Nk1G0gDc/aPE/WuARmmw93wvW3XMEq8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20261111010541epcas2p200b17ebabe51ea1b2f88afdadd42392f~m2CH3vTV00724607246epcas2p2W;
	Wed, 11 Nov 2026 01:05:41 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.200]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jPQLY44jsz6B9m9; Wed, 11 Nov
	2026 01:05:41 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE:(2) [PATCH 2/2] xfs: skip the fsync flush when a later flush has
 completed
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
In-Reply-To: <avIGmcLZPKIDlf06@bfoster>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261111010540epcms2p1ac660f3ce4c6c2ed55836c8b1615a4d6@epcms2p1>
Date: Wed, 11 Nov 2026 10:05:40 +0900
X-CMS-MailID: 20261111010540epcms2p1ac660f3ce4c6c2ed55836c8b1615a4d6
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261109174511epcas2p22eb1ad7fec0b96837feb110984f57fa7
References: <avIGmcLZPKIDlf06@bfoster>
	<20261105-xfs-fsync-flush-seq-v1-0-299bdf5e28c3@samsung.com>
	<20261105-xfs-fsync-flush-seq-v1-2-299bdf5e28c3@samsung.com>
	<CGME20261109174511epcas2p22eb1ad7fec0b96837feb110984f57fa7@epcms2p1>

On Mon, Nov 09, 2026 at 12:44:57PM -0500, Brian Foster wrote:
> > 16 fio jobs of 4k append + fsync, QEMU guest on a 990 PRO without
> > power loss protection (virtio-blk, cache=none): 809 -> 4185 fsyncs/s,
> > mean fsync latency 19.8 -> 3.8 ms.
>
> Can you include this in the commit log so we have a record of the perf
> impact?

Thanks, will do in v2. I measured both kernels again on the current
for-next, so the numbers differ from the ones above, and added a single
job line.

[...]
> I think it would be helpful if the comment here and perhaps above
> xfs_buftarg_flush_seq() referred to the submit/completion ordering logic
> being applied. Maybe even rename seq -> submit_seq as well to make it
> more clear. For example, something like:
>
> "Return true if a flush has been submitted and completed since
> @submit_seq was sampled. If so, this guarantees writes completed before
> @submit_seq are flushed to disk."

Agreed. v2 will rename the argument of xfs_buftarg_flushed_since() to
submit_seq and reword its comment along those lines. The comment above
xfs_buftarg_flush_seq() will say that it samples the submit counter, and
that a flush numbered above the sample was submitted after the sample.

[...]
> Ok, so I think I follow the logic. We write the file, sample the submit
> sequence (after write completes), then can optimize away our own flush
> if we can confirm that a flush submitted after write completion has
> already completed. Right?

Yes, that is the logic.

> That kind of makes me wonder whether we could do something like "flush
> or wait on any flush submitted after this seq," but maybe that's
> something for another day. ;)

I'd like to leave waiting for an in-flight flush to a follow-up.

[...]
> > -	 * If the log force was a no-op, we may still need to flush the
> > -	 * file data target cache here. This can happen for fdatasync/O_DSYNC
> > -	 * when no metadata needed to be committed.
>
> Did we intend to remove the comment on why we flush in the first place?

No, that was not intended. Thanks for catching it. The paragraph was
deleted while I was cleaning up the comment changes. v2 keeps it and
adds the new condition after it.
