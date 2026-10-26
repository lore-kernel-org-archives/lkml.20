Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057566;
	b=Tj9yC3kOJgAq0O2veZF5DbQAswX9crbw4zwtSgiLKPjRo8qNs+KFE6JfGfxDflvbbBRZ
	 9jwqdcLx8LU+uQeYtwqQzgIx+0kOmfQPD/1P4Ej9IsF65ALi5GZEd+gsnc2akBAhisjCV
	 5cVYZPbA58wVU96uUkONxZ1ZTMBickqF4/xEa70zf/UOrMhNeB8PJhi7H70ic+Ya6uVcp
	 z4VlaJob5XxsrRVuyu3g7AOJ2AZ2kSrMgn8xiFtSjpMdBjgBg19V2JNj9/5bNDbGjXg8R
	 Y4QbTzyTJYdwaFabCSaCkyafkANdp8GA2Inx6L3VyTE1dK+NCHIXgYRVaJgLmniHE2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057566;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ju5egIW1HkM0SpaW3m5xxsqyY5qcSkwEB6DdjxPcN0k=;
	b=1DFIvgj4IWEol8gf010ACLWv+Ie2NXlm+9zz6RBImr4g7mj1yov3Qh40IFr8ke2vPcIA
	 1pXlEIOe1kJ5+FhN6WQYrDq0FTqEp7LGeeX/7V4nKLBTQBl/lyYAShuUbZyvwf5kIG35m
	 2FuV6AN9mGNdOZMfLvbxltVJPwfEH9fuIBvzxlFVGhqx/4MsSUrg+BG+4VVTS89tf0zjg
	 SKrHLVSPUFjkol6WV36Dd99kvblAO5T0cVD11a4mlPX1A69p6TQnh1pkvIlaslPhT0hne
	 n00uR8wuvvPA+VOoQ5DvtERENC7sUAYDuGQiph5+gjYgWQ1CW+LhVgx29+kBL9ybC4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TsxxmQ0o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B422606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TsxxmQ0o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10C71F01828;
	Mon, 26 Oct 2026 23:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057566;
	bh=Ju5egIW1HkM0SpaW3m5xxsqyY5qcSkwEB6DdjxPcN0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TsxxmQ0oQk6Y1YviYOCVvBHoR7CjzrPvy2+khHGCKpOppb8WX0ZbbGFfOZnGWx12L
	 iXsnQMdw3WaeZ1rGprYK7QIFnFG9+cRQZIS85/vTejGg0tIIHTL+w2mUhHpzcK6sIh
	 ZuzhCPoBF6X2mQUukX8T+XDaJRTpy4r2/I/AEjk4jDl8c9qzbmK7wb3eIvmyUJFgUx
	 OI99l04ZIXEXA/s/l1eIZ+y37te5FEcmGfIXRkpcvRBoga/qj1kQmOOePqWxHv+qHT
	 adCw7QeX5dcUiRm1+lJXu0Mj6AnYQS7V7dfTg8nWuhsrwEYqeQXSNN4DwSCoA+/Il7
	 w4Q6MwZ0LZcMw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 26 Oct 2026 23:32:07 +0000
Subject: [PATCH 1/2] regcache: Validate bounds of regcache drop requests
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-regmap-drop-region-min-max-v1-1-2c28637ede23@kernel.org>
References: <20261026-regmap-drop-region-min-max-v1-0-2c28637ede23@kernel.org>
In-Reply-To: <20261026-regmap-drop-region-min-max-v1-0-2c28637ede23@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KfigzHps7T7UU2oX9UE3UU8zIs4BXXUN8WnppPsYlow=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuP5Z4d3pDlzR3P7OTK1cEp+LTZSe4Y9cucXow55uVl
 xHjWX7RjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEykfRMjwwqV4gscVgohLWLt
 /AwTNt7Kvi5WLvGkXNJqxW4WBVtGMYb/YYryYSqcE55mBfWY8okGx1yUupJdli22Zd6XX107y24
 wAAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

It is not valid for a caller to try to drop a range of registers from
the cache where the minimum register is greater than the maximum
register, and doing so is likely to trigger bugs in the caches.  Reject
such invalid inputs.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regcache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 774e9c9bf3c4..1447967ff00b 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -589,6 +589,9 @@ int regcache_drop_region(struct regmap *map, unsigned int min,
 
 	trace_regcache_drop_region(map, min, max);
 
+	if (min > max)
+		return -EINVAL;
+
 	return map->cache_ops->drop(map, min, max);
 }
 EXPORT_SYMBOL_GPL(regcache_drop_region);

-- 
2.47.3

