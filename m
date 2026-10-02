Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF43546C822;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931472; cv=none; b=bP9DIeDPU2u/UK5nyPYDaNR8lYBLw+5CE43ap17uHBI2Uy9zgZAgiP7FpFcFzqJU5B1EQt1/66NWqgrN9q7Y1oqK4PovF9DJg8u+yH20OmvmmQIePjANxnPVVnDOa8snIYYSh7L4HNLLBKVm1fO2a+Y7dUL9I/j/CwRmz+GHc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931472; c=relaxed/simple;
	bh=amu7VhuVsa8BcTUfbKIaWer/C3GrZKwWvGfA8gN44Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eC5vHEnl3pvOcUOJz6KqrcLzwTcP3OjItVqxcM5SKP0sdcRkfB1hZwlvyaWIFY565Sir+qw7UpUadTCOBpfLRa5zn2/NZ9mWhoGxAG43HxfGBD2sm3angLkj7TX2ITHOr+ecYK/oKLaYicaXSxAl9zNKunC1y1RH6R8s8+P77no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPzBMo0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPzBMo0A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72BEBC4AF14;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790931472;
	bh=amu7VhuVsa8BcTUfbKIaWer/C3GrZKwWvGfA8gN44Mc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XPzBMo0AHYd1UZwBKSehqn3FJA4OcBvO4GizOyzp5o5DO0MvAUcRYQJY9OnuWbIQS
	 5rwklQ5LH5cXEGp5hwfEPV8McS128XOg2+4w/BdCAcfM96TFdwbNFrg7WzOPu3GzUs
	 X39oT9AfH9sxhq2M3MT6EcIyXgktRtW8+T4BNr4Ik6dJXV+EBhEqsCywhCUmjx0Q5F
	 axj8y/T8WOsJXuzojyJHdelDTBlbi8fwYCzf2fEF7LPpejsCHeps34mSKL5MM/ZOaK
	 5Dic00sLm486kRqB+yh2agjpfSw0t9EuVDugTjljAnj1vnv+aSuKt7aN0y9hcp2ZxA
	 3sNhry/teuuUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F38CA5FE2;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
From: Maurizio Casciano via B4 Relay <devnull+mauriziocasciano7.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 10:57:41 +0200
Subject: [PATCH v10 03/15] media: ov2740: Use C99 initializers for ACPI IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-submission-media-yogabook-v10-b4-final-v10-3-817ec765b257@gmail.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790931470; l=936;
 i=mauriziocasciano7@gmail.com; s=yogabook-kernel-20261002;
 h=from:subject:message-id;
 bh=EsLruXmLEkO+HQyU8ompjFWh/Uxov1K49evUWjtvqL0=;
 b=/NKlt/cSX3jr0k9/s086p7b7evjYMuWUOmv/7l8o3puQH95t2kgQKmhRugTRULpdBM8ETuLXs
 VFPRaBT/kKbDIHN+j1pWW0e5Ab9N3c+1DRdPyqcdbAd6hFyXIJpLEmQ
X-Developer-Key: i=mauriziocasciano7@gmail.com; a=ed25519;
 pk=ODC2oSPBqt7ukC3AEDZNS7LIE21D8ke8TEHoNlxniNM=
X-Endpoint-Received: by B4 Relay for
 mauriziocasciano7@gmail.com/yogabook-kernel-20261002 with auth_id=1099
X-Original-From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reply-To: mauriziocasciano7@gmail.com

From: Maurizio Casciano <mauriziocasciano7@gmail.com>

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 536325bb7b92..64a85735c1b8 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,10 +1462,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {

-- 
2.53.0


