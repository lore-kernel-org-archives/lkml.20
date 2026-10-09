Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C13ACA77
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565131; cv=none; b=sL1DNH8rn19b6ihBZep7Pxfojq5T2O+Fww59Q9kWN9eM9756FdlEnVty7CZw+F8iMdJyAmpkfFTTAj3K5tb38qguw24X1jgmvuMQdhVhvlznivuEtxkvj1HC+tdiUH8eC9uOaaZLDTpY+gB5Qk8xQfabRVaAP05j0EG02pxKVpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565131; c=relaxed/simple;
	bh=s+pgwaIhoAKB5TYzttX7X+vT+586hf5yM3Ll9Pqk8KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFgJ3VdxxS2MTQ4pOBKH+GFCOdKEPc3mN1jhQnMs0KRua9oKkLFTYOiRiX5qt2eLN6DWkON/ECsn+/YTwUZcLNQUDQp5+zBPDsCD3m//8R+nQElyNg3o6gLLykOtOrdg0dRMi90iEaadU2uIxLKws87rj8tDMKL2cSx7Jc23NiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRm2clI3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRm2clI3"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso2841079a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565129; x=1792169929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQ7BCPJPZs0rbKUt5hEFk4a7TJVk9czU/DoC2Om2fvM=;
        b=jRm2clI3raqPk93iFnziHKzfOzkaKmPRezDJPHIcj13z3PkRvXruZArJz6Xyv+nUuv
         Fo7tb7Amy8lmPKZAtHybhu12xWylmvVn0gGYC2rIlfnP1RRYnhKaB0YurHXTw0n0JYgr
         K89VW3T7cTOlvCDD2VALusWnrqmbrv3wy4XzmGR+LmsNRei8n8eu//gIJwtscJ6KYJQX
         dZnU7FvJNX+6Yq2B73/+RV1H6yVmvZtdRSx+eAAMjMmU2P8YD8vV0qkJXOTJUQnhnsGc
         Db+J/4NXjnRLLrJCDNh+UNMNNPBksHrkDTKQcSt3/QIsRZdQAxBfP1Ne8M7e4o7a3V1Z
         lq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565129; x=1792169929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQ7BCPJPZs0rbKUt5hEFk4a7TJVk9czU/DoC2Om2fvM=;
        b=cgpdBgXEQrdS7ELjP1tEfwPS6GWalU5+p2nBmlQgHe08HMutsoiVKUJ5vGFd9Wx/jk
         wbjJ8llh00mB6z+5EkUgd8QTKUGwa2YjAkt7GW6B1GVtnumrXzi3rGbwb13Lx0DjWdCO
         MxxTpbtoW4dkrClI6nxil7rriO93xzRlhuq5y/1+1CQ3lpnCXDEpPNVvNoHCJkazmJbQ
         jpAsAPJJxJx8EC+2PR1zo1td4Bp6GQYDYT5W4VD/lXflCDojJRtOsnirIV4pAwPS2JiT
         HqOc9r4vqHz66UAXN2GrPmTvt4hQo342QwVT0yQRiO2UzlI2mteKUhppwDkywzNyI9tw
         IuNw==
X-Forwarded-Encrypted: i=1; AKwUvBz4grbMzHBzP4emnk3XwzxolkbhYtJMon99YqVRY8tyrAV0bGmP8b8LQl7GT4dKB+O6C0OE7dZwh29pnz4=@vger.kernel.org
X-Gm-Message-State: AFuF++nInJd3AqxKNWYvtuxCHMFoONufxKl1TB0JrELmg/4UbwcCsR3r
	TA66klEFfZbjg0arFWJemnJDdZMyV6a5QytKv7qM41mx4f+wXgjV8U+1
X-Gm-Gg: AYBFou3YYXvVdbOprZc7da2Omc9NT65aReuTiXwZAr0n26+83R32e1p2ith5KPEm8er
	A5k9Zw/8i4V2OdJZy1tJgNkFn201rQJba5Ipa4jx7OVqqD2xi4TmgoWHEgOhB4MJMbJUQ3A+OJ3
	iQH+oCGjkSH465S0/EHjRuD/sWMcc4TsCTybdQ9x5d9/JerrBbxznJerl7exwD7gdTQ/dEhWj/G
	pA7q70JfxB2AnUV4QMdNeYHsMNinA09yTewIftGaWEaxMfs1l+meDmHRK7Y7KwKEi/329N2LOMf
	HoakaY4/xkRkGjdz41YlnhmJJnM3jwKv3BkPcTeZPkFDk82BPFVtZv/ZhwUVGqq1dBrekIHYHbB
	VBztQVi/Mh3O/5iPUh9eay1S41Jw81FV929pTOlpVpGuvC73mDdzlYTnrKRZI0Mmx6NyAVLwLot
	7gotn7rMbcyBzsIzQ5T43xmR+BQfi3l0VYPxhuc2K2gPoetntmT2K36bXJDMJrm8Llxn3jJzgJl
	s/l7Q/6vw7gIHUoaLjq/JhxqQ==
X-Received: by 2002:a05:6a20:2451:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e16bf36b7amr2257934637.71.1791565129145;
        Fri, 09 Oct 2026 09:58:49 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37de994sm1494437b3a.26.2026.10.09.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:58:48 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/4] net: dsa: motorcomm: Use NSEC_PER_SEC
Date: Sat, 10 Oct 2026 00:58:20 +0800
Message-ID: <20261009165825.359259-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009165825.359259-1-mmyangfl@gmail.com>
References: <20261009165825.359259-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of magic numbers.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/tc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 433a428ed070..be3321df8868 100644
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

