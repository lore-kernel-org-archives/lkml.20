Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216C33C192
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429552; cv=none; b=GVuzL9NJY9/O5GY0SZIqld+ziIJhK8f1jCFvmY7ulsQ/j7Ai2hCSRPZUxOwyGd/0yyzXpSvU3wtzyiLqyJdBsEOP/gGgILs9vphmaojn/jjbhLKS2Nu3AeThJTMIPLHYG94UwsFsM0vtOrn67XlwGQ4mAjaFUMbI5kglQ0rYt8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429552; c=relaxed/simple;
	bh=URRyBTHQlZZ6H0/h4+K+vMKMUO5zrg3Dn5ulbGBfn8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUmevDlOSroWo6Syh4pAnQlpv73jOBgI8cFdfdOcgVtjeZWAOQ8/U0Tu68xrV58P+1jEBQaujf1A+KP6IrwGMjO/K96zG2cJhLVftAD9VtpLZlOV2awmGSoSzqQZ8E10DDmoNIiSWVv3x83Ff4tgQWO1hXTfbDdxtNhIKTouc80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1018A1F000E9;
	Thu,  3 Sep 2026 09:59:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] soc: atmel: Convert to of_machine_device_match()
Date: Thu,  3 Sep 2026 11:59:06 +0200
Message-ID: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the of_machine_device_match() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/soc/atmel/soc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index d89f9dcade7d2689..7e60c5681ad0d848 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -404,9 +404,7 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
 
 static int __init atmel_soc_device_init(void)
 {
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-
-	if (!of_match_node(at91_soc_allowed_list, np))
+	if (!of_machine_device_match(at91_soc_allowed_list))
 		return 0;
 
 	at91_soc_init(socs);
-- 
2.43.0

