Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699766;
	b=TT+UB+vwSr++ES5V2kQnaMcOnJ8RNPWhFjwB8YSlZEzUW1ghr1RuJpocF+fF2UhjRYeB
	 AD8nEoCN/w7eF/Ao3L+UiaVCW9NBgWLwcarn04erenoUyKFn3HIMc+TNlDFoVjo6sevi0
	 CLBqqvvrSk+jNGZm/8ZPHjJlKMd5yTx9TvdiC41zRHIVBOB1gtdXSbYYnhcvPvca3Q3+D
	 qAQPp2mawrXRbEjGKaGZ4VY4IogevWJWGdD5iN7JrhbBg6tC8jyP38iMqFnpoD02YX2WO
	 gZjk0jrgDEy/6rEpgMreIAt99AgIaBdmS2HCW2iXSSh3S8LOzPeXyBwC0u2w6jc93+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mb/1g8nYCeIwcAw01UT60I+xXfiBOSX5Y/kTWaVFrFY=;
	b=SoPpsMwRlkEphRMFbxZDUKeUe13MTlmNPXdhlzbHfSWTXW9RlxW2AM4Qo4gt/yVom1w4
	 KpukbZ4bsHypO3jmu9P0CKrsEWGffU6UJC7Mi3r2rYm425GTzBlCOKExYtH8A32U+6l4N
	 smPaWKeiy52S7oI70bM5DDn4jyEupusdbFBWG6Buh1v189b/etcwTFM7rwSt4qeFa17Mx
	 hxg9M3fHBVU/WpGPKCsmqD7j0WrBvPH53KW0V6QmeuIsW7kMnuFOs41IvNFa9JFWr3v0K
	 I78kQDnISUUCzG+38MJbZFFSjqonpwUn9hh2T7De6Z6cbxlUa4xl5kp2yrozjgwtC5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aSKb9a/W";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429ED608360F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429ED608360F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aSKb9a/W
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2471325a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699764; x=1794304564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb/1g8nYCeIwcAw01UT60I+xXfiBOSX5Y/kTWaVFrFY=;
        b=aSKb9a/WJPBri2q8rqFRKhTx7aTwzfBsALEEC+mT6NqNF62bBHjSVGQCrsMWAgg5t3
         pQhEObgiXwcpkII+A9hoS1+Jqa4ApCyoz4F1N7VBK77DDIgaTtmFqIiYrgz+d7saa3Yf
         L2czhVqNSe2lMRPTqLwk2c4ljXBtw9TOlYCnZ2UPWOA92vv2pRrJjrlCNU0BT0uYhXVj
         kPDz1ckmmm6hNzz5MRt4zaoS+76bt14u4BXdMd5k5Dxd2pfgpySUqkogLvbs86aaXYXs
         35gFgoe656uPWwaRIXZ+76D4pVOuC0tG3CXEllCOCzhufU38ybktYNcI2zuQIKxzEEek
         o9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699764; x=1794304564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb/1g8nYCeIwcAw01UT60I+xXfiBOSX5Y/kTWaVFrFY=;
        b=SLrS/ZbQsfYEWEHDC9dnfUiC3LbFiqnOxio/hTELgfdb107QAQF+V65jYhCNEMb1K0
         /0yOmSt5bgn+mn/FnPOLryB7KYlMPd6waVqZQtAtwbyAxUbzpOJtY/e/8oxKIrnaF+CG
         XPaSDf9V0yXplYAiwDchtcjanohoAnoS/VEMVUYgPWvI3B7yM0iSHgLJrHXJu/oInTQ6
         j8ATFanzkt5zFvKese/ul3leGWYu2uFSH1A4CdlvwEUv11/rC5C6mUhO7vWxTTNVGZGg
         ZuBsUSoED8p9TIv3206/90kx4gr2udOL2ei4hwBBwgRMyM4dzt0kz1kMOGHPTlbjGRu5
         unHw==
X-Forwarded-Encrypted: i=1; AKwUvBwnxkp05IjEHcJXpUJvnsBzjoPQuGnICuZAG/+2Zc7bPdPH1QI31vvpAiggvV2Fz0yN7xL8qa7qYIJuSGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/K7fZMYHo1FkFBXWDT1E9o/q/0wrAPUHBCRtD3l+UXXUK9N99
	hCC0W8eHObAf6ivYRyjBgYthjYS+KzTLXwllkgZTHManuuA2SceC85kq
X-Gm-Gg: AYBFou3ymOazRytrJvDKD6KDHrA/qjOIjFVqgYJjjbHYI/EW/t2bt0WWjCA7wdSJIa6
	PUyFvRLIOcBMfgTSXM8DX3iiNKOtSbx3dnshocsHoDc4UbztaBqnfqF5HQsJgRAtFWP/No02Y1B
	SeJCyB5aK1D8H6W9ZNvdQ63XieS5z9fa830nFk9eGxOofSpvm27lMoGUk9/vTTNefKH8QBpDOG0
	xjEKUUmFTRPciQViCyFismrb170Au9jCABOZzuqAZnUtkDc4w4WcUkUfwiQ02W9PjAqnZ9UrtSB
	TojUKECCji9MPyct5z+j1xtXs9LsMHgxNFgghtvHygMrZkX+cIzlTfvl2vto2R9/WiEJOAJOVsy
	6fvW1cNFnrglqI79VRs3yyDMmgteLMF2SXZA7hKz/MzuiwkKGhLGSOtzyZUR2sKA3PR1/miKhbI
	HnFhpkkH4Qiro5Y9qdLlYgpa67EGQerILqInYBUTzMLkNoY5MJidSJ8Qrm4zj1SyvH4xTIMFYl/
	V2LzFCqm5kuiuOI578qNXp+ovZbKyMBl9njvMKpzRk+8iRhlG7wyGypwcQjms89Sb6t6NG0W4qJ
	eKz5h5uKUzNdtNYUW663paadowhZV1zjtcGW4V0p5hxwr043rlrl
X-Received: by 2002:a17:90b:46:b0:3ac:80dc:f41d with SMTP id 98e67ed59e1d1-3ae897497f0mr9660248a91.32.1793699764521;
        Tue, 03 Nov 2026 01:56:04 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm3488954a91.11.2026.11.03.01.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:56:04 -0800 (PST)
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
Subject: [PATCH net v2 1/3] net: dsa: motorcomm: Fix extack message on unsupported TC actions
Date: Tue,  3 Nov 2026 17:55:08 +0800
Message-ID: <20261103095514.338700-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103095514.338700-1-mmyangfl@gmail.com>
References: <20261103095514.338700-1-mmyangfl@gmail.com>
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

No extack reasons were given to unsupported TC actions. Fix it.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 9dbd61e48fee..8835907366bf 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
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

