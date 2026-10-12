Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E4738E8A4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781100; cv=none; b=T/lGvq9CPsRCApCXppv1LltM0/CtomYojb4EWykxajhHiYBikig0Q9dLu81qpY7adhjj3IrdK130yKzBq7bVHLkSVlcBugG/RPBrV1n7W9/sPqPv2hkJX73gk1DO0vvn3VXtMCYadA8ckKt7SmQFK7LuMhhObTWc6JlCqna1D/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781100; c=relaxed/simple;
	bh=AFWunX/fdfKk7oo3KH9cElHwI/KXDnx8CXky7Ppjwqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnM41lIuqHiLlBWqb7KUSc9Nh5KSleqW35IovUlUl6CMvnM1i5pnRIxiYMCRtNLJftYSKUdjIe8MKyjcJztmSBeg34wo7ccLS2p3jzGNLfFLyM8lzit0nGnJua8GFG8RBY3SPlZKtFuKRmexXOV1cIMkJOcHgOdywfETRjQ5ZnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1MIrhqx; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1MIrhqx"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3115c4451c8so1591907eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781098; x=1792385898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jt34mxURyUDiAONEdJWn26r9FYppX8tRuTeRjKHWRy8=;
        b=d1MIrhqxVVanPxGAVqLkafFIyW7/UkSGqZ19PXy7xTKwWxRcw/A+4Doxhub0zXiIYA
         0VlP7qhxFA1e+3tuPS3CHqnODxbNcH/GXSDM/cF0dEvs8thsGoq80IT3V6q9RATxWUl5
         +zThmWzU2zLofX2EiOnOIm9EhhZUun5euIZonE7sYNEvypJw1l3Nk8fScSl5fKbkOu5z
         9L3WLzR/7Muu0cpXXLzrkgPz7tarwgOtdVfdeN5kyhG5oGqdDdkCHHTgVnf4UHUIFtkZ
         3xFxgFhGr63aqH+mp+VAqmLAo5s+Swk4Ek9hYUNyzuUB22jlXat3M5eQ2rkZyLjaYcIc
         fQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781098; x=1792385898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jt34mxURyUDiAONEdJWn26r9FYppX8tRuTeRjKHWRy8=;
        b=ikGsptmsNgz3IX1B/9DSz2pGjp49utMWICmLVy9rP2N3ojc9qU27eMXQdroB02oAnA
         /hor4blmWE99Kq6rDJ+fvandKBXnop0gjinpHP+SG1q13qEqMBysbnt3M7+BPwhKN8xE
         GEx2+RgCb/TOfXmf1vtodBAytzY3U3wIgmb4i2Mazbr+krp0WlXMdPdXs/YEn7RdQyW3
         kA73bthGwwO7uCuYA3QOBJx2rWhHQKhyZLzgUCNcJIIfTI2BFcbTBwu2dhBoSFZjM2Z+
         1Zq48XtaNs/PoM2qTEXCLK1jztBNDcIwyGGL4WK1w5vrFAA7j4/0f+P7HeUqPgxzJz6/
         IDNw==
X-Forwarded-Encrypted: i=1; AKwUvBwuyIjdbNRjecsuzsK31HXyyoqE/MPBvbEvolsBZuxrgOp7xQhdIHLwR6HdqU1HONCATUxqWR9+nTXMXio=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+8Wm+5Y6c2qV7ITTDwr3KDNcIqTVqiYt6KJvtBArlCIUhpMDN
	s9FU6na4e1a/J/a2uFmOmZFEAyJfG0G+1Q9n/8sRaE7/igu4cm1MBQC0
X-Gm-Gg: AYBFou0xhQsflbLdnBAe8cExM7GNqN2TM+1qh3mGYr89DNkRbblzEEnyIoy52yFya9a
	EYMzcTsyhfjG63Ml40UIugJNaJ8Tlo36S3Ze3vNyLNjI7oyBaLVzxTWldqp0PaVSMO1nisGVBmR
	V9z2AtpzcIAsA+hGq782eBBO1kGRKYJ+2RDQhgZvtrRTmSEb0a6hV2FaViYVGK7+S0TQ7cm+CWE
	PN5vJrTWxP/+cZslU4DDRWBrwR4Ipy4UoV4ORWU/2p2H3uyCu5CZ9t3EUt5rVwbCeYkrECIJ0y3
	ZvAkqPDK68tksiv+9fcXFTmLYrLqGANJIQmGsmps/5tsKbhSVgemFGONHhDWdUlEUHGTZAHGm9U
	7rskBoLOfteVnk1/it5XPosLeLQVUtyYov/Q8+HjUlMqLc1E0eTpXDa5ChDmRz4YoCbpbOyhqMq
	D0eA4dqQa1WmydM9DUPU1x3N/vlcc2EakHtdODWUxjj9BL+9vFKzevZYAYfDzXuxemawTMGMH3C
	k73gIVWtTAycerXsX2gVMexjFnMDbHqXNH7qQ6A5C0h2TOLdvc+/DV8h7iSZ1v3gP10PoViNaDP
	FKIZmXpGrQxj4Dq7v/c8VMJ/tJnp21/lTLQRDs8gcIfE0KyQQe1+1Z9GzgvLXIV/u/ULl0Krh+f
	WjYcVJ3gyXlhSIHOo2bnkl59/rlqM7y0BALeGt/bSVJrjyhAxNMU9UHI=
X-Received: by 2002:a05:7301:4208:b0:351:2f0a:cb2a with SMTP id 5a478bee46e88-3535f480bd0mr10661101eec.2.1791781097875;
        Sun, 11 Oct 2026 21:58:17 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm29359039eec.16.2026.10.11.21.58.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 21:58:17 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] block: only use the cached zone report if BLK_ZONE_REP_CACHED is set
Date: Mon, 12 Oct 2026 10:28:11 +0530
Message-ID: <20261012045811.47473-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e146448b-5210-4215-821f-181c91625141@kernel.org>
References: <e146448b-5210-4215-821f-181c91625141@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 11, 2026, Damien Le Moal wrote:
> Can you reverse this if to be "if (rep.flags & BLK_ZONE_REP_CACHED) {" ...
> Also, the condition should probably be:
>         if ((rep.flags & BLK_ZONE_REP_CACHED) &&
>             blkdev_has_cached_report_zones(bdev))

Reworked exactly as suggested and reposted as v2:
  https://lore.kernel.org/all/20261011154018.48913-1-jain.sm@gmail.com/

blkdev_has_cached_report_zones() is now used from the ioctl, so I moved
it (with its comment) above blkdev_report_zones_ioctl(). Patch 2 is
unchanged and carries your Reviewed-by. Retested on zoned null_blk.

Thanks,
Shashank
