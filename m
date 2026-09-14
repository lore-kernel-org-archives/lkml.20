Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B1142124F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380559; cv=none; b=ber2X9+Qc6qPbqzq4QEqqaNtpO7JmWt3hNQJkVQ3fj9DwKaMXCXjK1tEovMQSQfCh6ifZQJOlW8E9Twnx61GPidNTnEtqvg5LVE5UcN0Cnmpr4KDGOWAWOlhKk7latbjkWERQ0WO4xraAccztUCrboPcaIsr1RavXIv1tBn6mGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380559; c=relaxed/simple;
	bh=orZaZWZGvI1tCeE19P5a3V+UTWdeZC4NNvIK0PHV8PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxHxLRP4rk9qEbbJ0teES45MllYv45BHrfY7bFbsj4jjd5TAjpYNhEdf8Ew2ikFEuxlSXsBECZ4Sppj4FDRb6NXJ7a7fATqDy9vgbogsVx7HG0vRrOqqZDfE/9F9SjY/zky2vVxgTFB3/gEE0taNbo+4QSLAePNQyiF6pUEKrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Ujm3Wpb9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ujm3Wpb9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3105099f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789380556; x=1789985356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiDtW76OrPQle4sNBKcnEO0egtcxluIwtMmImWhO1Fg=;
        b=Ujm3Wpb9vKVRXQ7UVUt3zGe3Z9tE9l0KDjPNBvMzeuG0XLYoG1EyHijUIVV1xN+6Dt
         ibCVIth/1LR44ZNGAFi34eXsAgIqtIqCIeO7yru5EY0i1Nh5KpCKy/LpGSmQJtvS+rtP
         0lux8uLoSPylhD61f2nzAZbP5CrIRo4gRzw3g3oRJU1WN2tONcddYb0uJeChDzEkQ0XU
         8WvgKobntcVR2YA7Qr8/eh3CkxFa9WJqrjX5wcntZeznvITVXmznCLs6tHAV3oDBEvJh
         OMCKPb9wMQ3e6Mhr1bkyhSS3zh6c4p+lqGtWecIFjC2HsDmYAvzwhISsDTnPu0sIrYrf
         55JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380556; x=1789985356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KiDtW76OrPQle4sNBKcnEO0egtcxluIwtMmImWhO1Fg=;
        b=fxAt4q4lo/UVDvUlBc/9lKmWEkUgV0uIldqIEQqI7kMKNJyj5zw4/00T0TaqVAyZm9
         2qH/d3nS4BAtvRfv9FRkZ0m+Z3ns8GttlujKw8CDfm5oi/KH/fNeukm3P7zPhHieUX6z
         P3JE/nOSNN4RTAatqPD05INcr+C2x6THx3VdEqxb8FdYvejA4eaM2xEqEtxEiPSBsi+G
         xBMBmE8w+IaSdMSMyO9qxOG905bwpddOXxhDt3k86v3QnXLmdjiiW1i6KP9hqg2AQ6gx
         7WG6xdcaH8U7eDvcEjTdctrom1U+DgJF5AAE3sczdCiPz2H5bO3NZST7GxZjyS19l7T/
         RnGg==
X-Forwarded-Encrypted: i=1; AKwUvBwE/BwMsTWzCrMemqhWCcUdAtqELo/kUrA1gWs2zyzaK/H9cGLZw7YJxdZZpksfqCd6s4jizzrQCkVFcjA=@vger.kernel.org
X-Gm-Message-State: AFuF++ldtpjjJHn/+RiLBdo3ySGxnElf6D45urgRFFr2Oz9YOODSq3Rr
	mA8AJBQWbiI1x4NYEcoeOhQm7fzOSFGzNlIXVwzx2haX+l3zF19zpGOJ
X-Gm-Gg: AYBFou0k4E7GsNh8eKuy9dL0F2GqYCnzCyJfT/aBwEA9uSwvLoNousFk4K6FfhWPwv1
	oNkmWyXXEMMke69k8EUdQkQBe3XWdBIZJDSGzjVWc8V0Tx0zz/67KQukSxhCOdZtMY4BmbNBoT+
	mfHwRyjvqb1yg255yRELfLhIP4n0EfWXwN6I6nwFcTir5I8fY+jdc8mSSNjxXnncEsXLigci9TA
	9cFt7fl5cu8g82AYZUFfIQczB/l52tVbg6yecVSF5vGCMqKVs61ySQjRctPAYIPETxai64chlc0
	XJIimwNBc0NC8XN2mDwIL72oN1GSkUBX4a+lPScUtwjgOp5QiJAfuavdp30bX2DFB3AFRaBAcF8
	+tH0fGJvbpQKtjt48DiqlmugPceqWjKRvIEdAQAqHymQRShtRTKLcRHTDd9ojesf+xt/wEvzstr
	zjewSoJeBSPjMkMohOfBmpcpDmwyKGpcwrCi+W/N7jNwsS7Lh8SiBFpLxDhUBC6vq2cGz4ieXNE
	lrXE8eeeuc4PF2B/w1rH426KxEZz68Gu2RQq4E4y8XeZcmEk6/wp8tjp8UTbJJbtNi3vhAEGw==
X-Received: by 2002:a05:600c:19cf:b0:49e:73d3:78ad with SMTP id 5b1f17b1804b1-49e7a6859femr20731045e9.18.1789380555982;
        Mon, 14 Sep 2026 03:09:15 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm458381205e9.14.2026.09.14.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:09:15 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: junjie.cao@intel.com,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: hpa@redhat.com,
	regressions@leemhuis.info,
	spencer@omarchy.org,
	regnirpsj@gmail.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH v2] media: i2c: cvs: Get the wake IRQ without claiming the GPIO
Date: Mon, 14 Sep 2026 12:09:14 +0200
Message-ID: <20260914100914.230246-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913133017.624919-1-junjie.cao@intel.com>
References: <20260913133017.624919-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending here at your request, so the tag is picked up with v2. Same
test, unchanged - v2 carries the same code.

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Answering the DA16260 question you asked in the ipu-bridge thread, and
giving the tag here where it belongs.

Dell XPS 16 DA16260, INTC10E1, ov08x40, linux-ptl 7.2.3. No spk-id
conflict: all four CS35L56 amplifiers bind, no -EBUSY, audio works.

Note what that does and does not show. I am running your change, but as
a DKMS copy of drivers/media/i2c/cvs rather than a kernel build - Arch
derived configs cannot enable CONFIG_VIDEO_INTEL_CVS, exactly as you
described, so the Omarchy packaging carries the in-tree driver as a DKMS
module and applies this patch verbatim on top (omacom/omarchy-pkgs#418).
So it is a test of the patched code, not of the unpatched driver on this
model - I never ran that, and cannot say whether the DA16260 would have
hit the conflict without it.

The rest of your analysis matches what I see. With vision-drivers gated
out and the in-tree driver bound, the graph is as intended:

  intel_cvs i2c-INTC10E1:00: Quirks: 0x7a (VID:0x06cb PID:0x0701)
  intel_ipu7_isys: bind Intel CVS nlanes is 2 port is 0
  intel_ipu7_isys: All sensor registration completed.

"Intel CVS" sits between ov08x40 and Intel IPU7 CSI2 0 on
/dev/v4l-subdev4, the sensor enumerates and frames flow. The
manage.c:1502 WARNING from the out-of-tree module is gone too, since that
driver never had the IRQF_ONESHOT issue.

Thanks for the correction in the other thread - I had claimed there was
no in-tree CVS driver, which was wrong.

Assisted-by: Claude Code:claude-opus-5
