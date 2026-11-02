Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654201;
	b=zpFAUZzODfUK8isZV3Q+j+18pX1mTdat1nIoSKLrrZe2hWYfAngdWyGZ9ti7zbaHg0/5
	 INXp9O1ejHnmjfxStLlYGm5cENZvPcFBV//Ayky9MlQ40zFCTV9uMy29C2b0TVw8fWyD2
	 RqfXsiwyjQ/EfBotiJ+dLhUqh9cWqPyy9gbn59OI3YyyqcC1BONS23kAnUmMfROliSxMm
	 WE+QwizM79Fn6GZJuol3OXztbHw+CtZlL40ptRugQYAJdeqlvTYzWe2E1LCPGKNVHJa/3
	 nCqRlO1bvCd2KDlBYRQPj21MJR0yrp7EeigLudHmjCwDh3Huzx9z9QPhLdz4TgY059A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654201;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=u/8iyy4HZ7/aVXuOHPUsPysy0WI5/Kcxb2nLLftofoI=;
	b=3uEv9uYWL4gV98t2Ta3u6dPZuCJAzSRgPtOLtVEja/lxorl90FgYP9m2QJcIReaKqbAu
	 8rLdfki9KGFszozqwlkMnnn1iqAzgKVZtkcFKh5JGK6zn9rQw96XDyt6GPxVtQy0kaPjt
	 FdYjdlUU3mILxEuVhVLRZfz4Fpo97HhYksleSSca3GAl5lfLl3iIqlZ5w32h46SYM70IP
	 ctuuHRZ5PcLXJxQnOB/6Hjvww2Zk2YL2TVee64kzlDtxvFQ4exFjVGYwv3YGWfp7YwUlc
	 hU7MG77dF5YYFr3dFnD/uY5KdaolIRb8wyCauxVcbO5Np/5hOlIiHoWITkuphAkqddA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KfIZcCjS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aaVfyhdT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4F9606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4F9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KfIZcCjS;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aaVfyhdT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793654200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/8iyy4HZ7/aVXuOHPUsPysy0WI5/Kcxb2nLLftofoI=;
	b=KfIZcCjSQp+/TDRQij30V06YWyk70Lc4D8Ks7QqG6b/nilBZIA4kk6nIA9wI6bca5JSyTg
	xhhAo/OlWFgioK4sfqV6oMEHvwCo1B1k3KL9vKCTQ1fUEUPQfcADeomCpLzj5kNtYSSNEC
	HmsiaKQ+t1PL9+Imxv1MoyjEgcjKuEQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-PKx8SSlJMKekOcH1Cc_VtQ-1; Mon, 02 Nov 2026 16:16:39 -0500
X-MC-Unique: PKx8SSlJMKekOcH1Cc_VtQ-1
X-Mimecast-MFC-AGG-ID: PKx8SSlJMKekOcH1Cc_VtQ_1793654198
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a5e3cf8019so3521625e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793654198; x=1794258998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/8iyy4HZ7/aVXuOHPUsPysy0WI5/Kcxb2nLLftofoI=;
        b=aaVfyhdTROsZ01EnSiSdVZ7tX/JorVgE9PS05wFmPbmLyclI6ZfmC8yDH6d7z34+5P
         xz2BOwEh1YJubvi57TyNj2UuYK4H2MSYBk1C5vDrJRHw9tBaptnmftSfNTGm/8gkCido
         ShPcO1ary3T8tGeCRnuijl/eVet/lFnqGOh6cquVDqotDCwgzUjTC+y9LD5GKGELGtO4
         4a+cQjxs8oRnGQbB381ImW8eumlcwy85kOVzsM5lVso9corxjvSeJjtjHm9qsGZo7AXk
         07zLKVxWNSBT+YwBjDSsC4s+U4A26GwivOus7178OF2uXBlTBK93iqqfFCeAbvqvoJh8
         gtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654198; x=1794258998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/8iyy4HZ7/aVXuOHPUsPysy0WI5/Kcxb2nLLftofoI=;
        b=L6VJZfutNou+OR872ny2zdlvPUDSqSbzjwuOdr+wynhnAI9KzrCe8wQcF3IfwjeEHX
         W7aQLgZDQOA3k6KgmC+mqxwLcfHwHo7LC2uF4527C9seUQO7KAu102JyAxGtifcyS+pp
         q1gpRCtjGQBk9s0YBl5OuIrIE1FZGuPlECZ0vd5+StsjZtXmeutxtRIMSmVz0ApLFBBX
         Jne/ohdzeJZZdjrFb2OD1OVuoxPw3BW9esPkHd5jYVWivKFfsJJ8I+/VYRhiAE43reWX
         Y7sw/hhdwU2dAYJmUW0jA/g7Hza9813V0cZtG6n+4RTXmthfLRJxj6gExUwRBv390h9q
         Dz9w==
X-Gm-Message-State: APuU4Z8Hp/77/9/RYvD4+UMtaYgS/ZBBbLd9a+FxBPF48m7f0Eo/Wcdb
	GtT6D3uWnOyghRZ1VQ8NlVSliVC+TLWZ/OCLSAokjrkJTNu4IAFtsr5t1t0yiPVJfwIQ6QZXMFP
	hzjWMjEjj0LxwO+JJY8slbbUwWzgNPYFWe6tqcNG06J+45cihoxj6cAqbaQ6QbGXOIDb4xyoa3d
	7d
X-Gm-Gg: AYBFou1nrTVCRksfkCOzwT2dBSqnei21BtsouNRvKYGqJTpXpURzreE5yQBOkX4DGaS
	x3dJj4xytYxriK1OIP7co5xuBMtH9UPs6l7sbMjAPynjGK/mfZlDzHA+2jyzzApHHKCAx5qmOAq
	iZ1KzDxWueCsFIHr7TA2wZ6v7I0LL7fbbIH61hYFG9Tuz78xDnL8987dmilM4LV15c/Dnnwd/lF
	3Mx9nYbf1w2zE/nNjHvtlGpf1W6KUu4YknmuEbLYbBRU/GAoF8kWPww3Eofo1MVaIFJuLpbBZpp
	THM0D8ahmAZO0cnpK3VnI1B8Ytq7GzIxbWTceUkazThi1BTH5D2x090P7vPB83SFe9uJgoR1asX
	0LgZkzeQYPzwiE+Js0V48/i2zzoly0Fz7p2PwSEXDM7kGMs7UTEBxbjMP/7d0dU5pV39ktaSIu8
	1IwAnz6YrqFXEWEw==
X-Received: by 2002:a5d:5f48:0:b0:48e:6ff2:606a with SMTP id ffacd0b85a97d-48e6ff2609dmr27631597f8f.6.1793654197981;
        Mon, 02 Nov 2026 13:16:37 -0800 (PST)
X-Received: by 2002:a5d:5f48:0:b0:48e:6ff2:606a with SMTP id ffacd0b85a97d-48e6ff2609dmr27631544f8f.6.1793654197560;
        Mon, 02 Nov 2026 13:16:37 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm20838703f8f.56.2026.11.02.13.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:16:37 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 02 Nov 2026 22:16:20 +0100
Subject: [PATCH v2 1/3] clocksource/drivers/nxp-stm: Fix max_delta overflow
 on 64-bit platforms
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
Message-Id: <20261102-nxp-stm-fixes-v2-1-8ca2706f30ef@redhat.com>
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
In-Reply-To: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793654192; l=1278;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=DVfNt64Fa2EP/J0U6rHzSmiL2wOHXcUfdf87XnRZfSg=;
 b=l9hNDdzUrhma71aFw5r9/uBmIB5COcdfl4Gq7cRYpas8co0jiLEqNrhksseawGF7HVyaMLcJR
 wxiPwGkenjpCPQfWwh1t6b2mYj7Q1sJtwNbsSjje6VTqWdOIE/SHRzQ
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=

The NXP STM timer has a 32-bit counter and 32-bit compare registers.
Using ULONG_MAX as the max_delta parameter for
clockevents_config_and_register() is incorrect on 64-bit platforms where
unsigned long is 64 bits, as this exceeds the hardware's capability.

Cap the max_delta to 0x7FFFFFFFU to match the 32-bit compare channel
width, avoiding potential timer event misses or unexpected delays caused
by programming an unreachable compare value.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")

Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 6fe098a4a33f..ee249fed1b91 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -346,7 +346,7 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 	 * minimum ticks = (rate / MICRO) * 2
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, ULONG_MAX);
+					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.56.0

