Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280994;
	b=SNOYIKQQzjq37bgYRQF1egiJORjNQxBKCxyYngdgHsMd0nzgcSrcnAScSPOLpnVwVTZ7
	 KMV386zK0om8HjfEa66FYhvW+Q0ucQobZZd3iAAJtG1vUOfXEM7c/IllRAOeL7naCNPb5
	 UWJv39nmlieLCb2UWq32Hll5wUQoCm+AlO4ZRwrplJO+rFIVVxs4SSkDE+2QlEQ8J7HWR
	 zsoH6r+mKmhc5IvejrtkwWwxseMO+pHVL+/lSdBF7wsjUGsXiYp7dlV9/IedaWuZop49O
	 iw+MdRA/2NTBjjULF7bMafv0b/8DPvqfudFFkf5mivIGMabioMpuJ3epoWW8gAeCvRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280994;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=hJYTrH+aur9SWWkX5ptStgA96ul/hKboEQv9ENEYer8=;
	b=AWhki0zJoZ7lF1bd+5v1t9ac3yuicKluestO+DkgthNEjPYwDoL4YC6G7Ge69ZHVzf32
	 meFTf1J29V5HIBDrsjL97IAEbu3BO4L1RPyXT63+8+9jWOLP4m/Ew1NNOmRO/l05lW4oS
	 rUaAtJg7A4Tfn1GBhMENcCO0qqgNxJNm5w3WCBMeXLc5JDe/FyUi8S11I7F7azOMml+JY
	 gTTmKxmNmxV+laLr7FKd1pRuwJLCLmUiG9wNeUOhfCf92/V1xeDal+6EmgW5qmVxY+vj6
	 iqEzxAFdTXBMmXXyNTEzk3Rdqlc4uKy/OPPux7gw8zwsBpt4+OxAchuH5eArrl2fIYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZ3hZQ27;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD7F60A2614
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZ3hZQ27
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5533E1F01825;
	Thu, 29 Oct 2026 13:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280993;
	bh=hJYTrH+aur9SWWkX5ptStgA96ul/hKboEQv9ENEYer8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fZ3hZQ27jJv6PoU7yRKelGZvCmzVXIqCsUauLOz0zog2Nmd7hPp8xHyT4FFSFSuFK
	 N6vDGMLkfpbBaHBtMUr4Ojm4GnOkshZ1N7HHNeROCnnpIb4yJQZHE8KtuQgqG9P13x
	 f7afqpPIKnpEm3b45ODr1Hgv04cZCvLK75e6kaRNzyJDAh4ogpRoMc1R5/8pm5lbbm
	 J01uFOlemdFrGUFO6vbofBMzUgnwr9TzbNXBBgJzp0m6y8y7lVYVjUA8qKbl/MbCmD
	 4qKIsXIiNad6hCO3X5hnnsnOc8pekWcuGgJX/Qx6Q9eIF8gYE5qa9H51W3RTJxUKuZ
	 AinyhM+qpOewQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:00 -0500
Subject: [PATCH v4 13/31] accel: ethosu: Prevent command stream export
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-13-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Command stream BOs are validated at creation time, but the generic PRIME
export path can expose their backing memory to a DMA-BUF importer. The
importer can then modify the command stream before the NPU executes it.

Reject PRIME export for validated command stream BOs while retaining
generic export for data BOs.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9afe2549ec84..c046aee42687 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -6,6 +6,7 @@
 #include <linux/slab.h>
 
 #include <drm/ethosu_accel.h>
+#include <drm/drm_prime.h>
 
 #include "ethosu_device.h"
 #include "ethosu_gem.h"
@@ -30,9 +31,18 @@ static int ethosu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vm
 	return drm_gem_dma_object_mmap(obj, vma);
 }
 
+static struct dma_buf *ethosu_gem_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_ethosu_bo(obj)->info)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 static const struct drm_gem_object_funcs ethosu_gem_funcs = {
 	.free = ethosu_gem_free_object,
 	.print_info = drm_gem_dma_object_print_info,
+	.export = ethosu_gem_export,
 	.get_sg_table = drm_gem_dma_object_get_sg_table,
 	.vmap = drm_gem_dma_object_vmap,
 	.mmap = ethosu_gem_mmap,

-- 
2.53.0

