Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309812;
	b=NLlQ4WYsxEKpHHn9G5Hxge+QrUCSnKPP7p0vzvFBMmp5Q/WbHPoPIbhNkG2T2wDao2TK
	 ilHiMDkzNeQlsTvMRKBAF9KJizMwZrca+dFCDDwf0+z41Nf9PUJjKVZoF9c/3hPpPg18H
	 3Jq9kxRqSwc+Gk1KMobgK3l1pNLUS4oIWyj9SHv9s31L9Adm3JIm38+FXZ63MUzdOA1SO
	 ld8T05M3zwFwUXAML9B+8QPUXhgLkv5OgRSq+Y/HXIdx42Mn3d0UkAz1rpYpmOqI/dJzU
	 AZ2oMbw0pw+FBsP4IwCXob3b4MMuirRAIFn7+dHrzBoKy/sB7RAcSspaY5otj9ljRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309812;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DGq51QJrQsvY2v7g8/tGIwgu4Arc6xoOnd1DO44Z1Sk=;
	b=rVIHQVdMQHAE+smHWRSgoKkKZrmQGsl+p3pBIWyVPQTgMyqPmsG2S7jDMDzEb9vASIlR
	 BdvBF7fqjbc71M8pmr5GSpnkGxplDqQ/1GBcDDUrXxZE+BVCssWsmbO279vJ0nWHCFxup
	 vW43v0xT2rwGK42iqUlzrqrYmWtjTzH9DZKRVj//7SvIyQTvpHaP0p1DBssu0FePtzLg/
	 zfkkMYR8RAcWRZ4uEalXYnaguglr8vbT+37haAY5ffwzXf6PKlmRrHEkAzyhGmaR9Yer/
	 sPoJSyev24PZB0/FJtu+CCVi7A9vxVj4DdLMOWLfNa/jumhaKUQf/Gz/Ilk5zlxbhAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0zmvyTZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rRbconzt;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91659606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91659606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0zmvyTZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rRbconzt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794309810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DGq51QJrQsvY2v7g8/tGIwgu4Arc6xoOnd1DO44Z1Sk=;
	b=a0zmvyTZsoR6lst4JJ3XE6hF+X6ne/wLk677jvnTXjWXNTDFrmQkPi3xHZ9hRogNrgDwCt
	8L07Vx/0fkdjyIjMXjA8WC09YNBPtNdQEgbPCK6ub3bdFWEVl6Xa8EShO2M2f9e7e/c27O
	i9IZDIDCPhxEKlcHwqc7rHKY1klHZlI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-hV7LDJgFPC6TXUXd2vz9GQ-1; Tue, 10 Nov 2026 06:23:29 -0500
X-MC-Unique: hV7LDJgFPC6TXUXd2vz9GQ-1
X-Mimecast-MFC-AGG-ID: hV7LDJgFPC6TXUXd2vz9GQ_1794309809
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5383d650f2dso39998421cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794309809; x=1794914609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGq51QJrQsvY2v7g8/tGIwgu4Arc6xoOnd1DO44Z1Sk=;
        b=rRbconztkoMxAoXmr4b7yOde5UMlxpUrCIZ8miBpo06PV6TzgX2Ti1KnoJc2v522p8
         pgHcFvc1Sdd1wwV2QavbJiabwXZz1mwjpIVec/vLo8L+2f4+X3ZI98kPazV/sxIdXpLP
         h/Uuk4cIqIs47O6XdZ6ucwPllMwPL0tHnznLg5AswNggzhgBq2Zbp9S3L8hBxgeeJ62h
         QTbAHwafZe0qNdqsCPl/9EZbALFHBeqxhvaDH0xyAUkeNjl51rbgCZYy5cJYps+EVMhH
         +KbtG6Xnp08J6LqvaRw8SK86J4DyLRc6HQ0wtxY5t6emuvveAM3n270esFEm8pG+0FeJ
         OLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309809; x=1794914609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGq51QJrQsvY2v7g8/tGIwgu4Arc6xoOnd1DO44Z1Sk=;
        b=cOR4xNkI9mOc8r+EtHZ4eYonEoWuvW8Fnrenu2HAM7XNuzjyj4PlnXhcKCWTfnogaj
         9N1aawQ8SmMgoLYa4SgYDGCE7zhTRPbyxLwDquGp41tpbEZ94eglWU8AAq++csnZi6AP
         I0YfpFpOF0uTde5cafFKsSuIQf03FOxTeV8ySnyobZdo8w+oHMfSRUbAJgwrkDeiRWQ3
         XBJNObmzLphbhekSOydRKANJzLCN5xKtm3AniBdB3juNy7P4vvcCmwLqOQiKh8MHKqPn
         ngItVI1KilShzs+k2axMx3N/t6mAtekOxhh+MOt64stHyRrNohafeImRtMR9gYBVe4yk
         5F1Q==
X-Forwarded-Encrypted: i=1; AL+hErE33aNv3IHgSpdb7QUcBYrhOW4FYkHtpsBXb1FC6b78Vzzc6BFDgFHPb+2VaEf1y+CIHv0wSlvH+Xhe6z0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qnktTH10iTlTNKz9GcOUJKNGrxFLXpDcdobR7p6DSwU9EFG9H
	Q/0u2VVHhgZAcIs4oaViw8OGyCAIl9aqhetYFMlsFR8oE2UOQ6dtc8lxq6nsMpcW+10OlfGb5yD
	/yqqc13WAImjWPQKxdIDZ52bMe4Qdy5Yiu9cKvLbe9wCrxdG2LW7gyB5cs0+culAt9g==
X-Gm-Gg: AYBFou2a/D4+UBtcpDOKX3COIVxaXXE7OGJGIQdf4eoqx6Z2ZHlsJWprMKhNkQCrEXy
	JaQ7YJf//c9M0t1sDpCzKt74s+5M8sgFYzB8PVTWpMd/klb8aqetytYsJPOEYxGXEgVuSdd/IxJ
	fSGd7I05lY07FULIPtyhPE5H1+bROWR3LVxouJDErPrWAO3bFwlhLx0GZHOCM9MC0Re92umcM7o
	mQM63bPMZUGNO8Qr/PTi78W+736HU5vZN/zcqTaE+SY7yi5ri9+bMcEE061NpJE3/Mz+eqQFyHR
	VKJkuK4L7I6WPbAVzsHdDYyrNJ/go4ZzW9XhJ3sSyCLpdYV/9NfN2j7tYnV7mIlQowsVkgDlZq/
	eOTcATZRgAiUBppho7k7BxwIvUReECJmHiDvSYvZ361T+Jtl0wKcgkmLSUl8SVY4xvkhU4yrfqs
	jMNKIDrBZcdy8GFcbOy9v80D53cb0sT4yBYvu/Vxh2ixb4R+1GAL3yYz6odi+kw+/qcIOvp0zqU
	B9vf/lVolmAspWCAQUNjYFAXB/rjppQ0DiAtqUSYHjX8maW+lja
X-Received: by 2002:ac8:6103:0:b0:537:636f:b31 with SMTP id d75a77b69052e-5552a45df54mr30141131cf.73.1794309808550;
        Tue, 10 Nov 2026 03:23:28 -0800 (PST)
X-Received: by 2002:ac8:6103:0:b0:537:636f:b31 with SMTP id d75a77b69052e-5552a45df54mr30140831cf.73.1794309808077;
        Tue, 10 Nov 2026 03:23:28 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04e7315sm18569186d6.22.2026.11.10.03.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:23:27 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 0/4] net: streamline skb_splice_from_iter()
Date: Tue, 10 Nov 2026 11:23:21 +0000
Message-Id: <20261110112325.3263078-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

skb_splice_from_iter() does per-page work even when the input describes a
contiguous range of a larger folio. Adjacent tail pages have different page
pointers, so appending them separately also prevents fragment coalescing.
For ITER_BVEC, the helper first builds a page array, then walks it to append
the bytes that the original bvecs already described.

This series removes that redundant work from the MSG_SPLICE_PAGES path
used by sendfile(), splice() and other in-kernel socket senders. Contiguous
folio ranges become fewer skb fragments, with fewer page-reference
operations; BVEC input is consumed directly, without the temporary array.

The patches separate a correctness fix from the optimizations:

  1. Make a zero-byte request a no-op and restore the unappended iterator
     remainder after rejection, preserving any successfully appended prefix.
  2. Group contiguous bytes of a direct-mapped folio, including across
     extraction batches and repeated calls. Representation-safe anchors
     and wide endpoint arithmetic keep offsets and lengths well-defined.
  3. Walk ITER_BVEC segments directly and advance only by appended bytes.
     Bound the request against the unsigned iterator count before assigning
     the result to the signed return type.
  4. Add two KUnit cases for append/resume and zero-length/rejection
     progress, on both the extraction path and the direct BVEC walk.

Grouping stays within a folio and preserves the append helper's ownership
checks. CONFIG_HIGHMEM retains actual-page, in-page-offset, page-bounded
fragments. Software checksum traversal remains page-aware. The caller's
byte-count and partial-progress interface is unchanged.

Performance
-----------

An alternating A/B of the folio-grouping and direct-BVEC implementation
showed lower sender CPU cost for sendfile() from large folios:

  sendfile() workload                         change in sender CPU/GB
  64 KiB folios, 64 KiB transfers, full speed          -11%
  64 KiB folios, 64 KiB transfers, paced at 1 GB/s      -5%
  4 KiB folios, tested transfer/rate combinations      -3% to +3%

At 64 KiB, large-folio sends used about 2 fragments per skb instead of
about 16. Single-page folios retained the per-page layout, providing a
control for the optimization. The large-folio 256 KiB CPU result was within
run-to-run variation, rather than a resolved improvement.

The measurements used a Linux 7.3-rc6-based evaluation kernel (532788178)
and virtio-net VMs, with interrupts pinned to NUMA node 0. Each
cell had four runs per kernel in alternating rounds. CPU/GB is whole-host
sender CPU time, total minus idle, per GB sent; received data was verified.
These measurements cover the earlier implementation of the optimizations.
The present revision adds iterator and representation corner-case fixes
and the regression coverage described below.

Testing
-------

The mailed tests are two KUnit cases, not a broad ownership or coordinate
matrix. Each runs through both the extraction path and the direct BVEC
walk. One appends part of a multi-page folio and resumes: payload,
checksum, fragment count, iterator residual and ordinary references.
The other checks a zero-length no-op and rejected-page rollback with and
without an accepted prefix.

Those cases passed on UML, with no skips. The focused build used W=1 and
WERROR=y. The mails apply to the stated base and match the recorded
intermediate trees. This is not a KASAN run, a physical-NIC test, or a
rerun of the measurement above.

Together, the measured reduction in fragments and sender CPU cost, the
single-page-folio control, and the progress regressions support making
this a generic improvement to skb_splice_from_iter().

Thanks,
Alex Markuze

Alex Markuze (4):
  net: preserve splice iterator progress on rejection
  net: skb_splice_from_iter(): group consecutive pages of a folio
  net: skb_splice_from_iter(): walk ITER_BVEC segments directly
  net: add basic splice KUnit tests

 include/linux/skbuff.h   |   3 +-
 net/core/net_test.c      | 170 +++++++++++++++++++++++++++++++++++++++++++++++
 net/core/skbuff.c        | 141 ++++++++++++++++++++++++++++++++++++---
 net/core/skbuff_splice.h |  34 ++++++++++
 4 files changed, 338 insertions(+), 10 deletions(-)
 create mode 100644 net/core/skbuff_splice.h

base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d

