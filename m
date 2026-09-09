Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5980058F09A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965993; cv=none; b=OgMaW1aYTH7KzTaxQ1bAZ2ZbIjhK56OuIKO9rRS09MlCdUPHsvNDJ3qLrlnApN3P5aSaFsIkHM7Rq2H0Ls7y9PZonpPxddYibC8dGJO/eKi5hMW1pK4ODC23qrw8Izhn3emsfn0YAZJ9uH3BzmNmARigkIuRRzmFPjOQqSyEWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965993; c=relaxed/simple;
	bh=rvkkExEUcMaUy59i6wJIdjBBC89+4qxXSYWwRb8DqK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iX/cC9Dm4hCMRsCXwWB441zP5NKRekJHGHdXIu5vXlpl/yp+hKUnkc32MNrKmAQAdf9+R3Uecwc2dRywx4bZHTXuWgZ5K89ioMbA+ExWcDIZZBR9Bg3KregKC3rK/MvRfxD37tT2borOyIGg0qC7JwtlM2bt5VLkpjeCPE/7TdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtRR5l3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtRR5l3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD271F00A3A;
	Wed,  9 Sep 2026 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788965992;
	bh=pGdEeAAqk5i6S4ZifYTTdToqUp6Fk/VEIwiWTP1kmLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WtRR5l3kWc+tJl2JKr7BfGP1zFQY1idtB6hrUNF1aUWGE0TZnxgZU5Auy+pk695gI
	 pxGXyn221+rnQvLz2AVfPAw4sfGcY7NlxkYWLx9Iv34S1ehQVMntq3wI1D0Y9alilQ
	 jiPkbgZ+PEaXkkDTYeuYXlG7Cd9UaylH4tGgMxWHIhtzg3ZcnmQQV7TMYbnzONMdpU
	 itN4SSjNUtMe//M0MxJ7rUHU7Seiq4NRREIy5RvITZuOiwXHbeZEG8tdZ7Gq4GjfQv
	 l4Zy8eBVQnJ+3SVqe8L8h64l4puyWI+G68zvVAJBKtnzu4728HFEzi4SMx+09nuDAm
	 ifdp436UCmeZw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] regulator: mp886x: fix pontential division by zero
Date: Wed,  9 Sep 2026 22:39:57 +0800
Message-ID: <20260909143957.9284-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909143957.9284-1-jszhang@kernel.org>
References: <20260909143957.9284-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the "mps,fb-voltage-divider" 2nd var is 0, there will be division
by zero bug.

Fixes: 97be82880b61 ("regulator: add support for MP8869 regulator")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260901043123.5401-1-jszhang@kernel.org?part=1
---
 drivers/regulator/mp886x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
index bc25cba33c8b..dda34bf0a74d 100644
--- a/drivers/regulator/mp886x.c
+++ b/drivers/regulator/mp886x.c
@@ -317,6 +317,9 @@ static int mp886x_i2c_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	if (di->r[1] == 0)
+		return -EINVAL;
+
 	di->en_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(di->en_gpio))
 		return PTR_ERR(di->en_gpio);
-- 
2.53.0

