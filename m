Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896F399354
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666474; cv=none; b=k1zC4wfuvjoReC1Igr0D8Fp9CBw4pcvleGyVyfa72N2zvJBH6wqgNaUCPQ0T4XcpDXaAbsBYr2baWhOR4Agbp/KmVxx97jPJ6BpPyrfQIefdI59d1qLz4DxLu7mB7BLIlqCURDGOnZpfyY7XhZzl50XSb6khOjkNP/N+Kt7VniY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666474; c=relaxed/simple;
	bh=5tJfXShcSu4bq2Y9zlq/kcnhcEbBVxjgw1/F8YOzfa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rS54uMRDPRLxvoNx0LX8Dhu6eFmDjUkMvoQucsw144S7+ZFr4T79yHyk/jlyVgnY2Dwf+DsQHToo4qaP5qub5zcDIfvLEL7n53jeqrviYAjXAV2QKtxC0UIS7k6dbSHSAOi5OabZSiBUIyYD601jUMQIkeo9AVpV7FvxGg5BlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgkX5qCb; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgkX5qCb"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso651117a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666472; x=1791271272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJVHdovO8wYi2ya3zic+FBCx84rgCtsdjBQID1blqec=;
        b=KgkX5qCbaSoXK630YWUij21tpSEdS93qoLvcMdeTkQPVhBe3AzdCJ0pT9vh5Mj5VC9
         opfGiBaX+JrEG3rvZb7NmWuvTW6WFD3YmVP25Ze155UcZzWQmpr7gJXgkTxVnQ/KQzip
         gLriWoxj7C/brhyjlzcDiHA/aMy1pI17w3j2NdnBG2BWpTBy/DmXX8e32Q/plm2QdxHQ
         NZ988X7Rd24AGcJ4k4a5emtUbayMy4BSlmiz+CGCGWgBKdMggj6sE+lb1NDs3u0w7SGB
         C917KzNzt6Nei3w9grw2semErmeojyQS7alG2r+jQDUAqpTlLrwrOUSkIVZYZ1gc4R6A
         mykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666472; x=1791271272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJVHdovO8wYi2ya3zic+FBCx84rgCtsdjBQID1blqec=;
        b=p77SLNJgxLm9AxFQPC8mgWtyosTSq0zuRqXMFhw+wB/zzQiFrB2eXhD8qDTAjMlZvs
         j358GEh4vaT77j24ZE8BkYG/8mKSgbkVlJI8CSsmv12JuO+p4/IjtZc3t6vmzUcG5Xpn
         RocxAyqWYdOSWroBXgffoVBei7iVHW5X68RUYwKBedWBjrsd34P5Ia4gYcken4ViTUlM
         Hysi3y8a4+UbUbKYyM111OGRqJHno2ZOcF0qWWvr1AlHunMU1nSFsQzXwN3n0C1m0YC1
         200RGCJ0AGGIWqwKDXcYL97iaj1GBpvDzIXqz8n4P1i/JqIdjEWlsmmML0TcQ89ylB2m
         vsqA==
X-Forwarded-Encrypted: i=1; AKwUvBzY8u3PwUjHOpbjjoZy6eXbEmNF7B82p23ZnqxxHhAUpJtwBJvbZa6e343mcVEFaVGDmsk5eIGLSfljAgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx1WJI41I45uRP8HH2x5vEUBklcTeJfER2dvE9V0kqYdgYLXmD
	b5ov066ZpOIxuUflCl6eWdWvVNwaAm7glub4XFd/cZpANh8Rl/oYiqjh
X-Gm-Gg: AYBFou1ap8tulAya0+QMbzI8dANfrejRCS8D4cEttyFMDTqP8jZdWg+hg/tWHYLW1V7
	AsgL2TXBrJhYOAV2yBdGMAw0RikkAujMnRg2MJLR35djP9B60xA5AFIFd5hgXssDUNiJpO3o6Wu
	hlQUMdON/Phi7GEEt61D+Rj0+IN6CMNiGKeP2LtXEbILQGUJhBCl8VInc3SoHq68+BG1YDxuBUn
	sFYsoT5Kq2CMF3cKOfZp6ZbmDoMSpIoeYI9091/C+f/2qTDWPrXOPmm5Ogm6VyxscqO3v4RKbJI
	3OUOmzySurDMQ/W5YmrVfGTQD7OYrD5KHoHaGtvok6JLiUL1+0Mf0Y1pP5ILKPD2itozdTL4qdJ
	1SlvIxoCNgcEEasBxx4v4mbf3toREQ75rkweqXNKAB58crkE/eSq/NO5RXzJXd0/19AFQBtV2Fs
	sUO367tgYg/I+h9ZxqjzDtMcz/nXsz/m2nmJ308eSmUZE9ARhi3oRa/OMuF36Eo4eXbrvwuNRHR
	rV6WtobP8FtXzVvPEITSBShJnG7E6r0KpQVD6IcLNKqjD31XQBNwo9Zkm4QlRQ=
X-Received: by 2002:a17:90b:17c3:b0:3a0:bfaf:2ae with SMTP id 98e67ed59e1d1-3a0bfaf039bmr9440530a91.43.1790666472157;
        Tue, 29 Sep 2026 00:21:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm3833931a91.7.2026.09.29.00.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:21:11 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Tue, 29 Sep 2026 15:21:05 +0800
Message-ID: <20260929072106.175202-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 ADC clock divider register implements a simple closed-form
relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
by building a clk_div_table with one entry per possible divider value
(up to 2^width entries) and feeding it through the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
set_rate(), and drop the unused mask_bit mechanism, whose only call site
passed a bitmask instead of a bit index, causing an out-of-range BIT()
shift.

Joey Lu (1):
  clk: nuvoton: ma35d1-divider: use direct formula instead of divider
    table

 drivers/clk/nuvoton/clk-ma35d1-divider.c | 73 +++++++++++-------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 36 insertions(+), 41 deletions(-)

-- 
2.43.0

