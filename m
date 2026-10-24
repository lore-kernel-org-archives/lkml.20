Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858618;
	b=45VucqUWI09EVnooJoO1Me2QyrVCjokhAyTCnedlgpER/EiJJe9YNI1ie92nVrhAd/cQ
	 zqip88Dj3SU/2Z31dHsUzTE9AhasXTMOVshRKxHzfYNsPdvf7y9R19H98ocsSOQiXaTvk
	 FUFnP5rGkDBuuCyiL1pz7gL002n1Rp9/QLUBgNMHb99RVeXfRJt7zLhdGKUlh0UCX3Gve
	 5edQyH7st7uXKAouxytQ+h6W3qSU3rGA0OtXnLPwscyDcZeuczI2SdjQ6H9Sta/5r2BJF
	 yvlS+ZkyM3LeN0PCmmj+Dc87K8coVo3dgavZNobeSfrXYITVzHJe5laYvxiBaejXdxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AOGWZcrBZoO7CPXaiikuuyaqjGZKSk1gc081ebM1RZM=;
	b=DGMd+wPNnix0EJXx0S/ibQPxb28BPx8+W6SGNSgah8WtKmCB/M6z26TbpkRUifgFqrPO
	 A2CrWEKPuDv4QwpzGiRmqBN3cWM+uhkEDIG6xdOvJ6699GOoYyip6iBigypRdYtzA/Iqt
	 PHi5S3ql5JxXx9n8Qo2HZMkIue97gQVI/8WD1PxpYLkU48p/4DuDLIRCO+L/XHKEw0Lpa
	 EiNmAl+XwIIQIpx8VVbKWiTk/DNGesS+Q2zZ53kTYLBMCWuYWyzdTpQRmkN+E2y/eiwKf
	 4FNlzK6lKKIAuhqywO+Mqm5RT2P4V/8n9bw7TdWr1vAbjYGhRic+vqvK74xxTFC0pvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=asseily.com;
	spf=pass smtp.mailfrom=asseily.com;
	dkim=pass header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=RAaYSvon;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75965606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75965606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asseily.com header.i=@asseily.com header.a=rsa-sha256 header.s=google header.b=RAaYSvon
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso20788275e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1792858616; x=1793463416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOGWZcrBZoO7CPXaiikuuyaqjGZKSk1gc081ebM1RZM=;
        b=RAaYSvonR4qouJog0CyJbGB6T9+L01g1zbd3cM6gD7yyOlhk1jwBHBZdcBxdGiV5a2
         +Hn6UnzguUG8Dy99BTUnBcOa5rC3EU7VuULinOizOgqi9vHwRLP6f/RBxmc2Wm3gru8z
         hE3PFyKIElmCEdx5WIpTfkBupROGoujMgEgiDPSdNQ7gbwB3jQwTevLS57vhf+UW4ipJ
         BKOY449szzRt0o39Z+wP8M2ueSrkWrP2C2hmWGdLYaoKBJPInR1ba4SPneW6w3jwqPJK
         zHEQAhtuWRToLILi5qKy6qdER5gBCvAW7NnVq1ZhKtAbAgBcZn2qkZh5T0YTAZH0FaI+
         pjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858616; x=1793463416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOGWZcrBZoO7CPXaiikuuyaqjGZKSk1gc081ebM1RZM=;
        b=OyV6yIiceOPMVdn+eDcIdISa4PEXCMyxwhEsAvy8xnAQda7JQksLTuaoW4P3le7K21
         bPj/0uB6oI9faJEekff2u5N5PSmDuWxZv/80bhJYl/WYFfK8mDRTabqSxatd6f8aKvMh
         NSKgmDgdYBC8NM9A7hhTnYmbQtQzCS1fAvnHh8XjOylPIq5tkIwqlvpIxCOjRgVN/mPh
         DVZ5iJERTiWSHzZLEoMcoya4C62vijPONiXsw7NPtbNJtBcnRN4TfabNN9xDMciZBaNy
         q183MFhOGDZ/fT5AsjVQDcR61jV6DOT4kn5f+5uDh5+YQi7ZBHM4cYUHOBxZi7pnpY8P
         M6fA==
X-Forwarded-Encrypted: i=1; AKwUvBxPcOqO7ZaEdi2RGJ72y4OO2VVyDvdcVzdh32NkvXZaJONuXVq18zU2r0oxJRH/zHfP6eHwyCSU5o8nxAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYSJ4tXj+fZGneNyR+xhXm42w+ZcLlXSkXdvAeuKLfNx1EkEKx
	9DplQvZLuEUUNkRBjXpvNzy2MR/e0oMy0mK8qscj3681kvCTF0xVSr5lUvL46rM9UDQ=
X-Gm-Gg: AYBFou0ODPqURHsaSAnl9uNEiqY+Uz66Ftusu8pjAibfRw09+AUNqhM3xFdcJR5svPJ
	CkFCf2sJCUaGfBqyUpNn4V8PMLWNjBlJ7BBD3S4xg9NPJqJNJCvaH3z1lB7wZXQCAfbOfpdJWIC
	BtsJxBlxEOok4H42D5AK+MkCnXQA9i/JP3jNtcyz0dFpcimW8HNWf4Y0C8Nsx40LDQ7ZaGu2eKj
	oDVW9pWoONGcvou96NkOx23TYDYTlFZFGp0lBeap1KyS89Qsk8AXXqmczSLXYFhN7GK/AnGnawK
	zcs1qll81g4LBwJiLKJpdpWtix/Sg4ClmcDE+2X/jiWD4JLvgKxCr0vP5wl9ZMUXwzdfeDD14X0
	Nuv/CQcld1UEaSJXxZUq0xZM+ZcuP6HPEL+TaVw6F9uwAiLbugFC3zOkfQSIkOIwZY9oGqi8mxa
	fiyKhu12HcONMlqSDIiGDP0STK+C/8RFwciOJDEEuKbkCDJr058fpH07ILJPi/WR1oDcGkcG3C8
	X8JLxGZidn9xu2lD+OiLe2NWAepfw7Rjt+Xw4fUMM0AoKFJBauZY0ugWKCOuqYRn+v6ZA==
X-Received: by 2002:a05:600c:4688:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a35aca5a1amr34062485e9.22.1792858615676;
        Sat, 24 Oct 2026 09:16:55 -0700 (PDT)
Received: from localhost.localdomain ([178.135.21.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm78516845e9.1.2026.10.24.09.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:16:55 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH] ASoC: es9039q2m: Document the FIR coefficient payload format
Date: Sat, 24 Oct 2026 19:16:34 +0300
Message-ID: <20261024161635.12956-1-karl@asseily.com>
X-Mailer: git-send-email 2.47.3
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

The programmable FIR controls are TLV byte controls whose payload is the
raw coefficient data, with no type/length header. Nothing in the driver
says so, and the in-tree precedents differ - wm_adsp takes raw data, SOF
expects a header of its own - so user space is left to guess.

The driver cannot catch a wrong guess either.
snd_soc_bytes_tlv_callback() clamps the byte count to .max before
calling .put, and .max is exactly the size es9039_fir_put() checks for,
so an over-long write with a header in front is cut to a valid length
and loads the header as the first taps.

Document the format at the control definition. No functional change.

Link: https://lore.kernel.org/all/CA+gvwbqrav5C9e=9Jx1i31nrEZGDko73tAAhGzzexeRa1f72LQ@mail.gmail.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---
 sound/soc/codecs/es9039q2m.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/es9039q2m.c b/sound/soc/codecs/es9039q2m.c
index 4e9f86cb7..bf206bf95 100644
--- a/sound/soc/codecs/es9039q2m.c
+++ b/sound/soc/codecs/es9039q2m.c
@@ -632,6 +632,20 @@ static struct es9039_fir_ctl es9039_fir4x = {
 	.stage_4x = true,
 };
 
+/*
+ * The FIR coefficient controls take raw coefficients and nothing else:
+ * tlv[] carries taps * ES9039_COEFF_BYTES bytes with no type/length header.
+ * snd_soc_bytes_tlv_callback() passes the user pointer to .put unchanged,
+ * so a header would be loaded as coefficients. wm_adsp uses the same
+ * convention and SOF embeds a header of its own, so the choice is stated
+ * here rather than left to be inferred.
+ *
+ * The driver cannot enforce it. The callback clamps the count it passes on
+ * to .max, which is exactly taps * ES9039_COEFF_BYTES, so the size check in
+ * es9039_fir_put() can only reject a short write. An over-long one - a
+ * header followed by a full coefficient set - arrives truncated to .max,
+ * passes the check, and loads the header words as the first taps.
+ */
 #define ES9039_FIR(xname, xctl)						\
 {									\
 	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
-- 
2.47.3

