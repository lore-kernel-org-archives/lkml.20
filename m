Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.89.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674698;
	b=2XQ9g1tJP5GxElLHTDLtlRWvvqImtCkeVYIwbHBit5Djxgj45XSrksJc49r+qZK4prMK
	 5++9F0NMDon7hC6ZOIr1x8WgFdv7Wc7WPRrwicYcw5rch5IHxCbV5TzgDeAhRyMs86NXj
	 RrUCwlNeglifv5zo8vnHzySqjhyRLaGdqBA2144h17Kxo01PQMFF4/0jm/1Q8Fv4Pt9/E
	 fuORol9gHyYCCzzZXIdwndI2Yqg3H08K3sisoI3s5rhWfTShmckyi9SP14LMBqxe9mFYZ
	 rCG+0teNEdtdC1cr7uk2jVEOhb2ymYFRwgizhNJTdDg2P/J2HPBMmr4+AIsl6fHMS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674698;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Info-Out:X-Proofpoint-GUID:X-JNJ;
	bh=542CaAjE3c/OVgKTOi3xQZjIrSY7TZBupLt8NibEBvw=;
	b=oSHpYjkNzPrc2n+hLEEEEqJNV35kTi4Yo7S0Jxhj5auPDZCYOd6FeY4IKvNKySfmflDX
	 DnJUINSl/ED5+3gpxoNFnMMOWw8JaGi8P9lJ958uxfoNMk15lHKmZRLt++yMgvoEtkBHK
	 3lfkK/zh6sFDKTSvaj00AqPcZqyjtKS2CWM0j8991saeEjINVevLXZveRQnb1MkmxqTF7
	 1lI3OoYucjFYWACnu09KnGpHUQzZ2PBPAR6+l8R+QC6qWBX6okhLVrMoL5IPnKjLDjP8m
	 3MKQWSaV96XBkuzMdzOcaGUZZPIIEfhuMoFxjFdLD+xStrb4/2Lt/Ls6EemfnOyV2bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=mfTErEOT;
	arc=none smtp.remote-ip=57.103.89.202
Received: from outbound.ci.icloud.com (ci-2005h-snip4-1.eps.apple.com [57.103.89.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D0606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=mfTErEOT
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-2 (Postfix) with ESMTPS id 743601800138;
	Sat, 14 Nov 2026 16:44:56 +0000 (UTC)
X-ICL-RepId: 01a1daf2-a0f6-7f35-97ed-c7880eca3169
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794674697; x=1826210697; bh=542CaAjE3c/OVgKTOi3xQZjIrSY7TZBupLt8NibEBvw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=mfTErEOTeT0fITpjXEQ3ivEMUhUzUJc/uG3kMOlR2tl2bHGFLUXPGQsawzicfV7D4Xz+Li0yEJc+ChN7sRk1FV667Oi7+0C5uXT+Q3ar+urOMx1WtbIQWmqw2Gr8IRoUm32qOVICNjyx8Xn2a/4xYS7HeaIKRm8b7jM1LZ+blrkiMqqWGPb+gxHpiW0ZdjV5HRXCCzuaxKPMPJUPI0YpMmpqqPF+++ZazN8Px4pbR6WyWsTBRtTh8/b3ioeMXK2KcIIhkDu4JhlacvUs9KyfNgCRw39C+hqWD+8vJxP2jA3Q/T0dZN5n13y17FLDdkMKBbuSzz4NPi8pEAx+VhVg0Q==
mail-alias-created-date: 1440949576000
Received: from localhost.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-2 (Postfix) with ESMTPSA id C33961800915;
	Sat, 14 Nov 2026 16:44:54 +0000 (UTC)
From: Aleksei Riapolov <tsbol@icloud.com>
To: mwen@igalia.com,
	mcanal@igalia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/v3d: Fix double free of the sg_table when a PRIME import fails
Date: Sat, 14 Nov 2026 20:44:51 +0400
Message-ID: <20261114164451.9222-1-tsbol@icloud.com>
X-Mailer: git-send-email 2.54.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NiBTYWx0ZWRfXz1oeM5LDJqDS
 +6zP594rJHCGVxRH/VUaofBCFF4DJAmPgb5j7defJRKObfsW5tf6i8/W66jMPmcg+GtFMrR2sWW
 4r/klUhLJlUWUXF2MFN7Exffb5H3wR0toGgZvx+6005jf2NYghRhtkKUaGLo6A86F6i0CjDTeEJ
 VfxffLzECPUhvMZrjfGXbPko0n/ZoOssCGCokEDC3qhxc4ICpD62EsR0Te81Siw5iD0gzSS2XDR
 4ixnZhCNPNV0Pr4GpYt4PjaPnFprBIZeepn4BaioozqTWRCRPAGF4OJ+h5avzsaJQdT2js82Nfb
 hXD7iDPjlMu73KKzGdftADAGHdRRQPfz0rFmBSGqvbZlMNV7izXU8QuTMIsCQ8=
X-Proofpoint-ORIG-GUID: VX_JF681gQW_Ha3_9qkrkenO1jhguA2G
X-Authority-Info-Out: v=2.4 cv=JtL8bc4C c=1 sm=1 tr=0 ts=6af89008
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=RjkQatE54OUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8
 a=zgleQW9xmcP9dzFbSOcA:9
X-Proofpoint-GUID: VX_JF681gQW_Ha3_9qkrkenO1jhguA2G
X-JNJ: AAAAAAABaso7qrZHFtc1ecRQ5jLG47vvh8I2xAIqeq+w/a86FkYenTTw7VFJ5eyJkIimHI
 tXkvj113Ugu7yxPE8zld/yPRBPkiIpQIUo1IC24XCwyBle2oHx/GQjucyHVfh+fVTObjUH
 NZcx56XjwdaVTwnDIGEYYLXvaMFJjx21bTjDnGUUmg21BKKSsumUlsAQayYy7dL1+RNkTA
 NjUYv/8sG167qgY2oylG97qxmojJWhMqUDoGIBlRNLsPgQDHrOZDGUBRDj9QR98z/5IJRf
 Jg5RQ7e7igS/3vWBgwc1lNsk7tAzuxFG6ONijtwFdLkaLzhL/VU86ETrzqqVACHzC3uHQY
 8E0D5gezOMnpadu4yn4bLUNeno5aMfVLm5a6kxzkyybCkdbJ4WYn6MFyWw/LUoZyOZvWMT
 x2ZuNVapFZzTOVGJExR/9MciOIB72t9ir/8SGexsTZPy4QGqOir0MnLjr2MFwk/GPD4Caa
 +hGy9AUT2kFyTqo96mq50ZQLtIXs5kHXQwFMLDH2LnnGPMgTeBX2ZS5TYs1Mw6qnSE572P
 zvcK9fHf5KSfaS24vbR45IhyaseHFk7CTvD2NDQSKT9ZYzpDm7C0K0bvArpKTp1/Fblqtg
 PhfNA2NbV6RYhafEBMG6mb+TukjQZjKyZ44hS8Af6ecx++qQ/7OJy/W6VH3lNI1zhTuA2e
 gyC2b9avbKjsx1jn3jpAm8az3ov0cVHYP8GwgU86AHEtc/UEzKbSkDDTiBoRolqSPtgunw
 vyxUG2Vko7RoiyLj4DIvEUXURRzGRJyxL5KwTD2bKE4CTI0TA90oPjB6y/l/Q99whcyQUX
 8pTwlTtOna9UmjonH+RJGr/LKKB/jWhOS0EjAzfiIuYKH194S+Q47Q8fBPofbwSWQ/ZB4G
 ru/jfAirmeTp6d/q8W9+OebHFqtmD2grhml0SwPp1LvxoWpTddTMn9MJ51d4ep5hxZWBeU
 JqgiXMJBfhI1ehBnSAmzvTT1hyaUuXmjv9WKOLtLDVCaUwP577+p91Kkhhd9crP8g18U6g
 E6hZMeXZ62j6Fio/FFec7CItm4R7Omas7lmC3dHZOm5T06k//3ePPsKdgh8bu+2gx1GNHZ
 PAVoK/lhFYZC5Rk4H4WQwr9trGoncankEnSqWOX3MF17tJhqgzkK2vi/xYneNYOOMJtTeJ
 oTeLxupaH9oA4IqrdUIG6Zu4FRHb/yH1FOuzq/mcZRWe3Dipj5

When v3d_bo_create_finish() fails in v3d_prime_import_sg_table(), the
error path calls drm_gem_shmem_free() on an object that the DRM core
does not consider imported yet: obj->import_attach is only assigned by
drm_gem_prime_import_dev() after the callback has returned. So
drm_gem_shmem_release() takes the branch for native objects and unmaps
and frees shmem->sgt, which is the sg_table of the dma-buf attachment:

  drm_gem_prime_import_dev()
    sgt = dma_buf_map_attachment_unlocked(attach)
    dev->driver->gem_prime_import_sg_table(dev, attach, sgt)
      v3d_prime_import_sg_table()
        drm_gem_shmem_prime_import_sg_table()   shmem->sgt = sgt
        v3d_bo_create_finish()                  -ENOSPC
        drm_gem_shmem_free()
          drm_gem_shmem_release()
            __drm_gem_shmem_free_sgt_locked()
              dma_unmap_sgtable(sgt)
              sg_free_table(sgt)
              kfree(sgt)
    dma_buf_unmap_attachment_unlocked(attach, sgt)   <- freed sgt

The caller then hands the freed table to the exporter, which unmaps and
frees it a second time.

v3d_bo_create_finish() fails here when the 4 GiB V3D address space is
exhausted and drm_mm_insert_node_generic() returns -ENOSPC, which a
client of the render node can arrange with imports alone. On a
Raspberry Pi 5 (BCM2712, v7.4-rc2) booted with slub_debug=FZPU the
import that hits -ENOSPC oopses:

  Unable to handle kernel paging request at virtual address 006b6b6b6b6b6b87
  pc : dma_direct_unmap_sg+0x90/0x268
  lr : dma_unmap_sg_attrs+0x60/0x1c8
  Call trace:
   dma_direct_unmap_sg+0x90/0x268 (P)
   dma_unmap_sg_attrs+0x60/0x1c8
   unmap_udmabuf+0x34/0x60
   dma_buf_unmap_attachment+0x3c/0xa0
   dma_buf_unmap_attachment_unlocked+0x58/0x98
   drm_gem_prime_import_dev+0x1a0/0x1e0
   drm_gem_prime_fd_to_handle+0x1a8/0x280
   drm_prime_fd_to_handle_ioctl+0x40/0x58
   drm_ioctl_kernel+0xc8/0x140
   drm_ioctl+0x368/0x4e8
   __arm64_sys_ioctl+0xb0/0x110

and the task is left unkillable, as it dies holding the reservation
lock of the dma-buf.

Hand the table back to its owner before freeing the object: with
shmem->sgt cleared, drm_gem_shmem_release() leaves it alone and it is
unmapped once, by the exporter, on drm_gem_prime_import_dev()'s error
path. With this change the same test gets -ENOSPC from the failing
import in each of three consecutive fills and the kernel log stays
clean.

A reproducer is available on request.

Fixes: 40609d4820b2 ("drm/v3d: Use the new shmem helpers to reduce driver boilerplate.")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksei Riapolov <tsbol@icloud.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index db95a2f..48c7807 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -185,6 +185,14 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 
 	ret = v3d_bo_create_finish(obj);
 	if (ret) {
+		/*
+		 * obj->import_attach is only set by drm_gem_prime_import_dev()
+		 * after we return, so drm_gem_shmem_release() would treat this
+		 * object as native and unmap/free the attachment's sg_table,
+		 * which the caller unmaps again on its error path. Hand the
+		 * table back to its owner before freeing the object.
+		 */
+		to_v3d_bo(obj)->base.sgt = NULL;
 		drm_gem_shmem_free(&to_v3d_bo(obj)->base);
 		return ERR_PTR(ret);
 	}
-- 
2.54.0 (Apple Git-157)

