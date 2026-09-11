Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09343D45DF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164968; cv=none; b=uLi5dWwk5yCACfNayXChfZVuYu2T1A5xJJmJPFJYONXTdvGjD4PcxlR2rSvrNRUt3cL6qOovawz5WIZbJMuBHFJp20sdRL7UvCXHMpf2zGNFIvnI4eyjOK4HwiWDJoGkO1+rWBrzp6OpkowMauJ0KH3/1J/R7XOuxJnMOG7Ln40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164968; c=relaxed/simple;
	bh=l8mADb+Y2yJIN8p3uP3JWJwbnT7nygcjOlWwdwR5qNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nHXwMuU6VJSIIgorjpz3tFlIfXpu/n2L720Cn3Q0GzV2xVzRzT9aXIDEzVd57Afib/bLnmtjWLol6m+0XCEpcR5nhNbHp3Fo1XGcpQ16i1w77POSp/inWVvcG90JBUz2BmdSWpq63/etirVc0ZbQrKSupD+O5CeXFv3XUaawAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XshqTX1u; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XshqTX1u"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so36676f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164963; x=1789769763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+j0SrUekwQLNDLTVAcq+UzhhLckFM631ivmj+fcOdc=;
        b=XshqTX1u8dPd4HqgausPehEcLSdVr3cVrZaCEQjwQTXK7aKozWon85fpY+YHQXdo1p
         eo+JtdSw+ZdH7fm9l+TMvd5sQEgwoVsUFGmV/eXtfywkBHtrWPZvB8z+79YXUoZIC1TQ
         jUHzsAtLlhZBcqkF8/FEhAzFo4If57LMdKfEEbfxeZJAlTASn3nghr9P/4ATvHoBYjJn
         zX7kQqxi7ln3pP7CfCen7XlY40wTfF0ePyF2eNAqtZZ2u1EaaXdPuGK+j2ZnPcgrrzfH
         D4CMth8QZ+135MrVfOW5oRlRC2oNeReg30d4WvPlN1xPFKWmj+EV8Lamx58iU6hRJrFv
         UpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164963; x=1789769763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+j0SrUekwQLNDLTVAcq+UzhhLckFM631ivmj+fcOdc=;
        b=qSIpyH5DXZordeNE61q7fh2ZkMbTLu5EgWfUy2LnzTQr7nZU+D5pPv+N4SdrteuHDi
         uYP6UYm15gYifP6ZvcDi4HIWa6GR76jGJZPA/JLkys4w98bPVYNNw6wyUnxco7PAP99H
         ZTLQMgVPdDaRP7cAhp2jJ6CIY+LXGWCfdtratKkQG9bbt7S3VMynhirEkvoAZZcllNKD
         RHYDhEL7fc6HBRIIyyyDGrfRvMNB2D1jRWZPktu1bXk/LBA2gtpYwWHA1Llh0lBVRo1s
         nl1MdSz5HmSGsRxfqA2sBd7a0FBm8nJwPOEejxxJBM+tMp0OFOhTPYy4nysDOD7/z+jv
         eOBA==
X-Forwarded-Encrypted: i=1; AKwUvBxtCMUL+FSZyrrGVHdxw8Qn8Bv0N0OIuQRInnl4mTbSig5GoIdlUe1+2Ur7i8STQ+TRS8MUTF7kWzcbvyg=@vger.kernel.org
X-Gm-Message-State: AFuF++nJl104w1nAeB+xII8GTGnB+oWJChmnu0yIUoQF9VpO/xeIDR5Q
	Z7QT4zc+FWzy6PXeM7TC5G7LBaJ4YeprAnawWW3mMpiX+qiH3hBzXPnK
X-Gm-Gg: AYBFou0J4ideSHAHN9bmyq0LbXbhgnJONpe4uQgvT81o/kQ1+jxQIRjSOdnzqKLQPP/
	wSZMrzNwYzklxVM/pWYrLcmWU3MqqDLdqA70aI639IEJsxHkQ2aH/cQNe2CVvQM9DNlYAA8wxZB
	IITxe2zFBDARiRGx1rkYe5JbuEVNBI+W7fxjg4ypM3zJzLp0sKbah1bWmiR2FFdORlwro3S1edv
	3zQ4As6bTNEs4fpWp5J5aE8O6ZN4BaBhVXZsNeC8McbLW4orYEjplIRinlKgkVUBf651CvU0Hr6
	d2CXuEbGldgtgnQuymRqPpaedZt+p6Q6nwKk4YX00N6A1zxMDB8MXGrQcyHYzRofGiF585W8ImS
	DrEpL/vXnL4kBszugy9yeiHGeMH4QsbQZczT4n3WZdEzgD2d7goUh09fjuyh1B/3+wnyNh5m+Dd
	OpheUqfyvbqf7HSwtyzx1386RW7xk14707xn4wNophivyyo/ZchmClQ1cYUcaUBUDfjZuIUuO5b
	UmV1ap6tppD83QycuueatCxb5sV6eOYNovqfGip3SRxFjOef+/EMp6SU5eW03gDDePOfCJSYsbO
	29tV88FwiOiCAzFbNB64RvkldyLbZ35B7oCm
X-Received: by 2002:a05:6000:2002:b0:485:8c17:9767 with SMTP id ffacd0b85a97d-486f6c4422amr430995f8f.41.1789164963122;
        Fri, 11 Sep 2026 15:16:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm9696719f8f.2.2026.09.11.15.16.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:16:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] OPP: Fix the return value in dev_pm_opp_get_of_node() kernel-doc
Date: Sat, 12 Sep 2026 00:14:43 +0200
Message-Id: <20260911221443.7139-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_pm_opp_get_of_node() returns NULL when the OPP is invalid, but its
kernel-doc says "else 0 on success", which was never true. Say NULL.

Fixes: e2f4b5f8dc59 ("PM / OPP: Implement dev_pm_opp_get_of_node()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/opp/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 2f3bbde9a9e1742a2d6b40be91a65d8fa7365bf3..ea93800795783f0595483742c0c10de42b25518a 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1409,7 +1409,7 @@ bool dev_pm_opp_of_has_required_opp(struct device *dev)
  * dev_pm_opp_get_of_node() - Gets the DT node corresponding to an opp
  * @opp:	opp for which DT node has to be returned for
  *
- * Return: DT node corresponding to the opp, else 0 on success.
+ * Return: DT node corresponding to the opp, else NULL.
  *
  * The caller needs to put the node with of_node_put() after using it.
  */
