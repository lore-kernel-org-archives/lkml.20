Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040945D939
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748673; cv=none; b=E6TpyxafOq1kdfSGZWIkq6KfAWvbhjRC8OpUlcD/fJDFYF0Jj53x/vJEIXnOT7Mr+fjSjgRmQQdntL1pDKSkuiev04jjdJbiCg/D1UCxlhGS4CBQca0FsDJLcmInIFpn2Kijv/H/ai5tnuFNqbUnMjn69CoH0YUZ3y+KWCWEaLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748673; c=relaxed/simple;
	bh=Nadl7HsFYXW6P9DTRKvVWpxRaLB4EMXS+QpbLsbVDjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfTxGEH0uQ0cMW74+HrQJ8VqupUzdKZcFPDK0ZTefQE0NHu9mSI8/mRc398bI2KsXnuxfiVKNKbbEsNJtTmnr7MhcNlZAcQuCfnySh5HjOWcBnuYoI2xrhP6esYJcRUfBJUnTQ52CG8NEPReWSNTfvamkmdGzAz2OydwECcNxjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROms9/7j; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROms9/7j"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e6df2742cso191384666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748670; x=1792353470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bd3F/qTb7l7go4vsYHnwO4e8nInvYSKDA0ySqIxH6Y0=;
        b=ROms9/7jMiTg+0GA5yfz0ljiBokccfUoeyAvsZ8NCtoJuaiZ0e8CY8kZqz3M4J7XVU
         SSvM7hhTuiE03VeEwjdnWUUEoncUTXlWGSNxH9ppoFDtS5B07xMCxB2nzxnaz8sDE3i0
         4WQtTymxISjjAuvhSThEqzhHvyugiLwxgBm+uOt792Fk1wHGY/EXqlFL6voaDwjmh0Dd
         ua5nLoSOHFdAmjkltTlc3BXZPZdLJPN9abIKunM8EuIFcH1pIFxmtDkw/4hRA+3Xylvh
         hw8AgRfv0wdYi2dWZ8JatEs4lDvDOYDBqYixAqY8Rnp0xaIHPa9RhkO+6+W7sZc9b2WD
         Arjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748670; x=1792353470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bd3F/qTb7l7go4vsYHnwO4e8nInvYSKDA0ySqIxH6Y0=;
        b=mi8NR9bpoY6fnYFgcLEQl2U6p2TGiqwKc2s6Qd0ffuuDVLwGXJl4gWiRYyYI9qRLH6
         aR5rv5c9RxZ9uxd2qqzRea9AytrEs94fnPiVpPIHRS8V5pzIE4i3n1hCkP1LvBPRpgAp
         iZN+6moU62KiPVY+frti8QBuuqw145QbHlrdbhvXitpfUlB81KqKEaKPNrtkwgF5mhhH
         HFQ6sW2WHYkMjSB0IindWZC+xSFTEAAV+y0gHOaEi6KDdD/tWHz9jxSIiADl/k1UlwIz
         RPMxxmwa91nJF12Ea++w26AziWMflXYWt15gT3wQOUpq61Ws5VMPdylFDRzrRw+ywa8d
         Oo3Q==
X-Gm-Message-State: AFq9FYISAG2SET63fSYehHkEXYzx5jEMYbbGiEJyCX44Wvo5r3vmoOBK
	9lWD+sTuhDcGxpxCzYJ/SyfEyRtF7ANT4Ah0hmKHJs1wyjcClgzdiPWS
X-Gm-Gg: AYBFou3UWwUZnw30k7Z5v2q8mtKHliOueSPgPaWDMdUXzOwKSacoBWnoceYMQG5SWN6
	4gt6dA3JuFFj8uCNSk4zbSNOtAqQ8OKPQuYjr8WpVb+Ra+XXH5oFJBNzTccwPXoKZXx0fvVxHYn
	m/Z5+Nw6GZhm3RY7NpvOIa+JBH4MQ6kCx/eQVeeFdghvcxxZIvuRXXT9SA/TUaR+wpMloQOd5yf
	FHIr9fOEWtvKoO+D0BG7lXN5+DczBQyb3aI/x3aIhc8kC2mh9Qn8o4hmpfZy9xjI/mGADO6ihvw
	tQCYFpWaAhzmSZcgjAS7L70MSx9IhDGRnFqo3aOsOfh52Hps3ehLiRO8LQGk0ZyJ23Cqt5yuVBN
	98yopoSSLzAK62R/AFpeEU9J0YJhW07ST0cFo432IvMBUxY2PT5jABnW5EeTHCokoHVd7Tw/Kws
	FkAO4jCtJS3Zg+xdy4r186LzpaZImTxirsLptEUjpGnlO1aLaVH2Z3SbQrvKeyleeBtiNBVef9Y
	HuLtePB/sO0X1GS7uFyhw2gXoMq16vXN1lFYbwo
X-Received: by 2002:a17:907:9694:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c31a9fa1d3amr847020866b.9.1791748670007;
        Sun, 11 Oct 2026 12:57:50 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae9fsm381315566b.26.2026.10.11.12.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:57:48 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/6] sparc64: honor queued spinlock layout in secondary startup
Date: Sun, 11 Oct 2026 21:55:54 +0200
Message-ID: <20261011195729.981243-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011195729.981243-1-linmag7@gmail.com>
References: <20261011195729.981243-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trampoline's ldstub modifies the queue-tail byte of prom_entry_lock,
not its locked byte, because SPARC64 uses big-endian queued spinlocks.
Acquire the word with CASA, release byte three and poll while contended.
Retain the predicted-branch barriers for Spitfire erratum 51.

See qspinlock_types.h for the layout and JPS2 A.10/A.35 for CASA/MEMBAR.

Fixes: 145d97858597 ("arch/sparc: Enable queued spinlock support for SPARC")
Cc: stable@vger.kernel.org

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/trampoline_64.S | 34 +++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/kernel/trampoline_64.S b/arch/sparc/kernel/trampoline_64.S
index 51bf1eb92a36..62f404b3079a 100644
--- a/arch/sparc/kernel/trampoline_64.S
+++ b/arch/sparc/kernel/trampoline_64.S
@@ -106,9 +106,19 @@ startup_continue:
 	 * We lock 'num_kernel_image_mappings' consequetive entries.
 	 */
 	sethi		%hi(prom_entry_lock), %g2
-1:	ldstub		[%g2 + %lo(prom_entry_lock)], %g1
+	/* Big-endian qspinlock: acquire the whole 32-bit value, not byte 0. */
+	or		%g2, %lo(prom_entry_lock), %g2
+1:	lduw		[%g2], %g1
 	brnz,pn		%g1, 1b
 	 nop
+	mov		1, %g1
+	casa		[%g2] ASI_P, %g0, %g1
+	brnz,pn		%g1, 1b
+	 nop
+	/* Spitfire erratum 51: barrier in a predicted-taken delay slot. */
+	ba,pt		%xcc, 2f
+	 membar		#Sync
+2:
 
 	/* Get onto temporary stack which will be in the locked
 	 * kernel image.
@@ -212,7 +222,10 @@ startup_continue:
 	 nop
 
 	sethi		%hi(prom_entry_lock), %g2
-	stb		%g0, [%g2 + %lo(prom_entry_lock)]
+	/* Match membar_safe() for Spitfire erratum 51. */
+	ba,pt		%xcc, 2f
+	 membar		#StoreStore | #LoadStore
+2:	stb		%g0, [%g2 + %lo(prom_entry_lock) + 3]
 
 	ba,pt		%xcc, after_lock_tlb
 	 nop
@@ -326,9 +339,19 @@ after_lock_tlb:
 	wrpr		%g0, 0, %wstate
 
 	sethi		%hi(prom_entry_lock), %g2
-1:	ldstub		[%g2 + %lo(prom_entry_lock)], %g1
+	/* Big-endian qspinlock: acquire the whole 32-bit value, not byte 0. */
+	or		%g2, %lo(prom_entry_lock), %g2
+1:	lduw		[%g2], %g1
 	brnz,pn		%g1, 1b
 	 nop
+	mov		1, %g1
+	casa		[%g2] ASI_P, %g0, %g1
+	brnz,pn		%g1, 1b
+	 nop
+	/* Spitfire erratum 51: barrier in a predicted-taken delay slot. */
+	ba,pt		%xcc, 2f
+	 membar		#Sync
+2:
 
 	/* As a hack, put &init_thread_union into %g6.
 	 * prom_world() loads from here to restore the %asi
@@ -389,7 +412,10 @@ after_lock_tlb:
 	 add		%sp, (2047 + 128), %o0
 
 3:	sethi		%hi(prom_entry_lock), %g2
-	stb		%g0, [%g2 + %lo(prom_entry_lock)]
+	/* Match membar_safe() for Spitfire erratum 51. */
+	ba,pt		%xcc, 2f
+	 membar		#StoreStore | #LoadStore
+2:	stb		%g0, [%g2 + %lo(prom_entry_lock) + 3]
 
 	ldx		[%l0], %g6
 	ldx		[%g6 + TI_TASK], %g4
-- 
2.43.0

