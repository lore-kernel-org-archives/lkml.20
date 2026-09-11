Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D894563FCE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789159406; cv=none; b=kNOHkYD/aY+uEEvLIGdIAAWgmdzJMvVgD78L+cLetiIK29npyjfRw3jGQYz8p+boxKc0O+sBW7MP5zX5UFry33jMl7pRMSPiMpNl3HCQdJjmx2Hbu9LfzxEPCXjPZSjohcpHIfyYFOTQlWxyBY2XKys9DR+MzUm6O+iBqdABBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789159406; c=relaxed/simple;
	bh=exSQCJAT2/4ibTKoqVQ2znJRDT0VpBh9eXRy/MEihi4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Akq+bfmFJEc1Ufe5pdpLveiQZbNTUGOzeJ+UVstqK8WWsmatfHOzNxDw7w4tTYQ/PclNSUjuHonq7z36JxEYzGlB6YXpWewsaWihlhl9XlbpbOsxRzEaghFB9N2qzLrpbTdD9nnhx4t2HMJL4pwTst60hwgfbserxEcyq3Q/PLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+L2c82T; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+L2c82T"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso11397695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789159402; x=1789764202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTMWraaokQNwDut7O1QaAcnK+p0ZnWjq7amUFlM09KY=;
        b=q+L2c82TmRTr14uIRHELtItlPahikwG50cFASVvuG8Jmr7iDieNAPtj4vLuIs2bGPc
         qpAe+VV3l00VyGSFxA2BplRC40DjrDIKNb97XbEd8aJa7pOjUJVoNh4HuXCx2NtKr99g
         fkaBg+MspFEsLi7GaA98OVZIrALXmcCSsV3K9RND7nC1x2K+rwy0+Qv3+DGCpgfcKnj0
         DeA6f4X4nO98cX7OsbBwNk0CUd4w9ZRmygm65KqbXT+CVmZJXheVx1nHJfYB+pQPcTNw
         /KamIuo1evRb7beQYqOwvWs78lUuvmyqK0tndPYPwV9cP0qBkfqF3XOXoggj6Ja44Pf/
         0CBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789159402; x=1789764202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTMWraaokQNwDut7O1QaAcnK+p0ZnWjq7amUFlM09KY=;
        b=D346C7ccok0swvvfvoNSWtCbMfHFE1+lW8kdJehxRajUnwNUa7lxHowCarpp1DHtG/
         RK2nntSj5tnf1mpeIsZKuN2lJnriO50lHjzbwMGyeLVxwjb2S4harBWvINw/i03hqpP3
         mRj1wTn5jJft2yWY26NQrvlw1skeBfwL+d6lSCh196cexHGvL3+5Z76/bZY/DpVoWw3A
         Q9eCmHUoGp9qYcxvNc+ONE1q6zkifIWDfQgCRwmt4dWoDyPfbLGJD1042441A5SgtDFA
         WWqcBY4cXyZi1cth8D1Vxzh296uj/Tby1LapCn/qdrn5/n30bt0APY/+10QAqTV/4rqn
         1CYw==
X-Forwarded-Encrypted: i=1; AKwUvBxNsY/ciTR6V6WdZY0xFBcne8xtLghb8NWOVCBi2HAjZUMmm1lSmu/G+LC1mGg8NrZdBqUBVa43bmIJb1A=@vger.kernel.org
X-Gm-Message-State: AFuF++k8/h+YiUSrzLy7T0Mk66bEyLx2vQ9OhY8V5lnPgp9R6Zsu0YOQ
	q/8WyuvC6z6w6uiPsrQEGEolVMXaLOemoXOA56oUolpwaldaV0Je6VUd
X-Gm-Gg: AYBFou2IhqxXphOSd2oMfNmUxzmnD0DYsbIAQlQiwUsqmOORkqfaN7S4q99Eamarxs+
	svab+/Wobg0xBHmKk+zVTXKyDiJrLWLc+MBnrUf3vlZgSGTMborgMrcUkcvjAbfUZQBEoY06enD
	/b5165Kgc7UQXlfEn3KYnQdM/4RV7hPh0rowhJuoEdcGisenkPEuHc3vJM07e+0DKf1JN6HFhrW
	o3EbdV2zMxwoNxsqu3ObASBJ3tqHybUM3iOSuZioO3E9FHQiQMbUMTjUp1kQlY2mDCgU5LTY/8A
	XL0pDpMdFcdpb3HQniO9bOzLt9quHBFi2LZiVdaOPE6ZEw2JoE4fXr3AC2RR+M+VwlBc9bLud4g
	+I+xoUaM40rNslJkWRQrYy5kCmH2xy0PY1odl6jz8HMvGS222zoP8V+XVujl98Kw6+7c302M9Ag
	3VKG4TIUoDBXjw+tjQhxgPsO/4J7lTNiGwrhnNdmDoIHM678iOHUW41y8oJP6hWVk+DfTt88LtN
	doEW/2jmiVblU9xlJQZ2LKh+oU8dfqJvqIBxDwmcWGavKuYAo7ZJzW8c9MZqLfiAYi93y9DBIe4
	3/qnNEp7OdkLG0v3zYn9P6v/SPMtbhPcAoVu
X-Received: by 2002:a05:600c:4703:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49e619bfdd3mr66566535e9.22.1789159402051;
        Fri, 11 Sep 2026 13:43:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm199569675e9.15.2026.09.11.13.43.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 13:43:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: phy: Fix device_set_wakeup_enable() reference in kernel-doc
Date: Fri, 11 Sep 2026 22:42:01 +0200
Message-Id: <20260911204201.95270-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The phy_may_wakeup() documentation refers to
device_set_wakeup_enabled(), but the function is named
device_set_wakeup_enable(). Correct the reference.

The typo was introduced by commit b344bfacf1de ("net: phy: add
phy_may_wakeup()").

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/phy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5f8d65868e0ff558c163421cfea5a6f3bd73a53e..da2febc6425ed340248d9872dd8f2ef79b665168 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1697,7 +1697,7 @@ static inline bool phy_can_wakeup(struct phy_device *phydev)
  * phy_may_wakeup() - indicate whether PHY has wakeup enabled
  * @phydev: The phy_device struct
  *
- * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_enable()
  * setting if using the driver model, otherwise the legacy determination.
  */
 bool phy_may_wakeup(struct phy_device *phydev);
