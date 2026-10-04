Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828B233126
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791157230; cv=none; b=R9WC6KnM9aXIiv5hs01EwVyqXF6yTCBCPG/4NSDMXatq08q99nlqHtnN2BrqQEfO629G1B8Lm0yZ8LRjlAEMldEcqo8VRWGj1i1MGiXVRt/nC4QL5v00XI6C5gQQg3J2WddT3IY84wgqcsY1pzNStg/Tq1afekzRo/QTLZsn9mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791157230; c=relaxed/simple;
	bh=yvaTxufrIwkho8DX7z6OfgH+JpfarfquEpramxfpBP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r6a+Hq0TvSNu4hFrtyUT4ZogFFbYiSTzccFtXE13MGbYYpNQfGdKSTz+Tajkf8IpDtF4x4l4hmtQELM01pnPkKj51mK1UT9Q8i0BiyY7+BAYZTVyIqW7BqGfW1myY41etTaDL//TxhK8nFH89QPzGNlmY2Fq39zC2Pj2ZX6uX3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWc4jqER; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWc4jqER"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d1802740so571609a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791157229; x=1791762029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rXZdTZVRpXf7N+j/R0iaLaKjiIHPei8gO3MrSkIgzc=;
        b=sWc4jqERkE7x1/ofKM8EM2ZFowP2taPvne0bgc+5OxI3n5GDsRtAph+Sg9rF06jbqA
         a9fcqRSd0nla5fWVc83fL6BsxMfG7TwOK2FO9CdNavyKRLLva2/geHWu/IjCDfSjBMrg
         q8QuNEmF/N+Szcc4rmp229gUw/ZklDtw4q8VaAmEfAAODb5IuHnc1/qj/jgwgbUPNr1F
         1MoDfXFKkfHinz89mNcBRhS7D5CW3iG7Gf9wYFE2M+Po4zGiLO4ek4amT8W0DJbwOogC
         6pBIZ/697OCCrttExt1KoCZLlGdHd/Gh/KLgrH7uyLGkQQkzOpkDQvVXZPLiRlwx4ykv
         UP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791157229; x=1791762029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rXZdTZVRpXf7N+j/R0iaLaKjiIHPei8gO3MrSkIgzc=;
        b=P9UW4q3DVBfnmeoWMOKfhSxh7WZVgQ7x8Aei02bKqwuXnIZ9tGZDCu6ad+h8hYvm6V
         inaC4oFuVomh2AWaol/JfSclr15LQsVdXHjMVTFzc932E1qO/SZ33usL2avrg1IjmNvJ
         uSiOtRG+9rddBcCNX0f+NrHwder7P0gpIdn3mjDx90Cvv0osj/dghMSOo1xZwifywjWe
         bS49YvLf1nrvSNndhY+BHVhgdk/bI6L5cu0uwBR5Y/pS/1VTw99WlKyOhAS0btxcAejg
         Tuk29BX3JSYR4Ra0psOdVJ0ipkg9CGCLuDQi5Xm4yAFD6QFce2AE/O5yzC4rZrgsvMUE
         MZqQ==
X-Gm-Message-State: AFq9FYI0pS9R57RmoHlqWUccxzXciYfbqDXmo+iKaPjch0qF3KKt2wps
	Q8fPUR3cJZIxJAcAGCEJ/Un4KO5aO+Dbk/5mYpkOGnwk8z921JXlDAvmqJtcZ4FJ
X-Gm-Gg: AYBFou053vvv1C8gaPMOctxfsh/m+qJiVHlv4WTcxV6XU6oHpURWwfmVoKO1w3OWBmL
	+N426bvHMX1u+ZFb4pgmVldHpLfKEn4xZTcdR87mdwrImlOaRAqQVanMMZTI0aFE+2S1SdJ5iAQ
	xabFUZOcPadX6HBR1uuCvjnxxS83+yb2emGK9wACz9MQcftCiGX6SPnqOzb4jIafwiftq4TXp8B
	MLL1M0mvhYwpMVkmj7ul4V4PKd/yeSFCdB3WUNBBJZ2OFGt8b511JlXScxWas4fQikD8CwVm/6J
	xHtSr5mp+MGeBSPxVXbYc/LBsTNGiv3SD1MiOnBFAgSSXhW/dbFU+885VedLNuVFFOhEd+v/eVk
	cjcDhaxvBeu3u9mctJj+Jl//6t2FMOiehrG7+KVWg9UR2DZJSuuyOLkjDEqua3+xBTrGuunymi4
	+G2g1aHVGfsyT6DeK8mg8NBlKTLbqIOUoz1Ymb+1dlTycefdUUP48H8Lzgi90lpAVMHT4dNyAsP
	IDdGwh+OfDWPRAxokrPYYEMbOkb9pawvZwGrLMflc/tDJ+zWxHkrLycPXydl/ABKWmMVlFVfika
	+pOvnDsuvphlXuiI61D4JwsJfwa26jrebv8bEzJauGX39EY8
X-Received: by 2002:a17:902:da91:b0:2df:83ce:724f with SMTP id d9443c01a7336-2e49b615cf2mr85031045ad.30.1791157228685;
        Sun, 04 Oct 2026 16:40:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6a99acsm26962985ad.34.2026.10.04.16.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:40:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] macintosh: macio_asic: fix macio_add_one_device() kernel-doc
Date: Sun,  4 Oct 2026 16:40:25 -0700
Message-ID: <20261004234025.524281-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment for macio_add_one_device() does not describe
@parent and @parent_res or the return value, and describes @in_bay as
a flag although it is the media-bay device the new device sits in.

Document the missing parameters and the return value, and correct the
@in_bay description.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/macintosh/macio_asic.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index ee3caa3d87d1..04fb0ffc2301 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -349,11 +349,15 @@ static void macio_setup_resources(struct macio_dev *dev,
 /**
  * macio_add_one_device - Add one device from OF node to the device tree
  * @chip: pointer to the macio_chip holding the device
+ * @parent: device to register the new device under
  * @np: pointer to the device node in the OF tree
- * @in_bay: set to 1 if device is part of a media-bay
+ * @in_bay: media-bay device this one sits in, or NULL
+ * @parent_res: resource to insert the device's resources under
  *
  * When media-bay is changed to hotswap drivers, this function will
  * be exposed to the bay driver some way...
+ *
+ * Return: the new macio_dev, or NULL on failure.
  */
 static struct macio_dev * macio_add_one_device(struct macio_chip *chip,
 					       struct device *parent,
-- 
2.56.0

