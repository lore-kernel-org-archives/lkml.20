Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275234;
	b=iGLlepjJqtWQMJHvyvIgmZI0IhgdFJgM2l64reHw1coNwriwvTElldqAFMo97kwYwoKh
	 L2Dc0F5wzEZYVRjJSOCh/ozv5u4Hr6fPfwztZuxjqxE2ht840fmg6ovnKiRbew+SBuwyb
	 k+n9ZhBRA3aZB0pIOyJGhfZZWB0xgMO+FTShOo+vDP+gTB7dizsTExvPbokoIsHoanV54
	 yaPJ0U9Oer3vDfTASkAEiiWgWHnC+he0x7NgE8S7YzJfcdf8JSe0sLGRJNjCZSHZl/MVt
	 AB/KgK4iyOIDVnuVNvgDG23v+XaJ/rg3zWtjQ1vl9gMhLL8yG3C/g8MiP7tieT1DaYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Et1r+gIQ8MTuvycC4HRAx5tJUodeAXGWjzSxkw1zFH4=;
	b=1VDKljwD0mejPkWh2Uu6ObN5PCKocFnxy5Pv9nP+AribeeDNgqs2hbTXDyJzCNH49flk
	 ssCPf4jd68XWc6M5fGnH6XCQVpVcTd+9b06/xoI3OsPqp9TrgqrIS7BjVr+JtjgjU9UMw
	 ziBP3xKey5K+6pW1ZfUa7FTgz0nJrqBmUjHb6R8Q6+5wmwmnKOEZ0oQSaPvFcN28qVS20
	 6Da/h0CE2RfTL9QHQlO2o8qtITxY5A3J4tM6Cd3Gp0YA4aCz8TAxguFPAR1BmqCv6JzIO
	 wXmmLnrhGeVu7IKcPxSbz/X87MogGvPyuAuN8c/5Lr47a/bJTI7JLLggv7gsCjKEzbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCBZCaE6;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93ED606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E93ED606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCBZCaE6
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso1712998d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275233; x=1794880033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Et1r+gIQ8MTuvycC4HRAx5tJUodeAXGWjzSxkw1zFH4=;
        b=fCBZCaE6fFZk2JxV1XUiicGVJOk1JEOZkTR0p11FAzOX12Sw+vQ84343WQIC0jpGM4
         1NLzk/KWsB1hlM4wtiWo+BehnvslEBFFpj5+lV0OBsdLbboedz+ESWZmx2P9LXgsrpyS
         fDg2VmQR6rpOw3xAZNzZRepDiwWOysGf3qE8u6BLrSTZ6Fz8P42Sjuai3NQyw7bb3kiQ
         baD3LtQN7LKbjTQHq4nVancjYp6O9MK20d+ytpCisherh2xoFz74m7a29DhQU0hjfdal
         CkfbL1xWQ0pa5pP7hPJKA1iBhB3cXYIYLbYW3r49rh68555JnvyhiizhwrijxSkPzNtw
         tR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275233; x=1794880033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Et1r+gIQ8MTuvycC4HRAx5tJUodeAXGWjzSxkw1zFH4=;
        b=JcEaMU/yVaCQVjltZ5TkdVS1jHzjXJiklnQYMVUiLpXZMhUpT0+8ltpcxW0dNNBaHs
         o+nM9WkmhhhcrQwLEiH+9S/xYyEOKNRXN3BbcXxSs9/GWuSgBfEDXRYemjr5Y+fiyaBF
         qdQw0Bbf5OSNlSe69EUrkLl5geT7xAShKu3EMFL3Yax6mfRigKApGngfrAQwJf5VRYUY
         FuBAFZnrJ4GVXYzamI365/ifnswtHHXB3J9hqZbg2f5rcey3MWseWsSIWXH3wad0bD4r
         IKynnMTiX2GB5rU8WgsgQAHeH+GJq+XnLUiXddcFDwmKLJ5teDKx35p2zH/DYlhiFhvx
         q3zw==
X-Forwarded-Encrypted: i=1; AL+hErGAA2NneHZGUi8qWnp7qZvRa8S7GheSRTN+MniUMVPpBO9SLFfgmH+xAVBtA2rcKHXkLiMRkMB6xbJ8Spw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dMoVAhlqOtM6I5xUBEgvnyPJvcjOEgg2LytCLr3FdpQoJkKaP
	ArMWo2n9Wl+DjZJSNIlsgSgq9T8xbFz8nAWW8ie9Wl+qToPH/sEwtKQF
X-Gm-Gg: AYBFou0xSMTc/BliN3Mz3WBFmdPr/KvcrI6EAKmNpbiehE1UwcPafuarpz6I7DkfobF
	RNt7LknPo+7y8e8sIDY4xdF/FXmISji/Wxt8DWDosnwc8NDozIzg3Ms38XcPe8ElcUIIvmzwvg0
	OD0Cso+1rvYTc5ewXVfsUDTV1FailXFVuUOTfLw5GZPgQgbB1LdxgMNX1k6eKoKvmyNti3E0s/T
	sTDPePba1zNcUPsLtUlFEQ6U8zN2w8XVaKxl8GfFhw+CDiNx++0JSl9iMDa2DpA6596nJa54ez1
	czzz/y3r6hYFOna9wIt6wUt/I/7bBoIYe75jSTH+OEru8KJL+agzI9g6HZvC9jv/eScrPxRidcr
	f87AeEHZApbY8359zdjqcL2cL7YDDIDKx4oj2TMAZIccWfKLVrvOvFHiwAJISK899N9LzbfwpjG
	lmjonh0rDqiiqMesB7Ij0GIjDcAUkij43ao5vD01/b/oIpJS2OxmO/TURLS8RZ6I3LkGFqnpoDv
	oOv6MqEZOmnO/p0CSbdXlycp+KmDNhtYrvBMihkJH3wUOsolfeaChLipVCMA1qXca5HoewKDm9I
	spFMX1AaIxiHGO/7OYfV17VaQY9N5AC3udA9vZvzEuk0OUKzlXxoARsIRL29MkVTyrbDxUm262q
	2nXr1ipksbw==
X-Received: by 2002:a05:690e:c49:b0:679:980d:996c with SMTP id 956f58d0204a3-67c570e9d29mr668665d50.54.1794275232987;
        Mon, 09 Nov 2026 17:47:12 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589e9b4csm693780d50.15.2026.11.09.17.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:12 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 09 Nov 2026 20:47:04 -0500
Subject: [PATCH 5/8] powerpc/perf: mpc7450: Add the PMC6 L3 events to the
 alternatives table
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-ppc32-perf-v1-5-a6e8a55b3b48@gmail.com>
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
In-Reply-To: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=l5OzSa/snacUuw4Hvm7vZ0uo46L9Lthln/uI94gjUHM=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU+5+3rXyqtMKy9KT6nycVtaX2x669insDbO+w8bS
 nh+bn+9rOMjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuuSbD8Jt1j2r9+7
 f5apctb2kVbS6YXl/9f4qJ1eP2STbP1s6OkOBjZFjR2G6rf2vdDqO3R5/OOXVZLu6VD3MDX83t3
 Xcb1nhe0GYCAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

PMC6 repeats five L3 events at a second select value that the
alternatives table doesn't list:

  0x61f  L3 hits, also 0x503 and 0x603
  0x620  L3 misses, also 0x514 and 0x61e
  0x621  L3 instruction misses, also 0x505 and 0x605
  0x622  L3 data misses, also 0x507 and 0x607
  0x625  L3 touch hits, also 0x50e and 0x60e

Each is the same event as the PMC5 code, so add them to its row.  The
scheduler can then move them to PMC5 when PMC6 is taken.

Not tested on hardware with an L3; the 7448 has none.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 27337a03ebde..b2fe977cea16 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -185,18 +185,18 @@ static int mpc7450_get_constraint(u64 event, unsigned long *maskp,
 static const unsigned int event_alternatives[][MAX_ALT] = {
 	{ 0x217, 0x317 },		/* PM_L1_DCACHE_MISS */
 	{ 0x502, 0x602 },		/* PM_L2_HIT */
-	{ 0x503, 0x603 },		/* PM_L3_HIT */
+	{ 0x503, 0x603, 0x61f },	/* PM_L3_HIT */
 	{ 0x504, 0x604 },		/* PM_L2_ICACHE_MISS */
-	{ 0x505, 0x605 },		/* PM_L3_ICACHE_MISS */
+	{ 0x505, 0x605, 0x621 },	/* PM_L3_ICACHE_MISS */
 	{ 0x506, 0x606 },		/* PM_L2_DCACHE_MISS */
-	{ 0x507, 0x607 },		/* PM_L3_DCACHE_MISS */
+	{ 0x507, 0x607, 0x622 },	/* PM_L3_DCACHE_MISS */
 	{ 0x50a, 0x623 },		/* PM_LD_HIT_L3 */
 	{ 0x50b, 0x624 },		/* PM_ST_HIT_L3 */
 	{ 0x50d, 0x60d },		/* PM_L2_TOUCH_HIT */
-	{ 0x50e, 0x60e },		/* PM_L3_TOUCH_HIT */
+	{ 0x50e, 0x60e, 0x625 },	/* PM_L3_TOUCH_HIT */
 	{ 0x512, 0x612 },		/* PM_INT_LOCAL */
 	{ 0x513, 0x61d },		/* PM_L2_MISS */
-	{ 0x514, 0x61e },		/* PM_L3_MISS */
+	{ 0x514, 0x61e, 0x620 },	/* PM_L3_MISS */
 };
 
 /*

-- 
2.55.0

