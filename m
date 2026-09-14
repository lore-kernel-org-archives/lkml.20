Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E60370D54
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364880; cv=none; b=SKqCrOJRWDXvcESDizHyhI1iwUfmAyVB8FTQtmVX35DXpnke2sQExOYeCusMTWiZBsmtBmL3MAaztcBxhwCs7YmgECg/1CKBeSauNjZ1lnTKESDaYgKyBtrcLUO4Ss3pBNEjPuSFg+1wqijQ/W3f6u5uC4NQ9sw+GlqgdzltKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364880; c=relaxed/simple;
	bh=kaH16PG0n5qXMp1A+1ketXJJnLdvjaHIZnQlZIlJjfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GeE/UM6voyji5jVIYEXfS6tiUmL6DC3oOy7cPOHIO7AHKJ3i3TMixV6DeUGPSH5WW7HOCM5Ov7s99qrm4cJEh/NEXMlxXRSQauTxHtBjqkEubgrwWNZO3Q5vjBrIkUVvZa+SucEudDefJ+HwvRMRoY75v416dB0gauSBrrJxth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/CX2daM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/CX2daM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so6013445e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364878; x=1789969678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrdUODYcC4o3InxGyBh8xP7Mso3oU5634kbBFJDiJnI=;
        b=k/CX2daM236x33hkCFbWj9dUhAq10n3knE4nYpCW5Q8R4qqb5j5jm/WInjSxWrZyeH
         oBmlwuAnYh3pXs75KqAD3FwUrwONuQtxaMjZ5Rp1QBoK1Lqnwgamnle4eW0qCgpDPk64
         zqaLaxfAedqvIZxCx4IhA69URxGEjQURwtNpU+5uF6ZSom2PU8JOdZ7PHNPFo5YKb8el
         kz4YgXZsOvKITCISrN8DQY1MjSe7Oo4znnCQj9BsE7uCKRbvDsYUMz3YGwYuotM36qHK
         8ZJ5Fv36FzhDqyWWqAfhJL6+oFUvP9y6TbTZeuyhAht7MMwPNtA3cqsVZy19WqJychKE
         nx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364878; x=1789969678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrdUODYcC4o3InxGyBh8xP7Mso3oU5634kbBFJDiJnI=;
        b=YClnJTlqwCmrbsBGbutMyViUXd1lcP8JKDy/O4uVyWAa2K2pafAIljc7/MJSogSztc
         24NfaHE5Y+2EiztzKe91TZCG2BRF3Ccav4Xu+32Gio64BnDWtKivPAUb+XZxNxSZX+hr
         9pw+Z97iAO4f7fWeE3hsKqzeyV88B16if3SzQtFkN2HSzuSZmywgOc+dqwYu9UHSKK4r
         2fsszH20ujCL4ouWEqoaawmlCscEpZsre7m548FoKZhYzI4qSuUhzp0JjYDRbBkI88Wb
         9qslHH0Zv5eXbDfoufUhS2Q59q/wbO5T5JuvNYRRNXfTJxtppdadEgDrptKyEnzHSQj/
         tyIw==
X-Forwarded-Encrypted: i=1; AKwUvBwAHUqc5bhPehwZDX/tBzQtD7uj2WZkHebfNoybjRTq6Yia7rV3pcWmJZU5eKpMBy8IzcriC0Yxe7PobOs=@vger.kernel.org
X-Gm-Message-State: AFuF++nkF5oHQH+VaRFxO2w5aAdXZaP3SZntbZlwk5JqaJXKOoP6xpKs
	SQ4ZJfSmYAaAa7JlQDeme+ad4PnQxoemlKm2LOFtn6420x5tzgiiQ+kM
X-Gm-Gg: AYBFou3hQKviovE+rRwKN72mA+oAbodQai4FQ9I65tq+osGb2+dihcP6tZZAOSNdfA7
	0uWOSN8capGWAZ9n7fvvoOs4Nht8hvkiXns9QB2DxJJeZ3+4g4AyJIuWKX+sB0ZgbZiiG+6Aab3
	Acxyw/pDcPX3wjp9y1uIfBI1gU/PWcsTG3FPsYoWw/yzGDdF7tTiZiliqAwiz+CKUVwsNfi1k3G
	tV3psfU9tHwAXkANeMnz60Id2QMa9CIYrTpCRpNH5N1sHCfa0fluBzaWZrY3T8XxznFAHfzCHAX
	tGVBWVeS0VmxAhU+Jterpi/ZYqHwkBA3/EfChYv6oNPG5r1lr9mRBppeVUHtdC1DWN4dybaKuu9
	Zikneda2YXk/izMu0VnVX5cTm3qbytaxbyWi7CpF4J5IuxvlCUvLl9xZF8J86CvPH8yBlr2qsyq
	M931z1Ri8kj1pVYuW04HJPCI4OT+gDyhUsmWK7Ud4MnaBwyfgP1IJ3ch+rKWNYDCjP9ih9YEYI0
	EDfdFdAXgjsYSYHNZP2Ht/mV1njjgQ+y17amK0HzK+lM8xv42vkK/dJIKkxb3Mqiy8brxEleyZw
	HhGuPpqxep/6cFKBpXZcrCFNkxFAj8E=
X-Received: by 2002:a05:600c:1910:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49e7a6573e4mr10643915e9.4.1789364877387;
        Sun, 13 Sep 2026 22:47:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm214537735e9.5.2026.09.13.22.47.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:47:56 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <include@grrlz.net>,
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
Subject: [PATCH v3 1/6] kcov: Use unsigned int for kcov_start() mode parameter
Date: Mon, 14 Sep 2026 07:46:27 +0200
Message-Id: <20260914054632.12877-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914054632.12877-1-kmehltretter@gmail.com>
References: <20260914054632.12877-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 35420f0ac524..79dabbad5a38 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -350,7 +350,7 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
-			unsigned int size, void *area, enum kcov_mode mode,
+			unsigned int size, void *area, unsigned int mode,
 			int sequence)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
-- 
2.53.0

