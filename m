Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B853E5ED1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791699152; cv=none; b=R8StL8gXkMW0YytrZ0ZwmUr9YtzBRVw0L546g4/jVdRVyB3P6r0kNoDFQMdbiZsrURPeMhhezfenhDLNN3yMJTif5SHWQyHUFV8ijjgVYnrwKtTcFvV74vUPk6iFVCOXcswCdoZQwMZtMegfGkqnQDaVEm2hbXDxMKpWfoOK1fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791699152; c=relaxed/simple;
	bh=mL/mbqUM5s1ZUyV2nquwQNqCRx7Nt1umgLfDekwxImw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+pJYitwj3nJePYFHU+tGUuczfORvwp7WT3sXe0UrdhnmTT8/sJ6TmSXiKj7OHamgk1ALyadlJih5EheawzFs/8X+DURkW30d7jECzzyp7/PMaK/2K64tAxP95kDgIbyq44tM5Vzypb1nZDHz+U2Kyq1uBDxyHf0T2RWthp/rQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HhY4xVes; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HhY4xVes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791699148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBHkNKPOabJYTn515l9ds5n8WuBGPqy0SlcZiLr9hdM=;
	b=HhY4xVes4kAAeXUAfB2M7/aUMZ1BcxJsD1TA4Qw10Z6SxVQum4QwRRfGJ+w3Df6XvM94QF
	X/wZ8lW4xHtGoefQchW+/+/jmLnv1QtvDYJEtX4MgJDHSzpmyJaI6SgEs1kd1WYdxeflHS
	vZFwVSd3jxiLNaRtP5B1IFf7hkFC4Bo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-83-uEEsDOr6MGmMAv1sfm4kwQ-1; Sun,
 11 Oct 2026 06:12:22 +0000
X-MC-Unique: uEEsDOr6MGmMAv1sfm4kwQ-1
X-Mimecast-MFC-AGG-ID: uEEsDOr6MGmMAv1sfm4kwQ_1791699141
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 247F01800607;
	Sun, 11 Oct 2026 06:12:21 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 321EB1956095;
	Sun, 11 Oct 2026 06:12:18 +0000 (UTC)
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
Subject: [PATCH net v5 2/5] dpll: zl3073x: reject inexact frequencies for N-divided outputs
Date: Sun, 11 Oct 2026 08:12:08 +0200
Message-ID: <20261011061211.448373-3-ivecera@redhat.com>
In-Reply-To: <20261011061211.448373-1-ivecera@redhat.com>
References: <20261011061211.448373-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

For N-divided outputs the P-pin and N-pin share the output divisor and
the N-pin frequency is synth_freq / (div * esync_n_period). The frequency
set helper computed esync_n_period with a truncating division and only
rejected a zero result, so a frequency that does not divide evenly was
silently rounded. Setting the P-pin could then shift the N-pin frequency
too (e.g. 600 MHz synth, div=60, period=10 gives P=10 MHz, N=1 MHz;
setting P to 2.5 MHz moves N to 1.25 MHz). When setting the P-pin, the
product esync_n_period * div used for the rescale was computed in 32
bits and could wrap, so a wrong N divider was stored for low N-pin
frequencies.

Require esync_n_period >= 2 so the N-pin frequency stays below the P-pin
one, reject a P-pin frequency for which the esync_n_period keeping the
N-pin frequency does not fit into 32 bits, and check the division
remainder and reject the request if it is not exact.

Found by code inspection, not triggered at runtime.

Fixes: ce26d7ca50a5 ("dpll: zl3073x: Add support to get/set frequency on pins")
Reviewed-by: Petr Oros <poros@redhat.com>
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/dpll.c | 46 ++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
index f2e137475b40..7a617d9bd671 100644
--- a/drivers/dpll/zl3073x/dpll.c
+++ b/drivers/dpll/zl3073x/dpll.c
@@ -987,6 +987,7 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
 	const struct zl3073x_synth *synth;
 	u32 new_div, synth_freq;
 	struct zl3073x_out out;
+	u64 n_period, rem;
 	u8 out_id;
 
 	guard(mutex)(&zldpll->lock);
@@ -1014,16 +1015,11 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
 	}
 
 	if (zl3073x_dpll_is_p_pin(pin)) {
-		/* We are going to change output frequency for P-pin but
-		 * if the requested frequency is less than current N-pin
-		 * frequency then indicate a failure as we are not able
-		 * to compute N-pin divisor to keep its frequency unchanged.
-		 *
-		 * Update divisor for N-pin to keep N-pin frequency.
+		/* Keep the N-pin frequency: the new P-pin frequency has to be
+		 * a multiple of it, at least twice as high.
 		 */
-		out.esync_n_period = (out.esync_n_period * out.div) / new_div;
-		if (!out.esync_n_period)
-			return -EINVAL;
+		n_period = mul_u32_u32(out.esync_n_period, out.div);
+		n_period = div64_u64_rem(n_period, new_div, &rem);
 
 		/* Update the output divisor */
 		out.div = new_div;
@@ -1031,17 +1027,31 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
 		/* For 50/50 duty cycle the divisor is equal to width */
 		out.width = out.div;
 	} else {
-		/* We are going to change frequency of N-pin but if
-		 * the requested freq is greater or equal than freq of P-pin
-		 * in the output pair we cannot compute divisor for the N-pin.
-		 * In this case indicate a failure.
-		 *
-		 * Update divisor for N-pin
+		/* The N-pin frequency has to divide the P-pin frequency and
+		 * be at most half of it.
 		 */
-		out.esync_n_period = div64_u64(synth_freq, frequency * out.div);
-		if (!out.esync_n_period)
-			return -EINVAL;
+		n_period = frequency * out.div;
+		n_period = div64_u64_rem(synth_freq, n_period, &rem);
+	}
+	if (n_period < 2) {
+		NL_SET_ERR_MSG_FMT(extack,
+				   "OUT%uN freq must be at most half of OUT%uP freq",
+				   out_id, out_id);
+		return -EINVAL;
+	}
+	if (n_period > U32_MAX) {
+		NL_SET_ERR_MSG_FMT(extack,
+				   "OUT%uN freq is too low for OUT%uP freq",
+				   out_id, out_id);
+		return -EINVAL;
+	}
+	if (rem != 0) {
+		NL_SET_ERR_MSG_FMT(extack,
+				   "OUT%uN freq must divide OUT%uP freq",
+				   out_id, out_id);
+		return -EINVAL;
 	}
+	out.esync_n_period = n_period;
 
 	/* For 50/50 duty cycle the divisor is equal to width */
 	out.esync_n_width = out.esync_n_period;
-- 
2.56.0

