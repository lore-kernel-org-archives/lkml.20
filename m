Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455965;
	b=JzxyA8bqSDW2xgfDZK/sXTtVe1oTwTIOLKe2avFDWOmjSXz8dMY7GAQhMD2wVulTdbfV
	 Id8fTHQIxfmQ3FNbA9Ia2gMLQ1Cy5LK4ZTHJOMRDRc9Zzg5/TNJPu7BwoQ97G3H12P6Qr
	 yhX8nfbRty3H9kVJo4SOUp1/qEL+jpYvaZ890l6lzXCRi3Ls9K1t3xYqNNYXny3YXPMLB
	 R+FAnX2wgi4mbKpBqsXGQtXEaiozZ6Iv9Wi481dr4RxCwY2Q+wnMXix3rmE27f2yYDI27
	 8O8q7kX51nerhCnZ98tUnPIQe4cc1Y3SEv5x3XwG6Denn9abAvgg3Mwyzs+kJ4iquxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a5q3lkHcSL+HrNegIAKI6k5+0KqgQFhtqH1AxUHFIJM=;
	b=b2VYZtAdQgQjsEVgejiGLvfR8avOO9gdQCfuSTlmWHQ6pMciHlX+q82gvtPir+sp1ct7
	 lWT6K2RRSugAuiypYQpoI1tRtIOkttyjgLxoHk2em0PgKZi9Dck7A20rvhvzKcQY1UI/I
	 FUSaYItntPnUNAnyVaiNJrmfc4s6f7d5rVNPk0IoKAapIkMSy3EjuCRN9VdHtgM3DVCez
	 c6QdhwSQrsJqSG2cjZ8ATaY8iVNKdmK7xbHYAlNepVFIRNIhAtCimnXmMUeoniy+HYNSP
	 lDwkYui/TUYtC0qeL42i0d8Gy7zWNVvWhZfgGJChsF4RzjkKfKI4v1jmZEGObwS/wXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=KO1GSmGP;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B2606A338
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F21B2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=KO1GSmGP
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so4615927eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792455964; x=1793060764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5q3lkHcSL+HrNegIAKI6k5+0KqgQFhtqH1AxUHFIJM=;
        b=KO1GSmGPVO/Khh+Zk4RgGmkxvoqvUXRT/JWUf0FnmLdh8y4GAF1lLpwfjFFOb+rdFZ
         f3Ypf3hejXtFM/hAEuUNo3fXtZtbQEEfn2wDPFWr6YgdJRwh8tkFXzqJDKqD8iUl/k45
         lkg/HnfnW4DOoeiu192dIzxPVoGSFxRWGZ0uSmKQxjuAakgM0xrucQyiUNCcpPLDiWdS
         nXzqIRSJefNRF0kIPEDS57wt4ZEUMwpTUIdtdchhXDrVcVusmjJCsK2zqbNJfnN8b6oW
         mjamY6bHej2o5OnZTx5qtXBblbjyh8HSrEMm2C+fy0TopRuMJfArp6COVOhvUR9hTNSv
         +/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455964; x=1793060764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5q3lkHcSL+HrNegIAKI6k5+0KqgQFhtqH1AxUHFIJM=;
        b=hFjQ3VS7Xt2lveKRG9cRbkfGVKp0PYEesG602h+fCPK25fcWj2BDwxaoFjwz1EdYtZ
         YU9GpH99KwB+xyjCdR6QnFWFIuAOkwc8vJMsULQ3iuWMrjKbZCQ4TBmDdVe9pE2geyiV
         JAvJJyf8F7SUREiNjP5+02jt3dfc75HGItD96valpu/OAHEL0NycUyz8dP003YGWd6Ho
         Xf1ZJw1e10HoY+od/qUIdhkPf+1D2MNwRFn4l13bfpYLWBiz+94iQ0X0P1fMU81l6w4n
         zu1eCcuKWHe5YJJIBHEagyKzf3QwFuyf0WvSJdSutAmS8OF5GDcIIURBqumvu1eRh+FU
         SgYg==
X-Forwarded-Encrypted: i=1; AKwUvBzDaK/kPUrl4GVDeFiOHaONULXzZPl+BS3521EhIHCPhgti7kX5H3Vm9XfUn3qzBBUkWy4CtpFBAxCQ8rw=@vger.kernel.org
X-Gm-Message-State: AFq9FYILXxGrki1O5lpcellSS3V2xuX7GTJuywrONqS+bTUKa7wfW/c4
	OCf96rjFoUImx4B0H1DjLlGqilF5hB4ABXgYdTd+jGanaF9AH7qaJoAJfCCEj/aPcec=
X-Gm-Gg: AYBFou12L22ye4rjtrGqxK9T0auGaFcFK0T659bZLZBTBNeLrTC/uHcBS4nZm+Rn2J8
	Hq2GprZbo0PR+HpIOFu29RymV0zEz7dNS/C+XHM/nTcyKG5m0aFFi8QvHIkjAeQeFmuyC0VzzXP
	dsiKJbleKCCK8fBl9jpTRI4hvR3GrDGGbUTp3Vi8kapg7XrMXuhdbq4lZywCa7+uW9FsvKYcAMb
	HqfLzZceOuv7ObFw98ff8r0oj4mQ0gm66OfjUgnSsBNMsHFpWV03ozUw7QY3wL6lvl9mCvi+7fG
	Ekh9No3aID4MhyOLTOnR9qQdvwS7nqW11Xc6FYk5AB95q5Cv+K9nQCfgAHjgPHVNnUDSVcbk9jz
	PrK7kSSZEN9sSMefurkJp+xeYdoJSHCL+CuRG+9OTsR6Zos+wIUtY4swh17b6kDeovAQG2FTpso
	SqHfTKVpPPqZIAZR/9CMdfKzdskzPeu1QM9GQTCc7umSRP4WLYCLSWIMuEIjWzr1g/mhwi4mAjW
	W5gYK+zTMzKz6JbAXDArPlQcvOxqiIFC0S6k2u7jA0UiNDikLQlS+4KJ6z6wz2TC0qIq5QPyks=
X-Received: by 2002:a05:7301:424a:b0:35b:a6b8:482b with SMTP id 5a478bee46e88-361a1f50600mr12221732eec.14.1792455964090;
        Mon, 19 Oct 2026 17:26:04 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44748072eec.20.2026.10.19.17.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:26:03 -0700 (PDT)
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
Subject: [PATCH net v4 3/5] amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
Date: Tue, 20 Oct 2026 00:25:55 +0000
Message-ID: <20261020002557.3984927-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020002557.3984927-1-omar@blockcast.net>
References: <20261020002557.3984927-1-omar@blockcast.net>
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

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM
---
 drivers/net/amt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Signed-off-by: Omar Ramadan <omar@blockcast.net>
diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index c19e67a..960a08d 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3298,9 +3298,9 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
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
 
