Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676622;
	b=GvrjIrcwTmYFaXsJaIdqvrpMaqGspz6jylb8zPlOlCgJ7l3xt5qhfc2KZ0BYG47HWenb
	 CE7nb7LOrYrfmnuo9iR4FPwl50kQM05GjFT9njTYWYWTsAiqv3CLJPoKXE778TYy/R76T
	 y3/bXsNFjmkYSV5dURn7ziMVjNJrSDkAlok3ZEhe4EQbdutNjRyQuYx8L+dkiN4Tu6qcK
	 /Xb4OaTFCZ7h/91Lfx0HmI9mDIk3/8KeyLkbCPN5lDmov1B/EtyBhfqhbQgengSTbCokH
	 axZgSGyvv9Ev301Z4A/llb87AS/ZTSR6P5pMI/iEciJXcroGR8QQe7r7N6+ELaiY8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T+mw2F1yUJNs8kyybctMrCnprUG4stRbsOjx9W2agMg=;
	b=WieFTc2z77plQQBzEdeBhhFW9rxzrCYQjFaIgRxEah+lkTsAKDvCkehE6hVnK6WyUt9J
	 gQblCQV7nm5KUtmUjeix8taofaz3cZjFm5MW2zL6HSAoX8qeL9l/mVOuIgmdqCX5g8AL5
	 VZr2MD5X+WvjXAu6DGB+tlEB5nNLIdUwJuaxw4E0Pj0faS5BSwqvJYtjlUANJZyzGcNJa
	 HmAVK7hIN+t+toak6kwnnt/hXwm3e/z+XVS+cFc4nAWTLNWUt7oCdjwecZNI/iZhWwEsR
	 yrF8r/APlZucpuCmX0Ic927qHGD/WZc70m2p+pjlnFMEu25p9mkpNvvnQy41kYCuzyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KzxtzkSG;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE5606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADE5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KzxtzkSG
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a1947498bso3282443eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793676619; x=1794281419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+mw2F1yUJNs8kyybctMrCnprUG4stRbsOjx9W2agMg=;
        b=KzxtzkSGjZqscMAingZKA1OcYOowm5TmBc8gYCvXnCGeIRDmwx7W+7o5rZ5LPkkX97
         G1KWVEt5Tc+UPOTHQzRo5DhYzJ3KDKf90vzWwuujQGeu2sNmZ/QShKQCvVEzXhbTHxrf
         2nvNllAe5+dA33UMtgaNJbNRWw5wCWiR3u3zX/DX3QZT4W1Otg5tzFPXP6+qr0OYCWnt
         3BTKlwAXvwhIjRlsXHn4wvkAREADqB03AMgHi8nF2f5WPcf6zuDhw+mre3HDoWR3r1g9
         wZ0VUsr0g2KwUq6+NpFEIVZMjQNBbwHMw5rC2Bp6Vwl5xrDKZ9So/gdWtAnxyks6wna9
         Na0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676619; x=1794281419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+mw2F1yUJNs8kyybctMrCnprUG4stRbsOjx9W2agMg=;
        b=OcTVVKpk8PVeOC3ksTf+Cywq/EWPQUkxy8Ll39KmtM7ef3PTkre+1Q2OSQRFwF9gnt
         C7B9i46F3axvhUnYtagLKkvd5SQHhc8ButYhK0JTn7F6P/GUoZQgsZu+8BQbI0TR2xOy
         ZCXq6shDIZ7FDk0fuHHUBQMDjM2LMK5rOALOI3fTpDOALE31sqhwU9h2oLLGq6+zItOc
         6lVizZ9lKmljGW1/MAoLQGuaK214F1Ho+JQOZwM/PzwAWKXvcf6G/J3ciaiW/zNeXzDN
         7xy7QM/42EHR7NNXVRrUcNlpdtRf3z0bhEvmmDlhbMs4jBAyMhL4PuHz263j6T98HhqN
         azGA==
X-Forwarded-Encrypted: i=1; AKwUvBy3Z0dZIRSAI6VxIqD6voII7/Z6kcMVBI+594JEWvD+rnAoGcAqZAXlRuZh1HOKWYGj4k4erArTw6ekhf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mbxt166HAOflbXYcK+t9b5lH+ZRit5xJ+lJ8M8VS4vGZyZjIr
	L3knPqg0DRrjcrY9/9bEyUg2DdVij1irYfKMTB4VO4z4er8O7e3rFIcU7TMVWsBjKqQ=
X-Gm-Gg: AYBFou2np8CxPLsSJA/wzTgHqh3i+GqbfTc4txu7gOLb5Do6/82oGfgGVd01IxY1nMZ
	rBeCo+LLWyxz61mOYR88WNyEGlvlOGUkheO9Jieoao7QiwvS0UXVZvBaFzx4ePSxZ6kXiT1osDS
	uKwn+gys1XVO0Am/Lo9VSQpskS0t9JA4xXkS5F6uHW63hje5Rv+YRFi5I24Ah2eXO1ClCvFv4+B
	cEQyv0YfCZVdcaDGZSyTkyXQRXQnHTWNv6oxBVaWF4Yh/n4izckRd3r6ixhu3HbGu6L4WQZp83U
	FMoPa10mYAPrcXaIHF9b3QI/aSaqMaYZCGi6m+lqM9FkvxW9IQaQGEzGpTt50vj4Qt74epInkE4
	ahkdicaNkVWVCXc9yPvuZmRpxpmS6G+AaES8jcO8kdJVBuPDqFRqmdPnQtngox/OXHgONmnYO1U
	CfArmnpkpTSyTePNiuQgjSrprWi12zApXQXFbnoLjAqi/E+sRhrYLB2SSkiqoqm8UEsPPOqf2JI
	sNRbX1ULeK4CTD2Bwvz1pfS0wuS7n9yRkzpOSgqp1bqg6OJzjaaCCl3hmS112RlAoOgcHOepkgh
	u4ShI5lY4L81ELic24M4QJYpOgtrpewzlYO+tlZpYGSNEpElS9SDFDePIxDjZlH3BpHxkAXnM1y
	y6bovIP2jH1t6dZHcNG6olOtBqTbFzHRaBRi/Gw==
X-Received: by 2002:a05:693c:2504:b0:36a:8a6:6916 with SMTP id 5a478bee46e88-36a4236f746mr17282888eec.18.1793676618913;
        Mon, 02 Nov 2026 19:30:18 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:2da3:4696:4c5e:89c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm41498577eec.8.2026.11.02.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:30:18 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v4 0/3] IB/isert: fix the device removal use-after-free
Date: Tue,  3 Nov 2026 12:29:21 +0900
Message-ID: <20261103032924.1073138-1-yhlee@isslab.korea.ac.kr>
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

The RDMA_CM_EVENT_DEVICE_REMOVAL callback in ib_isert waits for the
connection it was handed to reach ISER_CONN_DOWN and then frees it, which
is a use-after-free against isert_connect_release(), and the wait itself
deadlocks against the handler_mutex that rdma_destroy_id() needs.  3/3
moves the teardown into an ib_client callback, as nvmet-rdma did in commit
f1d4ef7d8883.  1/3 is a separate problem that 3/3 adds a caller to, and
2/3 is an older deadlock that 3/3 would otherwise inherit.

The design is one owner per connection: publishing happens in the same
isert_conn_mutex section that tests isert_device->removing, and whoever
empties isert_conn->node under isert_np->mutex owns the release.

v3 -> v4

v3: https://lore.kernel.org/r/20261102061608.617186-1-yhlee@isslab.korea.ac.kr

Review of v3 raised six problems, all real; the first was a regression.

The refusal path in isert_connect_request() was that regression: v3 tested
removing after isert_rdma_accept() had run, so it destroyed an accepted QP
without draining it and rejected an id it had accepted.  v4 tests removing
before the accept and rejects there; if the test at the publish point
catches it, v4 drains the QP and returns an error so cma destroys the id.

Draining under isert_conn->mutex was the second, and not v3's doing:
mainline has done it since commit 6d1fba0c2cc7 ("iser-target: Rework
connection termination").  2/3 fixes it, and I split the drain fix out
with its own Fixes tag so it can reach stable without the rest.

The connection left in ISER_CONN_INIT was the third.  v3 marked it and
waited for a CM event that never comes; in v4 the removal walk owns it.

The trigger review named there, a DREQ before the RTU, needs the RTU lost
after the initiator sent it; a test-only drop left eight connections
unreleased on v3 with the removal never finishing, and none on v4.

The fourth and fifth were races on the np lists, both in 1/3.  The CM
handlers test isert_conn->node under isert_np->mutex and stand back when
it is empty, and connect_error returns zero there.

The sixth, a CONNECT_REQUEST after isert_remove_one() returns, is still
open: a test-only delay showed a new isert_device torn down cleanly by
cma's DEVICE_REMOVAL, but nothing orders that against device release.

One change is mine: the teardown now runs outside isert_conn_mutex, which
let a connection outlive its portal, so isert_np is reference counted.

With soft-RoCE, three v3 against three v4 runs per case: accept and INIT
went from a removal that never finished to one finished in seconds, drain
from six stuck drains to none, np list from 32 use after frees to none.
2/3 alone turned ten hung task warnings a run into none, three runs each.
Under KASAN one of twelve unpatched runs finished the removal and two
reported the use-after-free, 17 and 11 times; all twelve patched runs
finished and reported nothing.  Making rdma_accept() fail on every fourth
connection refused 48 connections over three runs with no KASAN report,
and every removal finished.  Login and I/O ran 18 times a side with no
difference and PROVE_LOCKING gave no splat in eight runs.

Yehyeong Lee (3):
  IB/isert: do not publish connections being released on a second list
  IB/isert: drain the QP without holding isert_conn->mutex
  IB/isert: tear connections down from an ib_client on device removal

 drivers/infiniband/ulp/isert/ib_isert.c | 310 ++++++++++++++++++------
 drivers/infiniband/ulp/isert/ib_isert.h |   9 +-
 2 files changed, 240 insertions(+), 79 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

