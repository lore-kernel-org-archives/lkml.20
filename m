Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603512;
	b=HuPaAtbSchJc/8mESChwStLD+WHOdDY1FXzDnAj103r8dAVLh/qNVIyVap2bdq7fCzI+
	 chgdD9q3QbvGJyV831RaazsByLi3ZLoBw/Kzp80oW51/qUMvXHPl1kUsJlkLNSxo41N8s
	 LcWVUz5pK1/fRNRuc0F5IdCZ95PZt7cwDHp0ZrinY3TpaPGdwhSbaT2EgsCQJ0tkCEvhr
	 6Cb1x3qhHzPaMOnPyK8M/IkfNt+cL/OkLLryRwbSfIH5du2MijGvs807XKiceXkWxgxqK
	 BsblauSnCAGFJy0D00uJ7lvLYHwW/FolpkS/4kfFxz/5WJ8KDC+xcUClXHmWDfyPBOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oXutaZ4BMILwaNtgFl+rxqGSEtMF1Ey4CTcPPNws+30=;
	b=sBX3Jt/FKTEV4jQXPQZkH7WoOIIzM8XkDMAqcIHaVzJvo5Gu3H08ArZ1YDYFMzKOor+L
	 z9VHIJodUtYwzUq0PrAK/cSwCmHh4DtAGLLVk94yu3IAMiPLRgw+rTwGYqIm07rFbEiQ3
	 fzBh1UPorcllZNn9DNgPC5hLXECKd3ZyTaiC8j6g2mGUpbnn9eitIhxNk7iJeCz+f7EsK
	 sJYrKzm3w0xeKvKAi6AzCqYBzCWWdRZs3mQOcK3q0Q1FiqB7viLEVmy8EymzdtInLkgsU
	 VGKDhSGmuQJdolDCloj24TlLoUR8s63W3AcNaI4j2GvzJ70YZuB2nOSG/o+B3yb3U6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ibwl4zS+;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED71B606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED71B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ibwl4zS+
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a05b210703so874159b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793603506; x=1794208306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXutaZ4BMILwaNtgFl+rxqGSEtMF1Ey4CTcPPNws+30=;
        b=Ibwl4zS+0C9odUW5UmG49+17UpcUcCKiK3yfd0AFEZE8/aTCH9ytbd1iHHybTc7scb
         /lEsd/LZdmUMfSNFm6GFPO+9sP8OugWLIrbQ/urSERbxK8Q+Yq42ns+qFDs1JpSQmmD1
         gziz75qlfR93bvOcKn2rjh+kMQkDnZ3b44WGENZh3NmxFtzH1sTTauVgkuht0VmPNzWQ
         cLo3nKT2Lb8WBMdXNPXSUc7bfZ1n68RApf2pg+foD3Rrn45OMJH7ayrKIOQ9oTmJf8wO
         57dmYImxhjzUO5ED/FZxA6ffC3ymHGRgICZes3jtfvG3OY1epJ8m5BgawOP1JFjxbBPv
         7Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603506; x=1794208306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXutaZ4BMILwaNtgFl+rxqGSEtMF1Ey4CTcPPNws+30=;
        b=H0c/K6tD7RHglcGB/Mv0n9/htWL1VO4V6F1ViGMHxXIHf7vRetnOPFuve4fSpWCmVI
         li9PDMFy0CBqTYnCUl9abnbFNxkanJPjOZqLXijuHvv5RnBwVoSJe1C5fIyHrHrMq9Xw
         IExS80dxD6/AR2JbonX9z3cy9OIThojmh2fO2PHmk4ETIrCL44tUHcpiQ/E20br+Gu2m
         ReoE2nCYTFtHhgy0M+k3V6Zcl6ZlBmkEkwoMY6D8xK+fWCcYWTh7tFopCdh5FQBX0ZNR
         EXajQwDsgSPZqm5Vz/0FBkcd1nCRJmRifsYr0Msd/uYDUwa5ux5U1sBVcpQ9zWGfD9ov
         o4Vw==
X-Forwarded-Encrypted: i=1; AKwUvByrOU/vrWvr34sNn579urRGxhQR3Xn9sZZIizM8wEjL3lznOibdjGnUn8Omqx1fCp0d/0aDj44H4VxzBjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z84PvzxKkH099saMR5K5Ba+l9kV4hw7aqPilVaCB0yCofUusJ+o
	86nARxgNHLj6I66pgE6/Es4r79X1SFNanbu43XF58ZwU3iiVOGmoAY33
X-Gm-Gg: AYBFou1BdGs7eIN90dE5VPHxA/2pmsw7MwEhOGf0JpkdQ4UZSuGvC4yaomS85CLj3RD
	YHNRqFP/+dFfpJ6uM3hgLorLOr8yM1pRZWx0BVswKC+iCjLhjuzLMzxvzO13cVlBjOwc4oik2o5
	pea4OcgZSfJqFcO0MEW9XUIvmUJvJGH+PBW/72+a1Wth9zVUc1rcSRA5aVkUzEWgYQWjmIC3AQ7
	PlfYIIRz3cXrBEYZ0MLjGQHGcMdQvwJ23oqsHEqPXFtJtDWZ6zIofoZKBzzcxfeQ79z6u+/HLoN
	jETtgNOptG3uVx+WUL3+rFCkpPu8tOvgZQ97HdYmFMFHs1tWYZrwKrOdgAFQm9ofK1NE1ntFl5e
	UMtFj329REL7x8vr/1uJvUw9qvGQKAKkXlWlemULwPwYQhivGWlKk09cxtnEsEVeT5wZMYJROvV
	vo4x6eVPaP6cG+KDq4IaQS81PVnq9cnWBe8exQV8k1xc/1vG9HWwKdloVM8R5ixACwyAJ82zqNC
	q7WAJF6V3bTHtWTWzEq+Zr7OeNzMmEtCdlwWZZNPNAAcN59bYc4XUVZ75rf/ua6B3IUBJEmpUwY
	iC9MVF+te7pqv4VADThqOQQYLlzffM31NwMmYtjUpTv5mtFfipXA
X-Received: by 2002:a05:6a00:94f4:b0:880:e4a7:b1aa with SMTP id d2e1a72fcca58-8a9bfaf8ce7mr7350735b3a.55.1793603506365;
        Sun, 01 Nov 2026 23:11:46 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8abab0c6c6esm1140566b3a.48.2026.11.01.23.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:11:46 -0800 (PST)
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
Subject: [PATCH net 2/4] net: dsa: motorcomm: Fix IPv4/IPv6 address key dispatch in flower
Date: Mon,  2 Nov 2026 15:11:14 +0800
Message-ID: <20261102071119.3435180-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102071119.3435180-1-mmyangfl@gmail.com>
References: <20261102071119.3435180-1-mmyangfl@gmail.com>
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

The IPv4 and IPv6 address keys share the same storage in struct
flow_rule, so flow_rule_match_key() reports both as present whenever
either one is. As a result, IPv4 address rule may generated bogus IPv6
address bins, and vice versa.

Dispatch on control.addr_type like other DSA drivers do.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 8835907366bf..5a4459507582 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -580,6 +580,7 @@ yt921x_acl_rule_ext_parse_flow_entries(struct yt921x_acl_rule_ext *ruleext,
 	unsigned int udfs_cnt = 0;
 	unsigned int size = 0;
 	__be16 n_proto = 0;
+	u16 addr_type = 0;
 	u8 ip_proto = 0;
 	bool use_dport;
 	bool use_sport;
@@ -603,8 +604,15 @@ yt921x_acl_rule_ext_parse_flow_entries(struct yt921x_acl_rule_ext *ruleext,
 		return -EOPNOTSUPP;
 	}
 
+	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_CONTROL)) {
+		struct flow_match_control match;
+
+		flow_rule_match_control(rule, &match);
+		addr_type = match.key->addr_type;
+	}
+
 	/* Entries */
-	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV4_ADDRS)) {
+	if (addr_type == FLOW_DISSECTOR_KEY_IPV4_ADDRS) {
 		struct flow_match_ipv4_addrs match;
 
 		flow_rule_match_ipv4_addrs(rule, &match);
@@ -630,7 +638,7 @@ yt921x_acl_rule_ext_parse_flow_entries(struct yt921x_acl_rule_ext *ruleext,
 		}
 	}
 
-	if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV6_ADDRS)) {
+	if (addr_type == FLOW_DISSECTOR_KEY_IPV6_ADDRS) {
 		struct flow_match_ipv6_addrs match;
 
 		flow_rule_match_ipv6_addrs(rule, &match);
-- 
2.53.0

