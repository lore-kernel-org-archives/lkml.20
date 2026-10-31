Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793476651;
	b=3m7yfwB3gJHSUeKLH5Cgr6ERSWG/R+DPLahE9B43l+KZFQpp0REwKJTrUiLY8Czy2uqU
	 UP80ppfphCpfg9ui70hDaf0ASCzDAHJYGwYO9nk1JeP8TXlpb9KMJXFFOhNNpE3rBgmIN
	 YxdNiaRdQRRKTa5O9vnOWuD2JvVVQx+lS5hv6XbVvhtvn5yrbR4JXjGfUTiW7J65JV2JB
	 5sQpfY0HbUgzOwsKcJTIuBAcGbCEPDhbNlbeiLhKG++8VWSY41OX8+g2dTv+2iKjxgnPD
	 6p+xXkUx63VwlTV7Qcy/8rj9V0NkqGg73OCdIxSH3Kaa2053QWY6J4hc/jm2bM29NFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793476651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EhbCfZIKF/z8CmeZ81yrmHlag9Fq3VRo/4XV3cKq5E0=;
	b=Mxcb1Fd+61FUSdnVhTsngLPJfjMfymYf8iPS0lbhdjaRjpKIVv7Hf7ffxbbiFVYCiZaQ
	 8gicOy3uwqsXrj4N5uJV83jOVYVEKVW8OuzFLaLrhBHNh5jmNhKsSZemXLj8KpaKEbAWH
	 P6yky08OoBDWTJERwB7qtm9yRt+b+WPM3rlJADjT63lR3iwGmflyyo3SRsyTCiXrRzkUI
	 gguCrRexXr0y1rm06AnN6Ku9MwAguVE5Z4LjeXZE8f37XI52TJHmzaYKQlF9r1CF+VQky
	 nvazPm/9akKC6DCG4jjyeHThhHYpvWV6mP/ZQ/Lpp2Iz+H6pXu5AJOXeHdM/Kf8Ap8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I401xoiw;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC59606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC59606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I401xoiw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so15578145e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793476649; x=1794081449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhbCfZIKF/z8CmeZ81yrmHlag9Fq3VRo/4XV3cKq5E0=;
        b=I401xoiwd5Rsm3yIWBlda4cG4Lr6MmSdbc5xwj86O3EWuBbU+5Q41REHYPT8rOWhfc
         Qnsv1MH+14vPTX3RvSrnP9dB3NGPda+vyu7CpcG9SN4T+SHnIWdXo4I5JZtGh+Uz8M8C
         wDphVn5A4RS1wipAWQ6DWDA1F+4OI5IcEh945zr6EwgA2MH9dHE0p6uk/MiLCPZLIZ6o
         PfGVkfq8xpTy+YtqlRDOtRQgaMGBR+4IL8K2gOvKtjw7oNSBWADJ6Gbv2tu/t4Np85qe
         dZ1f6l6FyNXIBiMQIAqLII0gTPK0k7DljB7FAJqLcZmL+GirNpAT1TXsUPhlwGgYg7bp
         WhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793476649; x=1794081449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhbCfZIKF/z8CmeZ81yrmHlag9Fq3VRo/4XV3cKq5E0=;
        b=wUR5kRC/WZFFT/ZOrD6Vo6ZR/tB68I92Lx+PQN/HXMpyNZL4NGcfbFgYuVhjP7bDx3
         Bqphw61tBx3ChIcaT6nTJdgi5aD++m77hpfGFl7DwktuU0LeAH5oh4rE6KJQovvdo1tP
         92nlnQkKwhhu8AFZifyA7zJOI7uPkZ6fhJf342C/YH0ZNy8RTGIKLgA2luVs2+rGwvrX
         ywfpKpFWLHmlzU36Dk9adXfZYK/Cc0r28eRHDRiLbjBTWggnV9PEqzM4Gr9t4MBe3JYy
         KF22NiHUlARQ5p4w4kJG7U50M8C4aMMtwuXsAudBpwm8L9ITSd4Y6PzMG2j9LIVZSSYU
         eOnw==
X-Forwarded-Encrypted: i=1; AKwUvBysDzFqtNrMZdL9M85VoALsxu0wjjZ52moIJLu/sIOdopXUsGngz1gbpEAW82qoX5ZM6v2lf7YdUT0Cv9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyKuIpo8ZqKq3JdDTH9WCrHVknhsJvV+oJxEBydsYsUXIWm3Q5
	/Hgqy3uUKj3JwuImRgzS3Ep5LNOSV449QS2EBzHKtwTxxx3GVsrwGz/L
X-Gm-Gg: AYBFou13iTKM1u9c4eLnQN5o5wVrECxcQb9JZQc/oHabJNhNohjED1ko2pkQT2gpi35
	N/fwvDteK7jQIe9W9hj8W3gwDT+69ZsErfXQCZo6vPtZWWCafQlMzNF3bJuTIbHQp8U7gOKSbi+
	rOjYMj+sF5smGGHf5uu1fBp6v3Q4qQdYsLUIUU+cT1NtJIAK0K3BS9DgbDFuf1IDQOQPQpT/nkt
	3X3BYlpxKpzDxMyoXkmooaXTBxgmMhpnC7OLDLgJcUd5EyYd0Bz4eCOgJ7gc+ZZyYoeh3l/7tnP
	FoUduQCS6PBqjAaw2esSYsTzT2jo1K+nSprt+7k7X3vzxn4H2vnjq/BS+T8AB/ZOmbzTq9aJje5
	KwLR0DSJTS/ExpwP8DktwcaKavNwgib6UGRDa071ITIIPDiZaRsYP6DCtjYDq9iwvYS6/T92SHE
	Ojhb3FULNbf1d0Y/hoMBdkLJiCSLMIZXKIVA8ksPNNyAwAF9PhrCqUUe5s8csw8RTZDnWvlTG/Q
	YP5Saqt5oKLke9y96KE+GBRjbMGZZ95YYUjBYu/Ur7LfY2SeKaddFCAqHRyY9J6A3nYIhJP1xGv
	Vy5Rtu+H9hrVT2ICyiTcD6Hutse0l1A=
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr142198705e9.6.1793476649395;
        Sat, 31 Oct 2026 12:57:29 -0700 (PDT)
Received: from thinkpad.lan ([2a06:c701:4773:6f00:ea89:68da:557c:f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm10065563f8f.24.2026.10.31.12.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 12:57:29 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq: Report pending state for disabled IRQs
Date: Sat, 31 Oct 2026 21:57:16 +0200
Message-ID: <20261031195716.194625-1-thnkslprpt@gmail.com>
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

irq_sim_get_irqchip_state() returns success without updating the
output argument when the simulated IRQ is disabled. This leaves
callers with the previous value rather than the pending state.

Read the pending bitmap regardless of whether the IRQ is enabled.

Fixes: 337cbeb2c13e ("genirq/irq_sim: Simplify the API")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

 kernel/irq/irq_sim.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 44747754530d..176100c074f8 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -58,8 +58,7 @@ static int irq_sim_get_irqchip_state(struct irq_data *data,
 
 	switch (which) {
 	case IRQCHIP_STATE_PENDING:
-		if (irq_ctx->enabled)
-			*state = test_bit(hwirq, irq_ctx->work_ctx->pending);
+		*state = test_bit(hwirq, irq_ctx->work_ctx->pending);
 		break;
 	default:
 		return -EINVAL;

base-commit: e9954f3fbddd25e1a01b7e5a0b72fb8b564204e0
-- 
2.53.0

