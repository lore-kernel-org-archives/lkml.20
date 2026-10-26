Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032166;
	b=eMiVU/mV5/AMBHnZvqd/mUVZW6X1dwjY6s7FcNhpqjqhGVPx7U6FFqdsyGch10KakS0F
	 CXZLs4jaF/bYtXQzt7DlwCZeTmtOGiS8AAS8seCeFTisvhn1Bb7f32ZAvheyLPSAhKNz3
	 yXaRoQV3ShLokkgbvf3XLnh3O2nLMLLxZci0qP+hufe+9K0kfXCTtg+DVBbw660ccwTQi
	 fWyPpgqK0NuRNp76qofCE74hi6x0C6Zw1H1EB2umoN5Cng6COlkx1j8ucnG9ETvhSO0di
	 1LXCAy+pEcgVpfWXWHiaOhOytzG09ISH0iv/vNmkM8NrRsPo0vXxWLWaklaa8OOYbJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
	b=EnjcviQyKXIk5mICplsfi0tHsrcfWidIiP5tfFlwJ3G5vQNK359z1fgAo9PZYcI8TFru
	 MpFQ7fkcqjz0aYBsJAGGfR2W3RdOZJwfcS9vaC9QN2OUnwihsz0W8NezYP0YhaLhNfzmQ
	 T9Y90f8/MJPWuUBnv0w0emAcHsfB111E1hmBAcRjVA6YTd8siN6vJ58kPVxDwLHBB9yMI
	 PgL+BmBCIRbJ7K3R7BzN0VkOC3lNsHo6s7i2Ua8iOVcCg8Rkgfwr52e5GfJDZQv2wfQry
	 J72+9aqB40NWejkZED9C/ibzGqVBmV1E70nZtJ6cR8dznWxp2pRFpDar83Oh+aWKd+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IwxrFln+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EB606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14EB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IwxrFln+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso25385395e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032164; x=1793636964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=IwxrFln+KNvvf5jPfSC3rCv+83Wi9IMJzbozZvZyz9DIL1Hw92ouSvcScAeVPl6UDA
         U44+CWgT1Wn67cUaIo+qlbzTd5tj8vZpHRhzXkmciGI/kRVcuQFjqNM0GUbXoVHhaXTK
         kHRwba1vHTEdh3lfiAyhYGXyXbe2pghX3UTW3IE4ndI92TGiVqhpNP/cr5O2uCzMcs3T
         5e4NTAIdvMc+XB0BS34XlWXeSFHQPuy1qm6ekva1q6g3TUVRU3HrloEBcMM3KTc7hHr4
         u1XkyuuwFbaDAemczNT0OWSTgWtivGBBGcwRZ8xgBlqcFwzDPRx9oV4MMI+yJTlvYRcT
         apdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032164; x=1793636964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=Ko4RjWhSay7ZpNz1z+VRAdXtTCGdoi2Rh0wsURL14iyNAxtHKJUvYfLOjJEyliOQvd
         5DnG+y0s+qbr+Leitg8r9Eq/5ZOpyw7v/uPTg0ujpVUmN11AjEdbLoFX1S59DYPKfsb0
         Xhedsg4OvjpONXCPMPmEiJ31zXRId4Xs/zX/BznmfKq2eH+xD/APF1QWN7dTWC9yr5sM
         F0NBVyhgfNnczNLUMzeK/eVMLxK5drBhz/MPZ5TS5ztCCeBEu/fEI7q6N2cSPh2yvFqV
         //zwAs4ZjCe1VFr0DZnZVEublX6EZmG6qluTG5RboreUY/cvwjn0IAUI5hJJbirWAhv6
         0CeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwijRFBqBFuy85VEoydEEow5NmHHWd7IeGq7P2mgG/1EIOos3JFtKU7hiBlEUG+6ahVfBOWYCAyFAwWHF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzOarJnqgDVFjSejbTD7NXLeJlkNG2wFF2e93sIuyTc0nvArqs
	yvZnuZaKi820RDBNNAj6MWN5PxM9JGZzAUW89mL60DkXrlJc0WZHCXlVWBMi/s111io=
X-Gm-Gg: AYBFou0llbxJEJzoJw+rl62C1MevSTXm28kwaNKdkS2Ywe6sa8q3wZLmuO2uXWGc4Ws
	Ps3vf9N1UjTmtN6xTdqsXXsvLa+jV/ujweWh8vPrdGCd1ssO/Yey2WBVdBHxLWut9QU6NnDJ2H+
	GFz+Xfo+7X0lK2tYLpyAJQlta4MZWcQ9bgo6D8vuDDbw+IC7JYmi8G5DqsH64MHJAvls0MIQYjS
	gByZIJyP2NqyfImCIPUoZFfEcmuCC3nlIwnIiWbOi2yuzXUicM3/LT3rTzOULakiS+lrWqV1nLw
	cs5yCamE7z2lT1jiu913sRhIAR9JZc72JoX6ThYm+hBCTBbRJsSN2iceMNN7YQhqgpgR6oXpAr0
	Rvm1u3hzL/YmnWYXyUaqv2UxjLVNWz+hYTQx257TihY1AFsQwQP5QYN28l/T+cErKLWKSft7iCy
	aCjjHrlKhuLH7b5iigoKPReUiWdlKsp0T/AppXFOiDXZGcThJoSaMU9i4nWlDUaQonm4C/Dy1WZ
	hBOkDdEM693huuFkk4lm5qY0Mv0nf0uUbctxBaluwo0NtftEeBXMIvWZ2kVSJjF7aGE2Y8sOee+
	MZn1pmZWIlZ85szXhyW9vEr/vK+Ud4LeYX6JxKmzl50=
X-Received: by 2002:a05:600c:310b:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4a35ac9495emr132685935e9.13.1793032164149;
        Mon, 26 Oct 2026 09:29:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a046fefsm261483115e9.5.2026.10.26.09.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/22] gpio: Remove __maybe_unused annotations from acpi_device_id arrays
Date: Mon, 26 Oct 2026 17:28:12 +0100
Message-ID:  <2d6462ca16e21d379154cc758dca4e15e2244e5f.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=cOZ+9x4xpZu4jqMcVJUumxSmFjEiphgP8TFgVdGEb54=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+eWfLBGyl8YT8GI+fjZE/AMB+xHoUmy/B82 +g4NrSbTnWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/ngAKCRCPgPtYfRL+ Tk8dB/9wmRfxIyh5KN++bC6sFGdS2QqJsQDVYaG8PeGTCMq4sbCD5IS60iROxI8ylv4BG85C/+Y WkAgGhFAnZsHbOzSKCQSpoF4cLF9qTC/tXaKY+wyW9lT0roMqQe3cYwL3xLXqSMSq/73bkUThow 1Dc3Sf9mGDm4vlZoWdU5AbMrQFOSX99c4IZdoaG+9Rx4CTuUVt0HFD7uBlkdwOaitZ1Ehr3qwgB /IiXRuxVYLHJbyDPW4tQqANC7VNKiZeeJCx3zzPbc2SkV9LIJxGHPtKS9TZXuK1z7ZVyBhU8pIx n+emvbjM0YGUZCsh+/UHgcwz9fZWH52woXXUA4vFkxoSpAGw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So the ACPI device-id arrays are always
used, thus the __maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mlxbf.c  | 2 +-
 drivers/gpio/gpio-mlxbf2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index a18fedbc463e..1d338b24d52c 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -132,7 +132,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 }
 #endif
 
-static const struct acpi_device_id __maybe_unused mlxbf_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ "MLNXBF02", 0 },
 	{}
 };
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 4e5c5d196a50..5e4726d583c1 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -450,7 +450,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 }
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
-static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
 	{},
 };
-- 
2.56.0.rc1

