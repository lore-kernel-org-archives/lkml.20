Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792718734;
	b=xJ9CAnqqOPoOKpK59ZobL2NNO1su5uYF/48HeoopllQVQICbhZ9EGdqOv4OIWSkXLJAg
	 7xTEz2mZHC1WAgZykQ0of9kp1XKEt2VZASnQCJRiqvN9QTPTbkRbQrTlHesx0wjc/Qefe
	 j5XnoyDGyEpYowp4Z90c9gafIl9F1wQcPnmjiskd0nPAf8NjzAw0Dp1iir7abA5qZfnJP
	 IaABqz/yfD38Pju2zSILQELUw0kkqaJnRVp+avGIKSKgsVdXsfCd+kvkNs+/FF0nS7MRn
	 9nbzHx6RpHCLWfw+8v3D1FCYAWX/AO84CIkOFpL89GngQ0PuBh3trF+SmNXbJ7wXrTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792718734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=878n1kPFZyn6l+lPXMorB20ZQQzPY4CDTN2Iv2wh0f0=;
	b=l9bvGEQCR2Pl/90jM1VXLi0+9ujK1jI33/6EJjNfskiP0WUUxxmKLGGqMeGpYThRI0dG
	 p9vf5iR3Lo8E0v8J+MwuH9vwAdnXfgPBkItX4V9YQY9QtqMCnLuMYWlgP4dJ1C4xtIlez
	 RRxBIKi7/36gBIeuAM1p1JIJaPYZ8SWBDSP1RhSZ2/EBKkpKkwBFQts3Q5klv2Y5z0y6U
	 OW3alN7xUnsf+aCu76Vg7k2/8JPHhMHqwHv6CtaGQnvnUJ6WVcUKPcdJ7dYawU41V0r3s
	 fs1rp50pes5pzNCvMbUOVUUj/IufI+OSzUzYidc+J4XCemub5RMD94u0qpHUUyBHsBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodkind.io;
	spf=pass smtp.mailfrom=goodkind.io;
	dkim=pass header.d=goodkind.io header.i=@goodkind.io header.a=rsa-sha256 header.s=google header.b=KVk19zxc;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB0606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FB0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goodkind.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodkind.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goodkind.io header.i=@goodkind.io header.a=rsa-sha256 header.s=google header.b=KVk19zxc
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so953511c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=goodkind.io; s=google; t=1792718732; x=1793323532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=878n1kPFZyn6l+lPXMorB20ZQQzPY4CDTN2Iv2wh0f0=;
        b=KVk19zxciABArCXimHgBMqGUWtwLbgCA4yGNqcliBbI30HfHRkKshFOT7iG15Yug+b
         7sWjEqkuEghVpVpBgVVzZKSn1IkYmZ/2f63FVo0gc+t+/6GNGZXur6iour6p3to1Q/cd
         fHpnHC4QYq3ZjXFPXgqC1eF/CQqiD0vtAAUcQcEKl7rfww7ueWcAmKG3/7ikAM26i87s
         KlBWFpN4hYV4aEvW8UlYbMhamP5B0Am5i4sdAHXXbSpNyqkxKR9YQ70IQ5DdPyW1c2Rf
         sgBR/1e+dJRcBObUNxVD0NU4l7QfEYEasFV1I78krMEy90I7nid8qWPsoVMqDudEjWB8
         eRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792718732; x=1793323532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=878n1kPFZyn6l+lPXMorB20ZQQzPY4CDTN2Iv2wh0f0=;
        b=PGOB2KUsseMr8WdTj0tZLuNQ9v4o6Dsqk0V7bhlAc6OosYo1SuQuT5klyeajPVU3hL
         /NnERlaiUZ+dM7taqQZzZaWPFxsYPfgYOBTZL7AP3AZ/hw/m9/zkoUcBQCSijfqx2gfI
         w0ZkkjIC2J53VH8eJ5Z0YKvU/wFdzyIDHJ5uZmdZt6sCIPpKLEdfMcmVgIyvyKySv4mH
         G8QzR+UWGcG3XOVmJrIw+XQBIWhxSSWDIyckPnVioIyRwuegx8eBgWJEKy3BMyjE5rOi
         Ar738kB5aRSLH813fGAp4m39OUPuWbbLIeVmohoXze/bmob8w7fhMqc565Bi5eh1Zv5e
         2oEg==
X-Forwarded-Encrypted: i=1; AKwUvBwBZKu29/Rl/dDCNqKQ2LH6XwiCt4lFg0OCTURUTn/K7MlTxlN4wu4xkvidvlE+VoZ3ucCaAzARM8s/78c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa70I/ilmMT/zWhy8DEuDBVOTqzHQIX4GS3GUawJvS82YFmRdx
	hdqk7Jzl5lochVLVv0KTsGbcPrhpYw6hakG7jBIzCpTDEYeSPymYLOCv9Te9UWwPmUM=
X-Gm-Gg: AYBFou041a8CyhMzfsqS0mrU70x7m4F7arviteYL9tZEmZEcdAiFRUV8kVAnJbBS3pr
	YEkpOQVXnzxO9hUGXUPsJFUQEpVEjC7LQzNx7RXZefmcXjdfwQaxvzT/+fcumJeH87ob8VeBbhK
	tpeUld6v+GAywkjWtI6cnnwJIAhRyURQemtfFACaL5yixTWo++wF6bdTttqYbAOnMvocTK6h2O3
	2Ryrv0zZ1Em7r+Nvqj/AjBoBrhtJFm3PyViOy6u3vJkImfGbxm3tQFY8dV/2s9729T8TweUlJk/
	QZz0kntmTEwLmQjIf7qWL9s7NI5VBAP2h+rRKE86nCmlisJGgcW/ftT643TfThfEYPCVliwG1/0
	1Rfk3B2nZYki11s8b4YjpW0Mx98HVE/rw21F9+m+fChGdcQD9hUsd9f8Ek2Sj7LWbkTpTDWWkHp
	TiAYkAiMkvBOqas3aY7wZZtKS15nT/fJ/0c5gkDROCVZsQnEavMq9xqLckMtebuemeiqY3xnb6y
	pg+HqwoaWhAuwXuaxkDowp+oOEOM1Pq2rgamcsmfCxlUYi+QnAlkv4oUWbTXPwk1O5eLBo=
X-Received: by 2002:a05:701b:42cc:20b0:176:d885:4e94 with SMTP id a92af1059eb24-1959f9df88bmr1360589c88.26.1792718731771;
        Thu, 22 Oct 2026 18:25:31 -0700 (PDT)
Received: from localhost ([2001:5a8:4296:4f00:7134:385:b14:41ff])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-369d9d89b1fsm1703137eec.11.2026.10.22.18.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:25:31 -0700 (PDT)
From: Alexander Goodkind <alex@goodkind.io>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Alexander Goodkind <alex@goodkind.io>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tarick Bedeir <tarick@bedeir.com>
Subject: [PATCH net] net: ethernet: mediatek: preserve sibling PPE bindings
Date: Thu, 22 Oct 2026 18:25:29 -0700
Message-ID: <20261023012529.5994-1-alex@goodkind.io>
X-Mailer: git-send-email 2.54.0
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

__mtk_ppe_check_skb() clears entry->hash for flows bound to other
hardware slots in the same software hash bucket. This makes
mtk_flow_offload_stats() skip their hardware counter updates.

In the regular flow branch, clear entry->hash only when it matches
the slot being checked.

Fixes: c4f033d9e03e ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
Link: https://github.com/openwrt/openwrt/pull/26107
Assisted-by: LLM
Signed-off-by: Alexander Goodkind <alex@goodkind.io>
---
The MediaTek Ethernet driver stores forwarding rules for active
connections in hardware slots. For a bound flow entry, entry->hash
stores the hardware slot index. Flow entries for different hardware
slots can share the same software hash bucket.

OpenWrt's driver maintains cumulative packet and byte totals. During
each statistics update, mtk_flow_offload_stats() subtracts the previous
reading from the current total to calculate newly transferred traffic.

Losing a hardware slot association lowers the current total used in
that calculation and causes unsigned underflow. Conversion to 32 bits
produces a false increase of about 4 GiB. Subsequent calls to
mtk_foe_entry_get_stats() return only the unchanged prev_packets and
prev_bytes values, and mtk_flow_offload_stats() subtracts identical
readings and reports zero increments while traffic continues.

Two UDP trials reproduced this failure on a GL-MT3000 with MT7981
running OpenWrt 25.12.5 and Linux 6.12.94.

ARM64 allmodconfig and allyesconfig builds passed on net ffdf678dd166
with GCC 14.2.0, W=1 and CONFIG_WERROR=n. Patched builds did not add
warnings. Existing -Woverride-init warnings fail the unmodified build
with CONFIG_WERROR=y.

Codex assisted with investigating the counters and preparing the patch.

 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -764,7 +764,7 @@ void __mtk_ppe_check_skb(struct mtk_ppe *ppe, struct sk_buff *skb, u16 hash)
 		}
 
 		if (found || !mtk_flow_entry_match(ppe->eth, entry, hwe)) {
-			if (entry->hash != 0xffff)
+			if (entry->hash == hash)
 				entry->hash = 0xffff;
 			continue;
 		}

base-commit: ffdf678dd16610e3f006dac904bd37c09684673c
