Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB1D43CEF3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099680; cv=none; b=DRgB6zCfdJ5W4m1d19sh8cnvEbv8PiaoHO4EMlR74F0r1AHXKFc++uDELYaoVA6JJwf7NElUXt5Sx5piBmr+IgVcG0IqN7z+bcNs0S2ZUYGvcKVsR1GxBC0RKIppVtpGicAkO08iDDhNsUho8d8xLlrgT13ia+4MnNmo3+4toW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099680; c=relaxed/simple;
	bh=6R9VWISrKngAING7UCwUZcVEs93/ZHrEps6OUWXKMZY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC2AOdZhMZMW1uWQgJqFeJPgnlsjDSMNVLn0awgH+TZ+cc+ioldVG3vfzIzC74DLPFiV7NaYM8R9FQtF5KkRTVSS6DSEt4zZLOt8Bq0n6UYnnVJMjQjDb7WlwiXXiuptjakznkunvpk34JqTOwzQPVSisaIjFKeD1CHW3Qle5mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USr1GujD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USr1GujD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B551F000C4;
	Thu, 15 Oct 2026 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099679;
	bh=CBX12mfxHYqQEqStDh3U2qMU78nlJwFaHC1h8Enx6xY=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=USr1GujDOF9Rat+IHKcsJolXVpE8gR74onlp6dyPUQhFzivEqWbA2q/Knw5nSWTDU
	 eE3o7fOoHHkHnyURZtXDLzXpsr09F5YcnNiIV0B5QJm/YBv9BAHWezv2Ym22H977A3
	 qINqWAOl+FxQ5lO1pLOnUibRQwTCLDlxSR3sbIttnMbQfWO4xftWjFVlpx38VUPh64
	 ddbEpa7XFgPHLgJuW2HKO/V3a+J7x8eFnAVYShuUubL0y95FSTdZ+1ZkTc/YQ1aBxp
	 8uRSXb23DaN2mO8ONKuRgvhVZDX7K4WXnCqP658vniytvI5D5N+8Fe5VeFnsmHXZb9
	 /XqcDIkSpKjzQ==
Date: Thu, 15 Oct 2026 21:27:57 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <nzzhao.sigma@gmail.com>,
	Barry Song <baohua@kernel.org>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>, Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large
 folios for writable files
Message-ID: <atFFXafuVyyimmUk@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com>
 <atA24UMtAqkmz_R8@google.com>
 <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>
 <atD9Csw1-lj5_SR_@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atD9Csw1-lj5_SR_@google.com>

On 10/15, Jaegeuk Kim via Linux-f2fs-devel wrote:
> On 10/15, Nanzhe Zhao wrote:
> > 
> > Hi Jaeguk:
> > 
> > >Ok, this comes when applying "f2fs: carry subpage offset and count in write IO".
> > >
> > 
> > So we didn't reproduce this bug with the whole series patched on dev-test?
> 
> I hit this after applying the entire patch set. Then, tried to bisect and got an
> issue with that patch in the first round.

Ok, the issue was different when bisecting the patches. After applying the below
change that Chao pointed out, I can continue to bisect. Let's see.

--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1560,6 +1560,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
                        .op_flags = REQ_SYNC,
                        .old_blkaddr = NULL_ADDR,
                        .folio = folio,
+                       .folio_blkcnt = 1,
                        .encrypted_page = NULL,
                        .need_lock = LOCK_REQ,
                        .io_type = FS_GC_DATA_IO,

> 
> > 
> > Thanks,
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
