Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459210;
	b=11auP07S+UY2Ivx0ZpK+6Xs6o3/WNHSDLVRW3wsZbPK+RPF1DDNiJfUXVSzsPaBVXfxz
	 5ic7uxuU1sIMF+QqpucF2MjoG9riaAmU8Z6liqiyeHD/s0L90LbhBMoeq3UK+Sr2yx42H
	 tPQ74YB6nv2vRYP4ci/JTnHihRJPieoYHD8Bmue4DPRQT5RD8qghXO1/GC02p9F6lwlko
	 +vrpxPuuQ0fQbxBTaLFHB8APFqqZ+0Vo4vmC8jFGv/BPtdHgODTLHG8sAPVV1w3RgNa9x
	 8HxALi07wQCUJl0MHBSl7VY5ucolZTzVaaBHLPIpbMRfQyOPrqpzJT4M6W5z9X7kY2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
	b=40lU3PAQWxZgngll/goGFQO+AZkqtCCXBITyHD6RpRQFVTKaPt4Z+AfiQAkXhWcNMyl7
	 gNp7OlHFAugVFNwn8ODwU9DFey6yY4epFX4eEMIldkm44kvtsuu+xdiJvbl6mOmzjrO2x
	 +Kqzt/VIQV39hujKGpMpCHaVE6QzQYy0ZCsk+p50CPKbYlFapBlpt7AlucGqyI7PgL6bF
	 wqDDUwqfXaclIBz4raGlxHP06IMuxejSuUHft+XQ5Lhvoq3OtAHlLwZ1zE98xkigGLMUV
	 dBxZVLBDs5QCq4Wy/94sXNI5efsO5fwlKLS8/FwIJsHfU9b5LGzulvx/SPdZDo5IZ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzTAuL1X;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3737606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3737606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzTAuL1X
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so6026947c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459209; x=1795064009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=RzTAuL1Xty2p5RwFlgMH7n1jdFP11HvdtB4QDh/wHeqzwGq2opOI+7x7SQ7nRglu+Z
         TBuCzR6aoVSfXlX3HBEM7PF28P4MKloJkLgmImElrvsp9BNeM36hZ/MIPusZGZib52LC
         Bw9RwwiqXuwzU0l50tQtrk6F4jqucIKilXfBQX+K1UTG5iJs/g7o7Z14pTzXdzUPGNom
         dpabiataK+HkycV/5XtfhBVUmAoo60as8WKPluJyx7E5hhPUvue6zp6ZQrqJY4S+AfPK
         /TjWQh7DN91Q6w1JwYHeKRy1MwewY/eF4jHAO5ym/Bcp2rA37fNckKmnX0uZclUbKH09
         D5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459209; x=1795064009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=eEaza/SGOkeuXkVOPymDH+Di7vHpFuAket129ArnEdRIJPXKV2Bb7EmnvXbKAhZ4FW
         ZRGEPsz+9CKgCLbxN0+v5vlF+fclCxRRXeKXg38lx38KwpxZ8bpOy/qMr+nCgHue+Guc
         Hz08B2uqln/UaZYPv+QIA7C4+keQocCDqQBnVlSsXjlbTCz9hFBvHayg5OLzb57SaHCS
         4MUEejId3/qUnS4v3Dc88ZKX8iqDWuIJUcBGjBSc4pKqazdN2jOCiUiT8zLdkp4w3vBo
         NjiqVv96cll1eFkz1QTHx3TO03ZKFMxaGW33B/DC7F6H3roFxVJuI+KWUa/YsmHRjiXP
         9EyQ==
X-Forwarded-Encrypted: i=1; AL+hErHXfQkB2PdSaVsGwxViwVSXj67Pj9EFuvqN+ntBFtggCSNQV/jmseUjX4kdEuXwn2LadpCrf9vZDnsvOKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nwBq8AIpjpstU2RvP71lEGOD+xqn5hapWCYZ2nG3SfVBwP+pA
	6JiQnFbWEM5a2Slpzpo7UdLEB54rRDXKpNtrbWHsY5Jh4tgtiix/P7G+
X-Gm-Gg: AYBFou3zNEJTV5SaTFXkS/9mDnAFv17eevbPg45LYX35mWvgcYjUUPQsu3cQNL9jyPE
	8dP43L03PzWfmzmBlazBlQAaIiSf+5QIPrFWyA341w3A7tBN5xnjlFUg/2Qp+o3jq+wrB9D6Jsj
	B8EtCsZpt5zXe/ZV0EJbApEHNAsBSoLBhBYPbJukT198OjDzm/COY2e+GXyz0fPKgmhg9ber0HO
	PUSqtd5oTWg26mF7NEA7MhVO2bVHbZ/sIuBEmoiBfw25jhQ1xJjOV2aZVbOmQ4IlVX69NsCNXgo
	dp5qFoASUiDBnnTYsE8+Hwhsw4OfLLfffzuwwiorXMT+F+FKh3N8tbNTgLNuFFSlGneE/6Fo71n
	HGTPeQ9RB5ro+v35SNxAmz0x7o7hq/c/Eol86iAPhLKeLsdZ/Ba5AW7Z/3o1Ec8jYSHrDPQVLP7
	++Ca8BfRT6XzcvrSuBIL2yBvYBucOhFxecKcJn91FJOfmun2Y4PwtzTFss6kUhKNF8+5YD5NTyp
	LgSB2lEbkThj2GelExdzNkO0teL8O0x/68CfPEZjGlb/5q8xWFxt2YPJ7ndET/VbRGo+V0e3oGa
	p6jVbhAC
X-Received: by 2002:a05:7301:2329:b0:358:3426:d601 with SMTP id 5a478bee46e88-3768366a41amr4535295eec.2.1794459209097;
        Wed, 11 Nov 2026 20:53:29 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:24 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v2 02/12] net: au1000: clear all-multicast mode when restoring hash filtering
Date: Wed, 11 Nov 2026 20:52:44 -0800
Message-ID: <20261112045301.3669532-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
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

MAC_PASS_ALL_MULTI remains set after IFF_ALLMULTI is cleared or the
multicast list shrinks below the filter limit. Clear it when programming
the selective multicast hash so unwanted multicast traffic is filtered
again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index cd25248f4e3a..58bc8e1b539d 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1042,7 +1042,7 @@ static void au1000_multicast_list(struct net_device *dev)
 					(long *)mc_filter);
 		writel(mc_filter[1], &aup->mac->multi_hash_high);
 		writel(mc_filter[0], &aup->mac->multi_hash_low);
-		reg &= ~MAC_PROMISCUOUS;
+		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
 	writel(reg, &aup->mac->control);
-- 
2.53.0

