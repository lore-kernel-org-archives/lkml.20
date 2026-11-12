Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481197;
	b=kwTAMQaseHHXm1OvtdjmfuP5yAitRNwwga3kUMMDv+aff0GMUxpxoO4IFxTMFG8meTA1
	 QxNKvDCEjIGOMnW5LhjMDrkeIfoxsY/6uXDxk40a7oqDC7HcjNZwL1vxA5GSR3cDKygLo
	 47zEHFEuQpDjnGqA5fkPOvCK1tPQ+BKYgqHCKNEmf+mu6XP6Tou0zMMlpf5kKdz0MIvHc
	 qYNvr1i3vjSmTTqrAa19kVoBRemof1jLyxPCnyxtyLkSNN5JcqBT00E2m4y3dg6WJZaH0
	 GTz4DLfdkWPigHPXNmKZqtqpsZ5WGI02UbXcvjelNl2AvK1iAefiYUI+Fz5a9tkzu3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nd4FeLTUAjKet8H5al5vx/GFjrDE46lTiaHz/821DAE=;
	b=qDrRQ7s5/1pXZZG2CGcw5YCRlhXUvy61FchlZn4RaC5Brx43TyfgaZdltkZbloew9SF1
	 z80KMn0pHYSL6VIvvtVW64w0jvnBgbfXRtcQPqDxCxtyx1dyAguhBbYwkdXGHxTyFj4SD
	 ckAR5RkguFkE+FZt6D0+kFwExSmgaJBjN/wvJbjTwRRYxqrt1HWTzAlZn6dFuEDM9zS5q
	 TMbX2d2tXMgkHXMicXfWE6XCbMh4m/I6knT9/9xE1AzIO5GsUZqOfjkn1xSaVa+P9ceHR
	 soz2N8miDHcXYERo2eiL1H2DAVSyqG2qf+5xXnOw7dyOeABCkiwMw/xYkm/dIVBbRSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwI5kf1I;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61789606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61789606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwI5kf1I
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67bf3c6654fso4851540d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481195; x=1795085995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd4FeLTUAjKet8H5al5vx/GFjrDE46lTiaHz/821DAE=;
        b=KwI5kf1IbQFDN1P24r69j8TL+uSJxA4MkyfRnjzWVatzqT2bntg4sxPfV67qGOciok
         WNv3Tbih8JmgRGQf3zppUNj0tljCdz+ph6fkmUt8tZVh+C349qIc3oCVoUaTIFZd0wWw
         sjaDF5Sy7JrGMA6X5cnCMH1qEeA38ETg5PzJPXyQbRLp/amsHfHu443HZSo7KqJV2493
         09WHmWDzbEqMAIL+2xN7a9z5qT/EWH7znT8icv+v+0yCDzkiMU5JGV3/HTPvgpSZ9GGL
         n84jYsX/Hgtkrp6BlCnkzC+VWQfltGTOBJnq0Bg6j/D6V50/2m6DH4URavWu33NSTvef
         pp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481195; x=1795085995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd4FeLTUAjKet8H5al5vx/GFjrDE46lTiaHz/821DAE=;
        b=LeJ1MbDV2yzi2qZxSgrfPsj2eQoBSKfyUc0Z9Jm4m30Hy6jShAZUEjH/765723s+Q8
         Z4jb44qWn0xIil4UbfT7j13vH3N+2dGmYOOFyR2B2kCu3IGOsd9422QD/q/3M/bgs89P
         we0RXvmSZLPkuIjtjmlO1jtnDBKqn3y+0TPTnyB+5tSOce5PqixnKRHHpEbzmxqXbpi2
         h55Dek3Dlvoc25znPwPJQ5oJtyq0zO+0IIqTjlLgsQ2fpjfQ6pMb0BLFP/het6WXkTZQ
         R6JsH51a1jB1pXPJENOl70CV38UokVYEe9Gdi4aRV7bsPyFJ/9UtoUZJc2UAeLM/ZaRC
         IVpg==
X-Forwarded-Encrypted: i=1; AL+hErH3f+qixkw4Mf9cjyItcRjCf3vtgQy4V73sZ0hv8HHU+VsoPNIyN45eSIeyziICcPIJZ1XGRFbG2dC8PZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xASCj8I4i22sLDPMQdXYpMXPBP9HrsqEL7/dGNvR9hlMkAvrM
	MC0dy6gvc0gLc1qdXNB7r+Y7nryH5nBqbCkT9xlEUf5xGDUMcjbdY3uY
X-Gm-Gg: AYBFou2LLhqTo1G0CSteOuhFG2TxiSBUm8gLVdVPjgFYHZmOD6lasH9trUwoBnOPTcd
	MHsO5jt1ZyIeoMn/OLMmRHVbgjVe+7RAIqUkr9atb1PPjwozQy9bFA7CPR1SyIpEmyqnsILgZMy
	t55yvGPkL9fexl22xza8sgANJaon7f5wdog5Bel87WgDNV7Z+Bdqwtaqm2942wob8ZSse7HEkzL
	jb6zypJs1TYxYShbzT9q4MKOm2QXNaUmg/kPsBcGxafIVJd7hR0/MavSnTGVSrX9RXQuMsDFzJm
	DqrpvjMxtw+/IN0KS/rR6tPCO67gTVEa0CI6NiI3HIV+pOAYtHw3PQUwnlSiPbys1WIEIAKYOoh
	KS+3j/X9cDt8ft7q5JC5AcEO7wZ6SoSoA8UNu59/5M7mNcGnVm7jm3a2vRrZrpFCON6qiVLwRLx
	HeGByQ+DqEc+Qlh0eG9fKX6rPZrUhdSrRGpQI/ZxcxoUD3XRucIDlZBxs/PrhwzVM+XWVt1rgt5
	FrKj09SEPlVDcCBDRG6cG83yII8IQuX21CZPMcb78WzcUKdQAW73quc9s9jwln5SCyfbQZFqgXT
	YqzvBCXheYTjeKTYmeGsPAbz1MiMW//mJK3Z+LIUzBqcsBwoY3jpcFcVmPAc1mSvo6Uf0Ym8gV+
	3QH1S8wP9
X-Received: by 2002:a05:690e:47c9:10b0:679:8c5f:3fd0 with SMTP id 956f58d0204a3-67c67cb88b6mr2073402d50.19.1794481195328;
        Thu, 12 Nov 2026 02:59:55 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a266dsm6964218d50.7.2026.11.12.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:59:54 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
Subject: [PATCH V2] nbd: Reclassify sockets in the reconnect path
Date: Thu, 12 Nov 2026 07:59:39 -0300
Message-ID: <20261112105939.260856-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Commit d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular
dependency") introduced nbd_reclassify_socket() to prevent lockdep false
positives when NBD sockets are used in memory reclaim paths. While
nbd_add_socket() reclassifies newly added sockets,
nbd_genl_reconnect_sock_cb() omitted this call when replacing dead
sockets during reconnection. Consequently, reconnected sockets retain
the generic socket lockdep class and trigger false-positive lockdep
reports.

Fix this by reclassifying the replacement socket in
nbd_genl_reconnect_sock_cb().

Fixes: d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular dependency")
Reported-by: syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d7d72f3d467710442af0
Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
v2:
- change previous patch to a single line addition of
  nbd_reclassify_socket()
- improve commit message

v1: 
https://lore.kernel.org/all/20261110215723.199948-1-trintaeoitogc@gmail.com/
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ffce519bf008..b2b27f90a7ed 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1356,6 +1356,7 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
 	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
+	nbd_reclassify_socket(sock);
 
 	args = kzalloc_obj(*args);
 	if (!args) {
-- 
2.52.0

