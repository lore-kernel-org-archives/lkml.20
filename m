Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177937B022
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756933; cv=none; b=CFhG6ToTjXYMGuI5f/xe9i4iK6RJN2y6HC+XtBhiCIi7O/HalyjeZkype2pXN9hkViCC6FdESPZoOFwR4ppiZc48IeuKQDA6DcU4JYFSq3D2k//gV1lJXDey21HeFkyF3g0wyowY8u97fPjBy+mZgEdELNHL+y5J0vWylLl7C5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756933; c=relaxed/simple;
	bh=ucrjeC2hRJEEIZ6EHIccUwGf0DU4vAKej/No8MYuwHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z70Ey6aFb7RFs+SGbIMmrukcD2wv2ZzCj0ZpSL0JHyWDwKDLL2AoCYBlcOiDkjFRlO95WLTu0ht895E4Gs9ypW+SDmu20LlR3fTr/z+GttycfQ9nMten616c3SznKbaTrJHnBpTPTgzHBVSbcSx6gvnAIX7Lc9vLGvGKBJ/RCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAWxj3yT; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAWxj3yT"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2812511a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756932; x=1789361732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5jhlbEZ3qh8vQURGYIzWDz29UaYaWgBqWg0Y2URfxQ=;
        b=IAWxj3yTG1xNrF5i8Ic70+DymUr4b7wQgJteK+G0f8eJTQOBshC7YNFN34eNhN8v8x
         9EIOS+p/V663NSYwP+UW0bQmwZaBrFhjScXjsCU5lzB+lgNlE2e953f30njMXQmc08ZG
         Oqmww5IdQEXc0Qf3Wvgau/X23otQEXXmgDY4pPIKc5NR/F0z8NWZAwOACvnTpPPAoPJc
         Fv/7g1ZrAGybxWuzVf4Dzob7WdHUkMOqG41onRi6cUn3PQXDewwKBzxEkBSjKTkCBIGe
         w+mTR4ITJUBQSoLTsNBEgHx1m0NgX8dgCJdmVpcZGua+YCbNh+mZDQCbfWoHzbjO/A6L
         3a2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756932; x=1789361732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5jhlbEZ3qh8vQURGYIzWDz29UaYaWgBqWg0Y2URfxQ=;
        b=S37z18RbfEYKFog9QSC8D4Gesv9vvDaMCwk0qBXMKsn1hi54igLoeEl85jWRXXmbJF
         tsFmhs9IcrFV9+hx/iJ1yfy1PSGigtrCmMt7ZrZOvsgWWxVWwIhdm6dB+g3DlbrUZ6qY
         90oCtz7qwvEopzOnvDiYS5pYjmMRIPHs5dF69rWvNtkeZOFyjONreWVBJNtIyo+mlRNF
         swdaFsXBOeAw5XDohagKvbNqNpSClGKYTjRpSB55v+AstXvzWDVfQ4IiJc9dG152lUSV
         w5N30wsfoSc46ef7Jev6TbX46LKrfWvf318SzBBkxKSWZr08cunus8GfQcIkbQmSrorV
         9igQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjh18T4/wPd8wf7b78JbDk0eT5I6XInZlg0lWnvM2RCuYSaqY4G1IYfZ7AnuDKBRCUH1vFvREO+2Kp21g=@vger.kernel.org
X-Gm-Message-State: AFuF++kwhJa9OCiPY8qpiuSEc5yBtbBDtd8KeKCs7XuGGSESyhmrxFLY
	l9mvJ3Ux505/mW1XHPqnaI4M52m9CuyVqvOoFD8qt8qSgLtYsTX4xbKa7iJp0AnAV0w=
X-Gm-Gg: AYBFou3U96Ud9+UirbzNR9e3q1lT8PvZ5nTbMHkLQ4k7VIDR+h6Cxd2DfoBS5LXR3F5
	5n12Qfhf2KWlVI+gM2H8TkRur4Vftsb+kKyGUxiO7eADjd/b53Mb0AfNlQYxqJS89HCWzSSYZZX
	tYaFaKpGhxU7YVSarMrX8iiOeGgScSDm4kCm+tUvjPtIr1rDPBBc32CddAxRu/Sr/3x9Bl28voe
	zN2QFiaTYdecoH6HnD9RFZnAeRU3mPC+gg8zx6l+a3l0EuYF0tWSw8S3+LMS6Nz7I24QumRhbPP
	Yv4kTxoYfR4NHUHnjOuZNfQgBcsHPYHCeMlcHEaaxBTpvhM9kyx6y9TX/DyhVsuces0FUcQPBPG
	FQPerLu2pNQ9X/ibWdDqUNXfOomX2/vPQCE+RZ9qONISxkGJ6iD5lcRowohB7ikaAxhKEKL6pCu
	f6ihp2reetLtUwRYPT/bIRHX+YrV5DyMJJDYDiVdLPGl8xvh+o4U6+k4SquXqUzZI9dSZHZmEFa
	uQ6lvVSRp0HNw==
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr32156369a91.15.1788756931715;
        Sun, 06 Sep 2026 21:55:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm22006422c88.14.2026.09.06.21.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:55:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: ab8500: Fix typo "interupts" in comment
Date: Mon,  7 Sep 2026 10:25:26 +0530
Message-ID: <20260907045526.18873-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/ab8500-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..ceea1ae34dd8 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -125,7 +125,7 @@ static u8 turn_on_stat_set;
 
 /*
  * Map interrupt numbers to the LATCH and MASK register offsets, Interrupt
- * numbers are indexed into this array with (num / 8). The interupts are
+ * numbers are indexed into this array with (num / 8). The interrupts are
  * defined in linux/mfd/ab8500.h
  *
  * This is one off from the register names, i.e. AB8500_IT_MASK1_REG is at
