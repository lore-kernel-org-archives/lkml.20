Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB8535E1D5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127365; cv=none; b=ijnhkP8Cw8Sjlou5wE4z0IrarOLOGu564d7GQ299c3QL84eucXtU65taRQEp30bShczOORRDAZHKPpgyu90kZYmrZSy6lAL2xi1wIA5tAf1D2+AzCaElIR3aciv8be/TO8EzxNDe1xvfKVXgiFNaEQibvoaos+/ngT/soZs0T00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127365; c=relaxed/simple;
	bh=cdAjBeMlNMT+7+wm8ZCCKENLpx7+MxggMRqCiLWJKz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFdkbFtd1oyyxrfDIigV+XcM6hCdF5dLH61xokwqtQyDcqpfpyMiq7VCszFomjej0GN8VYqvUgSe7flZ4hr3BPRTsVY/GflvIPR2B8EsRtbYR/Y6Cfvz1bezWac32yyscELaLBbsblyKTnzO12DFnIzMVrf1NMSaq/7dc4uy+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdMzC1PS; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdMzC1PS"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so437812a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127364; x=1790732164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00Mu3E316L50R7aKcX+ERjAkcdHIZ0M1oyJeJ9Yl1So=;
        b=jdMzC1PS8B9faMukF4d1EIO9LIVfNA4cBScjtkkGpgN7urht8wR/okxwMVzfY8M8BT
         pT3JBaVZR1bZHzBJPZrNqFuyp4OGWgCQ7R0GWwjH/7BcgBfLeoiCegW3KrlcZcV4gaD0
         wo8hifytA5P7wSKIy8YPpqYCLkequ/6UkEcrEDEmTqdfcLaR4d5zfpZ5NU7KYe9xJEkr
         VEqU7vkTk9U1AP1hneV+lEQs/dsq/anwPI47CDKJGURbtOeEY7IQ2Q/z7pNwN5AYZxLZ
         eOLPNXZSip54T/ANMlJ0x08p0tU3tbxpqHg2ZdL3umr2CyGVm6k8+CLR37pxcIsIMN2H
         zKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127364; x=1790732164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00Mu3E316L50R7aKcX+ERjAkcdHIZ0M1oyJeJ9Yl1So=;
        b=eTzsRTitU4FlHXwSjtVaXEOdHIot4+if3cb6L/bfu0ivZoPDN5BXBX7NBj2PNtx6p5
         QJrKC9r5a5E53aW507HgQO5kVyRTP+GYOKvb6uW20pihVWejXM4az07SVF6VB5JoukCo
         taTxIP5TXkhD/KXQI5Wc/SOsw+do8Mjs00vi26sFK0beU9Eoq0VhEPfzh23MU5JnWmi4
         C/zq1Qf/9FSZqfNRU45tSCk7E3bD9BY4iTCmV7pQCAfx2+eQo0yBp1R17/HczFKOS4rb
         56WX2kXMdiGf3P66GJNl2T3QVjDbLvFNC3q1jt9Ukc3+LSYo3PWQbEJVGfEMV5HKHZoA
         WmcA==
X-Forwarded-Encrypted: i=1; AKwUvBy82YlTWCWL0AoRDXa8hfsCIvOoWS+LNxpDglXtQYP0II8e3bKp0B85574WyxBqibRN12jm1vzfo2S3nkk=@vger.kernel.org
X-Gm-Message-State: AFuF++ltixpSyv0uMcZfmEP+CQhy78srBQzYRDEiOeoszfv9rXiyQere
	jPre9ToCOGNiYiWOGhMGbumds4cUgeVi4j74FAmSKcG4MkaT/Zsgd1IG
X-Gm-Gg: AYBFou2gfcDvZiRX1gpJBdj+O9tZh4FzvYjizNdoez4D6zfndNAPLGTMZzHzwqlpKRT
	XvMT7EwFW3M9txu9bKikhQah176cco1huQULngXyeqEVj/wpL6UeAD6BU0koZoXmcxYCKqrxOGA
	26gcXE2PCizREKX7GmyNs1BacMM5OyJKfzqpYv8xL9M2irCCM96YOrh/4shRvvXLD0/fduyBHOI
	tmCpp/wV/jj3E0DhyKxxhnBcfTa/gAYzRMVdDd3Ud+3kkqEgrD2gRu2PKWtUGPFqRe4QmYHK0GM
	4iNP/Gq8pu0GerGF8phzu3Lbch/J8N0X81kqX/VZJOmGWTmUry2VW2XSknRtdTImm7HMyIqMycQ
	3JeGPPyLaz2O7xkkE33FrbnBFx58dHw1vr7oaG37XXBvS5FDKWYBUZI86/hlZY6koFVvkoerE/o
	Sly/Qg2/zA65FSinLWJE5kJ606qoHgS8XTgi+rHjxJuC5nRsFsWNlOYXRjZhBbjuR2
X-Received: by 2002:a05:6a20:7faa:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3ddf7e93850mr1125740637.2.1790127363814;
        Tue, 22 Sep 2026 18:36:03 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm487569b3a.6.2026.09.22.18.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:36:03 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unused variable 'tmp' in sw_i2c_wait
Date: Wed, 23 Sep 2026 03:35:26 +0200
Message-ID: <20260923013526.12225-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'tmp' in sw_i2c_wait() is written but never read outside
the loop, triggering a set-but-not-used warning with W=1. The loop
itself is a fixed-count busy-wait with no side effects; remove the
unused variable and keep the empty loop body.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00ec4c..55623ad35be2 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -92,12 +92,10 @@ static void sw_i2c_wait(void)
      * it's more reliable than counter loop ..
      * write 0x61 to 0x3ce and read from 0x3cf
      */
-	int i, tmp;
+	int i;
 
-	for (i = 0; i < 600; i++) {
-		tmp = i;
-		tmp += i;
-	}
+	for (i = 0; i < 600; i++)
+		;
 }
 
 /*
-- 
2.55.0

