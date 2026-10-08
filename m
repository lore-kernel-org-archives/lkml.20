Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E53CB557
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487114; cv=none; b=DJ9Fopcajous3UxwKVd5T9EueIb/CSTgWCPHMXD7FNxVDfkhz45dKANzj4/6iH4tPOAmKYXGwmpfFo9qg/fjw4ZTl9SWrznqLfcc+EFDwojL4NsQOeSfBIuUIPaZ/5xavGa+AIP2vWacCVA5wytJLRXULwXKPQPNMRvRxkSU/WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487114; c=relaxed/simple;
	bh=/9WsomfC2lAj9ZoN5Gi42D+1bJYjyuJE3VvFwcTOPt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEgl7M0mZZ0cuByQyiGHwStwCBdczKq8R9F7f7avsUivWRrSc6eQRWf9ey3LT3I8AFQfpNQXRxj0cXHNQ+TUM0nFmY5gpoQN1bFCTRJWhH4+g/uhEroFOPnijMf0CfR+eLeayWvMimd7sbyQYqNTdysShgqlVRzB4ZkIJCikMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=FgYrS/Jl; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="FgYrS/Jl"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3153528eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487112; x=1792091912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZKA77jm9kbpECwes2HBBFKfBcH0wMfdUgHPGsHOLoE=;
        b=FgYrS/JlAyIB5cfsbiMDEMIXgvofotk8ehbMomRNVchsiLv6JruRMaAKoezGzL6684
         KCNMsmYT0QAqIhuvW5WtVEGGgElvxjW8XxvsRremVEOLj4O7VxfO0b4x5wD6rBGGdd4p
         Er+T4nmv+eHubQ64VMt9pQfT0iYSlTjPSdTdPBM2SUp8RfKf3X1K8UrxYbHBver4z2G7
         9RXlLQMAS//x0XKwwzxOlplTOL7Iauni0HVIZvhgyFZG9RibHojx/PQRd7ZGth4g1znh
         yInv6XTcpuFYjpoVwceO92jsvwmvKiIG/LT6LkeeL/4loStcjM74YVtxzICNWOCdaTzq
         vbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487112; x=1792091912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZKA77jm9kbpECwes2HBBFKfBcH0wMfdUgHPGsHOLoE=;
        b=rjobrKiNmXHecM8nDJqw0IDgFfT86kUJxz3tmwHurqZHs4+BFM7XaLbhb1GvJbAski
         hIXR5ZHpgkRIjaFLB45InizVY/usfgV32KwBtAB2DaLl/0uwNQ7UXZbnU1FUvawiJRd4
         F5diIFG45+RAdr+1RZMj6a6lai+BFinSLkabSkPeiqzm6vqOo270f7GJ++TRZOq04XWR
         TtaOj8/hV/aQD6bhQ8GMq/LuJKNdXFsw7InU6Es5TuErDs7yEHRf9bdsanKHuwEpfu12
         DKqJ5Q7Q9RLmgiEjAiMnREsVXfr0Q0dz5fvDr9NuVi3Ubc78+8bBHKJt/zXPGmtJSMD1
         GgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzffMw7Jajr2aQa8Xl5R3d5KE3MhBPKBMCCR66NoIKBDVfoYZGJm9Nr6IDPrDIxO9UxYU5ab4xNj0uKn7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXXxCENP4OT6t8XFOyaXnJE7MYbFEU0mUkcMhGFHZbgwibAJ42
	wo8DByMNE7nLTfLasbqCx0yhuk0vbOFamXVml8nRpsNSSn04WmzhpvLBhQjpPTIf0tA=
X-Gm-Gg: AYBFou0pkmtoQxqRgvl0yoqovVIaxiMK6cs4vYe9eKjCRAK8AsMy1e94dHZ7Uz7agnX
	hFLQvbFrSLfQGvQT32ppGij5m27KrK/FRn5sP/aphC1Fp6SswTbM234dCtlFNiXyMmGIY74LY/i
	cWEFEtm2K0aCqi3mk5Xp2rDBvOgAN9Tc4c3RXoPd6Hgt8lZHXj8uGl7Uc+Xb7hcNCoy2HzUV2iP
	hI8/zNetrkOXDaMrUtzKaxuSV5Dilz7GLvYMqPQVJIxRk7M81sSjzYkkaw+JfMKOvQ6DyiqhSTl
	IGnTIaiSyngIBSlxM/Qmo9o5EAeBMQV9ZJd3Fho/l3ZWc+Klcs2dat0c/56qVt+iHPHCfdmwY9u
	XvGzmilG2wloiNMYHGzHC1wpGWAtIvo6bRavlWzKjSeQqjvDdnvjU1l/mtceP+f683wS9nniDrm
	zUcoN/JlvBEces/5tFcHEPZ2fDzSUuW95sfFE6JvlyMn/pMHEBzOQMPQ4gmkxmody0C6mej1dRq
	V88SbvpIa7IpwOj2n/w2IIkcQwLZ38JrdHBGrukorZ0Y6+doACyMMxqSXu+gH0IqY2oFII=
X-Received: by 2002:a05:7301:5416:b0:351:58d9:7d9a with SMTP id 5a478bee46e88-3515e0066fdmr8007040eec.38.1791487111442;
        Thu, 08 Oct 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm117933eec.4.2026.10.08.12.18.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:18:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: [PATCH 6.6.y 2/2] gpio: rockchip: fix generic IRQ chip leak on remove
Date: Thu,  8 Oct 2026 15:18:21 -0400
Message-ID: <20261008191824.98662-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191824.98662-1-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Scardovi <scardracs@disroot.org>

[ Upstream commit 1c1e0fc88d6ef65bf15d517853251f75ab9d18c3 ]

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove/teardown, the generic chips are not automatically freed when the
IRQ domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic IRQ chip suspend,
resume, or shutdown callbacks after the GPIO bank has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by explicitly calling
irq_domain_remove_generic_chips() before removing the IRQ domain in
rockchip_gpio_remove().

[ Backport to 6.6.y: Use the upstream teardown helper on 6.6. Defer 6.1
  because irq_domain_remove_generic_chips() is absent and needs a
  prerequisite or reviewed target-native cleanup. ]

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
Link: https://patch.msgid.link/20260607230504.35392-2-scardracs@disroot.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-53226. The target creates generic IRQ chips
and omits their removal; the prerequisite supplies a complete teardown
helper and the CVE fix invokes it before removing the IRQ domain.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/gpio/gpio-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index e0e4f3ed5fdd..86cf3cbcdb40 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -786,8 +786,10 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
-	if (bank->domain)
+	if (bank->domain) {
+		irq_domain_remove_generic_chips(bank->domain);
 		irq_domain_remove(bank->domain);
+	}
 	gpiochip_remove(&bank->gpio_chip);
 
 	return 0;
-- 
2.39.5
