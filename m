Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD7296BAF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469413; cv=none; b=VW0eqXX6gzyIeOfKxBxELGMl5ABgO20D+JtTnKSDAvlGAQufIT3NB/G1hh5nsDBnfFoUoCwNGFUxOPLLLM0EdrKNyDxd44/5oAnsbslwzp0WFP7M++1mE3V/RTli3ykKbz9fuqQQREMhP3lD733qsVnylvu355No180bH30vxm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469413; c=relaxed/simple;
	bh=ILq303uOQFApqHpSwLqgfAGel0sWx3G4WA50cRfJoXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2uUq4zvwDNp2VWTP+5t4VGaGyiAJVp0AOc7vK2Xu33S2LtOrW3lCYcaD3UF4mxoMGgzoeKjrqQGCt5UQqdBKEqDWM/KwkN+NkWrt5463dTGUcmEEzS+Ya7+qvadqHUWc6vNPs8MmMLNkQcjx31o99i1w2eQTq1aVZRxr/aXveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYTCUd+Z; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYTCUd+Z"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso14793251fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469410; x=1791074210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfImzflZZLyN3OyiIswXsjMHX+tP0A2H1jilGnkUCwI=;
        b=JYTCUd+ZRoFluiY+Rtz+o6HncgmsTusl0F8Vy0QvWDAReQFkc5gC18pXGpRBd4J+E/
         V+HPT2N6w8wSzfdJfG8MyCB/NvnOVYK6wuIksCF+UHqlAqVYi/1nJ5XaZg59K7e60z7T
         VKfEYmcpbCQZ/AYL+gKkW3lghoFiXA5fPjr/Y6DowO63HVq4Hh2YxBZQJN2nV8ucpTF6
         pVYxT9hVT8BeobvVqqWpydRBT22P2WCaWleNMNN7wJzRDlB7XLF08kTfqV+zWJb2Dnnc
         LvkzLpLbDBdN03EeACAfar5LKZS5TQl3MtpuL5w5um+BzDNiN2YmC1NCht+67VDwCPQ5
         HWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469410; x=1791074210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfImzflZZLyN3OyiIswXsjMHX+tP0A2H1jilGnkUCwI=;
        b=DAlX4xLoUFkkMfcD70ZjOISRwPLnkeDq9XbPT+I/66qJjC/ckkFY+Qj1nU9Rz2Gdwo
         JkjRTycIJELswB8zCCAWMulCgmtr2raVvz9BjfUrtsGnZSvxBWygqUB6NSw7yMEXkU4k
         tMvdfcVpBE6zUeOBnh3PnkU/ew3TfKw7aiBiytS+iB/U6oPxcGEWqRwS80zghoC0b0pR
         JSgRtDU6zU2ARY2GdiPua0+f70wkdO+cpge5Ac4kMi5Et2bC4MtP7c4GS0oTOcBJOG7a
         FtqLxfCR5PHquI+2DtRC+pJ4RJyi+k0LcXi2W0UxYNTnhxdU+ABinntwq5uCZjAqn6rM
         4GXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLZxxqlV1ObmNqMRLxvs+tC961UnUDT03wn7/EgpovUXnVyYygr9ToJDK3ihhMd3SER1eRlfNgFECVWMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2RFnqERcvRRKpgYLvpZlKHPArf6WE/ysJVOk2ZCEWmTZOeYek
	yyx4SugxROS/+0xLf8HuWUlnvIwXyswGnquG/Q/AXg/hRW55B6KqvYGa
X-Gm-Gg: AYBFou23fCB6Y16IDzsnoUN5d74WzHcmhoXQw4zWaPBgx+80c/umb9issi0isZA2waU
	gLv1GRgHr7UEilg/Cb+UKQQY9KAOZ24MGzvt/X/WcnSTKZtfrffjxBFRg2cIJELPFrZMo83p/+j
	fp76riZ6kOy6BxhHXcbPivlranbDbbINjsxlRBDjBHdCy1yXNNBuLgXbnopBITE6XDels5YUi7j
	n+BBrcnH5VmguCn4y3/SfaUDeBHFfGVPvnJNEebMeqU8jXUuSwnRMRoNCuK2b4pcg7KttYTKLiA
	xTT7OrUxAJj9SsJeaMVyjUySRqcG0M0b6V7h8A3FvUdyPRj2DwFCYLy3EWIclvhbt3t5XmkofUu
	X+jBm6pAko/8Ekj196gl8k1V5106dBrQSO4myV6AULUiMs5hX9jyvlYZ65CBa0JaA8Wb6UInpDO
	FrYJM+DRH1u9QHJcB9ZUWv3QM5D51v3OiXMJJ969dyknQSCGGUASOBnXlspmwlqAgmZ50kxVSYo
	AcljejbX5ONURGuH5dXv+LlMw7L6l4iiaa/aH0hz34=
X-Received: by 2002:a05:6512:628d:b0:5b6:6b8:1fc1 with SMTP id 2adb3069b0e04-5b8df040f22mr2889145e87.11.1790469409691;
        Sat, 26 Sep 2026 17:36:49 -0700 (PDT)
Received: from Shigure.lan (n30b00u6luibwsaibf2-1.v6.elisa-mobile.fi. [2001:999:2c9:b0::44e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6a8bdf3sm1572795e87.8.2026.09.26.17.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:36:49 -0700 (PDT)
From: Niko Huuskonen <niko.huuskonen.00@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niko Huuskonen <niko.huuskonen.00@gmail.com>
Subject: [PATCH 3/4] ALSA: uapi: Add hwdep interface ID for caiaq devices
Date: Sun, 27 Sep 2026 03:35:31 +0300
Message-ID: <20260927003532.289468-4-niko.huuskonen.00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
References: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SNDRV_HWDEP_IFACE_CAIAQ for the hwdep device that snd-usb-caiaq
creates for the LCD of the Native Instruments Kore controllers, added
by the next patch.

Assisted-by: LLM
Signed-off-by: Niko Huuskonen <niko.huuskonen.00@gmail.com>
---
 include/uapi/sound/asound.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index c11da9656e38..767c96273245 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -99,9 +99,10 @@ enum {
 	SNDRV_HWDEP_IFACE_LINE6,	/* Line6 USB processors */
 	SNDRV_HWDEP_IFACE_FW_MOTU,	/* MOTU FireWire series */
 	SNDRV_HWDEP_IFACE_FW_FIREFACE,	/* RME Fireface series */
+	SNDRV_HWDEP_IFACE_CAIAQ,	/* Native Instruments caiaq USB devices */
 
 	/* Don't forget to change the following: */
-	SNDRV_HWDEP_IFACE_LAST = SNDRV_HWDEP_IFACE_FW_FIREFACE
+	SNDRV_HWDEP_IFACE_LAST = SNDRV_HWDEP_IFACE_CAIAQ
 };
 
 struct snd_hwdep_info {
-- 
2.55.0

