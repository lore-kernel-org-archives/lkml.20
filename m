Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBF1A3166
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104509; cv=none; b=hfBlR9Q6mr88Dos2XUeFp1KuFbI9pKZTxWctBPK02KyBif9F7OKDSSx/Q1koD/eShZeMuCpfvEWuzw6PxXWbcAIamAFtkkI+ELqd/Ph0euQrMVXlk44U9Fg+qav8YlExv1yNHoZmmulbVrlnT2eo+fKI16LNA3KB9Ywy8i9VdsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104509; c=relaxed/simple;
	bh=OpmXgWq8ZDTVoehX0GIhvuMbtExpE5nV+LxDCEWTwaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1x9Srri3XmN9YRVPlXP12vK8BjJjwbSeLqX8p051AdpfzaUh9t1C3CYOGDJL6vhKWbJsCBHGoNsCrwDHH3r89fpSRyexCxRbnN94N5j2mT0BUDzcKlMgirv+3Atk4xRxB9v94gZozzT+Am7bys7Qclg/uZs1bUkgplNaPdCRgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmH4kUoA; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmH4kUoA"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bf5a1c4d9so150718eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104508; x=1790709308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4MMy3c11m09yYQkyC62fSxMbfPue+ahbcbfmx6F730=;
        b=rmH4kUoAr0DdOPq1M1M8lTibZ9LABMVoSfAhSWzrf5cagUq0BVfdM4sl2SXfPIirm0
         F3ZknxKr/D2iTA2Q7+UqxjkK8BIi70XcI13QxMxO/k1B1q1UUG7psWuz74NkEb8RRXUU
         yvnrCaW7nCxXd+d4gdGfW2tN9kiFAX9WHZJqXZjrtkpD1LKxs9bUJgMcwW9V3ezC8Cv9
         TuSgBjhppcjtn6nxrjeZEfEzwsBkIUk/OItvABy+p1x+Uj0OHpKKGhsrBxg/TLT3oi5q
         zuBmbAv3S542TyQZSRbB9duV+hPvEq0ENOHGDb0dyIHLDo9QWyR3LmzSjBxxhdhws5hY
         WWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104508; x=1790709308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4MMy3c11m09yYQkyC62fSxMbfPue+ahbcbfmx6F730=;
        b=nU1k2NiGDhRGJEFxFRHRfj7VfFrx/qqUoF467sE6OlWz0y26Pkh4b54J16yHIdRSfl
         z5G1VXIZ1zWn4Zt1swMv/Q1lCmLTz4OJZPMXzCrWPxeqr3Ix6KPaKI6f9H3MHzFFYyoo
         pZN08Yg4aeblvqZSJzlX4F+/xd/fpsQoAyDMx7qhjeZa6GS3xcamQJqRE8jfa239VJ/R
         /qeRU2ZIDbdGX2EUgGpiTz9Cexn6Te4l047XJtiUlRa8dYfEkAz5TiQzKtC+Mq7TKRGW
         u2Ghrc1f5GNt8x5xBNn7krZo9Lerv5aMRQKz463ZpjAb5YCJYUNlpy3OcCJXcCv2+hHP
         qRIw==
X-Gm-Message-State: AFuF++ms5Qrqx4ROWWYPTjA1+IF8+w+23jLXBQ95/d09jJAbAg6wb96G
	MPfoCDv3uwZHC55RwgmkYQaa9qlddEqAGYZRjSTMlLWiIYXf1R0byOgD
X-Gm-Gg: AYBFou0QFsZCvPeJnmCY8ZBQ9KoUV9PvIr4Yr6HXf6czcSVyEnVcC1RRupsGGofTjE9
	s8uIQEXCLxiwnOw6APArL4jsojlcM9G7Pr3m3lN6mhKuigjnw3ylEAMQxu+XnRjR98qXZ/Iq6zr
	KH6BX+Xy4mG/mHeddhpVVmvaTfOhsCY6ID/073h8K51kRcVNWOPGWcFtrZGraxHCZszOQsY73TA
	YeC5Tk51ckcyO1zRxV7r4IGBl9eeEL5wLakBcsvlVOey/eAqNA648F9bqmmi3XIq0xUnnIdZMAc
	7cBkjSS56DG1KTF+rED7dUA69juYzv9sEU10FKhyU+0EVh0JpqQFLnTohkUQd3/Q6IRmuEEg9h2
	+Y6YJl56A4qhZWEHj5nC5xX6juk2dPl7gQ+eCqYSml0VRPCDAcuLm0bqBZ5bgK0xaxXvKrRVfL8
	yC4ld6991zubHN11nIsiFhWkfGngFlM2xIgpu/Ul8kxFtCtcWeWYcRBlHFff8/OFKKzTdQeWnfx
	mlbAiNRPw==
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr235823eec.28.1790104507377;
        Tue, 22 Sep 2026 12:15:07 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm310518eec.25.2026.09.22.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:15:06 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH 0/2] remoteproc: Add ti_sci_dev_ops abstraction
Date: Wed, 23 Sep 2026 00:44:51 +0530
Message-ID: <20260922191453.324983-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
in the driver code, this abstracts the property read of
"ti,sci-dev-id" and the function pointers supported by
ti_sci_dev_ops such as is_on, get_device and put_device.

The goal of the patch is to maintain a single source
of origin for all ti_sci_dev_ops call sites. Any stray calls
to any dev_ops function pointer members in driver code should
eventually be abstracted through this header.

The second patch abstracts certain device ops' firmware logic 
even further (such as get_device/put_device) via pm_runtime.

Siddharth Karanam (2):
  remoteproc: Add ti_sci_dev_ops abstraction
  remoteproc: k3: Abstract ti_sci_handle's dev_ops calls through
    pm_runtime

 drivers/remoteproc/ti_k3_common.c         | 16 ++--
 drivers/remoteproc/ti_k3_common.h         |  4 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 ++++------
 drivers/remoteproc/ti_sci_dev.h           | 89 +++++++++++++++++++++++
 6 files changed, 127 insertions(+), 49 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_dev.h

-- 
2.55.0

