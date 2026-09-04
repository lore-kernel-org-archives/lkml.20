Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF55481672
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523166; cv=none; b=SrjBSOKKU2N03d02UpJx1qLuX9kKdeejRz6+1BOUNQd23F493BFDOdKM1Ura0Bxfyct8hgrF8DFxcVghrtxavTXTxDERu1G3A67vpmlm+3TcC8dhQsCnk/hGl1Wkpr6QagE1HGd1NJNX8uTqN4sXc1ZmA4aU6SD25kieUoUqXmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523166; c=relaxed/simple;
	bh=kB1MKI07S77deBJkcRp4alvrux7z/pJIPbNfJVdZkZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVZTDQk+4THddDtFiRVpU3W5sR0wzRsv0Dyywer97pDtYYTIZTKSAauXW5QMQ/sK7erYQEnWNpvj/oa/QRf6gFPn8SdVfD/OYv8WeRnU12qtb/wWOxYbn//dmSR9j/ktof0zAwo0EsT1rkawVuRamW9P0+SZW41ezrMjWTKT+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEKx6TR6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEKx6TR6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1902626a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523164; x=1789127964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnusHejKpGyh9HbEBCnQmungQzWoz8PMUq/SwTBA+5g=;
        b=OEKx6TR6CE7g6OGH1vAgBvxKX9Uj529HHTo/QdwZIsnmpsCWxmR4qWOn8kvfjWhh1e
         eL1BuKANHoRJ3RrWVl1+2EaBcx10yrEFnMdbcwTYm4421K8AYhiGLzGweyqntyTYKTaK
         spdQEgE0iPUdGxEPdXC1WavR9yrqSpdD0j+6cLKWz44WClGRDAmNrSbGt4deHKcZLlwi
         gwfopXyNVgM/MuxgNOxFMnaZaVa1JdOu9EPjVe+mpbALkd1UbIIctyWLBXz8n+8yvF0k
         q+DHMlpMzXUTIZfWHSV3H37gg51qDtBGo4+S26CNkgpjfipFX93cneTuaU+ZsfNhe7cm
         +tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523164; x=1789127964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnusHejKpGyh9HbEBCnQmungQzWoz8PMUq/SwTBA+5g=;
        b=Wca+35/19ICly/ODTtZXA+J84mh0mBnkxJ1WsUBXeybylTMKjJq6InJ2NmuSqG3uoY
         nPnbySIiSFcd7ONRmqKGScP7r7BMM731cpRNy6Rbq2DxhNBaqiObjJk7jarxTl4tkDIw
         /jvMdHzSf+8YKRa1kOhGRHTaPjI+iNndJxgSH8Oh9vfR/Yk6oWZE2PpAvlACKrUDOEgS
         ugrHzGjAbQ8IywMw7mHtp4MKvkf2n426qwn+ub3anYQmyrA8hNa5XlAPe2RSDVGn+B/e
         ViNCvd10q0aQAvBH4W76hYQrcKpz2sUAiRhYnb4m4CuPJhaK6btL/qIkqwhsRcobH2oL
         6oZA==
X-Gm-Message-State: AFuF++mgjEzfZjOppKwqQpJPlyAiwgUbfgdrAVjIO56jaPJeYPJCCem5
	DeyCHocdgIIa1Kps9OimFeVXku1IJQQNDCvb951KFXE57IQDC8KUUKy2
X-Gm-Gg: AYBFou1TOP6Q3ET22LQSEyOywPEEh7XO+2fdr9he39BC/15/HOB3uG95ddwCO3XDLvI
	rRIEmPORDA3Mwgj+FF8pk5xtyj81Hu4F4hSGL6VCMqbqS72x3lW8F/0GdaBZqJnTCDeCyfzyOGu
	GEcTECSf/7lzjQ6fThZZKeJ2ySRvAQw5CAj8G8oW1Ddm8DklV5VaUxY/gZ3NGqjZYP/SNacxr3d
	kqfzFojFZqRGPX/3PFycg1u68lXGbISQaJwfOuLlRtxhellTYf4JBwGjs3xll7njJQKBXVMcg72
	3cs9+zICIAEVc5EE1JbZgeRdC+rhZ1ERHSoQsFNvlgROA1lXWNlBg3F4BVW+8Yc0zsacPFpczyB
	u+hQAMNSnXdVLAPUttBJk0Sk6Od9TnsfFw7fAt9Vg4prUBvhMtEUA0NfDO1ZvK6PSs5gF84df7P
	nJzla9cFDvq2KA+brdchESS1AdzNE3EattmlzXPk7yUuBJtyYdOhsnhIAJswFbK9h4cF20U+UNi
	tRt2c2mclsVpd0=
X-Received: by 2002:a17:90b:3fd0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39b07fed101mr14362000a91.10.1788523163577;
        Fri, 04 Sep 2026 04:59:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339c0ec914sm7034122eec.31.2026.09.04.04.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:59:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH] net: cortina: fix typo "trigged" in comment
Date: Fri,  4 Sep 2026 17:29:16 +0530
Message-ID: <20260904115917.13695-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "trigged" to "triggered", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/cortina/gemini.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cortina/gemini.h b/drivers/net/ethernet/cortina/gemini.h
index 24bb989981f2..d359c633c5de 100644
--- a/drivers/net/ethernet/cortina/gemini.h
+++ b/drivers/net/ethernet/cortina/gemini.h
@@ -726,7 +726,7 @@ union gmac_config0 {
 		unsigned int dis_rx:1;
 		/* 2: transmit data loopback enable */
 		unsigned int loop_back:1;
-		/* 3: flow control also trigged by Rx queues */
+		/* 3: flow control also triggered by Rx queues */
 		unsigned int flow_ctrl:1;
 		/* 4-7: adjust IFG from 96+/-56 */
 		unsigned int adj_ifg:4;
-- 
2.48.1

