Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com [209.85.128.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEEE4C957B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601148; cv=none; b=JNIscOBZOEeyTXMmzJk/WzlvRU9sERbgd3uB27BDzFmfoFUy1cflw+EMMSFRrkMwavoc6kxHFEfvvHlUrYRNvR2UXihm/EW/2Dw+LaqLV5PnDa+ikgOtPcQ0iqutyCQv106BiPCZtSK10ifKzqOv94HNRff4R5aoEE8/qPkocFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601148; c=relaxed/simple;
	bh=abZ+0AvUY4oazPRqaXspWDPFpaIpjOBE+mBXBPZkJLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tD5UmjBf3PgUxCVziziwbsN0z4pVzE38FJ3b7/R0IXtGyC5q34lSo8t2k4Az0imv9tImdmqpUKGEy15UXaEJeEQieUEGNLd0wWDYlFKIou69XLkx8aj9DWtH78/a7hAHqd8U98MxMtXBIlom+5gZKTQNQV/sGm1eOWvPXmjQq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=Xf72g0Hz; arc=none smtp.client-ip=209.85.128.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="Xf72g0Hz"
Received: by mail-wm1-f98.google.com with SMTP id 5b1f17b1804b1-49e73611928so927895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1789601145; x=1790205945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPMmzeMGw5inM8GWwOz7lS3Of5P0aQnoyqgcSMcVsuo=;
        b=Xf72g0HzpXjPRHx/aZbRnuHo7gLoR9zyhVlhb6+DSotRD3cjWSKzlmDIyR4mjbXjG4
         9+kE0dy0h1XQN27MlrUc4NgMYzl53IzqfY62FozdGeMPBKEv8MtfA4OpaAnAetrkp1RG
         /XDmX5YPdS/EJuYlFWZL+x9zX0qcjjV0WBSdE1wlLA0gwvtCK7g/v0M7LihfmxajNbm5
         cqS+3nlUevJHEJHD3pBYNAU+6AxGvYTzJYDbV5FALCPLK7ip3pTguriFFHqfDPQ/Vl1y
         3yQs5qS5rTo88jlYVNbniOL6Y9Y3OWpYn1mKeEC7BGpZPb5kRcJvz+gilRIpBrhhCE89
         zhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601145; x=1790205945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPMmzeMGw5inM8GWwOz7lS3Of5P0aQnoyqgcSMcVsuo=;
        b=SaPM6AHY4rS9ONre1zYS+UEahWMTax7TfUeGQSqy+fjpvQaGW05vsNDvjkcTTWbGZK
         BkvvZhm3QRvKAlDqjGajjsarKN7GdI/sfPm9jGtKwp1pRP0LiNZ2ullRPk/I7wNAN9bg
         rzytKXKjgzTJ9BMYlokTgXurXZHXX6GIzXsOYBtmWApoJfTLsnkxmPtQ7tS4Mi4+Akrw
         n0LlV6ZKRA6y9UgefBdQPmFbXR5l4vsryR4wF0C3BuWzi3LAUtzbZucrNQ4w/ZlR8YpH
         eCC6wVzbbUiq5yMkMPnOxnPK6UJfKfOuJ4Rgp70DcqGYvgLzDlSsc6FpvmnU1TdQgh9P
         hBUg==
X-Forwarded-Encrypted: i=1; AKwUvBzSYcW1kMjWEgS3MHww2agEqsfJvyvc52hfclbJyOxFgGySkHEd5sWBOpY/fJvQTYeyW0zVZaAWejAvQBc=@vger.kernel.org
X-Gm-Message-State: AFuF++mFu7wTEeO1EczeLz97RPL8OPNs3izpYzV3bCNclb4N1L0whpZ4
	DqbK8aTHd4gX8PEOErQJW47DvHjtPxAUxKGDfBn7Zar8WPwymZVX/lQpC/f2hCJ9e2vwOQIbzXl
	miHhP5CghNHny2dX0WJgBucq1++2poCFmCUlE
X-Gm-Gg: AYBFou1HzvGplXoVMH5SS+Brh8V1z1PEp8he6AuLCYUDBHEs/ZaO1BYzN0piSd/leL2
	ec5Ut1JgqghkfxVjTPPaSINs5gMqlPhKSxoCn6aXZ2Sn3YNhMCw58kqz2qDQY1mKGmLzfNqKJrx
	wkoPcmYu5fh5nKiFjbdUhmiNFJhsi5ua4hHA/sJ7TorvUIqmdkSRDe9QCX7EhOR5hOHyfwmuvVH
	gZR4TqtaFNXp1oVsgJbW4clYwGkkkibjnk+CkXt7zG8zlMmUusssiOlRXjKMG+2kVG42SfIAawa
	esvofL1cjIyoi92ePNRzOwCDJ86akoNEplWFhsXBK0Z8I2nKe8vmL7kTKWx6+JPClpDLcMHV+Bg
	8+SezMf6docelLPoBEqzLraM11faacDrTWhrrIyo=
X-Received: by 2002:a05:600d:8643:20b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fbd1c9005mr12325555e9.7.1789601145442;
        Wed, 16 Sep 2026 16:25:45 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-49fbd520ad4sm1982415e9.1.2026.09.16.16.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:25:45 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id D574934014B;
	Wed, 16 Sep 2026 16:25:43 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: Re: [PATCH RFC 6/8] SUNRPC: Reduce rpciod workqueue contention
Date: Wed, 16 Sep 2026 23:25:43 +0000
Message-Id: <20260916232543.4100078-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0e2f9688-097c-4bb9-a7ec-82b41bdb3653@slotpi15m67>
References: <0e2f9688-097c-4bb9-a7ec-82b41bdb3653@slotpi15m67>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I took the SLUB side of this to linux-mm as you suggested:

    https://lore.kernel.org/linux-mm/20260916232227.4098143-1-tmenninger@everpuredata.com/

The more careful reruns also resolved the inconsistency you pointed
out between the perf-lock wait time and the idle CPU measurement.
When mpstat is collected during the same 10-second perf-lock window,
the machine is almost fully utilized and throughput drops
substantially; without that instrumentation there is significant idle
CPU remaining.

I also collected cmpxchg_double_fail over uninstrumented 10-second
windows in several NUMA/CQ placements. Those numbers are included in
the linux-mm report.

Thanks again for helping separate the allocator behavior from the NFS
regression.
