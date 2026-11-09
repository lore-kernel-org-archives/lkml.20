Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195944;
	b=mYZ1M1+bNZYfnQYrOwa0ida3+eOunL/RKaqblBjJypB7RGd9y0i9hyKu5OChprH8CfsG
	 VRmpS48pGibXN32vXd8vB6x3AA89PevwKld1ss8QE8yr04hfVxIY7g3gPuqUjtOWbFZPL
	 xj/0mp0sC4kqMdlYghBg3z6lwUNQcxJyDcCFOGVWInbo0PtBEx8rr4sGz/CrR7n7Gk55O
	 3bPpu8ioszfGLncb0h0kUnamqzuyZf1YVkFPgFQcqio044eHgmzjvcneKOgNN0qFNHWQQ
	 cuV5LEEv640K/rQiXkUQzFsaV5k++o9poF5FhcZOMo/KKG6/IfDgxfAXdaEsWbJwZhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pgnpxv0RoNPV5p8XWSvBBpRKwBTfMqOXLtDwjioOWr0=;
	b=xl+lgLPALg2tB0PeKCngXfLouPHKvkaXJ//L3FmuV7Uq88aUXUD9X9Od+AXAKmhIfEGG
	 qi8NcSkLhby6VRb+2Ln3YINP9xS6c2ZhGUz8vaiG/H2Sq9pggQBquTTUI7JL2BwCzt0K+
	 +ys8OqxVrFIlEMfeRh+NxYiaeSbfk7d+xJBWNFGauQkWIJJodGYvCZ9/o8MFo087AnkiF
	 HnTvIUiEk3A5SE9Z9vTb0RYSJyq+dwnS0TUMCTAHV/kc1NYX/nQvf+EdrMyL+Iy4Wf5/t
	 BRCGdYXQFD9+Z8u9puBfzS0p4IrczmvVm28494SBuFvvgTBdXwFd5/AS5tLjhkQxTqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Khb7yAbc;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E90F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Khb7yAbc
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so152869c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794195942; x=1794800742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pgnpxv0RoNPV5p8XWSvBBpRKwBTfMqOXLtDwjioOWr0=;
        b=Khb7yAbc5rELj+ohLViY7jPfHoj7CtrDp9eidzJyaqonSb+DwIv0qXBpeQ8gMTgDph
         HCxbImG6Ng008il+ZTRpkr1d54Pyi6TPFTAvIHeDqR0oteMus0YMPewI6u2bEVhZtBZZ
         P1TYj/YTYFBOT8XxDx1JrVpC2Fu8CpQfRnVJNRcpdspOelpJKXoKK+385iC3p50ZGx1Z
         sxWaeFiRnwKSAs2N+JSWKDE7qlW5NM1p0S6nA/U9c0I8lGilNNpmMCdSLyO5ceFcWwoC
         +VRecQ/tSL6iqt4eaksFmIMWmLWWPJN0GwAFX4mc5k6Iwy0E5Cd3GGQ3HohljwBEB0Wy
         +Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794195942; x=1794800742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pgnpxv0RoNPV5p8XWSvBBpRKwBTfMqOXLtDwjioOWr0=;
        b=ffv3VaDYHA1V7af4wYY6z2mkU1FRDGXY4vv+7wEQbOEcEqqA6PoxAY72YfTj1D9GxD
         YrXYsVv2DYddef2lFYZ5IPpAeuziu9/pkzZvJ3NNrDfABuGXWTHSxNJJBokqiUJk+eLS
         uiCqYQ/ERla79NibL2sC/LavEHw3+HGE/03uon0Oc0DGL1e71rnda0MLODWKfyPYaDoR
         IiOZcXcuCjezCOM1nRrsyQMgHXZfLhZuiR7MAWQEjzSpAcpz4QEiPoFFWPRAW54wLrXE
         379gV0zvDs26jvxsAZ3LgVJboZZBuO7nq9YxZLtSWqfwhEAJwU0OEcLL/JzbZXBQ8Qiv
         ahcg==
X-Forwarded-Encrypted: i=1; AL+hErFV4b0lP7Np5TqwD41TSkgpdo6q1E/3XJxrXQmCoBS3v7as29GbXnVa2NNbQ8qV/d+nmLugdmFr+mQEclA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bTflnwvtZfl+1TRStszpfyQFcvpE7qu4QKTP3S/ssonX/684y
	6Loi73QyTHM//Ob9ctKKbYC0XKMpNUqUCR50L9TJ4yAogwpSfpOP3TBP
X-Gm-Gg: AYBFou1kAKpy9LF/jMwKBpZTOYlJC/D3AP9ZLevxIlB7cUNXXcsQkdHSulaAGY3F1qM
	22F551o3TixDx5DOU7U/DAhUNZUUs15xt91/HKR8NOVSb4lZhUaTnSP/n9i873y3VWUC+1jqL5q
	ZLfx6E2tspvTClixbbrVXQ9ajJqCVH34XNbV3E/LIV4EOFmg7BlZiVzo/c31kvHhj8qQzmXIZSx
	6g0k8hSXNXdiUwJL4DZ1lBdczvXyUMoNZRb/eREhfDhtGVYfl1ZwP0GS0yqA2UX8QS1q2jubI7e
	ZFa1HOtaJhSZtAoH73qifUML4AMZtLapbcs7r0RJy/f55iTke88Z8H0wJirYHBrDXVSpGZcCTAs
	txY4fe8Stg1tTeffrrm/7eD/UoImPR4RbEAOyR38BeZF1jGvjx/03mmy807ht2iFQ1vnnAsFB9S
	Ctf3FyVu921/CsMFZKzeUB3z+CHaHqcU+X64s7zXOIk3ZZeGSCMNsx+9XJO89bVPdJhPcA6pcwY
	LlqjLrJrZftsJNKSFEnns4bqQheudAvDIdgRE9Gx4PK/Mzfh1V+tFMBCBHfRoSPIsbpTHh59U+6
	n+IUbS4veKNYkbB0zZuq/Y5X36bhLYq4xhHb0hAoPpWNMw6qmUQCdkLUw6p38tktolkc
X-Received: by 2002:a05:7023:d07:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b3ad63ba53mr1375561c88.22.1794195942220;
        Sun, 08 Nov 2026 19:45:42 -0800 (PST)
Received: from localhost ([164.52.124.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm11468146c88.4.2026.11.08.19.45.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 19:45:41 -0800 (PST)
From: Jiabin Deng <dengjiabin2023@gmail.com>
To: netdev@vger.kernel.org
Cc: Dragos Tatulea <dtatulea@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net/mlx5e: SHAMPO, Disable end padding when relaxed ordering is supported
Date: Mon,  9 Nov 2026 11:44:44 +0800
Message-ID: <20261109034444.11241-1-dengjiabin2023@gmail.com>
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

When SHAMPO and relaxed ordering writes are enabled, aligned RQ end
padding can corrupt received TCP data. Due to reordering, alignment
padding written at the end of one packet can overwrite data from the
next packet.

The current RQ end padding selection avoids alignment padding for LRO,
but not for SHAMPO. Extend the condition to SHAMPO to prevent this
corruption.

The issue was observed in a two-host test using a BlueField-3 NIC and
an NVIDIA H20 GPU. In the original test with MTU 1500, 354 of 400
transfers contained corrupted data before the fix. After applying this
change, all 400 transfers across eight message sizes from 32 KiB to
4 MiB, with 50 transfers per size, completed successfully, with no
incorrect bytes or corrupted intervals.

Fixes: e5ca8fb08ab2 ("net/mlx5e: Add control path for SHAMPO feature")
Closes: https://lists.openwall.net/linux-kernel/2026/09/15/154
Link: https://lists.openwall.net/linux-kernel/2026/10/20/1322
Suggested-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jiabin Deng <dengjiabin2023@gmail.com>
---
Changes in v2:
- Clarify that the corruption is not specific to GPU or DMA-BUF memory.
- Explain how reordered alignment padding can overwrite the next
  packet's data.
- Add Dragos Tatulea's Reviewed-by tag.
- No code changes.

v1: https://lore.kernel.org/netdev/20261106083719.22798-1-dengjiabin2023@gmail.com/

 drivers/net/ethernet/mellanox/mlx5/core/en/params.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/params.c b/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
index 5caf7820a136..159f79302a08 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/params.c
@@ -911,10 +911,11 @@ static void mlx5e_build_rx_cq_param(struct mlx5_core_dev *mdev,
 
 static u8 rq_end_pad_mode(struct mlx5_core_dev *mdev, struct mlx5e_params *params)
 {
-	bool lro_en = params->packet_merge.type == MLX5E_PACKET_MERGE_LRO;
+	bool no_pad = params->packet_merge.type == MLX5E_PACKET_MERGE_LRO ||
+		      params->packet_merge.type == MLX5E_PACKET_MERGE_SHAMPO;
 	bool ro = MLX5_CAP_GEN(mdev, relaxed_ordering_write);
 
-	return ro && lro_en ?
+	return ro && no_pad ?
 		MLX5_WQ_END_PAD_MODE_NONE : MLX5_WQ_END_PAD_MODE_ALIGN;
 }
 

base-commit: fafbc4051123d5459ea6950899cec08ed946e278
-- 
2.51.0

