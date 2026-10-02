Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7749502E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942588; cv=none; b=d/LeciHzsWHFRJHLUiveItFf/PKB5uhEypTQZII2kNax7n6isVexzGSplJB2eB8FNLvtlxqkeapxQa9kcrEiVb+hnfMo3h9s5lDsfNEKS0BtpD8kZfbeOxsMWzy3y1+3fMItseiI2fOrmLUiwMPBA+b3zBf4ih2Qquvh2Jw/roU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942588; c=relaxed/simple;
	bh=ozSoPu+ixvTWlKFKxDp+ARaoG4Sjp3bKLj33/MrvA5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rC49ivJ2l3Ym0jxJerQihmujzZCOlr0bDah3y+uWdIdsEih7aC01DlSInCrjcbVuZsoRhG0tg8EWNXmtkJklHs1yDjLGOZO4Y1zxb6iJv102nDyTUPxd9B7tN4tMSFTrYCOCzT5yXdvMqOgrwoffmxoMQMeepLYaclfiD/GqJ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=qdv/hkPp; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="qdv/hkPp"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0f4efe31so1007478f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790942584; x=1791547384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZxA1Fz7Nhq5BAB7+pKOMZYxJVrz5ocMRvUjSVpnaqQ=;
        b=qdv/hkPpeGWAeOea1X9b+3YicETfkFAlGNhL1wRjyKUriHagraii1N7n/yJKliil3M
         VRaqnuHwyNpkdJWUfTamq5b4gs7vGn+Nb66mnlZZoRIE7hJH4uhF6kfWi3Z9W3H6Zfm/
         6f9euuaNfXpfILQg6Nxncbc1AKRNpp/3d2iVfjQu3O2YeKgCXlfcaTf6e8bQhKKA+DdL
         EIRRevLpPBhcT681YFqcCxfgWQm6Xuqm1zuTrn1bb0Jx9ryC6j4JTsft3hrUzI5b/agz
         sdJOnXKp0REphy5DwjGAESsbyQ/BPSMvEME2JEyQcQL+K72d4o+XWbuVgy8FNCzB9hcG
         pMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942584; x=1791547384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZxA1Fz7Nhq5BAB7+pKOMZYxJVrz5ocMRvUjSVpnaqQ=;
        b=edcwXdxhi81f4dTE6bNzqDhI8tNGhytdkloVf4zTbxe/heoGzb2N4upBG4whJc/Geb
         jnmyRr0fIuHmUiHjng6GfY87YBOmf+RXQxVJOwx93qQAJT1WnEawQoIzU2Etn7RRDDzV
         jtic1uH1CiNZ+vZB6pqgG/9x1GekFZNaFGt2YiAVJhkE9We4PWdDLRkT49M3MMK/eHqz
         qkPWJakdkvNfNn/M2EicnCoQOW+qfUBvefmUsjxkZwVMW9ggPFRIjv/KGbP2EXnbHKLG
         oWNjU+3bFNYfcptr8uox8FMY7zdd0GpTzZT8ae2BFfFqtmWgLnmq7zmIZu/pJJZkNEOc
         I5eA==
X-Forwarded-Encrypted: i=1; AKwUvBwkNUHkpJK/dMmX4LyE5jv4Gv0j3YxKTctmxSUfhLPCHe637vWsqDe1KJaMMBqBfQCbvt7KQ3fizXK2h5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyalxHVn0sFw0n6PAgsiej6fEif81L5LgwyGKWNxPX0dzF5c4N
	5Jgl3JKHP2snRqHFi76gWIgQ4Vabo2X++phh6GKPlQqczUdD23DFdBc7OBVbBpUpMc4=
X-Gm-Gg: AYBFou0nmMZ51+lAaatUIYCF0WD2gTG6iCh94n4kxDKiRpOQhzzUDlR2YW9xzHsIHOC
	roLmQyS+10Dk0fm/Muuu0EBviAKCrzWowQed9iEOs9ggLqwuVQzkE/bIA4uFmh0RWd2rYZRkNQa
	YOiwJT89EZVLGeLoA3qbXrfxRwgU6Yt36ALboHQsHu68umwKrM3Jv1NGK0sbaNf8Ezod/Bq9X2f
	AUaAxTYXuKHTUbqT10l47IcTKMlSst0gbj6uoRpvvxTjd3HL8TuTPnSPrbv0L2FvEAUea0e+gWR
	6AQ1ocJKw8OqzMY+CFMRi682IERZZKFxPXiklGSZS/Ufy2Cme6tA4OlkKaLsUhQd0SI5dJ6uOn4
	JOtYZV6mKatUMa4w7Clzgb1WUYRh6T8o8NiqBZP9Mx0m8g4OM9p0+czo5aitPK1U2j5zveWIn4G
	WbWgeF+CYltOcbpQASUnUjvyHHb6vrZUbt4VY8W0Su0Wyg5r7LjhZ5ypjkojzlV/N83GZ2iGKVa
	GopYwgN9bhOaHKF
X-Received: by 2002:a05:6000:29c3:b0:48b:6bd:1af6 with SMTP id ffacd0b85a97d-48b1271db4dmr2867852f8f.40.1790942584471;
        Fri, 02 Oct 2026 05:03:04 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm5845213f8f.13.2026.10.02.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:03:03 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 02 Oct 2026 16:02:54 +0400
Subject: [PATCH 1/2] dt-bindings: power: supply: bq27xxx: add BQ28Z620
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-bq28z620-v1-1-bdcc10d42519@flipper.net>
References: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
In-Reply-To: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 "Andrew F. Davis" <afd@ti.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=alchark@flipper.net;
 h=from:subject:message-id; bh=ozSoPu+ixvTWlKFKxDp+ARaoG4Sjp3bKLj33/MrvA5g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtn1tso6EfYtFrkFSziMOsRjeJR2ft1qUec8UP/OVZs
 XXuofITHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1fSXDfw8dJo0Oz9tp0xasiJzQn+yWtXzHDpHlwdlzNqUGpb+xjGH4p1gkcdD
 XXHNK1jOFnyIW6xf+3yArcOT+wekP78Tnsu+z4gMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add a compatible for the TI BQ28Z620, a firmware derivative of the
BQ28Z610 that keeps its standard command set but drops the Battery Trip
Point feature and relocates much of the data flash as a result.

Keep it standalone rather than falling back to ti,bq28z610, as software
programming the BQ28Z610 data flash layout would corrupt the
configuration of a BQ28Z620.

Link: https://www.ti.com/product/BQ28Z620
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/power/supply/bq27xxx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
index 79d1a3c8c685..be0f1f7292c8 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
@@ -49,6 +49,7 @@ properties:
       - ti,bq27z561
       - ti,bq27z746
       - ti,bq28z610
+      - ti,bq28z620
       - ti,bq34z100
       - ti,bq78z100
 
@@ -93,6 +94,7 @@ allOf:
               - ti,bq27545
               - ti,bq27411
               - ti,bq28z610
+              - ti,bq28z620
               - ti,bq34z100
               - ti,bq78z100
     then:

-- 
2.55.0

