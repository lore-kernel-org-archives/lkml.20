Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF38A3451D6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569045; cv=none; b=Kd5vYzSuWzgq62a/Uo6FK4wgNXuSaabigL6byUZUdIyuQEW6Td7s9jeYhBiWtpbIom+ijWvSM9CvY8lZPD+4W5gpV0DX62IQ9H7E42mWLcE4GE0bddsteSmSv2w1UommBrF5asF8O+H85XRLitNPbOLU4xYwSYM8ZmijYydhTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569045; c=relaxed/simple;
	bh=QDQ0NL3+zctS64M7k6f9fBZIcnsouwmDw0W1hZ4A8SY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzZJ9BCnWDWpmASrztHkZzxyGPeD9zQRmYL7W8Kn2Yfj9FCVgx7zWK6p1sEnNMfdC6sz1d8KPed9TfllTmuPWav2XwYAJIEIj3C/WlaO/AgWW3ZPVWYvFMYiJ1rVhANIEHhhWeSJ46PWbBI/dAlbfLuS1IKWzAqCtLNIZOPBfys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj2nwlVy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj2nwlVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957A41F00A3E;
	Sat,  5 Sep 2026 00:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569043;
	bh=vbv8ezbF5P8e6EPBX5kWUWidqzFn8VsPYDI73nvDt34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gj2nwlVy70ETjO5lt+4c/5AS2VdN0D1Ilvuzud/eA10subPA07B9jzGNORRTU5U76
	 bEbgcLllnSBSyrhR0bfV7vOtvGZ87WgAYjCMpkWBZb76KSs/VeS8E0gnfR7qKEAzZy
	 yn9nhKXnzZV29/wLW71mvZ1QwTgaNWvbFQB8hvmSghR5InIUgm7ejRJqUqwIk9E4aX
	 htKDFCTDg8gFd1elKT692ufiSICvSPymyaI6RH2Yzg94j81wM3986xBaPrBTs7vvrW
	 wCfHS6rxq3JjFR7iXmbtIWMmIyYFasUxNO4/FCxnwZr6yDVOSlSzOsHUMrqbiCzYtn
	 s4apSYk26b5qg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:35 -0500
Subject: [PATCH v2 16/19] accel: ethosu: Restrict dynamic IFM2 weights
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-16-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The validator bounds dynamic IFM2 weights as a 1x1 weight matrix, but
did not enforce the corresponding kernel shape. A larger crafted kernel
could make the NPU access beyond the validated IFM2 feature map.

Reject dynamic-weight convolutions whose kernel is not 1x1.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 05a3cc04e7d1..c3dad3f80c34 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -559,6 +559,9 @@ static int calc_sizes(struct drm_device *ddev,
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_PAD_RIGHT) ||
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_PAD_BOTTOM))
 			return -EINVAL;
+		/* Dynamic IFM2 weights are only supported for 1x1 convolutions. */
+		if (ifm2 && (st->ifm.width || st->ifm.height[2]))
+			return -EINVAL;
 		u32 stride_y = ((st->ifm.stride_kernel >> 8) & 0x2) +
 			((st->ifm.stride_kernel >> 1) & 0x1) + 1;
 		u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +

-- 
2.53.0

