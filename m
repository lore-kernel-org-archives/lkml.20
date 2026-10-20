Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499453;
	b=cnJn3yST7uGlpBZaB9WkdY8sZec0x88D14Euz7yFDgQaSm6tK1h1zIPNbugsgf26Vws8
	 /zpmPmW9lOX9BopQnCmBypiIpvDvXZ9vY7grG2mg+6qAqKl1WuEZgeUbNB9yRr3dHGq7d
	 XWndNW2e9JkMPifF1hVGbhuuhcAmeBqqL9fcXFpHV9ExdGsnW792LyN+4RZTxXo8NH9HH
	 yYVweFfIGezvciS82EJdknOrYa/BdEuY2eomCYAc1haM6CmW+zGlJCFP4ONhdSF2txWg2
	 smYb98+wussfyWgCDJilYcBp+FIBpkyK+VcAaZNVYAH8FJPiEFG+SYaJYZuhgNh0JGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r7W1rJt9IDsmCTMPs7E6cwvO7KQhC7QspT2DHRypph4=;
	b=l0loHr9m2jnv3tB63KaFlmsMhpdOra4UemV9SJUJp2psz4KQCuY1nvC6lXTbenwjqwir
	 HmmBv42ZZYCKWfMOBw4YsPetbjHL4s9V2WUcGSCUNVJSiKFxVGh/BFmDU/MAWdpz0qR8Y
	 i5VVxxUc4ZlwSV5UaN0f93dRqd7QVTj+GQ/TKCd1mvck3uOTOMlbPkorB4pHicv2IYLRX
	 bK01oHIfcrazhU0wWtT4Gv0PA9qTl5rASVK2GE4+PmrPW49kOt7a348KzpwS68W8k8pdc
	 lt8KzLQZT1XIiUbTra1r4+GLltSuP7p73QduI/b0UTb5SIJ9vxWjwf/FmOrxk9c53Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MGbp4qZx;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE7606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CE7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MGbp4qZx
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad51132eeaso249126a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499453; x=1793104253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7W1rJt9IDsmCTMPs7E6cwvO7KQhC7QspT2DHRypph4=;
        b=MGbp4qZx4EIRTCRzrgZYAtC3H9I/XO6VBPTbo8pn9LEgZOZTyksmEy7aqBTwRyBF7C
         1naFXOUIl6s6tHJ/P5/Pd6/U3k6/2qlYFbCns7qRjf3neh8me0Uc1RXxwpfXMV/rH/y9
         xVJzdQZT6kaD/L3GNZOHcutF/ozurPybsN2HF1raYKixC1t3bRxhSxrebYup30NFqgiZ
         AGuY5qA0pCf96gWY7uh+gX/F4UWA7QjaZe8fYOPs8l0iFHvdhLCRnDOyiKVeH0Dn1Dk3
         mHjV8a2Krz69nXhInbWwG27e365r7T0KwgNLud2ERPkFXBMHj0VHVrtuv1K5cRrzOtAC
         cIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499453; x=1793104253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7W1rJt9IDsmCTMPs7E6cwvO7KQhC7QspT2DHRypph4=;
        b=PCieqiMx0Wmo3GxI45CA7R4BPWSOjdQMjx65x3TMwSdvsQQFmeOK7D7nnaWU6ISmJC
         h0a2pytz47pnygq6jFFDbR854h0ECJ43ObLu0NNaNtvVRlZdyjH/QLtDAHCvOBHVnpuc
         Mp0zyFOBnJS67t4DM/kjrs3Rc7ETLVa090bVCqcIhM9sNucGFZ3MHCfNMyVhjr688ro8
         /J8pyfDhbv8w0UnTouM3iG791PMnOY6TqpCfXAH/2IQOiGCS9vERA2AZi6qv1H0IjdUF
         qDNHdrKIwe41NbD/GjX0FOpsH7sVCzeWdXqb5HLM+jiezi/q+4RzCVdzXxHmyKy/Ebrv
         amyA==
X-Forwarded-Encrypted: i=1; AKwUvBxRmhD4bQnaIvrN/1gZH+DwOnGVRLTJlbEr6svnH4uVdHY4Kb/9qkeK71jeNkHp+EV6l3ZTOgPnQXnZmoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyAz68lD/tG77s6+5k2Iryp51/trMHLvq5G7sliCzXcnsaAvOr
	deur+f6bIinJae7XefTmkaeYvcnQwOpkDzII9SZF7Z/F3Wu1d0RWGj4X
X-Gm-Gg: AYBFou3n9kRbFuaeq/vmkWB3NdZilflQQop0KxoRHhnFLqDO1hXqHzS4ZzBSGu742Mn
	G9QE8P3/oZJIdSOYaH1a1ePArQdf5KN1t3OF/h0kNQoOdszjq+NSyI9YrFfgQWFfEX3N5mLO9rk
	ujdbSstpux3DC02EGKjwLrajPPhM7F8708/cTEAwkOLM5m8wU2/JzZJAXf1/r9i+gsY98xTW68y
	oGpivaL0jkKP/C2yEv2SiwnPul392K+bhLV/8G6GKYzeFd24ZhKGWHinJQzqK3suRox4qX4WP4W
	GdPynKeyQkcio0nNd2B2wbOFxScm+Koyf8PU5+3T1FUc5aYjo6/bhNmrbJ/ql6x6bkxmzPKpuhS
	v3ywn9ZvCCiOFXImoI0/7cdExX90u4B5Uuz4A8+ZOh7S1LTH8BlDzj1RbruPH/r7YpkwmYgBel4
	xbDhwR7akg2p7OhkGB4QvfrvJaO1CQv0exa2ihL6ul+ErylLiPcy/z2jmDsFcPl/KFda7JTgdDs
	rgvO/n+kgE8wI4Xr1KtCoikr5hp35g94jMtdRPUXtIcCqO2hFEb8RtEaa7Rn/JYAi/K14drUniQ
	8BsBaQ==
X-Received: by 2002:a17:90b:5111:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3acee29305emr15938113a91.1.1792499452686;
        Tue, 20 Oct 2026 05:30:52 -0700 (PDT)
Received: from mi-ThinkCentre-M760t.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm4783715a12.7.2026.10.20.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:30:46 -0700 (PDT)
From: Wenwu Hou <hwenwur@gmail.com>
To: hannes@cmpxchg.org,
	yosry@kernel.org,
	nphamcs@gmail.com
Cc: chengming.zhou@linux.dev,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wenwu Hou <hwenwur@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm: zswap: set zswap_ever_enabled when enabling zswap at runtime
Date: Tue, 20 Oct 2026 20:29:42 +0800
Message-ID: <20261020122942.3477541-1-hwenwur@gmail.com>
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

zswap can end up enabled without zswap_ever_enabled being set, which
leads to data corruption. With CONFIG_ZSWAP_DEFAULT_ON=n:

1. zswap_setup() fails to create the initial pool. Setup still counts
   as successful, but zswap_has_pool stays false.
2. The user writes a compressor name to
   /sys/module/zswap/parameters/compressor.
   zswap_compressor_param_set() creates a pool and sets
   zswap_has_pool = true, but never enables the zswap_ever_enabled
   static key.
3. The user runs "echo Y > /sys/module/zswap/parameters/enabled".
4. zswap_store() now stores pages in zswap, and swap_writeout() skips
   writing them to the swap device.
5. On swap-in, zswap_load() first checks zswap_never_enabled(). It
   returns true, so zswap_load() reports that the page is not in zswap.
   The page is then read from the swap device, which holds stale data.

Fix this by enabling zswap_ever_enabled in zswap_enabled_param_set()
before zswap_enabled becomes true.

Fixes: 2d4d2b1cfb85 ("mm: zswap: add zswap_never_enabled()")
Cc: stable@vger.kernel.org
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
---
 mm/zswap.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 37f34e406c8e3..d2b4c248baa67 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -629,12 +629,29 @@ static int zswap_enabled_param_set(const char *val,
 		if (zswap_setup())
 			break;
 		fallthrough;
-	case ZSWAP_INIT_SUCCEED:
-		if (!zswap_has_pool)
+	case ZSWAP_INIT_SUCCEED: {
+		bool enable;
+
+		if (!zswap_has_pool) {
 			pr_err("can't enable, no pool configured\n");
-		else
-			ret = param_set_bool(val, kp);
+			break;
+		}
+
+		/*
+		 * The initial pool may have been created later by the
+		 * compressor param rather than by zswap_setup(), in which
+		 * case zswap_ever_enabled is still off. Flip it before
+		 * zswap_enabled becomes visible to zswap_store(), otherwise
+		 * zswap_load() would skip stored entries and read stale data
+		 * from the backing swap device. param_set_bool() treats a
+		 * NULL value as true.
+		 */
+		if (!val || (!kstrtobool(val, &enable) && enable))
+			static_branch_enable(&zswap_ever_enabled);
+
+		ret = param_set_bool(val, kp);
 		break;
+	}
 	case ZSWAP_INIT_FAILED:
 		pr_err("can't enable, initialization failed\n");
 	}
-- 
2.43.0

