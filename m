Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C88D4CCDC2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642650; cv=none; b=cKFhT/+7y+ZT6uAIVc4noV/a1pDf+z7SQUPYrJ+DIjDn1VCrnq2Bmb3B19hAvoe9AKnOcN4bUwuafD71g20sODW7t1wYMC3NwqDpHTzJ2n/W7CdE+O+wyiKBnv4HjrF9fWizknQ0XZ6aP/RH9j5qBZxhvqqFiFyUokEkztOjdNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642650; c=relaxed/simple;
	bh=q8YXsS2Mnty1xFmiXZ0wd8c6UDOy/RD/D6nsd15HyW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYLFVjtRDiy+dOdQShviSRf7stZVZ8vuCGzrCzWsQdfmNd3CyJYcP+PbypClwrqGH0PI+kb5aO3AjSxGl3ThLmdl+b4gqr8BJalmgUlVywUIEkDIlqGGHIGzeGQ210/ZqghloNDoN1ca7sO+CKy/ONCRnFfK/H0dStq0U7hp/h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=fjvMlNYu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="fjvMlNYu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so4830205e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1789642634; x=1790247434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBiI+NCmLUKT+8KZgMAIP50JLY8JB1G0uYn55nZbHhQ=;
        b=fjvMlNYu5m7ufVikOMpk21ncFdBgIlRcLQe5SLxtY8URK2O7HmWcOCmbMjT5BL+VbH
         +o0XursZ7FrqKs6qMrJ53nXBeMT8rllB256GUaIj5ZldBZWptG7bApip4c0IbxT+/BIm
         BQra8yFP+ohwUPDCAZLyYrSRcteaqcUDnHOGLtk4epFgSdtPsRC9cQCtS+UZSf8kRE7S
         zUW/Cc2BeSBWG4kU0h55l7U8XnhuIeLW9EarR4y5betJDpH20ukxaXv5x7DDgCbayeIe
         2RGkyNAO1yokUFZihc+VrTmuq6z4FCNCLKP/1AnEQBXvNpBEqg0JPtX5rojkh3sl4Xld
         1s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642634; x=1790247434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBiI+NCmLUKT+8KZgMAIP50JLY8JB1G0uYn55nZbHhQ=;
        b=a6mPIf/QPJU6l/Is6bGLdWxO3RlehKt3yI0HQfCtYvxo+Y8zhS9rFnY2itNmtde0AI
         1fPiV21sdQsV8UFQ2oQ8XNOup4xfVW3gITfdGkSj1FrYOKxvr/Xa1cuHcvarPKffT4fm
         8zO1K5DbO9R1AN5RrWfkEkOBJt2vTX5YUMQK8ebJ+v6nfLqoPIDqTDbMPAtmq2Doa+mj
         hkxiTSyLKUTEXLPm9q4zOAIhUDsCWy9bwlNCZkHAPOX2dKaHqkrcR/yCL6BRSHsvQmzI
         UlYuTNEGNhNf3srDBlnkF3+E7RPmwojXrK5gNehfzigO3kDYdy/bJSk7gR6SiEozm5EW
         T1Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzGWFrhBwaQA1n3CVWs0K1lIDlr7DrdmykL1KKRvtjgaf7rTkfZeXQSA26NvIOM6d53ljtDDvOwQ3XaLAI=@vger.kernel.org
X-Gm-Message-State: AFuF++kvx9LFiNQKtwmxnR6kv9Bq13lhn9XCMyGu0WC8JnxavOtXhObd
	Wu239e7vPeUB1G9tVzJSFByAMLfLKyW/IG8SD4zF9LWH0PAHMfvH2AHkqA969EoyK5g=
X-Gm-Gg: AYBFou3UrW028WCvKOrDcXFv5I+xxGHpJrDH+B24jja+K8rWug402oqxcjhpbdMLseQ
	ycxZAoahm4cAKQYOjDWjg3x0xLGMQ3UZYno4cLM0IONpSyrm+vH64lUOYQp+8RvDiksClyVzqTh
	ehhqWvrwFyo4ioYshW2b9VV2o7JZqd/Nddge2ZQYLeksLzlWLMwfVd9+DE9ffGqR/+3jl8MCCNa
	VWORSohsb+4rU1B3NRcX0puR0mfQaE4lmwxLiOxl/AYn2h0bF3Piezuls7YOsAmiM6+CxP91nxM
	GCFr1YPNdwY7eYdEe4lP4UizD9ubazkA7M35NBrj7i8KBCGmWjSty7//NCEIgX2D5h0T6YfM6oK
	83LO2lCjsMzRxDZs8qzT7ziVSpCPJxjggYDcYX/HTLXZefyBKxejdVaVL48k4ZIomKf7hxZC97K
	v64CW8959YEYrAvVhA4ttzaiPgszJVktAKk5e/6zQBGCNxV9K0X2MYNZmxGIsQ9Ge1bZhn3KYIa
	rrB1J+v
X-Received: by 2002:a05:600c:8586:b0:49f:bd3c:bc28 with SMTP id 5b1f17b1804b1-49fbd3cbd97mr26974735e9.35.1789642634000;
        Thu, 17 Sep 2026 03:57:14 -0700 (PDT)
Received: from localhost ([85.195.240.20])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4870bf1fe7esm14884635f8f.6.2026.09.17.03.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:57:12 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kyle Zeng <kylebot@openai.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	stable@vger.kernel.org,
	Bruno Produit <bruno.produit@trailofbits.com>
Subject: [PATCH] ALSA: seq: Serialize compat port-info ioctls
Date: Thu, 17 Sep 2026 12:56:43 +0200
Message-ID: <20260917105643.90102-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

The native sequencer ioctl path serializes handler calls with
client->ioctl_mutex, but the translated port-info compat path invokes the
same handlers through snd_seq_kernel_client_ctl() without taking that
mutex.

This lets concurrent compat CREATE_PORT requests pass the port-count
check before any request reaches the serialized insertion. The computed
integer port index can then exceed the address field range and wrap to an
existing index. Subsequent subscriber teardown can resolve the duplicate
address to the wrong port and access a freed subscriber.

Take ioctl_mutex while dispatching converted port-info requests, matching
the native ioctl path. All translated port-info commands share this
helper, so their accesses to the client port state are serialized as
well.

Fixes: b3defb791b26 ("ALSA: seq: Make ioctls race-free")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---

Trail of Bits has a reproducer for this bug that triggers a
KASAN use-after-free and can it share if needed

 sound/core/seq/seq_compat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_compat.c b/sound/core/seq/seq_compat.c
index 22679dca9..80110501d 100644
--- a/sound/core/seq/seq_compat.c
+++ b/sound/core/seq/seq_compat.c
@@ -44,7 +44,9 @@ static int snd_seq_call_port_info_ioctl(struct snd_seq_client *client, unsigned
 		return -EFAULT;
 	data->kernel = NULL;
 
-	err = snd_seq_kernel_client_ctl(client->number, cmd, data);
+	scoped_guard(mutex, &client->ioctl_mutex) {
+		err = snd_seq_kernel_client_ctl(client->number, cmd, data);
+	}
 	if (err < 0)
 		return err;
 
