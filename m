Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D14BF934;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=ffMVKJFwRuqFs8NJobKWRwWP3xkj4hR4YhsjkbXdcdAOWRGyFdXD24rGJLwbZeUwyEEfsR9QWsdlMfluBTKcsZYQY/RFQGzo91vdhiTLlyEiv2Ad5Lfp7+bNAFiq4WvREQQeYuVWiMB0IjeqMk9q4gpg6bR3sNMMlvY+c3ahlvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=vQWgY/YFYLzclsm6KEeaJRu31wu1rdkgKqIQa7G04Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/MhdBKfj356T0bzJWaeuhXo//iNUwQjKM78zcJ/ky/fS3Xcy8LpJRamm51oZGBLN5T3rfMLg+Mx0c3/Ed2gDBHBfX/sZM46CkqeBLBCvggusFB+mhC7ff/G9eHhPaUME7x1Mo2eCWMKHCPjgmXfrFRL7S/JzKCedqI85fB/fRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghB3PMd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghB3PMd8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E702CC2BCFA;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721839;
	bh=vQWgY/YFYLzclsm6KEeaJRu31wu1rdkgKqIQa7G04Rc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ghB3PMd8JkQNLAoiFg/wgW1gKuzC8WjYCU6QpbwS3qOl51VtoEK7P8/COvUJXaFLn
	 2BqhXclpcpNRJxPWQSMTgeuGxCztTq2XxMnyYE8bRJhrXgwCExJPOZYGTN/CWwruBW
	 m+lvv7H577y1ZOTfdPIpyLg1NrmC9gcmPu0byzNoxOnw26iRtMrUmF2ci1Svaiyde/
	 w6MULQQ6jO/LUEi1zIniv6HxYCV/d4BCXS6lytyfh+CeCvXNEhmcPF57AfhhNsBfOL
	 XXSZD3Kwn6euDUBzVfzwbhtFqicaEbVw5Zvfq4o6s7yvjr/Qv1LzJfTil6N/SLdEGi
	 RWfRoltzNItjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BE9C982D9;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:22 +0800
Subject: [PATCH 07/21] media: i2c: it6625: drop redundant parentheses in
 status helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-7-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1911;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=+aDCjoF5sVqbtnaUoN2TsLy07b6ldMFq1pFd16oDI2M=;
 b=2QSZvAH8tBYZg+k3tWili1X17Y2muq02CBmcSVjNDP9t3FK9QHq5hn5ylWPmQLy0lBL2sKE//
 i3E12ug0aYyCL8f+XPlY7QAY66gh6IBDZoG9E0uXJiRjLu45x8mDd8e
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

is_hdmi(), hdmi_5v_power_present(), no_signal(), and audio_present()
wrap their ternary condition and true-branch bitwise-AND in
parentheses that C's operator precedence already makes unnecessary:
'<' binds tighter than '&', and '&' binds tighter than '?:'. Drop them;
behavior is unchanged.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 9077f66187c647f85e41e571ff0d52e5e2ffdfdf..62fabf6169fc24364e484cf573b0fc1af174afbb 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -554,7 +554,7 @@ static inline bool is_hdmi(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? false : (val & B_RX_HDMI);
+	return val < 0 ? false : val & B_RX_HDMI;
 }
 
 static inline bool hdmi_5v_power_present(struct it6625 *it6625)
@@ -562,7 +562,7 @@ static inline bool hdmi_5v_power_present(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? false : (val & B_RX_5V);
+	return val < 0 ? false : val & B_RX_5V;
 }
 
 static inline bool no_signal(struct it6625 *it6625)
@@ -570,7 +570,7 @@ static inline bool no_signal(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? true : !(val & B_RX_STABLE);
+	return val < 0 ? true : !(val & B_RX_STABLE);
 }
 
 static inline bool audio_present(struct it6625 *it6625)
@@ -578,7 +578,7 @@ static inline bool audio_present(struct it6625 *it6625)
 	int val;
 
 	val = it6625_read_byte(it6625, REG_RX_STATUS);
-	return (val < 0) ? false : (val & B_RX_AUD_ON);
+	return val < 0 ? false : val & B_RX_AUD_ON;
 }
 
 static int get_audio_sampling_rate(struct it6625 *it6625)

-- 
2.34.1


