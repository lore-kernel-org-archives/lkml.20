Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DBB4F7987
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792699; cv=none; b=ZIfm6A9zNGQlJUw+O7al5nL/LccLnwRvYxNfddj3+BMNkfeK+NyEn4j/kTJcitz4fpIfq+3xkrh1FYN4Rb+2J4SKVWOxJZJYG6cPa303U3FW6NQhhqumpPZNFAhbC8sjafux8AqW9ReVAldQcqAc6DMLENEiMTPHAq7v0CBqZC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792699; c=relaxed/simple;
	bh=/w2tP6jJm9Pa7PWjow2JuCQ6uthTilvQLfGJba/Y+xE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdK8vFaZ5We/5bp4hyM/kcpbDAFJBL+YQidksDBZjWerdYgjOt8ioclKNuAMV9lt0jOkOv20MpoQLauNptG7T6j7JQMMwzNUNbq0PTmGS95jzvczpckDRMlcKkSc7NOATame+gaDJE3KM27X8IHQr+MzOqriFZz//pVnXAsZ7/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=B8f1Fui3; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="B8f1Fui3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788792678; x=1789051878;
	bh=GgJW7yM8729h7XWq075MBG7+8NNptLe3gc5PN/8g9BU=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B8f1Fui3U3QcSjigLrSrm862yC8mQlu/H+Vyd/rSYI8+FvLVXSH/yu6G5G5d7ZTdE
	 rWVNnsyO0OZawffkazmo6D0fV4eOACIz0THO8eHEPuf5XxHHDbmHohlRrLj2HqH04g
	 xtrpGXNfj9u6R1C6WDigRtLD2XwvbghAasemKyWZ4QEJrHJWC5lKGwhiged78GYkf2
	 DhyVU5YkQxwHottheGQH3Dwa09uqwsleAzgahMpbW0CPc3RePeaFBn2w/aA3gz1rb6
	 L8aiwpXiAjilCy8LWXyNgsMQZjPW0txu+n8NvQ0P8n1/G1gU2Yketk4cFt9PYtLADh
	 2QC+XRP2JhAiw==
X-Pm-Submission-Id: 4hdql82qC7z1DDXL
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 07 Sep 2026 16:50:58 +0200
Subject: [PATCH v8 3/9] iio: accel: mma8452: Optimize struct mma8452_data
 member orders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-mma8452-open-drain-v8-3-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
In-Reply-To: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, 
 Sean Nyekjaer <sean@geanix.com>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Martin Kepplinger <martin.kepplinger@theobroma-systems.com>, 
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788792664; l=1020;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=/w2tP6jJm9Pa7PWjow2JuCQ6uthTilvQLfGJba/Y+xE=;
 b=QbKXU7ryf13LAvyjt0CI/G4wjrXWHa2iEhuUA+/rnJi7Y+gNMRyF7s1h2zyThA7/tm8dfbTew
 TrEO85qyqjLAXdEpD8zzBwpl3hVNoFc9HZidZZP+9EV6CvuoUwEXJPt
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Reorder struct mma8452_data members to avoid holes.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/iio/accel/mma8452.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index a937cbd84f30..6c5a8d65c8a4 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -108,10 +108,7 @@ struct mma8452_data {
 	struct i2c_client *client;
 	struct mutex lock;
 	struct iio_mount_matrix orientation;
-	u8 ctrl_reg1;
-	u8 data_cfg;
 	const struct mma_chip_info *chip_info;
-	int sleep_val;
 	struct regulator_bulk_data regs[2];
 
 	/* Ensure correct alignment of time stamp when present */
@@ -119,6 +116,10 @@ struct mma8452_data {
 		__be16 channels[3];
 		aligned_s64 ts;
 	} buffer;
+
+	int sleep_val;
+	u8 ctrl_reg1;
+	u8 data_cfg;
 };
 
  /**

-- 
2.55.0

