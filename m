Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796649;
	b=FHeSlb6vVwbrLDa+r22d2KTLuDOy11CVjjdGrZ+9T3CnDf/ki+HQxuRnvDOzl7jD7P52
	 SAWNOjzYA0QXWpAbJ+IXRptSBmH7X9ebSB5gmChynaNxekBeQRYSiSqEY+8ObTHvJZwqF
	 AIw8HyzUcH1Sp3fP4aGkxNGi1bghSnGNyArdVSBCuagmGrpEyxAQklUnnUfebkPFqj0G1
	 6VBrK0aLpG8Vq73vOahde/u70O8xAjvyh8MxLXuGtYmMF1w67zaO2dQSA1hF7k01lcjAo
	 hGkIGzRTe6LrxpcEWkrmDveVZHoobN+MHnlGFctrhbOVdM5qDLxyiAL90J8grWZAffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
	b=UCFNi0UpSwYqPuW0x7qidp+iGLXk47+j/kNBuMB9MYKqPH0W796x9pScjGOc1ebzbNfn
	 o81LLl5JLUeSFTk6oQ/1vq+ltL+oWUdsqFwp+RZpSZwR65/hQJhvXhzbwWu2axOXav11O
	 lhvWR8PUHNsBq+uievBK8cHlFamRgyD+Gk11AU2GatREdDS02nCskB4iua8FO/lrXBQnW
	 P7PigJyh4aWo62B01JYDnNGlLfFDKHZOsg5PRw9YhinTxXUviQPbJTt1FvT7oJY0tj5zQ
	 RdPxUMqabOnamFzfec5AzP2bxAUcpfvccq8zVVU9tSqGNTsMwvFdgs7UNEAgRup/ZRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NhZN0Ywz;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E14606EE80
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E14606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NhZN0Ywz
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso385374a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796648; x=1794401448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=NhZN0YwzBH7ZrkgsGG/YF8QhTT3boEzosxnAlYxL0Mfs4xCz9Ik/mIck/vCG1BwJEE
         J49qe7Ic5x1qY+/bU3EYoLqAfgZT4zLbQPc0nHThPrd3fInvj1X9JT663kl2QF/g/BZb
         zTrlkgd5yhiOTJ+/jCQRx+wZ27KiW2+Fp+EPfJS6eX930Bv74BQrIYl1xOp41AS40nk5
         eKV8jPf0x1e/0kPx18pGo0WtlTNUpx3O0/AizkYdFL4QViI8ubbgCEZHnGmeGYaWgxGx
         BNVEv6B5oNBdLSjqKlmYiCUeDXUTVu4lBWiv/kkT3owRAmhjGDcZAMJYKzvU4elLNUgu
         X+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796648; x=1794401448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=S9UvKvu9WhW99PniLHifIv29CuV4KjpDn9itYkj3D7VCjJrbNbHM5z//NDLASwNbCv
         QUusdD1odMzj5FX4DQu0ktzFwhsIyGUv2s8A+VFzm/m8Aa3KLI05Io3x52miLV6vbxTP
         YvMXEqiIiqLoLRT5A4Glnyyk2WN1IR30IEx2OBWl+2c/DTZ4Jjelziocxyu0Wu4xrMu6
         vokt4D8Yr3Rn/fGB0W4JZXMOHNVN/Vdw1wl3yPFu1KWlFR/8MsV7i7cJAfOPssLk6jDv
         P+s6f4FdWqxVXjL/N2gU5kHHlhapDM8LHJvCWw/0RXP851elb5cs7/uVkP040QXnAZVx
         XCPg==
X-Forwarded-Encrypted: i=1; AKwUvBzxc3t6XHqRsMakmBrQQjVSvZ30xdaRy0fYigJ/1JztP4yjXgEMUi60ONQ1rBTPixrG+0OQg9cpK6gEex8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ALnAiEjKApac5zN+igdsImTm5wcKeVOgzS7W3+tN54u9Pf3jK
	Ehi89gjx2Jtt+uTRCC2gvQ6rwNfveBcDw0XjBzLb2jZq6J31MzP6SywU
X-Gm-Gg: AYBFou27GVF0wCXmnGnWYKLsLxaM878DqNUPt3hp100NmkIz7XnJtSVmUvY1n7YkIzm
	13Z8saQ7BOtrNGPHqenKgl+XuXrTa1+5o/HkS78Mj6ZzYj7jw8epaRUPxoKh2pYYEINCZ0+4EyQ
	d2Tpznd3JvqcD0mwQbmnQDnkN70EXecZ5AdpI1msSVYS4Yh910l8RCrhGxWfzT5IXKuYTJD5zo/
	2i94V4V/TDuMEJSJu8nPmRBFIXT6ftvUjACGaC9fUkdbgTSpnB84U340+zMLvIKlBQQe1gRQf0O
	6+4W9NWPiQ2CQHsODz4Cn86wTtjx60jIF98wugIG5wGLO22qlsaZlv5KsmEFDGvOyoRJkYqs8NZ
	SNvBPD6E2MqLwzRbPChyPSNG59gkQJ27N7XrbdN75Qww7MzjmmZ2fdZ9ujpf1/ER9Jy0NnJZbde
	x9x7u7e4dVlfXiNri68RvdBTzls7Ci1Ksecp6rdEhr2UYqVnfmRXW5NBVFVu37kcVO84GxiVPxC
	+YnLkfoYuFS5Obr0dRzrqZ0/ErOfu7dugyAZRsmgr8GgaT3kXSzvKkE5FDim+jAQ22s7fbDY4Pk
	lqncpzSLg1fWw4+GZmd8fNasm7T9
X-Received: by 2002:a17:90b:4c52:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3ae897ccbfdmr13704831a91.11.1793796647941;
        Wed, 04 Nov 2026 04:50:47 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09449bff2sm3920799a91.9.2026.11.04.04.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:50:47 -0800 (PST)
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
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v9 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Wed,  4 Nov 2026 20:50:29 +0800
Message-Id: <20261104125030.1183146-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104125030.1183146-1-zxyan0222@gmail.com>
References: <20261104125030.1183146-1-zxyan0222@gmail.com>
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

The generic timestamp_interrupt() handler derives the EXTTS channel
index with ilog2() applied directly to the PTP_ACR channel mask, with
no check for a zero mask.  ilog2(0) yields -1, which ends up in
event.index as 0xffffffff, and ptp_clock_event() uses that index in
test_bit() against a PTP_MAX_CHANNELS bitmap without range validation,
reading far past the allocation from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an EXTTS
interrupt arriving in between passes the flag check while the mask is
still clear (snapshots can also linger in the FIFO from a previous
enable, as only PTP_ACR_ATSFC clears them).

Check the mask before applying the ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 870c740b4a50..fd1142344950 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -245,7 +245,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
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

