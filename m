Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186344;
	b=NYzeyfeDa+Z2hFd4Gqoex4IN5SpihOYUqe0FCqms986A13yJohZOoDw0x6T0vadQEDub
	 KAtcGYzzrSK1WA+8tfalXoOJMHUh4qdJWfsivNXd1sx2VrtjOR87kJbd6DckyStaWSHvP
	 T4d3X09h65/+iwVAtmfRiyxST5NhNmx5J5rCVHX81rncu4ZeY4KyiKZOdbXb623loCGQI
	 8d1p3udAfrpGi9rrI3DWtGKekQpzVeFaXIPvOrNFmO6s5fKMq8UwpUF6sPDfDIQsHPAEL
	 kcELw8r8ZyAyAlFBtOcDWc/YuRfZRf2MefpYmhNtD0XMZrAAxmSGjaGL0HTqopNI7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iMMtJqFO/Qle89nnsy9oUzaGg14r9OuaMM5bIBVnCI4=;
	b=2Ja6vVClQRhhbcbcfrZME2WtN+HeJuSyBNX8VZs8vjbx1uHqfF8qyHsUpL7dZmLpokPY
	 zfzs2I8xxWauCYhenLZqM/+G4FwBsmoDrgMR1Ql0KOwQLt6RG55GpDycDGjS6JtwhT7gk
	 trXHoIYcGKDANt8sOxGQcLCO/uK3FDHog3byVSN/esl95nWoQ75Hei4ggNkpIkUD4PSOY
	 D/z0bCquJ2fYk9Q9bV1xMFVJC1WmzGPeVNQQVSiiWyHJxYcWkeHjb4xWukXIxn3fZghWe
	 S/Cx5vcFD79ylAycsI55B59t5IxvFIhUuZQO8YYSI/FPgk5WxK4rKCTaMc8fivXwHZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkwwcWkz;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650B8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkwwcWkz
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7477325e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186343; x=1793791143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMMtJqFO/Qle89nnsy9oUzaGg14r9OuaMM5bIBVnCI4=;
        b=nkwwcWkz8TNjDDmqiqeh7iSi35qTG52KVnUwUyq3juIbScLJ+AtgE+8FpSs/GrwfpN
         aaYgGMgKgdVnCVpZQTBxWLF3VC8m5QYDm2bXhQ1lVFBng4sAITE/w0CLACbT8n5a0PQ2
         CSHfNFcARY6Nzomg2KFE9o6jE5LtssDHcXRqweXtbMUBkwrj4DWYMz9lLHPQfXhF5fzr
         HemaxwiRGYR6CzW5RVtAuDQcjWbeGwkh7z3cuZBdOxdNWengtMra9XmmmskQCRjHbgzO
         OK+kMJ75s3nSSWdUpJVK66MkJZsblOh3pbSBI3ACJOzC0kaJwTu8CUS6XpuZgWgPNBf8
         E9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186343; x=1793791143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMMtJqFO/Qle89nnsy9oUzaGg14r9OuaMM5bIBVnCI4=;
        b=LDqg6Icv1Q9mAJB9l3GbhRgXHF3Dm2kV1YT9wAOeUBD++Xdjpc0XXSq2/O1JS6Onby
         YjYNWzPvXKaDR+gW5XcYk+deF5rg4Yr0/I9rMpKxIVTP5sNRDGRrciFkXwBsDLyGyKfH
         StSTEfSNve7BEP4ars+M/3abAkhR5aeMdJmFz9u51FN4azobaQnKFnV4Z+b51sN4J0Af
         zgFKnYWYTCwtcu8QldIwkMVkeTSMvH1OJbexUqsz9Goo8edUPIGkYY8RyWqv4fjpgyxM
         YfGAQO9/JJs4w/YAn4qZGVr8X1xgZS4Mgtj9HGGaTiiNpjgAeQHyXNceh/3ECqbXrOvQ
         2BkA==
X-Forwarded-Encrypted: i=1; AKwUvByL+VPaAHyUR1YLt6Pk/u4Vm5VPQEk0dit2wNVp3cOYrA5yWArzAAWGp0z+P8IRdWIRR1nS9y//caSmOmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxSL0mcOWyD4DOuAvzg6pryaBuZcyfyCaN8oxppOySs12QZ3bz
	vY6NFLvfEW3hM0/COQkb1LPc/11gb5wIl4UmqrAcUNwCHDCooIns1CMt
X-Gm-Gg: AYBFou0zV6KpCTfiNPloTKFuLds+TjIeVFq8fGqY7A4owPWIODye0fLdAeS1Vx2CCnV
	ZqXIYElCJcieRN2/aK3JdZBu5xBuqlVwStTAVz9s75kZMY+6IrPyTXOm/PPDReG0Mu6Kedq4RaY
	yCTvx7QhuoQ84Ts1VO5uzxqwzpLbAlXehMxr2eDMkqDItiqZ2Uu8nyRolc5KU98IVZ3M/wDGwjO
	KY4n7jkr9J9fbniPG3pF6g3GQUMP+yU/A4UH8SM9idkOjPV3MKzlvjgy6hBpBZxd0drOHT8m0Hs
	1IWMKVdAvMq2J1nEsnffC2Cu403cAbB4RjB9njGJiX/PP0ovwc/Cg+9/AeqcZ/eoKZX+sShc6l0
	qM737ggDLiAjmTPmtCDnQT1TrNkXj44eI3Qu7MXeV5K38SD82vyWOXlgUHNmjTjhFQ+Hu6J7zGN
	+nHDhtDo1htapnnXFmttg7zaGADVBlmwscsPr0FbZSG9cIJIqGmVESlNuVtSSjf2w8t3zZhyc85
	1I2PHNtPO6JnH8L4apVlDm1ypqKgrhFscF4i5gcSc9Acbu8YDu6SP0fp6pQqnBBHWnutGgC5U22
	UxSgdSKs+9xnG2WXVQ==
X-Received: by 2002:a05:600c:46cd:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a96695ec9cmr36091795e9.15.1793186342385;
        Wed, 28 Oct 2026 04:19:02 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm64197635e9.10.2026.10.28.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:19:01 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH 0/3] HID: Replace deprecated create_singlethread_workqueue
Date: Wed, 28 Oct 2026 13:18:50 +0200
Message-ID: <20261028111853.22429-1-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
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

Hi maintainers,

This patch series replaces the deprecated create_singlethread_workqueue()
with the more efficient alloc_ordered_workqueue() in three HID drivers.

WQ_MEM_RECLAIM is added to ensure the workqueues can process hardware
events under memory pressure.

All three patches have been compile-tested with W=1 and produce no warnings.

Best regards,
George

George Karagounis (3):
  HID: haptic: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue
  HID: elo: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue
  HID: logitech-hidpp: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue

 drivers/hid/hid-elo.c            | 2 +-
 drivers/hid/hid-haptic.c         | 2 +-
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.56.0

