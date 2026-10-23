Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750747;
	b=pQtSg7+a5zVr85vhXMG6hZK/x8WfSMRT2Ers/DbyBI9y6sMwxBZjD9tWWezqEbIe8JCT
	 t9E/bOP9U1UlkAjzaqtte8TAGy2B10nB/PN8OQ3aPX2XX0svg88Scc+6aUfKrE+Fc92YD
	 3ItlExPWDgf4w/J3K7pbx4+YbDneZvdzhpHBw4yP4KqFRgfpvAwzSnLcp8C1lcd/m6gpl
	 Z4qgj0VjOLislnyDxT1S7cmWDFteUdB5CiU1a1xB6lRDngDUimGpjLG2sVLEWyq9MOIwH
	 wnZZmBmcqzOJaTAWqqvsdnLRTliVEzhM1XZfDyeMYI9tTWgTcCOuzi7lUFX3pGWnbAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EtqIIM3bW6NOeXuYxzInv9x9RXwFgInG15ngZwHQesg=;
	b=GoFLdWinn0ZuVzzIRoVXXIdXa1Ssmwa9Prw/Gters+xigdJGxaGntBgKiOVgpx+ZJ0AX
	 E4MwxwqE1u+GwzgqtTv5Rey49eQuL9wwOwLITaIwDbm9tGpoEV42xqF4ebOg75XMv+pze
	 8nNEJl2DorJGD8YM64aFqGQmp+pPLBKazvvFY2Dj0mYu5009/w2Wl/4gVL6/qfJF1IUnf
	 oUHMKhPhi1hKysnGU7MfPgxmBEeA6eicRH41NOxHH/uRURu7inJD9cZB6SIx728IsQQPz
	 /TccMbYRstjDGZxCaE2RxgWnSa3PMHOToKEXdzraDy5G1eRw+JrKoJu5c8kAr0072Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WgJoA6S4;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B25606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B25606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WgJoA6S4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1274838eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750746; x=1793355546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtqIIM3bW6NOeXuYxzInv9x9RXwFgInG15ngZwHQesg=;
        b=WgJoA6S44uO/kodNCvO5TWbOc5qRb941lr1BdiQSPZD1ZmbbclzwNvze+lgsbWqm+j
         vL0hh4xcgsfWF9OZTnxs+7mFhoy49Q3FrUYbumgMFJNmeLOJvguO0mjbUThrdxcWFRi+
         LgqqA8/+mad43oN5NaWT80APlrZc7Isi3ZCfIQZO/wVEOAGDHp/aoExxTdsBGwo340QM
         8b+vAayY3N0rgkUXFHgAFb93/fEkdsVt6L2dgkBk+9DW2PXNs0nwivLfOEPVbv/LI/yd
         eIsZziTPdkHUj1twXuTaIMAL3S6XIRRilLxju6S5J9OKXjRXTufHW9Yene8JaU6X3Hg0
         +rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750746; x=1793355546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtqIIM3bW6NOeXuYxzInv9x9RXwFgInG15ngZwHQesg=;
        b=CNa/rtZRW0aYc+dpGyBEpOR0Un40XxOYQMX3PO6UREHUJ9hKJRhfgqU6ZDLNTVGRH6
         6s0a9SauT7FHu/27gIAFapaYNbzlNGmIfmFUFzMsqrmLbi5zx63T4SgGfkNa+r380A7y
         q4hRBF8hRfUAi6gCCcmP86UkulDTMbVZHjEyBRjS5SaM76MHsU7eCVRRYNAz5w+24iGF
         jIbn4AGv0ftjc5gsKcATNw+kTiV29B4P6SiTzsTccd0FDmlw6lxbn/PwqH+gogjY+O9i
         CAqCWLpQqv7apLnX2ASZ7Qvziv/3tSTf+NAeq1R2GWrqfVG/LL3pFlIC0fGg+IbSxSlO
         tN6g==
X-Forwarded-Encrypted: i=1; AKwUvBxe/FohKpt7WOdM1GlB34itBvVyqDEsqUCrpZD3m+PkJcn9LXNWg4QIGnGzXqYgIZW8leiAeSOenn+B2mI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTdBEFTUTVC5EOLf+f10X4xv6zthM7KFGhGLCRfTDKRLxxEB7w
	7tJT8ze93bIiSXBsAKg79Gg0OltLwND6oQTS/hnkJTufCZE/rfN+dPb0
X-Gm-Gg: AYBFou2Z1dGb511CKFIKM0aalIO7nH2h8sRjGziWv+2x5dYEMuCl4i8NR8r5KlnSheL
	oBkiTf3qdAB9ErUzJcn1pGix4Mr9xl/6tO7x5OlvH0EpD9Qsjf4iXjHBPAbFXZly6nHo8ZUfHGu
	C8PlMWk7L0tweZy3m0rDiC1AOnu2rYr77L+yn5ThfmdzflsJPdmPGSf66BTZAEPG20aBm+YifPF
	8QkgJBaR8KOEZkmm7dY3O06ifAlQBIHdnbntyAeHzLeMu3UyvosjkG+/QR3dvKJ4USGtYJ5T6Ri
	6DP8dn1NohHTG3ME5I/WJitebM+SqHYNEiWPB6pcqVZ/wfKVBS50CvY+AEojGQlGNBJRcO6vJCk
	Z4ylU703WZ+zBpGz9ljHF1obV3q1CNdnxOS2BIZCRs4bNHOMkPLkWOXefHGIbnaDeHAKesmupA/
	ZupHhEZ4fJ4FZcFjBq1jYppzW8SmV2WLUVjrXZHUMcfFbwZH80ttnyXwRcN/kByir2DCeAjP79f
	nroJrr/0rH90h3xt7oAGTq0x3RR9fOyEbVaGfuWRqdX2TK3mU56jzf+sSTQzNApHedxmqHuiwk=
X-Received: by 2002:a05:693c:6383:20b0:369:5583:bf48 with SMTP id 5a478bee46e88-369d975b14fmr2185109eec.24.1792750745608;
        Fri, 23 Oct 2026 03:19:05 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:02 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 1/9] srcu: Record callback registration stack for KASAN
Date: Fri, 23 Oct 2026 18:18:33 +0800
Message-ID: <20261023101841.2910719-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023101841.2910719-1-kunwu.chan@gmail.com>
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
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

Record the callback registration stack in __call_srcu()
for KASAN diagnostics involving SRCU callbacks.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutree.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 2b0e2b2d2c18..46fe2f0cef85 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -20,6 +20,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/irq_work.h>
+#include <linux/kasan.h>
 #include <linux/llist.h>
 #include <linux/rcupdate_wait.h>
 #include <linux/sched.h>
@@ -1530,6 +1531,10 @@ static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 {
 	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
 		return; // Leak the callback rather than corrupt SRCU state.
+
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(rhp);
+
 	if (should_rcu_defer()) {
 		struct srcu_defer *sndp = this_cpu_ptr(&srcu_defer);
 		struct srcu_data *sdp;
-- 
2.43.0

