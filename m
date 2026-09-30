Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F773F7A9F;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=G+ERHFLFXQwLF8CC28GbVkiJPayt9yENOypvNfcoLom/lMsrtRTlZztwPVUmqYK8YCiHMh8rNaqBAv2v0qTwacZgQ77Pr3Xn9jimASOMnQVFxpQ0U7ANLJmtmo/x5DRpbhadYh8fiNr6xbxoFhaw3s+MPzFGY2gRt2qVrO2fxEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=TZYGrJQDxWdLxNJu+hMwD/2g5h5gSDcZQPn5t24Ex3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFCLGPZSqnw59OH9AGa4NvVF7l863gyxGzasyBF4YnNW+n7p7aApDsYMA7yIEqTIiabAYZLCiqVTUqrf09+Sg95K8X4naOO1Achd7tvNOKFwXMujOIqCFhBc6M0Y9KJFa90BKpzP4BECLPSZM8RtRa1eX63Du4HvNXv5DELaVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxgefU2n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxgefU2n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07ACAC4AF1C;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=TZYGrJQDxWdLxNJu+hMwD/2g5h5gSDcZQPn5t24Ex3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JxgefU2nxE7sU0hU4MUrCEoWil2hVyC5dUMyAff3hscsjOqFpyRuRgxAVi6xVqQg6
	 YorzcxJy+mwbNLqiNAMo4YI3b5T0izG+eeKO2bSr8dN7hcz2g/zpSiUbt5C3xULLDb
	 9VNC1DxbtU+rC02tftyqnt4oy5BqL9SyJjtVoUhyI2qQkP2eBcxWS89Gpjwf969X/4
	 dbTKfvw9NVXuHdzRpZz1rmO26k4n4WcYnCmiWmGEF30d3rJyFyVx2U/mziQUP/4QV4
	 yDlrUifZwC4XgIx94guhK9aUXVmkJ9y65R9fLNtX+NTrVRwQz9gt9fQNrIcIh+RZXb
	 tQLiLu12WmeoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7062CA5FB1;
	Wed, 30 Sep 2026 06:42:49 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:21 +0800
Subject: [PATCH v2 03/21] media: i2c: it6625: default the debug module
 parameter to 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-3-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=753;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=EUFs+ILfJcYIHmr8K1T8VQMnWY4I+fmmYf8PhLutHNM=;
 b=7bWIWv6HLQplAyTCRWS21VFjgJ0y4LieE4LLGvJNsTpZ3Wepjyr/mViRfjOCdKNAlO10jKJbl
 +b39dQmUsxSBXfdpEKSDYgXHfAmJUxK7xJ/9YkD0MXuppjorDh/0W9M
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

Printing all debug information by default is noisy for a normal boot;
default debug to 0 like the module parameter's own description implies.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 485e1667c7bea34b152ff3dde09a928f334d71aa..7cc2ba0d26b8dbc439807e350434137f102d9d9f 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -29,7 +29,7 @@
 #include <media/v4l2-fwnode.h>
 #include <uapi/linux/it6625.h>
 
-static int debug = 3;
+static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "debug level (0-3)");
 

-- 
2.34.1


