Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C30376BC1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258827; cv=none; b=RAcFrerqiGR+9AX5rpYNO2Gt29xU48pRI1jUh8NumtgrFP/ZiD6MLXcDwfrVtJVuD5ho/+eAn2Mf+4tO+IoWdJwA5Xe0XIV71zG1zCnGEJcnEtUgOv7REAyD5Aym6hhcU1QEo4n9DCXzUZVp4Ee5JeNJ3ntaC8PO2duL0XZdKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258827; c=relaxed/simple;
	bh=GC6+lg7Gi2oM3B60HChdLke11qcKRYNxpaj36DtcwJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S5GjBTgY9iUOa5T88dYjrXPy1SPK/f4yEtLUL7bunxAYy1MdEtoFZqKZ/vCpFAURv/ph7pKVch0b8V858lyRD9JUAE7dhhNFoiAMl5ykpC5hjO10qaKZyKn380ASPoxRdeGhnnYPGxRvf/DJaAI53+wZwdVMktALBvIGD8YSlm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhCUVUYS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhCUVUYS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso12006895e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790258825; x=1790863625; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h4+moVG7ALNUHSWlTD3Rr/Ll9jrIrLEWhCFkgg7SYzk=;
        b=LhCUVUYSPeZH+cNDphxOsZY/J1K4tXqfTxOR17XGWUQCi2wMJ6o44O4MyChpS6heOl
         Mc4Wtg0Osx5W3MVWRImmWRfN+knhalJ8mDRK3arUSMG4VyqIAb6NGhZy5XyOU5tpq/Xq
         BE47J3WPXYd5bZ3OM/Nw1k2jLZURNddcJWRPz+h8X0yr0LT1CR93vUetrEFT69F7HwjB
         f3BBlfERuoGPDHJ2l/he5CBC6/dHCRDNTifRYQOXWManOV/wINKXPNbyVdAdFhgfnQzd
         5q2sfn+/57TcFfNVQDzrAD4WHsaVoM+gx9o3h/ow0KDvMMl2q0LaucoAK/V9qcr9Ia4g
         Lluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258825; x=1790863625;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h4+moVG7ALNUHSWlTD3Rr/Ll9jrIrLEWhCFkgg7SYzk=;
        b=zgI2cmL5JEcnsnzXD1tdYxrvDGypqa5UI7QCGu8Ki+SZ+HYvwmiulGihGgIyYxxhLw
         sbbQr7PCgN/wbioErr/CH7jQT7jMC2XEOaBdrQpFqy9lFMntvEuJyY+PPNxBuOlusuCG
         APP37G84/IB/+X8SSQtDVKl4YDEJQ8LjfRbzOZ0MJoCEe5431le0lWSwJYswxEof34PO
         HdrRT0clmGZENHs+8y74IXWsSNN14LQvAIeX80Lbqm9CP0BFpDjD993oTGYBNzmsjZ95
         KOBihLZ7jW6tYbjCTvxie/BVlflvtNfIodzsLnlTdkDusg19sHTq4TP4BRPNNervgqpJ
         JE1A==
X-Forwarded-Encrypted: i=1; AKwUvBxPZxRMz+icIciy/fb/IuEF/6sOI56u1VxTtFkOi+QNQ79GEfF7S4CdpXmkeXfWY7WiE3FAGZ2w29a3Ibk=@vger.kernel.org
X-Gm-Message-State: AFuF++nUfAFZhjrcJ2ZCWstbGuTzJQhZJE6XiE3nUra9MAODXANexcUb
	lSwN1MQWl1nD9hRCgpqHepwht/OUCis3FJeQsTIPJSbvdjRFOhO0Grr3mxv3gyp+
X-Gm-Gg: AYBFou3A2h/cMJl+WzBj+v+FlnNLqRG+5NfpeUrJsO9w1VKKd/TuJbEnjh+K5ndo84Z
	mOykd3xnEXuEUFlYgBmnwNBaMhGxGGlilE9I2LBQFXyg8KDJPpBCttovaNkuZnNbg7bLRTl4agG
	yP99qML6qbaAYp/Po4SwDMW06diF+wnUb7zAP/AbdpK05lBAHkb7W6EValWs0O4LGiC3gocCjxe
	8GGbb6aDs4DuhsKo46bqsxVUrTjDJYM2reF5F+R2735R7rQ0mXK3IvDI8LRPDI3DIBbaj5k3fke
	f92d85T+j/dS8wGwBLU3QWpZqYDfK7quLwJv30UOFUAztE9LX/+qZRPq7H6lqEdsXj0vX++YIZA
	WIrAShf3pTLPOi9QdkJVEVIbWYXEVYX6+L58SeBX7u0Ln05CM+tTNGOXlQOQD94uH8UNF6WHA9t
	jAxgdBNlEGUfYPWV/9B8+uZBAkn42sS0l2oPGq5dQ1t+yHio3uc/Cc33b1j/VXVkEJjk6B3kvGi
	O7GrGx0OL71qPmX1M8bKx0k8JTwJgdbbAalJaW1d6911RJjdObnKsrsJVy5FngZWc+aEmqRw8b4
	PQ==
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr45428675e9.0.1790258824470;
        Thu, 24 Sep 2026 07:07:04 -0700 (PDT)
Received: from [127.0.0.2] (0xd461ec5f.inet.dsl.telianet.dk. [212.97.236.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5e07bdcsm64234815e9.15.2026.09.24.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:07:03 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Thu, 24 Sep 2026 16:06:58 +0200
Subject: [PATCH v2] rnull: configfs: add power to configfs features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-upstream-v7-3-rc3-v2-1-ca56ae7a73e9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIEutWoC/32Nyw6CMBBFf4XM2jFtiWBd+R+GRR8DjJFHWmg0h
 H8XcO/yJOeeu0CkwBThli0QKHHkod9AnTJwrekbQvYbgxKqEFqWOI9xCmQ6TCXmGFyOwttLobU
 3Nhew7cZANb+P5qP6cZztk9y0h3aj5TgN4XOcJrl7//pJokQvbKGEra/K6XvTGX6d3dBBta7rF
 +c8mxXEAAAA
X-Change-ID: 20260917-upstream-v7-3-rc3-0db5699dab30
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Malte Wechter <maltewechter@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790258821; l=1634;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=GC6+lg7Gi2oM3B60HChdLke11qcKRYNxpaj36DtcwJE=;
 b=HBkxMA+FpFwazc6nsQOIkIwjEP66uRgwrFErgqQgHY2Vz3ZG7kCoducPa1Tbgc0gFq/lIGEAB
 ZU0B2/mbhfpAO3hE8VMtY5FCL6iw2ib8J9d3ZOOAMLzcmhll38DV8Bz
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

features displayed by configfs for rnull was inconsistent with the
actual features available. This correctly exposes `power` as a feature,
which is also consistent with the C null_blk driver.

Fixes: d969d504bc13 ("rnull: enable configuration via `configfs`")

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
Changes in v2:
- Add fixes tag
- Link to v1: https://patch.msgid.link/20260917-upstream-v7-3-rc3-v1-1-d0b620bf82c9@gmail.com

To: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
To: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-block@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/block/rnull/configfs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 32c10c3f4d0fd7..5f1cdd54cf48aa 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -35,7 +35,7 @@ impl AttributeOperations<0> for Config {
 
     fn show(_this: &Config, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
         let mut writer = kernel::str::Formatter::new(page);
-        writer.write_str("blocksize,size,rotational,irqmode\n")?;
+        writer.write_str("blocksize,size,rotational,irqmode,power\n")?;
         Ok(writer.bytes_written())
     }
 }

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-upstream-v7-3-rc3-0db5699dab30

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

