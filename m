Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE88C4CDDE7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545226; cv=none; b=kS/D72TS1B5zVlVecPqiKDa+g93B8eKVLa3hA5urnwZ/bkQAgkdYJ4F3OdNlsZHn0d0X0FUoeEKPrOtrIHEcfJHV4DP7UC5j6AoPAIjvTyomIZZ9WAv5pXA6sAJc5pWBpx6K4wR0JKwC/maAnrUO2lvM0BGGx0kK1mnkOqi07Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545226; c=relaxed/simple;
	bh=7bW9zHBHf9MLFVFOP+2e6zwC7NkeCL7ilHfr8HYHFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ReLdH8LGQ1rMhM5MQhvtKcXFMAi9F/g0QNLsML2ifNrR6F7pxr9nBhUw+lFtizMRvZd88MJDDYtVUSQ+dU7yyZLFw8qEFc/dNj9WgjhD9gUu45+2MMxnjFO/0jkgnEpWhgpPfoEyhTchPw10Md7/LQgjT5DYl00ny3+PnVY3z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBTUl2GU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBTUl2GU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1937686a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545216; x=1792150016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xgJccrdau/8PmrM1/GKc8Z9lcJB5q1sjmJXVtgvUf4=;
        b=KBTUl2GUaI42fkrGguPvb5VHUTy4y3ithQ8NlNPHN/LZj3ieKpIcg7iuHX5+wyXq8+
         DcQJMdrczwNH3oyRsFeVziKW9B8qxXtxQkIK5xdt032AlaEhjgg5qTmXixqcrPKftCsG
         bmIlwfv2fD+7iqrwgapDlIRITC+8wXno7EPgL1DFln7dcYPtXURV2EaTkZrbv//WEtEw
         7A1uaB0QS0ol593t+ZkcPYBrcg88wH+2WL74G+H7DEuOecEbXjuEAeLbJc5z87Qu6UpU
         AXhzCoZEnE0STVZ588E64ebTYwnIrtXsAxGoUgTlSXT7pcokhcEsXCdiTuutLdio4TIk
         YF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545216; x=1792150016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xgJccrdau/8PmrM1/GKc8Z9lcJB5q1sjmJXVtgvUf4=;
        b=IhN2O+KV2MGGL2oRNv8tSHhQJe6CrNtiU/dSqMGvkS+MCqHKeuy8cCzK4APN4BTiD9
         Z71UYY2XfderPQW9fMy2/0D3dMF9vQsI1ATEU+B+ZjfqjAZNd0AxlYhJbM26cg6ZDy4S
         qKhVOS2CFs/OlDjQEVVsdvkWwgtcW5bgkfjZek9sBk8Rl+gpgbvBK6prrFrflarHHXGt
         G2BX+XE7Az/iq2JoftiRmJajsSVFwuvqm51C3curcLmckgAmDbnCKJsg/aekpKawrFdf
         u9JUQozP1vmTiuHVI60m0zy0qggxNb10nLwfh97SdjEGjdLOjH85oSS0I9iANqeWXWbu
         yGKA==
X-Forwarded-Encrypted: i=1; AKwUvBxcsWCYaFwbgyLlQMhzutqEjH/cJxeRhRnrirZzRssOgvQSqHCNL/8PueePqjQAGvqnJ4oZ8A+2fvMINXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIjjRNS6ZxtbHBwaNNLyiC246Y4oQr12DT1fBdTCeUQkAOdqvr
	1kTwfNPcCzuuTEcjMoOoJ9ccWv5VXi2ptFHxNKfPzidqJF49pSxAWWUd
X-Gm-Gg: AYBFou2JV0jit/DlI7LMLGVR80z02f8ivMO+cBq8yvZfoMkp57PA8hH+4BMcCHkJUXU
	i/mzQ42Wq7dgBsFNywnWUzluTt+tlhD2W4/qm1+qkMKPi124B1ZDAlQ/MnKeNC7RGTIy2+f/myy
	BMvn7h32GzM5aGHDcnR93APZEzZvDd/IWLcunqTggh1/BNJs9q8wwYwFI7lOCDmRjlxvIsyOo35
	z4k0GkkM502Yr3ADv+WnBvfrs23w4VjzKW4kLoU3E8b+rSktrRJTuoR755+T7P2XbawNH5MIQsQ
	dwClWypnogAr6hwKowzQN/GVFXTg5eRqr3cB3dzgOMonx/hs9qa6XQ8wJPB3mhTnY3kUyWJzHRB
	5wXTm7/etoLTY5GhOlu6oyKaYLAJ1rk5HV0myMGWKpDXxjjPY2TqYmTnsZMb/AhkA0cP2jTDYcb
	mhiDBZJM6OpqOGoYxB7tQsU9PdnejwOAoqAa4cHIqvrvid++mpmhZiqFFKiJkihpQML2mtRVGjU
	RsqpVURnxXVGFEtujstQL9Nsk0KunoXFbB0GhqxRh5oWsgALGZ16NvYwxD3ekxxZIeHP35kjjCw
	b6POshrrHlWG7w==
X-Received: by 2002:a17:90b:3c08:b0:3a4:d338:4156 with SMTP id 98e67ed59e1d1-3ab3ae6ae4amr1264452a91.52.1791545215931;
        Fri, 09 Oct 2026 04:26:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371e2833sm3181148a91.17.2026.10.09.04.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:26:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>
Cc: Darian Biastoch <d.biastoch@gmail.com>,
	Andreas Kaessens <akaessens@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
Date: Fri,  9 Oct 2026 18:26:34 +0700
Message-ID: <20261009112634.33436-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but mcp23s08_probe_one() currently ignores them.

Check the return value and propagate errors from the reset GPIO lookup.

Fixes: 4e73bfa3ee37 ("pinctrl: mcp23s08: Add optional reset GPIO")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index cc668f84bf8b..fab6d19a559e 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -613,6 +613,8 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.owner = THIS_MODULE;
 
 	mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(mcp->reset_gpio))
+		return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
 
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
-- 
2.43.0

