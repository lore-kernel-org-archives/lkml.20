Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20031E823
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064569; cv=none; b=E0VRQ7H2Td1+hiDot6vCIP2wOoKtjqdHY/7V3oe1A01VVGPcazKlXRQj75j5ZR9oTniwor8U+LXexg2mu9O6oHEPMm6NBCMGOD/t4TMRj5Ayk++UhTd2Sj0f823HJQJC0W+4nYsnzeyFHA6DYznUblA4jOiMU7z9xRY+zwbkqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064569; c=relaxed/simple;
	bh=FM9sgnYHKYLQdnbQxJPIQBCYzxHbimOCpUuRPbakWmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kevDafJrNq6yx0yg+HGhys8hbTVjGr4ls3jdRTH/kCIgT3rWbafIRqFz1BMp5ByoBwECa9IXIX1Fhwmgl4/TqnQuJ2pQI0BnieislL0q+it5AvPjv0Cps7hkelkUhvtzGRTL7gTJsPb1cyNtFzzoSsy5ieUwh1tizkR1CnJtp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVpJD6uI; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVpJD6uI"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8633a38df87so2447791b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064555; x=1790669355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/KZ3Zb/HHoL3F/ptWbLdF1qyOZdC4rzO0WRdzYjvaU=;
        b=IVpJD6uIedx3XfMFa9Zn6StdvFSj/X9Fk0yTqR73hGlsPGCBYISwY9ConFxUNlmyO1
         xbVlSvj3nW0Bm3CtYRPeRj7ElTZAO7W6VouUsmuYKeilxmPs1kqvWYvO9eDRQ9FHIseS
         XX111yGrMYLrrB3CfQjVPVH8sRSIxsRYgBlulfbQ4ZDZGkb1rukCuv8RVC99Jm0IALlE
         jtIi4/tjduf+YUXGQKQ+hJ9KI7E94UZ5xsq9vzTOw7Fmb8+cTzh9axcU2eAFVpj9nXd+
         tMsaOK3QE3gn3COEctzztkmtu4WJpD7wqe++zxHs1/06bDrKzkMdgspgcwtRBY11Ce7h
         4hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064555; x=1790669355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/KZ3Zb/HHoL3F/ptWbLdF1qyOZdC4rzO0WRdzYjvaU=;
        b=p73ov+PSmmO0y7ddFRQSkyZ9/aD0CklBo9dUbER3A0x+vxyrB5PvNB4F1rRacoAQqE
         F/h76eWe7UbECkPNxAIOAaFsnG7h7k2aOXPmSqPXowGEhBbl0PImU5UeP/SPZnXWtGUr
         M9QxORjL23y1pB9b7J0wAt8Rmqiz2zCFTFqZdx0/8wUGpexLJgmCol2vq3rM10QUYuub
         mCZrL3wO8t2WiewJopPZObtw406KLhCfIMuJtyEfXlh5VzgI6hnNTFvj6JZrH54fzHdf
         dyazl0UsaBR3+gvD2AyOZOPDywMmA4M69FcPdlwj0J/b7u1vnMTnnQpWXRWqiI+52T8r
         z8BA==
X-Forwarded-Encrypted: i=1; AKwUvBzlQ0f3YOSXS7ZTm/VMUvgFa/0tH97Gm937j0etcRfi5VSLg9t2lafPYwkNIL8Pj2CGjCrAMPe50FT3Lds=@vger.kernel.org
X-Gm-Message-State: AFuF++nHqTSesaEDR+HFxnBouwhPXdXF4yxCb0Lr4KSHDma0OJu6dLze
	rzktOsAmY/4m95rp9bMef5HSGCrsnMNCHrHQ3uoKZF9KlbmjOqqyrC3n
X-Gm-Gg: AYBFou2cuoQvY7yP7VWgGavx6hndrk6atJtdzk+YDHCUyQCkhRJiNQZ7w0cau+NA3dR
	k/aeDvcCtO1i5/bx8s3JBDBdr26knVS79L06naUEuWIBf3VDsTE1bY5JPRJ52gUOxuEFPqTRGeW
	Pe0KGItBSBhKAFonxZeiQXeyVAxrGRBvjxVvL/99D2CxHT2kn6pmQujd6ZEeNyDgciTGKC+26P5
	6ic1fA2bV8Aj7s5Ked2o5RhHxML726ftmO0PX1yx7ayybeSm9eIpNIuFxinca6+v7NYx9rySjlA
	xOydvHdQQn6YtErGv6vJflG2KkL+0lfhRn8C9lax8Vj9DUDzoCZQUPm6nzt47nruo0cvjMWenBi
	HCeVyaaEEVd7cEcII3rSq8uCVxel7hhsNXCqNjLFRk0/LBKQDpi1tOW+E6cn5/AC//vrsqIH7es
	m1ilxd/ayqIfoFr/trP1CKEiBZ84/Tc8gFdvWiNldKXVkx4DL3T3BJyjo2cYoyvBCTPcuZQFeBL
	+myKa5j5mT9b2Z2TogB0fXoo5QgrGKWX9UR18KMO73172GPCMr5+2L1YVBkurRLTw==
X-Received: by 2002:a05:6a00:23d4:b0:878:3507:8d5e with SMTP id d2e1a72fcca58-87c8432efbbmr362613b3a.37.1790064555038;
        Tue, 22 Sep 2026 01:09:15 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c31ee8fc5sm458535b3a.9.2026.09.22.01.09.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 01:09:14 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: jmaloy@redhat.com,
	tung.quang.nguyen@est.tech
Cc: netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tipc: Fix a data race on mon->peer_cnt in mon_timeout()
Date: Tue, 22 Sep 2026 16:09:09 +0800
Message-ID: <20260922080909.21123-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mon_timeout() evaluates dom_size(mon->peer_cnt) before it takes mon->lock,
while mon->peer_cnt is updated under that lock by tipc_mon_add_peer() and
tipc_mon_remove_peer().  The value can therefore be stale, and the decision
whether the local domain has to be recomputed can be based on an outdated
member count.

Read mon->peer_cnt inside the write_lock_bh(&mon->lock) protected region.

Fixes: 35c55c9877f8 ("tipc: add neighbor monitoring framework")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 net/tipc/monitor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
--- a/net/tipc/monitor.c
+++ b/net/tipc/monitor.c
@@ -632,9 +632,10 @@ static void mon_timeout(struct timer_list *t)
 {
 	struct tipc_monitor *mon = timer_container_of(mon, t, timer);
 	struct tipc_peer *self;
-	int best_member_cnt = dom_size(mon->peer_cnt) - 1;
+	int best_member_cnt;
 
 	write_lock_bh(&mon->lock);
+	best_member_cnt = dom_size(mon->peer_cnt) - 1;
 	self = mon->self;
 	if (self && (best_member_cnt != self->applied)) {
 		mon_update_local_domain(mon);
-- 
2.43.0
