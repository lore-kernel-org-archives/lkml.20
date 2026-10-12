Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E643B3A5E89
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830933; cv=none; b=Fn9ChMStsygCwELmGTKonFnfqAlJ2rpoyot1SSiOi7gQUDaGmMbOzgA+3alwnLprKurgS33/JicF2QikNGjtjaINzfAI55WDHnW6fBvT/qvw8T1IopKVHUSvBH4M2saLtOO3eECa363Xf80V3F9ANQs8nB7u8PrpLQnqs3aziBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830933; c=relaxed/simple;
	bh=XwAp57s6t2T5WBJojbhGzQsWgRkmZhIhViv42WsnBXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHrHWBf6WnrjNp2xI23XCkE8Panhsy/wguZ+bC6QYqFiyT3A69AES16onQYM2KshTnmArq9Qpcac188R3Py40jIFpxwHo5aMSvSZzdYgFI4hVKc8S1xjuT7hcUnzlL/zP1d4jpQDPjFGiasx0oRVIhWBY583LKd3kANtAA0NmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ya4I8h3I; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ya4I8h3I"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso301968066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830930; x=1792435730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB95fmRKta5UC1qC17l7YA7Hzg7lVmH3sUQeY/dSryY=;
        b=Ya4I8h3IUuLscfWVQ1QPjMhEXkWrJ8TUXvuhVL8kots9KswY32X5bTNoIWPfnqGdAi
         j1j6DLZaq+N48o03a7TmDiD0kunJ/zjjVzrAAXdFDhVVm9xsY1PYKz86E/lN4pwV5Q+C
         wfBc/KNqTIrKqEJwOrslxVOW/DAACdq/NFqCZS6wodFFCfvqSMnmzq6d/F2txH2yzcN3
         IJXrlx6hd2RZ5szMcimHfxvnmOnAXflTLROWVWfGnPZ0kf/nCcgH3b2ALA7DJgtourTn
         FFYsRR8hqpR+y7LTHT1PJZOh+WvH0wBhZJlgBFHchnTmDbWzTdcIk2zFkJLOvXP8BSCR
         s19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830930; x=1792435730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB95fmRKta5UC1qC17l7YA7Hzg7lVmH3sUQeY/dSryY=;
        b=U1V/CTiZgqBpyjJpvQptEVrSZAZzcISICgKyI1PYsWtjssaaa4K+xO76TGEBwR2fVA
         gGRoyoV3P+0/CukdMqsbE4lfNlAANz/glqcxIW39iSL2JXIM9GSk6Y+lhfaJ93E9VoIB
         85c9vxY54XufRc9dMfVoGXTtEbDbM72qvewvIql4IGQCdDWaRB8pYKBCGFt2pZWOx/I8
         lqbT3/dYLoWyflwTFhy44CyqAu6kGTFCJMphxEF8RycE3nPykT3ihgNhgekkykDIK3FW
         HdC0joe2rb5g7F4FSU0y2aPjDlZxqiIO6xBZTgEgzUs6tlGWhwAtCk1sr/lmI5X32byN
         cpqw==
X-Gm-Message-State: AFq9FYLgNmYEA437VO57HvrzGq4+fhJrbKGZN1GWlJwUKdd88kkuCoD+
	hvidxgou/UAOolGCpk1iI8KiMR+wes+edtXFipRahxeURvWhf4r1Dlbc
X-Gm-Gg: AYBFou1JSeAcwjXiULsQ/3vjBm0TSp3iB3pOcSQ6FfA2tYcXwm2qVPX71Cj95nn9roX
	oGKwjjrODTVFX5AEJEQLnYHX6LgYjkPtRTw0nW+vg8VvCyXq8JC5Ac2w9fZGLcUn3OflUo3H57K
	Xtfw2/aRyFU2bgJbAboJ1ANnJamIZxgOMK/vj7yyUsjiFgbicetvgqFMjipoiUC5VbioxrdKNJ1
	hBjuKPcrpui4gERcSEHaVfRTPKzVJXRWhttY1Q7yk01dDwmObLlsopF3rEUZaG8KMwyuuOcVOsY
	CeZzqTZpdQO63EAwY80llaNktW2yDGhGsIKVmV9suluqc8XjCWAvULuFjSM35K9P5xyPOQB15VC
	Hsr7n4yKjAm3hV0js0kroMflq1nAdJlzCMiItNLzrFEU7NvSl3IUZGGNXxs9OpTj4UN78qYjN0U
	6HaO/ElZHt4i2cvGZqTICSvXP1nBD8drOp5bF/nk4BxuE0LCI+10TkrfdE80PVxLprNVJiVLEGQ
	ArhH8d9wM8zeZVCmgPGy41Cx6Rwna3mJMojbu5z1gDg+xQ7xXk=
X-Received: by 2002:a17:907:72ca:b0:c29:462b:f908 with SMTP id a640c23a62f3a-c31a9fec198mr1293598066b.10.1791830930106;
        Mon, 12 Oct 2026 11:48:50 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa5aa7sm488517666b.55.2026.10.12.11.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:48:49 -0700 (PDT)
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
	linmag7@gmail.com
Subject: [PATCH v3 4/8] sparc64: stop IRQ setup when descriptor allocation fails
Date: Mon, 12 Oct 2026 20:48:05 +0200
Message-ID: <20261012184826.986050-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012184826.986050-1-linmag7@gmail.com>
References: <20261012184826.986050-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_alloc() returns zero on failure, but build_irq() then configures
IRQ 0, which is reserved for the timer, as a device interrupt.

Halt before publishing the IRQ or changing its descriptor, matching the
existing fatal handler-data allocation path. Returning zero would let
callers continue treating the timer IRQ as a valid device interrupt.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/irq_64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/sparc/kernel/irq_64.c b/arch/sparc/kernel/irq_64.c
index 3f55c69d5f3b..4cceeba726ab 100644
--- a/arch/sparc/kernel/irq_64.c
+++ b/arch/sparc/kernel/irq_64.c
@@ -619,6 +619,10 @@ unsigned int build_irq(int inofixup, unsigned long iclr, unsigned long imap)
 	irq = bucket_get_irq(__pa(bucket));
 	if (!irq) {
 		irq = irq_alloc(0, ino);
+		if (!irq) {
+			prom_printf("IRQ: cannot allocate interrupt descriptor.\n");
+			prom_halt();
+		}
 		bucket_set_irq(__pa(bucket), irq);
 		irq_set_chip_and_handler_name(irq, &sun4u_irq,
 					      handle_fasteoi_irq, "IVEC");
