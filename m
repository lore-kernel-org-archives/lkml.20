Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199705;
	b=IQ6jEJdyU9JbLe+SRon586GdsIozDKJ7bHSnwBQsttqZBgPGT8TpciLOMD7BksiLM7OW
	 L5p1tOG+7mrceoscjAyNrBiNinbfvmdhHyuPBjrSutO5R6wtfYDqqX4I7PKZlzB+adS7d
	 l4i3TShh8qiZRBX8SGJ1ezyBDIcDIiWcW8Gu5GVDjU0YaajTCf8l4ZfKngQ/wocihs0Cx
	 szBwJOST9RM/3BeQ7CS4pSiMPlKCWl+xAMeJDKHl7T3bnwIOGKcy+cXla7/P2BFWDHlx5
	 j1nVNlAraZ2AjFQTTkBEBYN75AAbMV/KbL27cX9QrNdGdTyIbwdjyWYXuVa2ub14JRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=31f6k6Qk+dLIN5aIDYfqU1+fJxCFB196QGT96yn9g4U=;
	b=EsfulgbdqNfcAWGLXpiYMd27yOdGo0h42ETIq7F+ybzVhGFdoru4rfbt5Wwz8LUgWO+i
	 P2BYHK7h1fqokdMx1GM+r1XmxQ88lyOBX8YNhyPgF9Ak75dBLCw8pVDsrw1hkkfV1u84l
	 Xx8NV5r1TV/CJrMSiEn3hZ48jdcjnNxY00G0CIrpUwcwE+h3Vst9jq5nmCf2A74EHi+Ju
	 PP9GoqBB+UH1RO+qLDOhCEVjluEJWN6zO2zoO9mWQuh+JzCWOQShKdaeJ7TiDUDj2LgH9
	 ojMMGk+Q6SwYXZMBYfJ4xx6TxbEh1XTUJkypPpzfL0j7sQWQc/aCPjk94WVuGSpybbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r3sNAAXt;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13F9606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B13F9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r3sNAAXt
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5b7d5865so140892f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199703; x=1793804503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31f6k6Qk+dLIN5aIDYfqU1+fJxCFB196QGT96yn9g4U=;
        b=r3sNAAXtYs2FC/jtFhBxipQFUpM3FslY8spcfNfWA01UUVWzD4GMailvz4SifQgLun
         UL3i8TTTAPERxcZFH76u9T0+NR6kZvfr3FiyZk+MnlGSm0Vy+0Cec5oV8UoIvIjnwNnr
         lBB/Z3n8RQua4T+hRhIotsduSdFQP50yFF2JUnTNMPWz+B+mVzKXGkm0FM/veDc6MMMw
         qPjz0pzYx4OXlKUfucUgj6eNHDHneT7BrQk/0xME3zo7vZZbucRFlHwweMmoYrB3Pb0u
         fT44eTdA1Jved3FeIKDE5uZkNasdxhW2M9Cpd9EPlbQgDKCtPWXKvNDL4/vkCiHpY1k4
         Lx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199703; x=1793804503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31f6k6Qk+dLIN5aIDYfqU1+fJxCFB196QGT96yn9g4U=;
        b=f7eMw0cVQz1vH079RkgBN4kUauhJGqxDHJcYhsrv9mZdh9KbFp2bETrYnBcAFk1lfF
         GjP704eFVIc8jXZykRcUYvRa//+Gs18Vt1JyYuQgQygJI8NJAUSdcG2n95YRAYh4t3+2
         C9xpFhXkGPYINNSYBF+CGO7raDMbG0nozep3h+VR3g4CcgSMBQYVvc70+plgHD7UAM1d
         mn5UDYIi9wSIswhtE27pdHBnHBIKJBzKSOdMo+UaxcoVNRaBXArisqFy+AA1wNpUyMI2
         9BFpIb/iPAvQ4bcmD1a0FhEPmnp1TK+t9utkIOfup9lMTZnXyJEHfHL5GrpcoX6tMYuC
         ITGg==
X-Forwarded-Encrypted: i=1; AKwUvByaqEaEFsKOcRmkmGZw+j6q7IFgDAcWgJFrB5WeUYbP9dKC4omuLG3V0JPI7r4+RLxI0upnEGczEMuqfBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk+dF1k0pb51oHCRRmp28mk7lU1e+yyv5OBAMFE/kSoDFYkLGU
	R1XGM5Ecnc/aUPFh9giKtQGBoRBHCJLmE4mlse4h3I1/usWdeTnASCyc
X-Gm-Gg: AYBFou0i6d+WSvg3gcFODHd9/e45KJBPvymxJdTiydui8jSpcA7twESnNsEIRw+khja
	rgbmZ9Gucrs8j/esbk54W3alzGxdfPz4mHnG1q6Gy5OQSnvdVR9r4qaBscsTzumJ3AImgTv5DqS
	5T7E8w2hQso60uRqW1gh5kOx2wKgCVav87I0hmWeh8ewpX5eMunWPRlpZH0UoBDpcSsLRWwARQP
	wrPoiJXnDxt7KYT29+S7OXomi1TlLx8yrMieecpOfzUQyla2ppwx7kSYk7SaII5hJ86vrLwfcbh
	xvgagZuQig+GJJKNFGKqFKK9Ys2dZe2jO4bbf4P2D/lN/UgGOOzhiTCflWX86cVpz0dkbhnDkfp
	DMmKGDSA/FBnBuHTUh6U7ciJNbBjLLGpdGYPFNN0gW0jjDrNHi9z6tsEG3SdGXxrHNZkYJio5h1
	zOGwEK6+0tjMZkmQwplDSK7yznyePMn4hNuNIorZCD6MtzomVrg3uKfSw18rC3jRMHCiZK5bAst
	XWaZD79bI7xh3RvTlFPhI00O3x54/XaOLjVCFZOI6FCFk5pV2S3Pu3FSrADA9IcRfJm377VhSSQ
	9EbrWDyiNU/qJagdB+rZ/CFJC/FEgjVDROVVeQ3VlD6shf8PiwkIOuaAsQrYP7diCD3YRlU4065
	MFPowLZdl0kiMovu8xT92x9ZAgfPrj9VX3wenuX29KOg=
X-Received: by 2002:a5d:4584:0:b0:48a:f41d:83c with SMTP id ffacd0b85a97d-48e5d2cfc69mr4811478f8f.0.1793199702768;
        Wed, 28 Oct 2026 08:01:42 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm28951293f8f.34.2026.10.28.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:01:42 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oz Shlomo <ozsh@nvidia.com>,
	Roi Dayan <roid@nvidia.com>,
	netdev@vger.kernel.org (open list:MELLANOX ETHERNET DRIVER (mlx5e)),
	linux-rdma@vger.kernel.org (open list:MELLANOX MLX5 core VPI driver),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net/mlx5e: TC, Fix double free of branch in failure
Date: Wed, 28 Oct 2026 15:57:02 +0100
Message-ID: <20261028145805.54595-3-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When allocating the false branch fails in parse_branch_ctrl(), the
already allocated true branch is freed but attr->branch_true is left
pointing to it. The caller parse_tc_actions() fails the flow, and
free_flow_post_acts(), mlx5_free_flow_attr_actions() which calls again
free_branch_attr() on attr->branch_true.

Clear the pointer after freeing it.

This bug is theoretical and was compile tested only.

Fixes: f86488cb4685 ("net/mlx5e: TC, initialize branch flow attributes")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index b290beb4369a..c40c7b55a54d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -4005,6 +4005,7 @@ parse_branch_ctrl(struct flow_action_entry *act, struct mlx5e_tc_act *tc_act,
 
 err_branch_false:
 	free_branch_attr(flow, attr->branch_true);
+	attr->branch_true = NULL;
 out_err:
 	return err;
 }
-- 
2.53.0

