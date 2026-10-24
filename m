Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792859349;
	b=NPozgCaWkrkUgLcWXJ7yHACDkJ5RRz0sykGJ29ZycIC1AZD3UuwKvQysNzFvT7ZXuyI3
	 dfI/46TV0hAQrGiuoj4fv2hM8nB+2CHMaKLlUkrXotPgaU2mRsuvmPwKUS+6V/sp2w8Un
	 xjP1+L5DG0JrbilAeziFR0+U7dz43uxA8ATJgHfX05qTCc19MncoM4pDPodtS3wCBB/rD
	 N5+WAZxYEOdKnRzYCckStAoQQE3wCg2vvbz5FCeROqfzpJqFl9eUppWuYSV9w5wvtMSNO
	 cXSKvvGRyv8ztFJOX4PdyHe3LHJSKNaB3KCQ3YVISPk1gAPB8ya1n7DqBgl4Q0dOijA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=llsgWckxU6HrF1Oq7gERdngWWd2BM5NRfeUcsEwDim4=;
	b=kHMQHMQrBKd0nGZBlxEizYPMxwOWkjxC0NJwWCid8ZrxjW4lZ9+AtMv1G7UC6nVLBg6N
	 yYCY7Vp2sbnvsCgts508kx67JGwQ7mUkhmbrTih6WYUZ6c2P3i3aTx2rVZ34yLdt2YTE5
	 PT18x/hTw+jeTneE0BSiHxM6YH5NjZZUS0GfS+o5FXKkdAHjjQC5WUae4BTUM8ujbpo5x
	 RWkswuoVxltQwMr/0nYBWpjVEb7BG+0lj9TZ+VakOIgf65F4Alj47oMsme5joBL93mkT+
	 kldcGc/kRQo29IFYTWUdHFcgIXEZS3+mGu393MAJY0E45BVxVpD93TfY+Ur/NLvqRhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Nmqafhes;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BD5606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BD5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Nmqafhes
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35f036b17easo3875287eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792859347; x=1793464147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=llsgWckxU6HrF1Oq7gERdngWWd2BM5NRfeUcsEwDim4=;
        b=NmqafheshdwPak0EWBNwAofN8AZNgmQptxYh3iGuiskd4q9UV02Q5UGh/oeX7f6FAP
         hsww53lS37P3JAtMBHk1Ke30ZUyjQ970syUPgtgen7abOm3OdBvvHzNhQeSS8thBBjN2
         SC3HNizvps20P1by+xoZcccTn9VK6mlBWX86kM9SgLixrnZqkm2a15VPLsC1r5akYpOd
         GbFtf6SAKcIIaCFJLHlyrXE7eppDpukU3KNhEmWL7AFobu0iXnIDJT2TSN8h/2LThiu3
         chbxN23xEius6S8t10nOzv38wj/umbcr/Gbh4ewd8+Qxc1HolXYT5oZhHgwwouOLAZCq
         SWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792859347; x=1793464147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llsgWckxU6HrF1Oq7gERdngWWd2BM5NRfeUcsEwDim4=;
        b=oyuWYzaqOvCFQPfIF1Jf3p3lWlAGiv6U7wD9fJ4QkOEObDTsfEC0y2xbcHISYs+/4V
         HHn4n+MN+AdHZDfFgzLXpVIQbfaTW3NABUPv/I3DdHxJyeOnwVeTLa9IVBilMNgu1Fxh
         nJ9Y0oN2R1DAac3/OOZPMz7bFf709eQbbzVe7lVzooXfpwv+2oOZoZeWWaQt0iJh6Ghz
         XbTCc4tV8OM9B4QMzIHBZa1oj6o4EbG/YvFoiCmmSP96Rmw+2T5GP+AbJFpO/O6vNp7Q
         nddnanks0wcsy5zKFAwsyf95rQ+VFlQ5YXKrWnVHFo68L8UbgqpuC7Sujl4JD3goz9AH
         xUFQ==
X-Forwarded-Encrypted: i=1; AKwUvBywYbJ4LyfAP9/ZHysrv5bX9O9Ok50BEwWL7angpzxJeErYVkUN4qkoH344j17tqMyMZW43d+gELS4KvrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoizNXh0ePlOayEGKUT6UxOvljVERyFw1tR9oNFcP5DmUbtkfm
	OEO+BsceXXzfhD+ZzxGcQcN1PbXSWYqj/WjWQEJuv9y9VvudA0Fw99LUtLQFhwO5U8Q=
X-Gm-Gg: AYBFou3Y+fX8BxvYw/Qnim7e7A8SJ2mou+D8/w03sHddI0fLiDLTQLkWMdwHu+zYtQ5
	ccwFl4DYTrFbnu/G8MMTUuE4IdZDXNRpTcD66Y9E41RyfEnRkemXzYlyH/qZAin1Uh2p/GHQFeh
	KJyLFbLv2e4G5yTjrXIWZ2/Xwq1q9lmFy6dZHbu4nSS55vjYUF8gt3Z/N5M4IZUX2TA8oYvzGog
	7tJkeZR9uHcpbHLnSw39Hj53Mhh2da/Y/vZIcwQxh63OGc5+W3LEwPVjuOZiG8JdghKIdJe2JXg
	NKHPMNlh8oZ6IOwLPV2gH7WbUnMvQ3H4bGn4c3qdJWXfph97vJGaKKjybyIfqW90SFusGSZcGG1
	dkv9W3dr8Wl+Kw0sUZ+ZRtgS5KB5+IEGrMFqjZP72kMAfLCO/iy74BITYr4fKCB9YvmEQGm0vRM
	X+kGqOtiUwIeBdAnBIr69QSeNtFAUftyk8HASTgNjNX+/vQNKq+Ffwm+kGRecIKGKv2NjNI2T6C
	yX/t6GZ/DWikCQ/hp4Ie6GH1n5AJAg6U5a7pEyMUG53BgVRjsEgTbwdWoRORKsyyhE1RqJXeWig
	NgVycTZs9fBhgQ4t/N0GB6wJz2bjpKI9lJKoM+TP1jC2mrvCo1oMCi+fhei1Ds1h
X-Received: by 2002:a05:7022:220f:b0:14c:aaa0:941c with SMTP id a92af1059eb24-1993fba154cmr5334530c88.35.1792859347154;
        Sat, 24 Oct 2026 09:29:07 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm7192350c88.12.2026.10.24.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:29:06 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 0/2] RDMA/srpt: fix the indirect descriptor table bound and the context counters
Date: Sun, 25 Oct 2026 01:28:50 +0900
Message-ID: <20261024162852.3528224-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

Both changes are needed, and they fix different things.

A 510 entry table fits in the default 8276 byte IU when the additional CDB
is empty, so the bound accepts it and the counters then have to hold it.
With only the bound, a conforming command carrying 256 or more descriptors
still wraps n_rw_ctx and leaks every context it allocated. With only the
wider counters, a command that sets ADDITIONAL CDB LENGTH to its maximum
still walks a descriptor table that runs past the receive buffer.

The two defects also come from different commits, which is why they are
split here.

Changes since v3, both from the review of 1/2.

desc_off is a uintptr_t subtraction now, as Bart asked.

The room check is gone. It divided the bytes left after the header by the
descriptor size, and the division truncates toward zero, so a byte_len one
to fifteen bytes short of the header gave room zero rather than negative.
A table_desc.len below one descriptor gives nbufs zero at the same time, so
nbufs > room was false and a truncated request was accepted. That is
Sashiko's [Medium], and the v3 commit message claimed the opposite. v4
compares the span the table occupies against byte_len directly, which needs
no division and no sign, and the wrong paragraph is gone.

2/2 is unchanged. Bart asked why int rather than an unsigned type. The
values are counts and never negative, so unsigned fits, but
rdma_rw_ctx_init() returns int and the WARN_ON(ioctx->n_rdma <= 0) in
srpt_rdma_read_done() is a signed test, so int leaves the surrounding code
alone. I am happy to make both unsigned int and turn that test into == 0
instead.

Link: https://lore.kernel.org/linux-rdma/20261022143901.2991062-1-yhlee@isslab.korea.ac.kr

Yehyeong Lee (2):
  RDMA/srpt: bound the indirect descriptor table to the IU
  RDMA/srpt: widen the indirect RDMA context counters

 drivers/infiniband/ulp/srpt/ib_srpt.c | 11 ++++++++++-
 drivers/infiniband/ulp/srpt/ib_srpt.h |  4 ++--
 2 files changed, 12 insertions(+), 3 deletions(-)


base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.43.0

