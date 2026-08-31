Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE41270575
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788137249; cv=none; b=j5/QcMBgiJ3ul7/ap8+KZmCTTjC8aWrxEHCYxLkdbpVlfJCxaTeIgeF41dAlW1vPjiM0ExvAZSxDTsXwPTqzOFwzpC3JCzRbQkMSEhyrW9jrLHxjnTwZd2UtPt3IgQbLf7mXufutN5Ejr2DynChuDTHcoIgfZZzBo2T1hrPpwBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788137249; c=relaxed/simple;
	bh=MQpEu3wDAHZbqdrzHyo2zLigoYyYqflCjqnCr9jAqkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QvFOhwf7NqTfXZBJ+P7us6Li/U56nGNDo0csBCQc/4iSdd9jB3/+96v3sVgeimknMmbN6jdv3triaRPuHR0Gz++XAwDgVukeDYy1SDu/h+TocdofhPyuanrTfuCk9ee5yYp6oziaYkCsly6KCVOGN75mky4ERAA0EiKAt1qJ2gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTOl0lfW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTOl0lfW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398ba166ce3so959623a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788137247; x=1788742047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+W4QAJjuVkYQEhPreimIx5fbHXfcE4i26hZPrxZmPw=;
        b=sTOl0lfWB+j9Z1+HhiIzgWqta9eoVGPwE44bsv0bAAVGo5YOp3/I1/HdMwrMHmsR9T
         Dwsflgf5gV5mMIWXtRzTcDqxY6d5G1zhZE3WaQM2KxEe6169OYLUNIoJQPbM4ZsyPdZu
         JBHjWKIzxqtTU1ldExwzuXhlxT8c3DzJpK33b1stIPUKPfhPjQWNTtgT8TGR1vw2lzKD
         rGYXujpudf6zrubAz6T9eQwVG+0u3+jrkRCzDL4jD+6CcdEbCCWE2gi1Zbhs+h9deJJV
         TRzu19w9zIAH49WQjoDykoVMnYP6rARQqdXWBFfDPnKw29PpeFrUlnOQoTuUbZvac1qO
         NpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788137247; x=1788742047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+W4QAJjuVkYQEhPreimIx5fbHXfcE4i26hZPrxZmPw=;
        b=UIpXQdmnUR2hJKviHe0x/i4iSR5Kb9eak1vxba8bXlpjoP6fZaBIFV5E+na3N4AmQ7
         Qn1t8ruYXgDosH2Buum/D4ce/4hE+O59D6mLfc1NF4AX5UNaQnISjHlsKJy1h2PBTkcy
         UQw2YJsDArx6WJQkq49lycQRwchj6MmDLRQ7clFoH2OpQGnmIX98cs6G5/PqSWCakXSM
         Ud0zUmeRwCQfJunaH/YjeKPwHy1DdHckNlOW/sK3yij0c/u4L2RkWFSSfznZ1sNp6Tke
         DyavPHUqaeGnj68B2OK88Px8ZC7U6ZIstPd4Gr/GPK6hQp7IH4wbvYKRUN7f36/DCDfe
         p2ww==
X-Forwarded-Encrypted: i=1; AKwUvBzpUtbAStNptHHt9PWxvuUzNxKymmvQJVjFYzzaR6jHTPvXArS4aS34qMqdQcGRL9aIDi+DwX1m7y8pdHk=@vger.kernel.org
X-Gm-Message-State: AFuF++ksYepCyQiFh+RkC4z26ZfSBFQiLbbhJ5k9Uf48hELmxf3cEKpD
	BSXR0lOEuZjZd8v5iOTGRot9OpugHGgdT1day3yFzPRshV61Xm9vF/vxYTLBuA==
X-Gm-Gg: AYBFou36ZHcYrUh7v0MFa1lcbYRUy/PvmoQy/4teyoXoBEgE8AjGXuXWKFHwDF6hvMI
	WEvooIaS90nqKwyYI81mUUFDyUAH6qThySSLowAKSfUax8L7AgrOY5xZZm2QqNIMHuLP3aNRLII
	9vEWf+BAdxHsQeLI1glrTSjoYFuuA8F7loNOpzViyAJ1Y+FGEve7D6diKegi+QbaOPHYqZjzMYY
	XC0arSWG82d1EfBUT3NCHt6ZHV4IwmpfSZErSOA0oBUWBG0yKtWdlei2IuRK3FBneIRoLzY3HES
	DiqvE8kUjzgW+mXZsMzVJXaWrpY8ynk53yKmxb4yGfTrLejqz20v5V8WLXkYp0LlMEUThDIuur7
	sXg/LY7Qei2WGP+ibxX+ZsMjsm8Qe1QyBV6sZYHH5vgJbjMAX5nW96v1awHfL6RTkybXg22DJXJ
	ZmVZKYE3oJodMfbgr7en+1Id+l2cj7Z8SK4BpJ/eQxniXyoTxCHvz4NKXOvBeobh+ve0uhC0+1q
	aAnHQuaOUzuZm6o39AG/C2APiuK1yvgzXozqTMqnAHq01xU6LsLa3w=
X-Received: by 2002:a17:90b:3ec7:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-396d1041324mr29242537a91.16.1788137246849;
        Sun, 30 Aug 2026 17:47:26 -0700 (PDT)
Received: from lima-xfs.. (174-126-236-85.cpe.sparklight.net. [174.126.236.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm13688653a91.2.2026.08.30.17.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 17:47:26 -0700 (PDT)
From: Eric Peterson <linuxinstalled@gmail.com>
To: Dave Chinner <dgc@kernel.org>
Cc: Eric Peterson <linuxinstalled@gmail.com>,
	Carlos Maiolino <cem@kernel.org>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Peterson <eric.peterson@hpe.com>
Subject: Re: [PATCH] xfs: add per-mount read/write I/O completion counters
Date: Sun, 30 Aug 2026 18:47:00 -0600
Message-Id: <20260831004700.4072037-1-linuxinstalled@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <apSgHPl4er6Jy9xi@dread>
References: <20260828033429.4070267-1-linuxinstalled@gmail.com> <apSgHPl4er6Jy9xi@dread>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 31, 2026 at 07:26:52AM +1000, Dave Chinner wrote:
> Hence this really doesn't seem like something we should be trying to
> infer from indirect filesystem stats. Why can't you use the bdev
> stats to get the actual filesystem wide queue depth information?

The block device measures the device queue, which is a different
quantity than filesystem outstanding I/O - not just a lower-layer view
of the same thing.

Below are three cases where filesystem queue depth is not what the block
layer sees:

1. Cache hits never reach the block layer. Under a heavy read workload
   with a warm cache, a large share of ops are serviced from the page
   cache and are never seen at the block level. Device queue depth can
   sit near zero while the filesystem is servicing a very high op rate.

2. Filesystem ops don't map 1:1 to block I/O. A single read or write can
   produce one block I/O, several (metadata, readahead, writeback
   coalescing), or none at all. So device queue depth isn't the
   filesystem's outstanding-operation count.

3. Work can be outstanding inside the filesystem before any block I/O is
   issued - waiting on locks, log space/reservation, delalloc, etc.
   Such I/O has entered the filesystem but is invisible at the bdev.

The block-device queue depth answers "how deep is the device queue,"
which is not the same as "how much work is outstanding in the
filesystem." When the filesystem is just one layer an I/O passes
through, the block stats fold the layers together and structurally
cannot isolate the filesystem's own contribution.

To be clear about scope: I'm not proposing a queue-depth feature in
the kernel. The change just adds read/write completion counters to pair
with the existing call (submission) counters, so userspace can compute
outstanding I/O and derive a response-time estimate itself. The kernel
side is only exposing the complementary raw signal that's currently
missing - calls are counted, completions are not.

Being upfront: what userspace derives from this is an instantaneous
approximation, not a precise time-weighted queue length. It's meant as
a cheap, always-on aggregate, not a replacement for accurate per-op
tooling.

Does exposing the completion side of the existing call counters seem
reasonable on that basis?

-Eric
