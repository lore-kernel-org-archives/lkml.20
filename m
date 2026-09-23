Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9D5383F9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172406; cv=none; b=M4lfo+Tj7kCwVMafi2gsqanpxG/Bxfw1x1/P3c+v6d6pYHyAph6cmstaDOkqQbqUBQ5kNKpjq7oXZPKcaPtcRbkyxvX+WwEZ5Qp4kx7PxPzp759LCg7Jx0V7LHQxdCUJIVumrDmOQSjHQk0GFTQd6g1qMK64NGWSorNl2YuAvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172406; c=relaxed/simple;
	bh=7u/4OZ1/l/ZMeEzMXgKr3J6dGgbI5M81i34WvI+iInE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SpKMAf0ng+SFStfqTDQiYBPAycL2tXJZX8awVu0Pd4LRCMf4UcTM65erG+Cv4nX6lBmp4ELSltlTklknCqd6rysa8mO6tNCzp+K7q9gyLMrwI12hqPyGfJ4seTA2DHQ19pUbqOWPbeRUj69d2Bd+PayZTXuJrPoCzRIWMJ7uqWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=coS0Tmg2; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="coS0Tmg2"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so652262f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1790172401; x=1790777201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPV2CdE/Dht4I+/gbqIepOjn1d13cJdz8dQIBlNjv9g=;
        b=coS0Tmg2ocMg9PfUnAceDPm3ZsMcgHIOsFCftSPuF9UVUwoCVvFVNFDy5GDGLlmPfK
         Jh5EzA2xCqvEr9NCVk6pg3QanMEZkU+aOvOFUra2IYGkxV4jxq7t2GyKjPCiAlzVZWzl
         PjCq7HATdWrHCWYi5/D44zpnP2gFMj2ScdLnHCZqRqekMwNLAMmiUdfimjXOoPV/QOYG
         3BDcnNvHCgYUf+esu1KVkzdEprjDVsw3EzFL6z3N4bNxTu4/oasJT3eLmFbwqU0h4n22
         nZxcwJiwLa6ImcHloQyfX2/RGrODDSvmqC3kYX1eFy7UiPkcp5Rji/E86K2Jlzq+C+f7
         FoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172401; x=1790777201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPV2CdE/Dht4I+/gbqIepOjn1d13cJdz8dQIBlNjv9g=;
        b=QdSQmZEVkQGKygJzBXVtTYnHBdsgJUlwTP5g5OgcsfTW2lnGcEuPpVj/J0belNZy8x
         +QOuclvwMTBhxGC7NADc5kykIPwZVkJRzKFueY+cX4k9aK/qGMefwidlUW34TVOi6T0y
         E6jJJEvBJMcHgZcRPODAl9tNx798rsoS2ETExhTmBFe8BAzAKpwFAJEk4jeedB0eD1A8
         eN07Dz8OdfdTTKSdbnCdR8iuH2W/wVGPyKmH1EG64s0S0dqQHomLcpPfWo8GkADgTAnV
         5K5C/zH8D8xV4xHBfXJ+Iog8mII9H5cebHd3Nllj5b/31pK5DaI7Kw2oWNcmjn6UoN6M
         yxQw==
X-Forwarded-Encrypted: i=1; AKwUvBxNolJzdjPxGwpW7e9VDAp4iB7S/C0Ud7BAKkFKhEkHpY7Cj/B5NAPqyw9TRZr5Bp5yhb2ZlL/rhhEA6+c=@vger.kernel.org
X-Gm-Message-State: AFuF++mDIzM7TpN0J38dnoG4nj8j228or4n9w0MwUiL7h1MSlNJjwvDa
	noGqlTyNd3upUYn9JYmpMjRAJUxeqh3zNoeQ57BQxjN5ZgLZAaRlgb3n65wHWTu6Nmo=
X-Gm-Gg: AYBFou3qdcx53nM/+X8DALIlRt8dd3vhb0ZLZu/U+C8Iw/BA/IeFH4KjHPeLFyQwQXc
	UywpxV/27OoWcGNr6Kw64UPDQyFo74tCTjq3EbU+Y+Tss64ERLtxUzjN6TZLHiyF3WWzCwDiE2B
	2CxpnBvMsr7JgCKmuE0LrZPRF/avfxdN9GoHIhw3GUZ31TCgpzMGYTnGB60w6WfeSDTvS7wKPoE
	iMqlt43XcBR0A4W6ia3uRO0X+zuPAjyS1AceKxb44ktPwbVQQkrpjnHiubDOaQAdaa+OsxEb23E
	zy4vvo4ogoo6FVipRDelZfnJMkWKcwxxDGlSLJC/WgUgCiuCIw4idfCVsxGj+4/Bh+tMeRXaesl
	WkSnWHA3pmitV+2epdwK0pWT4XGL9jLRnYzjXpfb1M7XdLiJ/gVl0HsmKxAEkXMh+oVDH+i/1Lt
	szWkbZthuoPPH6wgfld6K3Sdlem+Ic0Nx15iv9XDZ+2ee5oO/4N5w/ysMJzjua5bs8LWDhWUVid
	HgP0ByiMPZ035xHd1fXpXyaXHXOsGq1yysL1IwNdQ==
X-Received: by 2002:a05:600c:35c5:b0:49e:7d69:83b7 with SMTP id 5b1f17b1804b1-49fdeffff85mr48917285e9.13.1790172401441;
        Wed, 23 Sep 2026 07:06:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b01f:2334:39d8:9506:1776:f780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm78087455e9.5.2026.09.23.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:06:40 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: [PATCH 3/7] drbd: raise the socket buffer size limits to 128 MiB
Date: Wed, 23 Sep 2026 16:06:04 +0200
Message-ID: <20260923140608.1116713-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
References: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sndbuf-size and rcvbuf-size are capped at 10 MiB, with a comment that a
larger TCP buffer is not useful. That was written for the networks of
2008. On today's long-haul 25G+ links the bandwidth-delay product of a
single DRBD connection easily exceeds 10 MiB, and the cap then limits
replication throughput regardless of how the rest of the stack is tuned.

Raise both limits to 128 MiB, the value DRBD 9 has used for years. The
defaults are unchanged: 0 keeps the kernel's auto-tuning.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 include/uapi/linux/drbd_limits.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/drbd_limits.h b/include/uapi/linux/drbd_limits.h
index 65d3ebf2437b..4132b619376c 100644
--- a/include/uapi/linux/drbd_limits.h
+++ b/include/uapi/linux/drbd_limits.h
@@ -87,14 +87,13 @@
 #define DRBD_MAX_EPOCH_SIZE_DEF 2048U
 #define DRBD_MAX_EPOCH_SIZE_SCALE '1'
 
-  /* I don't think that a tcp send buffer of more than 10M is useful */
 #define DRBD_SNDBUF_SIZE_MIN  0U
-#define DRBD_SNDBUF_SIZE_MAX  (10U<<20)
+#define DRBD_SNDBUF_SIZE_MAX  (128U << 20)
 #define DRBD_SNDBUF_SIZE_DEF  0U
 #define DRBD_SNDBUF_SIZE_SCALE '1'
 
 #define DRBD_RCVBUF_SIZE_MIN  0U
-#define DRBD_RCVBUF_SIZE_MAX  (10U<<20)
+#define DRBD_RCVBUF_SIZE_MAX  (128U << 20)
 #define DRBD_RCVBUF_SIZE_DEF  0U
 #define DRBD_RCVBUF_SIZE_SCALE '1'
 
-- 
2.55.0

