Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222601;
	b=qoZ5RS0F7Tx/5yqtDdxxnMszU/ql9RicpJTjFIOnpxnhLVOi6ZdZyLGFMZXtDfg7tOLC
	 VNMN3wZPWjgaJlfB5iE4+72i9MyUspGhhCHBf9kqLcO3Gl0tauh21Wd1q3yKHDcAC7D+K
	 zLkwa21uTWvYqaqs1Qf/vDHcILu1EVqKgQMie/ihHdfcIgAPOVC3D60I9mp0D+gtr2SSV
	 Lr7YZJctvCwa1oP6yc3GJ6AYrRnEDfmsU554FdRBspoNlZ0jqmMdlW/yIo5m9tCKEslcQ
	 6pGnBfpf4fFQ6icppKo2j6SSpxx6dLlnf90qOSUu96ALSvuEa85VBfdrcQVAkxXpJTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222601;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=x2+Z6GJFzUD/ZnT9mDP7KfBV4AkjsgrICZGh3Cd+Wek=;
	b=UZR3pdy7Oxj1Bn+VCPY2tqAhgCgicEGqwvqfSCmpC9624x3zG/5QBFkFi5ivoR8dOIBL
	 myL/w/++DtaFXfuRWPh0aCEOAMa4Xw/xmlj/CLp4bHv4gzkdOyG5gKsLaRgruqaf1Shjm
	 WtxOlQkjjzRw7xIesY92pNt7OkGfTw5YjDLpBrWER3CIwDLPmRmRiMitFJrS2SK7jbTXN
	 NX3sQQVa6y5vE1aR7mUURTG6jMvqpGbcGTOmIDHCk+/0EqgiaN20yEwKl1J6/xvKTwpQB
	 3voOLp/QENUGbdcKEtwDUFOjm6kc2hVMzz05TKX0e6kzseA3HKNdrDgO96m6GfS06eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TpxDq9Xb;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12773606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12773606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TpxDq9Xb
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso64576a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222600; x=1793827400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2+Z6GJFzUD/ZnT9mDP7KfBV4AkjsgrICZGh3Cd+Wek=;
        b=shHPLG+sAp7LRUVBBJDD7Fo+YvUWErwZp58utIlC/wYPNzXmBIrmryOI1vLKsg4JEx
         Z4o/hjdcv4CUZ1Cm8Brb+yxNt+O6W6FizntuRfYegQvcVEOharM1UW8LtDNecJdmXmz/
         n6BrfF+EiSkCUZoN7e5R/xm43JiAWHHcpyrP2EgjHdhV2Bcn3Bq7YZ9n2x2cnA9RxODA
         VlT1Fdn/8HSu2sWVqmSz+uvlAh8EkJHy1370y87Je8QpWoti++dgRdCIyMusj+xI2l8u
         SFGMz6QVrO+927eejlexeq0HAD7nqvb2jwuJb27SUDxUxOYVzl5MnWTxrbu2QTMpHMim
         0XaA==
X-Forwarded-Encrypted: i=1; AKwUvByefhgo+f2laBoS1NeYTSUJboBbo/V8UpVJcHC9RNoeKKtyJQkDFECc7MLVPoFpaT0Oe5rFK1jPfJHXB8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOKM+qPqs7a837O1fSu44jaX5gEdgfP1DD2usVvEd0XLlKzAWF
	PgsN6UshJsWpc6AKIsBWJuCzfduBrEkrnXnT4MLDleanfuDV+J6yFhckXdONKsvencT1ApxbUKO
	tblIeaFi38gd9qfE6YnO1EUC9FqIobraQ3qfLzwTCBmVDm0ggIbNRJuVkMzsEWOHNQHyYCzCTFp
	xAULtsRwF9mGueGxnUmoPgyxZT3ziMX5aDoT+Qa4uKAx567GwZ0yF7LIVBCmNc8uYZVhZ6tooT/
	/HDy2XtKZOaHUz68sOfq4ST
X-Gm-Gg: AYBFou09UGEnfeEMF+LUQkbyEcAiiRbqQKfaS4jldq+ShF1W3lx/nhH+UHTiBi6cYHl
	JDMUeo7/IYtM9yKBS5TuYip+Gg3ewfJilHTZWlmSlpJKzCZRXOmbj4KtRZvH005MGwuDTzuO4QJ
	dAUodg4cfAOI0QRRFOzJO62ciyeFAxWYXLqVvw5J2iYGKx4FPJhvha9LWzBgwLReH9CU0cGhjYo
	5knEH4b5Lw2F8GzaYiK8ETqsXJ9e+vi2pFGohrs8NtQ4p+5Bqu00H6OBD2JMMDMpbrkKQ9SIwqc
	KmoNjHSLrZWFkCEPt6PalPYfmgW0vXFaVLMvFdJmI98NqaboAEx6gFkiMRhRQi1lRLTbLFbeBn1
	FhO+YRMN5Q34NieEnm3wT0nAoJ2T3CWC9T7SxI1i7Vd524U3jCnYiuwjQGxPS4AsI96z7td1nFH
	4JlEBXYKN/v64CFw4fPXLk6eSOOU5T4hWKHgZB57VS
X-Received: by 2002:a17:90b:590f:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3ae6ed6f32amr376060a91.32.1793222600369;
        Wed, 28 Oct 2026 14:23:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e874b16sm524582a91.6.2026.10.28.14.23.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:23:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a2035a4so1961706d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793222598; x=1793827398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2+Z6GJFzUD/ZnT9mDP7KfBV4AkjsgrICZGh3Cd+Wek=;
        b=TpxDq9XbYcFWNahXtOKK2z4Hi88iZzWlkaNi82KUjaqsOqd9hpbbNwiwFtlvQtDQwo
         T6PHdMs1cX+dwLrv21KVIc8HXXGneJaUeUMHPe5hq0KMOSioo4Sw3IbbBgoNh/lfaaPs
         Z5J/FTwR/EGE/ET0z3tV17hDKgq6afmOt67ws=
X-Forwarded-Encrypted: i=1; AKwUvBxHvDHS6oTIC5Q1L4IBu25/fNsbEL4Urgbva7nPrzeVwOw+PVaqh5y4D6JM2AGBDiUwJK+x/PGQnSYwbhg=@vger.kernel.org
X-Received: by 2002:a05:620a:2916:b0:93e:6618:f4a5 with SMTP id af79cd13be357-94413255560mr128674985a.3.1793222598505;
        Wed, 28 Oct 2026 14:23:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2916:b0:93e:6618:f4a5 with SMTP id af79cd13be357-94413255560mr128672585a.3.1793222598124;
        Wed, 28 Oct 2026 14:23:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm1368755185a.10.2026.10.28.14.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:23:17 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 2/5] net: dsa: b53: fix the SRAB grant timeout check
Date: Wed, 28 Oct 2026 14:23:07 -0700
Message-ID: <20261028212310.3847553-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
References: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 83a03fca142a..f4689078ccd5 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

