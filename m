Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426668;
	b=wsEP9ay6mu2P9paW5d3Ry66+7EA36QGpDOGlRcB8murmC0BPiqLOFGhdmvDT4umb+jmx
	 EkiyUrFutev5g+NSzpez3anAuIn7gLBbo9gdvbabKknlWn9x+rPzKBz0DpLIQxLdIgr2c
	 CNUKthlrq4wAcX4Z6M9grEFu/weIBUDdIM5BCvHiRlUIIC1G3g3FRpDrOjyOM73mMbiZ1
	 GHpC7E1D7JqMydIKZzdR2z2/FAn4+pCKxvODFxronc9kLjhMmUc8JIfd5XNxAN0Yq2L7o
	 jWmOFoWlzkMRLx2+aiHJRRD7iN64NhJ8FJeSHl6LhmupbXrka+y3nMqQZC8CS+iMJZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
	b=JJGBYpJqRsAQBd/X/tr+DCfYKyAViZavMrMINK7lMLkxe2kMKoBVWPyVSEf78FqnvOQw
	 XFLdjAZWM/QTkRBs4To5j09ievWH0SiJKSfr3EQj0axuPlLJnQwk2nzKUvWMZOfjXP+W3
	 lRsd0In/62WzCCKhEhLnbnGl0R6881jHUemO+WeiKuRL9qG38e9YFie10K2DVAzZRTGSe
	 rJ1YhvYY6MYT/wM3i6+hwZmHKIythsV/Sh74F50EvZ6eyjhnUcTlI4pjRbLzxK5Yn5oYz
	 gqHocpwPXsErKfLI5K/rbWONMb17dJ1bx1FOV9xnlIOgawfsG5eky3qBijaCJk1dpJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K7VaRv01;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D3606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K7VaRv01
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so3789596eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426667; x=1793031467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
        b=K7VaRv01AhlvkuBbDOCGUqbBkt/N3HMy4qyjvMzbld+rjLvgJIUdgHygzIULhKMqjK
         BkfpKhx7wE5iahfhA45h0klxGuhGmXiN71rjRGuH/ynWvzWQE4vUgucdbtjz14JXPnR/
         vC42iWhgpsIyfYjanqmqNmSsrrclT58wpIbuGikOQUGz48A59cqVCn5J5aO/EydepZ3S
         YOcYUrXfp6Na6c1yhj6vzeQu2BlCJBmATxwUWGFaNFroW61Jx808XkArogBDutixHacw
         8EtK23UKT+QpsNgb58gFh+pKRq7CehUHT11OlOOFhHTPW3vSIB+FNSh5uYlhn7LUzREV
         qkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426667; x=1793031467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
        b=S9IPtLj5BBfpMgoou5U37Gj8InfBvkHlfwLIL4mz59qGv3nNLoCFX5gxsCqRvirnV/
         Xge1jIEjPtQi94SrC1H0RJkOx06De33HrD0ZGXZux0187hWVQOT5E1w7UzGEqaAPlb20
         7rW7ArAj9NbZBEwN7epjaIvHFdgpbpthnUILnJ+20b2Apn+lnMAFh4VPfeqmW3PXECEV
         3Oj+kISNCam0kJKO8FFM9mcmJPrKoAa5dHulxS/RJs3qqkAkr28t8n59w3QmIiYfloj5
         AzGoYfz31EtoicspCWcmQ85wQ3GGrNGuz6mxIENM3pFouQ8JVxdkAapYRGIyhKBJjZTT
         CEhA==
X-Forwarded-Encrypted: i=1; AKwUvBy+fF2RhEXhmx3lwfQUUaiUNvWwFR2vjNHbmvi1K+26XyUmdpXfRARBymB2eJFnnr7AWuzJR0+aWqoztOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNSEukgEz0AMriv6zTiPvOJOvSV/muEcjujHn7iOlR9wa9ycv5
	5APAr5VaXqUtjPgr4z67o1cPzTFgvDc+jvPiJJd632EQNnvtujEr7QPntlk7sCOD4DY=
X-Gm-Gg: AYBFou3ba/2pN5qJG890f9+2DRMiMW39JwTKTh0S+nEFTew4XGR5w6CXdTOwsAE84pZ
	LiwTKrWVQnI+C6vaygvIUszDQ+pN9OiFRlj++s8ye/hsjXTKdo3eOPs71KASmpHLuALo8fZasOp
	AmoB6ZDgt5e19wGy2JmTdukU0nhTtoCmriA6ZKqprCMLGWROAb+QIofELfcl9DiuZ7L7r2DS4Z+
	Zi6pwKL2e3qpDNzYxn0+6DWzykTGOebR6MNWIZSjtFkRRJ+paTPQsKrFHs4/a7BFp0vgKKIaq8F
	BnD117+CrjGKdY5Gnjt+SW+P+cLZiB8ySDNdJCvZNeA30dmEP85BrB5XE0DyuyJkLZzA4vYCcJ0
	AZaG+ULc1OOX7k9yj95UQbGgkKKvFMUi0mJTlVpxZLzfNyj0vfyLAM6ON4Ypksjon7N4u1Zy8it
	Rbh28Upa1UHpAGflw3Nk+LqA0cHh+CgNJMhLtRCD7nbIHESJmfA8cQSX/LR/7aLVLKEbX0P9bJ4
	rhmI/NGxMrLrp5X5emEmg==
X-Received: by 2002:a05:693c:8955:20b0:35c:707b:acba with SMTP id 5a478bee46e88-3619f1fd96dmr12005989eec.3.1792426666488;
        Mon, 19 Oct 2026 09:17:46 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:45 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: qcom: sm8450: Fix eUSB3 clkref rate and camera power collapse
Date: Mon, 19 Oct 2026 16:17:37 +0000
Message-ID: <20261019161740.2384-1-sushmit718@gmail.com>
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

Three fixes for the SM8450 clock controllers, found while bringing up
the Nothing Phone (2), which uses the SM8450 derivative SM8475.

Patch 1 parents gcc_eusb3_0_clkref_en to bi_tcxo. Without a parent its
rate reads as 0, and the SNPS eUSB2 PHY rejects it as its reference
clock, so USB doesn't come up on SM8475.

Patches 2 and 3 fix camera power collapse in camcc-sm8450, matching
what camcc-sm8550 already does:
 - set RETAIN_FF_ENABLE and the GDSC wait values, so the IFE GDSC
   doesn't get stuck off when powered up for the next session
 - park the camera RCGs on XO while disabled (clk_rcg2_shared_ops), so
   the Titan top GDSC doesn't hang the SoC when it collapses after a
   camera session

Tested on the Nothing Phone (2) (SM8475). The patches apply to
next-20261016 and build without warnings at W=1.

redducc (3):
  clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
  clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
  clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled

 drivers/clk/qcom/camcc-sm8450.c | 113 ++++++++++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c   |   4 ++
 2 files changed, 74 insertions(+), 43 deletions(-)


base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
-- 
2.43.0

