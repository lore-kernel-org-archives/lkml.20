Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283078;
	b=uXlKHL/E1G1rD/BIcJlylI1JM62osl8aOUjr3AZWH683fEx04UeiDOO+3MIjzri6z8G0
	 gzwZcgCVxbhYQawcjHzj3ZMX9+FKomsLbfPpv8vMyH6zS837w8vVHonFQ73fASlYwDWp3
	 KJ2MkiSHsJEx/OJWJI8LOVm2P59uCXvwhEdoIvVH+4I2Rtp6mV+V/I7JTssXNEibN0lSz
	 u5zGML7oWam6k/d7ucjLuUuts7pp7jhYvxiufKLkhQe0E8ZYMQZfYUtnXdecW53XxEGE2
	 pliJ0Shtvxrf7CHjYg+sjnCU4BHQGBN6g97L2bxJtZAHdfgeGH4j2baf4fW9rBuMPrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CXkr2SuKnzOJFNr+1uuWJMDmIGWuxbgW0PPb+hSRh9s=;
	b=Rk1RSGaDe9Y9NOb89agjTUIFJYAa9WegzBKxzf/PWZCLOdvj2SW0cSdz2AYZkByjmrhe
	 isjQT4HSbgASl433LlbVn7ljfAbMdK1e0AKuyY1rB3JjTv0ds5ZpoqrttlqGc3xTyfe0j
	 ZpG0Rd4NsEbKlUTMZMRxTgGZm+jwm7fMsiyDlRw8Cbts4Jaz7hzo6ql5S2OyJ3TcgY47a
	 UzJItiVfcVQx5DBvaa3q/FFEOEWY1DgtRQA4S+HEPQKWQMGgTWlnvZS75IHVVLw5AhZV6
	 Hi8Vl5fmePMayY/ujV7Vat6GroO7LI/whjQ+MH2964746e5n7W561LsDKsfpT+yODnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWioS0GS;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2434606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2434606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWioS0GS
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so478995a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283077; x=1794887877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CXkr2SuKnzOJFNr+1uuWJMDmIGWuxbgW0PPb+hSRh9s=;
        b=eWioS0GSjJlvh6ZHCBGxaaeRsfQzkJcz33RP+AaoFNuh3hDMddsz7w5znvRQzJ3Dls
         n+Fg0ZOheqMQcJc8Q1ya9lPIqyKWWgjAjKOQmXd7s340JImqVg5F9F4RUxdITsykRs9P
         jV9CUDMEkySfso4mcRKycLxZnApuuoxPWjmekbsYqg2akOLS+2tbI/jH4KehIv7IwDb6
         2RaVvTZegBY6dX+8qAyKHxsHqCSZ0ti8aBCLCPEiAimi4Q/mU5i3/x0xdSNTeRataRu6
         m/ZMf43HMHWsEfeym+ATo4mX3nBntTDnUgOq+qsJJZJUEPkrEArzQjHCZxTFPZYI6sBO
         676A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283077; x=1794887877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXkr2SuKnzOJFNr+1uuWJMDmIGWuxbgW0PPb+hSRh9s=;
        b=DwJN6VIBJRwf0Madpw0HMbp04c/SRCoCtSZZuj6RmxqqvY5mh2FFBQriAv7aaRcmRY
         I2CNgVvCbnGpWHzTLorP7ddjKIMDbinLg1Gca9ma69s0bPTUVgu0bAgO7JoDnApX73KD
         K+NOXtIubgzeUwUUvJ+rDNw92rJDoRw+K7elSqlnwRT7wr7ILSWAir0G3TGTqyc4H/rQ
         QLl11DR7cUnkSm9EvLi+70w24gNXo71IgsNdzP+uqHONCoDBSZcTPJm8N1NLn6mopHjR
         mQDoE3HmVd8K20+AJhoTJ9iOXhU/H4NqDaFUBHUbPDz7+TvRnc1arHMvkzzW7PZeAl3h
         PCpg==
X-Forwarded-Encrypted: i=1; AL+hErFwdZmViOJLTckET7iOBn9P3TqIlEjfLIa7Yuz/iRl14n1+VDdut268AerYPNgzMe77zsvAOYSQr0Lvqn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vepytXGrLeQwZbaKLWawpV3Z2iIkWfgIF2vayvJ5Qje+o2bbE
	uiO9M6lmBK4kpaWri1GULp6RSgNrN7BZJjignBy/zWwJ2m6aao83CGuV
X-Gm-Gg: AYBFou3hd/gcTqwyrvm74SvbRNhGU4BVayM3kMKj13rr1VqEUI1FgbfCExuzpdQXFI9
	HbacEBRMoDEgKNgVQMtuM3qRgCOwuuR36Trf42rRDkFkxUBAPb7+myavjg+07EXdEz3rHHoaC7l
	5qZUZxePkoK19D2k1hJBi62UTDHQyux2/0t7bYOl8E8JVmSXEbwe7KGDMHUU4/u+nd1r/nOuJn5
	guB2wDyPeA029Pz686FEl1N70sdjC/F8Qb5Fjj/QqUGpN9u3aGnmuyB66J0oI1t3RzFCHl3EpmJ
	H7dnR2I3MKgAlh5VUzYTBipP7eNwKuH4rnJ2vEnJSS+ZFRTm1plFrUy6Hw+HMc7S+TIGWl7toQf
	K+u96dOcov22ipz21bVAEkraJp83GoW5fi9KdLJsztqq9g/kOjk7qjycykpClNWBb4YpXRm1g/p
	Mfx6cJc4IrI/y9FGze38vRE5fusFvyJdtyP5fp1wNg769XGI32herq3VO4+w18tkbqjJTBdTgxH
	Lqn2uaUDrOKytdizVdJGCybio66XIDO7k5zTP3zMr+ubu5WIbgWzZMqsGsyOfuT9i7BqlmgXUw2
	16IS8Ob95EqhW1hOCIaBYbzEr/0VfiqkXoEoegsspgGjVGg=
X-Received: by 2002:a17:90b:4a48:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b166cd7209mr1698733a91.21.1794283077269;
        Mon, 09 Nov 2026 19:57:57 -0800 (PST)
Received: from localhost ([164.52.124.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7b37casm322833a12.22.2026.11.09.19.57.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 19:57:56 -0800 (PST)
From: Jiabin Deng <dengjiabin2023@gmail.com>
To: netdev@vger.kernel.org
Cc: Dragos Tatulea <dtatulea@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net/mlx5e: SHAMPO, Disable end padding when relaxed ordering is supported
Date: Tue, 10 Nov 2026 11:57:23 +0800
Message-ID: <20261110035723.26587-1-dengjiabin2023@gmail.com>
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
Closes: https://lore.kernel.org/r/CAFxp=AY2cVRQrZvB9WNnigbsobuw11NMG-cagHx0_V+ur2ToFw@mail.gmail.com
Link: https://lore.kernel.org/r/atZKOtjrb9HKSNHF@dtatulea-c5.nvidia.com
Suggested-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jiabin Deng <dengjiabin2023@gmail.com>
---

Notes (shampo-submission):
    Changes in v3:
    - Use lore.kernel.org links for the original report and fix discussion.
    - Add Tariq Toukan's Reviewed-by tag.
    - Cc the netdev maintainers and linux-rdma mailing list.
    - No code changes.
    
    v2: https://lore.kernel.org/netdev/20261109034444.11241-1-dengjiabin2023@gmail.com/
    
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

