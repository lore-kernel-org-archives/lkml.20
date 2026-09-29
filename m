Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB283CF1E5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683676; cv=none; b=H2rLMIqlRYg6FnWXM2Fi7sg7AEVGYB6Kr1NvVd1/lszj6+CobpnP2jX8V/floJbRH61R3BuNr+Nvvs2yX38PsITEk6xwUJ7YTb7EW2GLKlw49sNeiy4i2HYfTc1W3Z5Q+gPCzh3PZrWQTu/ncc1mrrvaVMJ6PUF/nF0CFhBJFhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683676; c=relaxed/simple;
	bh=0Ll4i5qwdxy1n+9kzp+J6DAKRPK4dddbBgYhPreuD/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgNl9errvfjNAXM1er3crxa4sNZBMumZKhf+ZREnR0/HUEMznma2vQKoFOLtyoUxtmTKzBohBQ+beovXthRrB3UGExB7mhyP1IrisO3JD1xkelOX8nagVuezVQecJ1eOjPhKA2QzKYIqFWsgdUwYlr/fssrJqTroEV5h9Kkwpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UDaNr2IK; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UDaNr2IK"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af0707d41so397485f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683673; x=1791288473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZfDP8VRt6pSeRBryzIA/0Zz7DW3osTGUkY7XrICjRQ=;
        b=UDaNr2IKKomtJ8HZzn7acKSdmIa82JtPPRKJJh6bxJRnQmTl6axEw2utt8dS/GFEpg
         31Bc/Z1iNkzAFjbFPaN+U5cEipFfWXrHAP265+71jErz2G312y0De4Rx4jr2puEY9xzS
         /kkZnqonAXoddSNSrc79H9aiGQ7ozwjt3gGTVP+gVgvM/8oym05xAXSoDB18gBfIgyIL
         /waOQFVyYj6lCbxG/poYopP+Y1gpPLe+zgp1Piui12Pzn8GdKHBNPZ4xx44b9w9nALXL
         vzlE0xT1iQpM4EyfG1xgUhOQC31k8mow7o7YYF5t5u3tyGwc3G5D+tp/oOBm5xQHP0zG
         FMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683673; x=1791288473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZfDP8VRt6pSeRBryzIA/0Zz7DW3osTGUkY7XrICjRQ=;
        b=XvLQjNCHYdKB0QNXt+48fNHBxK5Fd5w0GKUYrSWxhk5n4dVlzSfMBdLdqp1+XvbShw
         /RXT60hdu0IHpPKQXYq8J1M2iN/MX2XjbfEv54oYFJSPBwW/AeyxFZ/WoqB/VI+Is4Nm
         +zo2Xl/X83qkCY+UL1E25fw5Rfp3qep6yBfjp5tBWuKtSU2zCx46pfFQa0jmm2DQ5atp
         OOasfNH4sttl2Bw33Ww7E5nqTwLKAiOdjxtHc2cizrhVgphORul+0NAhcTJdc61Exh9b
         JlFWctZkBshVHwj086IFSxfZKUBBcW9c96hK5oy4W0GR55/MRfWplD7Lt42XTEktjejs
         FOPA==
X-Forwarded-Encrypted: i=1; AKwUvBw6Y5n0BKKAtw313nIwq96iapHiraKcDSkXHSr/bAzhHcssdzcqgvZap3n6P0YsyVaDEjsHoid/IJJiuNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6brBFX1zoVSXESTIEmD6yV1c+mLYjCHIxi6kv0BuVUNoGzQlc
	+kRWWS7ZxaztBQhbbqYnOTP++2kKzqGs3oM9ptNQVqXKSgbD4FXMcn69ibkadWU3s+GoHdY8uTP
	8N/vfx1U=
X-Gm-Gg: AYBFou0NvFsSBdRaDAVniZAAJpfPQOtHuCbYnqyrVuwGfiLfh2NCwoPW3V8Vz58QlWr
	B0O7PLbydsd7wfcV9e0X0OaNSlJoBBP1aafe7eJ4aSPHF08Ypak3dA62u+49wNVWSsZDpRLz1yT
	wrCIQ+xOMXIOsvy6b3c8Ynsc6Pky5ktJeYYDeyggYfIvO7GV7QcPp03zyypfiClFReVw+2Vklcr
	3F2I7DCmmmMlwuYTNjhObSJIU9miVqJ4JpYV32s8zQezUpk+1T2L0xOHdeAH/S9OpFKTlYuDuGs
	ddG7GMp3NXGJN43pON+VTgSDNFQN1sazfyHYjxLiC0MeL2L+9Oy3XLJz3fO601wcM90Xzrxk2B9
	rXoSV8FmqeDPMvRjuQZF0wnXf4kGfmGRZM/6fHyBYGhcrECLMhfmrwwt9ANYb/v6dWa1kQ3zhJB
	vvDDQSrvxxn/Gs1mtXoqqyulw/YIFLfNIP/mYNb6AHfwufxoYK8NuY8OGdt+iwrkQj5Q8jfGzuU
	UckV1A=
X-Received: by 2002:a05:6000:240e:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48af1ac8c4amr4832536f8f.10.1790683673346;
        Tue, 29 Sep 2026 05:07:53 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056a16sm3398058f8f.18.2026.09.29.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:07:52 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 10/16] printk: Allow to debug misuse of add_or_update_preferred_console()
Date: Tue, 29 Sep 2026 14:05:40 +0200
Message-ID: <20260929120546.328616-11-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929120546.328616-1-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__add_preferred_console() should always be called only when either @name
or @devname is defined. Allow to debug the case when they are misused.

Use WARN_ON() because it is rather an implementation problem, it should
never happen. Also the consoles are typically added during boot so this
should not panic a running system even when panic_on_warn is enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b458a920ce5a..683083405230 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2585,7 +2585,7 @@ static int add_or_update_preferred_console(unsigned int i,
 
 	pc = &preferred_consoles[i];
 
-	if (!name && !devname)
+	if (WARN_ON(!name && !devname))
 		return -EINVAL;
 
 	if (devname) {
-- 
2.55.0

