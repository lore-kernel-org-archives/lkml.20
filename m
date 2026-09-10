Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212A42A144
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074902; cv=none; b=jETZLI5HwjBwAnx8h9YdW/lQNloujtaIROoKiTm4FLyfAaLCH0cwqko6P1yyzNJpVrKQ/7blnA+wWZAZn5VHJcg+DqCToo7NHH++mszta9zQhwfe+Qsi7u4C4shbUHup5KaSY8mVZcLYsny4FIEeaGVuM5P9X3Xoud1/emQJ84M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074902; c=relaxed/simple;
	bh=oco3EQSldSQddBQlm8Qmhp6JJwlywX+YHfTrmsrsHkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lx9TGZuntSyspsUtgof4VFTlr0ft06WPr1H+tS8uxjkNRtrk9LHuyVL2ywsPEGFohODH//1X7AMnRfF/NdM3WMaT3bNC4fZufOvYpzOIzMHTgfgCTVaPO7mu/EHHpDKgzl1vhpF4z/96521hCddq9hIius3s7eVN5G0q0peC3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bjEhUQXY; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bjEhUQXY"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4c18e5e9745so236975b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789074885; x=1789679685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcroCnoY8IYvdQg62Y2Lq302IyLGTvPMvxJQS19q0o0=;
        b=bjEhUQXYFJhxC0wuBGuak6QkGAWrC/KZTvdoNPQC/K2vXOACyamcp6ZeGzqMgQGy7i
         yzMcqjzhdbtB8OP6b1efUZ+D1/MYRTxXrEA9laC9Maw+H0v3qks2N0bYmnfVLS9P7J3o
         WNZ3M2VF+EF+P/yt0EaIPdpPQUHREJKMxxOcEcm1YZ7WHgeSFJ7+CC+RbB6DCBLBLPgW
         ayYGOIwaMjpdVDiBScbfrTZUpWPqOKiTkVQ/9RIrWUlZjkdjoY9me1I8O5tefBSAKRXA
         lh+ZVpSlXxsAq7EjKdpiV6tRSxAkmb809ILyykY4QxMFz+7z03XdphL8ny9MKv1YCIay
         918w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074885; x=1789679685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcroCnoY8IYvdQg62Y2Lq302IyLGTvPMvxJQS19q0o0=;
        b=MIAyrY2MFJlIDisEdPeQIEe8gExD9nhBbbECpC2Xm1Z1D6Tyym8Aki8aESwWE73qHM
         r611ZzaDT7e1exhucRmCrt1tgRj5sgWgFw5oWWfsswhiH7STi7Aw7V4poNdqcXF791bH
         cqy6LsYmlbV0IUpIep2ITXe9uxnzrF64+oXFWWiB8fz1cMfxOyaiOJwUluqVxfc0kxS3
         9AkGw1kfFN2A0bjZ3ARC62UzIxL6NzOFLh32TEqRt6OznX5pxFOhN5K5B6pZRd2w4xYF
         qdkmV2RcFUyrM1qYuIh7SXx0MtK4mu9fA3K7qMMYxEwpnLslLA6xhC/BJoLNEukOdNkY
         GpUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz/++MMScUnacOa8SK6EbYodCK4Su2qYUGc5uWm/8rMqztaa4lYR6cF1KFupVL8hxwSvrT9YEofjayt2s=@vger.kernel.org
X-Gm-Message-State: AFuF++lGBRmZVlx4jUztiziRZqt3HEALfH5GshQC85cAdxB53OIGy8Ks
	aZG3kCE3ugOmo24h9IRtlKWal0j1Jtzx5SV6T2n3x8/ipFSdJ3u8HhblvxQL9d13TLYuE9x6600
	+sf1d
X-Gm-Gg: AYBFou0AGq536YtHNGFZPIIS8NXXvdN0DxNPLzU1nWYPSFpKzvlR3BRfzcNf71HBfAR
	vGvjVeKxEiNmVI1BDZxSS2z0/PtZBDzkjAc1cOp1/i7A+SbhAsbH2x0SAzFCBRLFI8dj0Vshh4W
	0isn97X9F8+07Y0Iy5rjdp/f8Kr53nY5ipDzHvNSO1Svu+DXJaKAP72aFN8/WT2g2NeOjvgneE8
	UoFiMwTr2TZCJVg9GD1veC+9ITGXUvvxR6eow7tvNz9DJrI1J6z/Ldl7VGEa/hPSN4QM6vV3fWe
	mrpeniUDbAq19IjfT2Ddxnabus7246B3Edycsb3LTQCBhop8953BmzZa4oPnsLSB140yHJzdyoG
	SmVBwl8ZzSgabjBhcPHNc73E6fI9J92J3A8ewl6L/8mGXhNUmCkTQZKkzjEAsjju4SepX6XsJyK
	ERT3eFJYoFS8bxFFXPpdr7ry6lclS2DGeaE/qUmleSLVo9jzxfkWw2H1P33N0b0kHIwHCyJOkpg
	SIm
X-Received: by 2002:a05:6808:1784:b0:4b9:e5fa:8a24 with SMTP id 5614622812f47-4c31c61d3f9mr849699b6e.41.1789074885486;
        Thu, 10 Sep 2026 14:14:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:fbf1:d0da:69e0:11a0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330daa42esm347315b6e.4.2026.09.10.14.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:14:45 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 10 Sep 2026 16:13:09 -0500
Subject: [PATCH v3 10/10] iio: ABI: add settlingtime attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-iio-adc-ti-ads112c14-filter-support-v3-10-e5a9b27ddb1a@baylibre.com>
References: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
In-Reply-To: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3263; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=oco3EQSldSQddBQlm8Qmhp6JJwlywX+YHfTrmsrsHkU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqox2u9xy7hKQq4y/ZNMUSyRLQFZyDbjhu/7DMF
 ntmFQ2pqf2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaqMdrgAKCRDCzCAB/wGP
 wGqXB/4poy/o1/G42PpjjK9/keZcPcGPomxyMJlvUWnGUPtqaSxpA01IOf3Z1Dro4FPelFR8KEw
 dNyzByo8st3amG4/8de2OdQ/WIB037nbnWbsJXko6RrJcDuyidZ4x5uR+PsfW444agkckR3Zda2
 2PdrTh4Lsr1uG20X3OPIQkaUV50V+lwF/+pRV1cFdWwIqUQxttZiqjclafvA+t+gFt+DVP3dzo6
 RYRQsi5CKjTg8US9rr7l9LdKb462XLCeks6rVcwQLGphcGMUykHdBeHRRTcog547dzJp1Rr7HuK
 fUdc74rWQndt7RsRuXJ8ptatZOdz1e9oMC1ZnfgZhlYn7t/o
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add new generic attributes for input settling time introduced in the
ti-ads122c14 driver.

Usually, in IIO the output data rate is 1 / sampling_frequency. There
are known devices (generally ones with filtering and oversampling) where
the first conversion takes longer than 1 / sampling_frequency to allow
the input to settle in order to have a valid conversion result. Then,
any subsequent conversions in a continuous sampling mode would be done
at the regular interval defined by 1 / sampling_frequency.

This attribute is intended to allow controlling that settling time
duration.

The total settling time is used rather than the difference between the
time needed for the first sample and subsequent samples so that it can
be read back directly via settlingtime_available without also reading
sampling_frequency to compute a delta. The available range's minimum
value represents the fixed, always-present portion of the delay (which
typically already includes the time for a normal conversion), so
requesting that minimum is equivalent to no additional settling delay.

A device that has input chopping enabled would see this settling time on
every conversion since the device setting (i.e. the input mux) changes
on every conversion.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index a8e1cb8e7490..045589058655 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2402,6 +2402,32 @@ Description:
 		Specifies which filter type apply to the channel. The possible
 		values are given by the filter_type_available attribute.
 
+What:		/sys/bus/iio/devices/iio:deviceX/in_resistanceY_settlingtime
+What:		/sys/bus/iio/devices/iio:deviceX/in_tempY_settlingtime
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_settlingtime
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY-voltageZ_settlingtime
+KernelVersion:	7.4
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Set/read total settling time in seconds for a device to settle
+		after starting the first conversion after any settings have
+		changed. The data for the conversion is outputted at the end of
+		this time.
+
+		Depending on the device and how it is used, this settling time
+		may apply to more than just the first conversion, e.g. to every
+		conversion in a single-shot conversion mode or when a device
+		setting changes after each conversion (input chopping).
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_resistanceY_settlingtime_available
+What:		/sys/bus/iio/devices/iio:deviceX/in_tempY_settlingtime_available
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_settlingtime_available
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY-voltageZ_settlingtime_available
+KernelVersion:	7.4
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Available settlingtime values in IIO range or list format.
+
 What:		/sys/.../events/in_proximity_thresh_either_runningperiod
 KernelVersion:	6.6
 Contact:	linux-iio@vger.kernel.org

-- 
2.43.0

