Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EE548EC94
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809999; cv=none; b=qguGUc8GP0F/G2qBQAt5fFTETRqAghd1VALLXzF0WBsr8nO/juoSrjvYUUyM5qqQuz13uQ7NvBlvozBn6Ud7mTCEhebzcSEb92nNzfJfmofq7zYbwBAYY1QU6I9Zno9Wswg79CchuxoSkVNxr8uBOUTcak2wNgBmIhLNxbVCQk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809999; c=relaxed/simple;
	bh=vbVRB+XAfZvGBptDaxyFBy0L6X6qfAhFcflwuzt2ToE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/Ciz2qpzwecQcCImt9OGQQ4UYAESTWWdGTNM4pnDmh/XXHpmatXkxOIACzioioy+VVmmz3oMG8d1z8lQPhojxoVomg2o4Nly8alqRtWl1Wo0kCvQEOSGHnTn6bHBSN8g7arggIuANSWhEKT0jLArBXi8mB7SfNZMiN00q5H+xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=m9Fw9/Jd; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="m9Fw9/Jd"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso4758630eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791809997; x=1792414797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfErURfU2L/OAAJKu6lDn6CF9WwV6WN3auE0sc7fkD4=;
        b=m9Fw9/JdT7zVBMhw0E3rlXzFTYRFAi1+7rVI/COJIXrHow+sAIwXCl9g3P/CnRzzFn
         DOULJy92j2ozVGbsPxG5G70EyGKDXAYjeQcZWudb/Ecss+KZiX0P+CIHTWhWRY/+f4Pf
         J2WGyNQbplTBE6apklFFfuOYxeDSCtGjaC/+VrdZGUNzJfsxQAUD4AdJwJmv95O46fP+
         hCwK5C1zZe97BOnfdiGTC9X7XvxSnin43uostm4WOAdZPrxzjxMqBvIaEa/IBzUTK20N
         /DI9UfPACtAMRwGKdgvA2Rsgtqhz2P3XWe5ufX7lnkxGCLpdNXAXFMjkXRfsNTvfwAyB
         D57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809997; x=1792414797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfErURfU2L/OAAJKu6lDn6CF9WwV6WN3auE0sc7fkD4=;
        b=UAbxWeE12lihLS4qRrUGxHMGLjcPtifcQDA0C9SPKw/SycDmxlk2j9k/f9XaZzXBN7
         3Uosp4GZmodslVVjcbaQ3Rjg4J8hxNQjNFfHtTnr+KtQl2munNYkv1sJZWH+FfGGbgo7
         eu7EQcQV0BXjgAEkBTmqTnCcUoK2oNtDVcP4gHhNHUacxnaPAhKzLfHBk25iG+iP6WDz
         fFBKgxjRTbkJp6wKGv6GiMbvEKTJU5H9xE0gXinvVSblr31fbqwzywnlUHdASuavIMlx
         4LGkuyAi/ZXQNhx0pzewq+2VxMDn2rMlO2lRv83h/Nq3vvrekqybFT8LFmIeVkCvRR8s
         aOrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcZfAIR4XnwULxg8HOUl5WGgUjpB2bHNmINU5nYOW/YSPglxW9VPFYp1/C7BxCNGaRddSGiGt0G26tZbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2kmi8O0Q8wCN3OE8pX6VLwLy3qbsJuhNukksRphR2jYV1fYTI
	XIchQXR2cVyB4gUDAdEyO836+UdxUrVWq9rz1f5fRV3QHjC+HMklp44qwAU67UMfSYE=
X-Gm-Gg: AYBFou2lDBveXnSdf+DFCs0bxb2b8eOz/In1VQ0zm3bDe3xiCLOqkAxgl9gMM+Kcb3A
	uzIE++o9RGVFx9gDDuxO72aYb2K2PmsMoka/9DbF6tgZnIjevoPM8VH71/0QSfo9Vd3ynmHOSpf
	wb0kJIFdj9b1MALTpEEWPp+2zHAhrH1CDpcLThesX5tEBo0gKSFDfTZIr+ODDpG6PbdPe5T0zXs
	W8I5KQEmYcun87wsoOOQzJZczggnM7THVHiDW0wM320og8SUsvEHY4hnxoiw7alroTCQABV9+Wx
	mKfPowNmshz0UrIYprkGASRNUxhd1xC3sRvNLPLrnEwfv7eQQs2YNtR1K94BEk9qWCVHq7gt1xH
	YV5/Px1+JfDNTQuEa4bYBjUFilnfWlG28NbSBPxbsSt8rZUCONkpZs3UaD5TbviVIWuRUQaBJR0
	U3gvF420096VWqYHo39xtnQ7JmnXrUIyWGvTMAA38OpyiYV+awPC73/aUaNIcqc6DFQUm4wSeCz
	FcNjJ2C0ZoPKdTi3n3mxe+w48b4ueRU1kquAq6YrnN5KK1MTc5tlsH3o4aLM+o=
X-Received: by 2002:a05:693c:409a:b0:33e:a173:4aab with SMTP id 5a478bee46e88-3537df8cd39mr13479385eec.14.1791809996829;
        Mon, 12 Oct 2026 05:59:56 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm35348067eec.21.2026.10.12.05.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:59:56 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v3 5/6] amt: make pre-query report drops visible
Date: Mon, 12 Oct 2026 12:59:42 +0000
Message-ID: <20261012125943.558629-6-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125943.558629-1-omar@blockcast.net>
References: <20261012125943.558629-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A gateway cannot forward an IGMP or MLD report until it has received the
relay's Membership Query for that family.  The Query supplies the
response MAC the Update echoes, so dropping an early report is required,
but doing so silently leaves operators with a dark multicast path and no
indication why the join never happened.

Emit a family-specific debug message before taking the existing drop
path.  That path already increments tx_dropped, so each discarded report
is accounted exactly once.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 2feb418..fec3265 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1249,9 +1249,17 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		/* Gateway only passes IGMP/MLD packets */
 		if (!report)
 			goto free;
+		/* A validated report can only be forwarded after the relay's
+		 * family-specific Membership Query supplies the state echoed
+		 * by the Membership Update. Log this readiness failure before
+		 * the shared drop path accounts it.
+		 */
 		if ((!v6 && !READ_ONCE(amt->ready4)) ||
-		    (v6 && !READ_ONCE(amt->ready6)))
+		    (v6 && !READ_ONCE(amt->ready6))) {
+			netdev_dbg(dev, "drop %s report: no Membership Query for this family yet\n",
+				   v6 ? "MLD" : "IGMP");
 			goto free;
+		}
 		if (amt_send_membership_update(amt, skb,  v6))
 			goto free;
 		goto unlock;
-- 
2.43.0

