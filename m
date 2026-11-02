Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600210;
	b=dTbKTPM2rGc5YOl05R/8KTvn7mM6C70CkK7AD0qbEdP50CBVit207QecqbYTYad+Jort
	 ccXydHPXxdBI8fWS+jNf50TwJKnDWGoPwxon4fpeZcuStV/26ZOz96cKc9XAaaXoJiUci
	 FkyDMd4vy6B9Nm6Ou6f9efJDLdIRAEGZIq8jR+AXdJ8U7wLYn3M38l2urUkZR7BlgSkm/
	 jmKswnLEP8UYDOyeWL0yGNt3lYkVnXaiZTVkocY9dsO7b/e+I1ahOqMQDp0p07VA+eZ9X
	 NvttHbTVmeBd1i+bfsNYsA4TR3YD4NWeyqH5tk5ig69grqZiIBa3iOhLQkiwlFZgFiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sxqxZ/tFXcG65LJjLwgkRyGP3NtvdBgfC4fFF1s2qo=;
	b=dOvYjbJbRyhTEoetwyEp/yixJUQdeN9ZqwMKXNQLuerKxQcrCdI6PErHRuZdalevjdgk
	 V59jTIedr5En4cw6u2btvELmSyjewi0LY6dhacHW9hmC6MzT9xtZl7kt9p2mq/ImJdNFZ
	 Krep1A0aLLS3V6YwNrqaR7T6AhEVUGPKDKuZwuUIMW6XrALPOkYmxIUqiob3cZEIaZPFf
	 vWRL/O7gFQw5tL3WVEe9pLnxN62BqPqd+My1uM/pGCzUVNU40t5A9B68HoP0wb3hINfzX
	 a6qF0DN4pDUezCMfv1rXJMXY5Ss3S/EPOpOFMiyEO0f7fQut6gamoFq3F0xKSXvxc1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nC0e+Cq4;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C4606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1C4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nC0e+Cq4
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a058f74a54so788555b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793600208; x=1794205008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sxqxZ/tFXcG65LJjLwgkRyGP3NtvdBgfC4fFF1s2qo=;
        b=nC0e+Cq45eM+HVVdGpNmmpZS/oyYsZ9qFW2MtwXPsfRdNKHsSDsZiLackYQQRAUDSf
         ML5QADHEVcWWGrvMsTEaKFP311norQwlD9GKA23Xzv85tGYAeN89IK6QTbC6tVqstn4o
         yR5EGAZftrHLYT1VDsW4agAbXj1wK9R3Jh4aOZOm+f3jnIjdCu0OqPHwZFVYsXLRG+8N
         GgZ/L+X3r7pDpZEXBQ+IixNJEC/f2iabWC/ZQhj23ultZEnFSUx2Ws5rbwoWdemRFoFS
         IZvS6KR7T4h/yTa9FJ22p8Oioq1wIaKYXiI7DhuWTtpIohriIlXU8jUB/9c0VVp3rv0e
         wItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600208; x=1794205008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sxqxZ/tFXcG65LJjLwgkRyGP3NtvdBgfC4fFF1s2qo=;
        b=Mcet3JbzoriQo/2AJdtIKJHe4DTtZDK21I0tfMkroyCxAPjLBLiMSfP9Lylv62ynFi
         xsf876tLXpRsKRVsZrLn4FMmIWSSpm/RG03LeyWzfVe8+A3jGE3JJjvdbwsOkmEOSEYV
         BPkYh8YHZmMmXRR76DQsAQqZkVI/vMLp5HD9+GgD6mRggGp/rGNaURq+iJaXBNV8YWV8
         nrfzNgEqhMZXSX8VS9kdcZqmi90/orYj+rLgyHF16OG8/7jrxG7k9Llgcg3k/47+X74G
         UWEkkl2K0DQ91btncJdRj/NdBuM63uXPcfpnftMRLFfSppMOiAvDY78jykBQpsz+6Lcf
         hf0Q==
X-Forwarded-Encrypted: i=1; AKwUvByEPKm9MGXaccdZWBFssEVhCnZOfGdKwW/Zrjx5xkZKJ3q14TdVPgovzZX1i7YihiiigmsVvBI1/AjmN9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0qV1/bcXAiSRr3+tiUWCb2irRciUR92gd7qkmj/jCWU+bonK7
	JlDBHDZW/CkksgEGwWclzOuHYC5Jio28XTWiGwIeB3K6O/gxpMMnwxNGKwas9p0zLWk=
X-Gm-Gg: AYBFou09rlVY7gexijx5G/PisQhpmoreOupbzV7CJcue5CkOmr1ENp/VgTW718vVyHS
	Rk9LvbsOn9I6TZVdH9qbGQsxMZHP8e9EaSY39xAHv2sNSh3oWAFfR6lPL/oL2HJrQbqpS9W8xeB
	KKGFYZQljPg4LhgxLwz3LPftokO3s0M1ETXm05ga6yQ6W+P4y3+MpnFiuEOvT2Rbz3oGl01J+7d
	hlk79Y6chRDf75B3kYsdgajT3f/MQHnKVxKNZnpeulLyeQ+XglLng9gkFgnfCYBULHtTP82dPwW
	edb3dsp//PPaDbVpbyh8qneU8VFVB73EnC2b65SMv0hdYSMHahA2UeTa15ym8BJSkFdYbU2XBw5
	jEokAEaWpsfLMbWCF9P/YgOKiTt3gleoKjqEa9xwapbrRnt/5JOpEQ/YiidDHGeohJWky50t/Qo
	tieQeLd+wYs05TKL8i52DioOYe1I9cH1M1kzZJIZr+R+gnRxpTLgwiHu1rTy8T9KaREmH6Ss+3p
	d2daEuhnQyQ/JXtf/zxhtk6z3nf3PZLLlG1PIGsjNvb2NMBjsaUqOBAESMo2cTWLtjmBfPJVXqJ
	CPRVfke0Xu/Stl7PCVqq7gPEs26rZfA5X8jzxGvLP0bn0m/OC29kh/1S3WDD6yxthiYFvA+18WC
	r3FWHkcBxlQKKn1atV7lHzQaZ1ft/ZT9lqrbQ1EvWdtOyAUAdIuyD0B8FFpU=
X-Received: by 2002:a05:6300:6301:b0:3eb:3b69:77d2 with SMTP id adf61e73a8af0-3eb3b699956mr2989335637.37.1793600207806;
        Sun, 01 Nov 2026 22:16:47 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d115:e4f4:23fd:61df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1509071b3a.27.2026.11.01.22.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:16:47 -0800 (PST)
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
Subject: [PATCH v3 0/2] IB/isert: fix the device removal use-after-free
Date: Mon,  2 Nov 2026 15:16:05 +0900
Message-ID: <20261102061608.617186-1-yhlee@isslab.korea.ac.kr>
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
deadlocks against the handler_mutex that rdma_destroy_id() needs.  2/2
moves the teardown into an ib_client removal callback, the way nvmet-rdma
did in commit f1d4ef7d8883.

1/2 is a separate problem that the review of v2 found.  It predates the
device removal work: isert_free_np() publishes the connections it is about
to release on a stack-local list without emptying isert_conn->node, so
isert_handle_unbound_conn() treats them as unclaimed, unlinks them from a
list it does not own and queues a second release.  It needs to go first
because 2/2 adds another caller of that path.

v2 -> v3

v2: https://lore.kernel.org/r/20261026060505.409476-1-yhlee@isslab.korea.ac.kr

The review of v2 raised four problems.  All four were real.

The race between isert_remove_one() and isert_free_np() on unbound
connections is 1/2.  Holding isert_np->mutex over the release loop would
close it and would also bring back the deadlock that commit 691b0480933f
("IB/isert: Fix dead lock in ib_isert") fixed, so 1/2 takes the
connections off isert_np one at a time, which empties isert_conn->node
before the mutex is dropped.

The race between isert_connected_handler() and isert_remove_one() was
introduced by v2.  Both handlers used to be reached only from
isert_cma_handler(), which the CM serialises per cm_id, so splitting the
ISER_CONN_UP store and the move onto isert_np->pending was safe until
isert_remove_one() started calling the teardown without that mutex.  2/2
keeps isert_conn->mutex across both.

The hang on an ISER_CONN_INIT connection is closed by marking it in
isert_teardown_conn() and having isert_connected_handler() release it
rather than promote it.  A marked connection whose peer never answers
holds the removal until the CM gives up on max_cm_retries.

The hang on racing connects is closed for the half where a connection the
walk has passed is promoted afterwards, which the previous item covers.
For a connect request arriving during the removal I have no measurement,
because no further RDMA_CM_EVENT_CONNECT_REQUEST arrived on soft-RoCE once
rdma link delete had started.  While isert_remove_one() is still running,
2/2 refuses such a request: isert_connect_request() fills isert_conn_list
and isert_np->accepted in one isert_conn_mutex section and returns -ENODEV
if the device is already being removed.

One window is left open and 2/2 does not close it.  Once
isert_remove_one() has returned, the isert_device for that ib_device is
gone, so a CONNECT_REQUEST that arrives before cma_remove_one() tears the
listener down makes isert_device_get() create a fresh isert_device, with
removing clear, and the connection stays in ISER_CONN_INIT.
cma_process_remove() then raises DEVICE_REMOVAL on that cm_id,
isert_teardown_conn() only marks the connection, and no further rdma_cm
event can reach it: cma_send_device_removal_put() has already set the id
to RDMA_CM_DEVICE_REMOVAL, and cma_ib_handler() drops every non-timewait
event for an id that is not in RDMA_CM_CONNECT.
Nothing destroys the cm_id, so the wait_for_completion(&cma_dev->comp) at
the end of cma_process_remove() does not return.  The unpatched code
blocks in the same case, in wait_event_interruptible(), so this is not a
regression, and it is not a memory-safety problem.  I have not reproduced
it.  A follow-up patch can close it.

One thing changed beyond answering the review.  The branch in
isert_connected_handler() that releases a connection it refuses to promote
disconnects and drains the QP first, because the login receive buffer is
still posted and isert_login_recv_done() dereferences isert_conn.

Measured with soft-RoCE under KASAN, removing the device under 32
connections: 4 of 12 unpatched runs hit the use-after-free, 76 reports in
all, and no removal finished within the cutoff; with this patch none did
and all 12 finished.  A connection held in ISER_CONN_INIT across the walk
took the removal to 73 seconds, 59 of them waiting for
RDMA_CM_EVENT_UNREACHABLE with status -110, against 14 seconds without
that delay.  Login and I/O showed no regression over 12 runs, and a
PROVE_LOCKING build reported nothing over 6 runs on each side.

Yehyeong Lee (2):
  IB/isert: do not publish connections being released on a second list
  IB/isert: tear connections down from an ib_client on device removal

 drivers/infiniband/ulp/isert/ib_isert.c | 203 +++++++++++++++++++++++---------
 drivers/infiniband/ulp/isert/ib_isert.h |   5 +-
 2 files changed, 151 insertions(+), 57 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
