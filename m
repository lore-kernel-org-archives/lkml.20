Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A9E3E7631
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191496; cv=none; b=HlcN9QXzs0kmqRH5my9YVBAPfZ7tkziXfwA+fdzDINsFoOZamz5VpUnmXCezdQVupiDuaf5n7KdvtdJ+ub1dHJrR7RIthXhpnV3Z1sCSOlB/S7zpzaUJ90pcf1FltQAfMBwkZqAYRHRn1AsrnX3hYu8D0E/jKTohkyevzEN3AAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191496; c=relaxed/simple;
	bh=9c9OuAocaCCgtCpHxNZG42iIBMJ13yG9pQl/dWI+rDk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IoJfBuidGKPRu9BvYp+zOlzAqjD9gG1UaG71QSdAoHYOKaeewsTH+MYRyDbxro90REVpZdWCdMVwiwBxPk1ftPMiBJld5+uJEqQUan9jqJJVn8/9uYFHuXCk0gPKiBBXLRzTt9GPjMyGyOTdE3SY/sfWBrlBYxU4aE+iCZRpZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qRMfJTg2; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qRMfJTg2"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso129844b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790191493; x=1790796293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WX8GeFlTKInVKU4q2TclqJUuJDXCWold0qvMqcWSxY=;
        b=qRMfJTg23fyUgmU7jxY7+RjTO4gWojpWqgx03hsLc8qf/Ia2nz1jyOG9AYm/HKAscN
         F8BbUx0G+xNHA13Wk/qLZ6j3t31kCMw+yBQ1BhME7Uds56HV3OXwe01tqFMKye2c7G0D
         +8g3dcRnlwdDg5OY3L+T6BLRs5AwHfHErIMfU8tDl8ghXN4NWHCoSkprZ+MovvxwKHuC
         v+64e5lEvcgtL/rd2f04tC9tY5NqdEwEzBcPTb+YDFvYeeZCUlEVdjWi4g6Rq/5dirK7
         VRjpjWYDMNAzRhYvkX9Aimu4fCViJh13JV2r8I/uQR4qkfuCzMjpNcRSqdLAqy+wlgKH
         jckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191493; x=1790796293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WX8GeFlTKInVKU4q2TclqJUuJDXCWold0qvMqcWSxY=;
        b=I34b91y1cCS2Z3eQeiu8aZTT20kOPqcTXBWzfl/GgS2j1lUFzGUPWMRDXnWVu6FQP+
         H8fpo3OUUlIgWVSufxZNf4GG1R+kpcsIT823L3Ihs639RAacndY6vrcIqCw41AmQe3FI
         06F19ua9hrH//OcSuxiEm2G/4uzDqw7Ni7E9SnZgQYDAx+aGbZmzgNbojoA5yi3NXf79
         jNdCE2F1Tzh87jJ2EFK8eLZoE+R/uFaS7LBsm58bwF9IsYIMV7Dv2bo3ivIoMFmx/ClV
         AIkQ/S+kXHP2gK/hQu4uZwykR8dFB3Ux5iPejKMlNgv7XUGkygZvRDlJFpFAEhUZscd6
         eAMA==
X-Forwarded-Encrypted: i=1; AKwUvBzgOg3MErUYy9HMXGEs0DNmeTrqaHh8GrXnSxr9LwChJ/SUWj5/YoGDfOjIKjtY1+VhbN098KPZEdLEUsg=@vger.kernel.org
X-Gm-Message-State: AFuF++ms2R1qUWtmPbXUelwvbJODfgroITjWm2fnGMfxF/Wtagz1Ng3U
	G+E9HNfnTiWh+6saqrMkkVAWqkFDmxbfVsHfNOuQV9LwmSy23s7CeH6R3ZP0SlWNSCSSW54oaxy
	k
X-Received: from pfbdl8.prod.google.com ([2002:a05:6a00:4908:b0:87d:d8c6:60e8])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ab03:b0:869:6440:74ba
 with SMTP id d2e1a72fcca58-87e9e3936f5mr83242b3a.18.1790191493219; Wed, 23
 Sep 2026 12:24:53 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:24:50 +0000
In-Reply-To: <20260923041630.2553973-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923041630.2553973-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923192450.3008671-1-morbo@google.com>
Subject: [PATCH v2] iio: gts-helper: add __counted_by_ptr to struct iio_gts
From: Bill Wendling <morbo@google.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The compiler attribute __counted_by_ptr can be used by KASAN and UBSAN
to detect out-of-bounds accesses to pointer fields in structs where a
corresponding element count field is available.

In "struct iio_gts", there are multiple pointer fields associated with
an element count. This patch annotates these pointer fields with
"__counted_by_ptr" to improve runtime safety:

- 'hwgain_table': counted by 'num_hwgain'
- 'itime_table': counted by 'num_itime'
- 'per_time_avail_scale_tables': counted by 'num_itime'
- 'avail_all_scales_table': counted by 'num_avail_all_scales'
- 'avail_time_tables': counted by 'num_avail_time_tables'

To ensure that the count is set correctly before any pointer is
accessed or assigned, we update "iio_init_iio_gts()" to set the counts
prior to assigning the pointers.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
v2: Remove reordering of assignments. It's not necessary as an assignment of
    the pointer isn't an access that's checked by KASAN.
---
 include/linux/iio/iio-gts-helper.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/iio/iio-gts-helper.h b/include/linux/iio/iio-gts-helper.h
index 66f830ab9b49..7e7d3396ff1a 100644
--- a/include/linux/iio/iio-gts-helper.h
+++ b/include/linux/iio/iio-gts-helper.h
@@ -58,14 +58,14 @@ struct iio_itime_sel_mul {
 
 struct iio_gts {
 	u64 max_scale;
-	const struct iio_gain_sel_pair *hwgain_table;
+	const struct iio_gain_sel_pair *hwgain_table __counted_by_ptr(num_hwgain);
 	int num_hwgain;
-	const struct iio_itime_sel_mul *itime_table;
+	const struct iio_itime_sel_mul *itime_table __counted_by_ptr(num_itime);
 	int num_itime;
-	int **per_time_avail_scale_tables;
-	int *avail_all_scales_table;
+	int **per_time_avail_scale_tables __counted_by_ptr(num_itime);
+	int *avail_all_scales_table __counted_by_ptr(num_avail_all_scales);
 	int num_avail_all_scales;
-	int *avail_time_tables;
+	int *avail_time_tables __counted_by_ptr(num_avail_time_tables);
 	int num_avail_time_tables;
 };
 
-- 
2.56.0.rc1.310.g51773c2048-goog

