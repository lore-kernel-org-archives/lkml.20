Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197402;
	b=DrsYLsemwcG909GPb6cVr4H3Zb38wPOhVDtAAE7jH83z4puAZxxt+Xgg1D75ffp/z35Q
	 D9i9/YuArwiYsEyAOTlgGA/HCahBRIto9wKnzV07RgfdeujaBvYzjZxQxNp0DRGR/V+85
	 fx+xzpg0HGftSTkHrHVSlcyTIk0pKVku16TIVMJ6nRiGPj5Qqy3OyRFgdypDk9/TQRSs3
	 08sannNc30AYJko4nTlpvm3o2wHkj2mFRpT4osDVnaK5Y9nbVClV0DCbwV9xaGOj+c2wE
	 6lYzrIV/tm4LYsfN6+bsD03gVMcWevLu9r9hfbyNqFDrs+PZOGaUryOTM0/xRZFEZFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sw5hYC5Hzc20IlMgdER73QrgaioAItA2FePP3SYzoEo=;
	b=4/gm2JlMstO/9p7thiECw2DqLZUiifrWkLTFujAyFvrCF1UZIbFqItXuUn62g5zW041T
	 0qzm2I2h90NlyIEglTxUysBnQ4ZS4avZgYVKprRnqBkSEF/SQBXV1TSsG86p5/BBpJdsl
	 KO97gDYgOwtfSyx45hZEnSLIUvIDYgIplNxrdeTUZlq8bESBdL2jgpYTIY/fdaubHaYpQ
	 9W50y88OXKQBwqyT6JUHPTrioGdTAgXIpNP6NtcLiOv3kUIRtiZgPmcg1607zmInwlOKU
	 0ekkxu65BfSVx/zS/HdLUNYxgU0iBXI5onBiEMU16tNm+DCOf3PNEECWumqaK8XVMwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxM9i9RJ;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F70606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F70606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WxM9i9RJ
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so643787a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197401; x=1793802201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sw5hYC5Hzc20IlMgdER73QrgaioAItA2FePP3SYzoEo=;
        b=WxM9i9RJ+T8B3uX9+0p5Z7Zpzg66rygBgxwggfCVMAdjD+AKLibY4EItBOvKKvO8ws
         /ClYV+PczJIm1poh00emLxSxxwFA/FvsySed3cJWsrfHvzFewIpuZgPjoKVW5Nd++YCk
         /yv1W5l5THdTlowA6LplMx6TuwnpMpFT7l/e8miTBlgvokSR6ZC4gMcuvyjF+cbKg+df
         HWTlJmX70Ngpyqje1WaL0BUpmww+WFhXaNVItezfZtduvtDnVx71fdMzgZIrFloKjkCU
         xOKn+D07tsFaU5DruFuxns14wL6fk+xh5SixO0mQ1WjGbOL0119zM4zvC9EuB5rlD7sk
         X1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197401; x=1793802201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sw5hYC5Hzc20IlMgdER73QrgaioAItA2FePP3SYzoEo=;
        b=vbFbkDZ0K4gVr88MFnGLFEnTOhfODGz//NlUQMxzsgxtJf/bhiMhPO5FzPXHRG7NSW
         cVYmNYnvbKOvTHwD5b2neX66P5V8pczM4/S0Ej2+p+UxbStOT3fQEptRfNK7gDegEwCo
         ZgXhzBk+qCjuGi2NZ32Yl7ZDvNccPn13aAMo370oKbhF/u46h6sAGI5vDSdd02WI1KS7
         Cpe5X4zF0bknGd60xXNQTSJiTeCMTE4RgPXl91mb0I9HW+mrqdoQRxKv6WXIrXrwZoCr
         vJMJG0Pr/qG6WGFn+OTFggdIMRo5YxRaYnA2uE/7wUZ6ET2KWOfRDpuqVH/ptVXrjI3k
         aWxA==
X-Forwarded-Encrypted: i=1; AKwUvBwldMCXk7Y9ENSG0wu7Q3e+qyl+1u/KJN+1XPsABsQXdxL3X1fmPvPfutImVNJMLUTlYZ6uoaXezgbQ70o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiNUZEuXRi3pUmgAzA/PnNAyu6chQ1y1cMx1Q0LvPmgJaoeSax
	9KjDmD5OAi+IQQ+h+fWRxuOZ+zF/cR8CHgzQj0apmVpTMjVpF89dXdBF
X-Gm-Gg: AYBFou3YoUUC6G/8zJVNIf0d1us+YB5GnQPYHq0xlgCWB1i1lmYtc7vXn/luKNyDgWZ
	WdNqEkCMeeCBi9caPCEQJmx/XeWnf3KCxFvBV8ZCRbMEwfZiG7nzZUPgDA5SmOX1phE+zGj6kxi
	Szqmzcz5r8KmmXSFXn3zYzUxGoZu5VziSUeCiQNiS6lZVfgUJ1+9hCAPWyMQmCKAgARxqqnWoEf
	Hyyhx4jnbeNKsCHqRoAyU9EukehD0GV21dz0LSf7Y7NhEFMbUV+BXdM2yd7J3MTnAGUcQ9THQUz
	ZpEKwbe/owl2uhgII/T8NR2AGqOT/btgrmd9ZjcrQsm8C8MUYRA2/StuERXD80eZ/LUjUQHkq4z
	4tqGFs+otuB/lgrEgRfDOcwFXFMKPtGF7hKGPJEawq+jlFqkkJeG+8K6Snj2kBrS2hC/uTvp/HR
	HIK5OEnQO/FEdP7s8SNG0NPggm3GNzHRN0JdPhtiBs6YLzC1Ncl9shn92SLtpg35Zy4drQK6grI
	KjPmFfOIB9wE9K67E4StyNe2hWfv+0R1kbUfl/Smo6MCEbhITkyg0/KiztekbCJWtHSnFMpoatb
	/58eDJGsWpiAt7+3d8cUdkwieyGKx/srQbPYp4BE8hFIz6p1jCZsiXIQJolSEdw4rTSE
X-Received: by 2002:a17:90b:4cd2:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3ae581d37e9mr1711896a91.30.1793197401182;
        Wed, 28 Oct 2026 07:23:21 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm3773918a91.8.2026.10.28.07.23.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:23:20 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Rostislav Lisovy <lisovy@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: mac80211: enforce OCB station allocation limits
Date: Wed, 28 Oct 2026 22:23:00 +0800
Message-ID: <20261028142302.16634-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Patch 1 prevents the worker from installing more than 128 stations.
Patch 2 bounds pending station allocations to 128 per interface. The
patches are ordered: the insertion recheck must precede the
pending-allocation bound.
LLM assistance was used to review this series.

Zhao Li (2):
  wifi: mac80211: recheck the OCB station limit before insertion
  wifi: mac80211: bound pending OCB station allocations

 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/ocb.c         | 21 ++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

