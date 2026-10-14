Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212B43CEE3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959593; cv=none; b=XTp/wsXmivqSTcDKKwez4TGdOSeJ4d7cgkrrgr0/8+ihg7H2XdwUl66RwgxeAzvr3vCX3u7WlxzYqUdYFAqsbIY+YFZMDyJ5BugUYuviO74CrxVRlEIv4vizCFGu5QtJHXt0Hl4eHJW/TjHXgaqbN93CFgqCFrKu81N+tLILRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959593; c=relaxed/simple;
	bh=1PwR+ODcKHLyd0ZhnaD8thna8oK51MyPxFw7FpxRUUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ/YjMoHN6rTPckPKFI0E4PrqxsrYNrnh//RNFHKylzzYyGjkIO9LYE656yiMCFkfVEPZ1tBOyQ+7fDKloKqx5mpbswlyqfbjX2yWZzgW3pllqDshRgNDcjIbE7VDlwIVUBhvlWaBvHFP/YKEHe0nuIYnEKdZmMGHwD4AtiKqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFxMxhAz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFxMxhAz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e946155442so769535ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959587; x=1792564387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0/sxyvqV6AS7JtOxUykkWaTxUCrr096nXX/5CXIozA=;
        b=bFxMxhAzG4ZdMEA3FdPzmszfv/pYxFSxjRYUvEdulUzGAySKbqVbo6EZtt8o6a1S94
         D0Z4tyIHD//BBPXLP7uDBho0yE3TZjfvgPqKh4M4qOWxOxB7p+u2YfUAX4HUzFdHRvca
         o9FLl/gQaqK9ojiMaiuNy3b+KFxrbyFuyl7AgfApRXpowdMirODBxl5LIDN7BqRUYgh9
         zEcL00WlnW2ZOOODB2kB6BP51Nw/6N4Zki9o3sLRa9qdMf8vqmXPcXKMdYVoa7gUzBeF
         /J4EATImUebO8OToc/D66z4SdMav9wt/AR7Sxzyjm1vX0P8+iLl/lVK7reQbf48Y7QOG
         oLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959587; x=1792564387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0/sxyvqV6AS7JtOxUykkWaTxUCrr096nXX/5CXIozA=;
        b=NdxNzMJ8J848f/p9Pp1xDyk/wSrMkVQtTNDROtCEPuioOcT5owuaOxudesUIk8kn+o
         u5lqXl+pWuZppsbpMGx1R7DQoE5Z+Y4vA+BtKCdc3t+BIWncGxQhrP9+3xiMarfUKdIL
         9EIZQsIqKbhlAPizqLOm/J6gBeqjMhQS8kCpDJY2UZYI86DmQG/z9vb/YRXERTAyouyr
         0GvdddtLak2SP/SEeeETt7S5h8gFFzzDtHybGWnRbydeEpZd66KQnUe8OlOIPiXslD71
         iUXpTJMDANPm5tVSnpMsvBh+/481m0gemslAHN4azC3lfzN0NNKuPIIWbE8GgDFpKAB2
         T8GQ==
X-Forwarded-Encrypted: i=1; AKwUvByXkvMFABSmjzvxhUHrvLGstvX0PDcjHuVidYBl+2WhQ9ou85vlU93PMK7d+dRqQspZmFiyFdGTB3FhzKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqI3nlSLvEaiMub8FxOjBjyHbLicEtKMznAOsyDO8ZCu1O0w1Z
	x56HEekAChUH7lMgEGE6UEOgQ5es1uYAr4ogBkoViH+32UvDQ/6KfRq0o8tprcORr2I=
X-Gm-Gg: AYBFou0iVGOIe5YEMwFnRZqDBXMVkaum2py2vp5ShwQUBr6fUhM4dIs6fM8NKZ6/4nA
	hOoBV9vMFltDCeTbCV51ka0VuJwFn/ROv7QxbS8cbkotC+mT9PSCJB6Wg57MO0gMQ9NuN84tQ7u
	++aWoP6qesRsesYVWYXi4VZZ0qxvOkvmmCyERgZxHAJkKBCAApSVHzXytDKc7S69EC7uIjwL1lm
	E3caLIIBVVv8wmP9WzXxwQ3GF15CYD5wF91/wjk/fVSnwNZz1YPswj51lI+uN0hvbSnLZ0tgPSq
	5Jpxw80A0Dm6IPbiu33IhhlYcihzKqEuprdYRWQEL+dRpF8Z6/6UGunfaGaahmqMPtt1g32wEEM
	Byekc3G+Do5KwR4Wloleok5wEwhtXHABIykoCZ7wiqV0Cm4VPwRaMVmV3t9EE4qtOL/dLVZH6DU
	1mP2lXaEuZHa07oEbkS3mYgGDHtyknUyh0hO80QUQIq31occqVvSklyrzW46Iez3bX+GYy3UZaP
	cIARdfP+xIxgU4fljY7sMzg71gB6Cx3crKpBeFM6RU9wK6x2c1gUYjuOv14hKIsMOHAIAjl+B4=
X-Received: by 2002:a17:90a:c2cc:b0:3ab:c80:9364 with SMTP id 98e67ed59e1d1-3ab3a98f487mr13050367a91.32.1791959586774;
        Tue, 13 Oct 2026 23:33:06 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:06 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] ASoC: codecs: wm8955: Fix definition of Treble Cutoff control
Date: Wed, 14 Oct 2026 15:32:35 +0900
Message-ID: <b398bc6dcf8dc2b93504608cdf952823ca238cd5.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Treble cutoff (TC) is at bit 6 of Treble Control, not at bit 2, which
is part of the treble volume (TRBL[3:0]).

Fixes: 54db41c116c3 ("ASoC: wm8955: Use SOC_ENUM_SINGLE_DECL()")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8955.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index c897a9ab764d..d872d4e00529 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -426,7 +426,7 @@ static const char *treble_cutoff_text[] = {
 	"High", "Low"
 };
 
-static SOC_ENUM_SINGLE_DECL(treble_cutoff, WM8955_TREBLE_CONTROL, 2,
+static SOC_ENUM_SINGLE_DECL(treble_cutoff, WM8955_TREBLE_CONTROL, 6,
 			    treble_cutoff_text);
 
 static const DECLARE_TLV_DB_SCALE(digital_tlv, -12750, 50, 1);
-- 
2.43.0

