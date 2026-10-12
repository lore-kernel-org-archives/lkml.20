Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D27E388881
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773629; cv=none; b=MsCQiKA0M5DHyjwSMMw+DU4rKRMWq5fKcvH3SDq5GO28vUMka5ShMFB9nLZnscFueKq4qq461HzQIWFV/PaPm0Fd22SErhWzYST6rVyT6UISHqIfW+l9+s6HensNoPxnZUQzuH/xEiDCvmi89ZP0QK32YTP3Wel0VEfGJ1tMhYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773629; c=relaxed/simple;
	bh=wFiyNTApVzbmOJ8YmXiKHbbaMqMlzCEPxniykvKVWG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VEHBBFxfNBQztDa0X1GlKzoEk6+AvSY/B53Qzi5n0IC1jXcQ7BmBkq+mNXCZ45oLB4kSEWBcJv3e94fO8tiC48H2BR60MOaJtLgAoCkqyoZCzmKz1WaRyGm4nm/YwLdWHTVvD5L8mI42yPJvdbuwjs3bWZ5KtZouLGxDUeZF9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZJ8vIDN; arc=none smtp.client-ip=74.125.231.128
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZJ8vIDN"
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-82389e65a09so843277a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773627; x=1792378427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hMmN5wMCsEP96yCvuuKED5eMtVAoO+7UVDbMSBVHpgs=;
        b=JZJ8vIDN0TG1Yk+D0bf4tFn9BLlOLXbsDcgIK3Al1K9viyvwKLF5ZoWFXMnr8eiPAJ
         3go4x24XFVbbX5QOkYc3SkDjHp4v2yBCf7XoAxu9Km4sVJh5L4NGJXvJqakUSwPBwsbL
         lOTiSNiePfHuGCub2zWZRp81BKhN6hM3nDzTQYXVek/Q2zwj2XsqpX41QFi/0zotO/98
         hT6ifez8bjwbWlqGxU4/ff9suvtRQskYKcUUqstccb6zlSZU5wa3/p6BklXEJxDKq9+g
         taQ8r+q7bP+CFRDrl5Tg1CRNkNIhpEIlsHSIxlnTZvZeggb+90gCV0W96+hNS1zpU83m
         yiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773627; x=1792378427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMmN5wMCsEP96yCvuuKED5eMtVAoO+7UVDbMSBVHpgs=;
        b=bvYf96b2iHRAwyCa1SSVctmRqBaK/AFX9+kqDHndFL0DneVwlVRE5BmlpfMFP4UOEg
         0ThNkysApmvw1qtMyVEDem0EjzFlNu+OdelqxoJERbPx+yUZi1rdUB/sM/eN9ZFd9aGE
         fSI0CKVHYNdo6kUSOHpC+DcdN/i9n2ERHd+nYao/vInFAnM6hpG0sOWacGxXCl0f7zuO
         b+6yzEC04B4bRTbjW0jAxYl07Wa3WFuq0WMwD1zrKaY5RefYZjPoJ5WMW1jfysZy0/WC
         /1Eg2+pw0o6u3q4hnloE4IOrK1wL+/PTgCI9M0kXDGFHqASs+9KRqhdvtt6UUtTZIkos
         yxlg==
X-Forwarded-Encrypted: i=1; AKwUvBw0xHwjccLXponW3JDjPVjt7LPuFlqlo4/ic0IzH8uMlJopfJX/TbNeaQpVWNd7li6XJhtQweHBvwcMSg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrtrltlIpyS4qmtPJAHuq/RracJVLesaKgspUZYGtjU4aW/WRu
	Efa3v+wSYto34KnJL5OhhI13PA9T9sS9NmlXlUsgzjJM0RcInToEovp2
X-Gm-Gg: AYBFou0ACGI0XJtj28eNinm9KKBzrQ1Vl4YBmrLtTHiIzTShBESiZxaWGRI0x6BtnB5
	EECtBGrWpfuQ2zDQyJxDlFVcYFiO9RTY125UuncCLRpJOLJnb+CAtd2VORRVD09N9xOszL+hOZ2
	Zj3yCyqwY5+2dw0N83MPPoA9QSaW3EJNy7NrRZjQ4N7lVhfTjGbJu2UdX6aHWyQlY8rPkJYUgXJ
	zNjKYNvUelvIGB3jPOWjT5rUPGyUAuwZHdEDkN/Px9a/xhfJGPWRj/+4/zKFslnyZQEVb3gtnvl
	zJJ/+5WsxVMwJuGcJkfEPXm4Cc9DI4RGZSGcd4PusRBVcFEZuM62ZK+/Tq1cFV8EgKjuv7VKMJe
	eSzLkqY/jvKbGwu3ANvFdnZ3TlrlY9F3IyIH8aRcfl/XtifEE9svsX8G6tknvgvYyucCbnrVNHI
	BoCD+4Sc1KiY6voPZ1hzri9HRFQXskel58mdsay7vyU9lKMuBdEF4mBEAO/liEYIViveMJItO/c
	LKlse/sqsE4tbmfmV+Kj4CvaQCRdGEsvczGJg==
X-Received: by 2002:a05:6830:2e03:b0:81f:acdd:bd0c with SMTP id 46e09a7af769-8309555353bmr10160987a34.12.1791773627182;
        Sun, 11 Oct 2026 19:53:47 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303494f76fsm8621722a34.2.2026.10.11.19.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:53:45 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Allison Henderson <achender@kernel.org>,
	Paula <pamoutafpro@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] rds: fix out-of-bounds conn_path walks via handshake exthdrs
Date: Mon, 12 Oct 2026 10:53:36 +0800
Message-ID: <20261012025336.54756-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the lane and the connection-generation negotiation are driven by
extension headers in handshake packets, and both are processed
unconditionally, even on transports that are not multipath capable.
A non-MP connection (t_mp_capable unset) owns exactly one
rds_conn_path slot, so a peer claiming up to RDS_MPATH_WORKERS lanes
makes every subsequent fan-out walk conn->c_path[0..7] at 504-byte
strides past the single allocated slot (KASAN: "Read of size 8 in
rds_conn_path_connect_if_down"); the generation negotiation opens a
similar out-of-bounds walk on the same array.

Only process handshake extension headers when the connection's
transport is multipath capable, so a peer can never make us walk
lanes that do not exist.  Both call sites in rds_recv_incoming() are
gated.

This is a port of the Oracle UEK fix for the same issue, picked up
where Paula's series of the same change left off.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/netdev/20260825120132.51636-1-pamoutafpro@gmail.com/
Link: https://github.com/oracle/linux-uek/commit/2fdeb0513f18
Fixes: 840df162b3eb ("rds: reduce memory footprint for RDS when transport is RDMA")
Fixes: 905dd4184e07 ("RDS: TCP: Track peer's connection generation number")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v2: Replace the two allocation-bound clamps with a port of the UEK
    t_mp_capable handshake gating (suggested by Allison Henderson),
    correct the Fixes tags and link Paula's series.

 net/rds/recv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/rds/recv.c b/net/rds/recv.c
index 6204e577a90ae..93ee4546ae362 100644
--- a/net/rds/recv.c
+++ b/net/rds/recv.c
@@ -379,7 +379,8 @@ void rds_recv_incoming(struct rds_connection *conn, struct in6_addr *saddr,
 		rds_stats_inc(s_recv_ping);
 		rds_send_pong(cp, inc->i_hdr.h_sport);
 		/* if this is a handshake ping, start multipath if necessary */
-		if (RDS_HS_PROBE(be16_to_cpu(inc->i_hdr.h_sport),
+		if (conn->c_trans->t_mp_capable &&
+		    RDS_HS_PROBE(be16_to_cpu(inc->i_hdr.h_sport),
 				 be16_to_cpu(inc->i_hdr.h_dport))) {
 			rds_recv_hs_exthdrs(&inc->i_hdr, cp->cp_conn);
 			rds_start_mprds(cp->cp_conn);
@@ -387,7 +388,8 @@ void rds_recv_incoming(struct rds_connection *conn, struct in6_addr *saddr,
 		goto out;
 	}
 
-	if (be16_to_cpu(inc->i_hdr.h_dport) ==  RDS_FLAG_PROBE_PORT &&
+	if (conn->c_trans->t_mp_capable &&
+	    be16_to_cpu(inc->i_hdr.h_dport) ==  RDS_FLAG_PROBE_PORT &&
 	    inc->i_hdr.h_sport == 0) {
 		rds_recv_hs_exthdrs(&inc->i_hdr, cp->cp_conn);
 		/* if this is a handshake pong, start multipath if necessary */
-- 
2.43.7
