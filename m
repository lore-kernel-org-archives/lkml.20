Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285007;
	b=HQto9jhQW57FbhfEosbPE2ylj8u3AXJoOF/YFUsBxroBjvs/8kfkMC1WMa2RBf33VtsV
	 hGThYJogHlRCBF9WL726irmhEEZtiMmhxVYhZi9kKoG6/y/qfwHMK4MVhzGZ+4leFg2yz
	 heMzmsEW4gNnbE+6H9rfXWj+q1ERZ1dVk6Rfmblm2Aj+YJo5M5BowRw4xZwgycBvSnhTL
	 9caiSUEmrj0O6Ori2gbWO7zxKrqN5Pw002lC5QCDogiF90j7+rxybJslje0PhfVj2AhgM
	 Ot7MKvhL54pGZK/mfyvoV+HBC2HUgApEi/HdQC1d6KTRCHuU9hepvqNyWdqHhLu5Tog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Q+FU7s/IaJwwuXx/A4tn6m950pvjid5cEZuWPY05gI=;
	b=m40GKUMcWKa2aszXv9uHPceHq+EFI4cmKEH96kIh+jPL6HnDZbKzoPLz3YrloaFqyQms
	 SHbXQR0T/sKJSdPkYTX7Hl0NTtCjNVNxNCyQ0TJfApWkL3tLw3tz/ZGjs30PsDTKbrC+8
	 RX8DbTxghf9B5b9e2vanIWUat5uriqzhTrzpqyW2bYtHMwzZ7KWjd9LI0bkiC68zYRdVY
	 f298qM31czKlvZqrVeBoNEFCjcdgo0apDf+DPijCkjRTrkAOM/J9ywHfaqth58PCAd+WA
	 vSioovmaHqGojh8XDEbq41RHsa0zCLL+HoUwd+3uhj+wJHnTdH6tKizeiuo8kej1MKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jkIVBLFq;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141CE606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 141CE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jkIVBLFq
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-945ae2daa68so195451785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285006; x=1794889806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Q+FU7s/IaJwwuXx/A4tn6m950pvjid5cEZuWPY05gI=;
        b=jkIVBLFqe5Sc3FAZ9m+7h4t+IofeIHaG07XpOaNxAqdjuLCAnUA4RqoMBjyh3OXhET
         yE/sfvbgZ+psllN1gD0q+FuE4RFp+70aXrvIaEjTNnLwCyyWWrYj75z/95ZUJ3KlvuB8
         +6Zj1pz+FqjsmbvFrVCpMmCJBJyShREnZgGNoLscI9uyBUPmPlET12QXoXogifr9GXOJ
         7xUVHLv8Nd8swOP9U18GiXhEyqkrD9p0924q1ysJQEO7OevgnZbHRNFA/FqYRFuTFMlC
         zD3qFgGIO0ve1+d2twoUYgM4T6mt/NdA9yYgCywBjft/T6ZUeWTApPY8/0eFF5fAss/P
         572Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285006; x=1794889806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Q+FU7s/IaJwwuXx/A4tn6m950pvjid5cEZuWPY05gI=;
        b=fwtUZ0giVovnQNW3Qmm9nZPiMdPyaRCOPTlkc0a3jO+nKr3WXF3RhlEHWuw+KeRbAX
         5aUutGrzEr5Xxf4nl2zDcxiG+bwxQu0GM6vjRkcGONDDZFnhCmQ9WcEgIZ/f4sGm3xLJ
         /+xf0ev9g1445X89WGmljr2jCmKapRs2+z86K/w1SkL1tZwVSaIDTDYHduI0nGEX3ZmF
         NychB6jEbqybUi2dUBX1iSGGPjKOorlFoFSH/3QVT/vF1atZPoe/DcH3evP3uEuLJV2o
         kEtT6+xEARQzAkTY+99HCE7F7Z1nPbFqpboFXFL3LTgQbEFTlSKK56TQHNOfzd0iUKz8
         WQ5Q==
X-Forwarded-Encrypted: i=1; AL+hErEA0WZZIsyFe8ulUMC3wpnZELKPTmd/oZTPDyYOSmff9asakdJC3w0FGgmhvImzN5CTPdtgE2Ak1nSayZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jBSe7qYF5XCl3TiEFQIAuXmfc48JkDXyDDDMTeTjdh1UW78Vh
	KK1Nq92oJ5ZdpCVNFcWmGPN+A++Kiw4zPReYdXfaT3fUYf2Ifz4zipU=
X-Gm-Gg: AYBFou0pa/sXm59wyE7OuqmCxr6QBzO94JBVQ9U1jvAmE1PZgEuR1SFk/AbDPvyftro
	YasEMF3Kn8vCA/84OrB5kT8+fpNAMZLm9YfMxOZ7bAtDVN00wZnuCLpiY9ucznHce0s6m9osiC9
	+tyDVkjkKc+PkKLKb2SY2M6Kd+CIyJ67ws77f6+/mfZVffZxNW3F1z1Zs65r7QCBanrkpUrsBaT
	PK5roOjTSRB6ApCG1h7ibZjeSkw3EVCk3NER0E22InNKbr2dUcmRo2SiOzzMm6FJrmAkgi471r4
	YPO0Nac7xQWW6B2zMv5uUCBb/EWpYcvvj/6u6KySAj1iXxfo+KjIG8xDoy/8TmDaBb5P68qEqP4
	sY6kejdboUdDm2gMiO21JrP01/gZOiXji5CRkukgaKMLYFPiqTTJOshdMlaCDXyHScygtD4RzYz
	pRJ91XIFJ/gmDCOWhap8Y307Yr1EuSNXn0MB4QJhyQdqAUs5nHTPcLDfU0sxk88GPEzojmKDK3N
	omtoFQ3lAAOEvh5kNrnAv0+zAh/JJ9tAZ0lBuFQxutzG03pT1hAA5wGfiu5Crg3HyER7zMMRaKN
	k8Udy0OYNJRUox7azONo5KAu24cLWsxrKyFCOIN/J0e4eXIRkWNNXAMBYPfGSI7O9MjLro4pgCh
	Hi7WnovfDAbicTzZLqk77AWO0DKD/OYsXYGjc80zvvShlyARjhik/irPyWdzA3gFdDfvkKPS1KH
	5PEOmYVCj9vQ==
X-Received: by 2002:a05:620a:4015:b0:943:fe60:3748 with SMTP id af79cd13be357-9479f4ada94mr265600785a.25.1794285005889;
        Mon, 09 Nov 2026 20:30:05 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e734698sm136705185a.13.2026.11.09.20.30.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:05 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Qiang Yu <yuq825@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/lima: disable the recover work before tearing down the scheduler
Date: Mon,  9 Nov 2026 23:30:03 -0500
Message-ID: <20261110043003.56648-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

GP and GP MMU interrupt handlers queue pipe->recover_work to grow a
faulting task's heap and resume it. lima_device_fini() tears down the
pipes before freeing these interrupts, without cancelling the work.
It can therefore run during or after drm_sched_fini(), access hardware
after clocks are disabled, or use the freed lima_device.

Disable the work before drm_sched_fini(). Use disable_work_sync()
because interrupts can still queue it until lima_fini_ip() frees them.
Probe initializes fresh work on rebind.

Found by a static analysis tool under development.

Fixes: 2081e8dcf1ee ("drm/lima: recover task by enlarging heap buffer")
Cc: stable@vger.kernel.org # v6.10+
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 9a1e6b9ecbe5..7a9ccca1291a 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -539,6 +539,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
 {
+	disable_work_sync(&pipe->recover_work);
 	drm_sched_fini(&pipe->base);
 }
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

