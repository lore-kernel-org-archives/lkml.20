Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917265;
	b=ch590494jwR8wDRXXHX1RLCxMTdTiV7wl/0X3utRvFJNSaBZxNzCV517H6joNyd+doHe
	 hsPoRh99OhpjNMYmo0rtCImyIkBsUUPp0p+DIHBViIOZCr/HS8FBctxgk2qW4PTxdn6QL
	 9N4ukVl6FiFIuUysVxBt5BO5liR7xEcTJbC/m8cZu/ROmMd02Kujgb2p2ASA+SFY/IOtN
	 ESigS4fec8bCymFL/JEqRpPG8ZkzRBEv3QQp2ZEwK8zcYqw9feUCngggktHnFnwjgyQuG
	 2IXlix5lz2qNwC3jYh8OjhrtjogTQLKZG/X7c2vgdT4xYg3fZt2GCizwd3MRtEFxbOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
	b=W2LoXGuwkjK7vhoLs8ZYy+iHTK8BwovUrACe1MZnFhSLIeej/gJmyGGcj480y+2ur2t0
	 3ahLVj/CkTIXiPPmejkkcZCq4ch2/5W/6Qg7PNvBMEK/87iwYR18h9hnnFla2aZHZWWGa
	 QDN1qEhijMzHhLz7QDM+86V4myEApj3YloE7J/Dt+bLH9MnY6pKQfPoMEgE0D93JZCLHb
	 FAh60U/x+PjFQwL1ilKOchFqnkX/B+A9F1QD4Ri7swyNieZIH66KDW4TGzH0WJgrAei0I
	 GYv8nZxZlCumlHEUTMdQy1//Tw4sluJVOtea1EF26OpMH6Pxd+DEnmkrAC7aRQPQesA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTmCPrmV;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD18606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD18606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTmCPrmV
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so299eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917264; x=1794522064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
        b=tTmCPrmVRUAllLERaiIgEGzgA/3GcfFM2ivaSUFN58HhzdGttxq7aMEdu5wFU88DN3
         BGADzbE+V/rwCP47nlsBPiPbimmbqXpsm0MTO8By3xg3KpXoEoJg/xdT0VlsAlDt1Qws
         XBiuk012JlHh4nvmFh9c91uBbDK3j/UegZ3ClICJVHL+CXJJZhjeWkC20o45Z6amYY7z
         nX+4m+6F9NRf2a/BOP4r7rY3hLk2InUAbIHtQrptWriCeAuG1hD3EmLPQ5n/AzeXrwZE
         86vRSdPo2JBAI0tzU8eJWVzWY5nCMyI+JmMTbfHCkbdmBgZJIqVl2SVZdWy0kwxDGHPq
         +gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917264; x=1794522064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
        b=HU6sdFPHgJcEMnUnwiGCCcDDl1KbkNVTSF0EaQ+dVI586Pmu+6nR8yUdZL1KkhjjVF
         M0NO/Md//uWS15BkYj+Xex2rR7Bvcp5I3LeJqaQ+y7PbKZQ4Y9w6IdTkrwCZ5Hku0hrg
         AeAwUhP9isvImTTG9gig5iOH5r1cqBvNl+vIxRMePAGT+fsT2P9sBpBDr8xLkGrYCO49
         Nhxb0agS3VYnuUIQIW6jc4goKabdiXPCocH1e+afF3eAJ6xK/7TY9Ld7iC1HfqVZs3W9
         PQ9oVVsRpBLts/Tuc0y6j0kvMJGnUtFEzatLieRyTl2EFfHqiEd1lSwQUaZjRgaB+QCw
         5PgA==
X-Forwarded-Encrypted: i=1; AKwUvBxxQ5PKw6/ljqAGWO0jWDq0oqxsO1gf4Ltjpc+OJpxMXHdGSWeD/05nP/1X7MGZ/xq4Z/zImFxbPdO9C9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yi/W0z/xOmO3dCkk2l5XgsCvRD3Ck5wYiPgTLEta/1/JxXqTF
	7ws0KyrI99IGMe7DbouCImtn3Gjpxp8yvH5beleLNCi1r7QGnlwZu1an
X-Gm-Gg: AYBFou3fc47xY11T87eZd6KKjftKez1uB0kuJthQiQX0dhBSwxhu7Z1QpTHl093BAZD
	lozA6xYpNxeKyhImhHNcnto9xXr5kQ2giWesNCcIJLaKHBwuvM9JiF/YM5ogL4df54YG877V+HY
	QkkLy5oRTgnTvDjIgI9hozd0oZ9vz5AC538pHj6PzEO2VhYOgquw8bzzY1ZSar+u0/0jl3OmmdU
	csFJVbrVeW/bdF5IUHy1WBmMMQ7kN/eShtguhDM/Xw12dMENcs/iuhyh//VbIGoxSwgEPE5NLck
	j5ugx2bDQGwCkDmDzLDm86QOhnbktItxs91zb+DGjK1amW1IAaa1Z8NB+xLfloUeFIWjlMO//8q
	GgB6KvPXOQGZI7D/o7WtK2UTxWzHnRYgrJg41oLn3GPhiKscAicxF8LK8p0Vj+9HO2xWWP2WG5b
	+GB9vjnoukml3HQVzSIKuhKH5qs4ybqdqdEcXAW453kthvDV0n2WDppMDc2ed6KdYOT2GMrOrl9
	pfGjRdOYf1FBVPtum60r++QtLjkOg+p4XDr5XC7JwwkSTHKROSIb5QIDh/ckThlzwnC7ghIBSZj
	5jzzNswjmTcH0wtiRsT2Qdo=
X-Received: by 2002:a05:7300:f586:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-36f76c1875amr631599eec.34.1793917263769;
        Thu, 05 Nov 2026 14:21:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm47741eec.16.2026.11.05.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:03 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 3/9] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Thu,  5 Nov 2026 14:20:52 -0800
Message-ID: <20261105222058.944293-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
Derive the index and offset from binding->niov_shift instead, so TX
bindings can use larger net_iovs. No functional change, TX bindings are
still created with PAGE_SHIFT.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 32fafbfa1359..6339f221bc82 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -455,13 +455,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
-- 
2.53.0-Meta

