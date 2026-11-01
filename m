Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528205;
	b=ph0ykG5rSinh9Oo304P5JJG2dhQ7IZuNz6/kUvUYYaSAreOIEvmKcQEtRjTKyMjMs7sN
	 SS3jP5fr0X9XjWLYEijDS4gMz5d61FUQeaPDF190V3jTFWxzpEz8mIpedw10J+uYKW8Zn
	 dhDej+WPS5kPJTBzo3rfr3evl4GF2RLzWciuW7TcvfC6Im/tJ5dXJ/CFDiX6s0gsKO5kA
	 laHivZYLRwDrBgf/ZguGU5442nzj5ClB65jpeLKy0xJ/a78fhRknjjIMGrhYLGqREQcTo
	 YC8bG1FO++NQS8IVJ97WlwVqjkcm9O0h+FOrqMX89nAVOcnRi+rkQGgaFGZeVMI2uqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d59qLAsdq07SLmevmGEU48uYx2yFSZTX+xDbdu0iQws=;
	b=WHmK5bsUkgwx6h6A/2XWHoOrv8Uz+O9NmTl8q/cfToPjl136Ms1O1yXSx2Pon+5ufNyF
	 sFxAcGYnqzUtw1abpjbjVbub2Q0yN0SVvmfx9164gK+YozvCXwvrmXXksl3Xvu2OHOB9+
	 SE8+Y+xHQh9P1z/uj+cWN22Ah/OeeIxKWCkp1pRL+rOqFKA+ZrNvbeQsJqUq1mxrvQ0O9
	 PCH12v47xEU093Y+kBrfnD2MSU7WZ3euuAOR+lVSzrj3P4NN0sas2eKi+NhGOlpUbOys5
	 eYsm3Jqif1ThwR6ov+0FFEk+FDEd4iPxIlJURzi4sdNPUxrm84asZWc7spED9iStluw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lc5qMSPj;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8838F606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8838F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lc5qMSPj
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1098583f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528204; x=1794133004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d59qLAsdq07SLmevmGEU48uYx2yFSZTX+xDbdu0iQws=;
        b=Lc5qMSPj688u/x27RlQpP6i9PtZ+d4aoBZktA1fcoFWFyCnyzK0iJWivoB3Kb8ajwW
         GCwcNHwzEo5nRFasFc/FMLIO68TO47O2b1Ph3GEJEq8JWnsQmxXqKYQCSSnwnxz84D3y
         Bxbnd+orKOn8sKCp8gEhP7Zl0YHFjwWwSJajU3UTCi8chzioHZLff2EJvgT/6Awck1gd
         /x4Z3MB1hgT7O0JqzxdyHiErZvyrFna5kQVzNk3sk3eSEBr+sup0a3SfAys73IRcX4VF
         G/+8hcR9m4hjMIUgyWC+AKLW7yEZRVYvJB+DsFVZO0JP8lj78A7XrxJg2/uG1/lERYVp
         8IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528204; x=1794133004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d59qLAsdq07SLmevmGEU48uYx2yFSZTX+xDbdu0iQws=;
        b=xbCNJ5hE4FV8nG/u+DcfUZeGiZd/vO3e0FHRXF1AvKF/ipwKpi8zsLwBhhDQQkDTBu
         gkaBwnQP5t7sFiCBq9J/bcvn1+0LwhHZxM6B1Q3zNC6sSNhkedbpqhBalhNbtKFC0z2h
         fm5HXiB9+X//IyB5AT2mC7q0g7rWqqvKecRDhf6612LebxbVkztD4BHIuRlFel3xLYO0
         yWYyOMpAh6580BD36AJwd97JRzSdMS1w/sMJTVazsOoF8js4cdpvvzM63S6lXNBy1qyg
         5HrKMzOLztvLQX6OqzNz7aZekjt1BHfqPQanhnM1O7ChrUwGxc9JkC3jJN6UQbMO3vYQ
         a2jg==
X-Forwarded-Encrypted: i=1; AKwUvBxBI61v50bi3hoNgMkPvo/2rUtClUcrg7MOzMKYXvTMTCxdAs26IKOMTKMN6KlMsZMYdBTX+iEO9qRjLnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hnnSZX1ENqWqcmwN4Z0EuwVI67zaTsgtM/7mfGeC3kR4vaMfY
	JPV1dcYOYIXzwgyBcWtRUEZdQ11TOxA3/aeu0Im0JNhX91WUN0xOAiiP
X-Gm-Gg: AYBFou2Up2FLj3whevwZk0YDy0l9BFF8ss6vv0kA/WjFpupOrwvT99lZK7HIGlNZee6
	qND2MTwG0Vb+BmBsnZBrUpiwO6mLpUPOM1Uy4xvC5xVYZVkMcIveYU0u4vMGr7nVVCWhppVOGKM
	E3cRyyWh5B3F7soN0KozWGMBjg7kAYUHJEdoYSWdeD4uMeqn7fg1Vps9h+5rOfOTrVMwcrQvabz
	oi7nDgTvcFupvngR1w6tAuQOUAZ6LJCnlnefywfSD1zSJQBL6rpyofVPcD4ZfksWMT6s4o3yPg6
	rBLGnr5LQEHJA0VCOJh9BEBfnSUYsxZrWl2AIatVehNA22XGbw55OQUxYpQk8mGC6JIN6PedpNl
	XzPiiuHvc9voJTTwxVrb5eyyQSzrNs0XRclMOrFgC9z4UHwHOR/+Zp264JDBs+no2DDvu/YkhL4
	Nd9AEP+Spqnn3CsivjvvpGMDjX3ERglcjZrM58pGqyl27wfos522627RV3f2I5YEcTV3APRJHpI
	8hL11/MZIyZzsvoC6O5dd1/19dMcOjHpHa0do60BRSz+DlTJy7igQFRu7JK0eEyTUgVbMa80nlo
	eiqys1surKu9Zp4v1jeJO7PHi7eofnIqXQ==
X-Received: by 2002:a5d:59c3:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-48e76ab7f04mr9789052f8f.15.1793528203654;
        Sun, 01 Nov 2026 02:16:43 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:4773:6f00:2aec:42c1:9c3d:e009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm12978706f8f.29.2026.11.01.02.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:16:43 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] genirq: Resend pending interrupts after handle_simple_irq()
Date: Sun,  1 Nov 2026 12:16:35 +0200
Message-ID: <20261101101635.270221-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit 2c9e7f857400 ("genirq: Teach handle_simple_irq() to resend an
in-progress interrupt") sets IRQS_PENDING when an interrupt arrives
while another CPU is handling the IRQ. However, handle_simple_irq()
does not check for the pending interrupt after the initial handling
completes, so no resend is requested and the interrupt remains pending
without being signalled.

Check IRQS_PENDING after handle_irq_event() and request a resend, as
handle_fasteoi_irq() already does.

Fixes: 2c9e7f857400 ("genirq: Teach handle_simple_irq() to resend an in-progress interrupt")
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
  - clarify commit message - mainly that the interrupt remains pending 
    and resend signalling is missing, as pointed out by Marc Zyngier.

Related 2025 patch/review:
  https://lore.kernel.org/r/20250708173404.1278635-2-maz@kernel.org

 kernel/irq/chip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index de754db414d1..4a131dd72196 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -626,6 +626,8 @@ void handle_simple_irq(struct irq_desc *desc)
 
 	kstat_incr_irqs_this_cpu(desc);
 	handle_irq_event(desc);
+	if (unlikely(desc->istate & IRQS_PENDING))
+		check_irq_resend(desc, false);
 }
 EXPORT_SYMBOL_GPL(handle_simple_irq);
 

base-commit: e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0
-- 
2.53.0

