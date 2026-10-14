Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA73988E3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959242; cv=none; b=iNGNtuL3dQ6HYzsq3WWGqVgO4ZWrH0B2ctMXpg97RjGhLAHDsTcc8cxjYQ0UnUVRyGC/F32dJvy/BfNJsnmr/10PG3OuF/NYySluXT9lZPTvv0oyosi5YFmEcuKLxfEcbXEAYZq3QJkUEisA6AKuO5dIFWHCT+8vNGXwzXDrfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959242; c=relaxed/simple;
	bh=RFL89FGKefYovGeBgZ3CB4+xWGgb3vNqaJKhk5dNQjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYrvhnx98CoRsjYkSWGI9piWIWGMwjNZxWge4kwwPgvqwMssnScGcYKLly6koDTjislUu1mfQbGXqxAZt+tmrsF3n2dpvrj5yksHsoH7eiy8Qu2Y0MA8/64wts7qAsO+gh5trrNYiwknprOQ7JaTrXB4N5zd4t04aycYcdb4e/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqmQ2mq6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqmQ2mq6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so22400075e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959239; x=1792564039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOeaatzk9bhuYpSzqiCT8rOTWkQH4urpPw2fjdSr5Ec=;
        b=pqmQ2mq66RojAANIF5bwWk/pRlXcTIptjkcEvmoBYeri1kmR3iMW1AH8XGBZJe/ZHb
         uc3ks1PY2X6iC6x2Fg0Ej28dlF7aA1rPvObgoVTfoJIF87UpaFztHY4z8ZgdDbRnp+iu
         fD+SRLMgiHp/B6it15XHmTdxJlSv/JFTfkegiNH1dXEQu/i0RSjWbdWlyo2sUK7TaQn2
         nfm5CNoJw+7DGHojgOLmOQzWwQ23hthXvSkBJp44wBixD3fv8y9Jpe7S1jqao8CA17f8
         q5BmBE028Zj8YHaTJGOTZRnPhcILHAAZx0zmSXuUXf7wADcstaX0yu5OSrd1DEvKe0qn
         aVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959239; x=1792564039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOeaatzk9bhuYpSzqiCT8rOTWkQH4urpPw2fjdSr5Ec=;
        b=ax0vBmz7DaP4mnrFUgMrmBHcv+uhiWZKvDiUbqqwivFrNkYnrIHy3DqhrIePu4p2pX
         76hB3WG/1R84ttsOv8PH/iH4pfRiUfhDql0zWMcll/8FqEeu2gMSF1qTU0LJK/esCWbK
         8/l5W4nUAdcG9o+SDGiodWxG8UdAJNJ9cx3vmheqKAsb9ywxpiUFD9OlnbCQ7T8AHxcW
         Jz5LHL5RfCjEZzFEz9gFvrsnOCifJSZ7LAXqZtzpr+M9IuMu2mltqpa2BqmYOuqb1Kw6
         NNm6xchHKK81Q/DPGDU0yHyqNo9Eh6vtayo8ke3sG7Cpp7GQjEmGU5bOwO2wd4DYJ6HM
         mA6g==
X-Forwarded-Encrypted: i=1; AKwUvBy5Y1AJsmIVbj3yZR5pFEaWA37vibIaePoLb0/Kjnb/IgpNd9mjNArpWv2cf4nFJDwfeaYCya/HPdVahgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+gbiWJ43RvIJZ++meZ/PEKbQ47Ni3jK6AcISuJCE+2bp2fBf3
	aoQhC/Nt75zWHFms6prYChFYiJJW6V609nXC1TotLK6VWt8JwaYi2TvZ
X-Gm-Gg: AYBFou1WWliHBFARAvJLxC/b/NlIJeJOJYN+l41d825D0Udnpj3oMdG+Gyt1mL2qb28
	HewMZIJlfEevyI3sIR3ijtiJchvx5AUHQMriKaa1rANl3CeWFHicEDor8DgBL0sF7DjI2xzK3ao
	/+9Rb7F0g/dtmFMw1c5Dt0Fb8B8+5Nn8J75MeOUXzxPwYC3KOjXCqAne30ifnZwngG/Wf4+azkN
	T1+O2rPRcNIGZk/AkKW+3pKPIWEIXROjkbkQj2cyzEC3X1QVjYLxJw+jjZGzYvpGV93+5zXAKds
	0+7AQsNCdCCorP7l7Acotu/64kOBjYMq9EkPT1YFFOwpgyDn2069exlBRhhWoQz5Qek0O1jDBYq
	ZA95ap08Vey1TR7SLQg7YlWHVF0LP8uG/3SkPnsK5Txb227iYgvW06aCDRLiFHEtAZMy0UJ2vzD
	bEY0ax8HEfgZRXofTt/I8Ru9rf14EgUKyjaETsXP9l0D0lOjJ0hg5DbCNh2o/dCw+NtZJ5GZd85
	EABaDM+tnG5wiLT4eT/8hCXEpavSvlwdDW4QYP9X0bP65VpyfnrgZ1HDXPbaGav4V++ebZDbiEf
	6pkgk/zUZJLcHc+BQ9hvJPLTnTHS5GTT+KFhPAwyYjAxeNEz/UvWarEvo2jKG5SH/7Ac6OlcJZi
	zPWX5B0OM+ouXfg==
X-Received: by 2002:a05:600c:1c1f:b0:4a1:a484:2c37 with SMTP id 5b1f17b1804b1-4a1a4842caemr152491245e9.25.1791959238943;
        Tue, 13 Oct 2026 23:27:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm528846745e9.4.2026.10.13.23.27.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 23:27:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] net: stmmac: free RX resources when TX allocation fails
Date: Wed, 14 Oct 2026 08:27:00 +0200
Message-Id: <e7a5380aabfbc03bd560ab08f37ea255d11d528a.1791958735.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1791958735.git.kmehltretter@gmail.com>
References: <cover.1791958735.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_dma_desc_resources() allocates every RX queue before allocating
TX queues. If TX allocation fails, its error path only frees TX
resources and leaks all RX resources.

Free the RX resources after the TX allocator unwinds its queues.

Found by inspection. On a BeagleV Ahead (TH1520), forcing TX DMA
metadata allocation to fail left the RX cleanup event absent. With this
change, both TX and RX resources were released.

Fixes: 71fedb0198cb ("net: stmmac: break some functions into RX and TX scopes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 495ff7aef..8fd7d2173 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2425,6 +2425,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret)
+		free_dma_rx_desc_resources(priv, dma_conf);
 
 	return ret;
 }
-- 
2.39.5 (Apple Git-154)

