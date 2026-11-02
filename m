Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614293;
	b=45SkkMmrpMoaMGkkYSKMITVodpa22Zn45t5OiTDbTYFBY2aUhSmy1qIjifARTYJh18Pn
	 AuWUjAuBm7Wc905LBetQliW7F+D27ueagHdgHpl/aMbRZqtodtrvX4uq8Eoo/ETxaPETg
	 3ci9BSIUIoaoReWK1THhRR1XtR/Us3y/e7YLSyz61VzCHTtRwZLSfq9FWKagZ6KKA3jzT
	 2HkCdgsaGzx71w+vAqC+p93izKhBJbywKjeolr17Vc1pk7Pwc1CoAwLgK633uubPwjanR
	 eHdaMS7MPAnwZH/6MHCpS2YrNSmtAR9NviZa7y/gnbtfTaaEHGYWm9MfhcueWZPeENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2fesLx5j3c6ocneASa5f1jcn6vQE9b0l3vKBizXZuJY=;
	b=Y5SVSHr+H9PZE5w8izE+nkanRW6r/gt7gC+gaqPyokGR2H203KHt7eBomb9qhrKv4z6M
	 6o0HUF7zXCDun5EvyozvxLzSkq4YGJ2t9yvZNYX78zSPgndxMWciGrUf0dJEAZmAerhHm
	 5Kmn60xcv1DkX25xvAlxhC7kTkrHXsjK3g8jLK7kJ0bmslBtI2tSEId2BUZ3DhhLXUhRr
	 t4QjPQXPStz7iOny68X2kT//y89aWw48Fhy11E6ZmIfIQvCidwaTF8elAwbNaLd0Ou8T2
	 KT79aGARItVVPUbDj0ppJNIdjvRCsEES6hHYrKi1XDslt8FzPEdwuQlM4JWF5vlj7zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BS0P/Yey";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D97D606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D97D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BS0P/Yey
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e940d5d2beso10218935ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614292; x=1794219092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2fesLx5j3c6ocneASa5f1jcn6vQE9b0l3vKBizXZuJY=;
        b=BS0P/YeyM6aG6e5heswCcwQeFFffXjiKuRIcmTIFPii2q+J0iRslffoHni+2Vwm2C8
         sJMXnOrriGjE6i66pL5WItmUwuoyiifPUABVxfHfnAO9zbZ1OL3G31ViFFhACfdZ4vzB
         ijMq4mz8WlyRKaTTXBwOYag5C5IAxHZEUcwF0g2NJdtzRFEZVVNGNhrWiQN6Xzysgx0r
         m8Ts/DrsNGnGQOPg8UxvKFBuEysUICKNyh50ACb/K4HhEDoVpMTiccaHPdXnDzfUKaX8
         l6p507ZWOC9VXDDIA8fdD4ICMnEBkWuPaW6SHHuPXM872/kWcOviS6qBs56I3piNWy7Z
         zD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614292; x=1794219092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fesLx5j3c6ocneASa5f1jcn6vQE9b0l3vKBizXZuJY=;
        b=kXwcpO9flVt8e94iJiD6LRsCldE9o8iWiq2UNw1+6msp5kmntSMkzA5DFe6+MYU9zo
         PXzWbe0YYpU30k3FlMMO8g0P/OEjxlBNHGjbpNOiDUBGc0zm+XmANaBg1UA909/IOTKg
         WrinCEolC46PSA8Yb84SFuSBwP1bjFxlQLMUolZsuhLEEmot61LAMQ3W3u7DybydgFVj
         SNSd9Mk96dwtQrnYTpD0TOKJLna0yxaWF9/jQKhQc50NB65HBk9reM/DscAITkWR2kd3
         EprKVI98B9iCesg1DKa1tk9YiBZ8KFIPfDAtm4ypz+Bsm3dE4iqIZRT8sMIor5cWs1BU
         RzfA==
X-Forwarded-Encrypted: i=1; AKwUvBzfz13BZswDXKVTJAO4qWjVqBY6sfG7I339iMBajdFr0Y52gh/808ol7lfvr9RBPb+mj8PFeltcuMcfrRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JRIjQvey+OxGZt8CLGvlZ4ybHVShUc/rAt/RXW+wR26IYRyw0
	aFFs3IVSaVu5Eyq2nJNBlTEax2ltxg36EZF+QCCER0/3xX40NvWXZczgWwlHZw==
X-Gm-Gg: AYBFou2B5YJJDaNJnOSWJ2QVdTvHsHsoe3SMGGtfTU6RhsBbNWZLmMlukabFL2wxKoY
	BDv1cI4Mg2kKRCXorrecj8kKo8S7blf6jXslQEVkrfntKiJ/lKzFTFekhiFzAjcD/dekfvrjdij
	w4rJiLM2N9EEaXI75Him5+wopETVVrxCH/WjgZhPiBizIKHg48JIK2nzo4q/0S1tcHoTkMWlmZT
	1qhFS/h6xUPe77mwwvvj9JSOX6qezFs0ku0Mh2pR+OVCH6+/+Gj6mLmXKYekL/vrTM60pCr26KU
	WwXi6X8CG94xKb72nXyylUoG9c1VBRxCAk4VsOwF3ygDRU4ONv/ZaNO4lT7I/wzhuoegM38V8LO
	3ftnxwamQH8t9JQYfyD4+zP3epVPe0ip0Qz573VPrLgYCp2EbFJ1//kNg95+HvkB3Vyq9kuyaPF
	Sz15oLVBVzFzNDFJs/hprOPEmy2oWx5OMPteErAmK1z0lrJOwBnTyUQJ0XVuKVQDomToqRNMtfg
	FJPiPp1MAyy/2qMhrGpAGOA+iXILYvJKDDfzzhWL6FjrP7NQ5QxZdmxr/A7QEzKwtDl8Yl+CU4o
	YRBvzDPIZ82PTf/T7BsMkGlv96iLIVGOkP0MnImZcKXkqy//C4YH
X-Received: by 2002:a17:902:d510:b0:2df:8d6a:3548 with SMTP id d9443c01a7336-2eb3646e48amr84625755ad.48.1793614292469;
        Mon, 02 Nov 2026 02:11:32 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm25667235ad.32.2026.11.02.02.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:11:31 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dsa: motorcomm: Clear the MIB buffer on chip reset
Date: Mon,  2 Nov 2026 18:11:21 +0800
Message-ID: <20261102101125.3523835-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

.setup() can run again within one registration: removing another switch
from the tree tears the whole tree down, and re-probing sets every
member switch up again. The hardware reset at the start of .setup()
brings the MIB counters back to zero, but a MIB block kept across that
cycle still holds the old software buffer, so the next yt921x_mib_read()
treats the small value as a 32-bit wrap and adds 2^32 to every counter
it extends.

.port_teardown() keeps the MIB block on purpose and .port_setup() only
zeroes a freshly allocated one, so clear the buffer in .setup() together
with the hardware counters it extends. The published stats need no
handling; every entry is republished from the buffer.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..ff17233848a8 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2458,6 +2458,16 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 		return -ENODEV;
 	}
 
+	for (int port = 0; port < YT921X_PORT_NUM; port++) {
+		struct yt921x_port *pp = &priv->ports[port];
+		struct yt921x_mib *pm = pp->mib;
+
+		if (!pm)
+			continue;
+
+		memset(&pm->data, 0, sizeof(pm->data));
+	}
+
 	mask = priv->info->serdes_mask;
 	for_each_set_bit(port, &mask, YT921X_PORT_NUM) {
 		struct yt921x_port *pp = &priv->ports[port];
-- 
2.53.0

