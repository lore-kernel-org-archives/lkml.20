Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248802;
	b=h7/AsSxmYnIdrQVMNhDQ1As3sQr+cCWEjc61g9tV7WAlYNzDshWyWXji5rKGz6m4QlJi
	 g3NGSIGf7uVJWIxGl+i6xrBgnQH+avz1Agsa3uSE6KrG0ZVBO8fREpDvaajD22DgLyP7I
	 0X4DwwofwiOijC9v067UFquKVnpbDzdCUlL5yKBFiCOKoFCn5+y8mRvGcMaOA2qTO1LH7
	 1uDmPwgtjlizGzYyQqmEDVrd6gnBMexTKwrhGaK+7U0dtWOgDSaSil6dpBajRr1Fxxysr
	 zh2hrFgWU/kM4/Qark8dQ3A10Hoy6aXSmVxH+J9NyUmzHwEH1SCVOm+4TVQW6jTvw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KuWXOr8bdBpcuJfvomt+cRvy3pPxw4DWlc9TpuLSuDc=;
	b=MBrdsuFRgc2HlhsFLf9VsbfjJwuibkO/dFu8mATNipE0XoHqfM0A1N/l5WUhUtCKAHnM
	 wbNSzl1DSgWcb4TnfsBnHuXeU7JBFzNBsV9J60R2xkn/2CW1wqxEElZ/8rH1Zq+/aT3Us
	 h0eN42GIhLQt1vuX9AgEZ2L9s5dvv72dMR2APD5uw7uOlmm2l5Ua98E13oozhIt0R+u1D
	 IIqrJqaOVVleATbr5MKV8Uj843/LAEHLNVWgB42BEDeiTKZaZdNtACU2N06OLurn3149E
	 crwNg9P3ew1UtCzh+C2KwOkP5T9ZDxOXvJiIiMytY+i178RQ6GCx/uN8qxEMYvmDPiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2Pfn4F9;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBA606AFC3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6CBA606AFC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2Pfn4F9
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-372bdb942dbso1664005eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248801; x=1794853601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuWXOr8bdBpcuJfvomt+cRvy3pPxw4DWlc9TpuLSuDc=;
        b=c2Pfn4F9VQW6nJV5+c+VrOUx9i1qZY0ugouUvigZsKq+kfHnKh2XLNThNmFo48myfw
         bI2J/EIrAkBxP0+1c9ltDkON2PXfOybEthW/dfOR5ISTUUCdYANR9T3AA+sqBvmWX2XP
         GUmZcx2fKuVu7/aKDFBr7tWvK7WVnTZ5yTb0WfGYuXIZ5lSsRWWzJMC9lbO7LPzrKclY
         Wx0tH9xy2bjNxNsO1cUh/78M3HaARwTXqFN1kYzndOjK3BhSJepH8yP2vT8eTyYMaOr9
         kzL9jI6JFX4Jbj/H0/VEMI0uVVImc0xaPZErH0R7uafkldR/zBvJhmjBPv6rrRl7DqK/
         RgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248801; x=1794853601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuWXOr8bdBpcuJfvomt+cRvy3pPxw4DWlc9TpuLSuDc=;
        b=C3YY8+r2UKSag2KC3pPPxUcZ1RtUjKq3Zk9YOfN5V6Qeed2ivrGZCKcU1UpbA8TM9V
         wwEKoblbWUiGZ2cHb/FbIP8V8ODZJ5PpXkwFpCmC/2Q1Qz7lPKAtVKl2+M/n2pzZtJqY
         DPAJJlOtGt9X4vSMVQ3PN+e7Ibbx1/gzVf3GOzBrS4SHwHSRAs9FRt6f/ELyERukStzy
         85AoTxEduL9jl1e+xDbP7P7yCAx2HT35+8DmhaDI942K/X9A1XXwx8Jkw6j7ZbN0letG
         wjsOebISySaxiPsiJlMu+CQl9UgaoDPKL1p60yjpFaojw8jdAjKjkjH4qLLZbnE1iwkT
         dwRA==
X-Forwarded-Encrypted: i=1; AL+hErGyQqSxetpxocyIXkYU26Nhy16e1Y6ljUldkyPNoyWdrjQJxlc6v+gEN5Pb4EL2ttZQ1QubJ/+/C75aNuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uLJToMopdBruoWq1UjjH1hetttGEQMBvVol/juDTaD7H/A/Rw
	O+WlrkPwQMaFe8tKz+PJLLw4T4cpZnzg5Vmi+pKXxvJQDjmNGao/ON+9cuOu6Q==
X-Gm-Gg: AYBFou1Xd16Eo2iLWV05w7wTmGBhkpRxbWqivQWnX3lWFpfeZEvqIQUrHB04lIrSkNn
	UH+5I0WtQmwwakOrROQLb6PqlWnhAVYpwruPZQKlBoX4BH8iQn0KMxu5+CdJ+zQG+YKMP8bKAJI
	f4zPUsNU42F7Asf+d4VjMtGzhKtqg3TyDS2CzihKSKxDVxQdcpTvLQOGy9wYriDkTmi6o+6SWZf
	HOlohnj0IS0fIDdfp2S/3P7J6A/U+7zljx8sanJ4nd0mC4g/AW4TiH+ByQrmT0WvaFQyFwT4s8r
	bHTsxBFZiZQwiMBh6ArqAmSQtpZ6NXpVcbVZz810MyYSboXR53dwxhoFUDPGf0BdRznN/s12WG6
	p33jEJGDc9qANfQLvpao7Yd8+sRxchQx2IjK2kifAr5vLnWymKzmbMDMjHxRqOMZdvr6RrQCjsJ
	dKWllKEL6PaTPX9wOLL/wVATo8ElrA8nhbQgP4QqNreLAg4tP+hoEnm3oVlnv95ZnwCMRhVbuIw
	yrSVzYgxKRjyrx3gkfa8N9STf70zlFfsc++ShrkSVunOCAf77i6ryqcS//XiwpGkMLRtp8lthYa
	Vo+2bX9h
X-Received: by 2002:a05:7301:fc81:b0:36a:1e50:e45 with SMTP id 5a478bee46e88-3751ee7be82mr85465eec.9.1794248799721;
        Mon, 09 Nov 2026 10:26:39 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm123652eec.7.2026.11.09.10.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:26:39 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] MIPS: SiByte: Update effective IRQ affinity
Date: Mon,  9 Nov 2026 10:26:22 -0800
Message-ID: <20261109182627.3517986-1-f.fainelli@gmail.com>
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

Booting an SB1250 kernel with CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
enabled reports:

  genirq: irq_chip SB1250-IMR did not update eff. affinity mask of irq 2

The interrupt mapper selects the first online CPU in the requested mask,
but sb1250_set_affinity() does not update the effective affinity mask.
Returning IRQ_SET_MASK_OK makes the IRQ core copy the requested mask to
irq_common_data.affinity, but leaves the separate effective affinity mask
empty, triggering irq_validate_effective_affinity().

Update the effective affinity with the single logical CPU selected as
the hardware target. Apply the same update to the analogous BCM1480
callback, and use IRQ_SET_MASK_OK explicitly in both callbacks.

The IRQ core already rejects masks without an online CPU for normal
affinity changes, so no additional mask validation is needed here.

Fixes: 421d1563c662 ("mips: Validate online cpus in irq_set_affinity() callbacks")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- update commit message
- cover bcm1480, remove the check on nr_cpu_ids

 arch/mips/sibyte/bcm1480/irq.c | 3 ++-
 arch/mips/sibyte/sb1250/irq.c  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sibyte/bcm1480/irq.c b/arch/mips/sibyte/bcm1480/irq.c
index 7929bee911eb..4c18a2c755d2 100644
--- a/arch/mips/sibyte/bcm1480/irq.c
+++ b/arch/mips/sibyte/bcm1480/irq.c
@@ -113,9 +113,10 @@ static int bcm1480_set_affinity(struct irq_data *d, const struct cpumask *mask,
 			____raw_writeq(cur_ints, IOADDR(A_BCM1480_IMR_MAPPER(cpu) + R_BCM1480_IMR_INTERRUPT_MASK_H + (k*BCM1480_IMR_HL_SPACING)));
 		}
 	}
+	irq_data_update_effective_affinity(d, cpumask_of(i));
 	raw_spin_unlock_irqrestore(&bcm1480_imr_lock, flags);
 
-	return 0;
+	return IRQ_SET_MASK_OK;
 }
 #endif
 
diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index d7a656cd7ec0..a971bdfac356 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -108,7 +108,7 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
 	irq_data_update_effective_affinity(d, cpumask_of(i));
 	raw_spin_unlock_irqrestore(&sb1250_imr_lock, flags);
 
-	return 0;
+	return IRQ_SET_MASK_OK;
 }
 #endif
 
-- 
2.53.0

