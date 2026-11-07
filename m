Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012588;
	b=WDP/nCKEZXwXBgs1yd3lnprIPaecnFV4uxEHoo7CVgDMiSpwu8ujwO4HH/K4mjmoUiCh
	 jhD/5DP+ViTcWL3hO/Xda/y+H7NbWVK6Vv+tdyY+NJN6W6uj6iW39x/PVa1RfJvTsFYAO
	 AO/kxQUzyPA0V7TWcBNakxCnGgN6bygRjieG6sIQfYov11QTNKt1sAcw01rEe21WkdEnt
	 3MWWC1uelqwJscMIOYKhvJzDrDrDxashoBzkepSc3kJEDbzUMsCzrEIVt6tDYej10KkVt
	 fWJ541SkUxNHjZQjIXuQVYcc+6yyTYgxZCMY8CJ31fB6xW62S9L3YKDud+pryG1qOAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7xQshCH8xaN5UPnSW1KLNuEBOnt44t+We6BEBpXAUps=;
	b=TiQVg8c9csWpNBt0ZRYMblE6nWyuBw55OMf0f2x4AE1zcCohh9aonLa3XKqMl3L3XYPm
	 YBASpGDVUTxno4kyWl3Ls+Cn/C8a0UvK5Lth5vizLqfdydgsnknOa6OsD9I74KueFzyb0
	 42esalN8NNqOa7BKxmxG9Ml4wFSM0eKPnYCXgsR3Vfn8ooceSvkXvSJCBIUgBc4Es1zMm
	 gvPorCwvzjfV3E12Xo4z5+L9rU7saqEvlYo5LopsmqHC/O+qS8NvHInYBwxT8pS8N2NuZ
	 CMm8vaujd2y5cxvNZQX1CFgsBUqm2o+R93INzJ8kzFGBGa2bx65R9TevrCUqfigBIjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=byWRxeKJ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCC60733C7
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58DCC60733C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=byWRxeKJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1953236eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794012586; x=1794617386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xQshCH8xaN5UPnSW1KLNuEBOnt44t+We6BEBpXAUps=;
        b=byWRxeKJyZpL/96LCkSzvqpdonTp0uKzG89jYCknLPTkytzi9hMuKAqDt0kLeGG0Po
         Q4GGfhFmjmt6CMeUyPJqCA4J86FS/3KFCq6uWA+pFIqeIPlJH8GM57BCDtTJNFKMRpBu
         a93DzahHVPPtWXFoyZT+An3CP33sDiYxyltZ1xyAb1SDKRBDnrHvpwAN7Shr0C01O+cR
         FNIDJbeiAV95gmnoAOwxH59KUrUdnFSOU3Z4q9lSLgjAEsDdt+hAciZrK9NencfOAtvJ
         f/aWVwi7JNyXRuwDoimNC4d/z4IwKH7xNUjymrTX7vuVQSVXlsfAL6mWnn/4ixcTYTxf
         JEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012586; x=1794617386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xQshCH8xaN5UPnSW1KLNuEBOnt44t+We6BEBpXAUps=;
        b=PXL7V+VrrkPe+jplo/yD9stfcYjPj2cAc+7Uej4lVtPGqwUCDCqsmdGl9D5bAY0XUW
         cfLEuxgqyAXynXiyyGP4p+cRJB2W9kn/1YhOu8wuP3+eUzpKlmvcbp0XOeQQKqIxzi8Z
         562uqrN7KiNZJAx0TYqPt0f+MU18JdhFgU5Baxq/gJ34DPbQ9yQYmFt/Qdmnasd4GUnL
         0CfxdZlkMoXnrrfqg14lfjP8+IiabuD5sMjqdWF190Q+Qfl+z3ti9tspzRfcqSImeJQf
         SeViWyUxi5C+ByySKnhVTxiJyJQdse3Yj56BggI76MjNFIBwYx+uGkxUx+XP5Y/TAIQa
         ISng==
X-Forwarded-Encrypted: i=1; AL+hErGoM2A3mqjVJP3jK2Ir1Del78jW73lsKsGekGhks5M6w/GtetOgjZ+ymH+5/9Rqx16Ny+61J1xEbLhvaGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tc9Lr04aF23Fx/k6MSmlaGVdNSxLzPN/qNlW8GNW1JOp+Cd9K
	3FPMqtDyvA3sef7qq6JtBW+H13lkXeA2McmupJpPUiRmnmVg5AqTJ61OjGlOTRfjUxk=
X-Gm-Gg: AYBFou3X+4KSX55fOvEjWi4CZpHeZU8AhQI6MwBTxQi7TgXuZ/iroa+gCI18RcxjIqo
	rxYaioNGYPRTmOWZt741RcfNuy8oSO2W4A34FfGp09LiGAEs+IMrAgyJ1vrHfRk5l4KTBmSUoKk
	xteCgLqc3ctqeJKajBsKG2MHqJIAVXqINtjeXlAUbHILiJ5bQrlLZLjSQDZ0lhGWpU+b2ZkCd+K
	scNGxzHmfXI+x1cHDEp4yP4Q8Uk6+FPoy4c4N998WWYUoPodRhgw/tiY9HAaBJJosezNHH1UmEN
	Cd/JhPFzPpYD9XzazqnnoHjN1Qrkq1dCcaJs9TToPNPd5Pqly29xC2nvFzVOsKSTLJwr2ZR7kGg
	t6kW8p853G97Fbq1j3+cd8DxndtbC8avPvHbyCNkNzAdUPRB49LdqsBEHrFK3WFMuVrfjEV+H4V
	DxyAfkQp1qO6eB54yTvRsngYORc2TaCRN2WYMp7+xMOSdldXf3cR/a8uDG31KZUsx7gSDNJk4rc
	7dm+Qwfg0v+X2MA16O1nOSozQh9CM7qX2UwGHMxZoKqZFI/ZoYfnrxNR3XJQS5YaO7y0nYzQywC
	Eyp+ez9MkRQRP3/FYt+UnTvnXhPw/1uUywl3/7EV6H6qtjaBZaqNHnRUzDv9J7sI80qOpZw=
X-Received: by 2002:a05:7301:690e:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36f76815707mr4993084eec.10.1794012586359;
        Fri, 06 Nov 2026 16:49:46 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm11021294eec.4.2026.11.06.16.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:49:45 -0800 (PST)
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
Subject: [PATCH net v6 4/6] amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
Date: Sat,  7 Nov 2026 00:49:33 +0000
Message-ID: <20261107004935.2627329-5-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107004935.2627329-1-omar@blockcast.net>
References: <20261107004935.2627329-1-omar@blockcast.net>
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
index c714994ef..6d5d43b48 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3331,9 +3331,9 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
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
2.43.0

