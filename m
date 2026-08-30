Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9963D325485
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123183; cv=none; b=JpMMJ8ToyO5w5GcdNtZ8UCfv8o0+Kz1BIpjs2865QAUqGgt2YlD8qNg9zpROXCnt35vmsCOm+ShJ6BRacb2un0SGNWmIcq/RI5Bp3EUoJSuhwV8kw8tXCT0epXL1bmJEGcC25TzygpTtQUa/pI4bdIQZ8uImcYBDSoTH8IVeQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123183; c=relaxed/simple;
	bh=EOnSXOVAAeXVYSqilMUhL2SUOzE8QoOUvM+prd9A1TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATxj/CDZm89pqwvt29FtmcsdYJh8dyaBGHr/9NeBEW0Lp7Xv0ru4QqTyH8pxdlzFVENAJPkcd9J3/nlbH1QKRw8ZtAXRSatgjUA9NE6H02uyRIh7+IIwUmtoWS+g1UqqIDKtej4wvJ4o55bAYf6y4mjYDF5+1TFJwzDhA3Wqbfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjXVZdSd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjXVZdSd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d7195706f1so27098745ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123179; x=1788727979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsQW+e9qFtWuEHb6msaYSCJD2h6v64jckrT0lnLqEOQ=;
        b=GjXVZdSdWxHhSfEhqJ8f4a51fhS4ThyTHXbGnhbNAG5wJt9Y3orej4TlIrgsnZcWxW
         E0s605c0keDlpf1+vdcR8rrPE9u+gFnSuNLwiRYuEuydLolOaAgrPjBiUAGU/O1JMtXo
         7QxH4YvFAF6fod38gVg0R9n0eY7SfPhToTCWyXYDaasKr4pI6LLnTO7LZwRBIDiApFV0
         mc4IYzuaRl7c28C0ron65xJ4zugSOjI1FRBBa/jTr6yOrvhudPqnpZOmY3j/p1zuT6k3
         gYzUEFj6VBB+icdKFVdEQMiVPrQud6tLQ8ZvtIakaVVjCF0BXNM9VGVezNQjHHjRXxTK
         r4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123179; x=1788727979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsQW+e9qFtWuEHb6msaYSCJD2h6v64jckrT0lnLqEOQ=;
        b=T58mYDCCZ6H6Pv9ke7r6dLVcfCZmQsQE15pamvMDkLy31ISZ+aWJV7mQdstWeL5cTe
         KB1fzjfj5t1jE147NW8TJZ7Bx6uUNY+sqXstDGiTA2ujm9kaE4aLdOBv5Z/xWR1YtM31
         /I6QC7vAuNeG8VoPrRR7fBlSpwB+2Lw58pGr990sqVK4iT81jzsYz3LFC6fO0LoELnYi
         nvSVTdA1Mh8cqljG0UwNRYNWQn+Ko6O92kOpNHWubebLtfkcbnKfHX6SA/QDy4pbEkvC
         is+HJ71j01kfLHai2kwh4eJA6/T+n5iuHn5EL3So6lDGD/X/Gvs3wecd2O67tWNiC3FY
         /y4g==
X-Gm-Message-State: AFuF++nZRD9VHOLfRjotiZgb4qNlXkNAvCKiK7ytdi8VOZkAYsKuIQF1
	LgpUd9lDPAClMH3+K213Xd5stq/g+3fl+FPdzBQJdaWtQVIZNe/XOKM/ipgj2nZQ
X-Gm-Gg: AYBFou3ofex+bg5wp+vDIjZIe2hURCKfSsZZRsFZbw3foCnLgeFyQuAvBAWYa1gOayD
	oeZ6TwDrvGNRhuc+0peIAPGITvMvDNCTyDQ/2Y3YxPbZH/iGDnDig0T2XfaQ+8+tkLVUom/IM2a
	65oEwtI27X1T5L8OqMMipbHetC/TDOsTnqdYUzhFI0IfMHX6rf/PE731lyODTqN4HOkMHvQf1oY
	fWQk0nkMnb5A8KXfr4m80KUcQv6W/b7U8QHJrhOyeIEXcercH3jH07wBwh4i8jYfWiU8DzH3KhY
	IOMigZY1QQOzJoEZanW+abru7CmrgxpZyub4HnUMBeXrC4OZr121U2BBe3lsCSxVfWVuvMykU27
	U8t5TlU5UpRuIOv9eE69Fjci+7jOTL/WMeMi1AndFeTXDlJO6cgSKhEJFwc+D5JeE2aSSVi10AB
	eyRV7HHTp8V6Xf2IijXS0OhzWDe+Ld/zSQlLOsLMtx5HRpi7LZYRD1qF2TgHef2d0o+ZOWKe0IZ
	DoDu+XOItDgoqmV7DXI6TUaG1GNH0PZFPK/dHyk88/WCT9Fd3Y=
X-Received: by 2002:a17:903:1aa3:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d74dc1065fmr279050945ad.2.1788123178954;
        Sun, 30 Aug 2026 13:52:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:52:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 13:52:49 -0700
Subject: [PATCH 4/7] Input: gscps2 - serialize hardware and buffer access
 in gscps2_flush()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-gscps2-v1-4-c733d4cae7f9@gmail.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
In-Reply-To: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

gscps2_flush() reads from hardware registers and resets the ring buffer
indices ps2port->act and ps2port->append. In gscps2_enable(), the
trailing gscps2_flush() was called without holding ps2port->lock, racing
with concurrent hardware interrupts and buffer access.

Assert that ps2port->lock is held in gscps2_flush() with
lockdep_assert_held(), and ensure all callers acquire ps2port->lock so
that multi-step hardware sequences remain fully serialized without
unprotected windows.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/gscps2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index fef6fffb6f86..36c25db9ff7f 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -228,6 +228,8 @@ static int wait_TBE(char __iomem *addr)
  */
 static void gscps2_flush(struct gscps2port *ps2port)
 {
+	lockdep_assert_held(&ps2port->lock);
+
 	while (gscps2_readb_status(ps2port->addr) & GSC_STAT_RBNE)
 		gscps2_readb_input(ps2port->addr);
 	ps2port->act = 0;
@@ -364,7 +366,8 @@ static void gscps2_enable(struct gscps2port *ps2port, bool enable)
 	}
 
 	wait_TBE(ps2port->addr);
-	gscps2_flush(ps2port);
+	scoped_guard(spinlock_irqsave, &ps2port->lock)
+		gscps2_flush(ps2port);
 }
 
 /*
@@ -551,7 +554,8 @@ static void __exit gscps2_remove(struct parisc_device *dev)
 
 	serio_unregister_port(ps2port->port);
 	free_irq(dev->irq, ps2port);
-	gscps2_flush(ps2port);
+	scoped_guard(spinlock_irqsave, &ps2port->lock)
+		gscps2_flush(ps2port);
 	iounmap(ps2port->addr);
 #if 0
 	release_mem_region(dev->hpa, GSC_STATUS + 4);

-- 
2.55.0.897.gb25b4bd76c-goog

