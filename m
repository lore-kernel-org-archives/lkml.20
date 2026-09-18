Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE24E73CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734036; cv=none; b=g+y6/ZjheQsV/56LxLyzt4+LFT9F/0aJBNjodjh26qdHIrnWfoRTIvefH0YnKyH2OHJ3AKRr0bFfB0RqNV0VCxLC61ljizWNTnIufqXW09RDDS7eis6YGs4F4oNKPKteTVYeKzS+YfbaKWmJ51qIrk4Uh8EsMtS6bV1wsnFAcqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734036; c=relaxed/simple;
	bh=Uvo7ny/vdoSMMXn3s6ScqNW2b/mk6SSiroCPEQIUC8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XvO9g9PGzeRJbKOz9iM87VHqYgV1b20lONbp/XmBqklYnQJSdWIfnZMuoUFKS8+11MPRikWzAEfygZ5QlvoyOMSgE7Ad19EEcjgfmizyIUay75jIrfRHytD7zO62SWQd2DyGX5hZ8lcKYT5tz4su2VLIsqJtJ5mRAtvW+01zrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks+SVIe9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks+SVIe9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so477823f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734029; x=1790338829; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCzi81HLZxZMux1T+BtO3glGJsw6KpWZnk7OAVt0O+0=;
        b=Ks+SVIe9tnfOV2ncbsKrA6nj0VFDPYVdHkg/5+1KcZPrDnaWium7iaIWqib7R5AcEw
         vyqSHpEtj6WlkmWsagOI8TooZDNXAR7tXpUnkzawoo/C7X09HRHvJd1novQ/WelpEUgd
         DQqA/TJwbgZrnzBoEr/3JEsiGjtqwNyns/9lMl0THXYu1qu6oMotHOUEAacMBlDeskzP
         Bg8aP5iAiK4fgczpuAAckjXGTv+NDUbLUymW+L96zKa73DS3wFhjlCdRT+8eUdrHi7ma
         AorIoVEA6qbYLWgT3kzD0fC6+W10L8dZw7hWzJa4k67x+EoyTL53/vDeUa67Px/AeiON
         5HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734029; x=1790338829;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCzi81HLZxZMux1T+BtO3glGJsw6KpWZnk7OAVt0O+0=;
        b=keCvw3+VzaWLD72iE3JCzJaw+dS+cPdaRWrixFDHBOfswvFTdFE34sNeoCe8Ohdbyg
         0RHhWXOK3L/GvT8mcV3ayZ83duGbdg0VanbGOVciSALkWIn1K2/fk4J877b72KneTutL
         cBYAUPe1g3Oxzs7pe4+9oIt6M71UfoqbzC82TKcHwXdJZIS8Etg+lcGHiQ16oEIpOEie
         ABUN8DqnWL6uG2GO/FIO8StZ/6SsdcKPHM1/CWorn8w5xDkDWPVsza9mE8Ss0vB7dStJ
         mhvax8soW8ah85zU9QE2RhhsHKW63XW1goE4jZG2D8yziSAOB6NWXRSrYDv3rL410Vm4
         M40Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVY9MRh2e9TPTNJr/U9Cb2Bn+Wv2YLB1Ni9YEgptpqiOHHdFYF0UOI0plA+vEV5jji/GsgDtIu8GJs3S4=@vger.kernel.org
X-Gm-Message-State: AFuF++lGCJrSwHTAyY/gnNx4o9775mGf1XL6IAKJYSeXdXWYB6X41GIk
	5RXI0eQUA5Asbvq2BhKdY4f+Y2N0LNLWUHRda43uqSeyRN02/7h3056h
X-Gm-Gg: AYBFou1TpGqZbXh+ItAVRdPLXrBIxqESI8f5fnSSF6hqV5BiZ+m0LcpXm9amjtkYWOH
	f2a8Rc0wu6ITIhAgPWbLOu2sNcO/iqd0qydaq1pQi7mHGgUDCNHMytfGh6ROwSytfVJANR+d4q9
	rpZRLvx98g0jf+XAiajIxI2Iwk/pEHWbIclsePmDQPxuS6mtXwuipNn4ecG4Xy2mLXXF8JfRfZe
	Q6PeMdjoJFvYv3ouIH/oM2QixSGLtQGh5FOFxekd6+q6VVAu6P3p9fvrV9P+uacVeXDEt0BqmYk
	u+5GDLkN4PF1K1WkfrskDz4I2q8hcDTJAxVsz9+30x2KNKoW0eBIi8EbZcaAWb4kGiYhen87QV/
	lrQAYF1QOaCZjZHzLnpIKQHoHKX6zmIgwFchEsM1j0d1K+mNXK33myc7W/XsbFaUPA5KEDjlag1
	WJRUApBHtLj1oK8z/QPXOCtLzfMHF6GDCW4SX5nuzxnIcZz3WMjyrSkkyjRcoT+XCztrs=
X-Received: by 2002:a05:6000:186f:b0:487:36a:c870 with SMTP id ffacd0b85a97d-4871e2123damr3702576f8f.11.1789734029028;
        Fri, 18 Sep 2026 05:20:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5d63sm4086611f8f.3.2026.09.18.05.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:20:28 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:20:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <aq0siVcghDe6x9cs@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "idx" value is a user controlled u32 so we have to bounds check it
before calling test_bit() to avoid reading beyond the end of the bitmap.

Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83f1d..f157ed99be4e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
 static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
 				      u32 idx)
 {
-	if (!test_bit(idx, &mapping->menu_mask))
+	if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
 		return -EINVAL;
 
 	if (mapping->menu_mapping)
-- 
2.53.0

