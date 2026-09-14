Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC9D449B1C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388679; cv=none; b=Dkft8t1wHBQbky3S7UzZthMKd69LrI2pRGl8/jMKK11vaLHRMpETWKCu520KAeZjTv8qoPnhmkVxxKoCRtNkFAyqPCiPVk6WwARFLFW8i9k6XUCZm5qCbSjGIBuRiqmhByF738oq4Vzstu5HWo31weW85voYcyKbPnitYERk1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388679; c=relaxed/simple;
	bh=j8t37Op70xO3ccHHgecocecHx7T+OUfEWbzmUZcFqW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvlh11OnqZCeu3V5MutBdWXICETFLNqg24Dn0R0NEL4sVLx4Y9VNYXJJfI50ZqHN+KyGPc08PyJC+dKkPwK0Rda7s5mMcbQcQTB1YO37ZHNJVImdKFsp16wi/m/rFe3RiDSiMDXaaiJYEJ/elPOnerdlmyiDhE0KzuGLXR9wyxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nA/EglJy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA/EglJy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so269236f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789388674; x=1789993474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOr4uO1ECTMyXWd/dn0EtDp/RbsgaL9j1XA8SLnYrhY=;
        b=nA/EglJydesQ12hQj/apbUZzCXTgFKSCltDyRxZW9HDwilMYbvXa91ZrC9U59zSuAu
         rV1KSbbLC0yppmxUgzlsFvwQG4BHHLcdw70NUtXi7/3iYhEdKJ5BRPu4YvbZfaOGJaXJ
         u1Svu6GQmeMaxf7plTH6d/rJsw8mljsH9zHBaqVTUCcbQTlhBDPrNdK6elcsz23LnDH0
         YKz9ROGtzux/OC2ZOqA8LKEvvvhB3oLKbUneDR0/j1Vc9OmoIqq4cPek6AWEJT/lXDJ+
         x2ZFcrFBJQ4adH6qFbq/V+ebVGnId0QoDeoyMqsZG5t16ZVsijq7knb8PDV1iBuiZTie
         ZHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388674; x=1789993474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOr4uO1ECTMyXWd/dn0EtDp/RbsgaL9j1XA8SLnYrhY=;
        b=MkFAJj7TreEBiPlbDr+0JF1XbuB0Jc2BHVVwxARRP25Cg4IncIbK9RnIddEwncZRHX
         lQ6yJCgbOCzQCb9jUWAe+aZAbOMxkT2/EDX4w7tNNZYcViLYGfTut72SpNSini+o4WH6
         xE2HyYqbm7Z71w6pQDckFhKQ2GklxrbxnZUiIgRYjReT/dnbySWnqpGjL/NKu1bC5DhZ
         +lfT9IdT+1e09s2LZWa853mDVDJObTz/afFalhmzOf9MRF4NhNk9it6iy5I0gXXMHE+a
         Gw1qMYu/CmvOG0VDmxCEblfCu1EtIzule7MmUYkiFjOyEhM81AlImLmTdCCbUmfdK1pT
         7lOg==
X-Forwarded-Encrypted: i=1; AKwUvBwK6zqqffruLGUYGjWJKzM/EdilRKOEMrjVFrqW2NR2WIx3lZNNZVEpIlekHoKoojbztLShgWP5bL4N+vo=@vger.kernel.org
X-Gm-Message-State: AFuF++kv64IAmtXUt9+NRaFOCSc1Neq1ZrA6bLGAdVzmu9MThaAZhbbn
	NyVqT/nwe/21m8DHjYPMBtIkqmS0BLEwMHz9cHVdUsqj0MQZDqiWye6j4sSt4w==
X-Gm-Gg: AYBFou0ZPIRYmJt7QISO4Z00GKfWlDRy//QGQJJh8ML10Awr1XY4PEl/TGI8xxal/YK
	Kwn0Ils5+A6n13M0ID1Ehg5entosMgM5TesFzZOipD4g90gpMB7ZLDtBuBS29nSyu9kbugR/4v3
	WacN3TBKYFTDe1yJSVR7dUqfj3dVEwEVPVxvAaRYES6Gr6uBdQg6N9Xz4YtHhF5pup25uYzg9J+
	VkIE0MCwmUWlWtWgp5mP0bDUxSzCug9MsEMWW7K++JyAL7+Qj17Lo2QMVzjmetTmpU1qeRgv0Q6
	sPP35jvsatPOsY0kOUN65wqYJI92cXaegohtpS46XN9NTwFAgnHZ7VU5N08e+0+4h+R9mMTo5jr
	gydvhTJx/wTLkKyrfF77FFeZcuWee9HJUhLXEXTSCToSrUewULTTJyZUfapoayTIhaYtOl/t/Ny
	VYqaz/Dsdxag6/oxZ8/zPYIYlcxQONKbfoeE9wclRyRq8gbzwhLUAbI7bZ1yzSYdMk4eyAPMOcG
	4t3FJTOx27fiw==
X-Received: by 2002:a05:600c:3b9f:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e7a5f41a5mr33423485e9.0.1789388674287;
        Mon, 14 Sep 2026 05:24:34 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm25161438f8f.36.2026.09.14.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:24:33 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: lvc-project@linuxtesting.org,
	Stephen Boyd <stephen.boyd@linaro.org>,
	Peter Chen <peter.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of: module: harden a call to request_module
Date: Mon, 14 Sep 2026 15:24:25 +0300
Message-ID: <20260914122425.137413-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In of_request_module(), the string 'str' is built from Device Tree data
and passed directly to request_module() as a format string.  While the
Device Tree is generally considered trusted, using externally provided
data as a format string is fragile and can lead to unintended format
specifier interpretation. 

Fix this by using request_module("%s", str) to treat 'str' as a plain
string argument, not a format string.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 9c829c097f2f1 ("of: device: Support loading a module with OF based modalias")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 drivers/of/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/module.c b/drivers/of/module.c
index 1e735fc130ad..592377603c24 100644
--- a/drivers/of/module.c
+++ b/drivers/of/module.c
@@ -73,7 +73,7 @@ int of_request_module(const struct device_node *np)
 
 	of_modalias(np, str, size);
 	str[size - 1] = '\0';
-	ret = request_module(str);
+	ret = request_module("%s", str);
 	kfree(str);
 
 	return ret;
-- 
2.53.0

