Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655255275BC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115004; cv=none; b=OHeWQP6PTzJqWgNybjv2QvbREXk8AvRuZCSVYzi+4DV5K+vw3r3s2ptwD1bcH/cqPBJzxqE1KNfUBeu4xq0iXliYy1B0ahS3VXPQbWWXfl99fQW/BHpWM1mEZmAgqifDiKcL8LuoC1m6na1gyT879CuWEAYlkhWxhko+WfMbCaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115004; c=relaxed/simple;
	bh=ez6IjVz1RI/L1fCWYZYoXXXQ0XI9Qbd928iUK8xMI1Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IUKaSNZU2NWQIup0Lk97fIi68UpGSBbATLTY/ei4bEvLw+7oqFJX3h6KC5KwixRes9ojgLs6TOXst8Pd6Wk9vMl+6z+TzERErsOtssOVdRGSjPepvoBpJqtO1jMXLnMtVisl+6Oc4ze9dHaBQDB8qV+ZzzJHliNw9daaH+EzuuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZFEShLIk; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZFEShLIk"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso333267a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790114995; x=1790719795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KStyCSuaz3JtzFB2fu+E5KRM99Ww/CsJLkB3+qyDWQQ=;
        b=ZFEShLIklW2uaYI1n48ZgyRGVzncIirE2wgnHGk8iCVnSkhRA6CCdbPMhc095f6VQG
         tOX5cz62CYTeX5z0E0Cmdxc90iFqmNr5AZJBf9GNO6ZP0n9wgoD1fZKrBNs/mQXyGltM
         LDGD29YsmTuQrHRL9OBQlfb2UJWPgLnnwduPhxaTXX+EWPJ4sUait/BMxZLWsWXgRvKe
         t43INopmIdlgor363W0arXYzfdiZB0Mnf/ygJuQtw/rNu1dSKxvQiEqkG23U3jVvgkSe
         vHDJ3agZBqCrCBeYIJCA4Xva3oSc2IvKKyGjuZ3aJqH11YVWpBnSM58BMcSw0w1GTC+Q
         bKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790114995; x=1790719795;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KStyCSuaz3JtzFB2fu+E5KRM99Ww/CsJLkB3+qyDWQQ=;
        b=MW1OgiezlLxy7HLBo2xMx6vkOqovnr6pSUxaVlQ3IbE+mHiSGtDdqN6SphtHpHtFX6
         TadEfDRksGhSSX4loQ4OqFwtUAHgaNbaOhlC0lQtZ9LzWtIMyeW2ojCBd6iDoi6Jft6O
         iI2S4CKdfM/RNSAHE3f3MemRTvfoXVZH6sKgkIYwZGbHgTQ4zp+WjevJ4WJSAf0a7Ig1
         nPWDDLmnwuQZO7Wfe6riCkzVfKwuTww4M3Pj9qS45fWFdpJGFX3hYbiqMaLVhK6dcHGZ
         I4effUtrZ+saD6VcToTuV7pQZRHQDQ+/ilKH6jk6JPuy0nKqlNgvCR9gTEfiiknF14Le
         kEZw==
X-Forwarded-Encrypted: i=1; AKwUvBz5OH+wle+DW96ToMfv1aN3BWyKxG2N7/k+qqEBqtN7K72X3RV/Ax1GaSWje9hkxWuswDmec6JWuZIv9y4=@vger.kernel.org
X-Gm-Message-State: AFuF++mxE7UUx+6PzwvS2qdhIN0NVWqkIOSxcRIFQxb/MehCsufppQVJ
	6o6blm6GvZV6EPG1d3SeY0401x/EyzuQWp0oqBIiXl/xk0JFvwO1wzhtOWxwl9zien49momeJZC
	o
X-Received: from pgbcn9.prod.google.com ([2002:a05:6a02:a89:b0:cbe:e432:1cc2])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d8e:b0:38e:fea2:df53
 with SMTP id 98e67ed59e1d1-3a07e5adc58mr635171a91.4.1790114994291; Tue, 22
 Sep 2026 15:09:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 22:09:50 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922220950.2267270-1-morbo@google.com>
Subject: [PATCH] iio: adc: qcom-adc5-gen3: Annotate struct adc5_device_data
 with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Under compiler-supported bounds checking (via KASAN or UBSAN), pointer
fields inside structures can be annotated with the '__counted_by_ptr'
attribute to specify which field in the same structure holds the element
count. This enables the compiler to perform runtime bounds checking on
the pointer.

Annotate the "base" pointer field in "struct adc5_device_data" with the
"__counted_by_ptr" attribute pointing to "num_sdams". The number of
SDAMs is determined from the device property and assigned to "num_sdams"
which is then used to initialize "base" via "devm_kcalloc".

By ensuring "num_sdams" is set to the correct element count prior to
the "base" pointer allocation, and since the size of "base" is never
reallocated or changed, this annotation is safe and will not cause any
false-positive runtime bounds check panics or KASAN issues.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index 39cbfcbdb101..b3e2c2f50e8f 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -137,7 +137,7 @@ struct adc5_sdam_data {
  */
 struct adc5_device_data {
 	struct regmap *regmap;
-	struct adc5_sdam_data *base;
+	struct adc5_sdam_data *base __counted_by_ptr(num_sdams);
 	int num_sdams;
 };
 
-- 
2.55.0.1082.g2b9226bbc0-goog

