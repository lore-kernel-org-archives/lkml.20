Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16285803A8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201736; cv=none; b=blICa0Z2S9uawulSR0JIZZZZ781XKZ8pOcRmPUL02Yxeb+hmn1x2aY2cRQUufnuoH0I1NLo9sWEAVR/Bg/TNtWV26mg8GQIvKiRzcFR2fmJak1GXxX2hS8Ys+ge0/ClD9iuglsUiZCEy1LFz7ym2uSXSHv0U8ushr8ruIluNVrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201736; c=relaxed/simple;
	bh=Tob84Xx7jRdk5qDuONrJVt+1QqF6/sgm73ZWH8n78T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SP3429/TeFK1rU4lsugiRtWUyededHutT0i9Cp9EHE3YSdUUsTjoyMwq0QGZavzluha/h6rnsEy0NgUjH8wRgTcS+yp/y6E+3Ixc5oOfMm+paEd/5ao35oU6kIzS0k+0C+zls8iXdArJQOKDthowYh4yZEidA3L18DFE+hDfWXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9n5Kptj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9n5Kptj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6CC1F000FF;
	Wed, 23 Sep 2026 22:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790201735;
	bh=dsHbh4efldtBLtHakdDgE//4iSpubmg+wTXmCKLyNpc=;
	h=From:Date:Subject:To:Cc;
	b=b9n5KptjBm5Hu532jLakg0dV0Rq7jXlP91SB0suErODZrusx9INArYbFu7TsvQIsM
	 fwbCNIUSjV5DOlfNNf8009d/xFBPFjN8rE3Lxt5YixJIXRsra82GPOlrTZErJAvFXl
	 ofG4lvOxj+ccVTALBacjFJOiPRJQ7cfl8up5rU4+bPNcQu02+gz9L2etTuIwmtOkZC
	 /VLuVtIIWdIJ03yr+D6bA1/PAPhB8PNQyu4jBuogh5FX4dvyUdPmTXbnVYtB/tbUuO
	 Mb1c0p86dlkJC2YhonO2wbjmDq4CZ4JTzBIbqk++y1W/JBzUUo5iVOJW0kLrV/zWuH
	 upmHP1/LDz5Iw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Sep 2026 23:09:53 +0100
Subject: [PATCH] bitfield: Restore be16_replace_bits()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-bitfield-be16_replace_bits-v1-1-71b6388b8385@kernel.org>
X-B4-Tracking: v=1; b=H4sIADBOtGoC/yXMQQrCMBBG4auUWRtIYgnVq4iUTvJHR0otmSpC6
 d0bdfm9xVtJUQRK52algreoPKcKd2go3ofpBiOpmrz1wZ780bAsWTAmw3ChL5jHIaKvVY1LIbZ
 d5mA7pjqYC7J8fvPL9W998QNx+R5p23am8CC9fgAAAA==
X-Change-ID: 20260923-bitfield-be16_replace_bits-1d6c48fb608b
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Janani Sunil <janani.sunil@analog.com>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Tob84Xx7jRdk5qDuONrJVt+1QqF6/sgm73ZWH8n78T0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtE+DTGXLdr8v3Tlp7CrrUeBOA/dBc17yc8rDB
 gZPcYBt5xaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarRPgwAKCRAk1otyXVSH
 0CRLB/0Xg+QFaX1bZEGchlBmjMNEhITHC9RN5ptkZfyh7sLh0xO7fvkKx1Q6GXfyJLUDJsmmxxw
 8W4qae7QY67XjUg0TowudV2Ys6wmmgF79sr69uq0sMjdp/jNa6OhCtvjd+/j7QE7xECxrbuao1C
 H9J9cAzH/UwbtlSsgfzztRsoFf6aAcWOeGMsv/mDGza8Bftz1H4dPWgcVbylQN1XZG+eR60BKJ2
 nJ+FyzVkKJzn4QGL9Dc43MGO+MgbhZIKZ83bqM+ZGS6xHUb69n4qgjFuAz327hmaxx+aMTD3YP/
 ZzRZP0r4WrI1nwYpmIRyBBBOYAWxXeL7JmWPLS9eBVzmmavQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 1c88ceb09d5e5 ("bitfield: get rid of __MAKE_OP machinery")
removed a bunch of unused bitfield operations including
be16_replace_bits() but commit 508bdb4938928 ("iio: adc: Add AD7768 and
AD7768-4 core support") introduces a new user.  Restore the function so
the build still works once both branches are merged.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/bitfield-fix-width.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/bitfield-fix-width.h b/include/linux/bitfield-fix-width.h
index fba86bb76999..f73b8cd65601 100644
--- a/include/linux/bitfield-fix-width.h
+++ b/include/linux/bitfield-fix-width.h
@@ -93,6 +93,12 @@ u16 be16_get_bits(__be16 v, u16 field)
 	return (be16_to_cpu(v) & field) / field_multiplier(field);
 }
 
+static __always_inline __must_check
+__be16 be16_replace_bits(__be16 old, u16 val, u16 field)
+{
+	return (old & ~cpu_to_be16(field)) | be16_encode_bits(val, field);
+}
+
 static __always_inline __must_check
 __u16 u16_encode_bits(u16 v, u16 field)
 {

---
base-commit: 1c88ceb09d5e5506456a625043bc9b35ce86fc41
change-id: 20260923-bitfield-be16_replace_bits-1d6c48fb608b

Best regards,
--  
Mark Brown <broonie@kernel.org>

