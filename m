Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE74E8E19
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734339; cv=none; b=UdmO5XEz2xs4rjtV6cOZYaYq+pj/QU358i+i0XdkCMYeMHa2kPxVUQFOcv9+WYQIqTl8MRTN3SMUZLVmd6cQHw9lq3FGBqJrvVSu6XeXcZF5AqpkrvTEBxpZbIhW6TtXXRBWS8BlC65w8wQj4VMaVK8iF6GvY3ng/+/uUogOuDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734339; c=relaxed/simple;
	bh=LqBSm3USoMc1NhaRdGxHYrJshaTcBLFmk+HruTyC934=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFtCPLXBVMaze6MJqdTgWR6IX+63QXMxrH4dI5KRSzVQQWfIXMeie+7peCteAD3D+jsmvtaT8RST8iFjcSJjPTKbBOR2tliSXyReHgk05hyp8tgAsuJF7pd4+wV/FZxGtf6ITO9Tjtq4uqPKRLXdxXJ8Fi1vPTqV1bKx0uvYqzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMelwOQV; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMelwOQV"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so722945e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734325; x=1790339125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=dMelwOQVFF66kAG3ertbmXXbtBZLfsljfipx08+1qZ27yikuLRt5jGLMSz7F0BOKvF
         zxnImRUGYLq3OZkICJbYmzAGYa7J3UUNttj5dwMjx0Malmhzr9ywqho+gYEiljj7uOkI
         i2kVQaLqFaxF8YivVzhNIQ/3t0vv5wLqmjDw2g89xhWkvkPNivdbwRj0Z9sCH8gpfnm/
         1ND5pcY9U/20DOSWg+6tZfhbb+g8g3co+r0i3H2jy//Fz1iX094sA5x8F3cfXwdIe9fv
         supH57sNicCN732A89506kw/lCQ3FWzOhpAJzOzwSb2B+jbU1zsBQQroetKWrjIfaFDl
         8pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734325; x=1790339125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=ma5L8feIbPHCrbZQoVBztGhGFzBR18oBq5coI0GBvXREQi1qc+D6lmPgAj3fbAxDTo
         uIHiD6UJXq7DChmbnTcg02RTNdmyATIhXcckAcAkEHNNIaRT2DVOw/3J3oNR0DNp1QHM
         K6NPEqtNFQR5P44rgDgbzG32fJwV03XHsWsMqvXdQcWvTVjZAcyBbgq2c9zLZvLcsRAt
         MfWMb7llgYka++zPaTqinjZqqWpzBHcE/00pdHH0GhW/rEybwokPavo6HcMWmo67PX3E
         CG5GdGJ2ugzhqvaWEl3YWcP4mTE93CRXMIpGZGt6QMuKEwdBWgEt8JNwCeTE3d7B4YyQ
         RXTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI9B3kp/Qy6POaEqrMgvOBwDoraQpe0lK8akPe6Py01dss7hl8hSYBnrwxQB3EbU/ZuTWF9R89UxaGg3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mwhXRXKMzfhQqcsEjtn4ZcrHHAbdKxIL2pecpFCHaU4rYSSW+G
	zBKjdw546TJPevAkNyRktsNfF06LUomIgw4NUuB96ZhQp6gQ/okY2+Qg
X-Gm-Gg: AYBFou0j0wxn+jl7QWscYtrOBm96cFPgpg9+9jUCnjpQJGba9DGXA0QFYjoa7OZ6UZV
	pmqXZ1oPSa47bcYpoInxVcJx3kOmxcqIgU4hCxTTgA+v1IDKq2jlU3mrKjXTcJgr43Sfx26KMuL
	a4sPHn5FMFW9xXTY/FaLHlwKGQCMA0IejN5kPSkh9P1W94NH/SaZzFfkE2e6BM8ZiYcyY9a8ffA
	qpDOUrmIJASKEy3AgQoZs2nRPaa9FGFqq6wkcKlmqeQMrkUmW2T84lkq8u6xogE22zgd/Ox3PPM
	jBQBGCnO2L8N1M37nCXq/t7GMkzBTb2jo8INeXdbPQjH36/8Wa47MaM6wO4T4Jm/nSgbTJp4F3x
	B5Z9ofBvRcmWhwRTgRyIXlln9Lc3oIvJr3L3ZSAVhC+BI73RG603t0JPJMFGYHcoU35tlnMo+iV
	asOQ8dBl8Yyixeo4xyklT1HfTWK7w00KoswNAcrgnmknqfb6vhTFZkAAkbHuYNUlUWg6mZ2Bz0k
	3yNulkbDuCHTNyime5nL5JfYmjsaPKjaiVnwpW+T+YwXVo1wOtYR53BihAnMUkj4+4m8sY8KqMP
	kRcm
X-Received: by 2002:a05:6512:6894:20b0:5b8:b331:19b8 with SMTP id 2adb3069b0e04-5b8c184e382mr435418e87.38.1789734325210;
        Fri, 18 Sep 2026 05:25:25 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:24 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v7 06/10] iio: core: add an accessor for scan_timestamp
Date: Fri, 18 Sep 2026 15:25:13 +0300
Message-ID: <20260918122517.377565-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918122517.377565-1-zoone.rupert@gmail.com>
References: <20260918122517.377565-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indio_dev->scan_timestamp is __private, so a driver has no way to ask
whether the timestamp channel is in the current scan. Hide the
ACCESS_PRIVATE() behind a read-only helper, the way iio_get_masklength()
already does.

The dps310 FIFO patch later in this series is the first user: that
hardware does not timestamp entries, so it refuses a buffer with the
timestamp channel enabled.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 include/linux/iio/iio.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 989c1db8fb36..a893e36be988 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -1083,6 +1083,15 @@ static inline unsigned int iio_get_masklength(const struct iio_dev *indio_dev)
 	return ACCESS_PRIVATE(indio_dev, masklength);
 }
 
+/**
+ * iio_scan_timestamp_enabled - Is the timestamp channel in the current scan
+ * @indio_dev: the IIO device to check
+ */
+static inline bool iio_scan_timestamp_enabled(const struct iio_dev *indio_dev)
+{
+	return ACCESS_PRIVATE(indio_dev, scan_timestamp);
+}
+
 int iio_active_scan_mask_index(struct iio_dev *indio_dev);
 
 /**
-- 
2.43.0

