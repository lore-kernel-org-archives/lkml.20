Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512023955D2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457659; cv=none; b=N+5xp5tV4FzQVndMWYwVSYV0GXsE++ryTuSwYfv5dFOXaqq2ZmzmN+bn2tdsCUan8mGrP0w9itGuJ7Ptg4+dr458srMHu2gzhEPJuUBBxgcNF9KS3huq9tS+Z8q4zOGnYQU3hv7Uu4gg2rzR/WFIcac5ciIZWY3QUrySbJdv3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457659; c=relaxed/simple;
	bh=ehymt4lLAFUs4DIWG3dhPtmab2vi6Zhi6J9yEIZNRNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZQfy0glSHysfL66EkL7cljOhmoDD5YZtIdzTzY/5R+jC9a7WwZSy9/W8OYOCEKB/7+9loIIjiewGPOn2As10qA4zXGO6PU6F1XcwtgxOvGS+TIBLUc8EVyfrlA8/FztZDocFPFfP57jsjJJ0fuWP7JLPpSaTlPY0Z/wXD628EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/whwn4Q; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/whwn4Q"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986e0b83340so1139708241.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457657; x=1791062457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3SALmSygZKgLrynJMWzH3B1y0jcmXpTFsBEcTzacV4=;
        b=r/whwn4Qk8dT5RsTGNRmgg3PLybtN+HzcZMj2bql/Uy+9x4hpvkE8q1MzHeLdQAF0p
         DnfKiXVKQDoMljDfuGLA4S+Ox8UboVqNrkxSAT7c+ercFphtVFHHlMXZfPukyJtfXQ96
         Q4e4ND0uZ03zIaONfojqNfDKLA8K4F+onm1SzfHuJBvI+4RYE2KpTA3vqptR+vigdDTX
         EupJtgaaw1CWBh9E6YNP43CuHZb3UhWWmLtuUSbbFib4sEC3blZFOyX5K0HwdY1dUbhQ
         MCKV9aTa0E5od1D9fUJmtuhdUYgZvZ8b0g0Z6ei0a1C+mH9z+nD4UOOZKoc9OPo8jIon
         kjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457657; x=1791062457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3SALmSygZKgLrynJMWzH3B1y0jcmXpTFsBEcTzacV4=;
        b=dIDLBEFDuQ0vos1MXoxV0svXzj3I9C9dT53/gQ3MuPztMOosMMCUxHrax3/pz86Zhy
         ieOhwBYbAktrd8p97sEX2sSHHUDCMx/u9oJsq8x3QH5tpaLCCH3MPz8PKEGWFunClEyf
         DSMUba8iS3EC3mrcZURZj/k1QMxWwiwOQ/ura02qKlItb68qynAHTrmcCU+XHNfsDnfV
         jBzxNIVUok06MV3bkc7ih+kvSFLFvCj+s5yB5DR/eoSv1spo+oOEejTPzGHFyU/5qAxv
         yxb2N4iO5SRzcMcryO9DT+sPfH7z8qVnR7302GJBmvo45aP1Q6Yuqbw1fO4PB6lh31E6
         QjfA==
X-Forwarded-Encrypted: i=1; AKwUvBzPoRcMLKZR9m0pzXyISThggy/ZZz4lSSnDMypIIMTrxwB5zyo9dcYWlDPpkbHYD/J5L51Ej7U/9dzg2hM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJig4PDxFiOCZeqSEMjuu5sA7zFodmwALINDW7wUxqgJQLk/EP6
	aROvMkyiaNEt5hkIorZGMlRsrbic/RaxFGM7oszSn6ytXm7jPdVsJjol
X-Gm-Gg: AYBFou2SIvMqaso+qLMD2cq3YgzONWqE44BsrxLs6WybWEMmOb87qVgINHz7IkdzXFi
	+VDKcAw8D44xcNKhlCz8kb70AL5Rly3qlQRtd+XToobKBmT8ihz9EqLlrRadWFpwB0lpYmIJr6n
	ic3lYh3zxzi3c1T5k7ZtdChgsMiASigR8XnszoI0gS0mBjJhYSK1q32seg9L9udcIZ2MCukiHcI
	1lTd7wBc8vW0ew3m/enqWgu9YUJOhFEo5IVNMjG2yz1r6g/V5N4Flkns7LPVsr8ezjLw+UdbFWD
	c3V+hQM1CN2w0c09VVx6HwD0Fd4NCYY/GbsXJa1jfHC4xn3b6uTOXE5sgwatr8dvdbR1XtikYTR
	nVkis449mWXM0xyn/9LbRXo9MhcLOwVSjrbDSb7fKkFWpKD+jmQwxoN+pMV4ZCH858JWtcFldxQ
	g8yGJPXFdssbC1b+QUBUBB6wvYwpUwpGdxA+T90rdl7GpGONfWeuZ7PGn5dsTXidhlxVtJQrE8x
	g==
X-Received: by 2002:a05:6102:4b11:b0:7a7:198b:674c with SMTP id ada2fe7eead31-7af1f3f3a90mr3668073137.33.1790457657120;
        Sat, 26 Sep 2026 14:20:57 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9ae253sm3267723137.8.2026.09.26.14.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:20:56 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfc: llcp: clear device pointer on disconnect
Date: Sat, 26 Sep 2026 18:20:41 -0300
Message-ID: <20260926212041.1342558-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_recv_disc() drops the device reference via nfc_put_device()
when a connected socket receives a DISC PDU, but does not clear
llcp_sock->dev.  If the socket is later reconnected, any cleanup code
that checks llcp_sock->dev will find a non-NULL pointer and attempt a
second nfc_put_device(), underflowing the device refcount.

Clear the pointer immediately after the put so that a subsequent
reconnect does not double-release the device.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/nfc/llcp_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf81700..199543c47 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1220,6 +1220,7 @@ static void nfc_llcp_recv_disc(struct nfc_llcp_local *local,
 
 	if (sk->sk_state == LLCP_CONNECTED) {
 		nfc_put_device(local->dev);
+		llcp_sock->dev = NULL;
 		sk->sk_state = LLCP_CLOSED;
 		sk->sk_state_change(sk);
 	}
-- 
2.43.0

