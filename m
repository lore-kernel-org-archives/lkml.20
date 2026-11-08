Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174327;
	b=3/bqWVtnIJaaHIGdqFD7YfMIACTJInl1NbsOy7boXwzlwcnVEEc4QDQ0juYnSykxZ1in
	 /D6pUZ0aN7u/h/p2EfOIioUVK+wIXszHI2u1AUnZZq4KOamcJWs7dckt9+jgyW3rvlCKw
	 +rpcvOTnZAQGwqt6IqFMpCl2VqqhqINwDa9vdtp4w4M1Rz3I5OEAA33sOLWSNnK89Et9E
	 x6mwNNfszerRDHCctkfq9A5eL9D1QG0C797nBHyYT9WHAGjRZPpZafABsdeepzUozSLU/
	 8QalvENDVrMyeAMu3XuSz/g801Bc5hFoALELOQp5h5YgF0KeVWzsEIsJnvs6++HE7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z6qsKejGug2sNisulG4c9FY0DKxN3PKWlr+7E8JUKfo=;
	b=ko0ddl+rCPX1zOKOht6avgeQQSMaiPMxeJai67Vyq+sL46rHwVYYolDueaSIlsxqfaDJ
	 RE7P+F0fQ/XtyO6SK/1DHogml9UGmhwXmfSrNMKqlWM0xEqkLn0/B09KMwpcGuewVSBE7
	 OCQEADa7cKpoaJulIvBXIA8qbjfqfB/MoRu7tWIVb6S9DHyTq3tUpldaG5iNKNBACkNcY
	 ocucnkpAI9/VBL+L4bAU85bOMYDwVxJgWz0uPnFqQHg/9X2XzQrSFMQEKH7JM+eCAzuTM
	 HmQbiLBRAAnFl3g1OdYSkfsgy5HsbuRGxwXwG4wvRBUehk2IS1AHwelUi0nd54vVlwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uIniuxtr;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5A1606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uIniuxtr
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed2b4348fcso814405ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174326; x=1794779126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6qsKejGug2sNisulG4c9FY0DKxN3PKWlr+7E8JUKfo=;
        b=uIniuxtriHntxbvbeL4mp3CAX2eRTO0I5fFcfZVvz2hPhBdp1WMReQspbGh3OA/697
         Nt2FYUMaMvD/ay8l06g6dmEBj+iF+qLcsTM70HXrZd9VW/21vxZKKwizgxzuH6ahvOoY
         s6qmvE07gW5Oi8FegF2dVg8Qrm5+2SLnXYHwthn9P5zmh6R7fk+Yj9KiinzWUMdh81+3
         FZjALoM2XuA5m6a9+kNH1ZMzUwf4U3AKyGNZilrbjZ4g5OKg+oScvtI1WEBL1XdmyBlV
         mlhqsNBkrLHZhtJifxqETkodXBvZaDQcIJd4ZxIUA06Bz95dDh0mcM6ywQaM08NAO/Kf
         trFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174326; x=1794779126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6qsKejGug2sNisulG4c9FY0DKxN3PKWlr+7E8JUKfo=;
        b=XD876ZDVHJt2byxnEewzMB9+hXaTJlZE7RGXgrb/iCIYKZ90zu5U8/ztj2IOSYLQ41
         N4GwwcLw2OZyffX2PXDWpX8/omQp1zMTjXQc6UVut/m+vrlZEOdLFNo3yMEGcBkVM5IX
         0J7UK31YdZ91Wkky6911ENImh1jR6kgWQqgaa3K3UhK3+ZNk+sOSnO2bXpU8iKlrbKFA
         qV0Ljl4GS3gnw4ST4Y0ICmTHW7K8W3hnLduwMbuUoOZzpSYXbfnwpQ5Jl8kKcMpAeOln
         ne0WDIqIogu/QFobHSfFObMOWm+0hbGhOzXSGECJrgcZxWyHHMPkAqzQy2CC1c4J5Z7h
         Z7sA==
X-Forwarded-Encrypted: i=1; AL+hErHJ2w3pd9E8tLlY4KQaI5sURqUFyXwz/dzsLpQ6cCd40ooChSseDaV6czmF8K9dVxRNHpN5KH1Ph2zPC+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yOITol74td8rmF6vjKMQ4bNEEQDlNOdhsMXjwoiOLX+i0quqG
	6tthbts0ImR6hF6NgZMYV2tAm0NHZh1TLSk52HcIa4cXBa/fDd0zaOBe
X-Gm-Gg: AYBFou0JS5/Ld41Vbo9+jYhBulx+yYZMEM12fFTP61OQRK8IaKz5KyrWlMO2/zOaewU
	LiS+x5s3OW8WdBeJj9aYno7/JhGbP4ry+FfPtMxmI9r3rkWIbF6MZUM/4QXamjApWUxvJ2axg1/
	BBGZbDswTYcVQaGApcc8k+hM0nKGCJcwK4qAKqEfpRJ0pbqJxzmJIO5JzrBT8HODuo6qOhp5X8h
	0KS1bk82GIHrUKZ9wJ82uCNaDjx0N4LI18CI1W+/CDb2J77woLM2KoRZf++Vb1O0NritHQGiiKv
	1P8XgWuvi5xQkpma6Y345oDwDopwbPssUPLElcYMxw83lfV8u3AFNvKcErzBocCc/GdVquqj2AF
	nfkeAvNvRk02ztqp/dax2QXQBGKNapAsNI76K0XS0lwytAyR0KsBEu96sSfkPS8teEuuf4lKC42
	P9cBr6kV4/J/Jk8h5yKKaivDO5PoybPgYFLDZb/1d1HHLphqc/oRc9IwfhBRgooKqaajjYBujkm
	ESeQ0ku9fTZI5BOpo/2mALFimtxgrXlDmrjp62hbpDqDCKIZthUFCHZluTbNwC0MQWQlCHhBaNw
	hNGkMgakMDgGzotxZZRvo/H6jJIRuMJMN4xaANh0sxvVuiltOPF8oiPvEFh7BD33mbpra/W6L2k
	L
X-Received: by 2002:a17:90a:dfc4:b0:3b0:a7da:d244 with SMTP id 98e67ed59e1d1-3b12d4beabdmr2746884a91.30.1794174325799;
        Sun, 08 Nov 2026 13:45:25 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm4619463a91.4.2026.11.08.13.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:45:25 -0800 (PST)
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
Subject: [PATCH net-next v5 6/7] net: dsa: motorcomm: Report inconsistency on bridge join failure
Date: Mon,  9 Nov 2026 05:44:46 +0800
Message-ID: <20261108214450.1662362-7-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108214450.1662362-1-mmyangfl@gmail.com>
References: <20261108214450.1662362-1-mmyangfl@gmail.com>
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

DSA does not send bridge_leave when port_bridge_join fails, so a join
that fails midway leaves the port half configured. Rolling back from the
driver would just issue more register accesses that can fail the same
way. Set an extack message on failure instead.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 46534127d070..3d4aa79ac026 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1433,6 +1433,11 @@ yt921x_dsa_port_bridge_join(struct dsa_switch *ds, int port,
 	res = yt921x_bridge_join(priv, port, ports_mask);
 	mutex_unlock(&priv->reg_lock);
 
+	/* DSA does not send bridge_leave when join fails */
+	if (res)
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Fatal IO error; hardware no longer consistent");
+
 	return res;
 }
 
-- 
2.53.0

