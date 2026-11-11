Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359090;
	b=KQZTm7WOiSKzFwZdS+JrTsCuTrlVyfuyB0k2VFb/zVvPNdMbe6KiyRKPNQ8SKbrKiPrV
	 QnCONp5w6y0yzS8UOtJ+RUSH6ubfATJ/4XY/uwFg9o45Oq/yN8Vx6IUgdSO5ZsOevgOoe
	 pwAMkfh2EVOvgXLvjRzatt18Zv1M4xSli61AxfvwLqSxR9J1cDjx/Ew/OWlEd4luX9Pja
	 9GWf7nv3HxWPIaYYneGxpCaWlakJu7t9vqDyuuMxOCu3cNs61YnYP33fDF/UeMeyEAZRu
	 5fZApbMKNV0ykIOt+BBmCw1nNZs6p9/pG/jAjKElr0wE8mVhaTJRFFgOB30yYuf1ptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359090;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Mime-Version:Subject:Reply-To:Sender:From:To:CC:X-Priority:
	 X-Content-Kind-Code:In-Reply-To:X-CPGS-Detection:X-Drm-Type:
	 X-Msg-Generator:X-Msg-Type:X-Reply-Demand:Message-ID:Date:
	 X-CMS-MailID:Content-Transfer-Encoding:Content-Type:X-Sendblock-Type:
	 CMS-TYPE:X-CPGSPASS:X-CPGSPASS:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=GiKvb46pmPIsIzjT9+8NqIO6uycJTt0qqmhwF5WaVL0=;
	b=1HD7fZDx3cSuAdw7dZkS/PuDkSU6pqEV42QFCr5n6RbHNf6DouBDeGYTcMGxNomiEUtn
	 CZxSs0+rSRboO3G4TBr43fWNVp2oVVgXqD1plJBu0XSIqcWymVRt1Ef2n9zUciozW17LZ
	 Qeb9aKNb+k8EsogdeuuUnvsGiq9IzAA59yUaHZDeRtWawd4XSu2/VLOzD95f7u3HiE5nw
	 QzagbR8SINyKRaltcnukVe/40anuCTwPZKUvda4/sPsDbGrS47eroyDQ3cuwK0ccAUIjP
	 IpluUElHSwCC58CefQkaoIVAqtpDIy/nctd1W4SOBDEpJA+DuTdSuTjIl9Adi1jPNYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BKktBoTX;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B6B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BKktBoTX
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261111010446epoutp03d0130924e6f64d87fa9bb21fab9b060a~m2BUfjmhl1326013260epoutp03U
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:04:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261111010446epoutp03d0130924e6f64d87fa9bb21fab9b060a~m2BUfjmhl1326013260epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794359086;
	bh=GiKvb46pmPIsIzjT9+8NqIO6uycJTt0qqmhwF5WaVL0=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=BKktBoTX8zlzZefXM6WrPLscwhV9AVJTACR4ESI5kvenc2CWe6YpLQ+Zes/x8OgZn
	 faKXMyYINlI88I8I3yrUUBqEEjJMpCmZ7vKKPTJVQQoWzM1slDeB4NusseM9MX9GTq
	 w0l6B7HcO5FMRzDqHRv55cMjRW+dTjzsyaG5ty90=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261111010446epcas2p39e5b6a345df9915383a215e287457105~m2BUMojI72708527085epcas2p3n;
	Wed, 11 Nov 2026 01:04:46 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.207]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jPQKV0fNYz6B9mB; Wed, 11 Nov
	2026 01:04:46 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: RE:(2) [PATCH 1/2] xfs: number the cache flushes submitted to each
 buftarg
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
In-Reply-To: <avIGZ9ABd_pXSy1L@bfoster>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261111010445epcms2p7972ac621507b96f995e477b203e952dc@epcms2p7>
Date: Wed, 11 Nov 2026 10:04:45 +0900
X-CMS-MailID: 20261111010445epcms2p7972ac621507b96f995e477b203e952dc
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261109174425epcas2p37306753cba345ce4909a28d2a77fb208
References: <avIGZ9ABd_pXSy1L@bfoster>
	<20261105-xfs-fsync-flush-seq-v1-0-299bdf5e28c3@samsung.com>
	<20261105-xfs-fsync-flush-seq-v1-1-299bdf5e28c3@samsung.com>
	<CGME20261109174425epcas2p37306753cba345ce4909a28d2a77fb208@epcms2p7>

On Mon, Nov 09, 2026 at 12:44:07PM -0500, Brian Foster wrote:
> > +	iclog->ic_flush_seq = 0;
> > +	if (iclog->ic_bio.bi_opf & REQ_PREFLUSH)
> > +		iclog->ic_flush_seq = xfs_buftarg_flush_start(log->l_targ);
>
> Bit of a nit, but it looks like this would be cleaner if we moved both
> of these a bit further up. I.e., zero ->ic_flush_seq right after where
> we init the iclog->ic_bio fields, and then move the assignment under the
> same block where we set the PREFLUSH flag. Hm?

Thanks, agreed. In v2 xlog_write_iclog() will zero ic_flush_seq right
after the ic_bio setup and take the number in the branch that sets
REQ_PREFLUSH.
