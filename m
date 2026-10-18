Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E938AC68
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792294363; cv=none; b=fjySLmcgyZPTfV6elwx5dJi2UyQGnKU7jPjFCIaXdoWfOZs+zJu8NT60yofkvfgYcyltZErIqp19ABbv6qm2/J9r9cpAHRoOz1kORrRg8ErWMAxNceDvf8Ywm9YKFfPfdlAq2YV+P97juuB6nq2xn+4FXL6FgrCDVBxTuxOnLtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792294363; c=relaxed/simple;
	bh=UvTEXTqw1lVFneCi4baLXWwmAJ0n7GhdLElXFhLHYX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RG+0+zhh+Yh9PLGQZJFz2wfACmh7u/GczIYZmN1Y4OA60G7H7RwTb97HfbeC9H4DT0Tr+7+6wV4EZS9Gcmg+IqvMU3V40mrNMlvIJDOizKwvdfyer1izj5pi7NB0aaOAFzCn8UBAuGJ4DdPGMLcXdlqCvp1wnDSE1x6YmweDwxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxYEW5J/; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxYEW5J/"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35f036b17easo1910794eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792294362; x=1792899162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9jsrD/kdtezFUO00VsW4JeI4Jo/i5FLlkQ/PljGjWE=;
        b=KxYEW5J/3kBw4o71EOTrzD4pz2KWlycMUXwHiDuZbjqGJyVcIwzYVGDZcpkKT0qnsM
         QNE9xfhwL9+akeqWR7qJdnlEJ4ODrxaBcZIig+ZbSu6VE6FvEBd/g9um88Ylb0nbkh1v
         tZ1ZZmAJp5SpjXL56HeBK+Y8HxsrZZnn9T3i5snCxmUeQnTtd62f70gcB50EDUxZ/981
         dT41GUMPdinKhgrwfksFIUulnRu9OmDLp7jrgnPTEz9HBL78m5RCctHsunjFa/sRpNuN
         7oPHRG6C8eVI6MiYQfEzU9VdrLbJ0B3wSAmedJmecEiqZbMqvMi4PlZYmPOwRnmpuRym
         Sfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792294362; x=1792899162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9jsrD/kdtezFUO00VsW4JeI4Jo/i5FLlkQ/PljGjWE=;
        b=YnavAW2tBP9iJ4byCXDvd5xwupke+JxvLjAOaoYUS74vzOlzfjcaGdMk2zfqLSP97u
         cpI+31XIKIOBM9yqaCnAK9Gymr6s7L7VyIFi7/SDfAlhInwyYELqz6WVwvFbeSiLgbyU
         R+po+C+Tjqbr1giQk7yiOpR8f97nCXY5djkU6msGzjZacIURLmUQTpWsmF/boQalZB41
         RYeUkZ6j4hg2DEAtvjGRX1j5bnvSSlj2eCHJRyB7m3tabgse7epweW0O1ic8uOD1bETC
         4au+X7E6Xq2Qb9lOnYftfNxK7RSt7vE4T5gMkP9jJ2vJ2SnyHSinQsiedE1Mm0cbSJcu
         RuYg==
X-Forwarded-Encrypted: i=1; AKwUvBwETLZn/y7uVLeEPwUivFyN0RETadCPoIhs8LAmQNUzDN3UjGILAXPUWC23RIDQCorvbgmIDvixqyX/I/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS+rElH9BE5CU7RWOHdBsbypJ1JqnRtxxdNS9LUkhCpdZ8pqXA
	Ra3ZLlaB4WRzFJu1XP6o5MJcpAYgq9E+OR06O3RjXD45VvCQC9z7DKtXS0zR+spVrrbcLw==
X-Gm-Gg: AYBFou2bCSWWiAsrIj0hmwCDmi2QfAKoRIkSTVvMTVp64IEAgvJh4xzoIKVnwpbaFt0
	n+HGN2wD/widZAEouGHT87ir5yvcoW4I+u9zuQs70wdbACzuvoNhkLfwVU89iiCJhXv+Jd3KgTe
	F91lxwVmby93FEIUNT0dHdJHKoNhDcnSuygR3I4G9KgkJN/VL388bGvPHTXW3ipWBLe9jVcQzfr
	o+IFYhayKSOjke5erK5ONgeHkFia56unNa7TEjhxxDxY1+ndXET1PbeAiRM8OcYlE+qqh3dskDH
	A+oOF8bfG2Urs/eA98Zv7VlXTedCFLFwYeUjfkMDdCLGN/zEvcqnhO2rS4W2KhzACD0i+wCVzWP
	EKlEaFD/PpHJAqu1XblkLMK5U3qxF+4dpiUZ46b+cNxfkiw8vYY5Xe0uPmkvX6oNB6Hqh3E92oC
	Sx3tqywN3KS9w8GDAAowX1o9ET1/Mmexdtfp2cNOwnUgL07312Yzcn2LggqMjUWe8cVfP6MBa0V
	kSAKfy2fwlLhOIPovUWBcc=
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr5915279eec.0.1792294361434;
        Sat, 17 Oct 2026 20:32:41 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.87.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm22261572eec.0.2026.10.17.20.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:32:41 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Guo <guojy.bj@gmail.com>,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH v1] staging: rtl8723bs: remove empty if branch in halbtc8723b1ant_RunSwCoexistMechanism
Date: Sun, 18 Oct 2026 03:31:43 +0000
Message-ID: <20261018033144.865-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In halbtc8723b1ant_RunSwCoexistMechanism(), the if branch checking
halbtc8723b1ant_IsCommonAction() is empty, leaving the assignment to
preAlgorithm in the else branch. This triggers a checkpatch warning
about unnecessary braces for single-statement blocks.

Invert the condition and eliminate the empty if branch and braces,
simplifying the logic and resolving the checkpatch warning.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 0613beaa37..dfe921033f 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1903,11 +1903,8 @@ static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *pBtCoexist
 	algorithm = halbtc8723b1ant_ActionAlgorithm(pBtCoexist);
 	pCoexDm->curAlgorithm = algorithm;
 
-	if (halbtc8723b1ant_IsCommonAction(pBtCoexist)) {
-
-	} else {
+	if (!halbtc8723b1ant_IsCommonAction(pBtCoexist))
 		pCoexDm->preAlgorithm = pCoexDm->curAlgorithm;
-	}
 }
 
 static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
-- 
2.53.0

