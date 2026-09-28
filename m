Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A0C4EBAE7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614252; cv=none; b=kMBDVtEZzMDp3zlo5IOiaKtskDee4Mu4p+dBuIA1tjepbrkvO486x/M5/TB2AjwTc0VqDYd6rvarNiajE+Vb19vqgxP8juSs6sM0I45aftYQaWN9TnV+WadVgU85JB6MA1rWdRSQVtpfbWBJcmBKBiExRrT5eWb+SfyBMhtDrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614252; c=relaxed/simple;
	bh=vn8yjXaDcpQywxawcEFzJ56V6mC0wurawB33i7t3Nog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPT4nPApObzLj1HU3yTZ9meS+oSk5ZTl1KCRp/aTPz6xuvOoBoobWAwNsqrD1hzGXPPkPf9hzMs8QXhqN0C268z9gkRHtV0hHuZUFYTzbTf+t3EOT64YLXXK8MNaX2nKPVjicdCKKgN25j7dTF/vF5BqN6T5tpC+QyIYtDdhzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQSwL0hS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQSwL0hS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso24543425e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614249; x=1791219049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=jQSwL0hS2EcHV1LgRxw4jMItzteEvFuuQgsHdFAzOBjVhJg2dcbGBPet8YRzXTo3x6
         HE6FZFo+1Ruhjsvq3rWb52INtVkwV9/aZ00SJw5SJoTmO8slO4K4AqAH+w09URstew49
         KOMQ1yl8V8xbvkFCwgzzCyw6eEAOqu6V7LHRl9zdt4VPWdsdSS5xDaM5SYiLb7va4gYS
         1Mva5JQAcE7w/2LEwKEh9AEEVaAnYpJ1ZbCM5Na5FTf8tTudJyZU733WU/gReld1N78A
         I5u+G6jMNgyEC5At1mLlNdaL4/wl+4/ovybx5JPzJlhUKrllGe1iZIC45lskc4bwOzYU
         lcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614249; x=1791219049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=mJEU85wNcdixJTeBf9lUocsjW+qCM587lTjpKN25c8YUcPo0aY9BzKn5kiioPYeJ4l
         xOWR5QfBigyjfWs2Yu0Ir+H75whDKfUvUouJsDw2RNVfZzjj4cLRR4aWFxch5nw5yrBX
         mb+pByfRBaLVS6x9MwqzJP079nLSW5S3D0yTCSHtPNcQwLBCvtqus5R4nRP2/K2SqOtO
         Upp5+262igY4tIo0O5Eh+o40KOKdCS+LoXI9xQ3b8ci3rLRXFZEamEGwB1kx2lvOCHVs
         D9y+CWuSf1l+qPc6BL9T5EQrKhJHOjuRYo4FJmpNRSBzpkDVU53JIossrIStnJ0qxQ0u
         1CwA==
X-Forwarded-Encrypted: i=1; AKwUvBy57afSKuBcUADIcbbr5dfiJFAO8zEdhVus3uYPuSozB0CufnpV/I0zTkTCT+anMtRlyczWdFkIIjk2YOE=@vger.kernel.org
X-Gm-Message-State: AFuF++kpScjQwlTm9XK9C0YAhcFVEARJci8/thNH5EIDbDnldFGHZcQQ
	92JXGNN7obN0UMusnuWw3G546G4+YxxMD0pY2QvmFIM+zcW+8hJ47/YV
X-Gm-Gg: AYBFou1bRkY9u6F6iHhZeHcxsUhnrTFz7TNfmYT4BY3DX8vmO1xDuTZUofasM7H7Mn9
	HL1O/MBQstI9epaWopa6vRTKNrrp0BhlfdXDJw6jpw9eLy3JPblL6FgHtjwgHnNT+51Q5CzlIq6
	W6aJS669GmGxtdupr94llhjMQIr0IQjbhK0Ms39BbrmCR2uK4uidkhL4nZ0eqZf3FLmzgmAYKil
	6Jgaj4kDzroZOKSnT6E8RrJVfYVzIQ3p8p29QzzBk21J1ymf73vHuEtgJYiMFm25zcQ6qDw3RNi
	AxG1RO3cP2d3FSDJtZefaZ/w7tJmu6dh4T/lrO2tdDZqG4dhPbI2mScvTw5PAUeEMaRAKrwZi11
	kwrj3vO7xBR0tQpb/TOaCXrpMTaDfLW6+Oe4pYleS4y5e6TsNwORnJN/1N8CGq3x/YbmTOHJJIT
	jAaVzU5lhZqcBO8aNW4N/oGqITkVhIsCx1yxKv5s4M4CmvPMywMqMgrBsDMC77EDAB5GiscUgG2
	Tsc0g0q
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fe7bab945mr244219495e9.17.1790614248631;
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm27538220f8f.35.2026.09.28.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Mon, 28 Sep 2026 19:50:45 +0300
Message-ID: <20260928165045.642354-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
(amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
get_output_size() derives sizeimage from the raw width x height.

When the width is not a multiple of 32 the planes are too small for the
advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
The decoder writes past the buffer, and importing the capture dma-buf
into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
sound over a black screen. 1280x720 and 1920x1080 are not affected.

Size the planes from the aligned canvas the hardware actually uses.

Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
AddFB2 errors.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Michael Freidkin <freidkin@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -34,7 +34,7 @@
 
 static u32 get_output_size(u32 width, u32 height)
 {
-	return ALIGN(width * height, SZ_64K);
+	return ALIGN(ALIGN(width, 32) * ALIGN(height, 32), SZ_64K);
 }
 
 u32 amvdec_get_output_size(struct amvdec_session *sess)
--
