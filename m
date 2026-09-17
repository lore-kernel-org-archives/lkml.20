Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF3159574D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656269; cv=none; b=gSoU3b6sx1UiKGr8RuQ67dmSJutEl4c9WgkYTJaRqdbp1j6BOajt8X3RQhKDGgImGjWdzJofTax4vWxm5elMrJwSL4twIFiiDfJrBmbIixcQSuXIHdNJAF4sdCf+U7lKjX2HM6VVFYZi9M8mdLOjOoI0qhNkSxQsrYR/tGc4cVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656269; c=relaxed/simple;
	bh=wWFrmPZdYXd7YwWTy9eTwd5LSF+K84lu9Y2vEN80o7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsOON21qLpTF0/nlAo7rTRXiE4NIHSwxfNptqWvtnkwhOw5vTFGU7Tpdv3pb2yGy1g2TuN4P6IfHOYe9DNnSCOUpkel1eaSpFR6Y3IugT0mMfP9CnpE8CHWXeEfBHwfBuKhVNHdst6H8R+vo04Iel5ybC9Ff91SbuJ0iUIvBpxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1MOjl+0; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1MOjl+0"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86212a185dcso926902b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656251; x=1790261051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=;
        b=E1MOjl+0nwwQ49HcCMwiGX7M/dm4AUeA7GBY4kDRqWwerphYVS6yngIewQkxgQ6xnp
         gztP3YB69HdYO3inYGZSOkmN7LbclP68v6iXT7Lxlrv+Qu2T5bYe1V4atVNJiEDDarVT
         arodqhXuHPqRgfld5MqpvsBS1PQCuhq9cYQ934wN/e9oklvgNDVuNE+4oXgM8mYipk/d
         dMA7C1KqUnaFa+Ogr4EJO4H081GgV/SfJgfTAdq9ogWOyFeugqpzb425YjzyZ8TMbFh3
         9rt7No3szN7mB2Fs38pP8xPZD0bVhotlAV7WrXpP7ZW+RMIV3fTK8c+PPBI8sQQ0Yeyg
         JdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656251; x=1790261051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=22gw0ZGKrgRtPwCbXT3ngxxxz9UmWAY8ZGfEsrb6sco=;
        b=sLVOWkSu0qCbYZ1IZhCd87lKEL9Sz1GDm/dEYRRL3TspH48p3EAY9y2tkXVN5MihF3
         BsWd2IvUC+os+Q9SLyg78c0hT1ZVAEkw/jTGa+LyculmXZs4QThkXYioxJPhgnskW1+m
         6n1Uu9jhGuFN+Ld305cUYOOFBYFp9r7rJZy6xiv1B4+3kvUG/5BAaRhdYA28bcKEqaxE
         bCX2+x3YqS6rUlSRs/ecnUpvYLV205jTNz/vyN2Eh1JgrBdBYlEtm0M9M8aTPwXpT0ks
         F3Iz6ynr5JJi6Qg9gOW+gGjLw9Ywpr9jsM/1+FftmA38udQb3ezjBhPQ0CXKkx6crrMD
         Htdw==
X-Forwarded-Encrypted: i=1; AKwUvBzspuA3I3w1kMD+OtSFlYZ2+19buf0OgNOXYnlc0ocR7Db7Ab1hK+U4SpknRElAt2kIZusXLh2xv5JUD/8=@vger.kernel.org
X-Gm-Message-State: AFuF++k8eHo+3LZpzoREx0kwceVXV5UnFzUutDagRbd9gHg9565yOA9L
	eG0wLTROJQwzhQXXPFZme3+roqv1M2VsSkuS7boofdXcK2PgE/Kisbza
X-Gm-Gg: AYBFou2eZReBB2Zjue3JEKeAwP+Ki+12R3WTTFK/KmJmras50dVlGT5LHLoKjOmEG7V
	OnsPVnJ/LEVN94cJBcgQeSxDNm3eDxZ/G2Vgsl+UhaTYDF1YOccTWpi88xCUvpfqKlrrz2vi3Av
	KYnvxlyjesRVyMVvel6ULIhfFkF6AczXwRFtWEZmQx4DouqQaWzExm2EN6pdik+AnOmV4THGbD/
	bxd6iF0W206XxxGIl5RgO48n2LtWMWZ+k6+0MujR4pbSyx/5NlHDn5Llgpno8ZEyq5xco57Q1Pa
	qBxJxERg6/PeXCaAOqhrdGRYnNHn0F94blK8x6Fp2OU3E31vSuWm6xXEyopR+sqVx8OX+cD1dVI
	zYab3qnawzQ0BXn0jiQC/aDmMhjpnbZx1AUleePVPo5kuTV03cTKn5MLKNMADluaZvHAUKa+3Xp
	NR5aPy5QXfbPwF9p4boA59thAkiQayof0Re4Rr7M8yJHeQxbVPiLYzgmhr2MKqDttTeICjncrCg
	kvL/BrXE6cryzUwKQuTLbOMRq9eJapGKuWdXtEfyg==
X-Received: by 2002:a05:6a00:398f:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-8723adafcb6mr14166549b3a.3.1789656250736;
        Thu, 17 Sep 2026 07:44:10 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:10 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Rex.Lu@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v4 2/3] net: ethernet: mtk_wed: fix reset condition for rx wdma
Date: Thu, 17 Sep 2026 22:43:34 +0800
Message-ID: <20260917144335.19466-2-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917144335.19466-1-hujy652@gmail.com>
References: <20260917144335.19466-1-hujy652@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mtk_wdma_rx_reset, only the wdma rings that weren't allocated are
reset which is wrong.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v4:
- Patch added for issue raised by Sashiko
- Link to Sashiko review: https://sashiko.dev/#/patchset/20260724172040.1653-1-hujy652%40gmail.com
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,
-- 
2.47.3

