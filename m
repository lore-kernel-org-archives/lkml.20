Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274792;
	b=uM9VllQBv0rvf4SOEOnIyEN+UjGigvcBxlRtvuW5HgKo9eu+Jwbb2OHoUsdP7mV16ZKh
	 qBzvrcsZY/DtzGMPraasMneFYy9GKmy7ybEhjcK/1yceLO8IRp9giEU1LdAmbbZsivtYl
	 KjhX8ENQFR7YPvbYY0FnJx+jgkDAdPf+nldIXqg95BcUi12ZsH2/85DzAxOc4zwRbmc9P
	 M8aLfbHp8nYL100gTZ2WyuDVZB5lBKQrzTX6gCWYrlLuEEhgh8PocYl8gvIY4o9tz6ik+
	 C1rkkt1hWzEzcU/OPTWqSA02cKcB7nzTvUbNL83o7msJ/xJHsChSNknT6J60nN0u2vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jUwPwLLs3ItuEGtYWzom9wMw0uBhDScICxqoGDVoPms=;
	b=wi5ZgkN6kHvqWdRroG8jYjgqkuQhIRx8QD9zqsNOA7z4IaGUPJJ2rlmFpCWNHdyu1aB8
	 tnRyfayY2+Wji/akSeGexmNrR6HgEglgPx4ijfeuzaUVYvqqED1lr9zAXH+3WMC7dq6NJ
	 TfvKFwrjyWHJ8T3g5DvnD2J6LrON8lsuA1qkQWOyONKBFEkgtCwpPNmeLoD/CDKf8kRef
	 dpvOWv3g+0FWWn8FoJbV+Zjq1vaTR505uzPjrWtnsq/R1zbf46oaR5SOLu9wMELu3HL64
	 DW4shnsX30WzpmdgyOUwAYNFGVqxlgSaPlhmy1jxgnXRdP0nFPGOKyWjgmp7e6lRKkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYU3cpo9;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82145606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82145606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYU3cpo9
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c414e5d282eso271101166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793274791; x=1793879591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jUwPwLLs3ItuEGtYWzom9wMw0uBhDScICxqoGDVoPms=;
        b=RYU3cpo9DciUFn6VpBMgihzLJDxrpN41WV68WkmYn6mVv/24wdMR5DdenFLdICeb0U
         rH08VGFDuUTfC+/dga2oBEcjdnuOSLsAWhQ5T2aA7EuIT48ChDX1jsQudCRi1B8quKgW
         2X8xd6Ugr+sVQ8EKQ6dBGexbbkxWKVXqeHnAWSFg9xCf1JE28o/EZVSyvZ3icSYESfhK
         YUk0WhiK3akB7KYllTWmbWLmG2RwoU7vmVLUeI4aeW0eSrPGM4Cm16cn9iCAfvKAF9Ci
         8vgsAL53gRinaQkTmrAyNdPVU7LGBEnWhs/8NrRkwQJGYvs0N+FtHPKUAv8JMuWWUUsn
         2NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274791; x=1793879591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUwPwLLs3ItuEGtYWzom9wMw0uBhDScICxqoGDVoPms=;
        b=Jvlzt0uvC2Ir6BqtQIgchoiFVvG4W/RF6MTA6JtVc3FEDlyZNcFHd3z79AN2DLXvsp
         cbpkK70YLWblCDDPXvqlTaC7R0Td4nD5UiecwUEt/mazF3hjjzsCKklhlQnOSTXsXpsX
         3ONXYDxxVhDVg7aRXuDZTa7dle89hs6ncgILY7A9hC8ix56XDXKiff1xyAav85bI3MTe
         +aYiNWlDhUC+L2QL7+XFDdN6JMEplXnFK4U0FhxqwSV1D8DKlavmVzdWd+w/psiBEOpj
         Yjk+hSqWmkjVt93tfKyCxoQchPtIsT1ZKL8ENrL/HYK0L6jAcgQIWG7AtQnoPM7DHSTZ
         StDw==
X-Forwarded-Encrypted: i=1; AKwUvByeaVxFHcOaDtRYCSDKqD5r7HkBJxC1U8kFmLXRhI8Im5KUk6DtVwmX5ro20cFE1NfIv+GdUHBTOPQKt9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1rkBMWPY3C9Iy8zGSRMU99IysGGJ9m0KcjgTCRZwSAf+Zcm+X
	tY+IHcqWNgwAZV2dVcm2QmZbgA4NaR/6jQB4QlUNXXzk92hSgR/ViRuW
X-Gm-Gg: AYBFou3VUEfpE9y8dIiyzTNFHxyO/WOSYi29psYJx+rAnzCUIxmlqoXUnPPovpsa6iL
	UH7EE89ejeGgkKvTVI7FcdT9O15Re59K4G/sKWXm9/XCeDESmxhIFuc0jroNKihXD7/Q7wAyZkG
	KyD0fb791OWjIRactWBm0ZeDBij99WS21TH3iL5naSe2GV6ttNTm65PpGih/bqjR0XR/fILB3IP
	gGNuYGaEqgaQSP0vUyUGeW+HueZQCNq1UNPkyKG+XZ2Rt9VDnqu1lwMi/oyyZMNP2Jm8KMr6lCY
	rTgER9WQrynG48LQkz5jDKruuNa1x1IEOXoCqCIrHtW2Rc1jT1fSryVW3qNaNvW3RBu+w+lu268
	hXCqWlYis1orFw+NSjEx8ytT7NZdXL+K6QX1T0U1a0qvS1C4rWo3ljCCB0MiUYJk34hZRII5JO4
	LdBxAiCevOelJf9HDTVcq94EAtMwnHTiQ/Jpu5+zHKqgrEfs8CzKxzuzEwA/YGr93MTOpgIM4kh
	LU/YSe2RxGRMVSdtP6p4ekDTTfaOcshe7LZB6mGSR8bpjUK7UM1OhqMFfIQ03kQKbz9GHsSw5hN
	1umDDtgpjPTVEB4lhdKqfqTknlj5W6SUof6etzhAkClxNHKEawT4El6BJsdoXAr8NU3u9NBaXwZ
	3n05oE8iRNEk=
X-Received: by 2002:a17:906:9f86:b0:c40:80eb:c541 with SMTP id a640c23a62f3a-c49bdd7e2admr460193066b.2.1793274790899;
        Thu, 29 Oct 2026 04:53:10 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm721068766b.8.2026.10.29.04.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:53:10 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:53:09 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Chris Mason <mason@kernel.org>, Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] vfs: add provenance time (ptime)
Message-ID: <auMzpUIEmGCE_x_N@amir-ThinkPad-T480>
References: <20261028134728.294127-1-koray.fra@gmail.com>
 <20261028134728.294127-2-koray.fra@gmail.com>
 <auILs54TUcWXf3us@pedro-suse.tail5790ac.ts.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auILs54TUcWXf3us@pedro-suse.tail5790ac.ts.net>

On Wed, Oct 28, 2026 at 02:56:39PM +0000, Pedro Falcato wrote:
> On Wed, Oct 28, 2026 at 02:47:27PM +0100, koraynilay wrote:
> > Add provenance time (ptime), indicating the time when a file or
> > directory was created. This is user-settable via file_setattr() and
> > retrievable via statx(2) (using STATX_PTIME) or file_getattr().
> > 
> > The semantics of when to preserve this new timestamp are the same as
> > mtime, the idea being that there is a correspondence like this:
> > 
> > ctime <-> btime
> > mtime <-> ptime
> > 
> > so every operation (copying, moving, ...) that currently preserves mtime
> > should also preserve ptime.
> > 
> > Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> > FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> > xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
> > allow ptime to be used with the file_setattr()/file_getattr() syscalls.
> 
> Random comment, but: could this be doable with xattrs instead? I'm not sure
> where I would put the xattrs code (if in userspace exclusively, or if hooking
> the VFS up with this, or if doing it on the filesystem side), but it would
> surely be less disruptive than modifying a bunch of filesystems one-by-one.
> 
> This patch is quite simple, but changing btrfs, then ext4, xfs, etc is a
> mess, and inevitably you can't get these timestamps until you upgrade your
> filesystems.
> 

I disagree.

I think that creation time should be a first class property in
filesystems that support it.

Thanks,
Amir.
