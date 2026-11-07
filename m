Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057449;
	b=K+fdx23KmYHB2h1knafODhhRvFNQg/bvqz3TaDwXdhx8ujtbIouzooXrQpNCk5gt1xHa
	 FRDsOuF2geu2SV8l26MDrMI6G6c1/rFBkgsNTigtP1lInPtp6OJmNxdYr5zh9+XjUhhTe
	 msenYOVKWjI68F3/rmc/QJ1m5B3fgUKRHZCkkFul8AKkBOjewuvnmCBcNVhz8smDOIDQW
	 LnTerEyYdfCtJDbpq3QoGH29WoRq9lwHRXT1g56qCNZmpfhh1C0gF5jR5ejaH1+9pmkCm
	 Hfzq2pk1lr+nJ0uFosVHAaPxFPWuL4J55ZJliPB+LBgKaBKVWJNXpGtnhLtxTbXd7qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o9B9rtJeb09FWDwuhemZy/stOo5jVch8QF0LlBNkaEc=;
	b=wH6EnNGMrvZ1Ze7N3Uh9CLP5h4btb2/tpQ4bdP7/ZEoeMqlpdG3zsTojLxMbVL0DVwrI
	 lSMBDS3aOYSm408bGOliiEMjnh8dclNtZZgl2mvhxDgc9nQhii8g6nQKn5u7pJold23VW
	 VV78Vu4nH/sMCd5Oq/cWV0Ry/9jo92csEM7FZ8VMVMYnv/ghz2Q6dWHNHZUN2izmrPODt
	 uvsjr+B7LY8QXuYftvy7hqwjR7CE+Gcyca18vMTHYDOV0vNpqBHcoNy8wl7yKr6Hcf9jw
	 KKSTsPO4/dOyM715+Xwv4/JwJY/fw0kp5qh7k6zAca9IMjvnxC3JcZ/ykesmiV/YunQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QihpeXVo;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5CB606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5CB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QihpeXVo
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12510215e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057448; x=1794662248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9B9rtJeb09FWDwuhemZy/stOo5jVch8QF0LlBNkaEc=;
        b=QihpeXVo/R5PlgK7TYUyCXZeUQVo9ME2oHUqwyEn8270h3zoB6gK4CMyAciqeswoBB
         r7GHZn49SSJRIRz4xmKLeqvsgPSBDoyDDYVwuGKGblErFgS7EvXwgWGk6TfHTKz7jxCC
         yDiVR/tMnqxV1RjPP0lbvf7cQFWvbQPIjuhw6LW6Nt6BOfCh9nKqbnghgjFI16hy2lIk
         OqpFP9lLBNCF35NDsaXitlkA8w6OPuslqtcT3n9jQTPffSa4beZrCjCV/QH+J/4rbs5+
         faQmoShyxE7myjlJ/vsmT0xCAIF00ahSOmTe78KuXC2bX+HbpCqdgLL4CQqeVnp3fB5N
         rDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057448; x=1794662248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9B9rtJeb09FWDwuhemZy/stOo5jVch8QF0LlBNkaEc=;
        b=YZQp3crGudhxMt2mft94kxDLZ74bBeuFDZ+lfBnq8E77GWNF1/G7OPSpNsTr6RmhJM
         8HwI0yFKcExEn9iC35X3ALnXTk/+TDzWerez5Z2joX+nZE/23h76hesrIvknfoKpa8XS
         IvEaPvNiYxLUAmCYKcQK12JGaVzx6pnxSkq2YLhxID3M7WppXm9+YZhPchkVFe+auMDI
         xc9LTgg+LmvhgEumxXszqXSjCtrBK8F1S4Jrcwju1ptcWM5MLdU+qZld+xUAQuk73syd
         /JCretFlvqg6QCWFGXUEnLnGyaeXwSOBxdcOxM1FgJ+rTDP7qUON+a+COeoNYJpu3oiz
         WeVw==
X-Forwarded-Encrypted: i=1; AKwUvBxaNEOzOJmAJsswpC4YMJ3Fx7mUHVj5m81+LGCkt98TZVbSHCTuUx6uoZ6255tRwnaCE1a9qHSEEbNjZnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z90G2EZpAl49eShxTeivziD0dp+KJeaUMFDD25ybOvTeQS2npyB
	+NOY80dtTZj39POTj1YkcKzgXvS7sbnV99SxLK98Jq9jSeMBB0jOBu2c
X-Gm-Gg: AYBFou1IocrAzXvtqOIQEuF46uy1Sr7AKRh4on141rLBtwjvhGkd+pL3LIVduIXfdD6
	DM9INlixIOgzHmgpeNCemQg7KwzGjCFqvHAjooSQWgf6jqt9t5plWlakuOUYuAd0kbR9UM4HoJ+
	jZBlctSiEAeSXyf3GnTRGnF8xi63MtOxe5ud001qhbbHLo/qM+FnfEv3qAlOE8vTfjV43HYMRT4
	bgc/cBgo1O4vtAtCE7/w5BY2anCy5u8m4c6MBJgNm2M4v7lSRjtm3jxJolsAb5uJVJ+dsrZDaz8
	2by05vObkF0FTs7Oh0n0+oPhDVPBkrdkgTkz/uNTpg9iFr3zIavK+ek4IlS7DLR9rszwauNghmB
	y5uX6b+cLBJVxyTaqsFzzrye6jkCFaA2czpS8sjjMoRDo79lMLGWDPYR5Va6+uBpZV5sifaI3bm
	UyYGh1o9e3wTno+kgOj06MnK3nLvFH2LB/cIvyCh2F5YQRSzLtvvgsRUldvQH5r6We/qhGJqFxv
	iCyPA9y+WjTAQaO++X0b+WZ1aoeTp2ObyGHMGNnVsyt0Iq6XPbqBUFJwYLlq1L6bPPYBxqcrD/9
	383aVoFZalsC/BQfkxYH5Nn3iaEL+6bEOhwlFBDpbYHkykg6j91vCiy9nExovd+LWOQoVteMvZ3
	BTomv5xFAaGpUH9deuLGfRElkn7ogQjStbmVMBIrOjt9NJXhUExb0YOevVsT/PMvbBOsHXdg10K
	KvUq5gKr4onTCKbjOajpTTytkhFSQka50=
X-Received: by 2002:a05:600c:19d4:b0:4b4:49d7:bc25 with SMTP id 5b1f17b1804b1-4b6dfd97b92mr94982055e9.21.1794057447480;
        Sat, 07 Nov 2026 05:17:27 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3279f9csm65132675e9.8.2026.11.07.05.17.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:17:27 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] kcov: Use unsigned int for kcov_start() mode parameter
Date: Sat,  7 Nov 2026 14:17:05 +0100
Message-Id: <20261107131710.89264-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107131710.89264-1-kmehltretter@gmail.com>
References: <20261107131710.89264-1-kmehltretter@gmail.com>
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

task_struct::kcov_mode usually holds an enum kcov_mode value, but it can
also carry flag bits such as KCOV_IN_CTXSW, so the field is unsigned int.

kcov_remote_softirq_stop() passes the saved raw value through
kcov_start()'s enum kcov_mode parameter before kcov_start() stores it
back into the unsigned int field. The parameter type therefore does not
match the values it receives.

Type the parameter unsigned int, like the field and the saved copy. No
functional change.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 9402227bd7ba..7f106182cf1b 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -368,7 +368,7 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
-			unsigned int size, void *area, enum kcov_mode mode,
+			unsigned int size, void *area, unsigned int mode,
 			int sequence)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
-- 
2.39.5

