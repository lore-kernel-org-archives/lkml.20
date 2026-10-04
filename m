Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777AB4078D3
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108475; cv=none; b=oYPNtU87ZEGVpR2uH358oPrvFkRfv1fkCCFk7lifUmUtiqy2Zux+57F/i3s5qdcHy0xWDyW+80KuNamsDK850UdspplMH2I8D1xWgK+nbHOJK2U4PK8qiu0K5i+8Mn/No9h4PXgrLPdc0EOShJXb4udT2TqN9oa6Q7EdiuyWmZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108475; c=relaxed/simple;
	bh=kKxpjMyiHK9lV9OtcBaphCHIS0puTCLcWrgvqpO3mqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcaNt9fWGpU1jtCh9ArzA4L1L+7TafvvCotnHcZRHzTULMLjMgvlXEpM+m0PiUsgfROssjnyqRmsHkZX7qYe3UQRXhpxB+rdS1jprSZIUk8AzuzUFIYVZqDT4H+q9BlEgWpzBo6xm/9QD2AfJdPmGjlhxLKCA6ZujIjGOsJ1VCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB5kz36u; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB5kz36u"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso656800f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108472; x=1791713272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=aB5kz36ucnLKAP1jt5BMCSeb09oAFnlQHYHQYcy4/GrIt5NCY73BJlWaQy5ydaVG6O
         kfcBbHtykA4abkAGWNMPGbHUyo0y+3zgX29/ztxjEKd8hQW+2N+3uDsiXf7xDYMXZl2c
         UEiaNGRhMwKcEfhVUiPNg+sjqxGQF4b1m2/N0sOBC780ChEFzvnutjWJhckOyHqEBnmK
         XP0lEAT9aVTJYmo2m7OthIO+/gB0Kjn5TVdfQNWqx0GDJdLOpZ7oSMe1K+b1cloTJR+2
         Qxys7g1Zxw97W6MXVXZelKv4fACPCPM2VycoEDpSMEcb/nMJFDMWAtxujBNZEFCnvWo1
         ndoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108472; x=1791713272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=g+ldrPX3oFqy4CX66R1nAKm3ter3USiwWxtIdfl0KUm4Y67QK3U/HZErp24ppL8X2n
         RrvXP1swUIvcbTfzUpTfdFbePZIYCv3COx87KB73MGy3+0rdyvx6nPIzfeoDfb+JxXoN
         sN3mjb2adI5yCsSfmY9OWTcvpaCGnulryWPsuveSK8OBlLVtebzYI9u4AV8JsydNPzSq
         W0xKG0yxGZiaYI0+ALf5MIlmM/lyzz5Ypdl1s4l+3doiVimtkVcptAqFJZ4EutJPdLCX
         GcEcF2sC2zpqAPOLiz7rAbbKH+Ugk7V2en85qWInX4065P3l4FFfAx54Nni8BaWe42Zl
         lEOA==
X-Forwarded-Encrypted: i=1; AKwUvBxSZZqge9jtrbKOcajOyLCc8zhqABygSHz17HTKInFfXdgiABOyTtDUqJyIwNLkBseSiXtGlmbXi4igrAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4d7WHXWmzQZVCg8wqUuqfgSeMhz9/TnsEwFruSzCmAXE/rj25
	wF3dhV8KL4a9e4Zlzi/3dpge+NXbs1Md4cjUiztg8yCQzO0q9epgk1kJ
X-Gm-Gg: AYBFou3ZDH5omzkfi/bVsxNnR8msRQ/oEQahc+Ay7kB2Zh92jd0qKX7aSuObExA4WiI
	h4Ul1wght9C4LgV8BshqKZXlS5/Wyl+Xn6BklM/3nfkYHXSfbsvgHW7hJvxSg1Tp2GMzPhttj54
	1gysvmD/oEGITnngntEl34ta8cVk+n0WEkkn6PIiwyAsTdY/tJLzNQGTro9bj2JLjRMXcVd1zxC
	7l0iDDqlJ6I+lqA01y7ZemldqP0GswHvjWr+0lEauO1tklLJQlFVx7srE+wqOo1sXIFikwtwkkp
	pGsXXgQ0EmRkL1ZtIUPEM/N902NUIXlBC8yKUhBu6vz2aVDw9ZjOktLWBqRhGxKCz2fyATKVjuO
	Q2tm+7U06HFYeWOtiNrDg93/Vjpo0BiM8syKr+8WLwWb4Wi6OVlfUNh9rj3DxTiJmD62zY7Sv/G
	YAfqCjH42VajqaGkTFO2E8LnoagCBbN65yZRCFMmJ9MFX63JGcdgRNlxQA79Gv2uE8RDTiCQUUW
	BZuOgrwyI8ocoVkY0zNyILtkqTqdRGmdO7Vk0xCI55aWpP+xITF7dd6BVx7ytrHUC7KKjhz+hJ4
	S2wKbRHcBvJvrqzM+7cxSHkpGHTHIMNISYVVtawTwTJd8jR3XzxZP6TTCmSJ4mNO1dDWuh6Y1av
	PM+waepkYI0SeYiaX7SXlWL4yLthfV/g=
X-Received: by 2002:a05:6000:2610:b0:48a:f511:e418 with SMTP id ffacd0b85a97d-48c48010c2dmr6844621f8f.38.1791108471535;
        Sun, 04 Oct 2026 03:07:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:51 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 2/6] media: az6007: propagate USB errors from I2C transfers
Date: Sun,  4 Oct 2026 12:07:37 +0200
Message-ID: <20261004100741.71711-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
References: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__az6007_read(), __az6007_write() and az6007_i2c_xfer() currently map
usb_control_msg() failures to -EIO. After disconnect, USB reports
-ENODEV, but drxk cannot distinguish a gone device from a transfer
error.

Propagate the error reported by usb_control_msg() instead. Keep short
transfers mapped to -EIO as before.

This lets drxk stop retrying and accessing the device after disconnect.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 4ce1afe01c3b..5449ceda87e8 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -109,7 +109,7 @@ static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret < 0) {
 		pr_warn("usb read operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret;
 	}
 
 	if (az6007_xfer_debug) {
@@ -163,7 +163,7 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret != blen) {
 		pr_err("usb write operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
@@ -782,8 +782,9 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (ret >= len) {
 				for (j = 0; j < len; j++)
 					msgs[i + 1].buf[j] = st->data[j + 5];
-			} else
+			} else if (ret >= 0) {
 				ret = -EIO;
+			}
 			i++;
 		} else if (!(msgs[i].flags & I2C_M_RD)) {
 			/* write bytes */
-- 
2.54.0 (Apple Git-157)

