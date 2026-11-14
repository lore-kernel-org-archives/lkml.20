Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631429;
	b=evQUwVtu6+KPMlIyKVqMQjIYO6tTk7G6dbwnbUBbrMuRzjjcyHpFWcoNJ7EQjkX4tcAC
	 lAwY3k4C/+qc4SO15QeaGtW4nu+kQOGiP2aYswgQJFnYQVQbnLECEhAzeYrcD8+AAgOv9
	 OQFNmTVFI3lkatbOplwyAM1PfKCB1n2E7924v30P1yscHK6EH4IWYsE8oJkd/f3OTDXpZ
	 rk0qipuo8YLAXfZso34sQQBGKZkZYEd1cDLVEyBcKLTDVD/Ml2yDXdpaYiW8IGVfBYGGd
	 up8X06aQDOZOZKbzmy+tUVQ1w53f30stsedNJbngZtUSaARvkDqy2POTWZv2FFeLiNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
	b=Hi1Zf0OKk3AFoKAXrqEHzsaL5WppNjOZW2BiMLQCdElcIwsxdL/N9wk6BiZL8M5dg/BN
	 GHxCdbh5W6wcxErdGOjPHiSqKUzSr5sAm8Z0HZSaEL0UasFEfEZqB1kWMVRfq8zA0nCfz
	 UOyHZ94N2hzQT+RS3AKIkCrHYQiLrG4E4IVwa3PE+IzFXfjX0Xzl6tV2kXyqv2X++WMyo
	 foMmYxu/aKtLzBrfyOBAp9Qe25tcIIfNgF3euEQSSCFEtx84VDOZqSg/6nTTqB60vLZE0
	 jx5lsCMPS93HvKpaiiGpRZa1acJxvEiqnQdeEB97hO70qUj+EbrF7rx1hk8dsAQBVYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVQQWG51;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D562606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D562606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVQQWG51
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1992336a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631428; x=1795236228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=mVQQWG51WxgOyi4sW25blqBdXCGTiMv7/Kx8sS+Sp84sDdOvRC2LuWWs/y5MZbLtVZ
         fkYAR6NnuuODkeM+bcK5SWsOovSxWyQrWg2uGFgcl0byI7/buKlpZ15O1aTKjrsTlHDK
         wGomNTdxRSDsSnNTDC5nl5FnjNjceytlZrIDTZxFJeJiWPn28e5Vwldns8qHhuAYmfov
         5n8JDwnQwxoioLYqMrQh5J77hjKGCChSrlU5uvB/8MaZ3yOg4vDcdqf2lgNh7Pu4B4Be
         wnuwD21MhMrIxC24vF+X54a5HR6jUN+WLWRX1NTCCWW9ZkPZqgRTW3J1VK5xTCmaNHWf
         dqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631428; x=1795236228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=xlrtYJcyZ3oPG5Mx5DzVbU/0Ht5+62YBqM3CWlvdxNWkS4weXwsgD2e0v9DBgmyseS
         RR/tbukQpPPH0Aahqa3tIxOVKLhZGOH5+xO+hrOcrumg6ajW1RW9Rmj/5gH5MXX3baUa
         2XDSJmRcY3A9ZLmAfXzmpTMJiWV1JpWPbVYQ37EP3Bwv8kS03TVTZdAIpdvmGqOnG5A4
         1wEUd7ZX5ML+6HPqkdvHRmBX5RyLAeW9jLh8+lp9OLV7xwlXrExT7AhSdHFFuW3rvZ37
         iuhcPhPYnHx81l5IirdTu8uFGdBjHxlKXpvv2ywgrm8WKurjBmV6gt5qOQ2hW2avmXQX
         nmrA==
X-Forwarded-Encrypted: i=1; AL+hErFHT+Oj3oewWrRK6fboQSYKqyC7Ep/rgQtsWa3znd11B+jsntdZdAoDP/J3xGxtcUYgBmPAkd5SqMQY0R8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T4o74Z9Xa4kHPzlLt0ZAv7cTdgAtfhzEhhUSoEKYuQXs7B/2g
	REdyIISenRmY7oktqDE/8k60AS8sl1045cSrObwoTPZMA2ET+Wqs6CBJ
X-Gm-Gg: AYBFou0ACQsJ3a/eGAYFwFTPy/VM8MT8eBimaHr9iye2FrkY+p6aB57elK99voX5W5F
	8h6GWDTInehwv/fSoa9Rdaxo4qRgCsj6Z6ftm0CFtQW25NM1KiiCQerIDQC7dze0BrV5s7RGJO1
	v1FSqwP3rPHd2MfoGVWyxV6TQXUasOA7bjKZdwvE7iuytnczFnDW/14TkYAm5ZQFpoKneLXSd9z
	HSv5rDB6k+sCF/C4A8rcOAjNjuP3clsZqCBuJlq4HyIjtxWdhcNl5LbdfcVLz+C/15DRRQyMJWE
	eLVpToE/U5UV22ZtvJZfvSJ0L5jFJQY4Nk31ZmmdYbm1xz3BpTgNx967OTMoWsBBz7ZOnbpPKkU
	CGrJvTgz5Fgk8EHpJkb+BDl/PmpWHewXUEPo2CHC2ZeHS1NzCU/9NsiQk2CVSk+zOQWiTLi3w3p
	uIY72cXfOlT1P3AJ/RVw/9mnp58UeYtd4a+vdlJm/qNsX1ofE5kEfXZaWPtj00n/rYYANyev3iw
	BKYMHUKeLcJiOPqQjQRdj/+FkSN83Ce8vQ+/bACJn3fSqTlUAyAB06nF+5S98qGpjWt37ic0vGs
	Jrr328M2VK0nzMSWcOfUlgPFZzleAiE+DlI=
X-Received: by 2002:a17:90b:590d:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3b1b087b76bmr4366544a91.7.1794631428549;
        Fri, 13 Nov 2026 20:43:48 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:47 -0800 (PST)
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
	vladazaharova2018@gmail.com
Subject: [PATCH v8 4/4] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 14 Nov 2026 11:43:04 +0700
Message-ID: <20261114044304.245684-5-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114044304.245684-1-vladazaharova2018@gmail.com>
References: <20261114044304.245684-1-vladazaharova2018@gmail.com>
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

The GSP-RM log buffers are exposed in debugfs, and with gsp_keep_logs
they also survive a failed probe.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
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
2.56.0

