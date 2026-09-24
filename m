Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE093A9615
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248754; cv=none; b=gyWHvKywToJo/4uqgB0KhfS4uFedARO1TUuWfrW+qrjMrlkvxB9v07Xdl++JR7oqdT5Gu+H9LEVvrWIShob9zdw0kyMqQIsQCDpcu8NMXj7KuYiBbfxwv7BWghm4F0p/fpxs9l+MKskTtMtWxWmnqdL2Iv0o32xeHBINUG5QWqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248754; c=relaxed/simple;
	bh=C+ScBriWGoEl0XwGmvaCbB2BXiOvlk6aDCMb0cBOw1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tvqlm2qWokuA5Rx7d3gAwBB/RQU4K5wGccep2plCny5jXQCZaYZg6uPiTyJzUym0Jwyzz03rMRaXtLReQBJO3tIgoPWORU7eZfBTm1yciL9D8MkbCVBAaZA+5qjyS5RG3iERhyfHNaz9L2x4AcfGaRXKcQPFV/4q3Gllvn2Pa70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=vbDzb0Y6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="vbDzb0Y6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so3818525ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790248752; x=1790853552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwJHDWyJoZK+JbHCcj0VJjr2MaNEet26f54ykPfe9Ug=;
        b=vbDzb0Y6z5JwFzj2bTBicR5Gk/DKlcUNouAjfY4PguMRfn662aOMUMqNf+zQis51uQ
         ePQBzPYrqsfQvezHO0HensM/DJ8unGEsD4/GTBN+IiNegrWg4SD5MgGzDyCWJ+WT2Cjp
         TQZk2yqMgFtlgVjewt0IP8c7CLMmKpllBF2fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248752; x=1790853552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwJHDWyJoZK+JbHCcj0VJjr2MaNEet26f54ykPfe9Ug=;
        b=vlqagmcJBY4gT2NMDLl7DDe649Qn+/ZVHANLH0I0LrqgwLlnmFTyLjnkdvbEc7joKA
         684m4CX1OJWPIK8yS3VwAHgv+6QbJZzt44aTIEpBQzKdCebXNIGP+ZXeyAIXVhdrTx0Y
         iy5fMokZwhsvWWe0yITwWAgG86zmtmoYKjwSgGqgGH0eIZ2L1TK9mPMmZoaH0W8v+fNk
         rDvuPX/S0rnH7BnDTvLpCSxcp6BZKD/Yd+WB2DEPw/evul9x64yHq06F6q8S+Eq4TtXm
         xqEgk4ofY13iMtbvKqd9Va90ZQhi3ip5TbBS7mmLJWernrS+YHE1w7RrhjDPhr4FjCmz
         udvg==
X-Gm-Message-State: AFuF++nwnd/wzzPssp3TAbMeRHP4mmS18AOG6NfMgF8V/H2Zof+QO+RR
	jeWnMFtKjkEBu2mIPWDMzrdpMlV7WTVY3ganmAg56ibOtIpmopw6tteqBm4QyZd/sWs=
X-Gm-Gg: AYBFou1jHT469V5m8rDK50x113+gkyjR2XywT0EJbkaIBAXdC5vJzQbfoB7EftRtPa/
	c2fTUYcZf8sLpRdRXKlriCJJGMn3I8Id/v1OA+Fky4ZpOl6HouPa60/NWZGNjIY2rSHqCRnB2hR
	QxNNVF7XUpCIFSsSTxMMhwlQW/6KHxBlbUzjvKRcEfYEnnropwJykc7IRXFBXhzLdCCzIPgrI/6
	myf/V+ty+58f+Wn5yaY1LHQM9ebbHURT1WsA5/KFNZFwIEqd1IOSrL1UsOzZ45aSwZtlnX/GkMP
	ia8vr9F95jDExhWoDlFXIbBUcN137bT/sB0EkZd9fFlK3HOaeIOGbPPwXNlf6mHZf5NpCJ9Q3h5
	3QgcUjOorDcdR0pUTSmlNJ1MthX0B8ltt6HCkkGyxEZV250d1p4Lc8g0agKgAuRy7WlbuFqjAkt
	x13O+Khd4uqkD6tUgQMuLRWuna+VscSoPkzCz835FV+VEwEuaQMi38iQEKxV3bHCm5famdcnqm9
	wrrXCaAJpVvMi7gvYEmNfHzD5W9TaCCJerw/DU=
X-Received: by 2002:a17:902:f683:b0:2df:34c0:7300 with SMTP id d9443c01a7336-2df7e29e0f7mr12516735ad.37.1790248751832;
        Thu, 24 Sep 2026 04:19:11 -0700 (PDT)
Received: from shiro (p1935159-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.129.99.159])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2df6a5c18c1sm24683465ad.36.2026.09.24.04.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:19:11 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: sammy@sammy.net,
	geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/2] m68k: sun3: add an early boot console over the PROM
Date: Thu, 24 Sep 2026 20:18:51 +0900
Message-ID: <20260924111851.3501100-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924111851.3501100-1-daniel@0x0f.com>
References: <20260924111851.3501100-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register a CON_BOOT console that writes through the resident PROM's
polled character output (prom_putchar()).

Assisted-by: Claude:claude-fable-5.1
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/sun3/config.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index cb4e19b95a1b..49821c28a641 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -145,11 +145,33 @@ static void __init sun3_bootmem_alloc(unsigned long memory_start,
 	m68k_setup_node(0);
 }
 
+/* Early boot console over the resident PROM's polled character output. */
+static void sun3_early_console_write(struct console *con, const char *s,
+				     unsigned int n)
+{
+	while (n-- > 0) {
+		if (*s == '\n')
+			prom_putchar('\r');
+		prom_putchar(*s++);
+	}
+}
+
+static struct console sun3_early_console = {
+	.name  = "sun3prom",
+	.write = sun3_early_console_write,
+	.flags = CON_PRINTBUFFER | CON_BOOT,
+	.index = -1,
+};
 
 void __init config_sun3(void)
 {
 	unsigned long memory_start, memory_end;
 
+	if (!sun3_early_console.data) {
+		sun3_early_console.data = &sun3_early_console;
+		register_console(&sun3_early_console);
+	}
+
 	pr_info("ARCH: SUN3\n");
 	idprom_init();
 
-- 
2.55.0

