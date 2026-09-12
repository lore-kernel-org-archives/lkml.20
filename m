Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB73F1AAD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197534; cv=none; b=Lqj11HDP69TcC9rDYgsjhlzIFkvnvz/d96EIr4JUJUy6gSfgpEUMPRB+Mnt/b0hNiZUYAbZmAIgmAdl/mn4W893H38evUYkwHMEpmeR2PTefLsrRaYZ9mwLcvlaLtgcee9zmOcsjse3SdlFaje5uYrL0FHL2SNhiNX5e8UgaTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197534; c=relaxed/simple;
	bh=RNy0Oc1b5YVJpZS5AO65ioCXwPG1K+v8mTvUlX+rTyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HgQjZ9pKp1IcZAsgMa/SazeowSXNEsNHUybvDNCtMVlMYfiEkBzMr407Bb0nqExbS+Y6iZbNsfX9BTQTAnxm2QZrk9LBhqLOH2qcr4Gi/nDrACB32qHKCe16UwSWDgkFYLgXXLSH4Y+gvWSZTYfqyLND5oiLJVklWmGmqgc1Bag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+tBeMaL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+tBeMaL"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b76515c0d7so2126620e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197529; x=1789802329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=i+tBeMaLpJsVRd5NtZFvwfpAYPw2IkUNxdL7HRV+1mzv4sR+y8lf2sh9y9YarFY9re
         bzopurCtaZLwNiIZXYHIEHb2byDa2my79AB/wPdW7I4hg1NDO/IrE6g+6OxgobWoNn6B
         Winja3vcyuDrdaXJIv7unmnS6624r0lVIs7PZIgrw01NHA2Uic6fNYiPwHUpiDRpFpl6
         GvTRAKx44XjGES0M3D/vKuiE6sZyuGActsqMdpA6S3hRRnMYrj1iKlBu0lwQ74LTm1PN
         tlVN/kMqCwn9oVy9ugz/Vs4RKU8BSYmRODMHd9IoIuc1OzEs6jCgUnbtwIwC0qHXhJZq
         JIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197529; x=1789802329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=XXL3nEARwtkaBKaGX7ky7h2/A/sQhKytWZBCHY2rHKKD7efz0jC8JIaFJRg8ZQ1R96
         U/ahneXFr1Py0xjvJj1hCsN4tTtQWysA8K9XPtLp16omz9qMbsX+HV8Mdwg2C0OunyKT
         fRXZ74yrJiavkXn5c5vjIiJUSvWmXv4tW5tI8XWhWuyB0k5yCIyIKn0Dkfr9zVOrLC4i
         oFd24snxMaGzKlzrBquYwB09XdfSNZ1LnVgtSDXl0WnXtOkhNuNsqk6rM66aigbmN0O6
         JhENAv/BK9Ebp8ncUagLHOTImUIcUTmqCffmPzPSTm8t5mIbhXxMFFd0lJRVgdXm4ldn
         A55g==
X-Forwarded-Encrypted: i=1; AKwUvBzKhk/tAiXC8UXl5DPWJwTtYRsGS0JixelmJ3WQhRGQrYRAc+Dgz/VC+y9Jaq2ddAMnK4Or/slBCo9pXyw=@vger.kernel.org
X-Gm-Message-State: AFuF++lNxlLFA4NiGW0b+i67n2SeDy31jUrq9oZqrUKid4qnsl40xEEe
	tGXp2F2E/PrUxthbf7gIwIVjoNOxdfz4XdgJRwIzLDO7tm+bh19vUQ2j
X-Gm-Gg: AYBFou31VllDD+lu7rtYkrTkSwFpGnJqOqCrUgqsUAc6u1pqThZbQgCJZoWCHE9OfIS
	dziuHEfCVaFB22oM8zOkouxinLE0VRjEbOxbDXHc2aBZcsEH2G3CI5gTiwVGo16CrF0Q4kUGvZY
	ZkI5b4BZE37kD6IHMUpr8YPqqpYIdB0583rkedNktoo+6dgei2u4avtSFZdn8fDgbauAf1Tyuii
	qyAxWkr7VGS9JXTaYT1WrXJ5rICvVkl31NVuLLtrBCP2QYtz8rWKDdWHmWx7XNW0jCj+qAb1vwh
	5n5JFymvigjxFajkC0vD0kAzSZsdUjHtE9mtPSX93QmHb4xFHV9zFlMw44nM2QicTBj2OhOhRkT
	Gpu1bV3nKUqGuWqN8NaeXxLOrzxHwQD7ZgPkClgcFxi907w/+wf2OWdn+YsJc00vd9IznmF6uuK
	rUunB3Q+v3R8o/mBBZuB4pm0fPFisZqinXbeYvs+8tbBbrVS4SiGBCvas9jvZkrY6UgRgYFtHhA
	S7Njw==
X-Received: by 2002:a2e:a596:0:b0:3a4:68f1:8bee with SMTP id 38308e7fff4ca-3a59108ac42mr14680391fa.6.1789197529066;
        Sat, 12 Sep 2026 00:18:49 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:48 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v3 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 12 Sep 2026 14:18:42 +0700
Message-ID: <20260912071842.622696-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912071842.622696-1-vladazaharova2018@gmail.com>
References: <20260912071842.622696-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b08fb..cae0578d32f1 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

