Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883019;
	b=ZFtyKkEvGa4b/k/ow7hrz3CW1e7segIU0Ub864IVimG/nqLuWH5zAN8Xu1pjviBgFBuY
	 hyCuOmeitr2RrzfI3cmrCw3m8z6V2izaIhDvrZXnE+ZBjleprM4KVQbapTtp5od8rGxYx
	 KxAK3TYfqP5d1eCSkQvICvN7b7NGE5w+fsqmrdWsQFhnXQz3ojTQ1YP+8LlHN20KqfiJh
	 JXaQeNNsZjHB0QcGxQ8s5HeMBs2A08IxJl4DBO3JBCS3o6nTC6vnSEOj+uAFG6P30iQuT
	 WZZLLa1rDZ3TWt3zMMpbldr3HS5qJ+lqb9py4Ny1uqugiaaaAHoWcPaogEN3Y6VgyPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdyiRLv7e1N7dBqCXNkMCcJEXQWJI7RZIXVTawyjL7E=;
	b=0imClLSmh5c4WxcMv4ei7vRIZYSqjFj4aqmn7FBuDi5Yp0dZEvLm7PbER+JbnUZ45MyH
	 h2QirGtDEEYJjv94xY1G2HAnA3QUIyQtMO4sQuWuwTxVp32jO+opabSeVu1CBFgO63Ff0
	 Czwf2zuqIcnmaKk1JcWU94DL2r4AwqZim6pZYPT3LGWaAxAFNrA+DG8f7oZnMnLUtJjOL
	 gSaQrvQoB2f+bzZqzx7FJVQpzaX+vSIlZ4x4u1DZhAad4fP8x2OZT6cYwZ7lSfEhdgsuQ
	 u6kmKx/zYZM8tvVU33YubGfobMfz8a5hV/OzL5l2/r19JIu3oP9F/rzhDb3ZQHB0oqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Ct4lTTvn;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B87C606D822
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B87C606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Ct4lTTvn
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e795af1d4so501854eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1793883018; x=1794487818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdyiRLv7e1N7dBqCXNkMCcJEXQWJI7RZIXVTawyjL7E=;
        b=Ct4lTTvnmx+AhocEeH92uMHCCd5cp/yt3zz94xDx4WFdFEW2po1ZlJAWgUoVTj10xW
         IjoywvAejIzq3vQ81pw5FviPJaJ4loJ7sZeMfN4StXhLJ28zCvL3Wf6Y356LMHV0kFEI
         zaamoC+fpt9gnkpw12cGDCLI66Ha1Oc500Xix3tecIJAEERAwgfHFPAVu3V4txQYJkr/
         fbVpp5mjfTlMyYEM1xxCawiiPTgFJ1LSk+j24PpRVL8f8+AlgRKZcH04ykvjrWF0V4c4
         DtOHcUBBSAcCODEEt/xJqghpxeApjA/VmAWUJNzvmWTr9ATN26fcIhZVfMNAksQCN6hQ
         sv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883018; x=1794487818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdyiRLv7e1N7dBqCXNkMCcJEXQWJI7RZIXVTawyjL7E=;
        b=RcqxGW6rLRl1KBrAJDVq0uSPE1QNRV4LmD3wParvGrq/PXStPnVHNlbek6WFBFSmMe
         WP2D91Eve48PuebfidkLB/tfRknD5OkdaW9S+3KliCGJTvmb8XhFKQG5no0bv5/cJO4l
         wH/BX6iAugBncwCoYN43HxmcWVz/ZtICvXWnMLcENxVNOiwKpkxufv7dwtsaxRWDxPgk
         YNGw30ZYywalsOn4Ox4FtVdkrhsFULNH8FRm0RO+er1EcZm+ncRZQE0ZLrFzoDSfwErx
         9mXj882v/DNgyUSQWZI+CVUdCv/qK/ZTKgaoZKVo4kw73LYv+WP3zEweCcQaVOTz1i4t
         zY7w==
X-Forwarded-Encrypted: i=1; AKwUvBzUVkdGXDEZS3i6Ly69X6wAXdFAk4AlFj5jikttHK4AWUu7JHokcKMuxXVE6ZRmcyLMvNo8SIXQXBhkcnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R65aEGrD0XTn0ph+RN86fq6f9BXwjZGPuTy9l1+/zICo3X5pd
	SZGjTO3eUt0syTBIhbhEDkrgYt6sLodYInqRZ9atfar96kIbedlCH4QsV5mm8DV3BuQ=
X-Gm-Gg: AYBFou1vtvLf4rY/wQB0oDL0l5z6lW/r7jTAam8Pg8lKk+TNvni5w7zcSyfIfxbCnT+
	8DEE2PreQzHnXhzpYv/Mu2piewlxXl8h0vdTeoKZOR56QZKOQX2ptOjIYy/RYB9wDf/L72mnma7
	WdARUvMS/SZqohvIiByD3JLUiHly2gfTxjls6pgfw8zsUxLZulS6KzBoXLDBc5Kl50sLhPMsKKl
	1XmuvYwetEKbdx3FHSpuIYuxBhPMsJISZQGRq55HPOjfpnoYjJBv5ycczGTfdgp0a4hCpEV7Idj
	IB7BPChI8mMjv+44ESn9mDTOyzUL05Vh8IfIXyd/7aEk+3GTZfeJ1BYjcl7JNQGX4Cfcih7KCHl
	Y6pkA2x6vXuLCqmBtaEwIaXD2+iI4YUpljneB0QdVtR17iWtfztkyMzHU+ftkqOfhI75qKg7UtZ
	99d3O1Rb8ume6L8m8BGB77IVepu2nKW+vgg5lCMe/1W3e2zJqyaMwDrVLjE2x6/m54K4YCLm0u2
	VJTIfAba+KBkHGe7T/wt/Pavddgo6CK4glsQ39JhRAgJ2VFC0V6rGp9cs1iaOsswkyRYiaEQiSj
	uv2WeuznGPQPP8TWrtrzKZwlesfHJnwvXyKglQFL+C0lthNmuBFypJdN+Hbdq2Mt7gm4BZE=
X-Received: by 2002:a05:7300:8a99:b0:36d:dcdb:70c5 with SMTP id 5a478bee46e88-36de713aa2cmr3426944eec.20.1793883017458;
        Thu, 05 Nov 2026 04:50:17 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm22527257eec.27.2026.11.05.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:50:16 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH net v5 3/5] amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
Date: Thu,  5 Nov 2026 12:50:08 +0000
Message-ID: <20261105125010.1107546-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105125010.1107546-1-omar@blockcast.net>
References: <20261105125010.1107546-1-omar@blockcast.net>
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

The netlink policy for IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP is an
untyped entry with .len set to the size of an IPv4 address, which netlink
validation treats as a minimum length only.  Any longer payload passes,
and nla_get_in_addr() then reads just its first four bytes: an iproute2
that puts a 16-byte IPv6 literal in one of these IPv4 attributes turns
"2001:db8::" into 32.1.13.184, and the device is created with an address
the user never asked for.

Use NLA_POLICY_EXACT_LEN(sizeof(__be32)) for both, so every payload that
is not exactly four bytes long is refused with a standard extack instead
of being truncated.  The range check this expands to fails the attribute
even under the liberal parsing rtnetlink applies to IFLA_INFO_DATA.
amt_get_size() and amt_fill_info() already emit exactly four bytes for
these attributes.  IFLA_AMT_REMOTE_IP is only ever reported, never read
from a request, so it is left unchanged.

Triggered while writing a selftest for the AMT IPv6 outer transport:
an iproute2 without the IPv6 attributes put all 16 bytes of
"discovery 2001:db8:a::2" into IFLA_AMT_DISCOVERY_IP. On a stock
kernel the command exited 0 with no error or warning, and the device
came up as an IPv4 gateway with discovery address 32.1.13.184, the
first four bytes. There is no oops or trace; the symptom is the
silently wrong address, which fooled the selftest's capability probe.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index dacfd5524..68f08f5f6 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3307,9 +3307,9 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_LINK]		= { .type = NLA_U32 },
-	[IFLA_AMT_LOCAL_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
+	[IFLA_AMT_LOCAL_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
-	[IFLA_AMT_DISCOVERY_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
+	[IFLA_AMT_DISCOVERY_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
 };
 
-- 
2.47.3

