Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B873B71A1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792271125; cv=none; b=DU48IhfCr31W5lN4TN6XBU7PAEA2wM7xmgTzp8Wx+t2FTXIej0VAL3QyeRKTpRRuYmL7w5sU5ngWfsmxt1vVxOfoWiQnY10FPZ+/wEeNHxzKVhuvAn8h6cZgEyzAvtUYuWUnXCjk4m5BuPf+7FrslcOWlNMdXBXVNQB+nVjFrZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792271125; c=relaxed/simple;
	bh=eGw2YuVzGCEWEFpz7eCjB80XmNGsACc8knr9wmw9b0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IrvlwxTZE8Oaf/71AKK7QRmvXfwLJPfccUmRU0ivkyKHzFFsyBW9eu74OA5NEQfmXR7iFei/mpjg1ZRcWWMhHfhgtZmS4X5K35kuUm06AY/w4VwFlJ8uHasYgZtxSv97eHtSRvKsTPPxBQa39BYY04fW1ytmV/+ucP1X0Np4NZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M23F6Qbf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M23F6Qbf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so7496975e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792271121; x=1792875921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2w+v6VTOfFscSyBhyB3vO7STl8TgCqdyv6t5/3oCTY=;
        b=M23F6QbfqBVXu8ZNx6wUUBb0NIQDs+ny89ey/7/BK/LaB3oaw1aOR6gABPLvs8rYLc
         EWCiMamx5IVvwzBaHi9MVSfv5T1ZCIfeNiE7sA5QbaM2cuVP/SHYqLvTPtHgJR0ZDmfi
         kEboKpNSSrSeL6gVgg2tT8IqZmqU2+ZmLKAfUm/yEn72727H4kEnOuZEeotrprjTt1Ub
         75uM+Letz1q7lcU8UT4R1zbctu9JY0iO6fioZpOdPOy21ZiWta4HBMN2JXxQ3sLSslGV
         8xHk6OlB9nqvKnMMH7rqaGUdaDsMVJXiM2PaIUekt3lQvVLXr0aggP6K+BGRzkur5IjM
         wcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792271121; x=1792875921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2w+v6VTOfFscSyBhyB3vO7STl8TgCqdyv6t5/3oCTY=;
        b=Mr9vGYoSIrT4VE5oVORlsmCiPwz2ZJQzmC3YIlxdjZ02bXNNKDcOG021SWHhuHqQVb
         KwDr4DNtuqZqpx8FrnT2n1qUZcuvncpC+e6HIoeOpBe9jaPM7pSdNFgwryFujzecnbAd
         Vt/VJ0i7HAP6vsocHrpDynnqGkc81eYG1SHbViNR0h2MFmWkyGuiYkMx5+DNbzgfBt09
         dFPzt+c3R1Ckmg9f4INnPC7LcuDalp53FiUoCdJVPQJSXcRalMyuni0D7VDO7N2TPdWP
         oXHYbbfjro7AnOv7362JONER2naRcQ7250vmICUYqn12S/lY2zitHUCzkyvfCcOac1Ab
         bdMA==
X-Forwarded-Encrypted: i=1; AKwUvBz4pWKnyDFptmPMxrBTf0SnsXR7pkqeXyuOkDPFCEHrBHZBPYXEF0Z0gN2cRDhmhL5RyfARfCtZlhVa9N0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRgLHrIEgf+xrnJTd8Gx43sjSq9NXps4/YbdKSVNMCz1aE+hWc
	QrNfXdoXioIKXkUqtkO6supISojiuy+AfIGOHTFo0l4WlCsiKBvxkchS
X-Gm-Gg: AYBFou2haPllKk/R9cCMeWc9poY5n121tShoqBSDq3zwmLUDWw4zer1KAu3ZuREe3jy
	K9Kg6pjARrHQLQSRjm23rhGtA+qX0SiKpDrcVuwAyg+tgTBrqLWvx9nzRIOlk7CfRlyjQqGukPo
	GH6B00cCMAe7qA2I3QY4I1TLTYqpe6G0DTs/XLjc+7pQBWV7Yrk+l8qUn64AtV4q8T82dhG61q4
	TbSQWod1L6WIjbSq+FextCeqC+RCb7Ey3PCbRfauXObl0kP3S0XO//2Af/t+1cWJ/M7CzRtW5Hc
	NVjxkOymkCcSL8kzIeQTFEKDQJ/rJFdQAyf2Q0aBm4X3FwIoswkyF4H7eqTtxDNDhjohOTnv4qR
	Ehfr/3a8p3KFtV2oKDeibdnJYxcMCkwM5szos+cOAwp1vfuWjBE/SDJ56KQWK4PyLtfwIASkRX4
	qwMIadkpa/2kM3hyHZUATrs+1J1qCWoZ6ppfY8H2agW/XURtBUdUn961MwlJujZ9OMRVaSOyXul
	PUyMzlw
X-Received: by 2002:a05:600c:8b25:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1d75f987dmr101048615e9.12.1792271120770;
        Sat, 17 Oct 2026 14:05:20 -0700 (PDT)
Received: from fedora.domain.name ([217.218.152.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm109085575e9.3.2026.10.17.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 14:05:20 -0700 (PDT)
From: m-amirpour <ampr.mhd@gmail.com>
To: keyrings@vger.kernel.org
Cc: dhowells@redhat.com,
	lukas@wunner.de,
	ignat@linux.win,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] crypto: asymmetric_keys: Fix PKCS#7 selftest error reporting
Date: Sun, 18 Oct 2026 00:35:13 +0330
Message-ID: <20261017210513.135540-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

pkcs7_parse_message() returns an error pointer on failure, but the
selftest prints ret, which still contains the result of the previous
x509_load_certificate_list() call.

Print the parser's error pointer with %pe so that a failure reports
the actual parsing error.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 crypto/asymmetric_keys/selftest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/selftest.c b/crypto/asymmetric_keys/selftest.c
index 98dc5cdfdeb..42857b02258 100644
--- a/crypto/asymmetric_keys/selftest.c
+++ b/crypto/asymmetric_keys/selftest.c
@@ -41,7 +41,7 @@ void fips_signature_selftest(const char *name,
 
 	pkcs7 = pkcs7_parse_message(sig, sig_len);
 	if (IS_ERR(pkcs7))
-		panic("Certs %s selftest: pkcs7_parse_message() = %d\n", name, ret);
+		panic("Certs %s selftest: pkcs7_parse_message() = %pe\n", name, pkcs7);
 
 	pkcs7_supply_detached_data(pkcs7, data, data_len);
 
-- 
2.55.0

