Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969704;
	b=t9Lb1h1+OfFDXDXvcL2V3oVjAf5jJ3zpySuQZV3BTsrY9B7KA7fOqsvT53V1jcspPfdb
	 meYLE6asTHiPBz2uSBSefzmxqyRTJbnNMs6rnL4MWxIJprv2Y7YA1+M0GHYptreYwSo/N
	 grlMC5D31IjDQn2A6xfFIgqmpgNFtBYaPgcquEI+3TmiMWS5OXDhJjiLn6g+rO2/Z3jqg
	 sCxtmofi9nrsTwbKXyeM7yYk2tKuhIQQZZF0qv/wScfN3PDoKh/8G+M7VDu3rie+bd0kk
	 lZT6SNt+PmGQMC5s9L7P/CFsaIG0H/9GP0MlGwFZ+4AMlUs3FGmol3/Z7Gy6BFW1ukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qls2hf7ByM4hM+XkcMA/NLbWocdRZ/KPf+vWTT7+kUA=;
	b=GOjWoZWPC9lIiDe+zJydsPQLhXHPZq0p/qU+Ck/YCKp/vKwmuR8tWrhnk02jFYWKBtGk
	 lZJZCJBopZlMnCxAFBZZ48e2DwAvLKzDC1i3UTXkm+ltv7UsCc+pfuw2m+Snha4U8L+Oe
	 tMcHsYsTgTJThwj+f61sA9XtHxhpCjBs2VkfpOiJL7CaEUmeNk30l8J6CDC9sMqAveFXC
	 JNfZIZrOBWQl/MNcgk8uYKkTiBq38i1dIhTiaTBFTl93lye7YlkGoN8Jf19eetmcI3Wmz
	 N56pmduNSm6A59BfYvZ2oFjwlpCWbs+xYtk0TKCvnS4EP5AfQL7K9r/BWezOTomXgVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1eftIF+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB5606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FB5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1eftIF+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso515227eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969703; x=1794574503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qls2hf7ByM4hM+XkcMA/NLbWocdRZ/KPf+vWTT7+kUA=;
        b=W1eftIF+2S8Yv5ozKua+UAws3pwMOzIfPYjwEUkT70ZzInkq5P8NHbTzaJN5OGNMEA
         oPSeO/4trFAsPXsqTrqhkO14wk9HezSdnnWJ9U0gBiIBeYejxhQeQR/VV03Djo6dX8j8
         F7tCCaWlIfwzr7+CTN646YzPd7VbdI+9uUTnzhWw0HPFoI+UhYlav6WnBBniKi8/WeOC
         6cQyQvK3QfNk790s5P2yWey7oK4ok3WamfNGVXKRR0VbMvU8jc4e3XCvkHuFgo2nbOpw
         3j9K/S/2puG3cWvF+ZOAkMXQoUirjbTncUUjFw5WwZdQlU7buayXknkTcgV76jp8WE8j
         6riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969703; x=1794574503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qls2hf7ByM4hM+XkcMA/NLbWocdRZ/KPf+vWTT7+kUA=;
        b=N56OY2GZt6RCl8Xay8skBxerD2+3HKOuHf3+70rqkEFiN2O91d58xB33wN2vatl7ke
         0IIat9DKtjY9Ds4v5BXUiEnurQcvRBcaGYUkbDTIikLGqEFZLBpEg5T8ZKZXJeSKgtKN
         OCx6nyHJRpoq1MWMkNi2SetTRGlGFzJo3Q+thx3HVKu6Jhw4ppAjWMFIqC+QjAJ3QDui
         Mg25poo5ayrOxBp0kBowYDoYeRGoE436BMVXnFqv+rXYCdTOlm9l3p1GcuJAkKrJKfrX
         paAnyoskBLyqbIDu1hS8899g1X11fE9e+ErrOSrXfXsCCOCgd82EnQzV+yRxNnbAv2GA
         G3og==
X-Forwarded-Encrypted: i=1; AL+hErF3je5Rmm5VbSSTlcMIXUaFPeMctHxiwK8x3hq9fszLapnGI5liNQPPc7Cjd2iaRt563yx9/tR2QMtOTr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pUpSD2varX7fDets5gjvsaqMjtPaZdEd5+E70Qa4mPUr+CA9D
	6z8AnEMZ2pxYNDUJWYOh//1DCPJSsEf6j4WMkt5YyK/qjFUmaHGiK8gE
X-Gm-Gg: AYBFou12i9jXQ7ghTZyuzyp1FsbEEJlhdJ2ZJSpUM/nEntXSXb/Ky9j4yHwTGf3LMVo
	1d47joohrhD5RADkPTNCbm30gK8bpgMPGOTnNOFKgQ0k9wRo8pwIJF1DDC+yzh86LBI1F6CAEky
	tti1z5ijcyQ9MfXkqMEoNM/nZL2cBjctJlod8VTXfDA1cIJPb6U71EHVTobFTTLQD5ellAx7Hhk
	T0+nqO0aXpSkRdBVlpnAXk23myBp9PIznrgMNJnzFe71GLZ767GFuPRZeTYCNbOJhSxuPGT+aN0
	Sc0bpmUUDxdanQFax3jvCkcLhq/+UW4AEH/V3gbibGEtuL2qt3nRhuaA93qwQRmbRIi+j2b75nB
	mYk7NaCAAsmm1wpXrhgxIdanZNkUuxeuW77a4JOjzPMaJSMHmKxhBHYmjz/9gr3bhKxQp51xR8k
	SClT1hD+kby03hJdWJoF0zTHBd/nXZSRhaHPM269m0wboCiv6taaR2PnUpMPMfUYe6DOHWOqTGk
	EsCNFXED+BSy7gw1L9zHKlyYkXjcYebbEf7Cvhf8KRMTRg9HxVN5Tx46WFBHIcWHSMct5We1Ttc
	YgRI1ar0spg36VziKVKiPsvEAXWTnKwpbZzAooK9QLEdnM8Z
X-Received: by 2002:a05:693c:26c9:b0:369:36c9:5848 with SMTP id 5a478bee46e88-36f76022c16mr3418743eec.12.1793969702797;
        Fri, 06 Nov 2026 04:55:02 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm6763369eec.18.2026.11.06.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:55:02 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] media: coda: fix out-of-bounds read when parsing H.264 SPS profile
Date: Fri,  6 Nov 2026 21:54:55 +0900
Message-ID: <20261106125455.2612376-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

coda_sps_parse_profile() scans the compressed OUTPUT-plane buffer
supplied by userspace via VIDIOC_QBUF for an SPS NAL unit and then reads
the profile_idc (buf[0]) and level_idc (buf[2]) that follow the NAL unit
header byte. Neither the NAL scanning helper nor the final dereferences
are bounded against the end of the payload:

  - coda_find_nal_header() dereferences *buf++ before checking buf
    against end, so it reads one byte past the payload when it is
    entered with buf == end (e.g. a zero-length or start-code-terminated
    buffer).

  - after the SPS NAL unit header byte is consumed, buf may point at or
    near the end of the payload, yet buf[0] and buf[2] are read with no
    check that three bytes are actually available, reading up to three
    bytes past the end of the payload (and past the allocation when
    bytesused == plane size).

A local user with access to /dev/videoN can trigger this by queueing a
crafted H.264 bitstream buffer ending right after an SPS start code and
NAL header byte, resulting in an out-of-bounds read (KASAN splat /
possible crash).

Rewrite coda_find_nal_header() to bound-check before each read and
never return a pointer at or past end, so the caller can always read the
NAL unit header byte it returns. After consuming that byte, verify that
profile_idc and level_idc are inside the payload before dereferencing
them.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2:
 - Move the end check into coda_find_nal_header() so it never returns a
   pointer >= end, and drop the redundant "buf >= end" check from the
   caller's SPS-search loop (per Philipp Zabel).
 - No functional change to the profile_idc/level_idc bounds check.

 drivers/media/platform/chips-media/coda/coda-h264.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-h264.c b/drivers/media/platform/chips-media/coda/coda-h264.c
--- a/drivers/media/platform/chips-media/coda/coda-h264.c
+++ b/drivers/media/platform/chips-media/coda/coda-h264.c
@@ -19,13 +19,13 @@
 {
 	u32 val = 0xffffffff;
 
-	do {
+	while (buf < end) {
 		val = val << 8 | *buf++;
-		if (buf >= end)
-			return NULL;
-	} while (val != 0x00000001);
+		if (val == 0x00000001)
+			return buf < end ? buf : NULL;
+	}
 
-	return buf;
+	return NULL;
 }
 
 int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb)
@@ -40,6 +40,13 @@
 			return -EINVAL;
 	} while ((*buf++ & 0x1f) != 0x7);
 
+	/*
+	 * profile_idc (buf[0]) and level_idc (buf[2]) must lie within the
+	 * payload before they can be dereferenced.
+	 */
+	if (end - buf < 3)
+		return -EINVAL;
+
 	ctx->params.h264_profile_idc = buf[0];
 	ctx->params.h264_level_idc = buf[2];
 
