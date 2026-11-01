Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542569;
	b=ou9+vaEa5aRjtuihpPvKpunPcLoo2yS6/2NyqlCZrkecJTkhTc+FBNNY5is3/DBo98EN
	 lk2iCYUpZru4S3AyLpGqP+p/iFDogGyTEj5TZOY4fFUjn3zSAmj8YbgVoAoC2Udh5PfZf
	 3aflWCXpSWO/FP4vmw0vMXbNHyGNWJ4fAA7h2zBp2IyLvwG1t4ONf2kKuPuYkoKy9q78A
	 HG/Q5/jt4/ohcdQmygzlHUgdr+6kdy5vcYO/n9NrzNafwpBEC5xXLGHpr2OHUSHaHbdKy
	 PrEqXlMbeNhzR2jWIVpTbBqTdKfK3QJumCEsQZVKHO83RkqVj7InofXuxlcqMmyIe6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kJDRHLeeryDL/JAowlA6LBcclqmYPY1Hmf3DUa5+FvA=;
	b=A3JAWqSbU9ZNNms4H3lRPrrs3eseqhH2R/Vu0SEYRuaLjIoQ+4yKCjiZRC1Uhfsv0Rf/
	 av+9KvArdmDMSchmVVBhUZrj0lGVznjUPhMsByaY6u5Eu4sTvbKhUP6bp+BOXvDABW6ib
	 IJ9547ndB9epbdCgNr9NNqnN8OCCwzbVVL3j+0PUcs9YCw5X+KraGsfcnqXCRE28bJ7eX
	 m1IMZCHTeTMN5NGB3DK1v6jMWCGHbj4/peE35ZY1UC/H97Anz8wuEvwiWTvOmyW9CGo4d
	 sbdB+FVDEZoOeE+HIvhTwUQT/uE0OQNvlYmMwWdyiZu9iUaEhJjGmUCXKHBweZUv9ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=No27rDrG;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A9606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=No27rDrG
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2085767e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542568; x=1794147368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJDRHLeeryDL/JAowlA6LBcclqmYPY1Hmf3DUa5+FvA=;
        b=No27rDrGl6FkBaFuJG9j3JIWnbF7+04YSI3B7KBs0N/sM7a3Z3j2X5HUYnMyvS5cTH
         95CdP+jzQPgfU5h8SBUk+iWA69s9eYMgj8pqIVVAAn4y2Or18a10L6+5g8dvlyqSGmL9
         cdH29xqHMVwvZJX3Z97i4DSN1vPsSVVTMK3zIkjlTHj6cjZmW/7UV4wB3tyAqnN9KNnE
         bPVfiwMxDHm8/yZnoWbpSiT3dA/N8qzokGylv+985CPgnwRTOFPSohXO+0UTRYlDFHbr
         jbnLg2DV66MM6vvJ8O+Sd7nD0Zvj/utemv15USU2TgrPXf65wm23COfoezetMJIixYfF
         azww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542568; x=1794147368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJDRHLeeryDL/JAowlA6LBcclqmYPY1Hmf3DUa5+FvA=;
        b=ojAtp/w8MAnCa7aaX34QVK3Culuk4PUwIVOf0Munr/SbT9GKxUZhuHj+9LqIXg8oRw
         OCDhWCz3lmLIhPW4mzH5pkSuF9UNzsOBsi/FVqc0OZJJAYIhmlwh5FgbMtY8z2jj57Hh
         42jylGATseuiFfmZZ6kFpZdPM58ht40WMBU/aD9dW2n9Mjh3s6IB68Ts6/64flJFCaSR
         juvfJIdjhKBQbosMiQ9iKS9Cim+nUZWRLuMWmSz8hzxn46EU+v2pRQyam8vHR8BKu9NW
         J7rynM8x7wzPygmteR6cA0RVOArp5X0Od/79Nria67MfP2AFI1hnduVM2IpsOZWqTqNN
         zM7w==
X-Forwarded-Encrypted: i=1; AKwUvByEMutDOb41rnjaP6U5d2gNvfIEOiqBOeEFC38WJGQuLXFHx2EUPNbxMNgDk0P4j8pqmKcILsDZBtViG2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrK1mh2OvJkJcQeQQiBYf8UTEXApSciXxKpoTQo1+dqKbB1nuE
	tX43usaiULVif1cMsJiWcaOIgo727b69UpuGJnZnqwarSFTiI2C+UtEHnMP5xuarrIM=
X-Gm-Gg: AYBFou3P6Gt5wRomuTazWcK0UVRSoJ86LZCEcJcIxoYjs1KZ8YEYXgvULN3cp9UVBXc
	XOeWsUgnlc9KO2+xzDVpq40Y14+zgENZbQuhooF4eDUjf91pxFDVqFwTn9AIXVUm27xAvM7MZOd
	zP2SItZPI+kbT7IW4tkrZERg35z2OX7ZQ8KzQT5KCXlrDQy03BrpGKvEXj2YVYidtzP1sdedixt
	U9MawI4QxdTGwuk79dc8m3qOmY/sjAU/+cEsKjBARDHsORgr8pngAE4rwjsRwcF8GVJZh1+U7fC
	VXyuEzEja8XuJ4U6W4ueeuX7SUaZnuCHybQWGJPSKHKnMsBO9331WNVowrT4ZePtLUhhpmohGb3
	emRjXe8OVlRyXFvoCLXQmaXybJWZWBBhEmcdq+Nv9I/6kKxwsdHZXVuzNh9uRCYjGmSzVOne2YG
	WxrSt8odI/mn1wI7jmKt7lM9XPqIlR6nuNccY8X/yj7QF1HkFvMo0Ot3BDJNR3YOZs+hZDPPUn/
	fiDQ6CqwNWrS4/PH5Qi1LbfwlWohgcJieTrdxn/fMAc0v+R0e4BwWZvt06HyfF2g/ROH0I1Ph+i
	zwop9myfQF+LuDajheElm+eF4vjvJ4D5TeeUNZx+rb+3JOaQp+SiZVdm/DaHN+nGKSbdVv56cOH
	q9u/cyZNpzm4pbSbw/nE2a4/TxOD+ZMFMzU85LR2UYR+LGQ+5y6Ho/ql25L8KmSavzToqoJx4+a
	bXxQ==
X-Received: by 2002:a05:6512:31cd:b0:5bf:d653:ff1f with SMTP id 2adb3069b0e04-5bfd951d123mr2074859e87.7.1793542567746;
        Sun, 01 Nov 2026 06:16:07 -0800 (PST)
Received: from xps.taila9902.ts.net ([2001:464e:6820:0:f43c:bf8:ce8f:65e6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1791832sm1043672e87.23.2026.11.01.06.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:16:06 -0800 (PST)
From: Nikolaos Gkarlis <nickgarlis@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolaos Gkarlis <nickgarlis@gmail.com>
Subject: [PATCH 2/2] RDMA/nldev: Reply to RDMA_NLDEV_CMD_STAT_DEL with its own command
Date: Sun,  1 Nov 2026 15:15:21 +0100
Message-ID: <20261101141521.2426198-3-nickgarlis@gmail.com>
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

nldev_stat_del_doit() replies with RDMA_NLDEV_CMD_STAT_SET. Use
RDMA_NLDEV_CMD_STAT_DEL.

Fixes: b389327df905 ("RDMA/nldev: Allow counter manual mode configration through RDMA netlink")
Assisted-by: LLM
Signed-off-by: Nikolaos Gkarlis <nickgarlis@gmail.com>
---
 drivers/infiniband/core/nldev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
index 0602e4d38aa5..953406531cd5 100644
--- a/drivers/infiniband/core/nldev.c
+++ b/drivers/infiniband/core/nldev.c
@@ -2316,7 +2316,7 @@ static int nldev_stat_del_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
 	}
 	nlh = nlmsg_put(msg, NETLINK_CB(skb).portid, nlh->nlmsg_seq,
 			RDMA_NL_GET_TYPE(RDMA_NL_NLDEV,
-					 RDMA_NLDEV_CMD_STAT_SET),
+					 RDMA_NLDEV_CMD_STAT_DEL),
 			0, 0);
 	if (!nlh) {
 		ret = -EMSGSIZE;
-- 
2.55.0

