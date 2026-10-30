Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367171;
	b=5oRGn4MQ7EWSUgWctiuPe57T6wyyNeP6A2hcBLm1GYS/xW1YLZIKlRnzSCDTvV752m4Y
	 YYC6EjNknbrIwRB0Hm2A4t8enzrU4idnMgLljV2hp55b1QlUGT7JO4yYlmgVr29Mx4hP9
	 Hf4/M6G88qQ57qzT5KdoDRY9h/Om4T8I4weETv8solP0Bfz792va4HVGLpzq5l7uxJfQI
	 hDINtzQ8U+w7pJBcJZTUMpJdn0TMzrxI7FcDb/6P0TykCtcq6W2uRjnpLR2yQ0wz/GyUu
	 Y85FL2dK6hNSICGX3C0iqHBiDc6ur0GHVEWuMzxs49xZ/QTvzfsHxdR1SV3cqD/x1Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367171;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=9aPZnrvolivVw1e1pl6FzgDyoYcxbGVEVPuxnsUzwhE=;
	b=iJsjYRgblFrnGKP8/nS2Ai952tx2T2KgUJInH/XfQOoERxuTk88nCdkBB1DTRXfcpVr2
	 ji05W9GX2sa5yHlMr7Rg21e00F3Hv0zMFMO89YY5lZ5w0YFWslzgpetUrD6aSz7Vn51U3
	 IAM9hsCUJvd8tZNwByhSQcgwGLfC5P0qDYd5aLLWphwIY+uF2pK1Vk8Uoz4B9EQk2SUSP
	 GLC3vgFC5qYy4m7IW1tWmqL2QiWYD5rv3FjYyGFpergqRhF1iw0d+43V2GTXoe1oRQRSz
	 88JS9q9sWVNbqBszLjdKmrnEi8mp5b2YuidAEkcVJ4aBIQCY15vrsGWOJ0/fKEtt2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3852606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3852606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzl1nORq+UwHDA--.23464S2;
	Fri, 30 Oct 2026 21:32:37 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Joey Lu <a0987203069@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH RESEND 0/3] drm/verisilicon: misc fixes
Date: Fri, 30 Oct 2026 21:32:30 +0800
Message-ID: <20261030133233.197189-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
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
X-CM-TRANSID:rQCowAAXGzl1nORq+UwHDA--.23464S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFWDWFW7Zr4fWrykGF17Wrg_yoW3CFX_WF
	yv9r9rCw17KF98Ja47Cr1DZFy2kayDWFs5JFyUKw13t3srAr15Jr1UWr4fuw1UWa18tFWk
	Gw1xuF4fZr47GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset fixes several problems. Two of them are pointed out by
Sashiko, and the remaining one is found when running the driver on some
weird TH1520 firmware that does mode set but fixes to 800x600.

This patchset is re-sent because of forgetting to Cc the mailing list
previously.

Icenowy Zheng (2):
  drm/verisilicon: disable the output before enabling it
  drm/verisilicon: stop to reuse atomic_disable for invisible planes

Joey Lu (1):
  drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN

 drivers/gpu/drm/verisilicon/vs_bridge.c        |  8 ++++++++
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c  | 17 +++++++++++------
 drivers/gpu/drm/verisilicon/vs_primary_plane.c | 15 ++++++++++-----
 3 files changed, 29 insertions(+), 11 deletions(-)

-- 
2.56.0

