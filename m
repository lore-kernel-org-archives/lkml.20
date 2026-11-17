Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907335;
	b=F1jTp5LB9QPzfiPU/9yzYuvHxHXsfzV928zY0sPdm5mG9YIs9WkqMuBVJ69iMxqB/UlF
	 DNkuo8xZoo1TZmwcCZnp5UE5Um8v4PdOLSz1LCTArHQu2XXKip5hrIjoj8/JgdYa7oonz
	 UZPqSrCiSL2FyLtMK+3r0ua6BM0Bfl3OBZWA5k6MWO4WLz7m53nofiS3Ogip71NCwHaAj
	 QtbzFTY+wfvYfM3XTouI1ttNO0qX1NBJSoX18D6GA0WaphoSfVKUUoS/8GokjgSGxReeH
	 8fyNnfeGUo6atbuRqEw4Q7p1pH2BlLAbJ8dWVH/A39mOXJC9849Q2akN4XzyaLcDUfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yb6u44XvrqgEBzrXu63168C9irhvj3KwyZom9iAK0aI=;
	b=qFxPxAeu7PKodRRqvV8G2y4aOsHRdtKjRYc+tq1uVtpEyI6AlENfnYabbn1fff5mTDzW
	 j1Y28tPn6y3iLE8zBYM05ekkZCJdmXkJn7hfxseOHZJ1VmEH1q9a2f06SmcRG2indPkUg
	 h0fnyuSpaIFF+9A2tCNUqp9FskDeAii9EHE50D4NKFDppoMwxUSCPkBOSoHcMJ95i/nCs
	 WDs4XIoNrZ58DVse8A7qn4JH//80z7njwrs92IHFNqAB3hLeYK9vrCS7YPk/DaecrzpyM
	 oICrw0OicYjr4XaTFlyDGD70qCdHtCiH9CTIuTuIB0uJeTYyMCU781GLF20jOmNWX4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCqxw8Rf;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6B5606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6B5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCqxw8Rf
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so26350775ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794907335; x=1795512135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yb6u44XvrqgEBzrXu63168C9irhvj3KwyZom9iAK0aI=;
        b=qCqxw8RfWo7pZ9gZK2/OOFzdFnddnZWU3F8BdPnBphFDfCGs101taaaQSeD5rdBBQ+
         WWOi72ECg/Vz8lwExssQ8I9wwrpTsbL6T0W91ZIJkuauFQrs4hoIz4SyWgmLdVlbkal8
         JPn7ufWZtXBn1YHNOtUMgNIOlXm5ylVPZfMQdbBwEumwBsCZplh8v7nwu9wDmva+hitz
         eAq4JXD+CQpg4za/tmnX0MJ3lxc7MibjysE9p+OvAWmxAjbF1+ljOcVwceuV1jZ/fqS7
         zYMYn8jxxFzrNOv35JyxMfkp1u8VrVnaEUNLG5MUYMVxddjzRTexmQbypcs7K2X+MkcD
         /Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907335; x=1795512135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yb6u44XvrqgEBzrXu63168C9irhvj3KwyZom9iAK0aI=;
        b=hUgJA+hGcUnz0jsvFJ85eW0Y1Gvo0WwU8fWNNS0b4e6vQaCEBHaI39TMQBGgjCJ2nS
         dNk++2L3LvV0mJXFxbWQ7FTe6pKbfhNtxxjeC7yXIhVmWvxcz2LdqocZOO78UBH7ExsD
         wcEItl0xlHcy3z3dV7B1ngIF/Zp1ZYe57PnRYitJAgJdpFjSlZxl5L+Jm8bXUObQH2Hr
         bR7ZFmlhFwd5Oxk4wEfUXpintkF8wg7QcDXkZvhtU179ECvNc8cUlNWaXEwPTjvCgFEz
         7t2I0DFFLKtNRRG3qe7g5JbtYVBAVH/evo9Y35aQvFv4/2haqkkZHOQQ7ZcwePVHXyQt
         766w==
X-Forwarded-Encrypted: i=1; AL+hErFqvv33sFqX7LdblEU1LhgcAKGGt7QUcwWNh2d/DUny0zMVQSkt4S78ZUAvYEVo5r3Rfp3E5wvSi6wQ+xU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lZwZAxHTqGBzcMrR1VRz+qU1vUh5Wyo1MJbtvZcfBAmKgEidE
	+YuqB+qU/mPwVPYWeWmuhECkcN0Kzv4EvUAG8xZF52xafi1XeDUDXDKK
X-Gm-Gg: AZFdTZcqJQywvAiPK5Q92tIql+Xnu5cehRK3+pgywFJWG0GVt+fjhzVdKM2ONhTWSlj
	+8fKo0i0t6TRivHow5968vgYrZ80di0V93NOipWL+VBd2oDQ5jEiOvUyhBLgK2o9+Yq/2JORf9v
	3mvmPBE/iaF3YAu7M6ZRnt0szEh/tZixilK5r8le4tmJCQy4WM0zRhx/zSIN66yBZncnj2Q742r
	vCwwJQmxYrj8kuFLb1NBIVQoiE4enatLeAkCec4hjJCfAzZGKsL9sUrsVlvqONM+Y1Nqo8omXSZ
	gOT83Fy2CgUAKkloE7/r+hnh34a8FcMn7rwcTZXbjG0FPBMX2xGMCqtUkcIQRD1B5/FertzxbXb
	fLA12fynGAgunHcdAK/ljNmf9TIk9Jtp2VNwROa/aJHLI1RUy8V5L0IgFiaMjonmwrdxFkxZsa9
	nyA71Rox6oLtd+4xstdiTA0ZR0XaIXzHgCXgORSIOStNQNxBR8nPljmHkK4a6087qCS8ThM4imZ
	w1prjPYJOPGrxIP/qwFkQWts94yEjHaMo+FwIMdBiuOUjWFsesh/N7hW7bCnVH364rEB0qko20r
	YC14UrLw5QW7y4CthqbpEArB+bZyM3Mn75shxVH/cwtgE7Qx
X-Received: by 2002:a17:902:e801:b0:2ed:1ca2:ea5a with SMTP id d9443c01a7336-2ee0dca839cmr135269225ad.51.1794907334563;
        Tue, 17 Nov 2026 01:22:14 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe98cff9fsm1783345ad.33.2026.11.17.01.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:22:14 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: James Chapman <jchapman@katalix.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Chris Elston <celston@katalix.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH net] l2tp: reject short IPv6 address attributes
Date: Tue, 17 Nov 2026 18:21:57 +0900
Message-ID: <20261117092157.85513-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

L2TP_ATTR_IP6_SADDR and L2TP_ATTR_IP6_DADDR are NLA_BINARY with .len set
to sizeof(struct in6_addr), which only bounds the attribute from above.
l2tp_tunnel_sock_create() then copies a full in6_addr out of each one,
so a shorter attribute makes it read past the payload. If the attribute
is the last one in the message this picks up whatever lies behind the
skb tail (stale heap data unless init_on_alloc is set), which ends up
in the socket address and can be read back with L2TP_CMD_TUNNEL_GET.

The commands are GENL_UNS_ADMIN_PERM, so this is reachable from a user
namespace.

Require the exact length.

Fixes: f9bac8df908d ("l2tp: netlink api for l2tpv3 ipv6 unmanaged tunnels")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 net/l2tp/l2tp_netlink.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
index 89ef04c78787..a07009d4cb00 100644
--- a/net/l2tp/l2tp_netlink.c
+++ b/net/l2tp/l2tp_netlink.c
@@ -910,14 +910,8 @@ static const struct nla_policy l2tp_nl_policy[L2TP_ATTR_MAX + 1] = {
 	[L2TP_ATTR_MTU]			= { .type = NLA_U16, },
 	[L2TP_ATTR_MRU]			= { .type = NLA_U16, },
 	[L2TP_ATTR_STATS]		= { .type = NLA_NESTED, },
-	[L2TP_ATTR_IP6_SADDR] = {
-		.type = NLA_BINARY,
-		.len = sizeof(struct in6_addr),
-	},
-	[L2TP_ATTR_IP6_DADDR] = {
-		.type = NLA_BINARY,
-		.len = sizeof(struct in6_addr),
-	},
+	[L2TP_ATTR_IP6_SADDR] = NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[L2TP_ATTR_IP6_DADDR] = NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
 	[L2TP_ATTR_IFNAME] = {
 		.type = NLA_NUL_STRING,
 		.len = IFNAMSIZ - 1,
-- 
2.43.0

