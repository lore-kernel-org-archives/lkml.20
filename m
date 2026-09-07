Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E41542B33E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767965; cv=none; b=pdvgrUi4wXEEMnca91Cbi1rBNWaQfVwHQHeVewj4mvE9BR17XJ1LGBcYLoajCkiM8GEu6gfe03QJCg4iIA9437Ni64WNITPWVwbuU4CDrx4Hju4ovzqrY/Psi3REC0Wwf6BhFXz0yS+++utAWGymAsgk6zZJH88LOO224lqa2eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767965; c=relaxed/simple;
	bh=dg7Xxulm0f7n3Jncso1740bE2QW01y0FbyYtuO+2rns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSf6C9367AQ8v+qaeyk0g936iEDoiFiNBnUQjSeor6U/PIPdN0ZFzZIZVYxsTc9BFrsy0jYAY+xxwK4uWPRIVdY51cQNPEX9CpDb6NjNKvw1N+BhVGYXtlN5azyebVeklipV5c9qgJ9ah/Yu9FVOFA2fLx5QvsbYNc1y2pRlb9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3dQKsRR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3dQKsRR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceab75934dso31012465ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767963; x=1789372763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DX1yDb5IswgEQSYkpWQVORuzyx8T1C+zUGVpHzXErSU=;
        b=A3dQKsRR6bQsVkTgc1hWyIHzpvhr56LM9fIaKwZPOgKPQMVbMjU6bETbTF2C64DpXH
         VYazgsbVFvYIwCqCHbOIbIytWeS5oTEv4fdUS04sAVIrEhYxp+dbtfNs3lYD23hWGmmJ
         lylH6Ph4BJyLw2eD4lgqVIWDWEGRYe3B9THVYPrjkMNAaUhUVnlvKspsNxr5gCDcDNJi
         4gFwO7Uhv1iuIXoKeuu+S2Ojp4UeISomEx9tt1kC2648NjGdX6M+UkmO3VwVf2ubjYp0
         uZQKF9SOOhuKJNvucCxYMufcJlWNsKu9JTbk3ZP0yx65aIow8M0Gu8VknMTw4vjQgQk/
         Nx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767963; x=1789372763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DX1yDb5IswgEQSYkpWQVORuzyx8T1C+zUGVpHzXErSU=;
        b=lHobEnIyK11g9H+rp7oYfxxpPteXfk2RLItM0rmh6ez38CkIBNS2rRNZrmxfckh3ZD
         27Hr3/YauDDhCH2woHWJ2I4ReSgUFha9a0Acsraw3f3xaPdOWfLL9YI+TqXBx3yoXNUF
         dYmSqySRooWTeYKR7lj8XOdHiznucIDEJ3ixfo6Ob7RBpIh408G3RNcP1JsaIZCErlTg
         U9xFzwCrKMrWftNAR1d9Zhq8orppK2TUSagbER4V/hS/ikbV1t9tDcK4GmgyLOGOwmVA
         3g5AuMJnxJ+X5Q9TfSQck9EZ2RYnQrDgEy4/VmzffdD+sZxWOuEkq3yigc7L3CzztIMa
         T5Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwnvP7ry5co5V7ll2Q39Q4vhP6Pj9WsLMzzCCnYQcDoUx2MMjEf5aUnE64Ld9Z4s4Dcofa7hRXxGT0i9t8=@vger.kernel.org
X-Gm-Message-State: AFuF++kH9vPywzuuZ9SCteaI1W5Zha0gd2kpL/eqxmgncD9la27TzQt1
	2QqE4OGecJQimpeTV7XSTi/KiqhahYzR6+fcOS/XNvXU1oB6hQQXIiu8hsT4iWN4nZE=
X-Gm-Gg: AYBFou0em5FkeWjeebi+nbj/yBL4jDSpnKt7zeTkyyvAlA4nocYErI/9duxwNnQ8cSB
	jwXIClXVE+j63bKmGWE2HNcDLGl8u8J08eMT8QAj6xzMX9UceIGZrdPVue+UOr/RfgbcX/0D2Ya
	JpMNCgtPJUTeLPiSuz0o5McCJf1XK+ioB6btt6P8A2X366mvI5tTi10VrvHADq/9Wa2hejXonK6
	AK7k8EpQe1Q0Nor02sR14qdUeR5BSx7/9q/Y6sVksqcE/G1YEWPGBdJPzs74ZMUqds8tzcxHdcU
	4+WoEd53pHHiUtP5NM1TpnianNV13sncrAdSCL1cX52bvHUALdNLcJ8avlEVNM47hkRUTCYrSd1
	w4tUWVEWkQtDSMjo2+FGTrDVFTS9fLmEINQ0d2fxZDogWZSj8rzO/YXAUtKWw4RW222Fl7ivG7O
	Kd09nQ3hJ4r4OEHA84GUXvmF4ol0h7VOd7XAXbm5r+fLMnHBbGfWG8VWQma0IftG4KPTldgFrxv
	GevHa0=
X-Received: by 2002:a17:903:32c4:b0:2db:39dc:48af with SMTP id d9443c01a7336-2db39dc4bfdmr135589825ad.17.1788767963010;
        Mon, 07 Sep 2026 00:59:23 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:22 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 11/13] srcutree: Remove srcu_barrier() sleep for atomic SRCU
Date: Mon,  7 Sep 2026 15:58:27 +0800
Message-ID: <20260907075829.2073224-12-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

The atomic-SRCU path in srcu_barrier() sleeps for 100 milliseconds just
in case there are callbacks to wait for.  But call_srcu() refuses
atomic SRCU with a WARN_ON_ONCE() before reaching the deferred-enqueue
path, so there can be no callbacks, deferred or otherwise.

Drop the sleep.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index c19f59725706..a93bf803e2f7 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1895,12 +1895,9 @@ void srcu_barrier(struct srcu_struct *ssp)
 	unsigned long s;
 
 	check_init_srcu_struct(ssp, false);
-	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC)) {
-		// There shouldn't be any callbacks for atomic SRCU,
-		// but just in case.
-		schedule_timeout_uninterruptible(HZ/10);
+	// Atomic SRCU has no callbacks, so there is nothing to wait on.
+	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
 		return;
-	}
 
 	/*
 	 * Register any deferred callbacks before snapshotting the sequence.  The
-- 
2.43.0

