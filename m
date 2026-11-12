Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467837;
	b=CWE7ULCSTXnG4TlGvXd24LLLky8As+6gVs5G2dxYxzltyC325AOZ0T9KfPaNPpGoYHDX
	 4ltL0cUjdg9NlTqWECgKitomlCQmqAa2pcPqUXy/NBScN3g0lXnuK0WLxNWfITq5otJgg
	 qUmAbdSXxUc4puz6bu4PtJ8ExvqqvqSTL+GA1OWcTadjU0+d4+5YP9efMW5mZ8jk4H6iv
	 p5RtBGP+HwE4N06jI0gPtgUt0bLigzPS9bG09D0u+rejiQOmQ4AJFI5LHCd7ebcfuD0bo
	 rn2rrrpMBy6vQFihHcoJyNCF7MFVIw5IuEvWrYDEjgRQp5P8bwOFzYZLXuZfJmgXrgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467837;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1lNR1+qqV1A9Vg8q2pYN7rVctFeS+AWP2a1L6Rld6aI=;
	b=mDdV9dlLKXGUsfoLTwIlcHAjf8UeL2x9FHe8mnfklUt8af/k3Sbp7bgD0ONUWstyjL9J
	 9ycXpHxTn8fcuWYV+l81P5izN688hX5vvDLzE3Dbk9dtifqGpjHvdJ4m47lDhmdmy616F
	 mvFc2AmHNZT9mP47Zq6TM1O6knpKuQso7vv1T/dcjQugkIOCFeO8+Vp/WEB/Zu1DXP6J6
	 pu+KZTJijyaKDC0YC2ZFenh/98cSxlCeFgzH877FfjBkXVUHbYRnd55lQpOIBznJSdiYY
	 qAzu83/ePFp6srmHcICYXa6A+cOt4r1lRqtsrNl1wF5F6zYHJBbEj7nuRcfFcCoRmUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AxSxYvTw;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97523606A332;
	Thu, 12 Nov 2026 07:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97523606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AxSxYvTw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AxSxYvTw1PfeZks0cRQKaqr38hgaD/Gyb72Tk61p7Cn99q1aZJzHAqN/vWLNvR/QL9yY+UAibN/VA
	 Rb8TX1N8wZEK78UkL7rCj701/4HDaJvxRf7Np/JAz8ZmGsLjA9/20jCJD8tM6IgpELSWxsdheyTWp6
	 ayj1gVf6IgsxhVjE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af567f9e57-7ee2f;
	Thu, 12 Nov 2026 15:17:13 +0800 (CST)
X-RM-TRANSID:2ee46af567f9e57-7ee2f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af567f8c2d-f7149;
	Thu, 12 Nov 2026 15:17:13 +0800 (CST)
X-RM-TRANSID:2ee96af567f8c2d-f7149
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] regulator: qcom_usb_vbus: Check the VBUS control source update
Date: Thu, 12 Nov 2026 15:17:12 +0800
Message-ID: <20261112071712.154524-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

Probe disables the hardware VBUS enable source so that the regulator
operations can control the output, but ignores a failed register
update. Probe can succeed while the hardware still uses its previous
control source.

Propagate the update error instead of reporting successful setup.

Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index d909a6f2b7f1..035229d8744a 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -158,9 +158,8 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	}
 
 	/* Disable HW logic for VBUS enable */
-	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
-
-	return 0;
+	return regmap_update_bits(regmap, base + data->otg_cfg,
+				  data->otg_en_src_cfg, 0);
 }
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
-- 
2.51.0



