Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869869;
	b=ZLxqEn49vOI+DDNaDP038chdHcvlDH6auSGJ26yoqIQXJf4cCD7XI5NIacGORWtFITRO
	 QHjZ+nQy+wLfK4so793dvOIk3YrTgIOhOTQRpszH2VNzpIixsFNewHH4/J/8fLz07Yuil
	 uZ6X+uXbQptvWVCqR09IgzKqUSV6KgdkdNwk51UtMMoVlIZ52CW6Hws28BB41roFKe/eZ
	 GOsBvSKqo6tyTCJJW2Z5KIiD6f8t43IErxivC8D/sHcNhHBlMayNCZKGfk9uBrMPb0Njm
	 ItXSefTkc/iDRxVDI0P6rtgp8J95vI+akdktPeRt1YWu++rSbXwPAnPLjLucC5OHFKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869869;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=A1RrU/JNgR1RP4YNG6owTJ8LvQxop52hPUkVC/V8M0k=;
	b=AQceJRHuTkoKLFpFexOhGKQRJi4arTTpRaR7TcYQpeHWHYg1X8oWE2nbNznhKJDGLAqj
	 lZdk11WEspXm1Sz7bUYIRUxKwMpnyUnA4kHNTYLkDHW6rm2fcW6BJKJS4hSv5eHF5VQNV
	 L9YzeVXYri9rvJ8dMW2BPgcRjngvWkhkRCO5x5yKw5XM0ov4aZVY+FdjriBgmJoaSD4sp
	 edPgnShMftMh1N3SdCNo+S0/6/lxHisCl5okX00r3qiEjnsWfiuLALuPQnw3/b7D2UV+V
	 3GTuCzyQr2oyKy48qJgPWxBbstZkjrHG0Oa06aQYhOczYIq5Bb22twwTa3W8ITPrPXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bIL7KRz+;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B60E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B60E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bIL7KRz+
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso874202a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869869; x=1794474669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1RrU/JNgR1RP4YNG6owTJ8LvQxop52hPUkVC/V8M0k=;
        b=0EDVVDdupv706SuSRsWIsTOC3n1MilKCl9H9f4eUZItSzubimbciJuokPTWdAdBzxs
         V0qIluKQK8v/S65AOBynVKNermkDO+WoSSEd1+V3NDTzWrD2ldnjwfsrA3n6IWDYuURA
         bwup+/BWuaF3iiFOo6keNcQBknU0Yi9fPuAZiExtkChBbWrAG99/oVH2Zkpxfuy0mYZx
         Wen2ZKMc1gWRye6Cq/TSO6LYHfWgO3j/6EvGf7QfzlylV3SVKVXIzXz4eSzh/UVW7WUx
         xMcIxNR6MOryZH7EIMuX/JjXB3bBzbvIQXEeQPLxL5pwzcCFNKLGBvJ5hwmcqhZdkXcP
         R0Vw==
X-Forwarded-Encrypted: i=1; AKwUvByvTzOxP+bnhJrdQdwK4irOgtNSyCFa6eCAS32BsAQEvcc8V49972WXpVse7goHNiclWUIRogHN3W8QQNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tewZrjBpJUuvaG3LqfBC5kvhqQGZEitQU4+UGl2/G3/L6y2fZ
	aoPPeKvgK0r70B6YwMcTM1gg1zKxOUmQRc4kDkwRcBGfTEai9QXrsXfN5MbWaeJcrlWWsAtZ62l
	V8mAJDIyT3jbc9vB3meBLigP550Blnn0rxVMOGbGnRQi2r2izI+BpxPlOpNGQvjwgIh/2LW9G6l
	4M6YX+F5SXpGOi3h3cQVsFtqozH5Mdjw0XMszSzQSNAbMY8PfP7CWO5LkNR6uHknzfzmuYmyyOi
	nnITFCMhULd4Rbswu/Q
X-Gm-Gg: AYBFou2Q2a3wdJ3NGTh66LwjnKG9oUET5W5hoYKhZYBR5S7x007DDsstD0GGUQB82A8
	oogDXH45lR8qe2GBlDyaGeuQRfiejje/lMxmzwE1urNu7rGwTthGhAWOogwFs5OQfDRzAoV1yjI
	Aj5/CwloYGJP4jZbV1iqhUM2zrRIDJOVM5Y00KiTJQwPSJgycdvt77YlkwU4vmlaTds+0mCsrXH
	4By5GWQaM3GiKHp7pApvqxEKWWXJtqsI8KBD1d1m2pS1JKQFLnyg3M3n/b9CTncIWRs8JUQnt8H
	RQXGeFWLasXQMPUjkOiTZsy1p9zPh6wozJycBBr1anEBOtxWJVQ17y3cdr4y9bacpkfVRocQQ8g
	PN58t+bBmsZlB8v000zaaBFeQ2anSR+no/G+m9rzNI6UT+M+SWbPCkx4NlJMLpg9STEPG4f0G25
	EdSW2BkntLE+zirOj302RtATcAerFaCpRFaA==
X-Received: by 2002:a17:90b:3807:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3ae897994cfmr15007996a91.37.1793869868318;
        Thu, 05 Nov 2026 01:11:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b315a756sm1495638a91.2.2026.11.05.01.11.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:11:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5351f1b26e6so26305591cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793869867; x=1794474667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1RrU/JNgR1RP4YNG6owTJ8LvQxop52hPUkVC/V8M0k=;
        b=bIL7KRz+CB5zZaQn3SPpePiCiGHLm5Cz9j6doZR37jEFXPbkuuG9VFxK2SsMtdQnZ7
         HadsXDW2vpMpwo4+6AC/Lqc7orADi+NnQh2q+tiRUdsEtSogjvdRQkI1qsrJ2/4Mc6O0
         ONZFbQ/dfZkoRrtFdgrigd7+WP+/rBimadE88=
X-Forwarded-Encrypted: i=1; AKwUvBwoheIkmdTPahuZVTkwJMZuIx8hM3FPFxy9SRndI31LHFQ0wFBT1IFckgoOViV6JVb1pKIX4/nWan01C+A=@vger.kernel.org
X-Received: by 2002:a05:622a:2e87:b0:545:32db:e551 with SMTP id d75a77b69052e-54532eb38e8mr196110261cf.75.1793869867301;
        Thu, 05 Nov 2026 01:11:07 -0800 (PST)
X-Received: by 2002:a05:622a:2e87:b0:545:32db:e551 with SMTP id d75a77b69052e-54532eb38e8mr196110111cf.75.1793869866807;
        Thu, 05 Nov 2026 01:11:06 -0800 (PST)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100af507sm47298591cf.6.2026.11.05.01.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:11:06 -0800 (PST)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	vikas.gupta@broadcom.com,
	ajit.khaparde@broadcom.com,
	dharmender.garg@broadcom.com,
	sachin.holla@broadcom.com,
	Saswati Das <saswati.das@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [net-next v3 1/3] bnge: Pass BAR1 doorbell mapping to RoCE auxiliary device
Date: Thu,  5 Nov 2026 01:01:52 -0800
Message-ID: <20261105090154.1293846-2-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261105090154.1293846-1-siva.kallam@broadcom.com>
References: <20261105090154.1293846-1-siva.kallam@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Saswati Das <saswati.das@broadcom.com>

Pass the L2 driver's BAR1 doorbell mapping to struct bnge_auxr_dev
alongside the existing BAR0 mapping.

This exposes the doorbell aperture base to the RoCE auxiliary device
so that the RDMA driver can access doorbell registers when configuring
firmware communication channels.

Signed-off-by: Saswati Das <saswati.das@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_auxr.c | 1 +
 drivers/net/ethernet/broadcom/bnge/bnge_auxr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
index 0955b488b6fe..87ae40eab592 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
@@ -181,6 +181,7 @@ static void bnge_set_auxr_dev_info(struct bnge_auxr_dev *auxr_dev,
 	auxr_dev->pf_port_id = bd->pf.port_id;
 	auxr_dev->en_state = bd->state;
 	auxr_dev->bar0 = bd->bar0;
+	auxr_dev->bar1 = bd->bar1;
 }
 
 void bnge_rdma_aux_device_add(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
index 6c5c15ef2b0a..13cb9289f5b8 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
@@ -46,6 +46,7 @@ struct bnge_auxr_dev {
 	struct net_device	*net;
 	struct pci_dev		*pdev;
 	void __iomem		*bar0;
+	void __iomem		*bar1;
 
 	struct bnge_msix_info	msix_info[BNGE_MAX_ROCE_MSIX];
 
-- 
2.43.5

