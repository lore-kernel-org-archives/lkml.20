Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6557B35C1B2;
	Fri, 11 Sep 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097295; cv=none; b=JB5x4XFRcb41prF3STWWuDuA1Kg0NksEkTzjAzWwKgFGyx4S1/IwdDhZtmExQxxjbRKBrXXAKosAMkffFzyOrkRjiw0fEqT4bfIN5eUBz/fNtGKyO/wvSnmBmg7fIOzjugrOoi1+YqKbCEBb8cfu0YaswmnND6hxMOefgd5MsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097295; c=relaxed/simple;
	bh=OF0sPsDwkbWiDnj/HCiRsQBt4xFUkso8KDZ/YceRohk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iAoBEv7D83nTz+cqGMzZmqMYFmwp5CGPUf+471BaPtFjk98XIposnEnABXTdv1G7I1SilRgsrPGu50nWsN9VH1/MEMkoU2qP2hqvjR6Cb0LIvKl6gLC34csco4KAQPwa9E0jkM1eILnvjirbUDoVkzslaUQJfZvUKIYJM7b4e0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFNmoNtO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFNmoNtO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590191F00893;
	Fri, 11 Sep 2026 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097294;
	bh=+YGz+V8i2Tas85KJKYFj/ybAdrkKvSaeyZci6zxQyQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HFNmoNtOHiD/49OInUi9e/bZQ1UbPM0ExRcVg9AKDluhZRnAG1dDxIba74yMLwGDS
	 IX2A4YA3Af+gCFmT60GN5cFBQkX5Ts2SffqmqcPEuS2a1SkwVQ7mRtrzS/wv44sDVS
	 pmQ1XiHuopOGzAVwhW6g1JWvDrbhQHPqo8rBDtOvJZi9LT8iVK+Ee7/q2b83gKIbLw
	 BzGzFn8lm05/31D/jwodF6Ef5ZCFD7Uh/w69XLF87atZ5JprmfKRcKE+Q/F/NgZ5jn
	 veTzZBnvvOkLdoDYuWyX50x1UlJOhTGXQ/t9IQv5vXuKCHsuVl0mXLCtUs8Le1Lkq8
	 KRehITOdW5YEw==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:11 +0000
Subject: [PATCH v2 3/6] clocksource: clint: Use IPI_MAX for IPI muxing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
constant is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/clocksource/timer-clint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..e56eee7e3781 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -243,7 +243,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	}
 
 #ifdef CONFIG_SMP
-	rc = ipi_mux_create(BITS_PER_BYTE, clint_send_ipi);
+	rc = ipi_mux_create(IPI_MAX, clint_send_ipi);
 	if (rc <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		rc = (rc < 0) ? rc : -ENODEV;
@@ -251,7 +251,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	}
 
 	irq_set_chained_handler(clint_ipi_irq, clint_ipi_interrupt);
-	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(rc, IPI_MAX);
 	clint_clear_ipi();
 #endif
 

-- 
2.43.0

