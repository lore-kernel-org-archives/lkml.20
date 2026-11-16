Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836009;
	b=pc4UdlMhlBI4u+DbJFviYw7DbGfgnKisiUz0AcacN5dWPW+MZPA6gD7ArP642uCAeetW
	 yqD0G94fKTEX/VvlJYoZCSXKPWRvGzg5GsbRpYR/adcb5L+H90z5Zop98GdJQPB8wSfj+
	 lFwUTbb+SfV9v9WpBEmJ84WOADrALtDtMJYqoUKOwk5tRWb/SfMQOXC+XQnR3OgaYI1hN
	 moC9gH58JmhEP4m3I/qDgpTIZ0Tdc7FItU7lP241fp/J7ebu2zPahEbnTKBlovGVRLzN1
	 8ERyu3ZIX8E8VRsQYu3wpUuv/it26yOUG0dFQt3pX9FasalsQ1eWF0ZYNk0Pq8se8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836009;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fUTAXqM2Le3OJtHSjmOIVEz97bRaEftRxX82qH/aSh0=;
	b=KMjkfssMNMiS0kQDB35Tzg9oPeaHNhBxhGpaBLSI5VHUjzhXG3DiAXPBJ+M/JqRvmZjJ
	 wBBDM2RloWY9BkWs0ENzdfi5Z17Y5ZEgrEzwSKJ7Yd4w5EA3XP1MJnsrS2U4jtBYTj4n1
	 17uCDirnGdFQMdfESh7OdWRLLPLZpSK9eT9RpAy2DBx0cVCMzgMJcl9UkyJKvBEJlk9TZ
	 DYez7l+l162fvKwJ3Z51evbEtPt0VSgvVKG1EyYfgAEWUnFpgLnAFAaaUYUcxksqo6bjc
	 /Bfey7Ib6XZrbQhxeVERzTbHiUl/6sbKq+nDY8FgvtsGB32OhVHyzuVELsPEIU8Z0nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OUFkIe1a;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB314606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB314606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OUFkIe1a
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D6C4BB;
	Mon, 16 Nov 2026 14:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794835860;
	bh=vdBlHSHVn8+ripcN6GXH7kSJda9nOEeCiSjJ2/h0zX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OUFkIe1adB1pjbTCXIOdaWF+1bF4vji6spHAPgoNrRZ7XKuULCEysxWkXOiah1KRl
	 iOvnCkcpik6DoWjRU8u+zxD6GK6o0jKK7h1zzvpUe4JwjC4g3+Eb5Vtv3tIWNbkHJO
	 HrzdZHCILTrHm4b+I8K8aQuggKoPgvTY2sglsTbc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 16 Nov 2026 19:02:54 +0530
Subject: [PATCH 2/2] platform/raspberrypi: vchiq-mmal: Fix warnings in the
 zero-copy path
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
Message-Id: <20261116-vc-sm-cma-fix-v1-2-2b0f11aa96b9@ideasonboard.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
In-Reply-To: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dom Cobley <popcornmix@gmail.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=vdBlHSHVn8+ripcN6GXH7kSJda9nOEeCiSjJ2/h0zX4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq+wYV0ZM9t2kXHOt9vcgzPfACvQkshDNp9Fwdz
 jc5/Op7ADCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavsGFQAKCRBD3pH5JJpx
 RfpfEACLXn/iegV1rpewad+wkoruJchyQ7ZHN8GP19q6m5ktEqRPdjTqUHTaBkT1flfQ832FYQY
 EOlCcR6xNCd6mRUXt4TTZ5GB3RVNmzoq0DyMhDmF1U8mFvDQlUzg4D5TtN5KSM5cqZKoVrqMJQJ
 EIfCWzmWh7A5pJT8kf4IV85mO90eBE46+v21ed1uaUyRVudtE844vuF3iK+J3E97dsgQRXAyBuO
 Zj0FzdPK8QcVAvJ+shylrxGi8bEi607YP2vfLFkoZ1rAoXEMFj3cLiAYMJL64SEB1C0crFVZYgX
 1Weyx+vjJL2AZNYWqDTMHf8QtYbk7fvyoY6Kwt6g3R/WbV8LQgWIvCSDmXjro6NVBGb1HfabkEN
 VBxGmufePp15j6KhMkQN60Ms9va8HquTH/6I+MpTKHZbyNDfYgzoPK56pLeyP2iGrAG60QmYSar
 Tvf05PnYm+MooykIfg6dAhcMtgCLT8idIQAQP04gGi596PgFm4zzLMs5MyGIUATYSGjOaSTdYjU
 izzpLfGZc4xtriI+40+xPLaWWts4q9uzm/r61lY5yQR4w2TIDXOiWgIYKKPLwGIetW5+DE4qkrt
 /B6y4CKGxU6J5sxM7/9iT6T+LuO7z28VC/OyWgpSxByDK+moMGaRRxQ/f4uBgAHcI/QzYXEoC2E
 FQD8AUmsfKYSw+w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Fix minor issues reported by sparse and smatch around the zero-copy
support added in mmal-vchiq.

If there is no handle present vc_sm_cma_get_vc_handle() might fail,
which we check but end up printing and returing the value of the
undefined `ret` variable. Fix it by returning -EINVAL and dropping `ret`
from the print.

While at it, also fix the stale reference to the function name
"vc_sm_int_handle" in the error print, which was renamed to
"vc_sm_cma_get_vc_handle".

Secondly, during cleanup assign NULL instead of 0 to buf->vcsm_handle,
which is a pointer.

Fixes: 67d0fbe47f8a ("platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611141210.9hmxzD2V-lkp@intel.com/
Closes: https://lore.kernel.org/r/202611141218.5FZTnFtc-lkp@intel.com/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 8d765aa7ea12..46803ef1e071 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1644,10 +1644,10 @@ int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
 
 		buffer->vc_handle = vc_sm_cma_get_vc_handle(buffer->vcsm_handle);
 		if (!buffer->vc_handle) {
-			pr_err("%s: vc_sm_int_handle failed %d\n",
-			       __func__, ret);
+			pr_err("%s: vc_sm_cma_get_vc_handle failed\n",
+			       __func__);
 			vc_sm_cma_free(buffer->vcsm_handle);
-			return ret;
+			return -EINVAL;
 		}
 		pr_debug("%s: import dmabuf %p - got vc handle %08X\n",
 			 __func__, buffer->dma_buf, buffer->vc_handle);
@@ -1694,7 +1694,7 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 		ret = vc_sm_cma_free(buf->vcsm_handle);
 		if (ret)
 			pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
-		buf->vcsm_handle = 0;
+		buf->vcsm_handle = NULL;
 	}
 	return 0;
 }

-- 
2.56.0

