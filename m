Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1BB4A99BD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887758; cv=none; b=ZNyVBGD/I55eLg3RgJA7+M+8XVtuL37wG+F7/l02hJ20yyI0lS6Yuy1pZ50hBT1oJvatiC8c53u3tXybymq+4LhewagTr5X359wsaIxO92pwIE9bmMBXRHMxdj0Pi3aClrs1prBVn38cWTlVFtzbmZdyFPM2mcl1d4TJZ86gTcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887758; c=relaxed/simple;
	bh=0XJw1AkribrZprw43sRQovMIMAVF9isNAWHN5pVcvNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9ZRLYnEDQichVAuS7uMY7uZgCInkwDP/df8vy9UUif/j9fFvcFPumpTtlMTFprQPCW0TDfwzLCosoQ//kjZI61VqTG6Q//reia6vN/PIkWeIRJWOQu+KNDxUl8JBPM/Xy0szbltGtqXU4KxDV9LCchc/HFQBIFrhdSg2lJE2PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sw+nWo3M; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sw+nWo3M"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so4677943a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790887754; x=1791492554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oksDFv5EfYGEzZP3EAnPpafltHufUup7laAhvHxqCig=;
        b=sw+nWo3M/cIrjV92bvy8Y8e35lEWm8zXZfM3ejYIOZMv4yktFafNutH9eIO1GnHnSo
         DOUORH+sk3+4nKGggTUKLYGueM3Ee/Q3pZfNdIRqaY+enYQrsL7kwW+G8vOx828jLU3j
         wADIOqbU7kJfuXh9g1UI2KD9OmfvRJTMYJl5m1Xrh0BLd0QN3n53T/DjdVIafrdzQjQf
         CeQoCh6z16Nc4J+SpRT9KXrrxo8zL5wYsC0cXc/0RtIibDUn1B0lJUC0YyhisGTeEPs4
         2M0PxV3eoUn9GHquiR3inREiqngNZqLiCz3/EgXwBwNXVKDal+6+ONrGo+mR045MDOl2
         giGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887754; x=1791492554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oksDFv5EfYGEzZP3EAnPpafltHufUup7laAhvHxqCig=;
        b=ujqw2eYzf5se9mjC9ApBscWA2mfQ2Qx9idXtjPwYpFm42CrWsgn+iTs5/hzWKY4oUt
         Q8Zr5LwFxirEtTqfaHIVfhPEBCageLT7oRJGdddfMaO6/oqtT4zdnnl2bpHTgL8wCJjj
         1PhcdyEkF23KAObsGmpckajdN7gimB+n+yUT4AVFcNEDCbyvTQlQOtgCxS074tGMyT0T
         jVuMwAB/g6oRIY1tSOWZmptvBkjnfgA8VZ7E9+/zISlgYmIO2dosFxc4YTNo8/WKJhGE
         57Of7MwB20dSOqwTEVp+uZqtIPLp18g1VuD1zlWog4Cb6n4aOZIYGOaQ3lDr8ERx7Fjs
         vSxg==
X-Forwarded-Encrypted: i=1; AKwUvBwF4FoWcAgpP7Ei3K6VGBBEiV6SYZ5VZOK1u+K+OJHPMadLW3bG49XVZlIkVuQpb9LcDl0jkTrgvgaUk0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqxB85ZurAU/vVID75Qm70uk3DM466NRzlEusD81PiIBZpVe8b
	usWM0Nx+rrwICaz5pfFlocBLw9Dlzu2KcwngtXjB2sRdOwVOBXbZM0kc
X-Gm-Gg: AYBFou15nkbFER3S/Xf9h2R+mfxxQ+C0sG1fP4E2LRfbAgKP0osRzJifrPPokp6eWFq
	Voshm24H1AQ4yW+9p3x3jf2OjxEhKkuzR6ksi7kJcGUhqOZK9NUIl9swYRuA7Fqa5bL9yIkxKAu
	2uiZnez5K/GJjHls4BYyA6sBwyn9/mAAP9rf295xmLi5rzyS/j2H6TtBcpg9UtWos/9GZmpSTFs
	TYujoo48n2XRQs5HJ8xjXW9h9V93TYvMbwIoAdfxJHh4iZ/BSvqk8W5zpqExC90gI95aFLMGpvC
	aDuzk/4Imo7Z4/AyBcMPG4cokqIIVpRzDz6DQFAvM3MKH22cxJpEMHuoubCOAif7X0awVQ7jJy2
	ADg2qyu85MLLb8Jw69+7jxuJLEmIJ751H9GTRFJ7khJTlJeDK3DjxIg1RtbyIyDNfSjrT65eVPY
	EgPXSKl9MZlPVrbLGo9vpRrNc/LWzq0diNQKBibGKH3U9C2rjX5Ia/sM9I0z8TI/BRQB1BPkHLM
	KwCHFaqqe6gmGmg3bzh2ueMnQ==
X-Received: by 2002:a17:90b:1642:b0:3a4:a1f1:fea4 with SMTP id 98e67ed59e1d1-3a6ce761d36mr625284a91.26.1790887753935;
        Thu, 01 Oct 2026 13:49:13 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661e:3050::4d0:26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e9c6sm5658797a91.14.2026.10.01.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:49:12 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 3/5] net: dsa: motorcomm: Use NSEC_PER_SEC
Date: Fri,  2 Oct 2026 04:48:46 +0800
Message-ID: <20261001204851.2576101-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001204851.2576101-1-mmyangfl@gmail.com>
References: <20261001204851.2576101-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of magic numbers.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 84abc2ef8b61..0e5f19a39d0c 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -25,14 +25,14 @@ static u32 rate2token(u64 rate, unsigned int slot_ns, int unit, int C)
 {
 	int e = 2 * unit + C + YT921X_TOKEN_RATE_C;
 
-	return div_u64(ldexpu64(slot_ns * rate, -e), 1000000000);
+	return div_u64(ldexpu64(slot_ns * rate, -e), NSEC_PER_SEC);
 }
 
 static u64 token2rate(u32 token, unsigned int slot_ns, int unit, int C)
 {
 	int e = 2 * unit + C + YT921X_TOKEN_RATE_C;
 
-	return div_u64(ldexpu64(mul_u32_u32(1000000000, token), e), slot_ns);
+	return div_u64(ldexpu64(mul_u32_u32(NSEC_PER_SEC, token), e), slot_ns);
 }
 
 /* burst = 2^C * token * 4^unit */
@@ -83,7 +83,7 @@ yt921x_marker_tfm(struct yt921x_marker *marker, u64 rate, u64 burst,
 	}
 
 	/* Check for matching burst */
-	burst_est = div_u64(slot_ns * rate, 1000000000);
+	burst_est = div_u64(slot_ns * rate, NSEC_PER_SEC);
 	burst_sug = burst_est;
 	if (flags & YT921X_MARKER_PKT_MODE)
 		burst_sug++;
-- 
2.53.0

