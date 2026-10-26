Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034745;
	b=xNS3oxjLhfFT5Ah1D5+gbyYTLNz6LtY1q2QE7i1DS8skdYVMjkvLlJCay3MGYhb/AZ8a
	 QV2EZd6VDgj6/lAsyT5a7jypqMAdE0ZuzH/8pAKQGw+lDKfmunHUyelGz6UhyJCHFjMG8
	 uQkLRixnp9GXPpDiLwcYslDQeiQZpgHhgIpVXVWzS6JlPLVpI+t2FVbs/NF0OfaR2144A
	 gihtQo+gefzGpid/Vd4UMuu9BDcj6hI/Zl0R4X9QVK3bfOfFT+TLg/15lengglKgWhh9t
	 mCdC9hlWO9ZBdJ8dVOg8adD9BqL5gMH6GQt2N12uGDrvlvRKc99itdIW2OBYqhFc0kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iOoWEuPN8PjFnVXTaFSVmZD4apYLmhkxv/+CXdjOZWk=;
	b=QPVkovifsiWVZXJYAn1DkpocOIeu3LgiTO+cveNoUKoleZ7fhOeIuQYY7WXBptH2sHEj
	 BdKRn3eL3iUC3Ie+hH+Je3sfliv5eWUo3q7km1yNfPtgzFnKMWX2WTBEcDRsYZ8fg37ly
	 dIX/KH60uwpr7yH4Va8NXTVyRGw9Nxj5NVEIu0NTPGUKP3H6zpPMKlFWgOFbFdSwgq2bq
	 z4bTC4tcg9tmlPusgRyKjhPoKtzero8CsWVKFnY5EuDNo15vKKKY7EMgYWuOOaLzRbbFV
	 nsRMwnEc7of4AL/PygGVeG5Pf08J/cC95ENGJoBPcBwpsom0+4unEDJMHzjk8wg1u6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=byAEJTzM;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A70606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A70606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=byAEJTzM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso9512194eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793034745; x=1793639545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOoWEuPN8PjFnVXTaFSVmZD4apYLmhkxv/+CXdjOZWk=;
        b=byAEJTzM5h3m3pLs9kOLClXB4NK0e6CQybHiG3+TjFRtHyzUb3K68VWa5AHmyQdhsF
         jncHkDdouVXXW9VDmMqC/9nXvk1uzbZce/nZ2KY8e4pRXeYWHd1A0gfZa6/pSM+OlX4o
         3VKAi7j/p+RTSXR0hNpw1TuCVlCSK1ExEy4INfLTuYm12YpNdS5oeveQYd8oDhcxiOcA
         /oituPNmc7JAw0NMDBJouk6GgWvoqr7QmQi3ph9m+4aXlMhTsA/nrmyVAdN9r7/nifq2
         ewhSACOKiL2Y5/KTGRg2qvEE7PXxWePB3mkSQj0E+bQuusYQspjqft8kRWZQ/+vGnkqu
         VIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034745; x=1793639545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOoWEuPN8PjFnVXTaFSVmZD4apYLmhkxv/+CXdjOZWk=;
        b=umO7B/S8Ov3TQavVBwPbvzi/lH/jSNnC7CM9fiTAW1r+XAa0Zt1wOOE8RantJHkSes
         37XIy3Ce42FFsnBgzh4EBd9uwJm1gDnlta5S/vJWL1L2Zt+ZixT3rUkreYSLxE5XTTjx
         3wQF53bFAp3T+uyQ4hS4YKgqQIX+aTLycwucYtjLY9IL9c6E9r4yAMj0kYyXetDfLpcg
         LlZg2Kw/UTyLhczT6k6hDwb0kA7TYxPRrNpKgJpsgHu8V5/jxjo6cT30K7TQxEefgfAD
         nBFI8oHMvvJifBimerw9/imL9ScHv7G3jWz46Vnp47Xqn/NMwip9aVPp/Lq8HtNdP3BU
         kwLw==
X-Forwarded-Encrypted: i=1; AKwUvBw6iOJChQKHoSu6C5F8Fe3VND6s8nUdRlWkOneC3GLyBjwRl8T914vRwol76uk7eYQM68Ty/9g5RSx3pHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlrIaJyvVhhRlDjJgbDqhGyNSTWRv/WXrFtr5sxxfaJc80kAMd
	JtFfo9ozB19o8zbfeoj6j5ANiGRQ4JdpH7G99c5INvhXv+i/U5FKU/IHBa20JVMt
X-Gm-Gg: AYBFou3C3z9ZmzdGS9v35hnUDwvtwIZniLYfxMk8daFMfgagQxzwwGVpZd9cvm3Rf1h
	b31YBh38i5X8nigxi15+zx+Xf0HdcCocSiKoDg/vjHxaPppc1E9NZzgzYF4Zs+Fajz9z7kcYD1X
	IbTqDMU1REFpB+qiBb0A8LkDbuIGhwXP8Clqk2ZJ6fIxT6T1rQW/ko5CKde/7/758ZV9B1znCL5
	CvWJMDp6Qs1fZCEf8aJRfzx/fb49w5XmSXrApzHIkIzt49xRbP9jdSJ0nxcxetjKyzbcn7rj9hA
	+tpRMn+JA29cAl/5rlxIkzt+FcLY1eWvA/fZ2uEc7XabfnxIDpxkxqTIJy8aaRK5q30JvvZ/wVS
	AkoZjcjBcss4vTuCPUAb1FGgRCqt2Msr+z5B7qefIKkFokdMxQpMLA6OmBQvAar2Y2+OD8vAqUo
	MBgEP70tvDje5h4UV39KS/OUc6KpflHS447J+b1jdtcy7jmqane7reeUkywrIloMdUjWph9CzdW
	D8ay2OhSuFKiH0isOjK7bxOolsf1llg+C5/vS91PJPeN0jONZeaSIj7ILidp+X5Nbsu5feZjSF8
	fZ74DXklxg6/5wTEyQeqp1OP5ubACxcQZfrJbRj4Df1Pm2OugwoKHWE=
X-Received: by 2002:a05:7300:2301:b0:347:8d01:164f with SMTP id 5a478bee46e88-369e84b15ccmr17584028eec.19.1793034744342;
        Mon, 26 Oct 2026 10:12:24 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm24878750eec.4.2026.10.26.10.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:12:22 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 2/2] net: dsa: mv88e6xxx: fix 88E6171 statistics type
Date: Mon, 26 Oct 2026 09:47:33 -0700
Message-ID: <20261026164733.737299-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026164733.737299-1-f.fainelli@gmail.com>
References: <20261026164733.737299-1-f.fainelli@gmail.com>
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

The 88E6171 uses the 6095 statistics operations, which advertise and name
BANK0 and PORT counters. Its stats_type bitmap instead selects BANK0 and
BANK1. Since statistics collection started using that bitmap, it has
written a different set of counters from the one advertised to ethtool.

For this chip, get_sset_count() accounts for 30 BANK0 counters, three
PORT counters and five ATU/VTU counters. Collection instead writes 30
BANK0 counters, 26 BANK1 counters and five ATU/VTU counters: 61 entries
rather than the advertised 38. This mislabels the tail of the returned
statistics and writes past the advertised statistics buffer.

Select BANK0 and PORT counters to match the chip's statistics operations
and restore the filter used before the bitmap was introduced. Tested on
an EA4500, where the two-bridge forwarding and multicast snooping tests
now pass their hardware counter checks.

Fixes: 5595e3613ea7 ("dsa: mv88e6xxx: Move available stats into info structure")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 675b82857754..dbc4a6be54fd 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -5960,7 +5960,7 @@ static const struct mv88e6xxx_info mv88e6xxx_table[] = {
 		.age_time_coeff = 15000,
 		.g1_irqs = 9,
 		.g2_irqs = 10,
-		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_BANK1,
+		.stats_type = STATS_TYPE_BANK0 | STATS_TYPE_PORT,
 		.atu_move_port_mask = 0xf,
 		.pvt = true,
 		.multi_chip = true,
-- 
2.53.0

