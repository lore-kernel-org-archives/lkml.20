Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434591;
	b=CjqBS8KZRTanlNPXym9j4g1z+t4h+NZn8+PrTe6yZCh1MDIcfhomW4BNXtiRhDkm2ka4
	 3yXixOLwsICVUd4pw+O9O8hLs3JrTRjI0rSMDEGLaH8gsA0IKPTfZfnZAI8kQc70ju1RS
	 573H2r4bbMxDN9xcLFWPmdmxHjiSW1fV9PorFdQZcGCqOZ6NFaABX/QBlseelHca+bIeV
	 JY6v3bQgUGokxTJ+OCjG5/SKs7MRKmBcsLGA1auViWyOKFQrzkBjZDq69GdfnLCMDuEsQ
	 8Rxuiy4BoFVTp0pqhP7ox08o9VbUJ6/MZYfsjQM7ju6UkUCTHFSLvKg3wYvx7s+AtyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3WB24rA8ZdBO+wgJnzmfsh+oAV8Yu7u/lMoaF1dD+/A=;
	b=dd4IzybOO7QYEtaL25onjxF8GIDAwkrSEyiHT9guCmjRi2A4ex+duAxfbDAYTut5bPSt
	 aVFX2OxmIuuerWAteJD6APNzUHg9wffmB7ewHVc2iw1xQP0cOTlF8XGjDfHP2Zmz+1T8T
	 rZHqvFt8vOX8i07BrYKTtjVHRNyKcaiWPLVbhAr/J3mX57YQ2SSngj2aJID6glLzAlIDd
	 kZB91BCADU3ntrSlRAK2Q9RJwPQSJ14Noa5TbUTHQY91mRZAALRLnS5wVjkb6OB+sK1lw
	 tGArSnZQ1NRII6/RSlCMs5AABpXTTLX3frKg8GW9ym+xyYWGazY64SmIMahIi1XkncA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W/4w8wek";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046BA606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 046BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W/4w8wek
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so4057887eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434590; x=1793039390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WB24rA8ZdBO+wgJnzmfsh+oAV8Yu7u/lMoaF1dD+/A=;
        b=W/4w8wekQdvr1HJK1p/qx8Vj7tq7/FS7PiMMu/LEUQY8HU7559yv8Nh3ZrpToQbpcR
         UakII9Z1uV2JZeMoGDH9vIGXXFSTYvJejgOsAHA87mIgE9vlGNjENdJkxpTGMoiSsvp0
         lmSIvtTE78fcBk8dFMTv+1LpsCWAVr+V+e2yWQli7qV4Xtr27X/asupcdvg+hvCaEJhs
         +rA/nJYkfQGP9uHG9dQUkzeUray2s+w9sOaMGmJvL/+zb8xr5e81rcrcBcDc8DpEI6DP
         zOYizs+iUJstsDCn05GzMEYggqkRWMompUNGCX87oMjMvTobPBYfZ1Bh1nTHsq+kMncE
         ja5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434590; x=1793039390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WB24rA8ZdBO+wgJnzmfsh+oAV8Yu7u/lMoaF1dD+/A=;
        b=ef+ZzVLYxFgHA8gSS+ED0YbgpZPRFancGW7klgdtzPDXKx3L2brR2yH3HJtdYTy4Ma
         oRc57o3KsqiHBr9OMDHMG2d9QHYPZZfZaA0dr4upUuI4621k4ANBDTx3h9N4O6jyzTqI
         zAmY9mqcJwuwRc2D9q0hbrRbHygdQTyg/pO1MQA6FPFlbAaooTQ5wmv036qLIAzyeHno
         JfYB8XIOlOc8X0lTAWi4UZ+tBHlfgz8qOxGUZPFHwEi/yVK9oRP+/anbEviW+cgSedJi
         FUYXvDWrg8aFS+2m7vln+W3P7Cv5TsNElmrh9G/udToObWwbdwqaapXg71xeCEhPHn2C
         cYjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeaY3zAUz+LwSYjs1JmgcPJBfymcsOJzNKSp+RVtSRnHsgx3g2v0O4H3V0gCeVN6+90jlgSlB/3MquWK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHcjWLbrCPZgv6+/JwIb+a/X4xBxwsET8kNahglj07BfJHCi4u
	4T0pfD1LHuYjcnJpedfBpbZfyguTnW+l+ku0xM76GlDqH5Q+dYlqkeUT
X-Gm-Gg: AYBFou3OdBYuEjnk4JoeW06QKERsN6IFFBZ+7uXzheBG4mKaXzrtNsEZXT11MEtEOp1
	/yzgvK2FUFISfZ+RfNGXImuDGiXqJc8neKYB/BYBslOpoyvqAnU4qUpxmoCexYpg6vMvkVUEwk3
	nv74yEbftcS9RbuBlX3cPnpyn6iDbOmijQidhmGomJt9wB61Ly2qoez+96jOFOK7e79qQ43F6LO
	D+RIc3xEuDijqrWLv4tWrxX1BYQEJRcF+eampYRWBWlrFkVxUI3pWtkB0ol/X248YNsb8mF3Sks
	gFrCJ6OBnbEZSuba6pqw1Rmo5NseCh6sNpy9ZlfwgcBmZPfxa1G2PSZ9MMqVKsi8ZdMBUj/NIlL
	+gmJ4TdJPY2ZSLG3tsP0dvlYg9A980dN70zW8xgMeKHDiIfZYLJOJo+kx+KEpXOgjCCEi7fkD6s
	Qjw9cp9VqWcrZUchzEQDvMWKM9OlJZ5BKJ3bu8LguEJ+v0p1H/YOPzAYgJztfaMZh2C9wl+qKCr
	a9Pg5+RFbrfLIigefhMhYq43AlklrSv6cs/BzVV+AT/hqNLft80RQZm2qRTWVi3rIL3CpOSCEic
	hkiWLoBBPdtRJdy2
X-Received: by 2002:a05:7301:1888:b0:339:7c91:21f4 with SMTP id 5a478bee46e88-361a312c22emr11721148eec.34.1792434589929;
        Mon, 19 Oct 2026 11:29:49 -0700 (PDT)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm35009576eec.5.2026.10.19.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:29:49 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: target-maintainer@vger.kernel.org
Cc: Pranith Kumar <bobby.prani@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] eventpoll: scale nested leaf additions
Date: Mon, 19 Oct 2026 11:29:31 -0700
Message-ID: <cover.1792432666.git.bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Adding an ordinary file to an epoll watched by another epoll takes
epnested_mutex. Workers adding different files to different epoll
instances therefore serialize on one global lock, even though their
reverse-path checks do not conflict.

The first patch freezes the epoll topology with a shared rwsem during
these leaf additions and uses a hashed per-file mutex to serialize
checks for the same target file. An epoll topology change takes the
rwsem for write and retains epnested_mutex for cycle and path checks.
The second patch separates the generation stamp and topology rwsem
onto cache lines of their own on SMP builds. In the tested ARM64
layout, this also separates them from epnested_mutex.

The series was built and tested on linux-next tag next-20261016
(7.3-rc7 based). Four workers each ran 2,000 epoll
add/delete pairs in nested and flat modes. Throughput:

  Kernel                 Nested pairs/s  Gain % Flat pairs/s Gain %
  Unpatched linux-next        1,558,641    0.0%    6,736,037  0.00%
  Parallel additions          5,325,959 +241.7%    6,771,375 +0.52%
  Parallel + alignment        5,487,081 +252.0%    6,780,276 +0.66%

This patch was developed with AI assistance.

Pranith Kumar (2):
  eventpoll: parallelize independent nested leaf additions
  eventpoll: separate nested-check objects by cache line

 fs/eventpoll.c | 116 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 26 deletions(-)

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.47.3
