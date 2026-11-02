Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600310;
	b=Pg33EL2nT2cXwKASg3MBWlX5fdoUeYy3GsMZNoOlKeb2UVaj5+aoDas/i8ewjvf/r1h4
	 FU8D4Y4NbVA+hc5vqrJbKmZJLV87v4xO/jJkdhD8WRBxfDF6h+P/JtH3bl1Lh8mTlkYfZ
	 hUIQi1eu4JxIkjgoHsJ8OjRwPanj76Mz42oCgjuR9P53IF6okv5g1jsxGUX2wdTsVVksB
	 tgVk221lSpJjeGpaJKOxZrra8uEyqFKgJMFYV4gBO6Xw/n2daUHi5YdHBXTq83x9+MazC
	 eOdiNmefxJB57SOpl0KQrZyKR8yaYCM2gPrXkCJOZL+m4SaQZZXdcEG2oIxepgBFrcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ycenU0fhaGH93WaGt+mAjBlNLFrb8RODmesa9fer8AQ=;
	b=NISBJl+Su+TLdWUpThC/JCOArHHpJ8+uSsijTbGm/wvsWkT85YZZxZLhUfT9YpWPDLmr
	 z9bu2D95R6FHThPRqDmhi8J+pZvxjl5dy/jz/ZdHWEvFB53GAcpNBXY4A94C7ljXfmUDM
	 uIgmczczO9VDsaRy6myhvAvSZU/9ozZMMgniadVNq1DgVVUAyaD6SvBGtccQUMYREpOT0
	 G3vCTSqJOYwDCwppBFl1cffluf7ptX07muZ3KI+rOcGBxAog9W3JcFayEHE5aJx53horY
	 r/GLbPPo+ZqKgarjnmXRG3WJTeZA9KFNQfoJXyzd3OnVdnFZjRNZZqpNv03hf/yBl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fp7ohFFT;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A022606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A022606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fp7ohFFT
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ccca948203aso816336a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793600310; x=1794205110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycenU0fhaGH93WaGt+mAjBlNLFrb8RODmesa9fer8AQ=;
        b=Fp7ohFFTYx3vv3aTjSalkr6sHXZ0b4pV0DGR0eIjTY4elFQ03NCEMwX4xjjMbFXvVU
         Om0z2/vPLfSQ3WNb9YuqTbRAi17IGUEqhDIeQuE6nlx27sRpsn+ttImW0j6QG7XpZguW
         EMjNKSOGaRMxpfGmnUPREZskN17b9836h/9n8KXybQzAvZultF92AB+C0xmBR2W7xGHy
         G7dkTQnxtSuCKTaHstfIo8lpWKtbY5F5aP0qbUIGxIZz0Rb0DNJQI4qiIQSrSbO+wCaJ
         jmtuzBcdCgZw16ZEYLz9jPum+QUxtk9JjMZJMXctsGBAIDmT7icMZTB171lZ4Ai+y4GY
         hVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600310; x=1794205110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycenU0fhaGH93WaGt+mAjBlNLFrb8RODmesa9fer8AQ=;
        b=U+kUW0hcJnGubpTgY8z/DqlxqOZJ3vSp1GFAs4QGY1LCG5h4sjEOAnJjP/DdNnSfz8
         iuIAkCypdHSWMsBw6HoFE1OK0xcXiNWWeaAGTDowWkGZUbH4jEM/IaKxKbGg2u/1uUd9
         duHVvKYMh+VZlcKdl2WNK3DGNea2AsoD64ufayQiT5fN3v24+4uTiobL4jP+yzJ7XauL
         bfgZyCy2k6Nm8MLLhwowTbB1RUa1xy37XkfOmjYW38x8PBXFpKyBDkHY2gKRHBgYOJI5
         4tANkajacVjLrt5+Oxc2fiJTmSRECyODAQrMX79lvDMTf41kJzxflRQLkzytReCcJY5W
         tSJA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Vwv+m/DUE2dBbm5yYYbFB0UHaVr5+ABiPsFG2NAD7IFHpqwbTQezgO4fzrmlFcavjMTptKllUFfW0hM=@vger.kernel.org
X-Gm-Message-State: APuU4Z99dWzExJF/f+rTOaJyQV11PE4LIsVXWVdpKS59qtv3n2zxnC5S
	J34M6euJa+3DTvJBwyXZpwAM4Pv4GDBEbS+sCubMtZE9XOhju38PlXKF5GH+6e9uqE0=
X-Gm-Gg: AYBFou3VS2BCNNJTB0llcdyv5pSgC27Z5xdDwZlmY/spOuUcMfgZEuQ84Lc5D5P2gks
	eRs/qBSPRrQhNzl8WkS98FSWIPkw6w9zfMsWamu6bUJrvzsb9KOairqhqwwYwOj9yDFbZVFQM3Y
	rgv4ow7kjydMkPR5mbrJn8523t/ROj+QrYSY52GCvW13oNSD3whuHQTqci9i8621E0ommjtRiUl
	JvYQb1jcvPlZdDZ92abe244/dRolBE9KRLrWZjU2sPGChG7Jvv3oKffmS6g9eWiNy8UdQlrVVbD
	WrV9Tt0thJXO/v3VxT8PYdIUOG5kNw7QjghCu27lPUzaPYeFiEa98ZKGKSkqENvpF76vsD7RMFG
	b0lqr56qQnaNit2TobZhwZj8QvbuuekIomz61GyDDM0fn3FBlFGGuCPRpoTda2pciRRao942bdp
	g7neDOc5uqE8zlWpYmQeQbP7jJ4nOtktuC1WEpbiKMMgrZlNKlVK6j0KvF6mcpX7yRDE7YTHNrQ
	lRxbPhWalstzZip20hF9lSa4dlDzEXw5eqhMdQVTmmi2Z2IjlA5F3c1XJ+YwLC8/qjrrWarcUVn
	OjEyNct02G3EtuvKkZWbzMpPtbzUYb70OpkiMpO2Lf0K9K7ry5DBaLWJak4/19ldfk21qnZftcV
	c1jFx1xB/gsui/QbrFoOf5a4aCPIeYnaP8lpDDZiKhJIf63JDkb7DJcXpxc0=
X-Received: by 2002:a17:90b:4f8a:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3ae896f8655mr7224057a91.8.1793600309684;
        Sun, 01 Nov 2026 22:18:29 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d115:e4f4:23fd:61df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17211751a91.9.2026.11.01.22.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:18:29 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] IB/isert: tear connections down from an ib_client on device removal
Date: Mon,  2 Nov 2026 15:18:19 +0900
Message-ID: <20261102061819.617254-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-184744@kernel.org>
References: <20261026060505.409476-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-184744@kernel.org>
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

Thanks for the review.  All four are real.  v3 closes three of them and
most of the fourth; what is left of the fourth is below:

  https://lore.kernel.org/r/20261102061608.617186-1-yhlee@isslab.korea.ac.kr

The isert_free_np() race is a separate patch, 1/2, because it predates
this work.  Keeping isert_np->mutex over the release loop would have
brought back the deadlock commit 691b0480933f fixed, so 1/2 takes the
connections off isert_np one at a time, which empties isert_conn->node
before the mutex is dropped.

The isert_connected_handler() race was mine.  Both handlers used to be
reached only from isert_cma_handler(), which the CM serialises per cm_id,
so the two critical sections were safe until isert_remove_one() started
calling the teardown without that mutex.  2/2 now keeps isert_conn->mutex
across the state store and the list move.

ISER_CONN_INIT is marked by the teardown and released by
isert_connected_handler(), which refuses to promote a connection that is
already terminating.  Releasing it from the walk would race
isert_connect_error() for the single reference the connection holds.

For the racing connects I could reproduce the half where a connection the
walk has passed is promoted afterwards, and the same change closes it.  A
connect request arriving during the removal I could not reproduce on
soft-RoCE.  While isert_remove_one() is still running, the code refuses
it: isert_connect_request() now fills both lists in one isert_conn_mutex
section and returns -ENODEV when the device is already going away.

Your third ground stays open, and I should say so plainly rather than
claim the window is closed.  Once isert_remove_one() has returned the
isert_device is gone, so a connect request that arrives before
cma_remove_one() tears the listener down makes isert_device_get() create a
fresh one, with removing clear, and the connection stays in
ISER_CONN_INIT.  cma_process_remove() raises DEVICE_REMOVAL on that cm_id,
isert_teardown_conn() only marks the connection, and no further rdma_cm
event can reach it, because cma_send_device_removal_put() has set the id
to RDMA_CM_DEVICE_REMOVAL and cma_ib_handler() drops every non-timewait
event for an id that is not in RDMA_CM_CONNECT.
The cm_id is never destroyed, so cma_process_remove() blocks in
wait_for_completion(&cma_dev->comp).  The unpatched code blocks in the
same case, in wait_event_interruptible(), so this is not a regression and
not a memory-safety problem.  I have not reproduced it.  I would rather
leave it to a follow-up patch than widen this one.
