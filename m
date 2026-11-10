Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314360;
	b=RXK8umYuwUwz41fM/Dab9hDej50xREfa65eeZhXwJZeipb3azGAIm7c4DHq7Jn1zrHX4
	 u0c+iQ1LGjmXYeZ/X/jHZUpTqV7bSGRC5Dqcik+xtpXe2+I9SZ3tSsiW2aLsn3vcVv7U1
	 LtnPavaSJ74CU7XILZ4iQlHrhY0oAdHn6Xt/U2Z/zwi3DxnJVCaX5MdLyvoYzJKOXSMre
	 vJMmYSO65Yns0g0NXQ7iVkjFkysDjmHY9sciZTmdqDRNz9OY96eP1WuuHyJYaNdn31rhb
	 i1gdCaozkOXEfZ4IWmplVzAUX1PgJ8uX4OWkwxbc0oYddL/xpZHpt1PlMe9obhhn5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zEh9TUI1DT/5Pb9w5RL+1KRr9W5nPaYLjrCqPNIyvBY=;
	b=RSPVmMyqTEGkrCMcL5SlNgj8yCUq+PO6CICTiEMzY7ldq0F5d1Ya3MQP1oMznc3ESkUq
	 UFk/1L4X9DGMyfqmhFktlPpvEU3o1WSo//UyqjQGKIJB04BP07pW7h7H4OkQsH6iS/sIi
	 cf1Miyp5JE5NjoC7xKsZ6BdHrWMKd2JeHUF5scd3l41LO4hSqO8GOtJWwfslZkLm58JLb
	 2VkJM5xv10Gw2yfXueFukjI/uDjdP8gr5Qe5n5ZJOHBpqhfqokp9awQtuCPf7eVJjmgfY
	 zBi4Yea8BaNXirNnDSaXoMXYkQSOj5hByjhWZFyUIe+fLcQ5EnBb7SF2qcsseFK8+RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9bIZY3r;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE5606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEE5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9bIZY3r
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso1381545f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314358; x=1794919158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEh9TUI1DT/5Pb9w5RL+1KRr9W5nPaYLjrCqPNIyvBY=;
        b=a9bIZY3r/0kIw4LRbHpWsqgbVQUtMOP0I0hJgtqA5g3HvzPWMIHc0fBqcqygTGOYvY
         r9cgs2iOy46z4D2wZq74ibhSOuTzqKXxhfZMedMltRXeMb1VxzXA1jseAYEdovA6ny3f
         dcBrDDS5fWZZdpvyJpPpOK2h+J0esGMJCsABCT4KR3p/5nhve9Rns7REwKjX34zRW7/4
         HMZl0gw1iW7TNgQcynwpQyBJsvENJRSg44TLIPV7Fonw7a6jhc0ptlcakVHj+v76dWq1
         tCVyE+2hLxb3tkHxA8SXQ+p3sGUWFW3TEsGys1umnN0+yyyJl8Rssnt/IRhLoyrrbwzB
         N3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314358; x=1794919158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEh9TUI1DT/5Pb9w5RL+1KRr9W5nPaYLjrCqPNIyvBY=;
        b=CkbBtVspACBO7c1DPzFQ5Ra/qsWDXnm6kvSoHlYjyfoX304Zd4czJ8luiJ7oDQuJ2T
         GgRk93FZ1pcIO0KiL6ZRuiaqCMTs4IPRhGug9aBcSZORRKHXyBd1f4t1qLHVE/Wa9KXA
         03y6/FvMHN3PAOcuiOWIVN8qBYV1ZFB1WqIGPmt5odDfjH1p6wRqt35Xej1ri5zQYlpM
         TJEFufaVBnGBH5rIANnN/GU/e4VstyHwGyPgvIEBElW4f5cAtTSQB9MvAIb63zsXXHKz
         RFe0N3+SShgaYtg3KDZOzxhSsiB/aieCWLnL42K4QQayo7Zrr5a10AkBUU1wiAGVZKR7
         8svg==
X-Gm-Message-State: APuU4Z9/OL8h1zvhJut6NhTebg33ocWuIw2WiHszvxepL8UoptFN246K
	0+a+O2xQ9llDxx5Kt4EPzOY2OEXEuL7jkjFD455czPGNWbhbgPW68AX4
X-Gm-Gg: AYBFou31EHX7Obe+ue8AX33vaJmCb6jZp5fEiim73iYaK0fRdDBMBw77MLPGZ9v8MvW
	rTeusaZVqwDszqikRIlIl2KrPAzFMmHyOUFwxIH8uGyPPG75tzXQrEFzZQtun5KE6z2SZmJ9E49
	5MjG5Rhwe3FuMCPU5Oa3KCMGOS1gaaKFwe2xFyEWycx0p3x1oaC5eQUv+m6fm7ZeNm0obM/afzC
	mo/6K7ZI43+C+D7v9cB3XcO9BOWyg3V0hsqqudIPytincQ7xuVOp3E9jR8g3u0+DEodH1bGVFRq
	tJVDJ0S7fiUucufsPNeOVpBqpZzPkW0018vwVaKzROie3cZLAb6hTVjhBsrIsXcw5YwFdw1xLz2
	m/bpPC87CxmLUzHNecQAKTZob8t7SQEINbIF4VbV7BdwVpsIlaIPVp4KJR985MqrMlTZ1Cptg+z
	gTkjajEBbLtY9rqyjhm/l0kSFK+gcj+DtMizNPhHVbu2lUqAizEPXLu+7G316FGhYr0VSnSuOi1
	HsGjeEAJjDBkx88R/Lr7A9bMYZJ8uyDn+QKzONYoiFsdBnJif8UfMWmC1wwQw9C7Da31MosrA1K
	uyQIb/O6ckeqFHCpMtkWQNMR7iKsoY2sRI6DtMJ/
X-Received: by 2002:a05:6000:18a8:b0:48d:f3f8:f910 with SMTP id ffacd0b85a97d-4982f1bff16mr5087805f8f.34.1794314357838;
        Tue, 10 Nov 2026 04:39:17 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:17 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 10 Nov 2026 13:39:06 +0100
Subject: [PATCH 1/6] clocksource/drivers/timer-tegra: Keep Tegra20's
 watchdog timers free
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
Message-Id: <20261110-t20-for-upstream-v1-1-5923449951fe@gmail.com>
References: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
In-Reply-To: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5044;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=Etu/NoLu3WruVoZPzD/Ywq8Sk7DCe6Ijb/ULtQBJ5v4=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngcL7L79FeBWs8feY9O+8qJKg34L9Pos/JxWY3d5rk
 rHuhPbXjlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRuycYGf7MW5tvwzmnUvJy
 ite/gzsNdm2+LrVIhpffddvHI3O+HJ7JyDDz5tGoxFPuQR8XXmL1nf7HM4OPYZtZUb5BfHTgs71
 8FzgB
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

Tegra20 has no watchdog block. Instead, the clock and reset controller
resets the system when the interrupt of TIMER1 or TIMER2 fires while
the previous one is still pending. A bootloader can start this watchdog
and leave it running for the kernel.

Since commit f6d50ec5f85c ("clocksource/drivers/tegra: Support per-CPU
timers on all Tegra's"), the driver uses TIMER1-2 as the per-CPU clock
event devices on Tegra20, where it used TIMER3 before. When CPU0's
clock event device takes over TIMER1, the clock and reset controller
still resets the system if a timer interrupt fires while the previous
one hasn't been handled yet, which resets about half of the boots
early. If the system survives that, the watchdog stays enabled but
never fires, as CPU0 keeps clearing the timer's interrupts.

Use TIMER3-4 for the per-CPU clock event devices on Tegra20, leaving
TIMER1-2 to the watchdog. Tegra30 needs TIMER1-4 for its four CPUs and
its watchdog uses TIMER5, so keep its mapping.

A watchdog left running by the bootloader is then no longer disarmed,
so it resets the system unless it is pinged. That needs the tegra_wdt
driver, which gains Tegra20 support in the following patches, built in
or loaded before the watchdog's timeout expires.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 40 ++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 35b6ce9deffa..0f63bf8bd706 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -208,10 +208,15 @@ static struct clocksource suspend_rtc_clocksource = {
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
 };
 
-static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
+/*
+ * The timer used by a CPU is TIMER1-4 on Tegra20 and Tegra30, starting from
+ * @first, or TIMER10-13 on later SoCs.
+ */
+static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20,
+					      unsigned int first)
 {
 	if (tegra20) {
-		switch (cpu) {
+		switch (cpu + first) {
 		case 0:
 			return TIMER1_BASE;
 		case 1:
@@ -226,10 +231,11 @@ static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
 	return TIMER10_BASE + cpu * 8;
 }
 
-static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
+static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20,
+						 unsigned int first)
 {
 	if (tegra20)
-		return TIMER1_IRQ_IDX + cpu;
+		return TIMER1_IRQ_IDX + first + cpu;
 
 	return TIMER10_IRQ_IDX + cpu;
 }
@@ -248,7 +254,7 @@ static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
 }
 
 static int __init tegra_init_timer(struct device_node *np, bool tegra20,
-				   int rating)
+				   int rating, unsigned int first)
 {
 	struct timer_of *to;
 	int cpu, ret;
@@ -297,12 +303,18 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 
 	writel_relaxed(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
 
+	if (tegra20 && first + num_possible_cpus() > 4) {
+		pr_err("not enough timers for %u CPUs\n", num_possible_cpus());
+		ret = -EINVAL;
+		goto out;
+	}
+
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		unsigned long flags = IRQF_TIMER | IRQF_NOBALANCING;
 		unsigned long rate = tegra_rate_for_timer(to, tegra20);
-		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
-		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
+		unsigned int base = tegra_base_for_cpu(cpu, tegra20, first);
+		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20, first);
 		unsigned int irq = irq_of_parse_and_map(np, idx);
 
 		if (!irq) {
@@ -376,12 +388,13 @@ static int __init tegra210_init_timer(struct device_node *np)
 	 * after CPUPORESET signal due to a system design shortcoming,
 	 * hence tegra-timer is more preferable on Tegra210.
 	 */
-	return tegra_init_timer(np, false, 460);
+	return tegra_init_timer(np, false, 460, 0);
 }
 TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_init_timer);
 
 static int __init tegra20_init_timer(struct device_node *np)
 {
+	unsigned int first = 0;
 	int rating;
 
 	/*
@@ -398,7 +411,16 @@ static int __init tegra20_init_timer(struct device_node *np)
 	else
 		rating = 330;
 
-	return tegra_init_timer(np, true, rating);
+	/*
+	 * Tegra20 has no watchdog block. Its watchdog is driven by TIMER1 or
+	 * TIMER2, which the bootloader may leave running, so leave both to it
+	 * and use TIMER3-4 for the two CPUs. Tegra30's watchdogs use TIMER5
+	 * and later, and its four CPUs need TIMER1-4.
+	 */
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		first = 2;
+
+	return tegra_init_timer(np, true, rating, first);
 }
 TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
 

-- 
2.56.0

