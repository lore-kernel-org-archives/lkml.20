Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794103458;
	b=fQ0oO4AuGgPj6fouPKo8MMjtByMrhYZZQmGxhBgh84sRjys4Q6WTzVUuxxHT633ZAXaV
	 a9l9REku8vV010a/rVYyZaMy8cRXK0maaxOwWX8FVJmMzDExQ5ZGSGT+X9Le/9L+0+4dd
	 ote8aGSPSNZO6mLkArGIusI7tdkfLIswnFiT0xFcPIU3vnd27DUrCu81/rAwIT6UglLez
	 7t7e1U7+DV2SRNxj+6+rEzYuOOA3qI7LkeC/0IQH1/wgl1H87Nv2jcSBenhbcQAwx44fK
	 NXDeWvKoZ1vRnszcQdfAuK+I8aRE6gMTw0EqakhMMyPiSgYlbeDC0h0KMZzFgnYbPgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p226xUVyOCcEBPo+3Gn7mR+BBT39fpCk4Kx8gUqu/lg=;
	b=4yAEXhhwM+Zon39iMvZ1/BIBI3xFBkXImsCDfeJJV0zmtdzXCEDq4uixzAO/hmFSDs8q
	 m81+2N3mbCQRTPYtE+KXlWzHQ6X5pTvb+N5Wh8iJ/fBFL7TOebjYipZZeqmkxPMSJSGUb
	 dwrjvqJmszmZmH+8rQe5LRIUxPPNMD9ufXFn+CIW43qs2AUlCcZe2MPNp74hII4K2mNnE
	 ppNZtz+CphW+jXW+obKTZzoxmQVVKIYs+zA11gUoOlkx3BwG55YIBsos7e5dH+SXHryIX
	 BLcxlwe5ntoOsl0bqzPpEx8jgr++wGJwAlulsLqpg3HjL0hdxWip3GOlyIHRmWEBQNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhyIYeVo;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291C606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3291C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhyIYeVo
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36fb88ea38cso1008841eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794103457; x=1794708257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p226xUVyOCcEBPo+3Gn7mR+BBT39fpCk4Kx8gUqu/lg=;
        b=QhyIYeVovOnSTnPzrzgRPfs9jV2MTD63IEPI27wWcj2N9qWsFSWTlof/Xlrmg1XR+j
         HPvrrxbzQ8GUXYURzP7kdjKUZ0MOuxSCxrvquQY2UpylPoEIkuaByUWr/eoP0Ahwe24n
         8QZGACIZIukS37RsIo67xkbvLWP/wxK+Q+EfC3mzM+laOv2eXbjptQ9eyJDAvL+gX8dz
         Cbs39QQS9VKd5dZ7jMMz4+x4GN5+J3TRQe+dgVTZ0ElVjUFrLHn+GIpG1BXCi6FiEZ13
         as3wr9nGOfWLkw34URieKqs8F4iIsAP3kUEfVbEH6RNhQT3iVNfb8edHLE4eDXzbTs7j
         DPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794103457; x=1794708257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p226xUVyOCcEBPo+3Gn7mR+BBT39fpCk4Kx8gUqu/lg=;
        b=HIrY5umB3Ol7v3WJwmQFC3PRZFuu52QilvSWeSZGVAmPF9umJXThscSgWxmRdJ2KSC
         2pTbj64jd2TBoOOqaH/OSt/pmes3C0HJS/DYUlQtmYNFDNE9PfXXhHqt+3oft+PH9Bcj
         e2hMVvVoPjwG+A0wVfJ+GwDyEoaT3eDLyxOCONr58M1WYjyGRyv/CK6ophNnNERybx8d
         oKCi0vcqdfJhequYwDywX/5IgiwGJxNrk8DZqQGGKl5wGJuIEJ2Ukn9JC/xZUYMuDYOO
         QrxsxK5dpG+t5An0/T8R748WiDHnPviYvEqCbBPg167VOxxFFFl3TiWapgI76ft1/5dN
         bCZA==
X-Forwarded-Encrypted: i=1; AKwUvBxIBJa2SpmcrGKB4wGGQes/j4yWO0PGPRncdv2456ogz2RiYAjxein31Rbwgiqz7fN9cKhj3CDNEQ7UIgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+etrPHCju0fH10p8mlweJ+5JgG5citSg/g3VTPGUY+4T5r1MLz
	Ky8LvQ+cNLlh3ZC9Kn3anOq+6BhV43+OXruWsY2oeziR+KviisdemxI=
X-Gm-Gg: AYBFou1XpglyKZs99SskLmTGrolh7JMzx01Zfm5kIIdcexD5yWVh0IzMX9zQ19jdUhC
	+Oa5o1zPxJfucyHFgEaIigv1sFkKkXfxIr+oh3Dkz6w3tuyAdiMh5GL6GkCHl458Vuyj/t1YQah
	HWhX49UoEkzYxND/wiZOpzrA+OkyMfSmezhDwDUut7ZRTYcz6qQdJWrdIdgMNe3lSJgqrTW2CIZ
	qtf+R87epzxr1aSNFSDK6Wt13pz7rhYSs7gPbCdcUQi2beugqj3Q34/+mP3q/d7YYF76uvfmrAS
	ySVGF+J/kLe+8SQOKjWhlwJW899zDaDmr/UePeSyNbycKTgvP7LPOUh5Fcx+ng2yGaLii9kSRWR
	0Oiq9j7RIUHPkdm98viBcKxlxQLgukEYHbyk3rZ8xamKJiOBOeUXrcJ2yc6RnvZNqKNstYRn5Gx
	cruMWnLxy+RZwuHurFW8+6js3KVTeqEFbyrOaVjbmKwlzh/k2CG/+65W2ZPtiWQK2iI3nTLowlL
	K8NFf4Wu63FBG2tFdJuUsSBX1tJyxSHSbhgrwpYxV6QOhXhpYoozvQBsNTT1uzV3HwknUK6XXfV
	0OBVxhRjkqfAV5voobSlLNxD3UI74Utj4Ph6D+SzSuW2QdYkPZuxuQOtLriUmFb1+8rK4RM=
X-Received: by 2002:a05:7022:c41:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b269af1bfemr4662689c88.4.1794103457134;
        Sat, 07 Nov 2026 18:04:17 -0800 (PST)
Received: from localhost.localdomain ([1.251.173.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771e5728sm2077895c88.16.2026.11.07.18.04.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 18:04:16 -0800 (PST)
From: Hijae Song <hijae99@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hijae Song <hijae99@gmail.com>
Subject: [PATCH] platform/x86: ayaneo-ec: Enable charge control on Flip KB
Date: Sun,  8 Nov 2026 11:03:51 +0900
Message-ID: <20261108020351.62494-1-hijae99@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Flip KB was matched to quirk_fan (fan control only), the same
quirk used for boards without a working charge-limit EC
interface. Testing on real hardware shows the charge-limit
register works identically to AIR/AIR 1S/KUN, so switch it to
quirk_charge_limit.

Verified on real hardware: switching charge_behaviour to
inhibit-charge stops the charge current (status: Not charging,
power_now: 0), and switching back to auto resumes charging.

Signed-off-by: Hijae Song <hijae99@gmail.com>
---
 drivers/platform/x86/ayaneo-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 41a24e09..6fe2387d 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -88,7 +88,7 @@ static const struct dmi_system_id dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
 			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
 		},
-		.driver_data = (void *)&quirk_fan,
+		.driver_data = (void *)&quirk_charge_limit,
 	},
 	{
 		.matches = {
-- 
2.54.0 (Apple Git-157)

