Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927F137CD2F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613042; cv=none; b=iy9P4X6R5jgc/Hfj8qlFTciIy4dWB+HnG4FkQ3SRt/lICruO/GIcEnhuzcj2REMB/k++rE3qSH3CuWe8+KdfJFGNy4torev7ZRyE1gY+eHhO695a8Le90odKny8w/9o5CTmYmcjToh5QEnMdVohUhQSfk2LYvOJ5ldFQLeybFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613042; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIAu6xCXxjxf1NDXIo4tbRmEy+mPahjOOWyTppVa/X3qUlOJzLIQZLDIcxdRP7wTqbdG2xr46lZouZxIqUFEDeF7mUfJxhr+I0Qcm95bbF23RnNU1u675Di9cWAbvFSktW+/Rb/U499Vxi2LLZDszhOQS5Kjft4didjbhNmu02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/042iKg; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/042iKg"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso837202e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613040; x=1789217840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=V/042iKgYPLfB2IdPreXqwxtEGHcsSST9rhytjedc6wyIlPRucrOq+UTFtFvTTLb6b
         i5mvU6qTuRN/NC9WROzcwlWxbXJpUThhj+XhFjsIl4yuNaPkEQrgn2AkR87f6sAW5FOa
         R1Qhb0HtfSK5zwBRoBbUL5jipccWYQuwUln+afYU7+elKs6TkzkIvizW1kyKTtVacmgA
         G0NLRymvnaFk3tN2W/Ov834VCv7+s3x7hySUbi4zgxGGSevkXaFp3CTvavxiQPOOcyyB
         h7bPyxa04VuWI8Q5HQJ2Z5P2PtjDp7l3rkegYiy/QCnzK9g6bkfDfh18/CTGm3R6ID2g
         hvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613040; x=1789217840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=mbdZew1mp2+/AdildEpkh5vd/RgKNvt026p5vS79/ivGAY0CM1bBJd35sA/YzCqJGY
         bWhdz3H73o/6EspxGMph+E/RhH8zfNSQCaMe3MH3EDeBvJbmdwhc/7XvBW2x4hc7tFP0
         PlCl8iOkpzVp4qUDhvCP/+QlgUNLXYSoqnXgiKznWmOT4pMxGNMLTaQa74ELZF19srzr
         nsoIWOxRyugIt+QchrS6eC6sHbv5HKSffF99BFGj+Y/w3jF2AEA4zzi0+LH7SONxJ4kz
         MmdALpuyDPL7Kv62NOd1BPjJOsbsWnBcLEQeWlza5tK89MNlt0a7qISSZLI+QKYmmhaJ
         O5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzVaPVCH9KIQX5rUMvCTPA59FRdI7YjkbsH6a0aoXAxjpzQzhgL6ovTbAEzSJ8ZYHvrCylzBE3qv2LCMMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++moIo7zAZZN6bldFBqPh4t8Y3T6jns9X4oL7/VMHPrtZuSMWuq9
	XSdPcDWbp/qfHpgHxVBKENSGY9HVdjFqs2MkOd+f4FUs9II3YZt+GZ58
X-Gm-Gg: AYBFou2iosacqflv4Rb55X9W8PqAAaB52QdWIJVNb9hc+7JZ8gG8XTeKGnxx6wc5Tes
	xadb/gwwllEe5+6eErQSq9u3vVpR1gn4yil/8VcMEbHVXm3TQNGqZuFf7Z7X8YYahTkCi2ibpZU
	9I+U2tN+36LhmuaiFyuJeCXzTEKMXsb9M5u7mGjvFezUKjSOzkdBKVSouP/iyc2mm8lclaQNo30
	B7UF6DVABoB8Ot1zFfMWlK3nwBOgKj2tTRD2zF95QebcfcomBXIpiyoX4dOxy0MJEmcaFw/HFCZ
	Y3xzxrjcEkfrI8bHGapsN2I1aDsRt0q+XXTyfw+Qc/4X8LiDhkLFfjLJWHYuH0HUVYJQO/n5Zfj
	rm8nldP0kS5JMUdjONMX2D+358yvPW0TyllCbCTjtctJ5eXmDGgH0XgraCFFwr+DCBjmWZxHwnY
	aw+J4CxtmenTM542fpL7OIhc/C4xPoGPUHyUsxi7DM/0h4MSf1JbRTbfUJqQyT+OmOwDXl/H2NW
	YEKmOdDd5St7Z3HDvxBTR76Av5hEiHr9sFvie0+gVM=
X-Received: by 2002:a05:6122:32cc:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c7ed0c4c20mr6435898e0c.0.1788613035512;
        Sat, 05 Sep 2026 05:57:15 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:14 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v8 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:57:04 -0300
Message-ID: <20260905125706.6550-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

