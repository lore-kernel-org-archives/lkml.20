Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A835828C5B1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422294; cv=none; b=rYW3oyLRrFCqqEwVZGi2XSFWQ7PffbaLH9A3LnokeMGI6LhkSDdGJuoMzPAwpiZb6GRNs0w2BiN4vAcVTCZWUfHpRwWm9KapP5VBTeFf75d14IArIDspPJOJcQadYAStNquKiYLHmGb43MpqRhthhMqAIbf9VMCPNN2hLxppD7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422294; c=relaxed/simple;
	bh=T5cmr4AS4Mc5RSkaZ65eKN18E4FTywsUwCGNvI0ai1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mPEQm03sib1qTdHvLpZk8Q7DyxnmUotFeyipst9y7EmtSP453t54sTZ88q5Nr32K5SpAOEEy20+NkXWBBeUanyltU7gmyxphetlq3pI+iN+tCM0Xw395EMsH1g6SvryBojJ67CQXaa5q8foR0aFT6mj1QSh/PLKBKeAoUYMgCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVS1dfXR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVS1dfXR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso2386953a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422292; x=1789027092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yd20SNdmG7z7W+LdlhedLQwdQEcbKDOr02wLEKBgbwk=;
        b=GVS1dfXRcuszcELA8fxCtlcReDBmnL03gtolFUmcvcSj7sp+b3UgMc/cg7fFeMpNTC
         slzYwnWohlUjIoaCDkwPzTcX6gFH0EdXqV463t5nTO3Jzt8MgTVxe9Jmll41SRvqgUuQ
         OmjyaZlCEotXoDJ2Go1Fsh3avUJzjnK1yaA/NWS6JL2Mt0KBJ45nH7dnlZov4bsKDCNJ
         nZxrYNP81aFBKdwu+plSj/zZfbIlTpYxMBzEiOciRFgfwvO6x3l8Cz359fW5SRqKx3P9
         L5QhPvoz/3crzO8XYGkYHX5/umiZjrQPv3nWz7ZcN1p5utprmKvl/Ek4D2jCbRggOq9J
         shUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422292; x=1789027092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yd20SNdmG7z7W+LdlhedLQwdQEcbKDOr02wLEKBgbwk=;
        b=BAmcHfZsmD3RPxokWkjTZBKt9vpxXd4g6I5hrihttH/JEQvk8n8To63OPv17oSVOeP
         8tqD8/EtO4MZYlARrRwY0WnF7VstxIz4e69qXAFu7Q5VJyXfZTIBZeX0JYSqElJyPlt+
         e8xw2gHA0lScEcvKVI3ORRWhgBex+cZOIJAF65i3A41sp3RmXa7o9bGxQpCsq85Hc8Hv
         D/CzA0U4LKjGVzOcaswaN0aak+IywAtPCdt/MaLTZo1n60pDfZPwxW6mI+i+zKa6k/cq
         Y2d+8Kyq8tGcTSMU1CCCUwkh3WZNiFG2WeDNtFr1ouX1iBU2jf6ECXhAtFPxOe+axYr2
         I32A==
X-Forwarded-Encrypted: i=1; AKwUvBx6Okvo1u18f+lzucQJcYPeNbOLBz0XBv21pg4I7PMicivLAJHIMfB6RkHgC37xtiuI3gG9ypD98MPSD88=@vger.kernel.org
X-Gm-Message-State: AFuF++mlNHabOhDvn+acA2Lb/n9qtRhNOyhrlgQE5nGwbVLytHJdLkJf
	JlVTCk3QvMP+bUu4Drkw7dRYr61Xk4GNFORV+5LBgOfNQgCKxPtqRoRxKKa8tQ==
X-Gm-Gg: AYBFou21X/KDPse6o6FpJS31j8nKGGjc4Fp27aZy8u/H/SevJs7O+9s6JXoQZJ/5v2+
	C5A5ks4X6OtXNGQY6yWjDks8zroBDzu16XQu4YKWWrAoZbN/zCUiP2oRtDxAAgHRDdFksSNspZu
	4MdXG7C2NSK+INJLwzgV5Qeg7NW9FwZ3knHOtE3tswG9I/M5Y0sD7lBntFttWPQ3cb2H6o88TQS
	KhZTdjlvV7y7HhUlwYQdGUcI+om37lh/Q4YarDJ2M67Me22xrOsX9ccBUjBru+Luo4ahxK82pXD
	NeHaeu8ZeE+C+gyVW265exKR/bDL+yHYRtVdZLei6in0kog4weRFSRFcKUSosnqiyizo2Cm9voI
	tW1+ill9lTxoyhBoH9OdQ38QATJozTtL7k3QSMAk8bI5brIv1lNvBLxsmoGiB5XzNhkRE2eROfw
	+VTuo5avjsQ7TfX0YoQ3ykOfKRzBHKtCOJ8JpHx7DFOfmwjIW6S7P4iFtQRgefSLOx+PIjr8GeC
	ewcw+ub2QEubh5L6c2TfYNFgqsDZV57w27OAMk9+LJIKC7iajCFixGmeh9alofIPIYcDUoD0eOX
	Kv3u
X-Received: by 2002:a17:90b:3909:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39aee204517mr13918913a91.25.1788422291920;
        Thu, 03 Sep 2026 00:58:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm3826300a91.17.2026.09.03.00.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:58:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v2] net: mvpp2: simplify IRQ validity check
Date: Thu,  3 Sep 2026 14:57:53 +0700
Message-ID: <20260903075753.346647-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
The current condition also checks for negative values, even though
irq_of_parse_and_map() does not return negative error codes.

Check only for a zero return value to match the semantics of
irq_of_parse_and_map().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1: 
https://lore.kernel.org/all/20260824100758.31622-1-phucduc.bui@gmail.com/

Changes in v2:
 - Drop the Fixes tag and rework the commit message to describe this
   as a cleanup.
 - Add net-next to the --subject-prefix.

 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index ccc24a1301f2..1c50174c9f1e 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -5874,7 +5874,7 @@ static int mvpp2_simple_queue_vectors_init(struct mvpp2_port *port,
 	v->sw_thread_mask = *cpumask_bits(cpu_online_mask);
 	v->port = port;
 	v->irq = irq_of_parse_and_map(port_node, 0);
-	if (v->irq <= 0)
+	if (!v->irq)
 		return -EINVAL;
 	netif_napi_add(port->dev, &v->napi, mvpp2_poll);
 
-- 
2.43.0

