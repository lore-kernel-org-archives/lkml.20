Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2BD4A093B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871766; cv=none; b=qSyohDfYPS/cbzrbl/2sXbKR5UpFwDOTorUvR49xLCSh+HoVwHEFYIG3Pb+a2OmaL9aBh+1LLDy8FLJpDy7y0tWGWcYWN1xjtejDwEslLLB9YkxWUO7NmfgbU2x50Xp4zRHq4jw6mgGn1THUTCkGe/cdXr+tZLqfV6sZPYwGcV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871766; c=relaxed/simple;
	bh=QyA9WEXalwEvaOd3n4YiMQcj5LFG3ePfGKY54JOZEqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtVCCgYQUFNoEW+Sy2R053hIChap8Ti7I62HCfppEZeCijVBM9qOC4e3MLkQ2L86ypvEbEb4axfZTW/EHFQ5BpxqNXsWZPGDDF6EN6e0rozW2Zmrrtq9+UXxp4qEGRkAZmZQVzWUCe0ScaWYcYlBrk6qfaGXPOytMBKzAj3cr1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRqkcjwf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRqkcjwf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e831e86ebfso13134045ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871763; x=1792476563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QyA9WEXalwEvaOd3n4YiMQcj5LFG3ePfGKY54JOZEqI=;
        b=eRqkcjwfHuUrgE32sU9+4heEvRJVGmXp6yyiFjzQXk7ptOdXBg9wdCsCE+uIV1SZjp
         PKAvodXRDbJ+juEycny1/JcFwkFRE/TO0lvLZ9nehxZRo0jQUVMEQZ4DaL4VD3Td5PWv
         2Ryl9gH63mW1PgKzbmucjVZC7faAbL4ySZUZHhjk+O+AuT3lBITxzNCqT6pTYVLa6bVI
         Sj+tKpc7Se0V7roNUbmuxQOPNXvTYN8qQQir2KwHfuj+wyxfJFXxxHW4zboyZfYw9Q4O
         4ErFHnbwvCZIpR9T2Zkw0APp8iv8arQxsxiqD4AxUWVKiGFnp968l1Z7hKCu+mH9K5PH
         IfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871763; x=1792476563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyA9WEXalwEvaOd3n4YiMQcj5LFG3ePfGKY54JOZEqI=;
        b=DeYdjTFUv3CTGEsgTdavyjpgFYFvhJl0ud4Ex8zN0u0Jhg4Wc732vGSG2ADWvheBc2
         D8uUbzGxkG1kVEE77Z7ju3L/FbeqdB/Xxl8LLe3Z+Ar/v5UepXn1uQYhgaLqUqPmDtNc
         QhzUt9jUFcq3BNVHtZXrCN8Iy9WwaEA8I0zn1SyqvFg3adzzevSUW//c5QzdTuOFfHVu
         wlv+aGyL+FZItFhFcEyiHeiQNrCH9brJKPBuUYIoZqPfH9RQP/EPFZwiUx03x6siekAC
         UQkQRePQOAQuhC3W5Fqiig45KDKszD7I9kN/wO8Bt6WqUfQFzTO02/AD3qHMTqLmMDVu
         999w==
X-Forwarded-Encrypted: i=1; AKwUvBwBghf+b6BwPgW+B84Loyw3E2WkUeafrSU3+n2o81mR6J729fzuKMCOREYjYCo/vSnFCA4DnHb3X3SV34Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTMxtvygCRB78Rx3WSCADyvfbBIWOAy7O86ZLjxYuF9HPFW70U
	WFVtq+8JO9OVPIFB2mNgkVIs5MdwhYA2n8kMj2BwKb9bNG+zlDLlZ5no
X-Gm-Gg: AYBFou1wg6vpbFqkgbe3Sl93HKTbYk+EPhqwAqFTqLaIZbMkDODFlBhbLYrcQTxqVH4
	35QTOVxocUHVfkGJJ7U3V1Afn4no3xF7th9ZR0jQ18epLedvMUJymvGCALPDUoGYOVHUZuGbj8j
	Pyezk0QQy/WWR4lbxAPDFDxgj115RRHxbP/3q1KSx7nHNKdfxg3Cxe//aMPM0bQm3jihv3eB2+e
	EnufGuNcPO1hSrG1j9Xvo3vSxzA1909WgfUBzPO2muy6LvDFzmRmIDLUxh5ZKHpjB+sKJPxoM5p
	tgk7XtkSXU4t3gb0nMy2VyGpEux3JXS3kqBI1XHedkzv7UvD0ksGVdu4Z+QL24DdxR3Pa/jHvQu
	HDCpyuX5Nc3ZpE+I9b0LtVRVBmiI+Sy2tZjObTMh9sMrgKF+wHC2lEBEIbj1HrTGMHCnTVNbUeD
	gxyYUxblDchgzIvOtHItlvzEbHCvxuplqqIYQJetsgu/Y7YwWlMC5A+h8kEysCdrGB5Aa1FUBCh
	QWTScXAW9A=
X-Received: by 2002:a17:902:fd85:b0:2e5:cf33:80bf with SMTP id d9443c01a7336-2e842e14d43mr108812335ad.56.1791871763534;
        Mon, 12 Oct 2026 23:09:23 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm50770475ad.0.2026.10.12.23.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:09:23 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Tue, 13 Oct 2026 14:09:05 +0800
Message-ID: <20261013060905.2777418-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179185976266.2527009.17600570633406382637@kernel.org>
References: <179185976266.2527009.17600570633406382637@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been tested on the hardware device (not publicly available),
a DWC XGMAC with 8 RX/TX DMA channels behind one shared interrupt.
The numbers below the --- in the patch are from that device.
