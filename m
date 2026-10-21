Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559784;
	b=ldIM8kVU9YmiQFKE8whYIhJJiK1DhH2VJs4gXR1A99BucjYP66bJFrYquSXDA2AMkS6D
	 zG2zeHtcrzEg31KQi42t9A0oOSroAuw+OFHXYcRe/vPfNQBh57PE/j4Ak1ZS/5StZr3Yb
	 DJZUsLxD8yCb6i7jueesOVvJz8V/+3NJyfi8jEH3xWHz92fUWBgP1yv5a5w7D4WUsxZP0
	 LvNCzKHMTfz+p9oiv6rX4WUuVkTm93rAnLjtz9QRfcza1IhNn35I4TJfKN3xVTsGbN+kJ
	 ooaIjUfaK6oothAJYw4EZ7LlNDJwmXy4qEZWku1PFSkZZ30nKf4YMTUBJOgZefWtJJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559784;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vihUp5mhWdX2dD92pMR/JK2e9ZBoj7RAhe0QgrJLRa0=;
	b=l3wpT2vwQKN5WQccn0W8lp77nMeHJZF4FagrYLLZau4faduv6jQo+5cC5ejg/5qWSj/2
	 0Y3c37P3H1PYLSUt3yE2NHKy8KAt0Mrka/mk3fA11rSbOw42qiwPKrQ4bmsojQEAkPXO6
	 kSTv0EsenWCGtzEY9y1+lhjJCjFb4c5TMTk0PyjWLLUSLLri85S+lbLrkE6Y97j6MlY4r
	 Aw18pbaH7/7IVVVvblodvvrrOjFaJ/4iLpYmOKL3EPgPo2B4MivGLROWYhdRv0USnvgua
	 5U8VxSseL215YEqFYwP1WXYh/eJgb1K7zWwoAAjr9J6t0hSJEexQSfdcqDZBi2UAHsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XYgbU6hD;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AEB606A319;
	Wed, 21 Oct 2026 05:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9AEB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XYgbU6hD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792559782;
	bh=vH/deR0JSzYFm4T2YD9XaVz6Lo2iuDgXVRLekxxaOkA=;
	h=From:To:Cc:Subject:Date:From;
	b=XYgbU6hD6to6lDq8iRczJ+b0yYEjo6AU1UrzXFAOH3Lh7pDKfbHFxGNFZgtQ6yC0X
	 WJDYoXShjE7N/RBzMRh8PlL/QtvbtV0CxMpeKcYhJ4lHk88eX5zsMM2Awtled27+wR
	 QRvhYfPW/vl1AB/UyWKrJGZEsdNF52wmU7j7M4PS8TptsElIuS8xZFV3kD9a9hUFSH
	 IP3BSaQbG8mv2cSXJ6B4mR1Dkc/5MHo5HkinjQMxeCNSlJjVJ1dejYr7npya3aNUkq
	 94bL6vvRTWSndCN4Hb4S7vkKzR6ajSIfSXoVO6uOmtCalv0FBNfeECmQ8o9souQr1i
	 5e5ED474ORkAQ==
Received: from vignesh-thinkpad.. (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0E0717E05F3;
	Wed, 21 Oct 2026 07:16:19 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	valentine.burley@collabora.com,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] drm/ci: add wormdingler-rev1-boe
Date: Wed, 21 Oct 2026 10:46:05 +0530
Message-ID: <20261021051611.3328351-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates CI coverage for trogdor-based sc7180 devices by,

- Share skips between sc7180 trogdor devices
- Update xfails for sc7180 trogdor devices
- Adding a new sc7180-trogdor-wormdingler-rev1-boe job.

MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/252
Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1771349

Vignesh Raman (3):
  drm/ci: share skips between sc7180 trogdor devices
  drm/ci: update xfails for sc7180 trogdor devices
  drm/ci: add sc7180-trogdor-wormdingler-rev1-boe

 drivers/gpu/drm/ci/arm64.config               |  4 ++++
 drivers/gpu/drm/ci/build.sh                   |  1 +
 drivers/gpu/drm/ci/igt_runner.sh              |  6 +++--
 drivers/gpu/drm/ci/test.yml                   | 13 +++++++++++
 ...goftown-skips.txt => msm-sc7180-skips.txt} | 12 ----------
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |  2 ++
 ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 +++++++++++++++++++
 7 files changed, 47 insertions(+), 14 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{msm-sc7180-trogdor-kingoftown-skips.txt => msm-sc7180-skips.txt} (72%)
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt

-- 
2.47.3

