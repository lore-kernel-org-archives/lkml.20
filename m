Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238743;
	b=n+fTiguJKjKVvVtrU9ToAl3tFVsgWDPColzp1tvlsFWRdWX0nPrWEoGqAvjSRne1XqNN
	 2kpDaZNTzxs6FnM8X+VC6uw6OtMvGKQAi6ysY4wpydTLazJ0fdTGGTnCf86lQdZFYdA6c
	 qMoH/OnASsfWU4tQasia5lbKC0Jx64DKb7G3COycLx5CoRxqhY/pd+kG3ln8zp05CXeP0
	 muRSKopOO+qQVenNLQqyQkiZTK0oNTF7bepU2yT1Ps+anosfHTT+kgXxOzG6aZugq8IHh
	 KIn7aw1Tse1vVCFw/0wPyc21eFgwkjORf/IyduPIFRbPW/EbOEP9MmkjSvyk1VPP9Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l4W7ehBvMPCBI0n1mDy1/8yluBi1nteYcIGECX5h9u4=;
	b=SjLie09U4lEaSATyM0bT2Kw8QYuVR3rScQN8L2x4oDTFWoGkbAKd2mmOg/QuvpBqRoVz
	 j9nDWlhJV5Up/8+gIZOQnZzpFpkP2bKbrusI/wtTEE8DghXb2QxrvVv7aKikQTHdIVAor
	 DdhD4FUyMoUQt4sX7Y2VLZ2Qxkcpn3ca7v1DoO0DQaYijO8yeNOcL0MCiny0OrLUok3fe
	 mdf23JlttvHVRkaHVTu6LKhaBiHibEtz4tT7kF4sj4q0ar9hcM942Ub4MRJMF/GDsNUOK
	 BaHrGKe0L8Y3BT9oRQ/Ar5nzd0y5cN+G8kgPjLJMnouPHjlIwrCPaKM1K7hEB0wCmRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0o+7ORB;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C500606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C500606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0o+7ORB
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso564114a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238742; x=1794843542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4W7ehBvMPCBI0n1mDy1/8yluBi1nteYcIGECX5h9u4=;
        b=r0o+7ORB7vMcbuwoWUHLXGDUYY3K0of8YAGx7Xb4s2TRpbEZBuJsClbxYDZfiQcR9W
         tKZ7dZMUSqrwFEkTSoa0bnbvAFwNuKb/9Q4I968ZRN9gELdlnMbh4isoWgxc6wQc5/tA
         PYWftT9deGHWCxTJPJNYG5zqLm0wGzbyycU6pam81mx+awUkRt2XDf+xyrJqdD2uYRJW
         M8ZlAXg8FxLLLU3Y+lTeun7a024KPDcbZ6Nm4d8JGGPA7nlwpb4cAcmlWtH5xwqFYHT+
         4aeL2M31Id0yMhE0FcG5uzQ5v1LFAycvYGBEsxN/9dqz1KCdNR9T9apSqSwSL1gtJOaF
         VkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238742; x=1794843542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4W7ehBvMPCBI0n1mDy1/8yluBi1nteYcIGECX5h9u4=;
        b=rSqCRIucPAh+t1u4pVDdvpRiu0bOvw6y+IiSv0OWWzCuCIxAiN7I5SaBzlX+fVDImP
         X94/xUvLqmvYZAYW4s8k6lcrQfo8F2+SrsOWRUvE3KH9VQjNHRUj4Q/3sfxk+S6RMZM0
         Fc2k491ZwXReIi7Nz1gUKP/OWrRsVW41lX3hYP6UKzqRm+8fDn1BJtTREuJMljuqVZiK
         pffUjpyU6nHD2073G9eQPup8Nns/zywG1/CXN6458hqekjVPBogTrXwzo2+E/aRpee1R
         FXiUGjAO6JHszQfOhOqQ6hhQPMI2WhRJ0GSX6g3YLOcsZp5iKx+yF6hs2f0TZjdc76mt
         cdYA==
X-Forwarded-Encrypted: i=1; AL+hErFKxHG33oebsT5juZhQqovMIcCv309ECSPvZz3/MTuhX2zcr1u1bdnA5KNNH07XCYBlj7c9SLqao9sjv+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z86VXSGYXANQRzT9BrWVjq3T9+VNLqWX+1MXE7PQw8yZFk7buj8
	z3lskrUu/adydstNoX/Qnm3WtPKWndgb1ocWDvoz2pd1d2RtfqKiFobR
X-Gm-Gg: AYBFou2Ep0p2XwC5FrRnPNeMiWbr9fLWp3mL0uIIN7WukviCGbIdPLF51RkEqek9V0Y
	L5Ndl0/5L0TBjwSYoL88+RIFVClLpG+vCueJz27i4oFwVF0zDXgRQc6oz9v8uT7D2FrbN6tFls2
	l8AcCJqC1rETvn/EHNCHGC+QXAdM6d3tu8oRyuw/u536qheZuT5aq/EYwXPRvkw8oxF9En7MK/R
	EFUgGCfB4iAAypxCUQStzsbrzIWQsBA8z8RHnurKv0hQkkwBtzE5NLkJ99P29oRMhGEeV3aH5AT
	PW67fCxEskMMDbak519DWrHnizvWJIB3eFnRdIx2WYY2TRnJz0oTr5IS8cnMtZXT9WzST4okYNr
	hhn13naSel+sG7JzAFH57S3Kx75TF4KmVd7zFsuKrZJKHEIgnYyxHUBrEArO5lhy5lF9ZN7bLee
	uXHgAVLKRswI154XRZz/yW1kQ0hPkGXOjfG4ijufO0RQgB+BQrtRIcQDeu/05Fk/xEnyImbxvon
	g3iQAO3fwhvmFiJvBtflkHWHckHO9koOWssuR2RCJkTiZbgs7wRwtGGP0u1a28M11HuHUDA1o0s
	vbf2mSJM68WXrBWCzCuzgAbXejKuFHRsSHjfvHyWhZPmVFGnFup9A1FYFnZsEXc2Q9vafE+1LDG
	UiKM=
X-Received: by 2002:a17:90b:1b10:b0:3b0:adba:45e9 with SMTP id 98e67ed59e1d1-3b12d41d8a9mr4389871a91.58.1794238742533;
        Mon, 09 Nov 2026 07:39:02 -0800 (PST)
Received: from 0.0.4.7.1.0.4.2.ip6.arpa ([2401:7400:c804:b668:b272:9904:c32b:2ee5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm11062029a91.0.2026.11.09.07.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:39:02 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Yifei Gao <gyf161023@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/5] memstick: ms_block: don't erase the old block of an unmapped LBA
Date: Mon,  9 Nov 2026 23:38:02 +0800
Message-ID: <20261109153832.7377-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109153510.7161-1-hjf3108@gmail.com>
References: <20261109153510.7161-1-hjf3108@gmail.com>
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

msb_update_block() checks for MS_BLOCK_INVALID before it sets the update
flag on the old block, but then erases the old block unconditionally. For
an LBA without a block, this tries to erase block 65535.

msb_erase_block() then calls msb_mark_block_unused() and sets the bit in
erased_blocks_bitmap with pba 65535, so used_blocks_bitmap,
free_block_count[] and erased_blocks_bitmap are accessed out of bounds.

UBSAN reported free_block_count[127] on the int[16] array.

Only erase the old block if there is one.

Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/memstick/core/ms_block.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index cd4ff1b79a6da..e373eaf92530f 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1149,8 +1149,10 @@ static int msb_update_block(struct msb_data *msb, u16 lba,
 		if (error)
 			goto out;
 
-		dbg_verbose("block update: erasing the old block");
-		msb_erase_block(msb, pba);
+		if (pba != MS_BLOCK_INVALID) {
+			dbg_verbose("block update: erasing the old block");
+			msb_erase_block(msb, pba);
+		}
 		msb->lba_to_pba_table[lba] = new_pba;
 		return 0;
 	}
-- 
2.56.0

