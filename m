Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331771;
	b=Db2QKnG6IOBjXgxnYrIqQgx3ZCrzGBYFE7bNPYgBx+iOAizyyXX/Jpju+3dpTygeUaET
	 2Rmv2Uxu8CQBKMofI55O0eog+CtIXkdscvz2m8KOIsb2SgZlUiSQmghuN3etEQqSL4j7Z
	 v0Gq+s6EL9kZWJ9jGDewn8wwLvk5UboZryA4t+MnJ6CM9hU3PZeuvpovGe5wtnSp0mGtl
	 LmijAYTdHYH8jICiyFCjQQ85ZY0Igy6YW1M26Cn9hhL5RZasenuZomVa30sGH8tX2BnCQ
	 fX3knqcB130/L+zSEvrSjlEgva92LUcAEr1QS9mt95l/+WtfNzvbrATx+Wedug8dVvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U8vekOIgDj5lHshrVu6+OojGjUuLqlW9D9EqkiQsI1A=;
	b=PnmgDEj1V6cJLBvlfRC+JUag3FeHSjB6XxPVwhfHsj27qMNX22XI1gE347T7mu9PcWLo
	 RPPPf1oL/dIH84pDLuF5sLySVZSPa9eqZOxCQ9UZ8nbh/bXelCtdH6ZfRo/bJM/VEwuJv
	 Og2EyWnKuLOoLAiQi5AH9RyAw+wK6rfSwVzIzf8IImOyDLEG6lo58QYdyCfdHbihJhBnU
	 SUQK7sxVJWOHcEl5KGLl0oQRAy/fBRREnC5LrDyD2bpJtTTtvF8kgARSOYr3h7sFay8vi
	 CTlXknhYTIox4+8M675FNVpraB6E9f6DJ84KmJ+0zpFi50d8CeJ0tA8Mpkz5fHXGQTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c8oUNAyO;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88B606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F88B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c8oUNAyO
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b904d10882so1041377b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794331771; x=1794936571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8vekOIgDj5lHshrVu6+OojGjUuLqlW9D9EqkiQsI1A=;
        b=c8oUNAyOAS1OI9ImuewfKiO+OK1ksCavl12v4VTWFcQGJh15hZlG4TAZGOXSI1BPEL
         8lCEqG7myzG6euUva5W3NAP2wOng/6KEQleZb+MiSY6ieB3LrDBrIaBNyg21bb/czaUs
         P+rxa3fWNZ50SqFdayY8fsqJqu6pJXSJ4mMZCwUNITsQz7fuFnTqfl0ybZGXIfL5Yg3S
         SHw4YyEM9PtEzFztZevvzKb7bP6mCP2+LJ5DABubyAs2gWOV8+t6FONhG2wa/PFiBh1b
         hF3WhSOHw+ndoFMpMw9Q3yKq/JU2F0nD/JrddB2WX69mdiarI0v/3sd6B/RHJOPLQ36t
         /rgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331771; x=1794936571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8vekOIgDj5lHshrVu6+OojGjUuLqlW9D9EqkiQsI1A=;
        b=MDUc1AI0t/oGF8lLjKhFIuDxcfxXpCHsgOxJL+AgGD8oEjACHPJKjZTmqHjagMgIjI
         bKkR7NCHJEoT3pQgBm8Jk+ZKLcNqRUmSM8SrB5rCLOYSE9My8CT6GrTA3St34nHEuc8b
         3Xmodyx1N88FkuunxVf+W/7itcYdG0DYOm7wnXPBmslBl+gybLXqMWUpiBTrjVzK07XD
         +ca+XP9VLQnlywy1XDMX1m0Dn3iOKpU/UAHdqPmp++pXUfhlL3zdE21IGY+KrqI8+1SP
         P8qnEhvmq8WObXvtUb/sOROoCpyXZ5WCfKYlB3gKhS3LayDDQvB7Y+qS5WplMJOrhyVv
         OKDw==
X-Forwarded-Encrypted: i=1; AL+hErFY8I/O1WbMm1toCuWg57BeTC87x6W/iEy1tUJVMDCvlBa67lrj2nsiyzaxi0xWkxvTCGQGAjjbSKH5mBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qxOET6OTA97w0PSlkZUkbpG8Tm5zWpnOECkDxIaizEyVo6WOo
	nsc0iQBXni+jcgyK2nKUQMJcW+vKObkSc/4cwELQW3ombwphuqae6JLtLLb5JZaqvnk=
X-Gm-Gg: AYBFou0Hmp94NmqI5/rmglE2ticTIQaAr+JVaHwZEz8XE35TnEzw+/9EWKjEvBZ9Dvb
	eEnOZWcrT2Wtc7JTBvLTTcfupKoJTQmegIghJ93z+fX/Cu1V0aOC/1wlgl1h2D1MT8AfZxV6o80
	00TOZh1+5eDd5W64n2FmMcsJzRuDG4Fm8HPP+o42tHimoiUyMYJkGcpXwsSdp25J5u5FtbyLPFD
	9JCJITP0w5mJq2zSYqkO4+o3y6ALSPj3gi7GIejcfJpSicGuL0YISSICxrny0YT6S6RNKTg6c5N
	N1Gpu6wltddntiVzglCOyZfs9TBogjhU0s0skbqNdWqvx5CgzXcm10c2B4uHMGEUwIiO8CUC9Bf
	pvuAaHay9xLmDOM6YsJForRuMidyizncN1rGiQAixNmjITTigUHZ/eyaI0Rgad4qEWE6Y/jXWza
	yJdYW+nXSh9k83KeZLkfyTgQXd9bgg5TITOEagBnkGmbWjkVO7ZcBo0xiL57le+rbs8VRxXJb6I
	OBzHqzZUtC1fM7dbMMzIXV0Tl+bUbmrSrCPVWXIH8kwHr02jeRCLQS0PoFaB30fI4AmqBT9Gf3l
	t7RHaBHQJWkWCE1uYLaSnxETYx7TQKXTYcaPLlb4XmY19kVjb+/SXMn7WqXAu/+LZGKZ
X-Received: by 2002:a05:6a00:9502:b0:886:46c:8a1f with SMTP id d2e1a72fcca58-8ba8735a042mr3412188b3a.35.1794331770936;
        Tue, 10 Nov 2026 09:29:30 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f1effsm1197939b3a.49.2026.11.10.09.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:29:30 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 2/3] ipv6: return EMSGSIZE when first route in dump does not fit
Date: Tue, 10 Nov 2026 09:26:17 -0800
Message-ID: <20261110172925.3293312-3-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110172925.3293312-1-stephen@networkplumber.org>
References: <20261110172925.3293312-1-stephen@networkplumber.org>
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

If a route does not fit in an empty dump skb, fib6_dump_node()
suspends the walker and inet6_dump_fib() returns 1. rtnl_dumpit()
then returns skb->len, which is 0, and the dump ends with NLMSG_DONE
and status 0, silently dropping the route and those after it.

This became reachable when multipath routes started being dumped as a
single message with an RTA_MULTIPATH attribute; a wide enough route no
longer fits.

Return -EMSGSIZE in this case, as IPv4 does. This depends on the
rtnl_dumpit() fix in the previous patch.

Fixes: beb1afac518d ("net: ipv6: Add support to dump multipath routes via RTA_MULTIPATH attribute")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 net/ipv6/ip6_fib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..1025267992f0 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -755,6 +755,12 @@ static int inet6_dump_fib(struct sk_buff *skb, struct netlink_callback *cb)
 
 unlock:
 	rcu_read_unlock();
+	/* The walker stopped before adding anything, so the next route
+	 * is too large for this skb. Report that instead of letting an
+	 * empty skb look like the end of the dump.
+	 */
+	if (err > 0 && !skb->len)
+		err = -EMSGSIZE;
 	if (err <= 0)
 		fib6_dump_end(cb);
 	return err;
-- 
2.53.0

