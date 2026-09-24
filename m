Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95F0411A08
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270321; cv=none; b=GqPGfBRkJDiTztYRz1OVh7IMtfJye7EdNdox9i/wXozeP68qhS7wxo/mM4HNJNnaoaJbWdHAoZLgDH36gCasuRi8g9WBa4yU97bHR7fw8eFtLNuu5dOwlhC5pnX4iO4gMnis7bt91Xv+K/gcxwju1532JtZ3DMZ2MYH3pw8vgGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270321; c=relaxed/simple;
	bh=CuWf6bIbnFzPU8Tz7ealvUYWxfTcqU+KRdD3Eedm/EU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0mY8wTN65yPvfe8qNMeydqeSf+ZoWYK6cxXIAMzfNTmo/yaU2HIU9+U+CLuyVmWWNqvrSkPtmZEvJx1+YUxmDdac1lOjl+SZ1CNNNu0YgtObp1/rfKgXVgeIgwhId4K7/V2g/7rqEqwsRFWiZCm0xswXMMEAsDgv4HD5g7/+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rH66j2Vn; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rH66j2Vn"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49a10ee5aso16984201fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270318; x=1790875118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaNVgej1eYyUenr+3JdrpjMj0Wif8qNYfBEtB/czvbU=;
        b=rH66j2Vnhi8DZe2aE5pmqmY0YygLx86PGmx3XMD+MF2YK3IDjxuIeQo9OrJtFh0Jaq
         DjIBTTuJUeob7eLfIId3IzTF6vUK/3NziLRe9CqUnaHIvr3LVEiwr/hixKeGXmrmvy4t
         S8r53RSn53YnM2a2eRtwYnsXr3uvX8pDd6j8KjbK51qxkiOmzvFWP+i1ZysX0JiRUSEv
         dfHEWAPhcdywEgEG9T9UUwYIfP/YmeDZsFoiAaMy2+C0b3odsEGBokLnXkIuNC0QDDjl
         bF/4e7ifCWINZBXeOWfGIJKh/xWNSmaDKS4qMDVbRFWgH/bKm+uzUiu1tOjtn8NP5Nj3
         gFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270318; x=1790875118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaNVgej1eYyUenr+3JdrpjMj0Wif8qNYfBEtB/czvbU=;
        b=sS6e+gjjG9SsMLycZ7m3kFbSQz/cxA7bVhkSI8XmzWAxFqv8u5Toz90+i8eGSRaBX2
         0xTFmQs7+Y44a8YeWbC7xAhtkrLwADt8CGgD4J3GeJuYq1AUwbyQPNrEdfYI90N6jyI8
         Egr7/CH4D97dNf3gsQ2jtxh+Jdng5KI95jokKmczlRzDAwkUowoEtKJdcEs2ydtfmDzN
         SWK8UJ5GabvJZnQxTBIz5tKd97itrhZtU+ifXiFBEeadFxIdOMGgNZibkJz7Ta/fhcAG
         c07tL01MXSX/BHvyESeeeK5ca4NFYwpz3XqwPVLl9EsPOekM72adgb4oA1kKJWc5zozV
         qY9w==
X-Forwarded-Encrypted: i=1; AKwUvBxyXPFOu4IwYWzEsa21bgzXGVXA6TveTZMCSvJ2qQCHdohNSP7KlYC+PdPeHejLyhXaGV99gvDNT3wf6yM=@vger.kernel.org
X-Gm-Message-State: AFuF++miG2YzHzDt+zVgN6CeLF2xfBBS69s3zYtVB9lH9jWPGVLXXLqz
	dEJtR/PrVWNQUXr/hyTD9rPKLWMmuGYwGdF3InDINTkoSiYIihGyQgdM
X-Gm-Gg: AYBFou04vZ2sgwbsqVU8Da6U+fKzTo7DFAnseo10i/y2JZtkYj9hGpfj48NoOdBbRjO
	QONmQjhgK99d69nCtkRKu4VEgFl6DPTuOnm9oroNkPRgeCFCCg8amNLun1O6zWXMD7JuKi4u0BY
	IPZA3sCLO/X0/SXbT3rqAduHpfOTRyoYQM6BL9D7g2deilPMwo3/gf+/4ZSFQcGDeAFjIkBpsDk
	MMoUBQ+8u2wWnOsZoY5KFfKUVROqAtNbSKMqMclDG19kA77WNUUzdZoFxfSbogSdvjQvSQRvRxH
	luWYr7OyLRxDCK6roek+Pk5yEx+vPPNSRxXCYmF6jjhjHbA4HtzbsZdB2ahVeHZlDaVbAkFN95s
	P//UBr3uRLRrdOuryEX5TcgjX8xu2dEx7rK5SkZFbd8kY6IEW0h+rf2WZx5sFfXcmOaDeMGyb6Y
	MSHXndzd0rmKv9B11qn8sBVOgVUm6+A97cTDRGbXCY5ozflUmwITiQlbdd2c2JjFCjHf7ycBsft
	FYSpxsQXXiU6TAfl1KGraY7Fg==
X-Received: by 2002:a05:651c:2127:b0:3a3:37fb:27b0 with SMTP id 38308e7fff4ca-3a63bdb364fmr8599461fa.0.1790270317587;
        Thu, 24 Sep 2026 10:18:37 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:18:37 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 0/4] Lenovo ThinkPad X1 Carbon Gen 14 IR camera: ST VD55G1 on Intel IPU7
Date: Thu, 24 Sep 2026 20:18:16 +0300
Message-ID: <20260924171820.1179823-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad X1 Carbon Gen 14 (Panther Lake, Intel IPU7) has a second
MIPI camera for Windows Hello: an ST VD55G1 monochrome global-shutter
sensor, enumerated by ACPI as TBE20A1, with one CSI-2 lane, powered
through an INT3472 discrete device that provides a power enable GPIO, a
reset GPIO, a privacy LED and a 19.2 MHz clock. The RGB camera of the
same laptop (Sony IMX471, TBE20A0) is already supported.

Patches 1 to 3 wire the sensor up on ACPI: the INT3472 supply mapping,
the ipu-bridge entry and ACPI matching in the vd55g1 driver, which also
has to defer its probe while the bridge has not attached the endpoint
yet. Patch 4 adds monochrome pixel formats to the IPU7 ISYS, which only
offered Bayer, YUV and RGB formats, so that a mono sensor can stream at
all, and keeps the mono codes out of the Bayer order conversion in the
CSI-2 cropping path, which warns about them otherwise.

Tested on that laptop with Fedora 44 (kernel 7.2.5 with these changes
carried as out-of-tree modules): the sensor probes, libcamera negotiates
Y8 and streams 804x704 at 58 fps, Y10 and Y10P stream with plain V4L2,
and with the IR illuminator on the frames are good enough for face
authentication with howdy.

Peter Marshall's series "media: i2c: st-vd55g1: Genericize driver and
add VD55G0 support" (v2 on linux-media, 18 September 2026) adds the
VD55G0 (SMO55F0) to the same places: its patches 3 and 4 add entries
next to the ipu-bridge and INT3472 lines added here, patch 6 drops the
endpoint check in vd55g1 in favour of the deferral done by
v4l2_fwnode_endpoint_parse(), and patch 11 adds an ACPI match table.
The overlap is a few adjacent lines either way; if that series lands
first, patch 3 here reduces to adding TBE20A1 to its table. Patches 1,
2 and 4 do not depend on it.

Ruslan Koreev (4):
  platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
  media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
  media: i2c: vd55g1: Add ACPI support for the Lenovo TBE20A1 HID
  media: staging/ipu7: Add monochrome pixel formats

 drivers/media/i2c/vd55g1.c                    | 15 +++++++++++----
 drivers/media/pci/intel/ipu-bridge.c          |  2 ++
 drivers/platform/x86/intel/int3472/discrete.c |  1 +
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  1 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  5 +++++
 drivers/staging/media/ipu7/ipu7-isys-video.c  |  6 ++++++
 6 files changed, 26 insertions(+), 4 deletions(-)


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0

