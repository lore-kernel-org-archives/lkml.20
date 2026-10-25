Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892287;
	b=XAk5YN75VWFi7cDZRoFhA61VWNA4rKMZ/O79gorAs+PAf1zqd5xklNwFaO5C38lPitcO
	 tgs99ZwVlVv54hPvzygNCuBqqK/I/WRN2nxR5yUnBW3Hypnf4aJdD4842tTPBF/eITcfb
	 GPVmwmDVnSlXd4XMHKvxDB5q/mOhIrG0wnlnORmfiD6TIJM6kGymOfdByrJKTNrjn3yeJ
	 yyuhr2cvN2yHG+FXf4GQ5RtX3s7pv2BU9VfNTZKNtQCQ8svYgbyjqyRVEIlR5MxwN66E+
	 lX2X900h790Ry5A0wXaPbw5A8jO6Oz128++2a40s0C7Jyq1rljWPUG2I+ogfZrFfQcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u8h1InsNpeC2AlWGNl5I9ntcUmNs0bzik5YkhmDqhCQ=;
	b=N50yhynIeAvoDCBgQVK6MtXfclyC950mvtCdZpGLDxG619sWzAbaMZ5wRtaLrRJjwRwG
	 XUogTJ9vIJrRXWYz21Jns7kUYT8/TSkqbfT4Cz2cJZA0H3BEwwdy+BAmUrCs3xTGeCurY
	 pEHcICRmS4blZww7VV8PqIE4BLRm5HO8XNLX2gcy99YOWGT4pvqZ74GG5otOJE0KIJpCH
	 uSzGHKfTOShTr3E4Vws9vqdfqvt9fucLQRw/4/jDeWBzDcAdEv8w8u9y5ZqNcNAp1Qw8I
	 ICDKCcqKvLiIS+RiH31F7xQjmDCz27X7e3y+3CiyrjX2BgXwgF3pNcXtdzYhQLZMbXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sEGEkAsT;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A5606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sEGEkAsT
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36681e85e87so1426797eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792892284; x=1793497084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8h1InsNpeC2AlWGNl5I9ntcUmNs0bzik5YkhmDqhCQ=;
        b=sEGEkAsTpgfmX82g11PV76q1y7ztdsbuImZnA2R0xNogWSBJjygohuxHaAvHrR5h4t
         MIjSvtpCEnNm7+2UUXIBZ+gmfNImcsjx1SEKy6y3PK18adPKmvvRmeJ9zllhdHjO+1/q
         njtdixJEtnfxjw1SdO+rSCevSSHExE0Q/TCKvrXXbBgsjYcAJGmDjrmU/totlJei9AV2
         NJydQzHgb16+Sman8eEjuNjMtMkqer46DIgBoMmbiRPBrVWiJ8flj7Q+EKdjAOAqOB73
         c9YDNartU+E6io5F3XtQR6ODJmWLZ0Nhe//6KM5ot91kyRbukwdAxh0u4okw7spJD2H1
         blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892284; x=1793497084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8h1InsNpeC2AlWGNl5I9ntcUmNs0bzik5YkhmDqhCQ=;
        b=S9t3CISxLDvRs38T26V2hW8iJIIgrBUplUOcRgHrA7FqlByQ/ZO1fkamWOhiE2YmfA
         DOA217MzUvwBGQv8pPRlCVeUGbpdYxhz9aC2Rx6MvSN2nZLbhtV6YkFFt6HX5G6pJWaE
         8uG7DOSRyHhejBKTsO7KD9C2xVO4QhlPdaAJTcPV553dvM1Y8he0iw7vzwJAxLDLcb9Q
         /USoPVs2tqFN9OblFt80BEUyawEPS5kb8frXpDO9WPAv7hJHp1z9NXsu+3FrQZovtfex
         Q3NWCzRZLHrp6mZlSXzpXonMFbefp0kG/4OmOI2Zj6pO8B02ow73yvaV8nwaygvhpSm2
         LfRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbSHts6QoyV1HhytpC+WoHRH1Zx84vmtlE5yqFsnWyecyWuIX4MQYk9JodV/Bn58h5DO2vQv0Bq46wpno=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTpl7izRf4a7a01vfU1M+TAIGjiRspApD19+sB6zt1gnBTvv9p
	vbfhhMF4i/LIXkEibIIPOKpp7YYpfYWJhnV0jNZvWcIgXNreKBSQc/FdHoZXNP+sljY=
X-Gm-Gg: AYBFou1od47eLC4F5ERgUDlyvLztSZ2e93fAjHQ3a3gsIlriDobgTb3JqnmJVspxa6v
	HrhGMBCzMbzxk/lgEIU5Cqr/GqBxi2ES+BbfqvdPb1XucWvQZjbQr8OAwwISJZBiVxEv/BEQVAg
	v/ykW4OkH/a3QZtFAeOz3uHeQi1jctrdeORr1SPc9t9LOuS/ZvC1YWmNuaq+wRA0ZG/Q4DCZAJX
	qWq/ubzaRn/p+Kczi7Sy+wQz6pGqQkuBQTfsm3Uxf4PcqW/OlrJCKKFHud4P+r47mQn51KsL8kX
	8ZebMjR0iu7LKDrj/+s4FwRVD/i8FhZnuMzE9KGTZDWfsd0AaSbfmXZo0Z7rn9PCZHt0mlBRET6
	hyWBdPsKnb6P5WBQ/V40OUEWBOyKi4attg47bnvDeHZK9LiIIi9ZoZxqu3KkfM1ej7y/J7C9Yen
	FzuvcrT6n8HQaR2XfZ9uPve3Jef+boADncrjXIL8K11rHiKWaZymoJU1nn4BeFJelKQsIgzE/DW
	AnTMqoYq1hElOp8bLn28kZz0GOjXiNhA7tagWZxCkSdnzdT6oRo5inJgRcOQ4Bg+Xsfz/C68gwK
	+XFrDh734psr65XaJ5ZqWcGTAFPnQHYrWoGaZZKGmHWDBLZ4YCAhnqfuchmpsxGM1A==
X-Received: by 2002:a05:693c:820d:b0:366:bcf9:1807 with SMTP id 5a478bee46e88-369e84dd76amr5254349eec.36.1792892283556;
        Sat, 24 Oct 2026 18:38:03 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8dbaa42sm13724329eec.21.2026.10.24.18.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:38:03 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 0/3] RDMA/srpt: fix the descriptor table checks and the context counters
Date: Sun, 25 Oct 2026 10:37:45 +0900
Message-ID: <20261025013748.3755639-1-yhlee@isslab.korea.ac.kr>
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

The first two patches bound initiator supplied descriptor data, and the
third widens the counters that hold what the first one admits.

A 510 entry table fits in the default 8276 byte IU when the additional CDB
is empty, so the bound accepts it and the counters then have to hold it.
With only the bound, a conforming command carrying 256 or more descriptors
still wraps n_rw_ctx and leaks every context it allocated. With only the
wider counters, a command that sets ADDITIONAL CDB LENGTH to its maximum
still walks a descriptor table that runs past the receive buffer.

The first fix dates from the driver's merge and the other two from the
conversion to the generic RDMA READ/WRITE API, which is why they are split.

Changes since v4, all in 1/3 and all from Bart's review.

The span check now uses struct_size(idb, desc_list, nbufs) rather than an
open-coded sizeof and multiplication, and the size_t casts are gone. nbufs
is at most 510 by the time the span is computed, because the existing count
check runs first, so struct_size() cannot saturate.

nbufs == 0 is refused explicitly. Bart and Sashiko both pointed out that a
table_desc.len below one descriptor still got through while the v4 commit
message claimed otherwise, so the check is there now and the message
describes what the code does.

2/3 is new, and it has not been reviewed yet. While working out why
nbufs == 0 reaches ib_post_send() I read the rest of srpt_alloc_rw_ctxs()
and found that a descriptor length of zero is not checked either. It
reaches target_alloc_sgl(), which has no length check of its own, and ends
in sg_init_marker() indexing a zero entry table at nents - 1, which is
unsigned, so the write lands far outside any allocation. DIRECT requests
are affected as well as INDIRECT tables, so the check sits in the shared
loop, and the patch carries its own Fixes tag.

3/3 is unchanged and carries Bart's Reviewed-by.

Link: https://lore.kernel.org/linux-rdma/20261024162852.3528224-1-yhlee@isslab.korea.ac.kr

Yehyeong Lee (3):
  RDMA/srpt: bound the indirect descriptor table to the IU
  RDMA/srpt: reject zero-length buffer descriptors
  RDMA/srpt: widen the indirect RDMA context counters

 drivers/infiniband/ulp/srpt/ib_srpt.c | 21 ++++++++++++++++++++-
 drivers/infiniband/ulp/srpt/ib_srpt.h |  4 ++--
 2 files changed, 22 insertions(+), 3 deletions(-)


base-commit: 6fba331225f5040e93d0947d1027e9712238291f
-- 
2.43.0

