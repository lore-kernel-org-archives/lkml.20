Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818235;
	b=yqM2j+E8h+3W31yD+EiTbyLGjUdvVgJUQE8ELfJDrj9ZNab7EIYCW3+Jd+KQWymztqMt
	 Gl26WZnTb1zpFzOmkeBSeNiQ6W4T7PwOYkokJRuleOH1So+ql+RoT0BReeRySJAXegrEK
	 uNN372lsW2TBpKmqt8WEWpBs3JBkejV2o+yxs6hYrdunpO3neoOuM540CvV+vr2dkVp8k
	 cM/AXMmnAlF5cpZ4qiwOq+i2nFAcqfxsug/uxCzpFnYfyYWXWLuSO5OT1PZChC5c3lJUz
	 s7r3YgMpkDtbOm3etL8c7s2Uvzd/551bZGa7MeggOb6xo6Elqj7WXyi0XIo4+vLeUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
	b=ct05YCE23L9OIxfY/vEvgI0QY1lNZGNvqsMqBxEA/hyyBjc4RXH7eRV6+K4TiNrcHgUZ
	 jsh53i3yS7cvW57tGQfnSrPN46B52sZ6wcHzyfiOordVou4DdmlO2lUzkWGm5L9fjfYEb
	 L2Nn/HAhllNenQXTNyoDKhiEvPkXIf7+sFXBozYo46A78L1x19pjuoNJf/ZlK4ekVHsNj
	 I7Zpyb9aGQylUD/c8KTvF/ZWrXObzJ5XrO1aHNw0WYJgFGv1f/+6shsOY1VS3wJ1TvIsN
	 cVAiy+DSMd6UccZpTnfOmOpM2EYE3lJf/3tINT0T12RcbpgyB+U5XZAQAll7uGXKlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVttMWLp;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A82606D82A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A82606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVttMWLp
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d885929so861505f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818233; x=1794423033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=vVttMWLp5uEBekMbz/D7wYbFBLE7jE3b5xgl9OS5+A0pTFPUUK0fBdI32bmkcmuqvK
         bAHH1CsNxbXewPaNyXqIp3nPt2Nut7eTfMPC5JyPt29tMx78M5CXBBBg+wN8yYe9Q4tj
         8v4MINxv3L1zCX2T4fZZFqYn7/uPckMx7fOMsQ4TydiEMr9w5j6LtVQjy4Gf2Imdhf2S
         Pbx9QOXUHW7BOW0mlW/OBs/c0AQy97VnAxrvFhuirZV3gXKpRr7jEjhoKcYdEaNNKYw0
         rders/Lh3SKGmO8X2LrKlVeyDymXMV3nR4Tq72UOsMzNsaPSsdWUIPe1wEinJbspsIWy
         QnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818233; x=1794423033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtfG0KAvDIbko8l3jdeHS5xdiecERegTmLWZYC1nHEU=;
        b=pcT+MjY3O0ZkhF+LDXoewOa6/e/VAZapten2P6zXeKgDYlsXLsYZXFYXccsgm4VrED
         HO6Bzbj069Uwcr/pefQut8r2CNnUqU5APv5z2Z6DoX/Xj1pu0Sefya+7MsRls7X1OkbK
         mCY020ld7T3HY76rkRN8ZV4BgpmOZGDDnN9Un/qVAJ6+AA211v1rmEbzbHX4bM24R85X
         HdBd0ZmIRPatErwxr4suru+j4uwVNrOOjUO5tX4gwqaKqCSBawKlT/Qsd+SIXzD2r0Hw
         pH/jeFT30fPBfTT+idORjfUESKrPFQ11cjvffph5lyNn6G5MRgUKeITycdMQ6d2x9rK4
         VDXw==
X-Forwarded-Encrypted: i=1; AKwUvBxqX/vi0kckBLiZKVlL9Y/I/1KGag7GlQZ6isjKAOAuS4Yf58lpPKuR9u4xANYnrkmN3v9xYOFWVGHfenE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BVmTIuu66pd2qf2mXetCGO5vGJte51UJF6ucmeczBIkkwzF9Z
	drSZBIHafyZEwQwGROXuIMQ1c1fZXvS7i0Gjom4/2HxDrAHoqsRreSk4ODrAJw==
X-Gm-Gg: AYBFou2L2cWLR2QvBYPlX6CM2gv6wLP1KETqtHQ9v0mfQYKabieVMWDcl+w/v4TkTfU
	UVcQHJiqtzArwQhe3bL/LthwSimkgY04oq1PzIVZnthWE3BNYrnnVd/d9R4YOS9tyXJH/AhYiG7
	mUkYQgyWQiNZT0bM5werNXwkFexQyHmlG9+LUCs7UrsvStZRnivTnSLILZ34kD9r9qRFVQiHGe6
	p9WeMNsicKDxhZxp5jdb2dkftZtQO7tNBrWvtaaBxYdR1dkMYrKW8K4ljNoQH1oT/Yv0ClpHIll
	3o5N/5N9WRbUutbSIpuJ54L4o0AG3PmLEuvLRmdCXpvNwjbT7dwKnRzUQ/ksDp5VIDaq3Or/f+8
	erlfopIjHeq6ux2Q4I1zcj/P9knYm9eQQK+aeCi3EKNFszSZMvQ8FLm9VGZsjzhB0U6WZCCLvcz
	0tHWszENLq/MJggqFL9btfDobjd/+eiXbBKnXI68UN3KZteqKWmvkvkSjPewsrLw72bPdfQL+hH
	UnWz+wJlU1YOtBztfLdOeHkmLHJ1bxEZf/NhjVWr/1WbPbHWGyUCkikR6+2rF1/BdIbUOm1Ql67
	+c+qyvcP7bcM3/5sTN4TddGstPEFv1OSVmtpwGGUPr3fJ+JxPV/LP0l6JgGsOXfHfsk2d5gYXNl
	mOxRE2v2vNNGP4Gh+BLOyRmOMmfWCrX+wVb3RTIYNiUf6dKybgoSgfyfQ9wCXtqCfLqDjdFGNQa
	hIj9qpN+IaXFspGE+/DXQsepDkaojde0Ko2oNR7edN7XY04U1aRqj9NEEjDA6bAKBBzsw6IYM9C
	D5dwcUXH4jHHI4JquBSiI6kzbXdtTn52R1M1vwW/wVzMpIloLdTGeFiVx5LxSfc5+k=
X-Received: by 2002:a05:6000:15d3:b0:490:9fe2:6a3a with SMTP id ffacd0b85a97d-4909fe26b79mr2502099f8f.15.1793818233140;
        Wed, 04 Nov 2026 10:50:33 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm5399898f8f.3.2026.11.04.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:50:32 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Let the SPDIF clock set the audio PLL rate
Date: Wed,  4 Nov 2026 19:50:27 +0100
Message-ID: <20261104185027.883011-1-jernej.skrabec@gmail.com>
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

Unlike the I2S clocks, the SPDIF clock can't change the audio PLL rate,
so it can only divide down the rate the PLL already runs at. That covers
only one of the 44.1 kHz and 48 kHz sample rate families, and the other
one is sent at the wrong rate.

Propagate rate changes to the parent, like the I2S clocks do.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..3e8e79871eb4 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -571,7 +571,7 @@ static struct ccu_div spdif_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("spdif",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

