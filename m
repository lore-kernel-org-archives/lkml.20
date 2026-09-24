Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2AB432BD6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235017; cv=none; b=UFcAsI7MktDrZIlvY37OhyJO+kRnEHVwCKXVzmk8SyF1mMRnCVa6E3d9b0U57fejihVtGtreR3D+M5UAuwrh0vmt/oQX4n/6NcvPVwNBeKgd/Vk4+fBrZJlGlKQDKpxSj0IGk/j3Ah30R+VLVoS28w8bDPKJ6fkmsYVhtTkKA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235017; c=relaxed/simple;
	bh=H/09Awy0Wow8he0iuUjbYNtLCcgE1/04W5EuWcTgx88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYvwobBhBy3uROnEBm8hiNvGP0CajfGPuycNWHhCPcnWe0e9oLdlcSG7dLTSkJERaGdHZtHaQ+8Esh3zev6zkFRM2zK+D0HbWaUF1HQvg/3bavXz/97wFYa8W+/U4XeGzV7+QiAHlqv0o5iKQbTz2xxUQssjkcg27QZ3bchtWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz3yf/vj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz3yf/vj"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso9863025ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235015; x=1790839815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6F8IvUZIEGfXb52LcJZy68sW3q/eTCjBvXuldSNAIWg=;
        b=Qz3yf/vj2mxSLDysJ6S3tMjKG5yx0TjGYFrH0PBqJfxa4+BL5WuyiKKu/gsvMzrl3x
         ABfpThb97VGkYmgUyvZnu/P36EQYJCAVGIOIV8QKbWdwH8LHLp3x0OqtopxZ6/bpGnkP
         Vqo0SfI130sGvzlX6Dzk3X4I3ECOqwghNWdXfw2D3APlNPX7lOn9QKwOcB6dAfAX1s/D
         NEeTByo7QrUeBBE17pfK8HJH2MXMxPIYrLJ8KMWg936hMV0XNbdLF/aGb5Y0Xzsvzeq2
         blBrtAJ+2UnzWw0axl3HHw2nzgx3Vyut917pdIsg5W39JZZ3vDQuqDJV1OpB5Tw08oVi
         T2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235015; x=1790839815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6F8IvUZIEGfXb52LcJZy68sW3q/eTCjBvXuldSNAIWg=;
        b=aEcarL+PkhuYV/uMJdaUu+RSkaTAUhARfF40y+t5PJq+3BLr1Es8Z3vWHYABRv85qJ
         HqJ1BWc9nzTXyDuQES0plijybps5vEvwEVDuZzN2jr+dht9Guko3gIXaqOX3N9VkeQ4C
         8ALFDVzKfYcR9Su/bvjYXmwdj7NEx8Qt+k+hFKmVxHi/VIeDBY5eDDXkdh6TG/gcgpWM
         i5AC1qR0SRPUYVF4YatTZgzOhberyEUKlSp4yfsZSN40u0IrTNcmh/Xe7Oeh7uJooWUH
         znuAY7XB3wjD+QuAe3QPH5ONVgv1qTvMIfGbcilLq62dSzLPxYn0TYLVL0zDm3r5zZJ4
         mH8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNI1DS79ZmDUFFQ72A/wE9GkMxMaIHjQAqBhyEgsZIuVNBvpYSqj1nl5/Ubsdsk7uZxDlmwPi21hyBNuI=@vger.kernel.org
X-Gm-Message-State: AFuF++kW7TrxgcZ7xR3OmpBjt8OAK2lsUKsi1eqFkfZcaBO1q3NTEQQn
	h3kUlhiS9Uxw9Cfm+f7UMwC7IgYNMhaThD33XugOLySR56ssJk5A23Zs
X-Gm-Gg: AYBFou1S7dGZOYeYiNxvIl+RyMjHLODRB9jbvLE56dIZfcabYma0uu9p/Ade/4rNGGV
	bfeCcLnNDBcTrisp0j5nqMZsDThrLt8X2aBcRU4YI5lyj8GWD74C2/ZIYxh3nVl7kub9bzUQAfa
	T5gL620cVZqpmwpREvwhzBc0y8BxnyNwhe71o7OwGYMwtUKdbXaw24CtUHQrNc0D2nINIySgsM3
	1Hf3XrN3Sv+gNsVxHjZYigy6DXzubwVEL8NbO/g0P21yGj6lsTiwLAB/JS33/txZQw0usxrapiZ
	ZRMUKOQlaW/qBYiXkb4hUvy5Vssznf5oz+DjrUu/XrC2wxitDHlf4gkGcPA1HrDonJreKPWAUEp
	klvcYt6TyrkM1Cg5o+kqcAzMuUvrvRD5+01t+b9muajR/3omd0jSxtX8OV3KYIkqVsYUF5e9d52
	pI0tSm90xvAfd1lHYc+fPx7tYC1yWttYxp5UshU77dWR3tOFi0IfUkFdQ3cUpUunE2RvuFveSRM
	ALvBxRkZxgWPi3/Kw6lR63DEkS9CZHI/rr0Gsf/zlS3eHeCd+BiwY8/N/6S74UjCYU7zXGnSfVb
	5wXA0plyOQ==
X-Received: by 2002:a17:90a:ec88:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a098b4b35cmr1393507a91.19.1790235014790;
        Thu, 24 Sep 2026 00:30:14 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm3184726a91.8.2026.09.24.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:30:14 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: jani.nikula@linux.intel.com,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 2/2] drm/udl: clean up USB resources if drm_dev_register() fails
Date: Thu, 24 Sep 2026 07:30:11 +0000
Message-ID: <20260924073012.2742968-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924064434.2541959-3-benquike@gmail.com>
References: <20260924064434.2541959-1-benquike@gmail.com> <20260924064434.2541959-3-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In udl_usb_probe(), udl_driver_create() calls udl_init(udl), which
allocates USB URBs and DMA buffers via udl_alloc_urb_list() that are
normally freed by udl_drop_usb() in udl_usb_disconnect(). If
drm_dev_register() fails in udl_usb_probe(), udl_usb_probe() returns
without calling udl_drop_usb(udl), leaking the allocated URB list and DMA
buffers because udl_usb_disconnect() is not called when probe fails.

Call udl_drop_usb(udl) when drm_dev_register() fails in udl_usb_probe().

Tested in QEMU against Linux 7.3.0-rc3 using dummy_hcd by simulating
a registration error in drm_dev_register(): on the unfixed kernel,
udl_usb_probe() returned an error without calling udl_drop_usb(udl),
leaking 8 allocated URBs and DMA buffers; whereas with this fix applied,
udl_drop_usb(udl) is called on error, freeing all URB and DMA
allocations.

Fixes: 5320918b9a87 ("drm/udl: initial UDL driver (v4)")
Cc: stable@vger.kernel.org
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Add Reviewed-by tag from Thomas Zimmermann.

Changes in v2:
- Split out as patch 2/2 as requested by Jani Nikula.
- Added testing details in QEMU on drm_dev_register() failure cleanup.

 drivers/gpu/drm/udl/udl_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1922988625eb..239a6983f49f 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -97,8 +97,10 @@ static int udl_usb_probe(struct usb_interface *interface,
 		return PTR_ERR(udl);
 
 	r = drm_dev_register(&udl->drm, 0);
-	if (r)
+	if (r) {
+		udl_drop_usb(udl);
 		return r;
+	}
 
 	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
