Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FD72264C0;
	Sat, 29 Aug 2026 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008811; cv=none; b=l0owa5fr85MgRLMxXgo8oiAgnJaPseGD47E7cprsJJgJH3xmYVDM8dZfPuTxLgI4cIEGqQFmT5YH80Pa38nXsLdTfYU1rGiErREbSevD8n8/YB4K4XiqUvXU41aVOR+Rl11GvMS4yldi0N9cfH6nPvrfLh2VgWrQREI06PVXLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008811; c=relaxed/simple;
	bh=3T1abFEb3q0LHyV+GB3FmH+SEqo1auqa1Sh66RzFZRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjZ0OjgillnMWUcCbasAMhMadYxiqQlZqduijyErePv/ug0bZV9Tg7HDCQ/Wvj4guKjJkrszn0jhBTLboNOa9sbpaBoin5ovhpkrCJevUHi9nioQDbaTX1P5YAe0J+WwxxwihVXuT3zUk5QMTFmecqPZ+CTN6xEDPYttcoC77bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIU3R1i7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIU3R1i7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14F33C2BCF7;
	Sat, 29 Aug 2026 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788008811;
	bh=3T1abFEb3q0LHyV+GB3FmH+SEqo1auqa1Sh66RzFZRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fIU3R1i7SrIj0hbtvjhW+X9e2UO/23Kyi5iD4B2iBxhTk7kNADDZOdG3ibyrhACCr
	 IiJwJ4Rq7nQBGT9hwUxLOt2afkyvzuGZxIEUyHUbuWuPan3qHmYkG+DYdS1Qzg8FF2
	 IhbIUpjbV3puVyYFCKU0fUL9iw1NLYOkVF33gMdsm2M+IU7NWUEPiMsNPLNa6zvWjZ
	 P9gYsKBq3Bf7QnNv+4NhnHVMGKgjf6gd+9Y2sx339B7Yq00qqQ74OYE+UQ40pVh528
	 Mju/+R2D5uhUfAOoF8fg4Lpn3mGpp/jrkiPrRSqaAFB2V4VeUuabUY2rdg8GgGlpzA
	 z3u8MkbS1UX4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA433C61DBE;
	Sat, 29 Aug 2026 13:06:50 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Date: Sat, 29 Aug 2026 16:06:33 +0300
Subject: [PATCH v2 1/2] media: i2c: imx258: Add wait after enabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-imx258-add-reset-gpio-patch-v2-1-bfd27891e225@mainlining.org>
References: <20260829-imx258-add-reset-gpio-patch-v2-0-bfd27891e225@mainlining.org>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-0-bfd27891e225@mainlining.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Muzaffer Kadir <muzafferkadir@mainlining.org>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788008809; l=852;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=6gFgGcWn8XWMZgFcAqImtkE7Mtn0Fv/loz0A+OqkWoQ=;
 b=uDYz4J8Nixs5xOqxBYgf/sToUz4lEo/oxloyl5W/XX50cB3pCXI9ryVqXDpD2cvMOCYz4mBB5
 gDjt0HwAdhpDyOM1OGRks8jJLKAZGPyV9NUsTA31ue5+WUOQEMa7t6Z
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

From: Muzaffer Kadir <muzafferkadir@mainlining.org>

After enabling the device, a delay is required before the sensor is
ready for CCI access. 0.4ms delay needed between enabling and
reading the ID register over CCI.

Link: https://lore.kernel.org/phone-devel/apF5oxsCf7MJt1lk@kekkonen.localdomain/T/#md6a0411e81a2e3a563c935348f2fb4f3d52df64f
Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
 drivers/media/i2c/imx258.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index bc9ee449a87c..9c3a6579df0d 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1129,6 +1129,7 @@ static int imx258_power_on(struct device *dev)
 		dev_err(dev, "failed to enable clock\n");
 		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 	}
+	fsleep(400);
 
 	return ret;
 }

-- 
2.54.0


