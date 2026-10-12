Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F33750BE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778584; cv=none; b=qvpkMwvXkih7P7gxu1RktHFZXh6sSPzJoY5fyVz9UcgN6D7Y928IC8BRj9AYl8Ts5e2sc7QLSl+4k1p2TtGb2iTdGwcN6Sg89KTm/5nTMgpNGKKYLx84u7GeZt8pU6e7JCl67jXh9pLR1LgL0+oeSritcHOiezT1kqVSLPrIpwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778584; c=relaxed/simple;
	bh=m2VcwnNvFW/954+yXantAC920BnpuaNj2ZtpR7Wqf1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GsveVcIjKUTt7r/aKVj0/hKCaVOiOHlepKbabGJhLlxIQSEy4ryUd5FkCidMTcL4OLOjeYpDfSY/HP9nDjrfK38+fUIrw+I/5XigzOMXaUjX7M2yGTm7DnPdX2MYVnuHqFr1M7hZmioR51/TA8xzKLX5XXPiYdNOSDoFs5bxb8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=m3B5T2TO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="m3B5T2TO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8b20a899fso2971015ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791778579; x=1792383379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKpzAlPRldho6ARyI6EXFQgi6l3fYjFwuBpuGWoUMxo=;
        b=m3B5T2TOvw0xierihqtuGqMUk9CE6m0QM9MAJyFf0U/qN6Q7Gv/ehBZovAaIjQ1eud
         jVlz2RgrtOyrNP2rCuhM2DJsVyiAL8HPC3ZgRZmKhMeRzT2+uWFqcm8sQH29SPGhfMVE
         p5NxoAhrZlnh4BSmTwKDaDaulwoLMdw/sAjvOcB6e1Mfiptq+9zFYiegjmesUN//AvMK
         7aMfTKJOE+sUpZYu3Dnwni2IyoDe+/p0MnVMhwdjySLpDEhkYVBnqxrx9HCr6BZGPaPR
         B7iP8s+PE0MgcVpq5pvY444afIcIN4pasxA7Llrel8lzWxLjZ511OvcOj+/MmjfL1ArR
         JzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791778579; x=1792383379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKpzAlPRldho6ARyI6EXFQgi6l3fYjFwuBpuGWoUMxo=;
        b=gAsU15XR41i1tNTiHBwsIKVsSf+UDUcUrsfOEIly0AbBpgd+70Pu0T7Rjcm4WTH+cv
         bxkcKR/h8JkZe6wIs8K8/abGzHkzjrIPKng5riJoZnxO66kRRmWo0VrbGmOQqAFXYiFx
         EjxXJoW/bCmiEjdcFbTqCfClRkO9DEDijarUYze5w9bXC4sSTlYye4ZFq4j/Dyq/K5H3
         WY8jzGXolrasVWl7jg6tIamI+IFZgi0XVa9vAmSftJEWyFJasMy1arkmbWy+yMSBFV2m
         7+0CZUljUqgY8Jp93WPcvO3zKx5MIE98BYo7i9iZSFqf579TIuzy0TGbzLc6hYrY/B/H
         M4tw==
X-Forwarded-Encrypted: i=1; AKwUvByY+mn6RelhEQscOfbNl5L/Gtf8dFFPGA2ZYxn7Rdw4MeNHjfd4Ez/t3XfckUziYB5Yg6nfVAUHjPkcil8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFikqanYjVBYJyW1z19pWBTi6ZWCqBHfoA5U3MORp7EpHr3DBI
	7wbggQey7z+lJr6ptzRXySR1teNz40dQGjUnmi51Bi5ezfcipfKboWoSlhQ6TrGfroA=
X-Gm-Gg: AYBFou0Y1zRPdAuqVw88NdC8MkUi5y9F/EPi9hHltfszTLMp02GEp65Rzh56VrFpESv
	4DxEh4K5ZHujx9dJiX+q+anNl+9rgQnMoNT0XgvswDgUzsCHPze+wzNmyIf/H4LHs7XBMxRc7H+
	iyy24tnubvZJzKTGgG3ln6S4jTQK6VQ2WAIvSIihxK9FuAp0wYwicxp8pSwiGePkI/WA1P6cFt0
	p860QH/9lfaIWXRayBK6U0EGSYUkJAxMgE1eUiXAd8eCijEvqCK+Qitzs3c9Q9OjAg7bSpRFM+S
	ATFDzY3bu/QyjhnO6AIyfHcJAo+epO+opKowmE4OVhLGTtk7ujkOxTaiwVPHpblNpNnGjfsk8n0
	rdij+ydxfRobS8H/vKZ4/OGn4f+BkgEB+dGUNOqHHvB1hEfXOZHvIqaM4MmrfguIItun7BzE7Aq
	b3rAzOQsNJ2i/1jP7jmjZcGNxeOjWh3KwVTraOCtvWSfO96Ig7/BDuShy5y/bfTUa+R76tutzLV
	J1fnw==
X-Received: by 2002:a17:902:ecc3:b0:2df:5836:d1d0 with SMTP id d9443c01a7336-2e842ab65abmr73108105ad.30.1791778579446;
        Sun, 11 Oct 2026 21:16:19 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421af46asm38240025ad.39.2026.10.11.21.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:16:17 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH net v3 0/5] eth: fbnic: harden Rx and Tx completion handling
Date: Mon, 12 Oct 2026 13:15:55 +0900
Message-ID: <cover.1791775409.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rx and Tx completion descriptors carry buffer ids, offsets and
lengths that the device writes and the driver consumes without
validating. v2 bounded the Rx buffer index against the array only, which
the review found insufficient: an in-range id naming an unposted slot
still reaches a NULL page, a bare META completion still builds an skb from
a NULL buffer, and the offset, length and the Tx completion head are not
checked at all.

This series validates each of these against what was actually posted and
takes the existing drop path, and bounds the XDP Tx completion loop so a
head outside the ring cannot spin it.

Patch 1 validates the Rx buffer id at every use and drops a bare META
completion. Patch 2 validates the offset and length. Patch 3 returns a
pending packet before a new header reuses its slot. Patch 4 is unchanged
from v2 and returns the page reference for a dropped fragment. Patch 5
bounds the Tx completion head.

v2: https://lore.kernel.org/netdev/cover.1791659860.git.yhlee@isslab.korea.ac.kr/

Yehyeong Lee (5):
  eth: fbnic: only act on Rx completions naming a posted buffer
  eth: fbnic: validate the Rx completion offset and length
  eth: fbnic: return a pending Rx packet before reusing its buffer
  eth: fbnic: return the page reference taken for a dropped Rx fragment
  eth: fbnic: bound the XDP Tx completion head to the ring

 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 192 +++++++++++++++----
 1 file changed, 158 insertions(+), 34 deletions(-)

-- 
2.43.0

