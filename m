Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA237B015
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142670; cv=none; b=gadAzKNA7CxAJiezA+WC2lKMKblRHsss7/9rn7ROJf6T4icsf3rpb0IpOMQ8nm4OYjolUb8Bl5nMT+JBTpHXvpkuD/mBK0uqZ9GW3196tmLnnFHl7sH7XqyO8DTx7wfU8JKehhpdHFeKXyp2SdhKWvavy8qtL9Oe2JMW4PkNVO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142670; c=relaxed/simple;
	bh=2zV3gURXTYGG70/Zi5NNaGD2gj7ZRcG9SSBGB6TRCUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzYYDiYhxEQW07E/4/OJr2l51pLlhPwvTyuR58hZqo546SL6FQDjwBPXEKGPKDrOe1cq5a4N8pKSczSaEa0m9zrZ9A7QLZ1jIPMpyGA/aYoVvvAeRgVOZtV2eD/xnjQObnTLcgkIeIKdmB8xVOwvMDIIdo6Pn0wkhCfrFMQDWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWBzjE7U; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWBzjE7U"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso425137a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142668; x=1790747468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnMEvypJ3Ha2bDjbDxvE5Gk/KNs3bBY6A7SZqpIE6fo=;
        b=aWBzjE7UDs3PbMir9e2xBzSPbw8/DaH6qlyx9fXyzGvyiSUUGZbVue2YMxkAj5MK64
         k8QzTUv4rYR6Xje1ezR6R8xE5vnYd+i5cf3poZZ2c/1ezHGkMzj4Aae7R2kcECzfETa8
         QzGXcgWpycldIQ350kSFeLgohCNocv4WOX1SBe5vRbZANsKTijL3eBfG+sGSB3vXlyIN
         rBOqyGzOCCFoq8BdH136rJe5ogDEz0fJlv0UsaItOliCd+QQKzdGDM5F0Qd8+5N0SXHl
         a8+FTm7ihuVnpYpcS7wRnjTUKVpqe8+Hm2UXYCqTyIAMg5P6t/ahd3GSGJtI938wemyS
         Q5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142668; x=1790747468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnMEvypJ3Ha2bDjbDxvE5Gk/KNs3bBY6A7SZqpIE6fo=;
        b=vRWKs3GJ4cDbxxGowmbg5yv6f0GRXEgVBaFIMp3L432eIlks8jzwxMkK8VrT2yUtE5
         PBFeBP1zuwUue9Zzdl0JrHTJyNE69h0PAumF4dk4kjm3dcjbdUPvdUA+DT7UnyedOFr2
         ocYFkjBv/XePNFVoNynryr9duHM9EvkCrcSo+UnJJVfAcRxauWLsDL8Oeovqz/OosqK1
         XqmCzkU+Gw67go82S0y4V6C+WqVa90DCykJUVWxxwcJ/JS47okYwfuEaZ7NXPjwXMQiN
         EF6d0zfZ1mwC489BNlm4/PQbNW1nqxZ3hvJmXzgu9+vizAxjsMGQIbhetDo5oLg3Q22Z
         Ya3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/Opz0VHIym7KW3a9nEYJRgzkKNJEjIZg0SafcR5rra902UTS0pBcjnG3NQFzl2GqCObRLVjA90QTVE1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k8ZFCe4Ri+aVovxCR6CyGqlAH8EjB81CyfiTOWR0lNiEKsJmAE
	jR38ExAHQpJB4+ATDDIBSWsjuKqPMFxJvt1Fpd3QeOrAq6G2UqQ1e2ZVSAQnE2y7
X-Gm-Gg: AYBFou2++N0g9xBmtBk7ed48jcSaG1S+utyYRM42yhP39wbPyiKvnmxZG2cIei2Bdsh
	1jhv+BLbvumjW1rrcTAuVcbOlmN7xw9Aa4Ap2xGDCLfUPT3vV+UEbeMAL9qwKVdj9xNA6ejGwhh
	MW5nB5xUVxRaVu1wOfhX78XjVKx7wQxxSLlcRJ+Ow8wTI8GiVodSA1GXQzCP4x1pwC3XmQ5lT7x
	Nadzw2DMUA3h13Th7eEy3cCTkvenu46YRfc2pGTMGRztSBBWbdkmjWJ4xPL6VSV/TVZyxT8oFQF
	p1quIAhwg7qxH3K1y0NO7h+9+I6mZZuas60mgzx0zqYxqEGBUvhW2tzJa59wGqe4O4sEv4+nz6L
	0NLorINZ2VX8/w9Dpv6iRPaTzJG3eaCA0AjoL8icj32XAMFaEKshtavo2CuSBvegTqhVGGCUP8M
	ub/g8zGSweh4Hij6VyqF5sPRpRH8r8mX3mbRkIMeEdcujxgS+uTOVTnDl9EteoyvCGJHagvU4QV
	3TFQSO+N3tMGEyiMpn1PbRZjnU8GOh//Lizykv/vAp2
X-Received: by 2002:a05:6a20:c78e:b0:3dd:a007:cb2b with SMTP id adf61e73a8af0-3ddf8260c2bmr1610115637.39.1790142667977;
        Tue, 22 Sep 2026 22:51:07 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dffd6ddsm691486b3a.48.2026.09.22.22.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:51:07 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tao Gong <gongtao0607@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v2 2/2] net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583
Date: Wed, 23 Sep 2026 05:51:03 +0000
Message-ID: <20260923055103.949540-3-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923055103.949540-1-gongtao0607@gmail.com>
References: <20260923055103.949540-1-gongtao0607@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MT7531 and MT7988 switches, trapped frames forwarding is directed to
CPU ports specified in the MT7531_CFC (0x04) CPU_PMAP bitmap. When support
for EN7581 was introduced, it was assumed to follow the MT7531 model.

However, on Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC alone
is not sufficient for trapped control frames (such as STP BPDUs) to exit
towards the CPU port. The switch forwarding hardware also requires the
MT7530_CPU_EN bit and MT7530_CPU_PORT field to be enabled in MT753X_MFC
(0x10). Without this, trapped frames are dropped by the switch forwarding
logic and never reach the CPU conduit.

Include ID_EN7581 and ID_AN7583 in mt753x_conduit_state_change() to set
MT7530_CPU_EN and MT7530_CPU_PORT in MT753X_MFC when the conduit becomes
operational, matching the handling for MT7530, MT7621, and EN7528.

Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Tao Gong <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 20bb07fac0f7..92b5e949ffab 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3338,7 +3338,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 	 * interface is up.
 	 */
 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
-	    priv->id != ID_EN7528)
+	    priv->id != ID_EN7528 &&
+	    priv->id != ID_EN7581 && priv->id != ID_AN7583)
 		return;
 
 	mask = BIT(cpu_dp->index);
-- 
2.55.0

