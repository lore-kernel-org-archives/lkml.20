Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF72E06EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862344; cv=none; b=loDI7ZEw0mRosNLGL3GsI4lwSoH4h4hsLI3Ra92roRiVJdpgPXHRZFJO5hiY7HbFddZ5/LhU5N3fkT+xDwgOP2y7dPkU7lWlbnxaprDmBuqkZSpEKgKc086yaKak+OkRg13q2IfONKYtUPjVeJCtt44LbpcaN8f8Q8jzVP9No7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862344; c=relaxed/simple;
	bh=mZq0yfkxI0vUOqJBAiG1d5Hp27SaDebWQ9VnPmH0EHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X3+PTT/nXdS1XrG2NF/OX4oP9CYkmSAfxXkpv4jQQAb6yHbaS1fVi3mTfjhPGH9S1dXTDD0AASEOhEvlFe3tIuA5vEA5BIxs4H9YkNk7elzhqFy6ewkMMvjXDpUOUX841D4Sm4WVU1si6zFPcvAWa2LSN5t9AAAKSDesNpgsBxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9dbFpG8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9dbFpG8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1651423a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862343; x=1792467143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIaOslUUuQA0fJiLjrDXk3itkuEZwobsIpmCK9CnT84=;
        b=H9dbFpG8HKMjgPFD2bdZ26r+bdVGP48TnY/cxKnK1wV9lPZ7BlFjNTKjZ0DQQ7qUlH
         PB+am0NuHe0EyLZ8I/4AFt2OPul3Jd4b8lftRVgr+DBZwcPwy/r79Uorcde6E2GbexS9
         KyK5/+sRIfoHHxC/i9XIJwvRl0vXZPzFNAr2MaElRvciXRE4zNC8pstrGvof3DAuEI9Y
         DBaLOfKBHnK9gf7J7fk7J/DCoYZVVP4vck1NHJHvQDVo2Usa2fbhCfbQBRjGTBkHjRJ8
         MXleZdT8j7rnGlRar+UeHMkd9jtKZDJR0vcUzchv7fIuPPlpsWkV0pj3/VZND1Gs8/X9
         G7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862343; x=1792467143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIaOslUUuQA0fJiLjrDXk3itkuEZwobsIpmCK9CnT84=;
        b=T3ScH5K6FAtYZUm9MVvWIcagKm3J1Ht5mxDswqJcbxdSlH+jgR2G/X/tOGND581e7W
         iLHzW3XXr8t6NSrX2qz4vX6FX+pE8jlSRscE9ehWGbzPuPC2sXMoBkbTQa7O8YM+1gs/
         +K9NW2EjHp4Vi1ELpW/i62/RXYe0QCF/RrXFcZIcrFQhFp111PRPZcN4rKv/VAsiaibB
         vgiOTfnpmaz5+oI5a8lmax4RxWsuLw3SBLAN/pqpoGlh1eA/8Y3afSURJR1zG1yyatEL
         2IUciiR1Ss1dDiPFOpY5WvBC9ye4TXrYXYzpkflaLj6w4bzbWjgUsA3S4Vq/4IRd069G
         WhuA==
X-Forwarded-Encrypted: i=1; AKwUvBxXrWN7uUf37WDvdcY78pAU/UlRgPmA6LF4baH9JN/Ez1MnZ5uY5LxDzAkXep2nmpADOPxEapnXaJmlZzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZD1P+/F6OOqqc4yUbDENeiCMNM8Caar8/LzsChpMUYN4bGt8+
	+k+gwVB5it3cqDHtcapAVaP63CNQXnzXnTPi3GzaU3unSBXDybhXnoYh
X-Gm-Gg: AYBFou3hJusRDODAZwYeBm4X5f7LSf0//BIrA+Bvtad1KJiV/N5VHhmbunCy/M2mA2E
	s8IxHrs+S30IMI2RUAI9ORx90xUqh0t6T0kgBgs4lJ/9AJ+PQLCsrROuSwXZ+MbhU74R6tO/4d1
	WjcdKWv8unDQWAyKrzXnruQT9LawtnrDdKZ9YybVLECqHvzQwXkhKk1kferV80jPfu6/OviyL45
	gUgvr9OISIQEvQy4mZFSdVZbsPMqjy6+w/RGklRHS1yzL/WO6hrlOuTdS47+jnx4gdt4DilgWOe
	p9JD/Y2GNx4YOsx1C/ko07XsvV8khQmUh+uy1wc/lBkkPKVKjC/DwLgUYuBlZJkVzH63h7232bw
	HDyIoo3Uw3dQndmXxlpG6B8ghki8rqjrD6NR+TEZCe9lySMPppBhj5Bd2Lok6KEWPRSGNQ2BGzD
	bVkuFMut5C7nNPqulVHN+RmDDYO+7UdYxIXzKEact7T1upaHFrMeV1U+m8ZktT0wpfS/RmqA4=
X-Received: by 2002:a17:90b:1d48:b0:3a8:d01d:327c with SMTP id 98e67ed59e1d1-3ab3ab3762dmr10150604a91.46.1791862342549;
        Mon, 12 Oct 2026 20:32:22 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm19541303a91.12.2026.10.12.20.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:32:22 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v8 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Tue, 13 Oct 2026 11:32:06 +0800
Message-Id: <20261013033207.1684328-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013033207.1684328-1-zxyan0222@gmail.com>
References: <20261013033207.1684328-1-zxyan0222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

timestamp_interrupt() derives the EXTTS channel index with ilog2()
applied directly to the PTP_ACR channel mask, without a zero-mask
check.  ilog2(0) yields -1, which lands in event.index as 0xffffffff,
and ptp_clock_event() uses that index in test_bit() against a
PTP_MAX_CHANNELS bitmap without range validation, reading out of bounds
from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an interrupt
arriving in between passes the flag check while the mask is still
clear.

Check the mask before applying ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index b9a985fa772c..2a076e228e9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -242,7 +242,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 		       GMAC_TIMESTAMP_ATSNS_SHIFT;
 
 	acr_value = readl(priv->ptpaddr + PTP_ACR);
-	channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
 
 	for (i = 0; i < num_snapshot; i++) {
 		read_lock_irqsave(&priv->ptp_lock, flags);
-- 
2.34.1

