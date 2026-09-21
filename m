Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D64FB9D7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015510; cv=none; b=ZvOl9SYSB82XV9+zLfqy8N8r8d9RFdzU6aPLTDQnYYysHR2ceeeRCDBUhA0v6VLZ7M7AIBCEBOTLyPJ/l3HAuUBs2OYqHzYGzE5SwRNdpj7bycgk9+38IgVzjlQpWxV7RVMBQx7FQ4PeuI+gaei0tVHYOt2NwusuHG2RYE9agiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015510; c=relaxed/simple;
	bh=LqBSm3USoMc1NhaRdGxHYrJshaTcBLFmk+HruTyC934=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBJvLXrkOdB7SWqvy2FLBsYClsMWkCEHZNUAROuqLyYLtDFmG1XQuqiO4XatnIkbwH1R7eFAckqrayZgv3fubG325cDtntz/JNhAxzlnIQeqfjtqDAPDeYrblw0hUdCN/bmeKLZiz77oy3ooN8ARfNNQ+r7mUeToZemGI5Hj66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/MhIEfV; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/MhIEfV"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso29608161fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015506; x=1790620306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=Q/MhIEfVEAIBX+g61CMiTtWi+lHAdEnDOqHgS7D+Xe8W9lYBCAE6M91qFWwmXO/d6B
         KOPvAHozhSMjr5Ue8YNGrvl+w6xy4jBVelsBnOdrLlVK8FcOjmAyat+d53FfX7DBBcUE
         dKzXdyXNxdkhV2TESa5iMD1P93j7L6Txxb3R5EvZrcBuAd2FGHXwRwvsFsCAXwehjDxy
         cJKWUWw/Pjar3F8mOOKfXatvYTsZRBn5T4IjFNik4mCJVxKD1taV8B4Atxa1tqA6wBuR
         fKBv8Nvj5iBolNL2/5kMr6p4kTX+iQaCRlo/QfWTSbuy1hXBHCj+cBG06k4sWK0eNNOV
         dcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015506; x=1790620306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=mi60LOHAEbHFcdGu3o3Pc2r4Z6ExapUN7o8P+4WfBD98un/9CrSAai5TRdvYcj2d8d
         +N4fnGGOkqAdIAxL7RXYWd3LbPwyewjG+DqAlO6d3qRCo7JxmSsOXR0MDHo+JpA6bLVN
         ausEYbpZ+RuOoGbekF4iRaM3yfXMWhL2WRK1/ZhbiSuB8jVWkmoWi9fgdnMF7nqHV/E/
         DN7i9tYBmR1MZ/ZJU9+6kzh9gpqmmVn1fui2UjyJMTiN1l+YiJLx8XRG/jXbCwhhhOUY
         WkHqFIFq8jmW3WvsoVUbjxLXSywq32mFnWM9ZBNsV35dTyI67EDX+hrUHAmyUtYKl232
         zuCA==
X-Forwarded-Encrypted: i=1; AKwUvBxRD0eux/wJxsT/StbjN3oOVtTBz6UKoXAKvqZ3fkE43HHs+N7mnMINQ2C9yLD29FYbMeb5pphZuY7kBSU=@vger.kernel.org
X-Gm-Message-State: AFuF++kNKrwGmIG8wFyQ6rotu24b0BEvvzud7PN96+9pVajohKRqbCgx
	gd3Z8qccMn5kPplO8oj9SBLuicldwSKvSbvbejMHqvQynxETtr+gJtJf
X-Gm-Gg: AYBFou1w66L43uRqmjPepgn3BzaSZ3eZP88IV1U1NcUD2RnYe8yfqmz6uUtxIAosmVV
	ArHsR4qT7yGAuOzeZPHu7pXwlWSwcbhC9al6pbKO38WSLAPT7kbc+pysMTYsb51gfbNHsdt0p0r
	1Vb3N+kSxfYCiMeZfzkTr38OBPjpm12amo9A2zz7eW2Ko92semcLGXLXFCxUnVfGnIXqLYPSCoY
	M/wPg7JUi2neMPFfCwplan/unJcx3iL9BiUjwrkPosuCde99anYWFha46dsMC2q8GzRfT41WUt1
	rf5mHCG68Qk2K90u3MM3lDD4QaeRVaz8z+FaoyDI51S3FBFcX77LEiyIVXsuFcapBhBmzo5JX2R
	eXufxrvNIugIkNkeBfKFzNOn5deZIINzbhS+FXKF2OHb7oSIfldK1AjxEhXpM8jFiWyeHkzIvDE
	+qnNAcjbdrGI52MaEqx/GnI2YDR4qjYxaJvKa6mbKidsFXGIFj26aPXIa36/OEs0sbDV1xnuDRf
	GqyUxrS3xAH+dWXoICXc7pXxYs7a/KcpQSdOFqpPC1s4DjeA+lqF72Tt3guizGcnSb3aQ==
X-Received: by 2002:a2e:b889:0:b0:3a2:f233:5c6e with SMTP id 38308e7fff4ca-3a5fbe31949mr26986631fa.6.1790015505618;
        Mon, 21 Sep 2026 11:31:45 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:45 -0700 (PDT)
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
Subject: [PATCH v8 06/10] iio: core: add an accessor for scan_timestamp
Date: Mon, 21 Sep 2026 21:31:28 +0300
Message-ID: <20260921183132.233136-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921183132.233136-1-zoone.rupert@gmail.com>
References: <20260921183132.233136-1-zoone.rupert@gmail.com>
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

