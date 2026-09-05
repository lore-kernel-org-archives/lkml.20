Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE6F33263F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788599565; cv=none; b=MM9djo8NyImKebC+95LL2skpWRRIrlUK2qQpPat50kbLiCPylkh41rBosgehtseOeQoxLIXwl/z58jQirKqXgNVZoeKr2eM964AEgWFSRbvFAbVMCDp7WfVzdo74/997JEmhvbzyeE/1HwU1XEfTzgjnZSTFk0vAjd5fm8+Fhqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788599565; c=relaxed/simple;
	bh=aSzJCwGy+Q9LdnOlXJBjjRUd5CuplN1U3kCcFurqCwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0ktWIvvr9FdI2ld7/NHfUKxbL56U/AKM/6dVwmMe1bfxsOTuZh/ra+kAmfbJtr3dr72mkAi43+iut0jvwQDj+feKNP7QoCg5mziIxtj8VbHM/qUPReGjRT+bMErq/VMeNbfkBtDexOi1AD7O0jdakDlu0lam2YQy3Hv2FteGsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGkmSx+y; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGkmSx+y"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso2445548a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788599563; x=1789204363; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTxpnNHYll2qLfMkvXnCCm8UVDYABNMgdwWlDezjMFI=;
        b=XGkmSx+ylFnl7mHelG5aE/9MHoFMOrS57p03hVS/y7r8fsGzYkEblQl8WlEW934liE
         Wfy96KM1nL3I189hzafKR/VJve2AN08A/kMnLy5Btq5sLhwILPug6EhqdWmZORWNHZR2
         46mYCV6uEkB84ufRFxi/Nzuz47JoP8Db63hrp3xchw9nTDzE24dJLMnKjhjO6430gXpz
         tuIxSINC9ewNU7KPEx9t2c9rQiMuXHAYm/qZzG8hL0D2FZ82NLEu+bUzrK5MUwMyR95/
         7+agBvfFauQQZfvqyOy5kKBqB5VtY2BybFx37iDR2xMvTG3IhVXhAkuiQFnvUohhVV5T
         KzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599563; x=1789204363;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTxpnNHYll2qLfMkvXnCCm8UVDYABNMgdwWlDezjMFI=;
        b=RuXF7nZZxovWMWyoMGo24hAiwjAxZcaArAJN6mc/C15iDKg9SK3F5iedy3J8euyJvp
         0M+bxl6SiawasZCB9+yo9TrZbuPYNXJccTCQIm+PD1pf01reZGx5iVDYwKMMwNxIb0jW
         32zPKGRWZKxA5ca9fsh/LkJQP0xc79w7GjpuU3Rf6bsvP6GdqiQNgG0OdprYhGl47mqt
         7YGtrlhoue7Vg5DL0PQzTHhzTi7DIca0MsJ1iPjJtwE6ecMg92NY1YFdkTkZbtcT8QUX
         l8OIKUNw79ncCZmWXWPh8CuvRjDI0So84yeOu+l7u3rA8nxjIZpqkywDhC3fIT2KTUop
         /22g==
X-Forwarded-Encrypted: i=1; AKwUvBxkjSLqgx3R/Thnf0V1wGhXSQ/Mxq+KDpMdjTggKVLgpNKkp8neomxhq4oXIP35q+XhV9UNXC/DO5Tr6m8=@vger.kernel.org
X-Gm-Message-State: AFuF++nEdYk7cHU1tK8FXBDhIASEnLrsSybqob/b3+D8f3bCI4bNyBml
	+s5cCuxArWNfmEuTDllR7jM/EzGfhZB73U+oy041T951QqKmKFuY7+YP
X-Gm-Gg: AYBFou2AXodwvZOTOIajs0lonftDQHiLcSW3B7HiT4Ll9R9DuDCrLxTuXQW1bwU0RdI
	q373NtjO9lQ6iV81NS1ExtEEEU+L0g2aOCpO2Kngk7ywNFLWrB2DLsWHcRf/S/BTyK6Y+gThr0t
	dWRfLb+Tw9Jhgz8lshjyQB+lktTG85hIL5nZ88yLuQOm3EBr7XzjmLUA4oJXeMEcMazouIkjHoY
	UtARkR34ff4EZScF6t9uciyWfEH/4oXhf2i6h/27uF1WTug3ml88G1C1M4qd0iVMGLHTpbuglO/
	U35D5KmJTnaLa1BheOiw0TYzHe4as9T6ukTvMode5UOpJr0zAHwVzSKLSyS18gzSBnHXuG2PJSV
	Slbh7dQbHZB69QhO1LYdK/xyoYKarv2UNpB5jP7SaOLIN7cgTWEaVcKqc8q6eWqDF1rfdL0wgvE
	gs+vmm41VETveXfut0M+srdoEYCEXSTn/p0V1VUnPiY/Kb6HSffgjWELUnwMGxh8DAA101Mhu4b
	deULdaZMlXJe7DaS5Ax5c+f73PupA==
X-Received: by 2002:a17:90b:3803:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39b25eef036mr15552895a91.0.1788599563469;
        Sat, 05 Sep 2026 02:12:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ff40:39da:76d2:2e7d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm15071268c88.5.2026.09.05.02.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:12:42 -0700 (PDT)
Date: Sat, 5 Sep 2026 02:12:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: crystalcove: add missing MODULE_ALIAS()
Message-ID: <apvciC1NYWyNfseD@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The crystalcove GPIO driver lacks a MODULE_ALIAS() to allow it to be
auto-loaded.

Fix this by adding the missing platform alias.

Fixes: 104fb1d5153c ("gpio: Add support for Intel Crystal Cove PMIC")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-crystalcove.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 0fb5c06d0886..ab7fab5b9754 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -396,3 +396,4 @@ module_platform_driver(crystalcove_gpio_driver);
 MODULE_AUTHOR("Yang, Bin <bin.yang@intel.com>");
 MODULE_DESCRIPTION("Intel Crystal Cove GPIO Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:crystal_cove_gpio");
-- 
2.55.0.979.g7e5102b832-goog


-- 
Dmitry
