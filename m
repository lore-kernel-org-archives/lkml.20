Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0218139A04C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004723; cv=none; b=KwsIrQbhwjuA7BfyDnPOumSLu+XbchAipuCRvcy+kzt0VubW0g9kDvMcdbVsYjI+ulvF65Ea+KOcb2ClDRfK31Uo8waEwIPGb/xqOcCMx6QPenVkMf8sKOcxSSv5yjeVSF+BX7Wtm5mJhUBtY9pmGcUy38EnxaZiPHwMOytZpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004723; c=relaxed/simple;
	bh=eIXDrzxDlq49pE2fcf2vzbdsd3Koi4r1FzVnUcQ5K+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hvbrwc3Kj0fJtkoPl59EnsV6bJUj3wla8FLWM+nwTK3aGIYfYOcCJsZ5DxAWl7TlVTZLvDmVNLZXgnZse0tZy8fc6zJGoLgz+6lw2VMnuhGTePL1PgprD4VGk7HDDhOXEBGvlwFHX6yI5BTHzILyERmWEwyLXZA/+5ARB1BtJYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+7cWGFE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+7cWGFE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso10161565e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004720; x=1788609520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUONAbsac9yqqFRFu6bWfUs5ayDN0YKRiZQdTwHdCRY=;
        b=Z+7cWGFECmXf74ixlh+M6PgvbBtHIsApp+/Ir7wbuFe/BDM7J5r5FB8lOmdaMZJbNX
         JrdwdtPO+JYfWHSFLdxv9qN+YAFak2Qsh9ATTE0mUmNdzYvpZaEnTeAbCttgi+Gwz13e
         Rcu7+TdoHzPMHLj2WSN9xZqsO1L7gx1jUIn4Ywwc4rm3DLXmlUTE+thbW8kSRQkl1FE/
         ZOiu49PWTC5ZNKdyy5ygFYQMl860piUHTszhvq5mCvbvVNdJ7UOv8rPdBcEQ3UG2J3Nb
         0ps5RCQdSpj6BXM7G/edWc+EM7+SEzIzK/+91O/QVAZQWrwFF6ZWCczyl0xWg+2iKovZ
         bBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004720; x=1788609520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUONAbsac9yqqFRFu6bWfUs5ayDN0YKRiZQdTwHdCRY=;
        b=FSAFL8DKv6R1jYFv0Ro7+ebrYrFWcb6KWESG2XfPZZ7ZfS2BaINho5C3xW7jXzkrjY
         oe/QyI5VjNPgSfY/wEPxgUVOGBWWWmvv8m+DYJZkZz9gWhOC7N+i6wKtXL11z365J+Bj
         lFSH6sEEFDKTgRYngmEAAj2/is/W/prdyKT5TUY8z+Jw1Lx5lcpSJWic5jG2OKED+6FJ
         dbWu9Ifeb7PkfHXkTA7bZHVTCkEM9S06i0EzHhxmYcEja4USUnH9kEMYZzayGuDDx37A
         W6xvZGL6lamQQW6/OGbQ8MxggElyZEWcmfyv7GUFbiyxklln78XGgsrwXMuNFFkzZYOI
         dQgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVdgMxnRavtk080YUaSlre0MYnx/0fPATpZJBjOqfxBdxNXjJIS1Xen+FEKts2uQHWWds8p3MpR+PFmeI=@vger.kernel.org
X-Gm-Message-State: AFuF++ncTqT/0T77zfLPlBO3M74o0PgLlx5PLiHR7ukkKt4TouTHLKKa
	UhfsqgkAyWfZM79vUNPPR2qryWdUfCcus0CdG0LCbP580EPGQFzd/MHP
X-Gm-Gg: AR+sD10jYt3Yp22j+MnQocRT/VDC/4QgRtQmjHyXJprypUtPJRTGEqB5DqFpJaLgq65
	ob1Lihj1qOoj/vEoHrNkXueKqMn9snzsc9xXuJtT69gtOtaxmh05lFb0Gk7yAs/tRcOmIXHE3TT
	HNEMdtdHXwzpy7CoWeHHJR5eSSM4ny+Wv5NDnwOAi+vg0TXeKay2g9VtyOACn4AM5lfsM7aFaQm
	Khz7XDGjRKyJW9kM4sec5yVUxZVeCGxM2Sp7V5eVjKjQ3RBn7mEfxvQ9yxevYp/pTcyAuqjTeJr
	3NOBr8f/7AU5wzpDk8UnGnMlyHZEXSr/fDAm6MhSiQuwxY6tqrMXBZH/G/iv43Ek/5mmemLMw40
	vRa2ieyaVZEnuMf8YIhwkLQTincZttqCiXGhdQg/paDLA3JEt6LCdEtk7UdDEENUpZhBW45elJi
	WywYWtwQMLYes/IWxSLAoTGcB6Zqf8wu5XO/rQDUzcOguK4g7qK2nnfZTGWZBG4feXs/eBN7023
	6FcTeYuL4RDfn6BdyJLd7cC7r40vt7olCrTb+BRULj77bp7K/XlR4X0EkqVy/9R6mekO+tMyMnV
	5N3Dd+TZIytRiWE=
X-Received: by 2002:a05:600c:c170:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-49b91c2930dmr220010665e9.8.1788004720135;
        Sat, 29 Aug 2026 04:58:40 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm111107945e9.0.2026.08.29.04.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:58:39 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v3 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Sat, 29 Aug 2026 13:58:32 +0200
Message-ID: <20260829115832.8749-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829115832.8749-1-robertbozik@gmail.com>
References: <20260829115832.8749-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v3:
- Comment above the entry cut down to the sensor name; where the link
  frequency comes from is documented in the driver instead.

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..385400a58 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV32C4 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

