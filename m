Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE0D53A391
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076082; cv=none; b=R+CeuuXVqIVEHHRsG2t0R/NCanT/XJQqp7MPCJeC8Y6DN6+BZeZXOWzuHVZR8KiHG91k/3ZflHVL2oaXNtI7kFSvrgS4Y1JmWm6mvYi1yY1Km6+f0y9mRUkFzzvNvP8B8xmHtCUuBuITOo95APw0SluKGdzdAC8EbwvgWGiSf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076082; c=relaxed/simple;
	bh=Y4uWeAcKFyzlZCN3UfcEiuV2kPZW7IEJOqZeE2Eaysk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qKoJCf+6Y/5IE0lovzabORUdNGJZ2yhdzDmkwkG4g6l/eqIuQ9nuIA8l7q2hM4X8Rk3XYnG8hB59aL0jIASG8+nUsBsdFy63WfE3aMS6T7dkEWlOqjpUpOQhbfwz1vbA8QBWtsex4h2V9f/+N12Ba/vkZ7lTUTeCEPC5QYfA8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X7arvoHB; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X7arvoHB"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7443e0f0bso73384815ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790076075; x=1790680875; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mD51G/+ZfcKpwbBS8tKfKNcklaH8fAziFoDk3Nxasls=;
        b=X7arvoHBj71673XX3FwLv9TDFtTMn15CfcZA9NfyRoE5RPLyZsEFXvCkfwBeMwtwnx
         5UwpqVsFbaKRSJBDGlgFyfQrSjj4Iz/GDhTDGlAgKYpN0Yo5vypYpPIGNhCrkDt2VnyL
         Aqvyq9t6ORT0jnLoIvAkF69IkmcM81TJ61eU3bTrs4/GosLzfY4uPSINeM1AHR/7XU0j
         ENd7ZX8HijBx/IYKa06it+6PkTaPVDvDaRSvkWWCWXCU9VHhwPUpPNMhbyFQlw9UaNeg
         87lZSwJIFt7fj2oEwzA+F+Pr80/B2BvUzfABi/m2HHd2+MuJ7qfJ3d5I4E5QTl2FUyZj
         ECQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076075; x=1790680875;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mD51G/+ZfcKpwbBS8tKfKNcklaH8fAziFoDk3Nxasls=;
        b=cvs9z+VqJuKLMQ4jCEGwS7IiNnd/11DNeJhrCRknpC/X35XZ4gBV8rhvh0dzNFnv9x
         xFejhA0CU2uMNN+bLPb+YGCJgrIGfTWOvNki0g8zvzq6fROvthRdnri1vyh1VPYpWX2S
         OKbRrKIVSpL+KTt96W6urJpEMLuShrBCEmfBf3itL9xrCvCb02mwo6dwxqPtUQWatH43
         R3YauA8KtA9kOLT18/j/pImflbRi4WTQ7zXf77lr5uo68wkEMmXQD13nKmw/UE+Vuz5V
         lIwPhyskIE3iEVK0Rw9UQkV9ozP6fdWmTTQqT0eFfCuQG7VC/VhyEkUG3pyV/e9p5Qs8
         xbfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoRnbRAJwidvSs9ZwngcKYTayr8tK4++DyVPNbNGYaDP51UI4uaKPTzPOQiEBENlFBUyC7EL1Xp6zwZ34=@vger.kernel.org
X-Gm-Message-State: AFuF++lVpX5yKRjD6E/F5hKA6kO8a61YESCj41qlSJhsdIj8jlv4h5S6
	noCXZQm64qdBLV2A+5wVL0nCXz1RgBbDiXOryHLDblV8hjY0ZQx1P7jE+J5qhutKJIboHx7s9lZ
	6
X-Received: from plei10.prod.google.com ([2002:a17:902:e48a:b0:2df:48dd:9e68])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:46ce:b0:2dd:c100:a5e2
 with SMTP id d9443c01a7336-2df60b76a60mr9443425ad.54.1790076074505; Tue, 22
 Sep 2026 04:21:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:21:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922112111.1970872-1-morbo@google.com>
Subject: [PATCH] iio: st_sensors: add __counted_by_ptr to struct st_sensor_settings
From: Bill Wendling <morbo@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, "=?UTF-8?q?Nuno=20S=C3=A1?=" <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Annotate the "ch" pointer member of "struct st_sensor_settings" with the
"__counted_by_ptr" attribute. The elements of "ch" are counted by the
"num_ch" member in the same struct.

All instances of "struct st_sensor_settings" are defined as "static
const" arrays across the ST sensor core drivers. For pressure sensors,
"num_ch" is explicitly initialized with the size of the respective
channel array using "ARRAY_SIZE(...)" during static definition.

For accelerometer, gyroscope, and magnetometer sensors, "num_ch" is not
explicitly initialized (and thus defaults to 0). This is because those
drivers hardcode the channel count to "ST_SENSORS_NUMBER_ALL_CHANNELS"
rather than using "num_ch" from the settings struct.

Since these structures are static const, both "ch" and "num_ch" are
fully initialized at compile time and available immediately at boot
time.  The only accesses to the "ch" field of "st_sensor_settings" occur
when assigning it to "indio_dev->channels" during device probing.

Because "sensor_settings->ch" is never dereferenced or accessed as an
array, adding the "__counted_by_ptr" annotation does not cause any
runtime panics or false-positive bounds checks under KASAN or UBSAN.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/iio/common/st_sensors.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iio/common/st_sensors.h b/include/linux/iio/common/st_sensors.h
index 1ba496f0fea5..6e914ed49529 100644
--- a/include/linux/iio/common/st_sensors.h
+++ b/include/linux/iio/common/st_sensors.h
@@ -206,7 +206,7 @@ struct st_sensor_settings {
 	u8 wai;
 	u8 wai_addr;
 	char sensors_supported[ST_SENSORS_MAX_4WAI][ST_SENSORS_MAX_NAME];
-	struct iio_chan_spec *ch;
+	struct iio_chan_spec *ch __counted_by_ptr(num_ch);
 	int num_ch;
 	struct st_sensor_odr odr;
 	struct st_sensor_power pw;
-- 
2.55.0.1082.g2b9226bbc0-goog

