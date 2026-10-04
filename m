Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689393B14BB
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147740; cv=none; b=jDmLWX8ab8OTlrzO2KD3bi/gUAOPJGelkkvQWPj4TBsFqpUWKSTKfdqXz7cyLLwBsm8+9Zc9XfqxGqCdctuzR4rb0JMcvviJB/Rjo4O5gydb2UTE57zIQiRKiGAaD0SJ3rxLa/AKaYQmsvzqwW5jZU813cdGVHU3pwBrQMB8ZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147740; c=relaxed/simple;
	bh=9I0LUxXM+OZDNWz3rSenB7v3lSagut5j/DNlEoZLhmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jyEH4hlXpwJeMTSuLzLdekNXQAS/cT0qkLO9xnr+lRAeO/SPa3d2mP2R0FCgfOLQh9SX+iRuQFjjnEwGKeNEpXe/N1U0WTxU0Pbx/CN54lHDe0FxoHhjhY9bN9goOjd32uJhXbhyhIuk9q6WZBmEbMHh65Agbhd8ZnqNtKeEn34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=aDQsOZpZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="aDQsOZpZ"
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7BF5F3F221
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791147729;
	bh=pGZv3g6OHISibbeAlwlkebf07nb4vhiMpwCWgKmkqkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=aDQsOZpZgCtUACXcuQMpO1IxQ4CLEyf/8bi3yWwgio3i8HKMH/JLjin+utqZXjigV
	 dHHylRt9Ysk+zB1hA5rAEv9RaA0vcRVyfz3oA+yqFNbwusCHglZ9CNc0oxsmoaq/kA
	 OXvBG4F0RsjFOUf+PMJ54EJKp8Aes6ZCD7LPvFSoTDgjirS5XuLKTmiOTuupZHVsPf
	 NjHsEkq7RdD8hfjH5XggBzwtskimS+osOnaDDm41i90GcVzJI2hMCHfrEgf/rKwCUq
	 d9Exm8TPZd8Muhzf/A5prXOy6Dg4NI7gOEhavj8vSB6EHp1O/4foswvzXIwqTjnhaV
	 8cwWzfZk3Ezn0TCdQ9v+PvJdHvG//sG/BVlYxZE0/D/OO4+QWa3YN7JF5AEeC8ZEne
	 ZnFWvt3baP680oi5svA6a8yxeo3DI4B9eIIyUkSppJT1C5QE0Ip4TjGlfDrd1eH0yM
	 nb4k7vwwgCFQsBAl0a5rhkHtjJ9Ds9cGqN4LOjbrOBrzjM2M7wB80nJini+Yqb2AII
	 H/mTD4fC/RxGhFMcW4TVc3Inm+O8gbcPvgSyrgA1n4OtPXHSd/mdq/AwsqTpsvbJ2E
	 ATKgdY79NtDjjlU6oFqylimIRxsDDxnbKnE3JNiHnqdOsLO7iC5p0HTjPQ55h/j2eE
	 wOTq5FpsW9g14OyfOIVll9/Q=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so1100965a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 14:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791147727; x=1791752527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGZv3g6OHISibbeAlwlkebf07nb4vhiMpwCWgKmkqkE=;
        b=EEBisXAZyJYHeUkD5ozr57QDpraCnA1/f30a5SzUfn8jSUnCE0pBn/4yoMj55dr5vE
         0ByPS/nA3/Dg1JF9/3UoOYGjUYeNMayJLzpszCMfdZP2t4NhYSqcsQd7FdJ8AoH+jQtB
         P9mLzhUZ3ibehVI1VQ7gCL0rYoNRinUzZ03Cbn/K9MVb5dwdrDgHJhpMUsxRrRTowZ4g
         wG0I9jaN7XI5tuKnAlNc2ZJm0JAmq6EDvq0ZMQqbH5LidibLTCJKmtkHF/KxX0bcnKYB
         za1JySKiPA0YTCnyIi6/yh9Hu383r2nh2lgAkeXLpIJNc1bcQhquMW7vm6yTLdWiNJvH
         mS6A==
X-Forwarded-Encrypted: i=1; AKwUvBxkyTHaFmaTbyJQHigDgNKbmjo+SSTTDrsTVlnhuTwA2oVebMbXkv7RCuH9puxU9mfohybo3EqaJSM+uy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvOEg/HRgUvda5mkxp5/3Dww+zZN0eFhrlOBQ+D/6R16CqMz9C
	5YG7AC/j4Mmd0ts2je/ueDlMUGaxZqBvsccdWJt0gnmVrOrZyiROHk0AQ/5WUh4aoVl5vT5plfb
	6wKO4d7uEGBc2e60CiG2BPvuqJzbtJUTvwYfjncYalB4zs2fZM8D9bNz9gfWpAarC2x39deqM12
	7S48OUyw==
X-Gm-Gg: AYBFou2e5AAI6KWIlw0hHUggX3bWUKnsgtOjbFqEY6StZD4/Hosln6HceRxqD+YHBKS
	FF06+BtRqDae59wr17oLosG3Fy+SLMVqqYXpYtxjh/PxgVieTx/Tz9LLstvoj4pso50w7I9Ka/O
	MRe63izYiDpZpJ2bNHyumvM0hgqPGezIPyVGNVxQcwK7Ges7n+SFtNwaq5PVmvsLwLG3bO7ycxr
	d9Jj3Quux9FoEVJlImNO9HGGC/v8Lr4P+i+4lU0JTvyTiuqvcHIq9PbM0LuQ/mNiEdVyAAnrwLK
	F0mieU9O8XtOmPcgnsbtFIVdTw9yiFIATEJvZWoMq/tL269xASEt5YjvU+H3XbHy+Zq0KOVrEIO
	MxfsUh8o2Mg==
X-Received: by 2002:a17:90b:3d8e:b0:3a4:d883:3edf with SMTP id 98e67ed59e1d1-3a798c79a69mr2989820a91.9.1791147727551;
        Sun, 04 Oct 2026 14:02:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8e:b0:3a4:d883:3edf with SMTP id 98e67ed59e1d1-3a798c79a69mr2989806a91.9.1791147727210;
        Sun, 04 Oct 2026 14:02:07 -0700 (PDT)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm8313782a91.7.2026.10.04.14.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 14:02:06 -0700 (PDT)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au,
	sahil.malhotra@nxp.com
Cc: davem@davemloft.net,
	horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	gaurav.jain@nxp.com,
	iuliana.prodan@nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	lukas@wunner.de,
	sahil.malhotra@oss.nxp.com,
	changwei.zou@canonical.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] crypto: caam - Fix RSA destination buffer handling
Date: Mon,  5 Oct 2026 08:01:58 +1100
Message-ID: <20261004210200.290119-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two issues in the rsa-caam driver.

Patch 1 fixes wrong unmap operations where rsa_pub_unmap() was called
regardless of the key type.

Patch 2 adds a bounce buffer to handle unaligned RSA destination
buffers on DMA-incoherent hardware such as i.MX8, fixing intermittent
-EKEYREJECTED errors when loading signed kernel modules.

Changes since v1:
- Patch 1: Add Fixes: tag; pick up Reviewed-by from Sahil Malhotra.
- Patch 2: Move the !bounce_buf check out of do_rsa_bounce_buf() into
  the caller rsa_bounce_buf_done() so the helper is only entered when a
  bounce buffer actually exists; add Reported-by/Closes and Tested-by
  from Martin Kepplinger-Novakovic.

Link to v1:
https://lore.kernel.org/linux-crypto/20260821045555.806471-1-changwei.zou@canonical.com/

Changwei Zou (2):
  crypto: caam - Fix wrong unmap operations
  crypto: caam - Use bounce buffer for unaligned RSA destination buffers

 drivers/crypto/caam/caampkc.c | 123 ++++++++++++++++++++++++++++++----
 drivers/crypto/caam/caampkc.h |   6 ++
 2 files changed, 116 insertions(+), 13 deletions(-)

-- 
2.43.0

