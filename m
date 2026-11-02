Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600387;
	b=hGwsb/t7i1WVf6epjCCId0FUqz6Ho0gVfMiaCf5Ll9z8TKXUXsD35Gr/LNu1cuG3bxoO
	 /Xi8f0WzZJEnKGyHnJ0TSBq9rKME23uOPYGzcxU7RVaKiWRlWAF/YABBeQqGYjCVM3uQl
	 ymfZJt/wcvbJSa1kly+8h/Ers1C9rAlUwKefyTEuGXzPa3ZdYoBXgv8ORzCpHPW273OKZ
	 7wp5lM5zl0z43012UqeNwkd9SexuXGAGGLhi2/X/+x0cBlhDvdTdoWr15tSA4kfMEtE2/
	 V7rkUNPxWb7bgcE31P7FU8rRmOm1mozYn15pQi/48C6fHIOJ0XmpHIVRs+v39Nqn1iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hhQA2nqnfR/ndnC07pGNFH3CL1SQgHrxqNYm+C24yjU=;
	b=xIxzSBfIhOvvUgULxjeOyqfdqM1OZP/ju0qV6LFsSBNjOvH8k5e/ESr8UeN66tSxmNOS
	 p/jTKjxIzi0nP3dRpYaVM+HR5c3hk/1KVkz6ZQPp5Rj3SO9HEe1uC+BsBqCFLUrss0qhl
	 IDwmRmpPuhart6mQOl5jUPv526aQmF7uaggXcJFwo9u5oHzUzWwRyYfOSDu59GrN2e/VP
	 SCHtAyaYWq6prpXm5bW+KmXCAbPBNpLuW9oYoleBnpUW2kdL55wio3nB5DZ6PjeDQCeO4
	 IQA8K9DS5xjS8kfFeBD1pnI1E+sAXbYhoAprjZVtdMCZGpyTj1bODVd5Qxf2wIN8aJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sQyRLgm+;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C9A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sQyRLgm+
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1189319a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793600386; x=1794205186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhQA2nqnfR/ndnC07pGNFH3CL1SQgHrxqNYm+C24yjU=;
        b=sQyRLgm+OdDyP4kgtLa0LSm+Ddh1xN7YgRjEbGmaDVJP2XJ/mWfWZAZ6cQXhRrgQLj
         QtQ0PA1C9XBxxVVANtsaixK2sdITqFW+ARZI4WDcrKth2//uy+EmAXh+GC4/p6r77TU/
         EVgkK5/v4yc/1W2AtgAfs0/WqIqivtXgZE5fMHHZuxc30n3cyRVo+StwSxGY76w8CmFV
         XY/Q5u2NBXDiAWlOBZ8J16FvTZ3Kz+mqUl7DH5NngnpajtukWu/XRVtqMYUMJxQzwCaT
         s65qDG7J5sUcY2jTT1O8K/1uFlkIAU34U/geHBRVJT+wNCcRJRXH5eq7MMcbml2P4u0B
         uxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600386; x=1794205186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhQA2nqnfR/ndnC07pGNFH3CL1SQgHrxqNYm+C24yjU=;
        b=TBv7KmxPTi6M7R+5LwK2x2J1sWhq9aypmIPndRrLe+bsh3+ChzW9R3VT4wn9mQ94zw
         OzIj7ttfaPKZyWQBtpCwLgO23f0XU15DoabifymLxANUxaQGChM6/gaDZNAaBqMeMMGy
         xBHYPD6l53UkfInRy1kHtkKwCJVMMCiLQMv5WM3xAfZNQJWgwR5NM13lAtzreEmBIr85
         KfhRhMEkJRo2S9lFFJ0z0u72zw7ZvEhrGvCrX3nMAlra5JhjW4G1Lblu9zB4bSsIjMUe
         ZKfS+GppERZ65dEznYT8Qd3EP6YXDFr3vHzADHAoaTWaXHTG4fyfkvRxev6KfjrdInvP
         ++mw==
X-Forwarded-Encrypted: i=1; AKwUvBxTu9BGG3+0d6x7f5J/WDEL1GQrylOdWqZCC/3Gv9cBq/rlKh+GrSl89Zi9YytUS+pleytsLKZJ/xGW20s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V+TUJIg3v/KDIOfwHu+FyH5WV64vumiIyKQmVvYVw4VfCp4dA
	yFoaoCztxjszNxzJsFdCw5sWuVCw8j6cznXQsUsalfNaFU6VdamJh5KASg3SE0+kiEHCikUDJeL
	Ftr12zTs=
X-Gm-Gg: AYBFou3B5G3XvAAHLA5x7GLGL1ZaBvC826zn5oFg03JCAkDsWtlH/iBqlmcv5FCtKPP
	kkWDp56U5yITLrKjtkTOgSQn9tTg3+diPCOLtz+bzVE2IuDeC9srfERSOkBJbP+3lFUn3Oc0T2D
	zq2LzWuwzMjRezjd6FHxJu0CjMGxqWGgeXm5sqKhl3a/b6Kb0G9bo3lzQqYmOamocG2eeJMuMMD
	5ziUNgi9AMN2AVD6NWx2RNJTBe5MyW4j+T2KPe5TsI8SPNWFaN1/ltuwEQtQxVJlzcbI9imrtWg
	PMytSb9cu0klD2Y4fHfWW2nenO/SkiZf9I6ofdYwYcqifxTz9jwETArUnW6IyjbRraHOnrLULia
	bRVJNiHLzwF9GC0w5o2BBmlRD1F/YUoM8jvIND7Us+ZkvI4+l5nqX4xnrfNgicO4rGLQOrSvMzP
	5wSs/fJdRynH+mURFK+hRJRwx0Hr+e323SFTQIcP2B9A5H4xjjkT29r5zKh2zf/Je/SzcGowPr+
	KdGvM1GT+UB5IXuwKLJNh/6Ts9nX8pX80jKkrz/KzFk52QVr/EMJxmrI0DrmILXxbLsoY3Pw3iW
	CqNW6DugrjH/OXrcfBdxEvOWmlxj7V7IP0/VCRPeHnSZuK+ZKZ4EnQ0dCsNKhTbrQ5NjcXngVm2
	r+TqbzFwoGkjYndmKGOl3A+LDop8y6caV8PbZePAyKb+vTSYMXNZiOx+wUNg=
X-Received: by 2002:a17:90b:1b03:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ae89287394mr6957156a91.0.1793600386333;
        Sun, 01 Nov 2026 22:19:46 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d115:e4f4:23fd:61df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm12927752a91.2.2026.11.01.22.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:19:46 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v3 0/2] RDMA/srp: bound the receive IU the target asks for
Date: Mon,  2 Nov 2026 15:19:36 +0900
Message-ID: <20261102061938.617371-1-yhlee@isslab.korea.ac.kr>
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

The target decides how large the initiator's receive buffers are, and the
initiator never checks the answer.

srp_cm_rep_handler() takes max_ti_iu_len out of the SRP_LOGIN_RSP and
srp_alloc_iu_bufs() sizes every receive IU with it. The first patch refuses
a login that reports less than an SRP_RSP, because such a login hands the
receive path undersized buffers, and a report of zero is worse: kzalloc()
answers it with ZERO_SIZE_PTR, which ib_dma_map_single() accepts on a
virtually mapped transport without looking at the length.

The second patch stops srp_recv_done() from syncing those buffers with
ch->max_ti_iu_len. The receive ring is allocated once and kept across a
reconnect while max_ti_iu_len is taken from every login response, so a
target that reports a larger value the second time around makes the driver
sync past the end of the mapping. iu->size is the length that was mapped,
and the length srp_post_recv() posts.

v2 -> v3: commit message of 1/2 only. The KASAN report now comes from
a real rxe connection instead of a KUnit harness. No code changes.
This is the repost after the merge window that Bart asked for.
v2 RESEND: https://lore.kernel.org/r/20261026055430.406487-1-yhlee@isslab.korea.ac.kr

Changes since v1:
1/2 unchanged. Dropped v1 2/2 (drop a truncated SRP_RSP): the floor makes
the buffer always >= sizeof(srp_rsp) so there is no out-of-bounds read, and
dropping the response would lose its req_lim_delta credit (per review). New
2/2 bounds the two srp_recv_done() DMA syncs to iu->size, the reconnect
case review noted 1/2 did not cover.

Yehyeong Lee (2):
  RDMA/srp: refuse a target that cannot receive an SRP_RSP
  RDMA/srp: do not DMA-sync a receive IU past its mapped length

 drivers/infiniband/ulp/srp/ib_srp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

