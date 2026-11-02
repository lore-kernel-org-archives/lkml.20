Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606259;
	b=FaRMCJAnGt0875uNiqzexCgJPHqnxfkL+YKMZrZd4++oFknilshZ+WOb0fFkVURHh+5l
	 uVlocKsqPPYBF69BEwmOkf/fubK9ZAjGlk6+XrDo1oL61N1lhllNjgnZn3/QpGcVA8726
	 AgXjx+v2ij9swezqYDx15p7UEJCz+swhNhUGLnSbKN4CAhDfqDR32A8v+wIKeSpdQHBUB
	 VTcwvw8JwXl5ZkDqvOIqHmINGYgMRb2uOxxfGYrTz6cKopnU7NPYFW34gPjHjKMttN5Bw
	 wnIUGQoRPvnPR88Q4onnhgMmTaoXkQh1KjeFVT7gfeie9kg8YgEoHw8I2770P8CI77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606259;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=FX98dkh/aqz777z6XZ24w4fvMSWmgg6UCkrKMMTSWtA=;
	b=ZazhgcZoQjEv9cYsYVdkgHdaynh8jGT8Dlwi3xdSM4LAuOU9X4F0/BAXYzM2RaIMZIc5
	 9tPeR7jiZK7xxbAdqUlnVHJkti9w8Bi6wznfR/378Of3Y8+IaVOEGprr89/bQPx0E3upO
	 Vi6gJtP/Kc/3E1YcjgHMkIXWQBi7szTr75H31ssASMKaiQOog5VhqvpbHEHGNTWUIk9to
	 dE0iC/caIZIzb72r56xs9sk4mdsVGDRwj+J7r2WqQtRb/NmmF3l8xTelPjOEQIgLDZMI4
	 +2A3QsiR8rl9KDue7gShma5nlg46Dd4IePw52W1J4B9YF0CQXEXwTrXtm2ZNTr01WaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B6606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D37B6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-01 (Coremail) with SMTP id qwCowADH8PpcQuhqxn0oAA--.14870S2;
	Mon, 02 Nov 2026 15:57:17 +0800 (CST)
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
Subject: [PATCH v2 0/4] drm/verisilicon: misc fixes
Date: Mon,  2 Nov 2026 15:57:06 +0800
Message-ID: <20261102075710.1286456-1-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADH8PpcQuhqxn0oAA--.14870S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF48JrWxCr1DurWUAw1UZFb_yoWDJrg_CF
	ykuF9rCw43uF95Za1UGrsF9FW7CFZF9a1rAr48Ga17JrnrGrn8JFWDXrZ8Zw4UWa18tFZ5
	Gan7u3WfZrsIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset fixes several problems. The first one fixes a bug when the
firmware did a modeset with different mode than the one picked by Linux,
and others are fixing problems pointed by Sashiko.

The fixes of atomic_disble NULL dereference is proven to be worse than
the original, and considering Sashiko points out that clearing FB_EN
would prevent showing bound-but-invisible planes, this part of fix is
redone.

Icenowy Zheng (3):
  drm/verisilicon: disable the output before enabling it
  drm/verisilicon: nuke planes' atomic_enable hooks
  drm/verisilicon: check old state CRTC in plane atomic_disable

Joey Lu (1):
  drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN

 drivers/gpu/drm/verisilicon/vs_bridge.c       |  8 ++++
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c | 35 ++++++---------
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 43 ++++++++-----------
 3 files changed, 40 insertions(+), 46 deletions(-)

-- 
2.56.0

