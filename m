Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742651;
	b=GzvO7DufvG7gC10msyNKAtzsl0I7wAVx2J1lNSsxPpPghqhyjgP7MjUKETdwFI5l7pa8
	 WaIq/+bxWeeOzCBAPl/rXl/DrBZ7zekxbiPdOYbJv1ZIsVZq+68sMGyzJPGHXDwiPS0/H
	 1SW7pGgPg6ASkUqU/PWJVs6MmXeI3k6VOHD+e/6vJJMbITeTySKP2VUxvhCNwTd6KII9G
	 2LBzb4J4WfbtvCLNRSYDcFOImB7AdmZJtSpPxYvS9+fbsqgtb8Hrh61TgtZ+5JkuYc20d
	 PAvDgHmE3Ld5yIKrqdxXxsF3YSojyOaPqQn1jzjgBr0fUdNRgq2dEnhFdGO2OUqBUkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9h9kWdl4UuQD3zSaTMBwk6BIuE+01bV25xA/FSfWtZo=;
	b=JAsWBPorbz32LDEmjC5s9s82BF+BLJtDqNGU2WW74NI6m8F+fKfmb5iPW5i8J9ZFGoTj
	 QCnQc+Uw1jGDlB4hSZd7Pvck6RaRQmJyDhoVbGxg1+saq7U7PppoYpMLp0+5BWLnSnVJ+
	 fgzXhGYdkrLcCQEn/k8JYoGqYBiKc8ZK7lGGisJ5pzjQZo63y5WkbheNhFHiTd1YTd9Yi
	 W/64+U5U2xeo2VvQeU/eD22MgE34sW+fnxZoYsU94V0PQAccuCMi+EfAjIJ7xQqEDs2/F
	 sRunmA3nZx/UyFM0jtiTFxsozvsh1AvwvX4I22lLApsarAixJN8cl8KmhCgOQu2QEiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Or0e9dZ8;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F056D606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F056D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Or0e9dZ8
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so190838c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742650; x=1794347450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h9kWdl4UuQD3zSaTMBwk6BIuE+01bV25xA/FSfWtZo=;
        b=Or0e9dZ8H5dVBMFVLgOI0FokeolSMzfR8Bv2+18x/RMttwmjYXCnBwKgZrWhkfI+6z
         FhRT0mw1DsQze2rn8D9m9lIB0v2Ku0IYyTf7y879F7np+zbnfKNRvf+/EHFzbnzlZYwD
         v0VjEtOYfhpOu97/rBapk3hkzuWtqy4/XY+hAUWqWHrukFFJgZjjXvYYeVXzxkwO+t8t
         mBKtAy7Ax3fgkH8oSfeEqeiZ9PcRW1xFS1iLArJy8LTnIGUYRQZQWJg4ORR8Af1Bitkq
         Lc2Z7dRt5zmy/7QxqMQD5+rFsF1K9H5bUIVhd2AFf8+R1SghPNN7jYWPlJLlMhrMB7E+
         sPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742650; x=1794347450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h9kWdl4UuQD3zSaTMBwk6BIuE+01bV25xA/FSfWtZo=;
        b=ijc6lnDeTIVDCRxcOhJAbNmyyB21RqGpEHdrCQP7/1eHmM/7fUUwllL0i9Enr9RnRm
         IRyl6bExcqXio6s6I4Nl4ihldMaUvENR/8Fv7I8jzi5db36XXWzBJbMKc8XGhtFf6o5t
         WH1fL+LJDPqmeSfFkAFdOX2r+IbKloCL3hwbFCuvxR3LIvKXfKC2yxTYT9kZtyyOdNpg
         mRs0v35gainwlCkUTaBpgVfU5ROxnGJRK1lmegtaoajKzyz9Rn1nKdEfGiTyc/OW/fmY
         XDMRN142gnMp2oyyHrr+7opcFre+MWaazKjmVrVrXaDCy/FsPLJIdBEARRVTeVWFm09p
         +51w==
X-Forwarded-Encrypted: i=1; AKwUvBwtosO8JxQKcSkg0UFHMJoyVAk6XQ7yrEhfkCnN8ddibPsFMFLK5WClkGg74wWkZXUl+EWMewGqywJ4L0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XFlxMgxofpZDgsHl99O+85CgleBkkWusw1Tq8qt18QJr+5gBt
	+4orQSRoSBjqxdn8mVmvoQZeu95GznwsP7N6dVwKANSFYUqxj7oUa265
X-Gm-Gg: AYBFou2lzQ3GttVo3/z8yGc9BlKxhAl4hHL0IpXSRF6d/6YZeC6rBHWXW+F6yVv+7d0
	wwjDPaqt77LzL9F1I3ZNk0fhT300fpjZE5UPPgignPR50feUcPBGeBSTcWXlPMGm7gzm49hdJDB
	3Ku0d/NBRCwS1vVkvhKCSFcPoX9YW7CLt7WErugYZ3nM6eSuUmhLewx1kEGJ1PawjKqoshdmV4o
	gNBRG0PELCat3vnEgtvPT/4PPEJLmtai1me0jsdep/ZJf+JAgssjzApvtWdvhoe82tBj17ZP+dA
	iPIbTy5CwcJIqpofaSTgr6IxzwOrElUGtQaEIyb106tJck3EAyYnquNZLPwSPX0zojknYh7xM+v
	wz49Oj9OCdEmhDUmxHc/la3lP7AcBvAhU8M22okx16iKBRTOcpHZIw2twSz7xZot7o+dL/+yCIQ
	RqdaFXBxel79Til3o+8WL2oWvFs8qoeE15vxaNJzdmiirboGwU7rVpW3YW1VLHoa0gKt6/Qt69u
	Yt1pC1vWBi98zDSFcy53KihIA3zlmAuGZBsPLBEPzpSBlRXYXct/91igCsdqBrUqlN8VbkbAtPL
	kNpIrtLb
X-Received: by 2002:a05:701b:21db:b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b23f20d4b8mr4609129c88.31.1793742649905;
        Tue, 03 Nov 2026 13:50:49 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1583934c88.8.2026.11.03.13.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:50:49 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: SB1250: Validate and update IRQ affinity
Date: Tue,  3 Nov 2026 13:50:40 -0800
Message-ID: <20261103215043.1190947-1-f.fainelli@gmail.com>
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

sb1250_set_affinity() selects the first online CPU in the requested
affinity mask without checking whether such a CPU exists. If the
intersection is empty, the resulting CPU index is invalid and must
not be passed to cpu_logical_map().

Reject affinity masks containing no online CPU with -EINVAL before
accessing the CPU mapping or interrupt mapper registers.

Also update the effective affinity mask to reflect the single logical
CPU selected as the interrupt target.

Fixes: 421d1563c662 ("mips: Validate online cpus in irq_set_affinity() callbacks")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/sibyte/sb1250/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index 2f08ad267a11..d7a656cd7ec0 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -76,6 +76,8 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
 	unsigned long flags;
 
 	i = cpumask_first_and(mask, cpu_online_mask);
+	if (i >= nr_cpu_ids)
+		return -EINVAL;
 
 	/* Convert logical CPU to physical CPU */
 	cpu = cpu_logical_map(i);
@@ -103,6 +105,7 @@ static int sb1250_set_affinity(struct irq_data *d, const struct cpumask *mask,
 		____raw_writeq(cur_ints, IOADDR(A_IMR_MAPPER(cpu) +
 					R_IMR_INTERRUPT_MASK));
 	}
+	irq_data_update_effective_affinity(d, cpumask_of(i));
 	raw_spin_unlock_irqrestore(&sb1250_imr_lock, flags);
 
 	return 0;
-- 
2.53.0

