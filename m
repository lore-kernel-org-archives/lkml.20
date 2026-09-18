Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214484B489A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719425; cv=none; b=AWrmOOj8GCST9y5OTA90ENm9oOWC994D38QeBaV3E4hoxSYxhYRVzEoS6A7HBjnZYBSF6m8k70ynpZevFGgbINYWuayjoMi4eTFLAtDTV81K9e7ONdyDRJQ8neqTBEUSl/U6h+jmDcNNR8X9Gy7UGdt/vPG5zJIHGe/c43VlQ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719425; c=relaxed/simple;
	bh=3Vb/Q5gFmB9GEcWuixSJnDg8oOAAOJry8Kj0f4JNoZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jkrUFBvWymfAotJVx5W5VoL6XsjzXUs8WYCvZxqIcM9ro58BbbfBIMCuRZXdltb9FoWnSFQZ68pN17E8/WdLEeoNShzSzYJNoQq7xEooHfLeByrInTWwK9Z4LNVfBsdGa9gJ/71RXNu+XXtuM49Ra5Z82EGJV3JK1uV8ZZKBoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=f/ZuQw+U; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="f/ZuQw+U"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso38462366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789719422; x=1790324222; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4kVqeGTAB3R+JJC+QW2Gmsm/OFhxPzA+cRh/xOgn5H4=;
        b=f/ZuQw+U6Oou4+0wxLQVaTn8sEDXNSjmna2q7eqbF0jBzljRtSjZkishgGWJ9tLwdW
         uJvWi8HD/Ua78NnS6cpHA162DnYi+814p379aFP6RqUnLSq+tEYAFjA9LORXqlRQWLSE
         W3Njy2xMyDkRgHoRsmel36brh4QS3edDNP0mmqce9FY4JMsviHXG2GXco0sLgmcEqyB5
         66YEFGfDKae/nNklAm/LdVrMw6cUYKEYoFq3h1/NDqSOcrvFHyAPpce9mdQUtbMCivA2
         /gt8Yednq5j04iNF6PQYPnJlsfS9HJyKZ9D47NUKvBmn8tVpy6+eFrJXz1Dj78OPERoL
         kuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719422; x=1790324222;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4kVqeGTAB3R+JJC+QW2Gmsm/OFhxPzA+cRh/xOgn5H4=;
        b=oMq8VCrwggmiKz9nSrlyofxvx/c6Oji6d6MnFO3cXrp6MUZ+o7aAWX8CFHC3IOSmU3
         crWZ7gXpJUymipikVSaHacbn/I7tYKQaLUT9/l8zGUPOHKPaz0+5h/dpSpBM3ll+8MQj
         CeCi41DTLYQISwhp192p7a6eQqhRQkglVqnwK7OqJOci6AKBu9Nz8BRdm8nVGHbErADz
         NgtPrDveEsRFcbVqpNcvVd46wU7DxcMTTaFCid1qbpe97f4LbAr90L3XOyykTfnnm2wz
         vGqlxUPyAYvIcSMO9+w9tsOrmgpy/6jWovggRcHsbuMcWVh1KhfXgzGfhyUGIVKv7lz4
         CYCg==
X-Forwarded-Encrypted: i=1; AKwUvBy1gzj9DiO//ItFWJXdrHohT8AH9ty+z4/pKon+7lJm+dmHfllR2VYh02CmG8eNfzE8Wz2luPjgPJp6MoE=@vger.kernel.org
X-Gm-Message-State: AFuF++kgxpBe1JDgQegaR6tlNPQG1dLVs8OmLo/a/drLSRkK2LJwwVa6
	GNLM59R3DMf0eESjE3bszuyXBEMLhOdn+Kxlx6KOBdNNfYRFODiSa1Dw/18nHVZ5z18=
X-Gm-Gg: AYBFou1XdgS7Kl1hgnMafkqGDRNiNm9Ms3OON+WQxY+WDeEclWPlGuO7/b2nRX+aAAf
	wMKgmhzsxffHM6Vo5cZm6rzS4dsT/HHjGAPUf7UlLAWanGlnWpuMBqlflFP3pqmEFpFxNMF/ot2
	oXKG7F6DMVwKRbd9zN+G437C7StxcSIfeLlyZYFtKQ8MLrRfrJiD8hUUlRy8YgBY8b08mveDlCw
	hNMZFckKLsnLxoER+JG8LGHYVgoJM++X07m9REkOI64asFJ4hz8+4krYWW0ZwHmTAO0pC8/iVyB
	xozMGmPgoyXQwQuviVl90RIT8ebO3cdIdbYZFKmmGtBQH6Nzsmhuk4GJFF49dSuI9NU1RLQfz2+
	7ju5k44rwKgpBQxZBJZmWkKXZdBATGqygXdXa6e/0NEdlFF4iaM3ovTo4nTYyJ2K0MawOb9WoZI
	uc3JcIhS+Gz4B9e4voW+Po8PKret1fK33vT66T9upfaveUAR2TnS1H9BcAI26elMHw8B2D+swjL
	ftxXPGnFUf1uqw9eJpJDphcoGAWvJC1EDbtgjVvmagBNgURN+VY
X-Received: by 2002:a17:907:3cc4:b0:c29:f5d5:5aa0 with SMTP id a640c23a62f3a-c2a159a977bmr170225166b.42.1789719422087;
        Fri, 18 Sep 2026 01:17:02 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb43a37sm30344066b.23.2026.09.18.01.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:17:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 10:17:00 +0200
Subject: [PATCH] nfc: st-nci: Use print_hex_dump_debug() in NDLC_DUMP_SKB()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-stnci-ndlc-debug-v1-1-48d370af9c6a@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDug8Se1VxEXJhl1iqQloyKId
 zfq8lu8t4NQYBL4JDsEWln45yOyVwJ27PxAyC4aVKqqtM7eKLO3jN5NFh2ZZcDcaFWVhTZalxC
 zf6Cet3vZtI9lMV+y8/WB4zgBGa5/CXQAAAA=
X-Change-ID: 20260918-stnci-ndlc-debug-3b726547b775
To: David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Kristian Brox <isyourbrainfoss@proton.me>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789719421; l=1184;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3Vb/Q5gFmB9GEcWuixSJnDg8oOAAOJry8Kj0f4JNoZk=;
 b=aVqV952H3U9RE4pnVYs1xz5MaLGPVT6K6cveb1CJo3CvPPyUkSeZdwykELjdRwogWB6L7Db2D
 q0SaOd5RYEzDSPlDvAIj+bLA5G5NT1n8jKCHnxSq6ZCA8qGBcSxQIkC
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

print_hex_dump() will output when just the console log level is set to
>= 7, which is different than the pr_debug() on the line before, which
will be going through the dynamic debug feature.

Use print_hex_dump_debug() to have both prints be controllable via
dynamic debug.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/nfc/st-nci/ndlc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index be4808859cfa..89a13a439279 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -39,7 +39,7 @@
 #define NDLC_DUMP_SKB(info, skb)                                 \
 do {                                                             \
 	pr_debug("%s:\n", info);                                 \
-	print_hex_dump(KERN_DEBUG, "ndlc: ", DUMP_PREFIX_OFFSET, \
+	print_hex_dump_debug("ndlc: ", DUMP_PREFIX_OFFSET,       \
 			16, 1, skb->data, skb->len, 0);          \
 } while (0)
 

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-stnci-ndlc-debug-3b726547b775

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

