Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49AF47207F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529942; cv=none; b=DXPkfzAdHFaDkhewoD/uUhQBd/tqd3a0+0QeD8R5G1HZAt7oYa7j2aKmF/WjfnvGK0M51aTcekSfILnUJdsyEFNcZAxspb0A43m8rcdLR/EXV0mWmG1rfPKBSnRRJr+I7SERyYLosOCKCisHRwH6FmZpqB1ZTOBfRE/LTpL2O9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529942; c=relaxed/simple;
	bh=nMuXVhYe39gJuCALMb5O3ireZIWC6v81e/BXOQPu0jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUzGY4f9osbhjRVrsEDAT6jLnRaEhJHczOCIunwGhjonZQEiCJvQfXD++U35n0xF5Wka1ZH/eOShq8lpkbgm712rSWcmH64xZ3qvRSC2dG8dU/kxLyNnneoODV18fNlUd/ZQO6ej77samSeMYGcIHDj6O7xZsfQlHFEvI2FsHr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QYbsy2Y2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QYbsy2Y2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd9cbb661bso30668465ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529941; x=1792134741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bA1flR9Lu8v82O37oxNarBOltKmvw8qroUoydC4mNOA=;
        b=QYbsy2Y28OnxTPVUflYYhzR2ow8TdIRdU1zvq0B1voXfZBtWvBCt/DDvGYUPBNBS3Y
         8ufnNkpTP5Galw7/jQbGISRtnDeNwWZmUTjv6p7kRs/wGNdWMHAUFRpuO1Sn+tnLzBYz
         PWt+74wRhyXKiB5A99+7KhZBx7kfXs1f/s/C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529941; x=1792134741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bA1flR9Lu8v82O37oxNarBOltKmvw8qroUoydC4mNOA=;
        b=pYQwoOrB6DW2tP+A2BrzUURrrKlo22j+j9S4iLbN3LM9jro4BpbN1diDi/5X36kwFb
         nFiG/9YGC8GRX5MVWvqIxMPhHcmG10Uw3A6gbj8303CjKrTQT2rDMzTMg5FNCHtAV9oa
         4AhKjOQSP/o58T572Tt7YojguobqU52PLRRorzHZM/VM2msHj42+dIOl0UHoDNom8tkD
         WvVSPs0ro5BcQsTzk9WhyXs4M/anu0MhXaxShMjC7wbghf+EjPYKfnUbx+7Tac6NLKoH
         mFKO5li0+9wbK/4jbxbWAmSgOZpkWowktCkdXVqa02Yzu7SZ1W/4XeX4xKwKcjvyn+xL
         oa4Q==
X-Forwarded-Encrypted: i=1; AKwUvByikCJArLLYIEQhy1fkf3cfz+M5fBUjpOKT8osIulSmwjIlPotTSnGBi7udRnwJGrlpH4QkwuuLnDGK2lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoUlpIRTUcuTESv/4SP2PvPnJp0G2CJJ6eiwxdTYqYtuXQ2MYT
	Jl4nSQZ5A6ksrpJaXLDLBOvjduvQ5yjsK9CIzobthAJCqvDs9vw+pdWjZFGTPERYsq7bF8H4qqK
	tB+o=
X-Gm-Gg: AYBFou1R1oZJhqN0S/tmUdzM1faXI7zc2+RerLv0QyA7oC4pxhgI2GNa4DxBdLW+fGP
	2IgdhQ1d61o9x1H7dAmt3zQw52w0SnA4N6oAriaBmLdMpMHQRm4ww3xIT7LduRCAA1h37fsYCKJ
	579l73KtEmVEXVpYvidvJvcugxsBoMYBy7976SrKIVItHzU8TQxpdjVVQyCuRON9RjqqYGlG23Y
	uMlOL6LPnxf4CGF9a31hCFZVSAc/DShTsLKnqpy8TwWswHBcrnxGpvSQq1VTQo9f5f3HEITYNBD
	GYp1Z02qft1hai+22bDGp5M+cMarBntLrZ2+yGCZHEWHPdRbzIqZfwe5tDQNXbBbttCJFX7NSow
	JFArXZ/ovkKhMdkmbH0WXiyCW4lXBdRptEj8oJgEzEtItQTNLFEqSXMST3PrKs9l/FUXwhxvl4M
	l+ofNwGUI5cTzPaRPe+DuWwqcFDquFvJPQQAZZz/pmMEz9trr4qK5VCD2ZY4z482OEeuEuXIAuI
	Puwyb+FcaociJqdLi6D3Oh75uCMwwlDnAXe6h/NTE/+DaL5J0QZGN/np8t9bnw=
X-Received: by 2002:a17:903:1585:b0:2dd:c100:9433 with SMTP id d9443c01a7336-2e842cd0d8dmr9030255ad.49.1791529941146;
        Fri, 09 Oct 2026 00:12:21 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:19 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 03/11] zram: zstd: do not allocate empty C/D-dictionaries
Date: Fri,  9 Oct 2026 16:11:26 +0900
Message-ID: <20261009071157.3730698-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009071157.3730698-1-senozhatsky@chromium.org>
References: <20261009071157.3730698-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not zstd_create_cdict_byreference() / zstd_create_ddict_byreference()
C/D dictionaries when no dictionary was provided in the first place,
because zstd still allocates internal memory for such calls (~96 KB at
default level 3, and ~160 KB at levels 9+ on x86_64).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 127976b5455b..b367049f131d 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -76,6 +76,9 @@ static int zstd_setup_params(struct zcomp_params *params)
 	prm = zstd_get_cparams(params->level, PAGE_SIZE,
 			       params->dict_sz);
 
+	if (!params->dict || !params->dict_sz)
+		return 0;
+
 	zp->cdict = zstd_create_cdict_byreference(params->dict,
 						  params->dict_sz,
 						  prm,
-- 
2.56.0.385.gd3acb90ef8-goog

