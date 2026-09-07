Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E74395AC0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762376; cv=none; b=L5a9WbIUJduFB7hRx8oSiS4/OhhbMJdHgR73lhXiFYnUenaee5pRV7/9KRCMNK34IMG60JqNQuu4B+++HPhNcNH9rGZtH7+z6OVDJ6VaARBvweyn2ohCy9C1+ybzezQDf4DNfBgOCo0G5vjFt/kvNqeBHQ48XxnxI+jJMvBmHbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762376; c=relaxed/simple;
	bh=ytaOgPiD27NmO0p/hdzmEK5TXPSV7EgzssfUs4MDXBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cmp0SZYYXtBjE741oHc3fRbGKOeu2atMqrbceK+iPqBSA2lY0U7DTumTNPeHgI6Ls4XY59aqKt0lpmWvNxl4+k7qX3OcDlULy/eKUmgrMr611ju34ipCEXc7gi5d5ATLo06Gf034QtuXwp575PwI67Ob8NA21rs5dorTczysvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLFXwa+T; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLFXwa+T"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so2545310a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762373; x=1789367173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=02lq+eXcDw6s0xPfNQzAdvi3Q6KYZBjnBNOuKbpzIQE=;
        b=oLFXwa+TCQ8s0ApW4KClE/BUvwo8Cjtw2++6wskABH4IheceP0S4ng1JtO3FT6KM5m
         1UhMFbcjne7meBTil+g/BJY2ec+ehhYpBntp9WqtBN1C1ndPj3mQsA2+FVPwyiYjuanh
         70zKS16qD9puTEYcPtNqzeqi1AgWPaMyTp3JSG+buuPUs8OxOSFTe9KwbIr1h8vk8jNS
         XgwNfGbTzQqwB58CqDkzI2Wbd6Tot9Zi3+lJIgYxsVi/CfxHzQ8ngnU8WdC/l5kmwvQL
         e8FfdnHG7FtPzTBGie2mJ3wBUtUvrRugyabd1Q5xx1i3119t9u+CW2BKofY97mZuBrn1
         rJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762373; x=1789367173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02lq+eXcDw6s0xPfNQzAdvi3Q6KYZBjnBNOuKbpzIQE=;
        b=aExIIWQvKKlHauqG57RWRtiWZCgrsBLh6X/J09G6cVoUjiWiSeiPfmguyFsKoOx83U
         G7JZYUJrwH5CzG8g67I4DjBL13a3Lq4Nuwx1iO/nh+3PJOWPWQ4ECesglvFjnrNXdoJR
         wHoKukqzi6AcZaeF+3RaRFyimHcB4xb/zmsOALw53bdEzqvGQhkWxHUI6XhiF0P/SU5Q
         AYulxHKmeZ2UZPtiSanh1xAEEjhG4itdYxxqdf+1kCgeMgepN8FL8p6m5nesJhJlR4Qu
         HSPTKryk+88ebfADSE3RNGmhNrgI5+6BLY1paRgUpdB9YKVUoL5DU91KCfn1AqTurIdV
         Oagg==
X-Gm-Message-State: AFuF++lL6aIWjWdKewI/UBkXVCikMsE8KUbydDkiSG2BHHHZsszP6Qgj
	MMsJ6wR2Onb7HsmmFDML7z0h7UyzhTANYT91KAmKA/fNU2APXtMVzJa/
X-Gm-Gg: AYBFou1q44EwTul20u6xr/+X0/Oq8dOf3TvTkaZD7m04R18/b8/lsNBYE707nqlO+JJ
	rEpayC4qR5TSFpToRpD+YPwngbVVqxUsDHmN0itH/XlpZ2CKSvCSUx9JI/10QVZyrc1ejeEC/HT
	zqgHzLFeb5fOIxBUyc74l+1DguTXkyds4aEMF9dNeJvchIa0VvMXrfXvfESWu/sTkGI800dSoRr
	mHWN4HGrRUF0GymKsmW6wgrI0i1lEl5KH76py/Z4rHJnwQZBm6mANGIy0cvVoYHaJOg/0BnsHXP
	McsmE7cqlgUySiisQHOcZTMvYbyggG92r/TWomxhm93c+Ta0qbSj4yUbaOyoCn5xgBzceQnq3rz
	V0zb8+du9KIfvkpgMoQIC1Gfeqq5iqo78URwOyCV/3M9BkOOQhJ/XGrwsjNczCM1jyH/Q47pB0H
	k3y1y3MoI1RkzoiF5uq3J39pVhzuXCZvzqnATvXWoq08p30S0/6NFvUqIEKEpHol+DcoIj8mTpR
	MEDhR/Pi9BUXU67liKn4p0L
X-Received: by 2002:a05:6a21:9103:b0:3d3:ae40:51e6 with SMTP id adf61e73a8af0-3da3a104fefmr31944175637.26.1788762373444;
        Sun, 06 Sep 2026 23:26:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24354228eec.22.2026.09.06.23.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:26:13 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] tracing: fix typo "availabe" in comment
Date: Mon,  7 Sep 2026 11:56:08 +0530
Message-ID: <20260907062608.13924-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "availabe" to "available", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/trace/rethook.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
index 5a8bdf88999a..87a27f3aa4a6 100644
--- a/kernel/trace/rethook.c
+++ b/kernel/trace/rethook.c
@@ -171,7 +171,7 @@ struct rethook_node *rethook_try_get(struct rethook *rh)
 	 * This expects the caller will set up a rethook on a function entry.
 	 * When the function returns, the rethook will eventually be reclaimed
 	 * or released in the rethook_recycle() with call_rcu().
-	 * This means the caller must be run in the RCU-availabe context.
+	 * This means the caller must be run in the RCU-available context.
 	 */
 	if (unlikely(!rcu_is_watching()))
 		return NULL;
-- 
2.48.1

