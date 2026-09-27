Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635683D524F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546404; cv=none; b=FJJ7RZCZa7kBlCTLhH2ChPkZNxUsXlxIrHn6c7zzb0jkvtSkdKQXyPUmrNFyflcRJSuPYY7aulD+XLhgeeaulk7LdS9GJJfmchWGUPNOGj1IbIs2QHpXJK6Z7HgAu+GNKRb7+7dHvGQVisKmYsBawXFzZUWIHFalW8TlKb6Orw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546404; c=relaxed/simple;
	bh=2ChPtfS7fuQ6xmL5pBM0ED+Tz6MNWUwwNmCfWCfm6zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKx2OuZvz1M7S67gDpj6jyoouVYOR2ghCdJXwn7wDRl5q3I1UHZ6+J4j4c0HPJdNO1dz6a1Neq5AAGJrnWr3IqpCXdi3OBdBamMvsuTUi30mANnMuyqwaDAmgn0r+ozmrGsSWviKTLmE8k1+lqrV44JMpsCbVXc1ItTI3/O9YVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEi6GvdR; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEi6GvdR"
Received: by mail-oo2-f36.google.com with SMTP id 46e09a7af769-81a86afd781so635565a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546396; x=1791151196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt1JZ0Xx4dSQpjlcwcv4OrOAetyhY0kdTpc42Knguac=;
        b=CEi6GvdRr9Qc9e5aohxNgsgG1WWEfL9SmvQl2UZhtPWzlz9PZ0Ph10zKMiShuWufKd
         +y5LKJ5MwfK3HsHgB9to5D+nLxvfX7fsC+dW1ePeAv9eqxxBpIGPMXqIE12Hx9W6zv49
         T9OmTgGIb0B2BuuBI/W/xeiSU7GmlYljzX4Scct/iMvlEyjRm8ywQ+zjzG4Ei6IsayfJ
         PvGcqpzIBh1TVyZGJHMQihOYCQeyCDXNNTfsTLVv0TVk4LhdoKf/ll1kvwBA+kbYszdi
         /lBT3zMlNocApC9m3dK7LIHeJ6U5MeCE8y12BqSYFZPWHIKH0tHp7+ACFRYdwvhTkFRB
         lYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546396; x=1791151196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pt1JZ0Xx4dSQpjlcwcv4OrOAetyhY0kdTpc42Knguac=;
        b=kHMjuR/RlHz6KsxKeHiAD75DvbIUml3P5zvMYYFkG77ZQuEGB6C+48NeOVBjsX5Yng
         L7C6mfn7ip7voj9UqbfmFcG/9Ebq9wUi2lY11gazUt0sFbAA9j/cWOx/pAUG4YHPgdg4
         eLB4d8pMvs+IA4oMrPFLSyyrGneKuNLCsN7wRmtFuW84TxCYIJfFmoW5IgRvL0u3uefn
         sQRFaAtfYHloQYX3SplEbarOljq6EVTI4egXLjO/sfrC6vYMTgEGqOvK36NXb/QyAxcO
         kCzQOUxH/w9kPvNfMZNude5PyC3AUowlEZXDTP7M/9Ah8ZmG8VPlLTDeaGzyHeqWZD8p
         3fTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7wX2hH4ywYHEJ9j8piKyBoXpfqHaB1mI9PUX+jFPUMOhYJN8TsgyJP7Zdg6pkwI1zckeyH/c7lXjoF/w=@vger.kernel.org
X-Gm-Message-State: AFuF++n1Neog9S0/d/CecJbTBFFt1y+JcLGzwFyceGUR/tiBQ45s4rtU
	dL1IUYgAJcmDYToqaQPkDSjITej1cFokmQgOwVdTnDLcZ0yKxwuLNlvL
X-Gm-Gg: AYBFou16TSHCHvzXwzC2YPatfW2hNIHCnHUxqmVJN2Xcz/+gf24KfKKNPELueNYW8Pj
	lRMuDMgW0R6CHlEGqHC0S8KjaUYRhrvVSopvs7h5B+hVdlh126BSHoQSByRYj3/19e0F+moma+J
	soaa2hJjNF4srJmvjVb+S3XHAW7fed3WmHMSjAOdhA3SGIHvMEU8iu3B+bTqsvMOB5Wr13NTBej
	0ExKu6lcQ+LQsNOuSqHS+gIL13eweedLFtuhCYzPK04wg6bpFUVT1JCxIpmFLF/7issBcuyOjHU
	1uttbb7dgWcHeRvTRvkAVPFUBkpxE/8lC2rZye9JAE9KwEJRkZEPZ/skbwHQ0bAHooLiHus2iHa
	66569b9WXKzWigEZEDuQg5MoMNvgW0Il1qm2M9xyP9brXw5qVCjuFF95fAGGvDKLMgHZDFZ0ANZ
	js5tVU9TebTVuun6jdWgR2ez0VzJMTVo+v18uzQskeFd06TgtcHGkNrU4RZv5DybROlA12CpkQJ
	r4FbCd81/9w8wdrueumRJprxs//LAOMuAOs9hVpLUXFAzmOlAOZ85tR8xAEBwvx/2571cGHqH13
	GvkoyVl9x+i+34SZ5LnQXlwdtRqmbmwjdIddqWurhd+b3liShg+o3EGqJ0F5nanDUsnHiCKrerP
	1DpZrC2LxU3z1Txrhke89RcnRaJontqU=
X-Received: by 2002:a05:6830:6d50:b0:7fa:ac4f:794 with SMTP id 46e09a7af769-81781d93ab0mr13732683a34.16.1790546395901;
        Sun, 27 Sep 2026 14:59:55 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.14.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:59:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:39 -0600
Subject: [PATCH net-next v5 04/19] xsk: freeze deferred pool teardown
 during system sleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-4-feec6c14dd06@gmail.com>
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
In-Reply-To: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Yao Zi <me@ziyao.cc>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, Linkui Xiao <xiaolinkui@kylinos.cn>, 
 Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Pool destruction calls the driver under RTNL from system_wq. That queue
is not frozen during system sleep, so ndo_bpf() can run after the device
suspend callback has gated its clocks or after the noirq phase.

Use the freezable workqueue for deferred pool release. Work already
running completes before device suspend, and newly queued destruction
waits until device resume. The pool, UMEM and netdev references remain
owned by the work until then. This does not replace driver error
handling after a failed resume.

Fixes: 1c1efc2af158 ("xsk: Create and free buffer pool independently from umem")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 net/xdp/xsk_buff_pool.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index 9d2d94f1fb75..c58f56f24a9c 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -337,7 +337,10 @@ bool xp_put_pool(struct xsk_buff_pool *pool)
 
 	if (refcount_dec_and_test(&pool->users)) {
 		INIT_WORK(&pool->work, xp_release_deferred);
-		schedule_work(&pool->work);
+		/* Teardown calls ndo_bpf(), which may need powered hardware.
+		 * RTNL alone does not exclude the device's system PM callbacks.
+		 */
+		queue_work(system_freezable_wq, &pool->work);
 		return true;
 	}
 

-- 
2.53.0

