Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344750;
	b=42P4J9hJqxL4WpCDkyIC6LPma93X8TmOPrzhhFj7ZQna9deLQYwYZO9LtxhHtL7pu9tg
	 3orYfHVdCE7IBmEVzIGm7EB66wnTERZ8YeN4HRm57rNOoM8GkDQCluZ2UCbIYAkIG9Aoj
	 YUxXbKs32wCX3Kt84AN9FgjgdaD8tUTVY94pncGpIPPhbK4szpPcOwu4SwOmt0MVDVjI0
	 mUThdzl3i223hVfU8JmZWwBU57zms4NJFUI4sAAXRRTUbEL83g/z4xqhAZIKNp5A2d3Cu
	 B0LrYSkPcKk4tF/PiGyCBkpSb61zjhkiMsF14zN5xQzX1dZ9JmeVjU+1DjhFH3WOlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SwDFBgR9w23+8ieHzLTaA/3ovrrRYj8PAKqMDU75z7s=;
	b=5WtN1sujXwZMxb9XPLS+5l8J+3WGiymmK703QiF1oE9qwtvX/O1siCKZmPzGEpkvYMZi
	 HuglMSx1/KoTc2da92BjKCctzakNk1bFDeIph4QW/L3bNErKlVPU8oYDaSMNXNDLh7vQY
	 WAQpSuexRJj/d1xcyvoAXKvGTVjSr81G7EgwN1DJK3KRBLh80SWKG9k8DzscLvpqqV4Of
	 kOpUOFeqRbcDfO44mj0CroU0O5rhE+p3/sVTvblH+OEz5Ij9ymJevbDHiJloNpurAPv+N
	 zrV5ts99gcLpUVDNQ1liPIMy9wb6Q2olmWTsm144/RpFCR5wUteZa7zm8HQ4qQUPjWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=D1tAHKC0;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4460A3813
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC4460A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=D1tAHKC0
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so4116018eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344750; x=1794949550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwDFBgR9w23+8ieHzLTaA/3ovrrRYj8PAKqMDU75z7s=;
        b=D1tAHKC0IcpfnRlj4facq07tJjrhPLEI/8rjFvl1KzNFp3NFZzD7+WePtJUnYgNZSO
         TOvSs9VZK+UmO+bjlMUvF0c0rekZopBBqqUcLY3QB4aKelc1LL+3MmqMCBGejq29ojkY
         sgBHsy2qUnBbAwVIgIAdfv5C2sVtEgsbTbRjPk6WrI3fXxzxiT94dRkyxoHVHXxW0eF8
         S+RAQ5OUwvyZDDUzgsTR3poDerIz3JKIEyOgQRA1ac4x5SKiUvOCHVCUERiC5EtbCdQd
         i0B6I8JUHzjcYw9nguEPeP5sdj6elAoHX52F1194oYL8hR+i1S6q4AszYQbzxyh7dUV4
         o5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344750; x=1794949550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwDFBgR9w23+8ieHzLTaA/3ovrrRYj8PAKqMDU75z7s=;
        b=hpR9Ex02LDU4IJOuRf1oxoKg22r2r8xvwxp6ztJjoemGisIWYiwT73fYjEFlIsIkij
         N2Bpl5blubRiwlIRcBRnpFNu2fvWMO0pOPypqti/ADceiaE+sXfy2eGBlFCb7RZfVggz
         flu+TWCBvOdvZa/7C4y7wrPkdo63UVsFKexBCeTJDuXGkJI/nkefIz+KI80e9/0nUiHp
         MN1ZGNIplile5j+cpu0NHyGGe3eSFlT8wduLAdBMx/4AE+B+M1rMB/BbQ7wr0HUGXCdU
         fCdIyi4lX0DPXz4juqO1SEo6qAfzS6gms55L85/rSAnSqgSml0LV6+9aezQTpoLAjIEy
         xGtA==
X-Forwarded-Encrypted: i=1; AL+hErEcPo7z6+ujkJ3t7TACRRKkFmgEMrY3CxmHokJhlu4AgQcbRePBk7aUUFKMoe3vkqjbM0BHALCqV4/rI1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fzofhA6KCXulXfggfyfde8JLnI8fpLLWPtnQZw99ASGORXEiq
	KOCmrD3ZW0esLwWzVCmE4+nQ2/Hs76q2u1Fed6nyEWksHRDlHNta1x1+Ox9itCiFX1KQ5VXGNAh
	HlVDy2a3L68FW4oU=
X-Gm-Gg: AYBFou3w5WA2AxtSCoKLyNmYtGLLycPm8qLnuP0yOQt0l+2DNW6QfLXU7KePTqHPWEA
	3wtitQH74OxeNq3pNm2WjSOqjfhZgNpKA9LUlTa/07+qmPlrc3MeiwecXzCtQN4L5lMw9BDiN2z
	6WyUmWBEArwYj9HvcjXttjNu8hJ0CcGKp1Ii3oiT/BJhGl4ZAwPvR4XwS9xsIdCjgp2cO7KsGxQ
	K0GBhr1mk6LxQyVFZaQnomH7RyDtV3pIBH9KFejHQQmL6xbOqWQu0yC6/oT21/Zd81Mhx4jlwJW
	Sqksstj/VkR5GbL6TkfLcfCarjVgVA0tSaom7lJ3Ddecjl9GG1QOS0BBQtO2UjHC0LvmhTF6nhj
	OFxMWwPTpXk2t/m7ofbEs2S1xYa/dUFIcC12kd1uhrEPo8I0FiGYwmA9xH7cmNcx1Q+NYAwc0UX
	OfHL3hLJUmBUYJlk4n5YWeiM6exv3GOV7sGKfHcQSYDtcwUGJ3ilrswq9E2TKHVNVCwU+NQsWiw
	GucIXySMfbUjXA8TdJQ5M1X/p0T7lScjZgB9Lm4r5fv58fMuwaKJBIireUMf/ZpMOpQ/FH0YyA9
	MyDmc9YLPjSlKPyClDUl8reLyWlzMBBZY4z/J7YoJUszXNATTRrR7+mIPswAWf0taOp+miY=
X-Received: by 2002:a05:7301:5f01:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-37685a89f74mr970768eec.8.1794344749231;
        Tue, 10 Nov 2026 13:05:49 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm10464097eec.17.2026.11.10.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:48 -0800 (PST)
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
	linux-rt-devel@lists.linux.dev,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net v7 4/6] amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
Date: Tue, 10 Nov 2026 21:05:35 +0000
Message-ID: <20261110210538.217936-5-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110210538.217936-1-omar@blockcast.net>
References: <20261110210538.217936-1-omar@blockcast.net>
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
index 9f59ec6c4..99cce0a14 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3359,9 +3359,9 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
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

