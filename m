Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231937;
	b=DOAw3Agq+viD4nqYhnW38OWwW5NxvAQlBI6EJrtqbQbWgUN91rEFM/koIuBMvkSATO90
	 h6eix3MLcIGJnAl9t+X3O5HOhDTLZTAei0ukdVHAcxaDPtnNW6BchVCIfTap1Wu/0wu5V
	 Qu0H7vSTg2NaAH+AK3IfXYcwizcX7d8pl4vCYj/zzohR4evv1CVXHqu8lLb4gGZXvq4e/
	 RsBBD+ObRhbeeN1ZnHLGSjmYSwpEsbOPbME5epHwY6Ex7SBoitYnRYytvvmrVpxQRITS8
	 AuUhAophfdRfM/sViaVmKIt0Y1zEMc1gKO5TlVIYpRY9kfVKfCkgSNe0k9l/EjGKPPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
	b=Zv5IlGDtBPPER2XwNorOshEW+WHr1jZv0/wva33a/zk/hXQx2f3hbeLWlDu4dGa3no9h
	 2bw+N9+ZIfaaEoboC3zoiGdflNTydZaE8PtzTAJnN5qb7vv5lk5gmlCC5+Nt5ESvGm3KL
	 ACxeOIvdKPGyyTeWos/+YYMNb1KkhoswNEBk0slOa4QviagflWSAQBs1BybNWDRTbyyNW
	 EWk1BAvjx2o8dq9ww994BvfduXQyhkz+CKldsSjsLktm56D92tXd1sT67mNpBfeSwI6nd
	 MFoL7cfYeKjpKs0vzn+d17APu4wbIFIv+tOkaDbrc+3NaqffThIwwh+P3GuNIDNBVzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ML8NWqVv;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E4606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 315E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ML8NWqVv
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e96502e447so7258565ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231936; x=1794836736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=ML8NWqVvehIScf3YeJPDyqwR7Sq+DsRldBMwGKpOSjUFrkHlf0iAJuLc3ijanriryM
         EOFUr3tJvLiezYub615EhDjHVxG/uF0T0Ql42/VBcjraMQ44p0tXJAELx8HYcIw8SSIH
         bbq7bc5+d2/nxF3dC6owyoyZlzm52IdkwKJDrNW5Bnbm9LarPk5i+JjsybWa0nJho6aI
         wrl23jRwnx1I4xlcwMdra83YpSG6Ync5H0kZMykIXkbF+6RBmptts/d3CCBtIi897z1B
         VGgnM6JZ5JXqg9eT4PQliXY08YdM66zeO2SSKvBM4vNUEVmj7DA/GW7PtcYH9397yHyP
         houQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231936; x=1794836736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=pimJJZzRMLnL4c4WYY8hElBFh1TqccpjkMA7VC6HAEY9SHatCUNz8AbpGxSAo4WU0R
         eshkAsadLzLFGYWpa76XgZ+VefkhOTA+a5JpZwYg4n5mSl05IMAAc7T8q0zFsR6rd4+C
         SRYmJUyifL/vTc4y4oYhXvAtPkue2GUE4C8Lu3nTx4lA6JxX31ralf5eiArCuiMJK+uj
         plcn4dIsu2zfoxGlfxacPrLeXu4014khdk5OD/zoZSFbmOW189KVrUm9OAwSnEZ1aXO1
         w3v68Ykxc/zfiT+ty90wv3E0/jf5Cx8b6XFSywylvig8xtuV62wOEx6T7+AZgF7OxRjo
         O/hw==
X-Forwarded-Encrypted: i=1; AL+hErHVaqwD+HOyAUYKiSId0sTWyy6C9NupK/hv54Bq1PBPd1aYwj7DD51zh4mzJu+eHiwcg/1D9hC7OARWE8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lAvNjA/OH6ud4HZLEgTrd98+MFp8PN5JnAgK/59k0h7wP6rdY
	lsTelNXsIVGqAw0EZy/in647ytzJFmFKUgjERLz3TuPxoMoeehjdAvjq
X-Gm-Gg: AYBFou085VYU2qT+o/6HGqHlIjvLjSEdREM7MVwBm4vMCiSezbhWiuFDzu6dN6H5EV0
	/OYfswmOHNDrFTsyBufmNNDxmhatZd8riYgHF6F4EdxMkDAnD4rDa1v9rvwAWTyGKBXxMiqzraB
	cxCgyI4KjURSO3gSf7U2/nr9C+E3oH1fQbv/eV+CGHICHC8P8mSogSiDh1F0F/8ZelvHxrWy80Z
	uxk8cAtrmYMpRGPPPXBmWSpKjIED3WtQ+hXZ+yCeei/g9MfMnA1RPrSJH81k8v1VmJ/FjG75hI0
	RNSpEYeoDhI1FYYWsy+s+2tLPLmkk7iPTsJ11NDH1pd27Ag37gQlG5O2g9YKNiW7WzUx/LrzpaH
	PZwJlP/XflvNMsqLpHdrlzAYRKlujJxJElKkEaj3o3XbabTiQlyLcBpL9HLkO2wVWKXknLV86iD
	ltuCCBPMJZRLW/fnNTacyduTRDBykIw/F1zUyEpB/z3hfWXhhP7vPXoIgZpkNAoofwZcZTrBG4v
	zr/Bc4tPB7qmLhhokdsm/eEU0+cdh9VskTMWqs7OnQ/nWlaMEt2YAVvRp9wIjNQuilAN8ofHijb
	1saUGU11eLBRXH3IPdK2pUJPNWo2
X-Received: by 2002:a17:902:e949:b0:2dd:c100:a5df with SMTP id d9443c01a7336-2ed837a98a2mr40597565ad.51.1794231935615;
        Mon, 09 Nov 2026 05:45:35 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81727f9bsm11014285ad.57.2026.11.09.05.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:45:35 -0800 (PST)
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
	rmk+kernel@armlinux.org.uk,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v10 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Mon,  9 Nov 2026 21:45:05 +0800
Message-Id: <20261109134506.2794160-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109134506.2794160-1-zxyan0222@gmail.com>
References: <20261109134506.2794160-1-zxyan0222@gmail.com>
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

