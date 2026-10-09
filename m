Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA233B0584
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791573984; cv=none; b=p35s+BA0bv6NmBcSrhICx0H85ealYCVTEhfegc08BHMjflZA2JSydMbANm5gjkoQyFmu5QzdOm7wh84CXO2IdoLkWYWsL9uWcI1p2Dxz0kImiQz10EI7FOzS2kiUte/WugI63t+8IxBT210L6TUKO1GEoRyMKEH1ksmaTHZA5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791573984; c=relaxed/simple;
	bh=m3BiumC4Irsq5CiZcnYSc/N3K5HJXTeF/caBageVpbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6gCREwKUp6TIx+RZO/P9a3DozyPhJSA7bJ5X0QXG1TLv7nMlmmUo5I4i5oZiDu3gFjWaPwHn13luFfkM3ranvzM69N3OiVRp812gt067OsCfY0XGLh5q5ssYGwFKLLjq8NMFurcg5z7XIcOIG0fIkRCmWZRw9CUhA2YqHE5XRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRlMsST3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRlMsST3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791573973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AfNEfqRVasKIsOnh0P3KNoCeb15xbrc1NHR3sPZSuY=;
	b=GRlMsST32QjhsNfh6hSCNQHACyAGzIEPQrNKzBMXseNqzQpcMMgr4sd/VpD5xP2m4Y5iEN
	0qmC3JEor5cqJO/wpE3C3FDxJ3FOMZIWTAh413rBZRe+0GlmhFuS0lpZc1u3VKGSOwe42d
	sq7AZOmCcU9/rjGP2hCkAJAYYIgrbfM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-fGDD5i1WNpa6WUL_z7of-w-1; Fri,
 9 Oct 2026 19:26:09 +0000
X-MC-Unique: fGDD5i1WNpa6WUL_z7of-w-1
X-Mimecast-MFC-AGG-ID: fGDD5i1WNpa6WUL_z7of-w_1791573967
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 38D72193EF53;
	Fri,  9 Oct 2026 19:26:07 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 69D6918004D2;
	Fri,  9 Oct 2026 19:26:04 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Min Li <min.li@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jakub Kicinski <kuba@kernel.org>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 2/5] dpll: zl3073x: reject output frequencies with too small divisor
Date: Fri,  9 Oct 2026 21:25:53 +0200
Message-ID: <20261009192556.272263-3-ivecera@redhat.com>
In-Reply-To: <20261009192556.272263-1-ivecera@redhat.com>
References: <20261009192556.272263-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The output divisor has to be at least 2: a divisor of 1 bypasses the
divider and the hardware then ignores the pulse width and eSync
registers. For the N-pin of an N-divided output the N divider (>= 2)
applies on top, so its effective divisor has to be at least 4.

zl3073x_pin_check_freq() only checked that the frequency divides the
synth frequency. Require also the minimum divisor and reject 0 Hz.
For N-divided outputs this is necessary but not sufficient, the rest
is checked by the frequency set callback.

Fixes: a99a9f0ebdaa ("dpll: zl3073x: Read DPLL types and pin properties from system firmware")
Reviewed-by: Petr Oros <poros@redhat.com>
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/prop.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/dpll/zl3073x/prop.c b/drivers/dpll/zl3073x/prop.c
index 18a1bf310332..4e006ed5950a 100644
--- a/drivers/dpll/zl3073x/prop.c
+++ b/drivers/dpll/zl3073x/prop.c
@@ -22,7 +22,8 @@
  * The function checks the given frequency is valid for the device. For input
  * pins it checks that the frequency can be factorized using supported base
  * frequencies. For output pins it checks that the frequency divides connected
- * synth frequency without remainder.
+ * synth frequency without remainder and that the resulting divisor is not
+ * below the minimum the driver supports.
  *
  * Return: true if the frequency is valid, false if not.
  */
@@ -30,7 +31,7 @@ static bool
 zl3073x_pin_check_freq(struct zl3073x_dev *zldev, enum dpll_pin_direction dir,
 		       u8 id, u64 freq)
 {
-	if (freq > U32_MAX)
+	if (!freq || freq > U32_MAX)
 		goto err_inv_freq;
 
 	if (dir == DPLL_PIN_DIRECTION_INPUT) {
@@ -41,18 +42,38 @@ zl3073x_pin_check_freq(struct zl3073x_dev *zldev, enum dpll_pin_direction dir,
 		if (rc)
 			goto err_inv_freq;
 	} else {
-		u32 synth_freq;
-		u8 out, synth;
+		u32 synth_freq, div, min_div, rem;
+		const struct zl3073x_out *out;
+		u8 out_id, synth;
 
 		/* Get output pin synthesizer */
-		out = zl3073x_output_pin_out_get(id);
-		synth = zl3073x_dev_out_synth_get(zldev, out);
+		out_id = zl3073x_output_pin_out_get(id);
+		synth = zl3073x_dev_out_synth_get(zldev, out_id);
 
 		/* Get synth frequency */
 		synth_freq = zl3073x_dev_synth_freq_get(zldev, synth);
 
 		/* Check the frequency divides synth frequency */
-		if (synth_freq % (u32)freq)
+		div = div_u64_rem(synth_freq, freq, &rem);
+		if (rem)
+			goto err_inv_freq;
+
+		/* The driver requires an output divisor of at least 2 -
+		 * below that the hardware bypasses the divider and ignores
+		 * the pulse width and eSync registers the driver programs.
+		 * For the N-pin of an N-divided output the effective divisor
+		 * also includes the N divider (>= 2), so the minimum is 4.
+		 * For N-divided outputs this is only a necessary condition -
+		 * whether the frequency can be set also depends on the output
+		 * divisor shared by both pins, which is checked when the
+		 * frequency is set.
+		 */
+		out = zl3073x_out_state_get(zldev, out_id);
+		if (zl3073x_out_is_ndiv(out) && zl3073x_is_n_pin(id))
+			min_div = 4;
+		else
+			min_div = 2;
+		if (div < min_div)
 			goto err_inv_freq;
 	}
 
-- 
2.56.0

