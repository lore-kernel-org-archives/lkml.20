Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498EE58FD03
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905118; cv=none; b=OwDK1wnb/q3cHE+aJAk/RhIOkLItgPEbZY7KJ9QHeJFbmF+Q/i+NYHUdo3n4awmDzPvkgkWYhbUaJsk/A8M6j8olibA3JEBLz1ueKsfg9pmK6ZFhhU6VD7OhEjQ0wDGgChfL9sPMx6HnbDXBLpC5MKokeopIO1xv3b38EZMthco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905118; c=relaxed/simple;
	bh=buld4M1eIUiFG5ErgnoIgdkW3xN4wuZw2Raf5W7Z4JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=powG11XUYgMY5ycBLQ4NVwpE1kGFe1oZuDEGgPBAC9Kh0i1RY/HERdGbEULpxHxjSe7Ng6GDa3l3cM+6nO/sAG4GJdNayo0Az+GW4BGuZKeMMEH76uyztfEWiukextF4fZDtB4wB97Qr9ygRUonb5QN8iBYoezqniBqNwQuLT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1PMoXaI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1PMoXaI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB81A1F00A3F;
	Tue,  8 Sep 2026 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905117;
	bh=U6w7FzzToBcqLrZZeveYx7xMc69WBjwh8N7NR4MDbeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d1PMoXaIpksor+CnaYLxqVc0kxzQ+XNpq9T3fkhmwXCtJd8Ex4EKXqKLH57u/TaKN
	 b08d+xHY//I6+aZvQsXmx25YS9PVZaVqhNi3AjTkbZqxMpUd+IlS3sFH4+DSL1S0kr
	 AjWTjBHrbGYcARWiZ5E1lv3DFTZ/X9adRZM3lp7k37JVynMdnbc7bR08uJdXF3rm7o
	 VwmKSih6MEvq3J0JvDj5Oeilh2w1Z1cZarN2M5IermWxjmvCE2nKf6XHmqr+yUM6GM
	 eD2V43y+uT00nWpearw5QiXrfDj1CnbfgliGKJs5pc7n4Ci/zUeD66PFiTo7AU/IDt
	 PqIfvsooFhGlA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:56 -0500
Subject: [PATCH v3 19/22] accel: ethosu: Restrict dynamic IFM2 weights
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-19-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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
index 632a2352491a..df26ccd50a96 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -590,6 +590,9 @@ static int calc_sizes(struct drm_device *ddev,
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

