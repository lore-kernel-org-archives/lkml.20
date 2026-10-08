Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E57342CB3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469659; cv=none; b=EGXznKFp5hDGwJxksyP4Xodq5k0g4My/VfAEhq+2IuFVstOQwU00viHUb6Qtj4wU2oDhOK8b1VR7ovsoLssFznJRFRXkE7aaOKV+QshE02f/xuZV/bPjSDGdhJYY22AnddF+YOeoxzI+chp/BgXYbFZbPbi3Zk+BHCNz731dYOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469659; c=relaxed/simple;
	bh=o7kDUy7ifRwVuBB/aVT8S+5DoYKMzZEbXLg6+PuzSWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ouAx7VsDmkb1ZbIugEMac7L4tlstET5b+s/G9Own4HjtWNXEJRnw60NBjORFByJwo6k9bsgxeOUmmFmFP4LBua+3NdWDGHP/BHmD1tWek1vDRaPEfiCvHCSAbLtklTw8mf7t9vjwCFRnYog9HSyqXkUR/xvfbK/suMoDcN+zUpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSZXzM0f; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSZXzM0f"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso54157115e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469657; x=1792074457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1YqcyVpnEV64UcHAyoY2EuKOz6TzXsl4r9+TaXC3HD8=;
        b=GSZXzM0fxMEcZimZxKB/3BpC2qWtuD/6ASc7JGNpZ6uVE8Sg2UhYLrag4ea6wDEFls
         AiN0vqyaMHeb9buO7R8ikCvPn8Ae1Zn3f3Bp2KtaoFXSv5T+9jwapw/ygAtHl7ntUXlR
         EM7KTZX8IUVfv1NI2P/S2L8iMK9hPaPD5O7PHYO2uccUbsjE3wL1SN3VaI0U1FH977I2
         PlnkOjr0yIdEXSQK4U8zEnY0GwliNe9YvTS/5rlGjuPAi77ULh6MqPJj2M8uO1ple581
         OKUDxzC5dCGDJhThHlFOW0aNtjj1Cer+rQ9Y4aQgDghPAwppc34xgp726G7wb5YDISMZ
         K+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469657; x=1792074457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1YqcyVpnEV64UcHAyoY2EuKOz6TzXsl4r9+TaXC3HD8=;
        b=nuOZoNwfBZYlU7nz4QUEw3C53KxvsraSrvNHr5ubYmwj/IvcmMTUx7cNosJkysoD4b
         Q0NapDBu2ttnH7X2W9pAM4oZJzWRQ3GMrdA16Mmi+Hx0QDKlKom30CNKLLCyswUR3FHx
         C23r8C5bEB1Im0hNnY5g9opQrmRGdGkiNql7RZPKH/5MaeRthJD9ohmGc9qS9nsNG/54
         g0kLKuIZ1EPNV2ssE8MxmpDOfC6vm6P2/J8GdrDazbXc9EZsKZmtXkWfh/0JHkCbQqvp
         kAWKiOaqULzYBkhCBSGcrk7UcZZaYyvuZO7FzRwn/EFujo1fZAzZmR4A7OmvbzBtlhJ0
         j+ng==
X-Forwarded-Encrypted: i=1; AKwUvBxy3CE9707cfupRM8BE6OoQDDPOYurdhMkZb2suH1i5Tlvp3d7E5zwHt/skg3lSmIt7+aFjCYagH2xvqpc=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ+O4LX2DavW/mkDip6Y8t//R2/vMDqn7A3+rq5QEo1xzVYNWH
	JkHVDxjtkTADuHmWgpX+mobuY7ftDhttNbW5PBTwLP28XaM2m0vn5Dum
X-Gm-Gg: AYBFou1BZrHEq8efygeZ5EqK5QaDS0vDnDYbFp1bOcFRaN3WiUdUdYStJsxeboSCMVI
	tb6+ZQkD6Sm+nTe9mNm6YwPn6f5QenDTSLTprhjpcseBo90+INnPp34j2+IiCB6Vybu3RXHcO8d
	oMqJDUK+5cE6ZXt03UBimUO0GdSDeF6YrLOmHGSNxmPxAc/SnDbyFK+89Y8VO27GBT0CJGMbHPh
	+SLFcsE399t4JQQxUuQm/2uzCz8fyPZRgO0EQtBQLindcP+KIjbYcsRrFYn9Tso+IqfnPIjpWOq
	LDEGLX343E7wN/8T3iO9+IwUneM0jF56LQxLzwqMOEU/OqSNjcdHOBmcIudv9aOUgcElNoIw8Mc
	AyBzIR2v+qJ+6241Z/TG48vFPqFSdESPMVRJlwvhNBDokeNrA/a1Ga2dP4hiw4POoF6oGRyFRNy
	PUEFPFb7HMU5KlAnDe+dCMhrpRLqHPPhbjV1QPFEkId7ey9YvcTxNvnbMvo/SNRhAW36EpyB5eA
	bNLDNqXCnQCAStP3izwBlc=
X-Received: by 2002:a05:600c:474c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-4a18044dd41mr98405585e9.17.1791469656515;
        Thu, 08 Oct 2026 07:27:36 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17fc664d5sm68997305e9.0.2026.10.08.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:36 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/27] selftests/landlock: Fix the snprintf() error check in matches_log_fs_extra()
Date: Thu,  8 Oct 2026 16:25:49 +0200
Message-ID: <20261008142604.39107-22-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By storing the snprintf result in a size_t, the chunk_len < 0 check
could never be true.  Store it in an int instead, matching the return
type of snprintf().

Fixes: 316d06b01130 ("selftests/landlock: Add audit tests for filesystem")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 9abc2adef79d..90f63af1d64d 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7453,7 +7453,7 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 				     (extra ? strlen(extra) : 0) + 1;
 	char log_match[log_match_remaining];
 	char *log_match_cursor = log_match;
-	size_t chunk_len;
+	int chunk_len;
 	ssize_t escaped_len;
 
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,
-- 
2.56.0

