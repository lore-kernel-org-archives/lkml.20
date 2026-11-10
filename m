Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347770;
	b=EYO4KZYzxOk4zwHauSB5Wpu4gv4FiGrL28mqHbjbt3jOe/WsWBUh6j2Pi2j3uf2g1hC8
	 Xm0ZGiegX2f1NxaojJweCdrE3OTQ6WuomF45I7iaxzEYsXFYhp+RCfjb7Msrc1ku0aa7D
	 DyNEm5s9e9jwu9VzPgHcRqL7j4eLdPCktjadtjX8y1PkUpMW5Uy/7bMXZvw0WhX6terHB
	 mN1XzsOkO9nBDBzwH22MNkWzWziBB1PlTtFGhw4OHCRTzNf4aa2hlfL9uZfbnhwzYipg5
	 7Qn+RqKz2DRaAcCEomOuvP1+6cUNGdxLEi8E53i3gmFbcvlsvM8xxM1vucg9ZdWTjRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ywbXjKHTVVvhV0w97MKutLqW2Kaqqz/b4ZGRe0MSLiI=;
	b=E3Fn52sM1YM1EOGhwXAhvZyY2rIZ0I5akbv85T9Umd8wQ7p/pdJEamxc0ElvkVHZ6Fu8
	 49XiLfdPfWOIxpU4CgC/zOK205ioYJt/XFxKCSkAXkieZLn3DY3xjGEe02d52gTDWVtBM
	 SUyfrpPKc3CEj25OsegPzqlHgvlHocja/LRuu9v2rDpvVK2xFGup9BpF1q0sVybm/n3vl
	 HcbF1BvRbsELzHg2X43z/Op7qSy3S0UZsRb+ljwscA0vkLoES8YNHO6SxLo0jxCu0kWxQ
	 6CeeXYZxUjR8cf5DJ/QH0Mvbf4QaWAV4FHIrzKmE0ZkFB5GEUgoZObbEUBV4zFrosNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="bMK/2rjG";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5AA60A3829
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5AA60A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bMK/2rjG
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2258685f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347768; x=1794952568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywbXjKHTVVvhV0w97MKutLqW2Kaqqz/b4ZGRe0MSLiI=;
        b=bMK/2rjGJlCWTlYYgHEIWI2zl9/kkeeVrSEmSH1uADWR2WMz7phQjLrJmDvdxKck6P
         UvQw/CMsJUlVuyoM4sqqpQ8Z16xGXfjL3SBSZEFCnhhwgDqZnV8l4PQr7tFTAGkAb0n/
         w+Zd288wPGNHbSLl1FUfAjdYnbzKFwTbMbWQZxCwp8tk42W1SvstKDii2H8lH/qY0oNS
         SVn9urubk787Ld1dDPKX6YN/RxPdsOrNB7x6xfY+Ls/I133/ZlcDwrTPuQpNS3dWcuIx
         fSN554wQZxInYugxmR7CeHwhHFL+QkVfAHpkrv13hS60CyeFZqifZXgwlohq4NPhESK5
         0icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347768; x=1794952568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywbXjKHTVVvhV0w97MKutLqW2Kaqqz/b4ZGRe0MSLiI=;
        b=U4tyHpAQwscxBLlaeAFhQZtUEVha8gGPh/o7QCDsbjP6xKCe1jrUmxAaJYbX+35niu
         wrPFSETY+1Ew9JeymOvf3FulhI+872/LoYHp44Z84FxlSvrlhO0JXpSpHg5cnn2iZ1Zr
         Q6NZ/nf2OxNCkwq2bo9xiWykmbFut9XKT2EKmzLXTVTFOpci5XjNY+eGCL2ha5yvyGur
         bD9+SUpW+zHPOyfpPPyF0bmNsVKCKpYugvRcM3fRA24+JJ4RkyxQdg+w9VU8bbS6hvXQ
         HcwZ0RnmwnowqlyefnDizpSzSQ6qvNH+LZ1vm2EFnZLrQU76ObNooRt1aBSo+0NMaBw6
         PdLA==
X-Forwarded-Encrypted: i=1; AL+hErHKOOATzKXUOChNABpNfF/EOiz3hs2H9n6tJRfDCDHqsmWJBBUNk78TEEavpEMEeK96RhNnSw5u3Jaca8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nuqmTFCQBPILTxJTT9ttAC+Gq9Q52MMsXhckCpiBiQ7MRyEcX
	TVsGVnCZO3liU96uapoaVzgvu9S3kuh7DYcRuE15tD70JS6SLPQJpgE+N7rFUyMx6TEgalFaCXf
	mgm1zDwQ=
X-Gm-Gg: AYBFou3BBLo8Bi5xSFGDSyYHV4cBSEoHVr4QujwjMwiGUh1ZPTrikRjFuhqtlYNMK9W
	42K8B/SEBpM/+wy2EEiqkVMzXALiemJRgP5wEsfV9UQQz4AKn7zeqjNFK7D4kDwcitEI13x6HXt
	8tgeIY2Xgd3Uwg/3ojAqiJnFwVGQMAVs4gXIUywCjroRkaXqpGhtGiF5EftxzPWIMT+cC3dQ8Df
	zH2FsjBJbA6vNEFk+wfsWj1gvbCRwZ3jf5xLwPfPuCf5Jz6/c04NP64h1JzSTPi7YWB4mCQexHG
	kbjK0U3srdXTnOCYqLAPyY2qbyHuLiVWY3wPTLgHMDAb1fO1dTeuQk/KkWjQXJAFjJbaBOKZDLA
	drNljXXFiHjPF3Otosr4i5/asSVM2TWZ3KYPp+ffJJWsK+9//0/Vcnu3rKz2IT5nXrGE9G8k7dP
	Jrap6I8JHhaI8SdLVNkC/5454vKXJCkwIzxz/EwOOgXR59dTNYMeHBMCc0a81mnD9G1uYhMYItz
	x8vqgM+ow5Y1XTSpt3ZYLUEVsDebrDK51z9PBn/3t8O9XE+zj7seTuL8IRHM4G7RApLLdup+hwA
	YhnM6Q8mGUqz67A1FAeI5k5zQ6xgjeucsQ==
X-Received: by 2002:a05:6000:4009:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-499c83bfdd2mr378751f8f.57.1794347768350;
        Tue, 10 Nov 2026 13:56:08 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49884b99869sm5875523f8f.4.2026.11.10.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:06 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 08/20] mfd: Drop unused assignment of i2c_device_id driver data
Date: Tue, 10 Nov 2026 22:54:33 +0100
Message-ID:  <ba35aac0499a639d932c469980c54cece6f2b29f.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uPjQrG1A7H0w/6+LvdAyidw/O4EgaW72iKmFqIqGllQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85Kwdz7BO7sNUCWOELWy80Hc5Upvw5w6/ephS ejZQYGyZlWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSsAAKCRCPgPtYfRL+ TpJbB/9wovb7vWaRT/LSRisXFys0VfB8aEFo+tqCvFXofFJnzu7RSQj4vZhzX30PAkRB+frmyy5 EKARJVjXRgAyrTtSJFHxtYjUFek7P6TcpMaRZ72mTPtQQdfC/HraNlKuXQmrAmyaOzeMh6BwUHq PflDqjM5g1kBIaxdfQjdV9eSRyPHIiemZmJEX32nLLOJpM6xHe+dS5TrZOsfWlxKBhNAJ9K1/JX KQpqfoS5fx21UtpYg8IACdzf9ysmEwGBI5xJJoHPors3m5LyEEXDimNkP0OHJKun8CeGmF21wSn VBC0tC7xmkJ6ldTgqNZrMDMjtZfLvsja5mnudCXHLXfBwZHZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/as3711.c  | 2 +-
 drivers/mfd/rc5t583.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index 9741977031df..eb03b813d58f 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -192,7 +192,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3711_i2c_id[] = {
-	{.name = "as3711", .driver_data = 0},
+	{ .name = "as3711" },
 	{}
 };
 
diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 2c0e8e9630f7..4ad761fbfab2 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -280,7 +280,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id rc5t583_i2c_id[] = {
-	{.name = "rc5t583", .driver_data = 0},
+	{ .name = "rc5t583" },
 	{}
 };
 
-- 
2.56.0.rc1

