Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238507;
	b=ULOBVKXD6o/SGcM2EeUDsk3Cyv2bvo680Z87A+aa8y7qiuW6D4b3IxDNJ64YIJzNHBUQ
	 oVz2gc3myEm3EfRPt68D+eK4CNXv/4EAPw6nDBTnW8hPS2qsoi9gXRxymbJ0MGoXjVOso
	 bxKigjpub+veewZddgUCsqVSByXyk2bAloyKIjGhhCLvgHZLqETxi8JM3Yd8UlT6cdf4T
	 TfDG7ZKVMEZM7s3jvtJOjKj5fqgFSj1Hph5D3oQ7icyzJAo/BqFsD5EWWT3hsc4fJHkfp
	 37BshPwpddgHsahUSsvp4/nUqcndad0YdWlkUMEC5l0hZnTNe3nwuY9RWhPiCwMN16g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CizwUurk70X7nA6lsoO7aEQ60mrXQuJaTvlwdSJU5lg=;
	b=W9tT2cIDYJOPj9nk5PWcV64PRLIzz9dVfwQySFPPfTLeRu+sxrkk7OORbsnxTE+ZegQV
	 nccFfU75G7IYJ8wCfL2pX+WPPZSKAZf5ZRiZqefAsslvv7ulB01cLUcYlsSemUPH9D9JG
	 dMhqk7dgRFunQHDRbZTV8x8IWMFPznS2HVAUoV37wZeEgEhmFY7zABgEXKMgke72I57f5
	 2u4EBD8lVkH6Fz6mVD9dw1is+fG1sap0RmRjVhQRaMZFkMXYi/nFcRpc3Xs8mLyeO/dgA
	 dKUEJHfPXdTS3gj5uqUTZRmAUW224TTQwOjO6uI4J348MpasqZbFTzvCvAZeLuQdXPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2nZmVXp;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A580606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A580606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2nZmVXp
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso496028a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238507; x=1794843307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CizwUurk70X7nA6lsoO7aEQ60mrXQuJaTvlwdSJU5lg=;
        b=M2nZmVXpfQEke+a6ivWmJK0LjYpReYErCtc6TwvFIZi3+Ul0BRW4SJquWnHe8RzcvK
         JKYQ5dG7hD3IhdXKYz21CEjPGH7uEk/LVAv5rk6g7TOr2JI5BAaiPXsX/YheFFJGDI51
         PdKuKcmSDyv9f2jCxxgGXDH2mjB5PGhtsqGyP9fK2GnxFSIkmYvte7VoX76eFavrIQ4e
         dh97gMal6pPNfVvU18SXm3Oq1ZeMflZ0QOVo00bxOC8CFjEI+lH0rG9OyHR/oFUdaYpK
         ajPMLFx2TlvdfOUfM12L1UPYDBHaX2FG0Gyp6ob1W7uPGfgRDs9V/3XNQrGjQ/3xPKEr
         vxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238507; x=1794843307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CizwUurk70X7nA6lsoO7aEQ60mrXQuJaTvlwdSJU5lg=;
        b=mhSAOo1QT9ZzyGTy01aa+Er+H3p58XvnBoc52GtjL9FWdSlecIxEBBBrlyrj9tQ63s
         YMANmO0l4MeIh1lcD+ioFkgFFhHJzDprKh31M3ExGGtfLT5PBNclPJC4V+3vCzL0YiaY
         x+gkXL4DvmeEDMUwEvKJSx2KiTwmUpGfnneASLpj4yhCSsAIZtP9zUw1tNJakl74CFtL
         4SWN3tlw5WAmG+MXzwvDOHoiKkbwYl6XxwEHUxGfpLWRkjFz3fWtSmD3lpSq4qZpYlks
         v0ANO3Lbs0igjExx5/Yq6DKWusSJlY1c7dVuM1njxKc/B77qLrnJQ4cAv6tkIERfpeoY
         e7sA==
X-Forwarded-Encrypted: i=1; AL+hErH1DIqKdvhKDvvBDGWDI23NFZlPDCIj1MQBD2nsWrOpnkj60nVX1OD/w/dRjLX7SFrZosNIkXIvb9vgHM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iL/dK70V0/gBeZ3RW1oIBVOboKNs/WShdBXottXs2Bl3Ht4OI
	AbwKzLPK/CNQjXuAQNzhwzXB/H8v2PPGPHyX18A+I2CE/WTHfYjc2ZXL
X-Gm-Gg: AYBFou0mKqIQ65RvpTihEReqeip5TLo44EalcwvDxy245RCLt1RHEObuNntE+va+KxE
	BODgIVudqO6Ud/E4myWiR29/NCXzi3kP4U1YvqfXWb4YtuoVJN/Z05QmQ2qqCkjTKHbc9FxePVL
	HGaK/EmgE7zoDO9S/Q/xyJPvyoe32wv71bdNxXAH0BEkAzIll/1vCPvFhHaW4G5mFKfe7PdX3+2
	0IFB8q9Z8OWbpNa1MvyNStPh3DbJGtmydsVplu+gK2oaLwce7PBL055eTCKTfYdUmZb1jKq4NlA
	Y4VepRutgK4cloAZ9QECsfNvYONxM82utOSBm8sj8d3Xl0fZLdbLD6qO03uKkCp7odFrz3K3u3S
	oVv51DUfVVCIQz0oAsDc4tjjjqCfvu8gamuV111qxz0n/d03mZ6tu+XDHcgOow48pD4vjrQyadW
	w51AMMi+ok0JRDTHswMq/FakIDtmHE6Xv6elvU8/zdQuUvKVcsIZvrRJ9zJWJLfFQCEbw7ImFra
	lDZUg1j60V1dzTxpXUaVHKQbup1zjDC/YCWfgzqAEVtTYXHNesse90zuC3/bJbozJYLMmUvp6/a
	tyybGstum2+0GaaLDOSfgt0Com19GY5iORqtBscph5rHdcFvZ78kYC70V7WpAMy/K5BTslO1QqA
	=
X-Received: by 2002:a05:6a21:3e02:b0:3e0:f07d:a73 with SMTP id adf61e73a8af0-3eed3c68071mr3299886637.33.1794238506548;
        Mon, 09 Nov 2026 07:35:06 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd88e5fed3sm321246a12.8.2026.11.09.07.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:35:06 -0800 (PST)
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
Subject: [PATCH net] net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
Date: Mon,  9 Nov 2026 23:34:04 +0800
Message-ID: <20261109153407.1761032-1-mmyangfl@gmail.com>
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

When adding an fdb/mdb entry that the hardware has already learned as
dynamic, the learned ports were silently converted into the static
entry, which DSA loses track of; the entry is silently expanded and can
never be deleted. Replace the port mask instead of merging when the
existing entry is not static.

Found by code inspection.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index a7a9a7439304..6efd74e7eac6 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -805,7 +805,10 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 
 	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
 	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
-	ctrl2 = val2 | YT921X_FDB_IO2_EGR_PORTS(ports_mask);
+	ctrl2 = val2;
+	if (ctrl1 != val1)
+		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
+	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);
 	if (ctrl1 == val1 && ctrl2 == val2)
 		return 0;
 
-- 
2.53.0

