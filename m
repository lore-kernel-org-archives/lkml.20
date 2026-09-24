Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862B3EEAD0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232279; cv=none; b=mCdta7T7+9M2rxnm1XEPYM7zWsug/hUVj4EKNk+fx7bWQC5Tp/cPgxdR2F+AUFXZKxSRusEpy3SWkv4CeYesqArozK6p4YJrp2CsQZJyCKxw055vxkefDV2CovniL8ohHD8RMdpqJk0oO8sLys2Pe9hntca9Rje6e59dGqkxA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232279; c=relaxed/simple;
	bh=v3TaFSXtrpgJJmBg3R3loXYUVcw08+KzvCFhhEKLa3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbKpU0NxCzscGCsX4HwypI03uvjQBqKgAMctdpxjU8NYiSL5KYHvJLH4SeZBOtKtUHNu1Y+/B+u6uAqtU4SCdOzdPatQPUUNgTjV+xTLKcpeijTu9J93QY1csbh6jTUkXszpZYDkGESnBy4rv/YuTZofENIYXp5ZqvzUx36osQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNJJoh7q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNJJoh7q"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1000021a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232277; x=1790837077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbB99fzKqqncd9v0PrpyQHGW/pl7V8ppi+GHfHAQQBo=;
        b=sNJJoh7q3fOYUFhvca0LAHQkb2mjezUVV1oOqAGZ/GHR18bMswzcFC6jEL243qvaCK
         pzWEtcVCTBQNxUF3fTIqf17p8IPY2E68/erT4Qq7oM6n3zHeS/LP4eDJESk1tBlFBsKy
         YMlD8vDbieshS37zrOF9YW4PLN7ue4qR8AY7eCl9YPAL+zSJZc/eRjh9QW7/uI+blkP+
         VUD2MgEPYE32NORcNt6yq7m/qqZq6LCV0BcQ0RfN7Vt75TevmRaaJ6olk4HpFO2+v+SZ
         7PKeua4ek76dwAFpNSLuXTP07lRNTDWkkg/VAqHhy7D0v0s1sXotIQ/NDzqKPhiCjTH0
         DWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232277; x=1790837077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbB99fzKqqncd9v0PrpyQHGW/pl7V8ppi+GHfHAQQBo=;
        b=gW53B/faKI8GbgHp3ir5zIqT6rqH3Y3kRsiMZoaMt4mNZvG/N5u+HS2MngEVzrIh6M
         xpgzlv1cnGAf23ds9uNFh0WSxRa+8UD5vnDyJQmffxHu7RkgrEjvIqf6Jio8VioNvSE6
         2YCKs1kPLGIunM/kwU6NzOjYp+R0tvaBjNdeRS4ACJNgKLfPGuUUm5Ter24SG0L30MzH
         D2mYN9YDOiGqcfD70F8jTQqcItXKU5BY+nz5a+hCaBaIXhW352mSUVoUyRedKV5y+uUt
         NsBbR4Pdcg8q2bVf49wosLqZHqGtRuw1dLONoPzZXJiZk36h1JxuYFh9pCTbMIar2vYV
         PZKw==
X-Forwarded-Encrypted: i=1; AKwUvBwBgs4I/Agij5aUjSX70nzEywaSC6KXad0+dMphOA9XyX8zZJV+n6Hib2dEDZvpdkRpOPArbOyWrYlrNV8=@vger.kernel.org
X-Gm-Message-State: AFuF++lFN0idm0TMxpp2nQPqIihv90wxK6DPmJerYB0xX5x9fVp/yLWd
	TXHdMsQ5JbuRZA7D3sPbDkRZKOd3WBInV8PqdyFqO0wP5ReOtdSKHkuS
X-Gm-Gg: AYBFou2FWiXuE+vk108PRhSLiz6mLMYCzFa/VXSITX+Gfq5JDkSp3eqob46FloYTTsx
	nrbgh8BkZN4Y9T2TevTMFeSvekEThrFDI8meRklHwNAPsiaL6mSzOSiJmzf25Vcchx4E8zpKjlP
	CPRoMbKxji6AX5VA1bLPBz+d+HMBZr69yM00wUzr0ZWaTDdFzCYHowHLRh7qBhrWT5NZ6/bSHaj
	dFK1WeKY1he87z2SuLvhKvHv9ZUQho6NuHyj7YVybLFCJ349pMLl9mCQSP+uGf/uWDG7MzXtq0U
	P7GBoDc1RITCPx5coe0lJmgqWZEHiEPxuGmCqExjPzEhlIBFnkBmrsGfq3a22eiRvJviRmiYS+d
	D0Ds36ya3oeq3vtVRx/YvT0IBECH2Z4p9PF5WUX4gURxfWEE54Z9h1j2hH1uWdWe+IXiUilZXfb
	9p+pYVllF6q3ot/Nvb83xNS972S8SPS//pfKY2rulzOE7wv0WKRx3DngCCctC4mgaZa+YWhHtW2
	UhQxLHO6zdKkHxkuGIBZuoCvCf/xHp2ZdenG4Od2RypB4jiWFi4xA8QUkz/Om4er32UdNW0ZnWw
	T1SHdVhh5A==
X-Received: by 2002:a17:90a:d603:b0:39e:6c68:1550 with SMTP id 98e67ed59e1d1-3a098969ba9mr1148247a91.24.1790232276784;
        Wed, 23 Sep 2026 23:44:36 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm2960830a91.8.2026.09.23.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:44:36 -0700 (PDT)
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
Subject: [PATCH v2 1/2] drm/udl: reject short USB control transfers in udl_read_edid_block()
Date: Thu, 24 Sep 2026 06:44:33 +0000
Message-ID: <20260924064434.2541959-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924064434.2541959-1-benquike@gmail.com>
References: <20260919223511.3889061-1-benquike@gmail.com>
 <20260924064434.2541959-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In udl_read_edid_block(), usb_control_msg() requests 2 bytes into
read_buff for each EDID byte, and read_buff[1] is stored into buf[i].
Currently the short-transfer check tests ret < 1 instead of ret != 2, so
if a short USB control transfer returns 1 byte, read_buff[1] is not
written by usb_control_msg() and retains the previous iteration's byte (or
uninitialized kmalloc(2) memory on the first iteration), which is then
copied into buf[i].

Change the check from ret < 1 to ret != 2 so any short USB control
transfer fails with -EIO.

Tested in QEMU against Linux 7.3.0-rc3 using dummy_hcd and raw-gadget
emulating a DisplayLink UDL USB device: on the unfixed kernel, when
usb_control_msg() returned 1 byte for an EDID read (short transfer),
udl_read_edid_block() accepted ret = 1 and stored stale read_buff[1]
data into the EDID buffer; whereas with this fix applied, ret != 2
correctly fails with -EIO and prevents EDID buffer corruption.

Fixes: 5320918b9a87 ("drm/udl: initial UDL driver (v4)")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split out as patch 1/2 as requested by Jani Nikula.
- Added testing details in QEMU on short USB EDID control transfers.

 drivers/gpu/drm/udl/udl_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
index af4cff2a7c51..b7c462436573 100644
--- a/drivers/gpu/drm/udl/udl_edid.c
+++ b/drivers/gpu/drm/udl/udl_edid.c
@@ -36,7 +36,7 @@ static int udl_read_edid_block(void *data, u8 *buf, unsigned int block, size_t l
 		if (ret < 0) {
 			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
 			goto err_drm_dev_exit;
-		} else if (ret < 1) {
+		} else if (ret != 2) {
 			ret = -EIO;
 			drm_err(dev, "Read EDID byte %zu failed\n", i);
 			goto err_drm_dev_exit;
-- 
2.55.0.1082.g2b9226bbc0-goog
