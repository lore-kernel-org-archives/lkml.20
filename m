Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097416;
	b=DDZ2AmL5yoiC9vKiepq9hfbx46GJYiiffUtOnt5qmEYDItokUqdoz3S5Fnopwxg2j1Gz
	 HS/YdEV49D+/b+Y2yMo7pFGqbGip1uB5mjRBHMVTJrjd6LoJb0XDDErW205lwlUMhJKR0
	 rOyY1BGuR74XYoNoC4iJyygn7hEZxEQMz2cSiwBGMpNxzwjj67c2Yny+MagGkFgn9p6xA
	 F8tfr0u8zQh3whshZ3D4yPWZ6CBEvIRFCi3gWCRfSGcjNz0dME4D0A2nRna5Z4L47TQvf
	 Y8u790dLZ1Z/XUdHJvwQj1mCio/+F+g6C4+1jJ3vPPENbiQUcAMHWcTGstfozpOuc9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097416;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eCfNrN25WG0Lp8N9e0QR1ZUlJsFnF3TjIIskwGO1CyQ=;
	b=ygt1WOqfAj76fGjQoVAEO2LqqpE/zjCwr7ogdIYSN6h09r7j+xeOMPOcq0K0vmnBku2f
	 SpZPSju48urm8PZudgZsfS6vVK/s49Mc8mH0rFCFrF/BdiucY9qKcU04J3XVwh2KbjtVk
	 6YOIatr8PHVMyVqJEcKlL/4qjVHdfXqMmBRl+vgGX6O1yoU4J7tdfcFX6EMNqDC6Kpzzs
	 Mgj2+jQ4HHNZxpmZPO7IfXyPFIcF1kaoxEMpJit8drlq4fxX/87Zct3TQpav1TqZJZf0O
	 RrMjP09Lr7Nrtk72RDwhz45uK+Vq9Wvc4lR7lHi1L6RW2CAJl3RMhdLMTHWaNFkfHNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAo+3cnj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA8A606A31D;
	Tue, 27 Oct 2026 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAo+3cnj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8595E1F031E1;
	Tue, 27 Oct 2026 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097416;
	bh=eCfNrN25WG0Lp8N9e0QR1ZUlJsFnF3TjIIskwGO1CyQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KAo+3cnj/Mo6mZ5IwWx68OFAxV7cAhDfrS399AIyrtiLUize18zsZR9Pi/LAeMjt+
	 quFJauaRNjvbVW4Uj9/o8PULqRCXcCTxNKbVEvLxKmLeybri7gWCFwlWVnFs31nN2n
	 LZlZVFHXXp0nnEEfIwtljU1RV3c9l6tuuIhrTLa04fgPYllUOd+F28jx7GD5aY2V57
	 Q1vYDl9Oq8/HBYRT0iOxf0SVs25GhNTBkrL9MSQk7lAgbYEGe010rrSi1Mvnh0wpcd
	 PAvLPlie4THn23L3TPmDqXR6gHsDRWn8bD9qfIXJBr7NBVrtg/AsofjelYcvnNKbfS
	 Gqx/IzjWk3+JQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
	Sundar Iyer <sundar.iyer@stericsson.com>,
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/27] mfd: db8500-prcmu: Make AB8500 cell and IRQ resource static
Date: Tue, 27 Oct 2026 09:30:36 +0000
Message-ID: <20261027093306.2812695-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
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

db8500_prcmu_register_ab8500() declares struct resource ab850x_resource
and the mfd_cell descriptors on the stack and assigns &ab850x_resource
to ab850x_cell->resources.  Although mfd_add_device() deep-copies the
resource table via platform_device_add_resources() before
db8500_prcmu_register_ab8500() returns, the shallow MFD cell copy
attached to the child platform device retains a stale pointer to the
expired stack frame.

Mark ab850x_resource as static and the ab8500_cell and ab8505_cell
descriptors as static const so the resource pointer remains valid for
the lifetime of the device.

Fixes: 55b175d7e632 ("ARM: ux500: split out prcmu initialization")
Closes: https://sashiko.dev/#/bug/linux-554f3a1f-ca41-4078-ae9e-66d0d7fb4c9d
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/db8500-prcmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 6672c55f2ebc..cdfcbeb2a88c 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2953,16 +2953,15 @@ static const struct mfd_cell db8500_prcmu_devs[] = {
 
 static int db8500_prcmu_register_ab8500(struct device *parent)
 {
-	struct device_node *np;
-	struct resource ab850x_resource;
-	const struct mfd_cell ab8500_cell = {
+	static struct resource ab850x_resource;
+	static const struct mfd_cell ab8500_cell = {
 		.name = "ab8500-core",
 		.of_compatible = "stericsson,ab8500",
 		.id = AB8500_VERSION_AB8500,
 		.resources = &ab850x_resource,
 		.num_resources = 1,
 	};
-	const struct mfd_cell ab8505_cell = {
+	static const struct mfd_cell ab8505_cell = {
 		.name = "ab8505-core",
 		.of_compatible = "stericsson,ab8505",
 		.id = AB8500_VERSION_AB8505,
@@ -2970,6 +2969,7 @@ static int db8500_prcmu_register_ab8500(struct device *parent)
 		.num_resources = 1,
 	};
 	const struct mfd_cell *ab850x_cell;
+	struct device_node *np;
 
 	if (!parent->of_node)
 		return -ENODEV;
-- 
2.56.0.307.g5fe7bd680c-goog

