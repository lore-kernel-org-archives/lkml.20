Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F4952CCFE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689543; cv=none; b=iSW5yG8xl4HKZ1/75L9QHGWIULiFndpofacdamZJeYxVpdgRprleM67tZjd+zV1RLDgwpI13PGcmxqJzGyI/P8bZ94e2EUPQzk68CCVedb1Dk8v9FNeYA9sq2ecv1B66zeFZGlYH/7ENB90CP39NlveGM3QhBo+Gjzhh9hiAhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689543; c=relaxed/simple;
	bh=d7V63ETqS5KwO2JLJJ4phi9OeaE1qr5eUbFXnwkj0e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNOcQ0BN+1XdSy/eJ/olQ4e+G6RCArk8fYtg8W1/a8rNNBUAZMjvlki+eKftNN6c/LudcWhv1HfHiA7BxQFIQcX+4DxVcw/j6HevCoRlsztX6LDJ/h0IUDhdBd4d/9JiYnJnkK3dpQ0cwl51qY8F1VE/Bybb59suJw/Jw9xRxV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljqkyG4S; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljqkyG4S"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso1802458b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689541; x=1791294341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H73SBua2th6nVmJcdyFkXeo+q0gSIw9BBCqcFccuS6E=;
        b=ljqkyG4SYBFUAyuIOkrcI+6lHI9cuYiA9abwJIdppHH4H30bDq7d4YJS1NvjiHg1qY
         MgeKivLQYiG04vRsFdgGmccGhLHwtiyVJUmorapvZB9nVYxNii4+PoUz/01YcWn37ij1
         GVmeFMrKNuoyF7bvyWAeVlFSXWaTXvvns6ykx/dleKVzl+3MIafQ6MryuqdPe7PDOK/f
         MgM4o0V8vOX1LSDnXj1KyRt3loDtqdCbIaon1hAiHLeNHtkAfba4eKPxAmvUceCNghvU
         RO1rwy6sT47GxnTKPCCFAG7fMKTaKO6kw2YWPYaa8N8/q0DF1yteqdT0Du1xaDD1fGLk
         62qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689541; x=1791294341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H73SBua2th6nVmJcdyFkXeo+q0gSIw9BBCqcFccuS6E=;
        b=x+eM7fjgnjODQ986qwC5WcSYKS7PRAVJuSF1ugQ8iv/Kn/Gpqx5qT1ATBqgtNEI1Nf
         II2wtgFeXPT5RngxkngnMqE/I+sW8gLJ0y8kRe8ILwZOQ7bCS3+uLqigv+rKGr65UUkm
         MRb5H0n2B+bAJkeW7yUf8BkluD5eZUmm8elGaqY/MoeYhsVLjRissht7GdwUMeo0xVlJ
         FS+0B+wTv0EK9Jf4KXfqMGuu1kxr2h+Zg2e4kaRNMJU4Lr5shM9awxDNcHlrYIrCGJPR
         BKBE0982mxFZJQJApwRWyyBT5XFLSFqRUE1gMMg0iWwqbx2JpycyV61VF4dVXDNCtx69
         C0fA==
X-Forwarded-Encrypted: i=1; AKwUvBzirW0LzKGZwitIKxwz5/Bf4kc3zOI0O13lKlS1qUEqSNgtryIYRZjn6XEagFoiL7WzzLfx36WolWMqYOw=@vger.kernel.org
X-Gm-Message-State: AFuF++n3+cccOAFE1JtHL1lozsPGIGK6zk8A6RNucyLZa47DhnT1psOL
	0ZmKlrUSZme3kHD6gec14gC8l5+7v7oL37RAgjiLZnn1oip2x0sDJJLu
X-Gm-Gg: AYBFou1P9MTYFctiE1JwusNm3IDAB+6bOaNWMGSQpenpz+efMCCGLxlIlWoHu7kmxFk
	5+KU32fUZJpk5zs6asaRVN8EmfQbJgS/6jGQhMy7+tF1YbMmNFE4ZXL9JvqE7ct/RhfeEBURj1X
	8qzBDw6RiyMrNM/FMPtcvErwE5sjCFDBa8XZ/BYRy27JeO1lFkEIzSZXT5BG1GvvgzoHfzEvUb/
	gGnN4r4UmyYO/zQ6ug41TYS+/ao5IPb0sB3Mf7kFdDsIKie+5BzW1yzsIPO0rF4qlC5e+wcTLgh
	6leCTdPG8I4ngEYDANTyVpu4dSDjNimwdfRpk+WoD5mnhWS9Y1Wscv1af0EnlP1dCQncNnK5RMG
	H4vegYTvVfiK/Kq8DQhIsx/dkHQf4N546wvUNbr90Urz5AqzoX61v/qa2mYszOXry6o+Wotiprm
	hIe3+ZmWqMW/ubJvQ7jIACuXXpOClElf2hzzo3rI66RtoRY1CAoTGw
X-Received: by 2002:a05:6a00:a90f:b0:87b:6b3:2cc4 with SMTP id d2e1a72fcca58-87e9acf09dbmr13282245b3a.29.1790689541243;
        Tue, 29 Sep 2026 06:45:41 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm919555b3a.8.2026.09.29.06.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:45:40 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v6 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Tue, 29 Sep 2026 13:44:59 +0000
Message-ID: <20260929134503.17249-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929134503.17249-1-qby140326@gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d55b637c32e1..c0b657dfe11f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23042,6 +23042,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Gladyshev Ilya <foxido@foxido.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

