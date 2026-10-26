Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032194;
	b=Mj5TdxaoHXFZ0mcCDQ3z7I0LuZXTI+SsDbtIAbPplxYuseVu5bMuQNeL2khvQH3o/zHu
	 LaW9RVXcaQ2vTZ6Ou3JWv0MGtaIA2WgnpC7Xu/a8QH6+ULF3Ns2bef29LnBlmta5Dil2J
	 PXX8xqlK5FhsRJ2MIvFPxCN3KcOcQvhOVips4ZA44qzGPAAlLrvB4WY7aAaIKnQ/rNDjr
	 fSA6Vp1Ejzod1U165nnUPkvXIJXCXo56NpnU2hI3zidrV7Af6sAv8ISIS2Pi9GS8qGO39
	 srJikphW0guYPHi6HAvmS9lZHYIjS0gvFDxNC9pEJXBEIJvsPZfRVbe/r5vSr0YusIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=weh8aB1RD2rz2NBxnWcSX+Bp3jr1F11OvC/LQnJmCzo=;
	b=hH8dSm1u1mE6U8TcoGzzDQF2CA5/5ao8kP+K6uBgMatuy87tRP+qp99/r4nS0h7b3uR6
	 unCtncTis5kLMpCNkCBL7UCRPlN7w6edXIfdtkyxjirjpzovKd46pCOjj5lxrUKebSfzt
	 ssy7rsetutQXu71a8HhW5OrBWj4hOStAttkqHwyedToN91Sf4kAp7qdhAIehrT1fbbe3x
	 NMZaVlyzRV7GowaRh1Rfzqa3TZFsLJUNYMzdQdl/KflUjS3710wIET1FolAF0qjkQSHoI
	 LOPGf9rgCO2zzyop/clVq4icB5SV5iQ4FUKdgTl4w1cq0SRQWlJWDHAxJrt9xhVo9ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ob1cgA21;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB21E60A3802
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB21E60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ob1cgA21
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22300435e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032192; x=1793636992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weh8aB1RD2rz2NBxnWcSX+Bp3jr1F11OvC/LQnJmCzo=;
        b=Ob1cgA21C7u/iX9afc78bokr4oYBgl5p+ChGverPkwTnAl+mNw+3vj0aZx/7Hipp5x
         54+LAXhU1xO1uhePKVj40JuVQ9uudk/SWC92cNtb5yl9AXYq48NvvGWgYmpzuVS7SvhV
         qQQpsCEpSFNNYbnV7dqbSOm4gKMTAT4nU/ZtQHUZCAAhUEqB9pr9Cw4UrmV1H/QsLzkg
         Dsg9n3hXIKIJAZGujHsfbA5KZEOcuDX0UyujB5ai9eecWQWFWb/32sCi0pMVvP5hWpxb
         UbWc/x39Cthu44F4o5VUlrui0vGwM+h0RtNLJxPMvbnWX4sH/ihZpWYOSkbg293odkMQ
         wFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032192; x=1793636992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weh8aB1RD2rz2NBxnWcSX+Bp3jr1F11OvC/LQnJmCzo=;
        b=QTwFRDfbH/NaQqWMffkT5M5r0JvMI/y0ehU0YMm+yldnLhUfrPtj4ZLSWKfR3YBuvA
         6uKqUPnSjmbrKe5KHWrQBZZkG08g4XfAfAHfrvzgZUDiynOclD3VAYW1CizRMOq4YDLI
         07vtwJaUFdq/QV08Uof0nNRQE8dOm9FiQDTF7Ug8MC/YRxAEm3AIWvq42po28Ogu/rYi
         5jaNN5QHu0fky5qhTLqUy10X4SPk0LrcfLMUaDRBkLJjXCsW0e7rkfolRz1VCdyciQfc
         fSY9p7SoZ31Y+kSvaJB/E9wCfkIaQHLkPKr2vMhSYGznfcMFsjKYDn7xq+2VMQFnSGBm
         aRXg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ1HgnbhpD9E2aRCdm4WGnKZZifkvn/TuOoSVaTM6l4q6RAbLgV1/Veo4ttAzoVCmCayyqfSU0UNNYhdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhVzTbj98X40tr4u0tjG/XxH6UYWyqNW1kPxh8LHR055Vej1rw
	X6jreMOccK/t58hkKvLjW72RB6tTG1gT9DxxUdOcpmPrWajXtulj5O7CSdGHN7sf/2g=
X-Gm-Gg: AYBFou3ZtY0clYpwIXqPVflgym/tuDNJC1WU7F458Pd84eU4YH56QNPCnZztqj0UwJG
	I+Dr7qKOm5C3oap8TkdMvvc6XR/NS1j5i2kXUqJwSm4Disawb9W0xCxjMR9s2rf1x4C7ShX3E0O
	HMohvzLYeheSRstPGaRLZgm/hhMjMULYdYEeG6q0QG5cq0p7wOyXd6kDFbEMvK2fdGll8cdsreo
	RjoLwcO+YxfPzEtTpdmc/xJjRTcEXMIi70wManEGXJZ16ZCSup6/RZmMt9rtqqfoHpeqlA1Gyjn
	5dbaPGQwe9p0k0CLwZfpEQTeCiCEEkZNjxA5hWVFmHGgQuuQDz4YzKH8+dd7aceXGlAfAFfS7IG
	a7oJygq8IhQi/1ZHivzV9Of6MFTNfV05QA9+vLKgVW53lC5jrLheGwJOhJSC86Ii0laaWk6fYh5
	Y3vs06UifqyJYsyxB72LA6mf/gDdP6o36Vg4m3fS2bTamEPhtAs242UrRw1cOAMvOQt7HlNHhjL
	v82OTvFXpNjXP0pcO4HZ8YQV/P66/9kmhflzW9benDjI3SSlJKACN8z8UvBpas48C21pJ6h4W9K
	I2u+Ob32oXmNf6He7DGorovjOyocLS1UuRA2UyTkgwXR1OD2tLBGhiqkH3NlMb/S
X-Received: by 2002:a05:600c:1388:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4a35aca74f6mr164640745e9.18.1793032191715;
        Mon, 26 Oct 2026 09:29:51 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a30e22csm205371365e9.2.2026.10.26.09.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:51 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/22] gpio: bd73800: Use named initializers for platform_device_id array
Date: Mon, 26 Oct 2026 17:28:25 +0100
Message-ID:  <fc1ffd672a11b0f89524c6295e4070c954eb81c0.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uMej+WR9EcZGNyY6m48dpaWcf/noITslKqqTKl8iBLU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+/qtiz10JiRQoSkM+IcYR4IkJCCZKRSwEOn KnytOdxz6qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/vwAKCRCPgPtYfRL+ Tg0gB/9yTWWAxuYL2icmvpbASj3ucZ2WYr/yBAb1fg1wpLijxz0UB8ReqStKtEywYdvLeEKFTAc q2aGqdelthjyqRw3pS/VS3mTFLmAcN30ZLHhaog8L8KXtRprUTcaM3o803PavV4cYv+TuQU0f4v xYlkOW1PlCyEJo1SBdGO1hFKlRvMRb1BNSvdDXLmSlPYsEc3AN7mjUoSmz/sbK7P0iEKtfbGDde nBtE1vo9G3iwgf4qxfz9gMtx5MrlFp6EyndyawwKSsGdr1J8G1/UlUgu3P5P0ycUSS8Nu3rpcxt EE2pISFvJVuaPnDEN35IN6BW8Ody3fbRPnEhLn1Dr3qkL+Dp
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union
(though this driver doesn't use .driver_data, so this patch isn't
strictly necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-bd73800.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-bd73800.c b/drivers/gpio/gpio-bd73800.c
index 2be2a885820e..c960ea6e8426 100644
--- a/drivers/gpio/gpio-bd73800.c
+++ b/drivers/gpio/gpio-bd73800.c
@@ -189,8 +189,8 @@ static int gpo_bd73800_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd73800_gpio_id[] = {
-	{ "bd73800-gpio" },
-	{ },
+	{ .name = "bd73800-gpio" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd73800_gpio_id);
 
-- 
2.56.0.rc1

