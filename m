Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D8856510C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999468; cv=none; b=KQlrrRnek5K6lO2zXkf3GW+qiOAvwmdvFSFr2UZt54obUdwWQ+4lbqtYJWMwEmkXy1BjARzIMziR5O2BkragTISEfEtfHWIwRtsbW9XdAjk91FrixIKNImNkAuFoIbMnJrp553AmFIDwntyghthkWEBR1DnH5HJuDXrlyXqVbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999468; c=relaxed/simple;
	bh=tdlRIBPqud+ZhHQo4q4pnSx+uKMSRqHTAuSs1iG0fRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K3QzWi9fiyqqBo3DvA9P8OsyBRDTOSzFUQ6Qz5mRYUGDK0uleS9OTqAlcSaz0jippwAwBfcZFjT3g1LPPCpWMkw6web2hfYx22WVtCH/lBolGhA2MkG5EGg+nG/DA22oOz4tP0oPP06/MAq19SMWXoMZUy0fFkR0B8gqSJFXlMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpfsMsSM; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpfsMsSM"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-353804b591eso7756142eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999462; x=1792604262; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jiGXiZIuMeD+fd3PiQCqnKfyIvL4Mb1E4TW6EqOHmI4=;
        b=FpfsMsSMosBNqQ3Ssee+8b82uoByJ5wLWxsuDXHskeHz6JJgndJqYvEz3gGtIoMiFP
         caLVzNOGqT9sIRqbwSxx+1prbkxL+/mrE289br59x5n9CbdfQuawE+Yxoi7sTprK5LUJ
         JFkZTBtbDCW/WxGJZkKna3Dzln6MKddig+QAtDDq0S1EKjpf/+fOUinlFJPF07gO0tO1
         gfNURgBknB83O8QZ5+ewXmiNlQiFU/fZCewHQZM8MOMlg5MoPohNO5q0GtTUiDAm8bPu
         P8XGnRN+flibBqzBv65rtL7wnZiwJbOKVP7ryQTmkU+s08TqTruHdfiRTwiCvfuGSZe1
         aHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999462; x=1792604262;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jiGXiZIuMeD+fd3PiQCqnKfyIvL4Mb1E4TW6EqOHmI4=;
        b=AyE5CZbFM4skjiOd5n/xaXJluocwRfmA2nLi/jBu6MICAOSz6npUf9hqIjFbETNDvG
         0glWYgRiblqPxaVmF7W55XuY3vcyIpKnJ26YcQRx2FEFDN8wMdWe5+zl5xNv7CBCy//u
         5i9KVgtxLKKdf8iYZVBDBSDRzRf3Y/UgdHrTVlC8OYeafDp+eXrCZdz4VnQjOzc1kKZy
         dWNyyeQLcRe/1o2W0TdLazqlTcWrrE7Ui2Qfi6MDUCW3N5Vk0aX8IswrJzfHZaSWR7rY
         GFGy/jVOjzyCcCLTBs8qcDo3mWK/AV9+13jpyNb4uam4xaPkHzWdhIrsDR6KaqcYS7x5
         ui7g==
X-Forwarded-Encrypted: i=1; AKwUvBwYKoI0IYzx1tPqZiSCdJTBUh1dvjnVpii+IAF01Q5Vjm894oKUC0O/NWhNlZAL+Q4gY++V7YlHxtVLvIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2q8d3nXU1jGFleXn66tb7RCATASXfnB4QLziyLUZuQp6uSpud
	02AB9B8kGOzOfoXRKPourvPGryDlgioCwu5KfOCfZysM3NHSFlGfdOzz
X-Gm-Gg: AYBFou00H1tn5GiqaADTvqQWlB3Ru3ZpYEI92dZbx2BCSI4k+kDGsvzlSpP6Q/Aty3w
	G5Z9S/IbP4eYc8NHmbLB5W68o0vOA4QhQvC/tap3GvvU7+M9fdasNdMBe/zfaD4AScHW7mIa7yP
	fj2wZwuMng+e7t28+zz9A/OnP3Du9bcuexuIhh+d5R+msC5/nPeiFXRfg+v654TvmCe6rAtg6MF
	52AtD6aoGzwJBfIRrzfVaE/F/+hFFy8T8umqZosJ98i6evG43vgj44kHc0Hdtgy1uTXFYKp8Nrm
	sUN7nQGtVFOJwT1TxtKZT84/7L5aUpLZgh+z6U0ehW+jyiVUxRpbPmqUCRfwjcLnmF9X0BH0tqe
	AD8tK108kaCsPJg1uUbAqg2UZLVx/+fOAdU09iBXDuzGzf9D2iDW24fVyem2XcDUqBRHf2+j5w4
	U0h8na1R4EaYw11hm2HaBXxW29TChazL5fGBH01dyLyazqUytA47Q0ZiF2aEi525Aa2BHhIanf
X-Received: by 2002:a05:7300:7301:b0:351:2a18:c172 with SMTP id 5a478bee46e88-3537e0866b3mr29042179eec.15.1791999461798;
        Wed, 14 Oct 2026 10:37:41 -0700 (PDT)
Received: from [127.0.1.1] ([2405:201:201e:816f:c447:39f8:9b8a:fbce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm61523451eec.3.2026.10.14.10.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:37:41 -0700 (PDT)
From: Viral Patel <viral8854@gmail.com>
Date: Wed, 14 Oct 2026 23:07:36 +0530
Subject: [PATCH] iio: magnetometer: tlv493d: fix magnetic field scale
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-tlv493d-scale-fix-v1-1-69a722176c06@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN+9z2oC/x2MWwqAIBAAryL73YLag+oq0YflVgtRoSFBePeWP
 mdg5oVIgSlCr14IlDjyeQiYQsG8uWMlZC8MVtvGaFPhvaeqKz3G2e2ECz9YOz215VRbbx1IdwU
 S/T+HMecP4WnipGMAAAA=
To: Dixit Parmar <dixitparmar19@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Viral Patel <viral8854@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999457; l=1696;
 i=viral8854@gmail.com; s=20261014; h=from:subject:message-id;
 bh=tdlRIBPqud+ZhHQo4q4pnSx+uKMSRqHTAuSs1iG0fRo=;
 b=7YiJVZ7Ah4Y0W9OkYus8X2I16UgRiHjLD0enDJfXvjxjuzrxx07oJcKtJK1kqiILlFg+Y6I6N
 h05luhL9tXuBUH1Mpv8aq9kPj52gbpuDienauv/eq4w9A1EEIkJaHQe
X-Developer-Key: i=viral8854@gmail.com; a=ed25519;
 pk=UC+UDB53t70pTK4wncXf3tfh0hsYMCqpxYnTaKX3MYA=

The TLV493D-A1B6 datasheet specifies a magnetic resolution of
98 uT/LSB (0.098 mT/LSB). IIO reports magnetic field in Gauss
(1 mT = 10 G), so the scale should be 0.98 G/LSB.

The driver currently reports 98/1000 = 0.098 G/LSB, which
under-reports the magnetic field by a factor of 10. The comment
also gives the resolution as 0.0098 mT (9.8 uT), mixing up units.

Correct the scale value and the comment.

Fixes: 106511d280c7 ("iio: magnetometer: add support for Infineon TLV493D 3D Magentic sensor")
Signed-off-by: Viral Patel <viral8854@gmail.com>
---
Found while comparing this driver against the TLE493D-W2B6 register
map for a new driver I am working on. Compile-tested only; I do not
have TLV493D-A1B6 hardware.
---
 drivers/iio/magnetometer/tlv493d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/magnetometer/tlv493d.c b/drivers/iio/magnetometer/tlv493d.c
index 03415cc2c9b3..234e3ce63ff7 100644
--- a/drivers/iio/magnetometer/tlv493d.c
+++ b/drivers/iio/magnetometer/tlv493d.c
@@ -299,11 +299,11 @@ static int tlv493d_read_raw(struct iio_dev *indio_dev,
 		switch (chan->type) {
 		case IIO_MAGN:
 			/*
-			 * Magnetic field scale: 0.0098 mTesla (i.e. 9.8 µT)
-			 * Magnetic field in Gauss: mT * 10 = 0.098.
+			 * Magnetic field scale: 0.098 mTesla (i.e. 98 µT) per LSB.
+			 * In Gauss (1 mT = 10 G): 0.98 G per LSB.
 			 */
 			*val = 98;
-			*val2 = 1000;
+			*val2 = 100;
 			return IIO_VAL_FRACTIONAL;
 		case IIO_TEMP:
 			/*

---
base-commit: ceb05f22e5cdc3f8bd3f7d5dcfc57843942191dd
change-id: 20261014-tlv493d-scale-fix-5a0b83b52d2a

Best regards,
-- 
Viral Patel <viral8854@gmail.com>

