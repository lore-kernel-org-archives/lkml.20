Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885226;
	b=B2PLoV6CirEHGSvFOPoMe4v6iEz1sHqit48IffqpyNGMGVx3mzsKqUxlze7eXGP0Sr45
	 JP3n9gMNFHNTE6eZ+DDCGJJmdm53ln+/CJ0zH2vJknJ2ZaW5qjan5BFH9DyxTJL91pfoZ
	 vj8Nsz0G+nCfhVqwEzKN9msxQNGiUI2EipF1zAl2XicsJNNf3MppNoBBh/6Hn0lfaj5Mo
	 CAMvlh+bPEWlJN7FJOj1HLKZqCqXu/D5ieP3Ksw9AwCcdRo6LBEAB7axKSd9jhLj3LG84
	 N63nAZZ2KAcwM2N+gbJqndpnVwMaxnDyYtJ4TMRYy3pkdWyZjk7sfZ0zvDvPtWnFwhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IY0HuO3BnkQdngef+fmsiBdbRJiCtWyfl5JCFdKbRHA=;
	b=v9iW//WJ28awya0NU5QsG3douP8ly8xff+qy03XsYmWq2EnsCI0GqfnIbZ5dnAPdCDqM
	 fFgEH0vpxpDdMODMNTpTZdX+u4GJto8I+Gbd8iICaotrmBk2hB9y5AVCpBU1SmZIrCe55
	 y4BzI3SLOlvIvx4xM2lLW2r5Nwk/ES5w3M51hyisdXiKwwWAuoH5Z9KO2u8p6DtqLco5G
	 UKIHahVoKcr+Qu2N4zF8ceqnmUHKKjvA7LGA87u3h9a4WI6FsZGi3xwDDMHcgC5/gnFTv
	 FZq0NI4OF8SuW+l31lLIyT0GxbNdwOoW5aCVRLx3pmgWg+h4z2GrdA+mEcsMVzUgpSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xwea8SFy;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B1606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428B1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xwea8SFy
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so36622675e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885223; x=1795490023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IY0HuO3BnkQdngef+fmsiBdbRJiCtWyfl5JCFdKbRHA=;
        b=Xwea8SFy6dq5YCx5TnEg7s7TjmKn3RqF93jEzkLGdlrO/9brrztpFdqVI3zCuA2abY
         C5ZcxrPW/egan/vtln8DA0VBQlou9hrZBAyZHLFcWYuyX9KsdoD+pQbqnKbil+FjArIi
         aqtPjSm30s9kVsKnV2dKjb1Ce7+Mj0IlHxRGwxrr4WxdzIvIGKNH9k5zl72mHlHnFqe0
         GhGESNLta3lH4dTV8UWrxy6AwyRgXwLnhrU21mlZ8fgFoRoviHfDHzX2M0jiyU2tsbDk
         9hJuHyoF8n4g3rEueOuAWyxSKEcJGFoUQ11d37hOSr7K2dN0YPG6t+2ggkkwkE+ygnVU
         26TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885223; x=1795490023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IY0HuO3BnkQdngef+fmsiBdbRJiCtWyfl5JCFdKbRHA=;
        b=gGH+fHURTijxVaXF6XW6mTQVmrZ7h4ZXVd8y1oW4xDY3RxVMxs73Wmp7pFNOskFTzV
         lPgcFKDqqMdE342hoFphq3BTUDdGVqZK8DrB04OgTMb7Y+BQqjy864GG1Sdf7z+EI8o8
         CYDEiI+eGOSFyhBja5LGyze9HLQfpyRuVb0JgQnuzHzJppDSyUSBwW+ZaUr4BLzKKoUO
         i7Cy7qZMmafWeAhxSnBWzDIcmDhOlJNunCs9cmts6Y10AEfmRYlGEaRSleIC7NUBbOFb
         +owVKnv2KEZAlsdQjSQBfLloAo7bSmZfnYeXC6KRZuwzwCJPP4Y7k8OUx3CgZUQh/PN/
         GpGg==
X-Forwarded-Encrypted: i=1; AL+hErHrSO1qCrt94V5oG3yhFrpB7ho4DcHRLAU8+09EBABPbsK28mxL6Vn2Aw6Fk/8ldgfhpyzq+I3i5cnNoKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z80AlULtlj8uj9n2uSH3vJT/NzZzwZfugjl2+pEqX9nRNFJkhP5
	9u8wVF+pudJbXYlzWWxPf7vFstCEJao6XIIXCeJqT/tdGv3sTHOfASaz
X-Gm-Gg: AYBFou12KtAsfRGUAmLtAeitqPJtBveubB0PL8MjSzPoDVVlOCa411hNXS2yNzMGMAP
	ILl+FPyZnx81ILT3wtOAVn4lgLYKt988SCAvoiZIiUWo7qwq0NcRHQ48oGqMdb8GT/3YHThXF6N
	aq1ctvMt+1cG+kqBX6kIgPvvJZItrFAlsFmB3H7fB1ZoQs+I3JfJLrJsPaycuRHSMQKDdTQNMOt
	WBAYduBRRXkuHN1wc1+JsP3s/AG/mFWk+a4WLkHZMZJtkz1lt6oImS4p44X8kso3SE4FSkrR/C+
	p6y3uEnV3o6PoJhdvuNaIq+4Xh2SE/XWugW/6PEoXqq8VsUpP3nYZQ4P55xi9l7AFa/8sJhAMaU
	U+2169QUhlRUftD72vTFYvRz9+kPafiQTWvt4BHW/93FG1DKepwe0BFaq1JbqLp9N8hgHyoNd0Z
	A/K91Tk/Qce9ZaTdQ2t47B1tV9QODQFNqfGO2KBKUathnP4U3+Abf6Kwa52nL5dmJ1q12CpQ++v
	+IhKB+fTYFrecSFFEc/CQe2K/fQomxuFSqkAgMRdnSFTIdvzxzR/+0fprmNI44WYv7o96wlEIez
	mJ82W/g/uqnUBtcYKGWqIEgqiE+eCp+0Fg99zOgktHYIN+Cx
X-Received: by 2002:a05:600c:1912:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb6375ab25mr186448935e9.27.1794885223384;
        Mon, 16 Nov 2026 19:13:43 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:41::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm25876743f8f.56.2026.11.16.19.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:13:41 -0800 (PST)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	cjubran@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: mlx5: Allow police as the last action of a TC rule
Date: Mon, 16 Nov 2026 19:13:37 -0800
Message-ID: <20261117031337.4126403-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.1
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

From: Mohsin Bashir <hmohsin@meta.com>

In switchdev mode, mlx5 offloads police only when other actions follow
it. TC needs no extra action for a police-only rule to work. The mlx5
driver makes every police rule forward to the post meter table, but for
a rate police it adds that forward only after verify_attr_actions() has
checked the rule, so the check rejects it. The ok result of police is
also handled as pipe. In TC, ok accepts the packet and ends the action
list, whereas mlx5 goes on with the actions after police.

Support police as the only action of a rule. Set the forward while
parsing police, as is already done for police with mtu, and forward
an ok result to the end of the TC chains, as the driver does when it
offloads the gact ok action. The upcoming selftest series also relies on
such rules for TC offload validation.

The patch was tested on a ConnectX-7 in switchdev mode with the command
below, and it was verified that the rule is offloaded and limits the
matching traffic to the configured rate, using the hardware drop counter.

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop/ok

Cc: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c | 3 ++-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c            | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
index 1bd1c94fb977..52295f5d644c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
@@ -94,13 +94,14 @@ tc_act_parse_police(struct mlx5e_tc_act_parse_state *parse_state,
 		      MLX5_FLOW_STEERING_CAP_MATCH_RANGES))
 			return -EOPNOTSUPP;
 
-		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
 		attr->flags |= MLX5_ATTR_FLAG_MTU;
 	} else {
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_EXECUTE_ASO;
 		attr->exe_aso_type = MLX5_EXE_ASO_FLOW_METER;
 	}
 
+	attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..8685e41487f3 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3892,6 +3892,9 @@ alloc_branch_attr(struct mlx5e_tc_flow *flow,
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_DROP;
 		break;
 	case FLOW_ACTION_ACCEPT:
+		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+		attr->flags |= MLX5_ATTR_FLAG_ACCEPT;
+		break;
 	case FLOW_ACTION_PIPE:
 		err = set_branch_dest_ft(flow->priv, attr);
 		if (err)
-- 
2.53.1-Meta

