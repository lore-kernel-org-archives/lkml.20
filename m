Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4AC23A564
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789738; cv=none; b=fVzFOB2JEYW5/1jszM4TzndR2U8/YVj4ItMOWvz9QmbZ/Gt2leHXSrNdkr//lHta+Ciwj9u2m6vX8MO74eUG0k1scQLyep4/No3PpbrWbHIkygfUtPlgIjfg66jSKwFu1d32vRhVMy/XLsPbPjt4cwb0ID2KJ63JOjxFiKppmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789738; c=relaxed/simple;
	bh=yh5en1WXE6reEOnTQO6Ngd2bzOi+8W7uGEZ6vnCgPkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zy/kZqeReP0ttJJRubtVgx5iGsM9sLKHE7TbiLrhslFBPvQxKA/WDmJ7fOSk/OkSashXhyZnrIVee/xBtHT5EGR0LJAVxkkz00ZUHbo8a+zf36trHak+WZMlhwkU5C3516VkA5IXhVFA9/KbWRWxk0dSRvrXpO0pCrbivEFX49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNxgi2UE; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNxgi2UE"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1458779a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789736; x=1790394536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SomL1EgF1gQuj2EcXeMbEnVo0bM+gu1vUjDO33Ekojg=;
        b=BNxgi2UElZhLdjSRcp1koFvz1RYd+6bd+6ar3x9oZE9C3Y98mxLiDJbspQztNRtj2t
         yW2OVuL/ITQhIssMmLQmAGtkaWoL7xt0hNlnDsgxMmoVfOHDSWx1WvuE3R2a/kFK96k+
         XEZEFG7KCSIAjQ0I5hrN52Y6lGYLUmgQxv7Na+RvQMEOCjQ4paGF0Hs6jMgADZVj+hCx
         Z+pgfDa+LPxgno8gqH4LLsg10QHNAyA2aPNF9tfGWeq3s75SjzwHnYRpeGLDScjH6oQA
         CcgbzlOON4w3UjSag3wqUcnlIyq9j66em2Wk8AtMzX/8ut+HTsM6ndPRVaHJZKlaVum2
         XMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789736; x=1790394536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SomL1EgF1gQuj2EcXeMbEnVo0bM+gu1vUjDO33Ekojg=;
        b=hgb/6ouTpcRJCo/632H29iaA0OmGU1scq+PyYp1c/dQIuglW1pcAY4TTe4NuWMze9R
         UoLi4uqM15WEMtwW57jPc5qvi1QAUvfwbEpu7mQzwN7TE7w2sZ4/pnuZubb8Rz4/5VFz
         x8ViMPHbcsBr3dBe0J0hVUZMlOOCJ5P7MqmMN7r0F6hz0d2P2dBHvdpgWtbDiEDS0VLN
         XN7lNdrGtYOW+/IgyaRthnE76ObNHOacYvoPXvoCppviyG8W+7p+wwAabw1ILE6s8/Qs
         1lpZchkknlD09OCQ58JsM5l4UOZgLmLSqnTN+Yv1hhNQ0V+yHkgw9BLLN5gKoyU7sXa+
         jnRw==
X-Forwarded-Encrypted: i=1; AKwUvBwqrb4R3AL5SaNulW+30H40nkCTnHzI9FZY9AKlE9nbOPvowgoFG5I7VN2v2QjxnZbjbkclPTsf+Qd9reA=@vger.kernel.org
X-Gm-Message-State: AFuF++mvd77fLrgZzErqGcJwF3/gNX5WRiHlCwXfXAH7buPlrfEq5cql
	Ubd3gPXqJQer1URd16tUD0U+SDfjMdZMUX+Z+Tll4xUVGud8wmCm7Dg=
X-Gm-Gg: AYBFou0KiGU11Vv6RclEVseymBf/sDXYfbMNMpt0jO3mbRfbrMKs2cZNyX5JMz6gzi2
	qO04cz5bwwqDOD6PPuvHHjxq7CRq+GK/iaQndm82YQRSD7qvMAik9gkoEKKKVhG3Bd/mA113z8a
	KpGeOg1L90uR0L+xbMhforDmXpdJF1GEMOqTokF9ubmL0aRgeUFOvGLxSEdDqjaz0BKB2IHHk3k
	tSksnX2fOqVfC2JpuoDhEG4oWkuV6V4d2B5bCrT7HfFZDgnJ2Hnc1T6mat+z/QD7BDu+KGh0biR
	m1Ezw0Msp7jQl4q2vdoiqafkQ/Fv/3JEHNdERxJ0d6PBlHzzDxSgPQPuLJm1smxYxTsZ3rPAAg0
	g4aX/Dy2oOiLzOI4gS6al6czSiiYxCKSI+ISiVteVRaKLikFjQLwFQnkLHs4hdRBwgIqwnuOeV4
	nXWg/+p20MWgSM0ZUsjLzGSm9EJl0HuTIUBd9vrpIlbLz4bMmoYHVhM3H2BgK1pWmEET65pERRI
	R/CGHRHPX98yn46+dBTWHO30uZWJw0QSLvz80tNVnLhfuI1YpQIxgAf/3UaV7vJmgbKt6UF2fKP
	Odw=
X-Received: by 2002:a17:90b:4f4c:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-39e6a7f221fmr2814204a91.41.1789789736430;
        Fri, 18 Sep 2026 20:48:56 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4ba12csm2305479a91.11.2026.09.18.20.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:48:56 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH 0/2] firmware: raspberrypi: Handle device registration errors
Date: Sat, 19 Sep 2026 03:48:38 +0000
Message-ID: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series improves error handling when registering the Raspberry Pi
firmware hwmon and clock platform devices.

The first patch checks errors returned by platform_device_register_data()
and unwinds previously allocated resources when registration fails. It
preserves the existing behavior of skipping hwmon registration when the
RPI_FIRMWARE_GET_THROTTLED request fails.

The second patch fixes formatting issues reported by checkpatch.

Triet Hoang (2):
  firmware: raspberrypi: Handle device registration errors
  firmware: raspberrypi: Clean up local formatting

 drivers/firmware/raspberrypi.c | 60 ++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 14 deletions(-)

-- 
2.53.0

