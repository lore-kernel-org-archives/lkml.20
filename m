Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542563;
	b=HGUVj/vGc54zuScNs5I3XO2MkqvLuidUb+bAfLbgI9ihqB4KZhfrA9goRpeRRyoB9fM4
	 YTxmfs9O3b+XX+WWpuqehmLK+O1750Z0OBT42EcCVueG+hFec/hBGUCh1N/NcWbqAQFvf
	 rUNQ31708QpRpJcq+yDDN5YaxkiOd0iDbv7zbnBnGR13JiaWa/DNYD7+P5D4HEGZbdykp
	 Nyo39SatjJlPZCkKT58p5gYjmQAbPk0PDmT8LUyub4pYwQ3ktvAQErWaMhoHSBAagHhEr
	 PUt17s2Mcs01qupDNyNICiUnMsxiUh7qMnBATJQNcLCN1cATN4ok3MC2P+vrsXXpMYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zTSVuTMGY6hfgrfBmT+2Qdu4gO1NY8TIBDQ9SeqIt/A=;
	b=On65zD/XxisL0mI4GceVIjUnQP+Rki09NWgOzUiDuiawag5UQBYSo7tTlxuCyJ2T2Ms6
	 3FPCa2az2C5El39LUUOQhrOeWf6NwX8/ZB4LaqpCIPjRDLqg9MaIbp3zsRX1mEPzlLplf
	 1toa6IJNjKGtUAGbMyretjqO4rdflOg86MNKfMQAKN0AMf80tBGrQ7zzg7QuyHSksBcyO
	 Nzqq3ifx3ohbPDctW+UkpMriBgZE8L+30J1lqQTH1dcPuJRxJb4cZAulFqFyHuVMedFA8
	 bb56fRXFQVk4LarCjjsVwdTtTHJXezEOXdgGWKH02u8xVIZPEN1V3N2S4xU/uAUFgfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6092uB4;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F2606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1F2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6092uB4
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso3468888e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542561; x=1794147361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTSVuTMGY6hfgrfBmT+2Qdu4gO1NY8TIBDQ9SeqIt/A=;
        b=e6092uB4Ak7T1uNz+QgZeKrzME/g//SGNqTYgSs6btRriaKY45UA08mydcZ8ejIGnM
         sPy4jI7f4q6nke1H9Ol15P+1EwlzmGQU9DnRPEBj8GyFii4bmuQWfuiZPCPRkctjYyo+
         poELxYC0olmV9TQlzBII84NmLVNtoRw5SoAPVOcnF6kdZweMihvme3plholtCGNCWIM7
         X3T2OyYE8RE94OTsyA+SAFxVwrZKJ1U+1343Zrq8jbC/3jUxWvPBgmnEMQO4apiBC0h1
         X4JA/xQEzDaM/1VeYafm0AxaJPp6dfb/0OmgaV7yyXDX1U1/ntP1DHcc+UaKeP43DH+N
         i59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542561; x=1794147361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTSVuTMGY6hfgrfBmT+2Qdu4gO1NY8TIBDQ9SeqIt/A=;
        b=nmk7LxfMM6rZe+kDyEF6nkMRHxIjEnJU2zrj4JCEztDjXf+uxecIUHicFzesYsCdAI
         045RPGAU9iWvFh/r8355T9gfg/LDQcda5lKTcbA2b+KZf6cldF74yM+WGxUVXB+hNo5s
         BvEfRQn5KXUnwYPssdFZhuoj0rKymZ04Es5fBzEkedLmr7WEYerEVgzCZdRX5TuMJArQ
         36njt9jwqkLY+vEgrg+yN9Uwq4MeawLpjtAtib4Mocfc8z8gEvcMHjCsGmuRYLECkCYK
         2FwwG+gQgeOt8GFldb79Sw8e+r2eoxjSl5STa2nqzLxcHu6wEdSVhD8vqvCAdOw81x/Q
         9BOg==
X-Forwarded-Encrypted: i=1; AKwUvBy0XET3QL2pKOn7K7urUzBMg7MJ+MVP8mPw404ht3j0gmzEA+QWd0XUVKLtoJSq3Omiufe8JEPOIR2BrBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzxcA4yKvNeEzsANc9p0rJDQCNLy4oe0R0XLUcguCndnKtUeKB
	1oItkL5a3nMEpB1l+yByR2Qlmup+TihtlKo5xZWqtVhwSgHAjqMo28pE
X-Gm-Gg: AYBFou1fbsA0dP2sQ8cUg4aPVDipwMr5jpoMsVpeMJziQABNIHh9K2yrWMS53XXM5QI
	UpTGk3rv3u+5RiZQvnEBGkbHdnOT4zSFKY60/TGKcSRy6/kAv3LQD9KQcj//hc5+88I9AnpGlCB
	nYCm9SlLnFmyykUKq1SMOxZdUeLUQbwdoQc9vjTv64nOPAsz/wKFqFwDPLkBZ9UBK5J3RLr6ctJ
	NC5teqOtf3aNeo/zDZHFkoQ/9GxurNZ39cgwCcmiaWy+rdHOAihAQfYiom65bVurmfS+9aRiRcT
	f9G0BcJf62TO+cXVgypMD95shrlxrah30Sm3fW2MZA/HkKcN7gmvL2q/XbrzboZ6RzN9FhnVyBN
	d6FDMmk2Lo9DJ6g8M9N7vKc18W/Led4bF3U39wZxplV5u7YRjd6l80HEIVeogHxw+2BReOTJEoC
	4WIC8G4F+7ba0Qw+QGDxWvC7DKMA7kucsXyLMKY+712/m6aF5iNPQCY4EYPbgYiXhlrvHKdSpuN
	dFNzig1XTT07JmR/D7pY6p8YIjt2G2SXCoO0e9c3SAp2xZrvOO9rmvwe4l9mAJ2IFq1CJHpfns4
	7/vYQJnIdD8Oh+VZQ0X1cxD67RyORspKHbMvSkKRHMLF2CWwDQUObtNRK+kb4sUrbpBHE/tyY8G
	zdXsAfCIbnrH7RHFgUCUDs9DqxcOmqp4m8tbn0pHzdJLLsigdg/U2doyvcw==
X-Received: by 2002:a05:6512:3d93:b0:5bf:ac46:c5d6 with SMTP id 2adb3069b0e04-5bfd956d81cmr2363170e87.12.1793542561461;
        Sun, 01 Nov 2026 06:16:01 -0800 (PST)
Received: from xps.taila9902.ts.net ([2001:464e:6820:0:f43c:bf8:ce8f:65e6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1791832sm1043672e87.23.2026.11.01.06.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:16:00 -0800 (PST)
From: Nikolaos Gkarlis <nickgarlis@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolaos Gkarlis <nickgarlis@gmail.com>
Subject: [PATCH 1/2] RDMA/nldev: Reply to RDMA_NLDEV_CMD_PORT_GET with its own command
Date: Sun,  1 Nov 2026 15:15:20 +0100
Message-ID: <20261101141521.2426198-2-nickgarlis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101141521.2426198-1-nickgarlis@gmail.com>
References: <20261101141521.2426198-1-nickgarlis@gmail.com>
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

nldev_port_get_doit() replies with RDMA_NLDEV_CMD_GET, while the dump
replies with RDMA_NLDEV_CMD_PORT_GET. Use RDMA_NLDEV_CMD_PORT_GET for
both.

Fixes: c3f66f7b0052 ("RDMA/netlink: Implement nldev port doit callback")
Assisted-by: LLM
Signed-off-by: Nikolaos Gkarlis <nickgarlis@gmail.com>
---
 drivers/infiniband/core/nldev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index 849a5db54e1c..0602e4d38aa5 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -1304,7 +1304,8 @@ static int nldev_port_get_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
 	}
 
 	nlh = nlmsg_put(msg, NETLINK_CB(skb).portid, nlh->nlmsg_seq,
-			RDMA_NL_GET_TYPE(RDMA_NL_NLDEV, RDMA_NLDEV_CMD_GET),
+			RDMA_NL_GET_TYPE(RDMA_NL_NLDEV,
+					 RDMA_NLDEV_CMD_PORT_GET),
 			0, 0);
 	if (!nlh) {
 		err = -EMSGSIZE;
-- 
2.55.0

