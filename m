Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D038656C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201220; cv=none; b=kY1gV1pf/C5nE0fjuT1IiaXy3NExhG65zslH4QwvhKrUYbruXaUzm8RiXKqWBUbpmXRorad34ylAd4x9IPluILpM++pRCzdyych/LTYuBqjprhypKwSLqYQL9ryo1qIq3DhiXgciMByrlVyHoIkWnb5+mQJ0LBtgt1Q8V5yc2HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201220; c=relaxed/simple;
	bh=lYF78SligfbmmMBdJeZB+swrIY4S2bg5f6e58TpVnhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W98ovkcOzMHFAOhVYKX+NqbBqClpe3WK77HySaf4YgrEfGHmioFalm0xUAmf9ezQB/93qTFg9HS9r8abuHSTnmyeSrNOqYRVvmi27t++ayZlcVwPK6hiX4XbKIZ8KUAA4Jn2XCT+Ip/RhmWFQxyW+hhjKDR4sOnF4NiBKVG2bgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENOcMR9w; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENOcMR9w"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f1f76ea84so760421eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201218; x=1792806018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MprfhLJ+GeuB+aE+V/cNLxEtbCzCGvTLbPrUm1c9D0s=;
        b=ENOcMR9wCdsqwBHJQ0HhhlXCelZsiPI0JfK/1KgkGHtoSIFm32fbiJa/47wbng2RBB
         tpRGThKkIhiVj5s2dx+GujBd5NdAO7nuscTapMrPNCpgoqO4wGBRsIGPTBrfW5pI/aTV
         vTu9c5ZiyWU+mbeUwcQKfOcDD95dzoCnn6yIC76YfzH5UgtvC5TNYs9uw1Q+2Zf+hBbc
         61aucwOAhdLL5bYSPWcb0f9IqFYA1IE4f88wXfbGoKmQ8nNuXgGDlbqsYogH4+HQX9wl
         ljXjGLWOGFaX4ozVWL6/DdYhquBF1l/vBWhJh/T3TfItJhLYyhuOl5ZcAzDy5rWWkAEj
         2CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201218; x=1792806018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MprfhLJ+GeuB+aE+V/cNLxEtbCzCGvTLbPrUm1c9D0s=;
        b=k/JWcZg3oWt5HoOoexg8r8zpWtCdXzivr6UvZk62qqhAJaMflGTTA97f6gsSzI1m3j
         3a6rebpJ6Mlw2poFFUhtfLgngVFD+v1nP98P84NfFK37DqqHbtDI9R27+avTYHQKvWrb
         0PKw/HuDVoIdNe6YUhp0R6B/9pJkVP3DHQ1JCaVCrBwvj+V2NPIaz4BPVMTRocdojeac
         nUnYrNRwBTwNS1WzUfucwXFTwVDP2Yzt098bN6mlMyOdql8Q+28/rGnzYTUkd6wL4H47
         DtcGOYvZVJPb8zZRsfciijECj1YgC83uT4IwW8bLm8I2CrF9kMVxYTfUOZwxSByTLR9L
         n9Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwYwmPjPlZGnaWePmAImxuAvWBtoUs3N9dgJyrrPSA3OpFjFSD8DiFYRcIB1KsADvG2TOTto2D/P52X3eo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQyhgSGrFcJ9gFYamsu3dxWjKffBNgTgkGABHKWltXArfYgphl
	zbRB+Jnl+kMcaG532uEU7y9kvDhdF/F3mpavy0iWWnTiLAmXK34gXNHm
X-Gm-Gg: AYBFou1LxlbRm/1O8WlaigHPhWVhULo9ahgUjyJuEuR6le+4b3FNNqHasP1W/m2zhZq
	EFClkIBqLvPLEN47VImtGa2GeuyoPNBkYv2Jx7MKigRaIFVd5IEdDMpFEsTIv3QzzGwC5egoPa4
	NXOP8f0EX7Z9ThKchVknBcCs9NaK4bc5y2FZIFweKoY0GicXhddTqHflAgmudbpvogXO6tCK9uI
	U9WRMDFo5FWNfYystEDU++zfJpH2L/xtR+6MO9jVR1dbJ9IUeB7szm762p2h2E28NX6VZo0IjVB
	dhOHMAtRNNNz67X6Ve/gftDH/dyXztnC7mnk2/EUhyA9Fe+K+NpQ49qPYZgAo71pHbzEp1GWxgz
	0o+I62NmufpfCfrttayx9Dats6W8RAZWaxL4dThpZY78nB/kJ1s4wN7gmnX68RrnH9Cgx9CPH8t
	HnN+OM9BsJ9y0ZutxEEyeZ2IKHVDa0XuHJz4Y+lNAuKTmX45ziIgT5IhIZj5wFYi/bvzVWcTn0A
	55VkFAZkXGPNNL9B/qlxr871Gu4iwtNJVqscbX84jVdfllp2SkA4vGJTjOwxM4IT52lvfEYqCI=
X-Received: by 2002:a05:701b:454c:20b0:168:e942:4e62 with SMTP id a92af1059eb24-18515691e7amr1818692c88.40.1792201217543;
        Fri, 16 Oct 2026 18:40:17 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:17 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH v2 11/11] HID: hid-lenovo-go-s: Stop and close device on probe failure
Date: Fri, 16 Oct 2026 18:39:56 -0700
Message-ID: <20261017013956.2440130-12-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
References: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If hid_gos_cfg_probe() fails, the HID device has already been started
and opened. Probe failure does not trigger the driver's remove
function, so the device is left open and running.

Close and stop the device on this error path.

Fixes: a23f3497bf208c59ad ("HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 1a2b28e1bed1..694b329f30db 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1786,8 +1786,11 @@ static int hid_gos_probe(struct hid_device *hdev,
 	}
 
 	ret = hid_gos_cfg_probe(hdev, id);
-	if (ret)
+	if (ret) {
 		dev_err_probe(&hdev->dev, ret, "Failed to start configuration interface");
+		hid_hw_close(hdev);
+		hid_hw_stop(hdev);
+	}
 
 	dev_dbg(&hdev->dev, "Started interface %x as Go S configuration interface\n", ep);
 	return ret;
-- 
2.55.0

