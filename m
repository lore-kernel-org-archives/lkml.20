Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792480;
	b=rCY1QXnUIzPuVOx2fgmRXaXa3vBjWurXhW/tCbV79bezvT9kqk8pxSftC6b8SgtbuJeR
	 2IzRbsio5eOi2vRAaSlhOULt70oRMo4Up2she/xP8A4pZfnmjEgrmA+p+SNhT8F9lbZS0
	 Ik3rmm9ZHv5F1TUzP6OtMtKmZJ90jyORReF5k/giZ69teEXvdbuZPS9XhFZPxiGlXcFkY
	 w6cbI52GwhLOov5JuwB6xRnfpw5PjPGVIqM/Qdsa+xgsiT3FAbR161mkiln/rl/q/zx9k
	 aiHKHex8tDW8Chwgqus+vD2+pqFy1PDgLI61YjlVWzDXK/2kM4ZGp4qRNGuelq36wGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E2LP6H5UsSB+UFazxVVR2+v0PYB1XW1mXgdBaNKHzKA=;
	b=etOSjlbsQdl04dl9Qnz863WDNzKqgmDs4Lz9VZMGJ/5aEOB+fNcvG8rdmwrnlTdBYqn3
	 ol+OhodiWgY3f86CDeDTZimUYCTtUJtC1tFJbYmxmVT8QBel+beW2OiTlTU0Y7Y50S3qK
	 I1kDJRUmUwcAMMEvGbgM1mXrKxToodJ8TM0NLYVCbUDam8D8+IT83zgKSHizYByhIruau
	 iQVz0Ru2tWSBr9oTvkVjOrKtne9z2lM31Nb9xDsAtF/GSs06laJs3XxymKzaUzHB/vEz3
	 vcNAVlnL7REGNJxVweqLu5eauqTu8rdVJJWOtv2xog5FTUrQPLoGb70j23r85ncyOmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkZl7+f6;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E335606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E335606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkZl7+f6
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so418391a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792479; x=1794397279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2LP6H5UsSB+UFazxVVR2+v0PYB1XW1mXgdBaNKHzKA=;
        b=fkZl7+f6L4V8arGYXAJZwGtYn1BREVgoRXS8+1r2Wc+nO0ckgQ8+tkvLM4FpgW+Z3O
         pZw5vZw5XPGdNk6oWaM4laOZxstUTknRveNfJyLl2lIArW54xbzOGLaH/TwDlCqBPf2J
         Blo4QSj5zOsZvB+k/h9YviK626EU7dFAp17F68vzTjCLDySdVVKVJKaHk/RFZrkYQNUl
         so46K78oQ1p3b1PTmq2HPIoQdXIr2g9f/0cO2+xLHqSbV74pgJpiggdyLcmQDLW292U2
         59elyZtGnzezqp/pGCtDnYHigwgnDtcsq+LurXBxunpsT3VSVp0wcS7ltJc6k4N8kggQ
         JKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792479; x=1794397279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2LP6H5UsSB+UFazxVVR2+v0PYB1XW1mXgdBaNKHzKA=;
        b=JTdF2OrzNxLuY1rG41KN3pIeitHvLksm0V9QprwdfHHySmgd7srNsKGmFDZa2GuORo
         pwKKw26SqFNxKwL4kaXLBjVvHi5uv+GAvvvHJmAtjV1p5AOps/I2yH6B3kUKJ9jaL/Ts
         BTXD/t6N8T6OjvXm5fEkZWRO1PxIbSZxP4//A1J0nKEYJHCYSMIfuawLfd0RZs56vxrr
         ImnXzBixMmqaVVPuYUy+mRlgR8FjxiSNTaeZCo5BF4p3rpMgTcuEOThPEOZutYkiBNnZ
         /nP+ld5w61TI7U90wWyV0ox75z6gHWJNiXJgfoeXQeEpQ1y8sm+NT1tYu1rsBwU9J5kM
         2+zw==
X-Forwarded-Encrypted: i=1; AKwUvBy7lu7zQkIIrzbrAwozUOCqx5egEnbA1rITX+NZ1cuVT0AgPOHrsBWLyjB6/FZdybvpk2/iz9THTTCFQ1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vGgHYOQJCABUmlD/XcOfXk1ratOc61CRvmOSDz1RouF25R80J
	Fr/4JWw8ttz3d6moocXSlG9BlXca0SZK/fG4GIxIZlXU4HCAKOfxsJ1d
X-Gm-Gg: AYBFou0Y+0c089V9OsFYNDXNHgURyDIBuGbeOuJ+37rx1Acc7YVoC4w8MPyZk1b+cqF
	rwHtCcTj4kFdUEwV547nOAvZHzsxhb2L+iDIj+llCp8VF4KM2pNqNkLfE1Uz5YsMchAnUyhm3+f
	WMxW7L1KJ1Nzjj8nDWwnsblIKtGV1X1Fe9GmjbuVqQ6/80ymjtOQlAko3mGQ3jrmX4JxVetlxGp
	Lr0RmyBsQEy9F4Un2nMotq8WYa+6gYrGgmcegWVRrmIr3HsoWSv1M/JSZOIIJ/bSA1iwfE8RwLo
	1gVC8DZbdLqFKrH5/VzanGYVBKoxjqnnLvJIO8GqCjUpHtyvAtTe3K6wUnHSkbIY/bAx6n8FMNC
	i/Ziu07T0CgsPI62xwrKLr2nA32MtMu/NgW+hoHK3FNMa4yTRT3HTK/dYmSB6LeIf01fONXa9yt
	rHG2DKdve3NDE4B4dFEYTLfNlM7V6l/kC8phuvZl2H7e4CfxJpgnQ4zdOXQSbg2lJKvUS+uXExl
	31LUEKbcijBju9/jM2JNX2ZbV2r1g7inT32SbTrfpZ5HuUqvr/Qev7UYBX7my3JnchqdRXmnZzp
	l4Y2q6L/jR7Cwvs5b5yCUTuDsQVZJjF6Um0h/PEVeHnyGsB37CBhZ5r0IbahwXshavariRizSao
	=
X-Received: by 2002:a17:90b:57c5:b0:3ad:eb29:3383 with SMTP id 98e67ed59e1d1-3ae897cc800mr13485965a91.22.1793792479440;
        Wed, 04 Nov 2026 03:41:19 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3770036a91.1.2026.11.04.03.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:41:18 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] hwrng: histb: fix the FIFO batch timeout
Date: Wed,  4 Nov 2026 19:41:03 +0800
Message-ID: <20261104114108.2378751-1-mmyangfl@gmail.com>
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

The poll timeout in histb_rng_wait() was derived for a single word, while
the device feeds the FIFO in batches. Fix the timeout, and print with
dev_*() so that the messages name the device.

v2:
 - reword
v1: https://lore.kernel.org/r/20261103041403.4071708-1-mmyangfl@gmail.com

David Yang (2):
  hwrng: histb - fix read timeout
  hwrng: histb - use device messages

 drivers/char/hw_random/histb-rng.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

-- 
2.53.0

