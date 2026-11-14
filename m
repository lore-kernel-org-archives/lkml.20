Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650543;
	b=Cp150RE/YUunXJDm5pYZjGraB2WrZmLmAR8A7kdnyNStvDEf8manWHMHBCpnu6i22bjN
	 yMvrHaVnzPae2+f0mZvmMe7R7M7YcKWGPoCNQuQTQH/4753razoUgM4v+yIbEZfqpTwaG
	 Ea2Eb9ornraG+DkgTBt18wo8v3cjgY3Di7hLbWJjD/Nssss9jUDLURJNm3Hpm0rN48HA/
	 Q4SBhvHampI3k9ymovLMLRbP9D/BwPJ8+5RZKoSJTLf/rrL7a+xPkWAHaYqYwAJy5f/PW
	 VLS45g7lx/4iZuVF6DGjzxjvjS+bjbmVrAWdx5xkfMk25MTHEtfDrCRL+a3jVrJnWyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=56kD8uC/JQs1NVPB4BPCYThtaKRA/inwI9P7GjKzDmc=;
	b=VIBkx7AmT9prpRKL7oX0EUla7emdXFA0NgmmRIU0IK/iKeMvjKi/IO2xcqtCzPpTLUuv
	 ZAUlPAMk+2EYSKfwqN0QOHd/zB04BmiXfyR1Pwcglk7ABVUXl3R5ThZMVxe2x9lsnkk+H
	 l88t5iauAfN7G5Lw9rRaTbmnImDa0QiXuQ6UFAWHFb+hIu6iowm2RwANFLeFCXAAVNvXq
	 VUtMZNVGktPpgvzCOmJqB8q81VFkX1FRYY9VpKnAvpGlT5fj2/uC4BDJQ1MCt6rWrk+BP
	 p9knOc5E0T3InxbWZ3o9nosTKKLXsFbtfI1M+Q0TsBzRBjonASBKyJPoBjv0PfqueBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0bvsNLa;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E6606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89E6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0bvsNLa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso22770705e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650541; x=1795255341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56kD8uC/JQs1NVPB4BPCYThtaKRA/inwI9P7GjKzDmc=;
        b=C0bvsNLaV9KaeuIJC/oVHjMVXQs87oWg+JqhC5fI8IZoalFy5Xo8/xyz5JCGQz9PVi
         DFZc+VNiFsf6j6PlGiopOsqWPMt5EI8PqGIoWP9/cDiITOI0B/6EK72fhp+anASg1VSA
         nojB9qjBNv/r41TIAxpf1l0u5vtCpxaV44hbjkENWbnVTcpJoJeCsqYL0z+zlx5nfzXb
         jri/tY9hh4x1imsne0wYH32oe18Z8P1NDUETD2Faii/exY6WK86w1ZqavAw37aOymhkh
         GDfuFOszOhfl4b9RA40rGtQ7QsoxH182MdDhJ5cVqep7OLs9ZiEMA9ZQr5SpHw6UeNvy
         Absw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650541; x=1795255341;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56kD8uC/JQs1NVPB4BPCYThtaKRA/inwI9P7GjKzDmc=;
        b=eQR7UY4zw1PpZ8C2fyr1f9ne79qChOXT6RFHNT4dqo1eIJ6yvpyWb5Q/1siGl+hdvz
         1/zaQXI7NjfD8X8EZ64BeHqn9guF0zwvgwdYK1l6IOx8ZZnm3tO25xDhQ741cTSl0fm0
         qHp87zlFkZoBT6w2p1ef8vtcFqx5iwmxjyFpuoptA86UaA/JrnorvEYT5WGyB/hUSKu3
         nMgxBiQfSjwMUWWDjHHh6c4TZfW2ZgisYGiqdjcqFl4CX21T3xnuwdZ7CVqzurxyD8Hm
         0QbSjZC2NHnRBH14CwcGaGaKCKe4OEORP2GHg+OlqnfaVsFBtbAFlMvzW4GmAdEA4bD3
         hkVw==
X-Forwarded-Encrypted: i=1; AL+hErH/Rmm1aXcDyX/al3LHLtPmJ9rNvOfE5+EoKamdPQ2DZ/5cdoy2pTbMyMN8HJ3afDWG5uENApUDkjZfFow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AxNDOJ9Alk8QjU/tiXzv9ioSUea+aYE/6LKMyVaaU7QzPn+VS
	VBT4t1MqTMMuGofTO+PspZoNiIS5Nm7FXOEVKs1XBFCnTNZZuwweAFmD
X-Gm-Gg: AYBFou2BYEeA0Ib6zG6r0OG/zb7gr4C+2H3gKFN187cDIcfkMz4qHgXGgkNhsEEKvF+
	BpHXEDw602xLRB8rKc5wPf/On0fyVxJ4MQcHYg00OYDXZGWo/Py69FIjz4wOnPiZCgqOOEx3tEr
	0dtQKd+gNZFv0iM7c5hTVzYp8VEzJCtymo1gT9YUfYXEnUK7z6Cl/HhPn9sv0EE/5oNTVwwUllj
	5iRA1HrnvwrXHDafOwJDlR57kWsrHBXmwR8v9yUfGWCvxNC2j4EMIBcF+bI05uOIxjjS5eRZqOC
	+GlYcMv1JKExIsBD20UwWkCww+OeUxJmcs4iA8E4m7iXY2DrDQkvs6RXhxdkzsNkbvnU8PQnNqX
	UNLFOuOHfjRA9pBSGTDh+aQgkWC3h6vZlPe4VjTn0rqoFEsbjLF3RJ8UNMksiYhnrd3ttlSDZRH
	5LE6z4eGxZFM3Vo9FQlKX75vo6ViPCzJbZu7hbrZSMerzgGOUymvCs9Die9gbKC9sx+zZN0qr2S
	/9HDGyrpKXGtb4vbzMHAMJnuiYXLZ7FDJs9hCN3Y5vtf+Vln8I2ziZcbAcKkn2LcRzXuEwEhWx4
	70+tWxIbW/dhP+/oZacZNM/FHkBQ0DrrNw==
X-Received: by 2002:a05:600c:6308:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb55a68492mr112151695e9.28.1794650540956;
        Sat, 14 Nov 2026 02:02:20 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:19 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: sm750fb: Clean up helpers and fix DAC power-off handling
Date: Sat, 14 Nov 2026 13:02:04 +0300
Message-ID: <20261114100207.9124-1-shroot1337@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series replaces the set_DAC macro with a local static function,
corrects the DAC power-off bit handling, and removes an empty software
I2C acknowledgement helper and its ineffective parameter.

The first and third patches preserve existing behavior. The second
patch maps the extracted 0/1 DAC state to bit 20 rather than OR-ing it
into bit 0 of MISC_CTRL.

Based on staging-next at 6628e7d4c6b (Linux 7.4-rc1).

Validation:
- All SM750 driver objects compiled and linked into sm750fb.o with W=1,
  CONFIG_FB=y, CONFIG_STAGING=y, and CONFIG_FB_SM750=m.
- A standalone mocked-register test checked 72 DAC state and register
  preservation cases: 36 failed before the fix and none failed afterward.
- checkpatch.pl reported no errors or warnings.
- git diff --check passed.

Hardware testing was not performed.

Ali Köse (3):
  staging: sm750fb: Replace set_DAC macro with a static function
  staging: sm750fb: Fix DAC power-off bit handling
  staging: sm750fb: Remove empty software I2C acknowledgement helper

 drivers/staging/sm750fb/ddk750_display.c |  9 ++++++++-
 drivers/staging/sm750fb/ddk750_power.h   |  5 -----
 drivers/staging/sm750fb/ddk750_swi2c.c   | 19 ++-----------------
 3 files changed, 10 insertions(+), 23 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

