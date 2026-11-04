Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832329;
	b=eTYxOBac6gBCDrdAJmKjlw5yN5B3ZaQHL0Jh1Nz9dluCpMimZaTK9B1Ik/tPwoRQCjX2
	 yGWxEu9hiV69Br25MPntJ1cLp7VSX4Co0kqli2JSNOM3eK2eFcMeMIjuJTz7AxXf7bHmj
	 rbyOgnrDiSVfcimovnM474FAVZLJ4o/ZMe6KQ1XiIGBDSJlZiEIywweqMpijQTIiQw8Ug
	 XRm661ZZVVUGGdY91uO/dbaVss84/XJepDJPpt6atUd5ZToOLdO8aGysmycpjDORdhlQ3
	 Oz1Len8nVAYT43wrB3EVRDF0CLqc4l09cBhz/LZ24KYfu12Exvp2n9QJRRLYdZ7XxwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vXzSnQSBhScjRAuHAYyV+9vkRSwMaTQiRDFUanXa/AA=;
	b=awpZ1585kGvzwQWJTLydgNQLNXgI4lZ2Q07phUJIdJMCWLZ2zh1Brihr+k5e8dxOjUBU
	 wq9HkA8fGI/VwqQAivXa0YlR11cPd72ncfPNyLxkS6waAs+uZWBbofKC7ZoIx345tIR86
	 LSjtPKdTbY8YpFkKeg0Lv5eNw+du0AFocrEAuqrcQ0nMOx+57eRdFOBFEmCELZ+UgbqO4
	 SReJwB0D4cU4qT3ixMukC83E9fU6Rbplp5V4DBVOL0s9AL8ZsDe3+TBbDyrRrIheaRSj1
	 YV85/xpiJ2Po9POdFzBsJ1pej+5pGTUgsJfVnSHAgChlGyTiVTsfnzuk7MUJZgroCTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rQLqJa/V";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BEA606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47BEA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQLqJa/V
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13851635e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832326; x=1794437126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXzSnQSBhScjRAuHAYyV+9vkRSwMaTQiRDFUanXa/AA=;
        b=rQLqJa/V076c4etHA42/L3ovl3uqdyjXEiA1yhh5E8IjnuGayPn6rhpnZgzCfxS5vN
         lSnCo0ESmI3HIw9aRWFvws/RJwXdALiPeBCFDPlz9GfrfVw54IGPFHwZqxHMlHJMcIpk
         LMWR7hPIh6hz0mqjErXfxgNbzCjHJCkcwb5Ehtr+NqZc5FMyiVpXuBfLkT1KOba8xZBT
         2FLUcjgbzcy08WT+CmH3V55hHt3WScX3iL7Pfq2dGT7aDLH70LztYmnkQnOh9NHqQTv5
         XqfSeUPb7bOrbJbyHRTknKwGt5QLcW5NSunUzDqv5AURjmukVwESfOIN3YG/dPnpqabb
         XtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832326; x=1794437126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXzSnQSBhScjRAuHAYyV+9vkRSwMaTQiRDFUanXa/AA=;
        b=mzoaCpc2IUa2Rq2esQsvsuOYeL7sFBaFR/y3P8K6o8+pY5z/y+3o1q4Es/h2TBIKbS
         7Z/DlS/tVRqEoopPq9IMh45lFYcB9C/iQSVioPkCv8W+TTLrL18SRWy79kGQT2HJH6Go
         i1Rf12MVN6BNOGn8pF1fKqxq1XROzgQmF/MLU0zNgEjfSnRTj58XYBOoU1Can7Q3kbP/
         H9Gm6fLjOjx4ztcXLTyt937Ua3wLLvlE0LNquS6RoQqob4jTEi1H2Odf+ZCdoNFmaDBs
         y4ha2ZU2+3dqD2VXJMWmlc0/jE+4GXHrj2UB14n/l01VUnfcQUSs8QSWFRJvvWgcOr3h
         OyuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM87hQb2TUehGzk9I22oFKKZ8FdEuFiOYmt21YHXZlOezK4VhqjTZiUGTTxCs5raELwbPZ7NKh2hZvC3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p02dzqz7MJ9gyuIxnwkxtfLHtqE3zFwsq+a3tsdrVy5d3xSjV
	iUSIb5YxYPBs4fdjvhvnrAF5qifrA/NYzNlykfod3RAqkRfNDafoi96h
X-Gm-Gg: AYBFou0eqpkNMJYMby3fhSkKJn2A5PoOpyvP21/gKbYLncy9clUNv/ni1zd1Ixi7w7H
	EAWbLvV/K9VP34O1VuoHu4Vc8gVL0vwEGi8xnMFW1wdeT7S0cifFV8rQ61DYHBPIr02aoQs90BV
	HTo6KsrPXIoHP0AK4Bt7ovXC1mBV8eaW3aPEolyuYj8in0FpOzOPMP1M0oM8xrm+7nRBgmCCDmt
	veLWMbSKOc4NocPdCbrYdX4aOAFdU7WHk8BVF40TkqsBjOZE8r4Je3sbuOmzgOpoDJLGpt2a5TM
	PYl2PK7CmYZUFJ+ned+dOEFSNlKPuEXG4fKUgbxbWmaHVqxsiYhwmAb9JmvHjvkdeS3zQEvSJve
	eBO1EsHBR0MlKxLkRes6JH09vrAlqag7jUj/H7J7E8zlgPMi8oj1546Nd/CZTdhZOpxI8B5lzXm
	nlL3jT08cqvEZ4aDiddq7bhL56rqgxrkz2tQae6WONYd7eMB+212fKnfg3gXVRLBt/z0qii7UGc
	blEfh8JaVlARuvIU+bTHMdYG5iSotbDxsMjlFOAOslqC5MMUclEjrN369qnZtG4inKZ+n/hI3jI
	BOJ0h56mNvE0R2kpC0J4SW5/jIRIWcD3BQbyHSyaNy0xGKVhVXh2o/KafE13E6J99+Bm46UfgRA
	U1yeDhPP49YR960seQCg8fNq+OGWeJ1vvPggbEGkXKrtrCoVZwWoc6mOQBMF5RN4inQJnytoOsR
	DlkYAaxW84g+YN2VOTVWNErMIWD2vCVkKm6kTrYXuuvpZ50LlRZNaijaY=
X-Received: by 2002:a05:600c:a012:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ac17b2cdffmr380874325e9.8.1793832326526;
        Wed, 04 Nov 2026 14:45:26 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-947d-5f15-1dc3-a8b4.ipv6.o2.cz. [2a00:1028:8388:a84e:947d:5f15:1dc3:a8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4320efc7csm36604235e9.2.2026.11.04.14.45.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 14:45:25 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/5] net: mvneta: fix the removal of the mqprio offload
Date: Wed,  4 Nov 2026 23:45:15 +0100
Message-ID: <20261104224518.66487-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
References: <20261104224518.66487-1-pepe.schlehofer@gmail.com>
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

Deleting an offloaded mqprio qdisc leaves its traffic classes and
per-queue rate limits in place.

mqprio_disable_offload() passes an all-zero configuration, so qopt.hw
is 0 and mvneta_setup_mqprio() returns before it reaches the teardown
code.

Check qopt.hw only when traffic classes are set up.

A replacement qdisc is set up before the old one is torn down.
Replacing an offloaded mqprio qdisc under a new handle with another
qdisc that sets traffic classes therefore loses them, as with software
mqprio. A taprio qdisc left without traffic classes sends nothing.

Tested on a Turris Omnia (Armada 385) with 10 Mbit/s limits on a
100 Mbit/s link. After the qdisc was deleted, only TX queues 0-3 were
used and the link carried 19 Mbit/s. With this patch and the previous
one, the queues above 3 are used again and the link reaches 94 Mbit/s.

Fixes: e7ca75fe6662 ("net: mvneta: Don't force-set the offloading flag")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 9b9efac2846e..79711a117c39 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5251,11 +5251,12 @@ static int mvneta_setup_mqprio(struct net_device *dev,
 	int rxq, txq, tc, ret;
 	u8 num_tc;
 
-	if (mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
-		return 0;
-
 	num_tc = mqprio->qopt.num_tc;
 
+	/* On removal the qdisc passes an all-zero qopt, with hw 0 */
+	if (num_tc && mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
+		return 0;
+
 	if (num_tc > rxq_number)
 		return -EINVAL;
 
-- 
2.54.0 (Apple Git-157)

