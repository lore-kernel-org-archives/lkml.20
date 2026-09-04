Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7F450413
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559888; cv=none; b=dOau+uDqkXG0QxymB4fqceOrlVpU72pPAeaLXSnWrr45l0kPNC54TdySlc3sQaiAHAS6vwo1nvvVSE9fpxF4NfewBlbonmSQpl4VofJbsWAIrXebb1bFFTo4XveF1DrPkBtja8L3SBd9Y1v3aSeoEdk9nDewIha96o6MiNbQfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559888; c=relaxed/simple;
	bh=4mIrQseGaDrWXOkGj+VmtS3xT3kzP+fkmkBCoKYUU7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lH55lYgZH87xE46fywNuM9R7tF879v3Mexkxyar91/ghzVtiGwcYVuBcmD51EDkOugAkcj9YedwFnx0yOvvVPQXubEbzF0CyPGcY0kCb6jQ0xPwX8PnZ3fch8kbOkEeWMsSd6TxbevsJINkHKH0kL/FQ0tr6QhevrcLjSlnmF+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kEXUa+jN; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kEXUa+jN"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a45b3f0becso1274195b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788559884; x=1789164684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxj4NP1Iiq6S7QGXGCteoLSsgcXgpsaLfh9MJtp5gfo=;
        b=kEXUa+jNsszt+1RTNnDYmbNl+SPwL4HoN7QcMbA5GMpIOzgdwvBlEfx48dTSAan0Oj
         xdplGynd4TuoD8huD/vtMH/lxokEX3bnlKJ6AmCZZxCE5cEZa0bQzRTbyqtR0GpssX5q
         hlnr1EX1hEKg21juGenQ+0SwbWn5+4lnem4L7aN8slhMC8QKuHcAo6rGBeGqABJ0KYxM
         Pql7stQG93t8WWseg1otADND+E19hCapBCa81WcwbtW156AR8+oLyM9xza1nGANtXrMj
         yLsmhluTNWCzi1yxomzSpAGKVDo6sy1gDwd1ktO0KqFajRY3BhPksBD17gKIk3nj8Vsa
         EnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559884; x=1789164684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxj4NP1Iiq6S7QGXGCteoLSsgcXgpsaLfh9MJtp5gfo=;
        b=J1mYjU2l4K4sry2ETkx1V1Fl3TU5UGY9u6JL6uLWp7P5xCLn8YFeLIPEZ/LQqt27kz
         IcobbUSvJn5jUIJs4ofzdHEgLeRzbdQTXPHGPsldXUQBZr1i6VYNYKYVuEOEGWC2Ph4t
         b1t31Wy6M19ANLUqB4GbXgklAq/Xyf2AC4ZhMSXJYljH/sx4N5D/N5VTHSS1epjXmel7
         v1jH6NQ8KK14Bc2OuoQzYbMGkIwLcCpWup0bYiCy8SUTNvoCQlai22iRJhWxFPPEcNbm
         c7m0jM3mQu1vX8HH5d8dapCDRHc4NmqHJ85YvLAx12yR3egxiRLImsB6F2kdt9YuLAjI
         m7uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEBNohMTav9OTg61o26sxaOXPl/VBaxRH+TeXlSshZVKaIoYm26YYFZyoIiaKuHge7gBI5QnY/MpMTB1E=@vger.kernel.org
X-Gm-Message-State: AFuF++nOTNL+M7P3eS7r4pkpQ008CrfkE/1FMrK00r21lj7N6Mycl1X+
	S3sOPPQxtOpAx6JSKGGM/8Vbb4EdpMGeRgaQl4ooOUdi1pMTO+DwgvLJ1hrU3pYKNxQ=
X-Gm-Gg: AYBFou0xLoGVXHNMfHs6jTmBTOtorfNCFzGfJBVfEq1vIX5Gm34FqO1GjdSBlDx5Gpx
	PjhThDUX+FhbIcCx4qxRYI3bLZXwFBrOXQNl3ixTE80j8maNSUST3mLHrDm8uepmNi8HX2jQniu
	Fi3HeOxvr9gqlN1CrrAkU2KX5f1uRhhx1wxYS+Ls0OMaG33T/jClodX0pAfN1a0Rzb18VmpngVD
	trr79viAv1FkeXW7fMOnN7hbj8dTrsDz+2HrvUPLNCdzEjy2rlBmS1sJlUN4Q3ROWNFmvhZ15iN
	CRwPtuStVb2XTwyV4PiO7kq0ja8f17A7ZgWkuxIr68mrx4FIvijYIZyJ4tmlm1EcEQGFxMLUuUw
	lOVc7mmizcwlMwRBG+g6N0Kyq8s0xkPiIK2yBS79owu3INJFVjWT1vm4d4geaaa2Zx1zuSU4TgO
	Aws39VVgHX7xBzX148OFenVxkeQpOQsl+da4UI0reoyvd22RoG1O6PmIy4SzwSNW4uMg==
X-Received: by 2002:a05:6808:1406:b0:4b5:a7a3:25ee with SMTP id 5614622812f47-4b96252944fmr6559379b6e.20.1788559884399;
        Fri, 04 Sep 2026 15:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:4324:3ccf:e2bf:d545])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1ff95sm3187113b6e.6.2026.09.04.15.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:11:23 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 04 Sep 2026 17:09:53 -0500
Subject: [PATCH v2 08/10] iio: ABI: add sinc4+sinc1+pf1 filter_type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-iio-adc-ti-ads112c14-filter-support-v2-8-f86592360658@baylibre.com>
References: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
In-Reply-To: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=4mIrQseGaDrWXOkGj+VmtS3xT3kzP+fkmkBCoKYUU7I=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqm0HlQXdNNIv6P1pCGYX3k0ytCkSsrBvRFD/gx
 8Xp0vh7buCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaptB5QAKCRDCzCAB/wGP
 wOjrB/wP+pIBS0ZXanR7Fag75lIXHQ8UPkpwn3bDpjabLNeuTguY43lX/pl3e5xPSXNgq2n8JmD
 7IM5RXzKz/vQupNeKlsz+iAbseCmomlK4hVfkMzus/pUb+wpWpOTAlTQN5v0z//RJmG8ocka2bZ
 kQjgPg4pKRmrQzpyFYyD1ss42q7k+JKcJTY9bukatphXZKGU7g/pIpPpBkIjPllx9ZZN8MHAP6I
 H2YevGAlw6t4zFIyP/MOZ6kr5Vy0xtsQJnEoVYbxlyLUYh54wrfCcVf6V7ZFVBws0edtP3zTrcm
 trxOOshaBjbYzagMhFWzAn8/db8LvuCDK+SGkiVeS1SXnq+b
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Document "sinc4+sinc1+pf1" as a valid value for the filter_type
attributes (used by the ti-ads112c14 driver).

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index a4f5595722ad..a8e1cb8e7490 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2380,6 +2380,7 @@ Description:
 		* "sinc4+lp" - Sinc4 + Low Pass Filter.
 		* "sinc4+sinc1" - Sinc4 + averaging by 8. Low 1st conversion
 		  time.
+		* "sinc4+sinc1+pf1" - Sinc4 + Sinc1 + device specific Post Filter 1.
 		* "sinc4+rej60" - Sinc4 + 60Hz rejection.
 		* "sinc5" - The digital sinc5 filter. Excellent noise
 		  performance

-- 
2.43.0

