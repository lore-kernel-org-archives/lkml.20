Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C56284880
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126739; cv=none; b=JgXodkiq88CbLZ9KjAyemvH99xlZBSP65KdaTQT0ngUzUkfEDLz587kzb5KhFVIyPae/PuuMgcwkR79mdyxXsxIb8dL6AtSdyzGFSQuD2cNm6IL9AjvzWMi26ZtY1+SQXzKOVnMHBa11n2M2Zcq3ZsL5VlO8okwXz43/YC+OQbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126739; c=relaxed/simple;
	bh=a2BsZE6dv+6I+aTRbpX17rDQThX3Q83NqPSPwlUFrFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nKHHDd+feq6G6m8kjo42SEKO0Z2A2UKrr3wp+nsN/6WL902/ZZj8RKTMrTjFQdJKGOBi2SbC1suAPSOjc50Bav6kgLia6V9ovhSPGneh1Z6OILQd5ww8a61QMdDudVRtktCsRhtnv3brK9RKvmmwKShFyezUsgaZAZSe04V1HxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnxlVo9G; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnxlVo9G"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-930c0f9c1b1so635765485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792126737; x=1792731537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygeSD0sT4ambcFZx7uodzqrYQ3oDSNoYKD5DO2Bfnek=;
        b=JnxlVo9GK/SxFWH83zIzE7Ln92P7qT8WzoJbKQaU5MxKnuGFIA6cF4tTHTABGoI7dS
         4G956IwfIP0jBP604igZtoy+aD5o9IuIUksGcAfYrYDGR/uY4qb6frDVuPGQMzN9meme
         ooWgXhfCKaPWCazuQVC9PvVbUjfBDzHOW+/vtARIaqZZRwiFfNwulsNqOv9X3JVaCjlL
         /OvuPu4GuGKuoe7SUCgagj5l5/5i1No1/wg8I05bI02/8OUgV8ECZ+vgJoAOgN5ASe6j
         UvF9x2MASDV0K1nGkJf+5+NG2VTxn6I6BjRCZJSPu7j9DLw0YEwbjq5jXWvFhJhEjnpQ
         adnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126737; x=1792731537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygeSD0sT4ambcFZx7uodzqrYQ3oDSNoYKD5DO2Bfnek=;
        b=IEnTaPXa8DlM19Up4h9HXyMUonjjjUfvttsW6trdTj+XIPxtP5FC4+tii+1yTggoe/
         5loON+xpsk/Wlv9gn/xglKD6vn8s8MXrPKPm/qOqArXjD4L72dq7KxJnw5fSp401E7Br
         2dR13KkldQ8e0DZzbIdzXYd+gSgVu9LBLuUgkrVh8djjdprhDiI1ebIWLQbGLc00oLpa
         TGTiEN0u4YRrs96bwOEOJllbNrSAiw6PTTMNpFDHHrv6Bt4Wb0VgO/Jwtab5kWBWDf52
         AdWmDmMbMr2qnv5tPHPr1itDclrH1c2NHEQMUO4gBTC3qJ8uSAZqrrRkoIdKJ9p0Igc0
         FofQ==
X-Forwarded-Encrypted: i=1; AKwUvBykS+XrTN6DEv2ssKi8DLfHAzp1eqy0AHI6UqXP5Fid2ZTt8+uLdITykCd63sCbcAWZoitZDXzte6gmQ3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1M/Tz3IsQ2kipupBbN7TpQZTfNe+6c2fcdLhCadJ/akNzOYRT
	0cENKs86DuG3heV9IaOij15LN4KxBuayhJClXmYpM1Zea9h57UKQz7X+
X-Gm-Gg: AYBFou1PhcRaIbiTnAj4RNrXUjZjwFZy/7GGnsEZggLxnYUT5XvcKDUDaIQ1b9Yqo23
	+7orGa5gQahXDQEqm/ENPE2oc6u12jrdYfvt3fnoDzv/zA3e3ROJPtHxwa7Sh+22ArqhjG7nSb2
	L4TwnL1My+z90oWjjZuCn4CDl9VuWN5Qp1ywi5wu/phorm9kX6kN8I9AkkPAcw4XsSYwRUGydt5
	QEfa839eWyTN/PtDG4Lx7ZcTlEwvf8o10JH+desLi8gEUjmAfAjQsIxMFXS7JfX8HuByGDzRG2z
	vvIA2KS5/DC9MLi19JbbHjnm7YuQkRYX9lyvTICYD+Kgp7gY6ABnc9OIx/vVDxeoUiRaGGLfdLt
	euePoF9EbzjPjovsF4BC/FSFYoHIoUUmAUIIFUKRubjMCaIIrdsYna1bqVjaBRoQsrPLVXbhKcJ
	nDKrbUq+/fyHWJptcAdcGbonUhCVPpm1uAGtAT7co/iEpxywnbDnbM+73yBH4CDN+qrKOhQEUtE
	sZMWJFePWlKYcan/j37SQ==
X-Received: by 2002:a05:620a:470b:b0:93c:2c0e:7ac with SMTP id af79cd13be357-93ebd259cafmr2987788785a.53.1792126737441;
        Thu, 15 Oct 2026 21:58:57 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a198372sm118038685a.27.2026.10.15.21.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:58:56 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ariel Levkovich <lariel@nvidia.com>,
	Jianbo Liu <jianbol@nvidia.com>,
	Alex Vesker <valex@nvidia.com>,
	Yevgeny Kliteynik <kliteyn@nvidia.com>,
	Itamar Gozlan <igozlan@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH net-next v1 0/4] net/mlx5: Don't free CQs whose destroy failed
Date: Fri, 16 Oct 2026 00:57:45 -0400
Message-ID: <20261016045849.813696-6-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mlx5_core_destroy_cq() can fail, and when it does the CQ may still
exist in firmware with access to its buffer and doorbell record. It
also returns early in that case, without waiting for EQ handlers that
may already hold a reference to the CQ. The four helpers in this series
ignore that error and free the CQ buffer anyway, while their teardown
paths also free the object that embeds the struct mlx5_core_cq.

Keep the buffer and the object that embeds the CQ when DESTROY_CQ
fails, as the regular mlx5_ib CQ destroy path does. The HWS send ring
CQs are polled and never armed, so the HWS patch keeps only their
buffer rather than passing the error up through the queue open and
close paths.

The issues were found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. None of them was
reproduced, so this targets net-next; I can resend for net if you
prefer.

Compile-tested only (x86_64 defconfig with MLX5_CORE_EN, MLX5_ESWITCH,
MLX5_SW_STEERING and MLX5_HW_STEERING, W=1).

Yuho Choi (4):
  net/mlx5: Don't free the ASO CQ if destroying it fails
  net/mlx5: Don't free the WC test CQ if destroying it fails
  net/mlx5: DR, Don't free the send ring CQ if destroying it fails
  net/mlx5: HWS, Don't free the send ring CQ buffer if destroying the CQ
    fails

 .../net/ethernet/mellanox/mlx5/core/lib/aso.c  | 18 +++++++++++++-----
 .../mellanox/mlx5/core/steering/hws/send.c     |  4 +++-
 .../mellanox/mlx5/core/steering/sws/dr_send.c  |  4 +++-
 drivers/net/ethernet/mellanox/mlx5/core/wc.c   | 17 ++++++++++++-----
 4 files changed, 31 insertions(+), 12 deletions(-)


base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
-- 
2.43.0
