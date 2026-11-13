Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596924;
	b=kf+EUZp6UofgQWBaAeYVnibjMolCF8n4V9c0AniFpBB1FOnDpm1w44LHeg4KeEwfT+4j
	 8/n8r8cyZytvpZzN5bPF4ZiKo/ZEjzfL2EzD/FfSTw7fNMcAXuXNknMGRx4dQx4KLTHzw
	 VYZCekIuL/oqb5mgeKu5tS0yGMkEGHmw4/qO7DIwTTygw8OxZUPSx2h53exGwRFN98qP3
	 C3992T95dBI6grr3+z/LprwQATjaoNfLi5Vi6tR6h/z3JBm7sX9TH3SOKE0K0GvMwjK8g
	 ObfsoUUjfHeFBS33NrVk7a80Lf3jdLqLg9C0EtxDxD3FKFUVO3HyzlhrElHo3tsHSFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
	b=qgXAaQ9QunUqQ5Lhu9Sg80gMMJKNtsa0Py/dYJr2ezZwfF/isZX0uvv2dr/NSvqut56f
	 Te4v9GNqq37QiTO0T/NmUdNia25k1G3uZNmRrfylxEUf++9+TAQolbxXDQaC2Ba4/Qu1+
	 bh2PIhJIT+vYN6upkkXaesqV3cEjc2M/X1JECTlvYE+r78wFGHDg/ojLQhER8tfmIu+aO
	 TH+0C3G8u6IVmB1vZ0Kula+pFw5v3odqjcGEgletmHAi1QKns8eM4wjQ31A1uvAwgbsjb
	 dbnKIrK8j/WGHh8EFtWT0DsGeVJ7wLD37+YQnVcJSoCgup0EMXow9k5BuB/jePcszYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwDKDm9n;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31475606A8A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31475606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwDKDm9n
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so3887666eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596922; x=1795201722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=EwDKDm9nSU/jTREYh/cxN3W6tdK7apu5/SNw9Sd8IdmwUrbor7u3aICaiXChfvL9OM
         VQycw7+qsKqg4eC90CZnMTRNUkY62Ia1g0AzusTqzDqJkEiwFzgOv/HLB946Nrhb3tRj
         s7DIXsl4bjbvz7uj6gON8JywTmnjpklHFULgI48JHqjSFlXex7kMr/nHX1qQKZqmhVmW
         GucmXILq0IZe2+Lt8woy0b7GjNUBvXnPu/ni5zSIYu5VPAkDZuYfSCXsgmZRchcH9CoT
         5MIpFADNyJaB+YsYZgQpdupPLYhj7naI4sqtwXUI0Iv00nORkHpOFwTsR2jFwlErKJAi
         gbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596922; x=1795201722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=gDenA/HpkL80ReMf1QWWgzpJn51BzMGnNnMPiANs3uSs2hFHYieCc03rIbVHV8gOtJ
         8CkC2B7E2D3m4Mh+EZNV5bT9FUCmHx1yuu/6XPJNUiPlbw1Tiadblv755djxwruzxrP/
         a2I/Bt8Tc3iSCbv7OhSPY0NhffH8yB3BD6zLEmw+lKzZomQQRyMEb2aRkglg4T9XJbya
         b63iKl2QaYHlKAlVubjREHQR3b7hoFpkMWjYEZ9IM91iyGTY4VHUpEN6Hi4vhd9CbwrB
         E8eHZCLiHK65jUbf2xKwSNvfIrrd3DzBam4aoWOTnVU9oNJ2IA7dJMORjuUZ9jPVZ6Bt
         N8LA==
X-Forwarded-Encrypted: i=1; AL+hErFNNTvEEStZDhPoDU9R66jo0hELTjWJ+LU2gA8ltULr81CcDVOqvgn4cMzgj7iIyAc/toxJmypMFOcQ4b0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kU3NzwMNwFrXRcYD4RNJOyv21hAncHGwLmS06L2rvgoB6MeTB
	8gHMOdoxxjJFr5d/9fnCUrKK4YvxmWNoiYdakX+7SaPsjqFeV1UiUo3Y
X-Gm-Gg: AYBFou37xdFZlu5tpFKTuMgRbIhGGWvc7u+Yqw4DnVxXh0QZPZK7JwcUtQjyqVQMzpz
	KfPey1zljT/I0iZsbEH/ruATYd82gUrDDV0xzgZzhcrTU+KtVXCbYT74K9gbDwr6tVcay7aJvfR
	Az2UnrJ8aSq1+QTGnSN3q5qakFOPKxXqOO2EfcsN9irL05FamxFG5LpQULPkBLViXhTzjBRRjU6
	3r4OG88JmyV8QqzkveqFRan41usZktCxpRs5+Q5iWQz2T8Q0IocP3Vsn2HKGShR5Nn6ANwPZGqa
	0ezbktzjJyEHn7Eye3xCom2U5gnVaOcNLDBstAsDHMuOAWTcFgwtIGoVQN80sbFYXxRbVp5s0pZ
	vgdqVzTm+p9KKcJao/jCRzww4/zJizOhIhyrxGg5uSoGoo3NPWZvk6xSqfauBzFMaCaXZDlUHzf
	pF70FDIItg0bbzWiCa7R1Cq4yntKbr8b6esnLXivKvKHjpJ/b+P7n9qI2xhYD1S/xbhJcgFoSso
	G1JbnWDry+S8IPWX1sdhJ6scdFIe+zpnXTVLjTlEfdEyh8FAbOlzTK7JjiFlyTldCue/nFWkHhw
	chQv5un1JTkApGGHfmY4QkMFN2V8qA==
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr4217184eec.39.1794596922321;
        Fri, 13 Nov 2026 11:08:42 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:41 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	stable@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Fri, 13 Nov 2026 11:08:33 -0800
Message-ID: <20261113190836.470937-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
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

The CPU1 clock enable callback runs under the clock framework's spinlock
with interrupts disabled. Its readl_poll_timeout() can sleep between
reads, which is invalid in this context when SMP powers up CPU1.

Use readl_poll_timeout_atomic() with the existing interval and timeout.
This is a prerequisite for the JZ4780 SMP bring-up path. The original
CPU1 clock implementation by Zhou Yanjie is already upstream.

Cross-built for CI20; the subsequent SMP-enabled image brought up both
CPU cores. Development and validation used Codex assistance.

CC: stable@vger.kernel.org
Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes since previous posting:
- No changes to this patch.

 drivers/clk/ingenic/jz4780-cgu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..1809f8859c7e 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,8 +242,8 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
-				 !(lcr & LCR_SCPUS), 10, timeout);
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
+					   !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
 		return retval;
