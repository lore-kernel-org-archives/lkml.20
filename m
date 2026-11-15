Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763804;
	b=XZVtCNw0ro/APi3Y+Q4St6YO0TfyQR7I2Rmgos56zvY+WpTDgrAHusYuZnNVLFWBKCDA
	 xF2jU81U2vRj187kIpcnULvdacjXeOLlY8934uiYrXZ8zx5ZbNhmzwO/jN4Q0d6OmSWgw
	 qRDrURJV2Oj8qckalV8zUMqM2KlaCSKxc2ery0LSh+aKsZ9h/5wUXTkRnxSCk7lfTbu76
	 Dh+yhL0cXaMK3sX7VE/7cFy4WV8KW3R8k0BYzMknFbN2zTqNbVWcgiVW8bMirSpTv+M+H
	 +dmiR5QmfByKJ2AU6IYNOm6WNScyYq1Rr1zjXmOMinBHJmbzxFmaylycK93Fl4Mc2UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=szgcaEhdSRPZIuPAcY7l9sBqu/oTESFGpiwwqKxq15Q=;
	b=GKgaeXxP4tqL5txS/C8gigKELuA3d0tMi/FqiLhDf0z9YQPc9q6F4TZzQOptdpQ0Mpns
	 lNtRHnLwtriCGX/8GVduKZQtYmNOsORN7D3jm7g6u+S6uBQ62k2v8ZWMdx8POImKpM6Hm
	 P66WwsnHnr3/wpN5/KMMwLLzqpwZotxfWISlMGpYi/4reTzDlNxBOXaLgy3wY+i/0S7iz
	 YhzoSTOkOuclFX3lqzUWM6GQWcaEmaQ0QMg0QsH+D1WXL+foVPy/3iDVzo3u2N032v2Jx
	 CqZsNS6O2QQq2VKIkHHO/fFzcG7OkWR7I7rP9HYzkugUQMmu4B4HbFachHa4RvHVy+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CdOuHLlA;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F94606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F94606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CdOuHLlA
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso30695565e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794763803; x=1795368603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szgcaEhdSRPZIuPAcY7l9sBqu/oTESFGpiwwqKxq15Q=;
        b=CdOuHLlAakazeGhkkf2UaaseAoVmuBV09Btvp9cCTQXz3QAEUjgPCPGjPEo5gsYu5H
         22hSfetLo8AtHFBhPAg0IUM1929l/PqnVEWM4I9i/07KGYAGi3jnQWoebZbTiripLdKV
         zIkQV0ifsKtNyEHeLyhkxGSDu1A4ZP467Dh1SnnL70xh7o7jqnfWysVOuzZlMsONQ2Cy
         sUwDaRA8WxDPMXAiDr60FAS5ZrTLDFfJuXWMHHgYB3gw+StFXGUoERXM6mbGMFIhJkeb
         VURkopOesP648kw9juO02jLew8fzVTliCgpkl5P1NsHZaL/dVIRlaiTtiY0qXcdk2Ssp
         r4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794763803; x=1795368603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szgcaEhdSRPZIuPAcY7l9sBqu/oTESFGpiwwqKxq15Q=;
        b=HMpVUTawnJkSglG3fJwx/rEpua+DIk/TSIhSA77ulm0+cn36MLLbdV0XeeAKGafCEs
         8ZBJLJMVHDSt/q0WuYRX41Y/upuWDDczHXimsPtlfW+QvUeVTwAmbe6B4ayqb+q6N3xn
         PjVnJkXq5pZLjcZkdwR/jiMhCfbPQ/SbnQ5MhFYXUqqQbMC/H5hv5nXfDsUGkf7baM1b
         4V8bbuowOcyO+P/VJhe29Pczr24ZibSm6XmCrGtNJNopa4dteoa9WUlaFzly/Ivu1qxi
         /OUoHt5s++8joGfgbnh61GGRzkZtB2ABmFESoso6a/PWvmo8fHkxZfRQiiw/x7GkoFo9
         iYeQ==
X-Forwarded-Encrypted: i=1; AL+hErEcKFpPpPSSi+4grFizM5vXz4bXU3eulz2snJaf5PxQ9seYP3zPGh501HAvTDHxmVHpmLHYO38Cf5Bh+NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f/GmQt3QbqEB5owHluVA2ERwpl4HBgVklmUOflaJyXylb7USo
	j+xykr2x2pVUkAOo4a4vYu1AfuV3vs8E9j4bOGi0cZCUYPqvo0dNkKAX
X-Gm-Gg: AYBFou377akNnpUEPhRIxTC3ut5V5zxPG0ppKDVnBc2UbraI2aRBogUIOK1NmPGDCmc
	BN70ZP5cAeaRNFrYImAkfw0J3HK66kG+3dk+INrcrjbJ6LpnSwvNZO3hm83szTiDM5PNB66PwTM
	Y7Tl7adDrXPQxtI8/cuDgeAhtveus8VU2gemIMur0FIzpLwLGc+/R7BJTaDs/uYzt3k4svVCcA1
	5q3viEDRCJnhKqTK6S9/PiyNcdUEe7PKaSmNBRUlbr56t28Ig2ZqF/1WzUxLxFpbN4gvey4oxym
	SA1a674fqT5d6Whh/Ze+HAfE2SkvAYolPLV3o2pbwRcDRqXR+Vdd/ChuU6u8jRRJbLWJNqwDDVv
	1JJWtc8tG1tD/biad74/Q9SGV3w+V2KQQVOp/WQMGEyl/8BLb8cHRTbp9xB+tiGlERv7GmhYAZV
	Odruys5PVG52+Lp4vLISbcNjtqQSBP5BNol3AIvpTerwVhX5V4ZCvwNxY9Bl6+UMB8sJmk9GrH5
	AqrXWTyuIt4+J0oDQ0oue5BzsTiK5t2VMLTxEz04gMtV0uipRnC1uv0iFihllhnTnUZFrOPfty5
	FJDxHKasEAdirRb5/76yqWkQPVL3qFbZ
X-Received: by 2002:a05:600c:8b23:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb6f6a1e5amr36800135e9.2.1794763802544;
        Sun, 15 Nov 2026 09:30:02 -0800 (PST)
Received: from LAPTOP-AVI.. ([147.234.100.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdccfsm236147315e9.8.2026.11.15.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:30:02 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: rafael@kernel.org
Cc: pavel@kernel.org,
	lenb@kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] PM: hibernate: Fix partial snapshot reads
Date: Sun, 15 Nov 2026 19:29:52 +0200
Message-ID: <20261115172951.35889-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

After a partial read, snapshot_read() passes the remaining page
length to simple_read_from_buffer(). The helper interprets this
length as the total buffer size and subtracts the offset again,
causing premature EOF while image data remains unread.

Pass PAGE_SIZE so the helper accounts for the offset only once.

Fixes: d3c1b24c50e8 ("PM / Hibernate: Snapshot cleanup")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/power/user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/power/user.c b/kernel/power/user.c
index 6e4f40e49319..d5e2b8d0b55b 100644
--- a/kernel/power/user.c
+++ b/kernel/power/user.c
@@ -154,7 +154,7 @@ static ssize_t snapshot_read(struct file *filp, char __user *buf,
 		if (res <= 0)
 			goto Unlock;
 	} else {
-		res = PAGE_SIZE - pg_offp;
+		res = PAGE_SIZE;
 	}
 
 	res = simple_read_from_buffer(buf, count, &pg_offp,

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

