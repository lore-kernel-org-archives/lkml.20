Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C42DB7BE
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788111231; cv=none; b=DfDMQlfpUAjydgfAlzTawa9x436j+GPrh2XUJdrhCCvH1Sd3Feq4/iXM2/GDzbZpXtLg2WIVZDbGjW8hvlbL9JgAqSKHi4CRrS/4y4Ac1DKWwbC6pSwwNSwHmQwGMgsdylanG88hUASO4pwXlBKKodPXKmxNIo1qnYADY54to+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788111231; c=relaxed/simple;
	bh=TByE+cFHkN88dDuBl+Ud78hUPGn9v39quj45oHZsxGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7Napf58uYnwCF+PkR+CaCzoExGwwPWRXwcKQnYpzlHSlc+LYL5QIMm4zt/c5GjOgGRyRd9g/vxzNOPQDRo3euxZD4F3puI4akSmQwFbZRGXP6d1YbkrhCJo+kyxosu2L6TMq0ZYbWZADrY4QWMyjnPEacPafsU1Et27geeryIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ol0dvHzo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ol0dvHzo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39675172593so2256139a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788111230; x=1788716030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIrgjdjScg7nld7Ey4Dlfd+00beZRs0A8XzyvdJn2jE=;
        b=Ol0dvHzoRwj1pvB5C2LcUi4x7GEAjaCvEm34b9hOFFrGIrDegCfFo6xanJa0VEgG7t
         4Q3pxvTca5IJOZrxTDP47/LQwL5cHHqugnKMLMqAZThkh6XR6XX05an+T+H68+trqT6H
         yEPyuIppjaSxTWvaGDq+Pna61+QQSJzHwy/clnFwlgJwSZf8SbRT1mwWoEGAIxrsgpQx
         Srzy1OQ9SwOloHKrCA/YCpQgBxMcdYyOhQ0q5dPc+a9oTc99+Ln0n9coAOoTdktEz4Uk
         36d3Rgz8qbjWayhK7ZQk3yYs9vOm3NHXoDsGacqRdQYRKTbrMrHuBPpPnd2arErDMwBF
         B7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788111230; x=1788716030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIrgjdjScg7nld7Ey4Dlfd+00beZRs0A8XzyvdJn2jE=;
        b=avIsE9GyWAQyHIvjAPU8uL4qMY+njyEKvfGN3lIQdWs9FeCat22SGQ4EFMHXaM7Lm7
         A1TEZE+K88eGPSA/h1uj7w8UjUDbsLswgTMlvtBTJKknZ90BR6TUJtoq3iIsuo56hVEj
         x8aHlslxQovaxsameDsBFeLtHFgWs2sR3lJSebFGtyVfgm3ZL09BcRtUJ2Tol+UIuQHK
         64D0vSux0KkOJGJmC6CsDuxsEcAQKR29vedZI+aug4Oxs+iFhyjR3Iu2/qTv1rns1u/M
         m4gEIAlXKAuIqIQLfz7KVIOdIhncCEjtOp/X+kg4REQ8EsSdsezl6vp5MiTPxr33DeHl
         0DKw==
X-Forwarded-Encrypted: i=1; AKwUvBwJphNdc8ILj/VzNptKoSPvghsF4RiFIluMDylpCH1by4K0BVuD9i5clpBxLuDmqf+UZ5ZeVAbk+b0Y9BY=@vger.kernel.org
X-Gm-Message-State: AFuF++nk5V8LG4BH6S6xwDFRFyLSxTbUHEwDM8QfFzhRIjlldPfqDafk
	AvFjSRUFXLhmpU6mnTsDLcUciDE2Tz6XVUnYZMMFjjISiWER1LjksSqXxFLCRtPY
X-Gm-Gg: AYBFou04kT9GSrAZ8uK2mZF+WuEDGEscO8H2/GpgBZnMsopkffGSE32sbnqhUawiYDm
	7fHZM0GuM1KFt+McLLVWsATsb+RVXh3+A1zpE4sDvJUQUB0JHv1gfDs4wbVVT8B8ARVOY1wM+Gc
	2ZPjqFOtIf+JE1swviQCV6ahvb5GgSMtoZU5vmWVs/pKZdgJhuFNlFkd/jU/nGOAS7CIePAR3QD
	0JwcG1LOP1ERSXTQLhYTsUawx5bBeLxNCWFvK+TkrtNYti8RmqrzenUA4sE3TsKvmVHA89k35IV
	I8uR2UkOUFnojdjfa2m7WvmjcMk3morWhpNXIQNolUGdhOqtqZjDLQczdofPY4ShGUCgY8+qynd
	v0UoBCLzI5w2fKLiDNpjDwAmoefIIJFJYAquJUET/Ooh74GJrR/cK2HMEizjegL1l8uxuygOPym
	bZHRi+pjTpEn726UGo4yL6qDhJPTadEmB7Tx8fF6iQQ02Ta6R2p70obHb4BbaAE9gu8y5oAA6Su
	l0lNr8HXyfWBr5Kta2OO3PFbtFYcnI=
X-Received: by 2002:a17:90b:4a90:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-396d0f8e9f9mr31394165a91.11.1788111229611;
        Sun, 30 Aug 2026 10:33:49 -0700 (PDT)
Received: from localhost.localdomain ([2407:4d00:6c05:13e8:a91f:d3ab:5c4:f6ed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186809dsm17237749a91.10.2026.08.30.10.33.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 10:33:49 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: pmladek@suse.com
Cc: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	joe.lawrence@redhat.com,
	live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harry Hsu <x90613@gmail.com>
Subject: [PATCH v3 0/3] livepatch: Fail object initialization on duplicate patched function
Date: Mon, 31 Aug 2026 01:33:05 +0800
Message-ID: <20260830173343.52759-1-x90613@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v3 of the patch failing object initialization when it patches
the same underlying function twice through two aliased symbols
(functions sharing one address) in the same object [1].

Per Miroslav's review, the changelog and title have been reworded to
avoid implying this is livepatch-specific validation: the check runs
during object initialization, which klp_module_coming() also triggers
for a module still being loaded.

Petr found that the error path in klp_init_object_loaded() -- taken
by this new check, among others -- leaves stale object state behind
on failure. His two patches (2/3, 3/3) fix that by routing all of
klp_init_object_loaded()'s error returns through proper cleanup, and
are included in this series since they touch the same code and would
otherwise conflict with patch 1/3.

[1] https://lore.kernel.org/all/20260823060734.58443-1-x90613@gmail.com/

Harry Hsu (1):
  livepatch: Fail object initialization on duplicate patched function

Petr Mladek (2):
  livepatch: Move code for updating livepatch object relocations
  livepatch: Clean up klp_init_object_loaded() when fails

 kernel/livepatch/core.c | 117 ++++++++++++++++++++++++----------------
 1 file changed, 71 insertions(+), 46 deletions(-)

-- 
2.43.0

