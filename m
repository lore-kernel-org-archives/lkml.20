Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC7F43CE51
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767958; cv=none; b=XpWY4G6HYxtqQBjXopzex/DbxC8AgaQz/MiY5ObcGEGDhdEwxrpsub6xI54vWy+FX5nnYYgg2RFMRgZ2I3XdFlb6XAmfdNwR6QhDLk9vB06gMtUUPKYfbgxscV7y3U5VHoLvp4vw5CFOW5IqbbnDWoKIpY+X8VI+NW9CK2TXJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767958; c=relaxed/simple;
	bh=WMCLkI7cWCG8y30ht13Dpjq+ytj9QwWIte4gc8x98sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/SgzBgep/JRp7dMPXUbHEaBOFuakTyT+qZSO2Z4nS/Y1YpUzqJ6a7fMQNE5NeaTLzcnUCX7na1GSpF4rxuFv5SJZt+uXOlTGAm5h/K6W2YqZq9+T81yu7DHO5IahKMx6BohxSHknJtjWJFxFkQudF2mZJ3QL9+xjGpJXObVPgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iyom0FQq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iyom0FQq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6e954afbdso20250485ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767956; x=1789372756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FLjMyTZSsmtCKr44cIMaimu0UhFxFiYLpxSbsSIK34=;
        b=Iyom0FQqSB39dSrpJQF3oApuYVzSfnrHbk/WEr/sl2OxcceCefVr0buF6NFJ6wUL66
         /F3ztxzd115zx8eaVaXzxwIpXymM9YburDPaOY042jd3hm98ODAy3R9ThAeO6cSYTDJC
         eyWV0p4aUU5pTAtmB+oq9sUUXZaWW5Sp1PO3XKE1uRf5gEzd0MmBqELeLKMYufdpkQIp
         9YgWgmjaPb8GYnoaf/43g+Out8/02XXAYcFZhYPrYAgoWW2cA7VbvlNea4rH13uxm0Iy
         i+46PsPTRi1uSL/9gJu+08yZ9YZixyg9lyhTiip6DQImd1DHBdk9/MH/M0CpMWRT9ZVm
         ArSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767956; x=1789372756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FLjMyTZSsmtCKr44cIMaimu0UhFxFiYLpxSbsSIK34=;
        b=TVxxIQYRcDhrrij4SDdOO8vpkyOPrBVE+mOAqZMjonqvquwpFq15ICd1DjNpr+4+X4
         WTY84VknTT9NVBIUhBW/EZqpoAuJfmGviTVfQ7QFokIpgUwuINMz9FWlROfj/Sj+XI84
         vi7ZjTvM6XTHVOu1a7R0AwGN6F8/o/7zlXRIKaNzlR2qcQC68wj79PXdrYnkFGy48kxl
         k+tVlqc0xlCNcDho43w0jrpwYLDHTMvxbhlFXHjMhdM2p3GNtrtAsdR9FE6uML3hT25j
         Lz7am+icDpBgwNd0FHqZ0klQxJ3PaOWQHHJ/xGm7KYWCjapHgKmFbVat+8UVgpoLzsPs
         fvbg==
X-Forwarded-Encrypted: i=1; AKwUvBwdoHmwvyRqwTi0g4U3pnfb2MBJZk7gQoyZ9vj/oLhjsOJeJJPaYHKPGm+74+VZmke8K0ZMTRv3Cu9SWDs=@vger.kernel.org
X-Gm-Message-State: AFuF++lr0DRVd49B06RezjVs142Rz6A3O2q7/MLiTJFG+06Za2eKjQsq
	HQQAHC3Vccp2LMF8UZb5gRa+lVLl9dA6TlFGbqZyOGcelqRVS+GoYlZU
X-Gm-Gg: AYBFou01QW7N/ofSPFnpmg0DdXyBuWua5ZwEy4jl6BLrxD6UBStSsBObW4+gfaAMfrY
	nXf3aie7oiDUN63GQ802GjRlJ8YY4xG2AHlYgqL51VD4TgT/dIZv+XClLkrVKBM10KVDFBBmpN9
	Bxm5KQvRawlBjRTZz81/ktOpOhMzjQPT/xuuPCImmB7kRKxHHOsXwt+sFogNIWr4yQFgRgJJACh
	0b2PPHGNnXGF+itGmkBoUn9+1ELy8g2AT+4n6IFqjxFIeAcdSC82Zk7Hf6jAd50/CY4KuFgUaYt
	8NAB65gm6QPqar155ENt2HB3+MUWFKxMwmTz/KCs9Ig6T8wkxeEkS2bx3ahQjk3zRe2GR1ziLs+
	XpM1w0DXpmRjHtYOJB1ieeW0F+G2ZFVE2GgB1S6ynO08QnYtTFWfVpM2CiBnE6QGDvOK+f6CNdi
	eB/JjSNahPW62JfAB25vh0Uh+TIY9WfSo8oBitqL5MSlNFPXxo7o6DtWbmMLVfW7rWi36esEJb/
	Zdzk/0=
X-Received: by 2002:a17:903:94e:b0:2db:4bae:1ece with SMTP id d9443c01a7336-2db4bae2044mr85147475ad.3.1788767956089;
        Mon, 07 Sep 2026 00:59:16 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:15 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 09/13] rcutorture: Disable srcu_expedite_current() for atomic SRCU
Date: Mon,  7 Sep 2026 15:58:25 +0800
Message-ID: <20260907075829.2073224-10-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

srcu_expedite_current() is now forbidden for atomic SRCU, so null out
->exp_current in srcu_torture_init_forbidden_apis().

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcutorture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index a9672fe88cbc..d795e07a12ad 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -721,6 +721,7 @@ static void srcu_torture_init_forbidden_apis(void)
 	cur_ops->call = NULL;
 	cur_ops->cb_barrier = NULL;
 	cur_ops->deferred_free = NULL;
+	cur_ops->exp_current = NULL;
 	cur_ops->start_gp_poll = NULL;
 }
 
-- 
2.43.0

