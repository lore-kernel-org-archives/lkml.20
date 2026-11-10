Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307791;
	b=aYA3nubl6Ev53yB3m8rowmjD8OgCONszdbe1HDIzvj9cN36QgDIwFXYjapgsqGq1wWph
	 Qnk2Se+HH0X3iSsGyhgS6lKrJm9uo8ygLK2GB3VuprYQ7VhL+Bw7n2cECW9DqtEdEP7YD
	 FoZh5+bkkuz0vdp0EAJittozBFVTlbu0tWKRjGPonGfEIEFfGXen3Rkd15mksUrDnz21f
	 Xwn/e1oc5Xrrze4QZcYERvESJxBCWZvabXxnanEOdEk3O4msN7Zz+LYCTsxpJPlqLQrnh
	 BZqGic/uRM4imdGvgj0K5FnZ9Vy6FCdHqFZZMSt9BXGA0wYMkSXCAQqVPhPNak4oj/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jHE3vz7ikpP7qewD4PpZ2JFR+MDb2MgvZURmQJe0rMo=;
	b=BTl8Dp6EXLe6TY2Txz2DTQTcMsZHGOFBhAFTR+umoXAeggCOhcsHUmRt80Tn2FQoYTwJ
	 yezYSapQYobc0ihchz4LPYVlPj7Qys97Q1fBJSH6UUFOjsEZupAMFLo4/+ijlvuA4li9G
	 qlUwH3u6wBqmUYnaDNvBou7+pRVAs0akLwmfcFnGzwG6ELQpFYzMbP60wxt89Pqjw/3ew
	 E757QryI7+lBLnimxydSvlV9dlQeAY4Qfsf1zDaVaxNrhrCo1GGM1MtwKmy1Uq1kDAeWL
	 MxQ3Xy9NwtZf434ts1Tvb6zktKW7OTcG6GNkUSOSGVUhHV5hyQuruC90J8Kj/7HjwUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhlDgiwE;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04527606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04527606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhlDgiwE
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso11822365ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307790; x=1794912590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHE3vz7ikpP7qewD4PpZ2JFR+MDb2MgvZURmQJe0rMo=;
        b=lhlDgiwE/QiGvBotsWQX/Irm4b/bTqrcqi+0qNxELwtCdEEX3UatmO9IxoGh+MWohO
         NeSOmrYkfv11ataMI4qUwkQdcb7AO/2kAa/NNAaHN5mQD5yjHbV2+uqTR4uG/X0FovLb
         30Nn9EY0fSOyblr08dSe7RmUan6wuwixOHZB8Qd05CDUsOLyJzbEomHhf+FaQt2sS7UA
         JdL5+PAIAQdKPfNBJ8IPWs67a8cv1Ar3wD8Ylq//zGzUD6q5/eSCfsbLtTz00RYm7oI3
         4YP8JKVrcNVy6V/Wy/XoRC85XQVORC10sCpULD1BCX6dZfXQ5nI2Za3n2ez2ppGd7xy8
         sMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307790; x=1794912590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHE3vz7ikpP7qewD4PpZ2JFR+MDb2MgvZURmQJe0rMo=;
        b=Cef2QiMozYZLgOQALR6fEaYPpSDgiFQ9NV2qkG0k+VWiCAYT1pD9bjMme9nJX7qayC
         cPfXHLW+q90+25T9zMt6aKpjHZPGuUVW93yEHZursOCtQOCuPaa7MApZUe8TTfrD81lN
         huXr+oQbtcOcEzxX+pG6ePwStbz7aI2VSJKSxD41fIwPFCPeyayGUVo/sNVKtGZN0WEJ
         SVZ6Sv6D7rdNyqGoPJ+Iw5hSmC/wMJgXKiIv9Xt9WAKaIvatzASJh7dtnFsNFA6skMZ6
         vWF7jNZLoanfw968MbqBBfUl/cVJyBH1/iNmfd5hHLX0BBtcN+sBV3gSNXW7DCNjYAwi
         v37A==
X-Forwarded-Encrypted: i=1; AL+hErHbPTK9pMMO8dZkgEkYderD+Owpq/CqzbnhMEJ3Xx4aECkya+h0v2c8sz74TVJAlt1Q4rF8RKpwpleRvqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z930nMtUwrTWlhVGSBdsWju6A9K/ztunjDV0Ud1rVpr/EfDAFEL
	lvq8DJdRgZVCbqGw511TIHqdrRcZHoc5wyFu1lsqIw1mhSsSgxwqLUJD
X-Gm-Gg: AYBFou29/aBynBhWMVBQe5tO3jB2VO4YxsvOk+nEuB86fNJvtDyvYWGv+E9uj4Kq8tD
	mcrlh4Ma7mzW3SwVAZlx8fWgc2m50/rx3IjPV5aYO9g4/BfGEtTjQoOnsiAi/9cbsJ+lVGty/au
	M7Pd3aMUwyZk9ZLUA8CrD8pcGgsWrh3KaMBNsohpsX0ZLvsQfjdg1wkKcbc/5lJdUu62Yj5l8+K
	YIdqsLi9vK0+MbOMADmvpPgalrpoIPsXQmJ7jdZbTphtZ5/N42cgD4mHw0EPBm4rMK89K0uZGGq
	DHtN8v+Seo83GURXb6Qo9v02ux5yRb0z841TfQXFqg/j7A8JU8Ft9Ad0LhrPFt1i5ZHS4M7MlrX
	MT4K3MOTOG8LbfSCPl3WthAYw3Y8C2doOGcAmaC9DTt+Ej4BHznv6EZiGkxr9nO3e0QARBu1UuT
	Z2L0hpe1JVMwjnJDRNZXpR4ZaO3HqZJiEULnvFfw8OqcRP7rkNiHOWIgDUzdms8YPRBArCqnpFQ
	+8AslocyveNN9hLievIZtoqv9bxiWUabVbrhGPK+CH5FLolM0wjUTI0VPO95LK8lLSZ9uadmlyW
	7F72lOlavO8+D+BxcRWgQhW4NMi/mzPKT2r6vKQ9XgpF9lnJx8gHfHR2
X-Received: by 2002:a17:902:fc8f:b0:2ed:948:b68 with SMTP id d9443c01a7336-2edb90b2eebmr20574655ad.9.1794307790115;
        Tue, 10 Nov 2026 02:49:50 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6214:1250::1d3:d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d906e4sm7337815ad.40.2026.11.10.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:49:49 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 1/3] net: dsa: motorcomm: Fix extack message on unsupported TC actions
Date: Tue, 10 Nov 2026 18:48:53 +0800
Message-ID: <20261110104930.223598-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110104930.223598-1-mmyangfl@gmail.com>
References: <20261110104930.223598-1-mmyangfl@gmail.com>
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

No extack reasons were given to unsupported TC actions. Set a reason on
the default path before falling back, and drop the now-redundant
initializer of `reason`, so the compiler warns on any future path that
uses it without assigning one.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 9dbd61e48fee..90b017a11a1b 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1034,8 +1034,8 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 	const struct flow_action_entry *act;
 	u32 *action = ruleext->r.action;
 	bool seen_priority = false;
-	const char *reason = NULL;
 	bool seen_police = false;
+	const char *reason;
 	unsigned int i;
 	int res;
 
@@ -1122,6 +1122,7 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			break;
 		}
 		default:
+			reason = "Unsupported by HW";
 fallback:
 			if (cls->common.skip_sw) {
 				NL_SET_ERR_MSG_FMT_MOD(extack,
-- 
2.53.0

