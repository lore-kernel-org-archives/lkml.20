Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42024B540B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192496; cv=none; b=UecjxOsCLTFWnZMJfA5s/ZCQhzcJ/eO6gOycdH1QhNoyRC6+XBGNxDiTcI8OvcI2WxL8aewz9365kEM+q+4ktE4iWpRJEgc2InVYamH7uZXQjOkUcOjJ6KW7Ic5Eg6hCSYfMLrhmNNt7edyFCOg0cVEDuhbLtEX4HjdHTQvPxU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192496; c=relaxed/simple;
	bh=kDEPBFj5pAGB5N+7jdeTU/cuSWAowl3r3wbiPhwoirc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/Bp4JFpXk7ldZS7UKlJmbSGl0WhjmcxWZSRClM3EB+sXQOb/fIvjFymBAt/q2bawNdsM1RhYg+aYOIgBLwyP26n/QC2V2T9diB17pJBMWQUdZSKnBeZxYwmxQea+yL7HCdIJSNM5F96XUBfnjLpC4nuEhjNqexa3oDIxfbY8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3zVJV8C; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3zVJV8C"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e257a23aso2086644f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192493; x=1788797293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=br+O6W1PXpNwwortFZ7nTNortOZR3mU+RseHa9TVJXM=;
        b=e3zVJV8CUbwa4HMF7Yk3KReX29LsOiCHoIjlTHuwV4KKaIlMIxpyE3vVbEyCIXLDAB
         9m8hXkjbeEc7902Q4IGiNNaT1bhc5dx8hwzN8hQhzgB0zYgWfl3VkX+ysMA0jGXBDFK1
         aGpWrHYPo5mqP6sUG0G0BPYc6juoYNH33NDV6RrDEJwhc/h3bqjEouyzxj/kgUk8ochq
         psf2hwlw2NDXZks7sRT4hDpTxA3J1Lijq46LIx8jXvaCvLNlZwtO78WHp/nnm4XKh1OO
         0VK0Kr0F6kh3O9UJNVqvtt/o7qbpEHkmk4D/lWhbPceJKhgrxNDpQQ/mrZ8RhKAB4zQn
         6Zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192493; x=1788797293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=br+O6W1PXpNwwortFZ7nTNortOZR3mU+RseHa9TVJXM=;
        b=ZwJS/kN3zPuLchIPxVPMhS6lipb/+xPflX4+OdVo7rW7u0B7I7npWWaNcjJYNfakbC
         hlqYoCmKbaKeO7eHiE72lxe1j6jY6cwxMMbRTDqXytXb4e4vKcVfyQKJ1Hc7Hgggul7H
         UgTUVu8fRGnSa1HpQ35RxOc6DyXNO6m2vUPoOwJyimaR7CCjNZz1XDahQJ6TmzLuVV0P
         kRkp/RtBcHJYqWW2CsUBMhgLxTuWI19UNSP+NGMuOFJxds3QEorOMM0xZ8RAAM4hSC2N
         zk+WSZmHLUNwQQ8OM+3UVzWMzB2ys53gFrI2FP6KtWS3ocm7HkpDXXtxYnmM+4b5DMYU
         Bu4w==
X-Gm-Message-State: AFuF++nkKY197c09KaJQJdp2uYC7J53AUJ55/QBtdkSsc6e6GrgNT6uS
	L+0hVK95iPkIpiA2nWvnfmTTr1c6mjSVWKVvexTjjitfnfZcpeRJ9ZFTQL09HQcBos8RmQ==
X-Gm-Gg: AYBFou0qHwpLfzC6mTFq+aGH462CLYjv9BMq/zKmevN+NAa5L5RlHEG5lzH4naYRfP7
	taWUsBPkjxOSquLqQa/dV99otrrzVGVVv3dwdhIp/vuDWuYZe7OzCmmrIOlL+w4kSRYJS9PIYed
	gZpxpGtX5x0KvVphkk74evo5Ei1EM2IROA6ChdtT/Xiloo8H5wt4O3S7qV1EG+jEWw5oPtC8ZY3
	wRB6C65F46Q+XGRe7D6Ft6R4PXCyMsc7TIvb8IrKJALBNk5lRTiwI8BJ4pV2FRCt5lFwCr0Yrt6
	Ib4O5D+Oz4EYU9MZBuUyxdnjniFi+M3Ph2Ty7VP/R8saXxuxezxClO9wuTygi5E0E+AW9aT5ZIM
	Y5JGBwomvfn/aIjOrrQnEkWvu4fQ/2shgdYxgje0riDDEygfnwhlybSJm69D19isjvGBzrdDInK
	vIeBvc8WjXgBwl/ZQE9/tDWcHHxZ1iLYXE8yYKwSRqKN/TckRqob2KbNSl
X-Received: by 2002:a05:6000:46ca:b0:482:e707:f5e8 with SMTP id ffacd0b85a97d-482f79b04d6mr32035532f8f.10.1788192492936;
        Mon, 31 Aug 2026 09:08:12 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:12 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 7/8] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Mon, 31 Aug 2026 18:07:53 +0200
Message-ID: <20260831160754.9857-8-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..15fe4d057 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

