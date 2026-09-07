Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8BB370D49
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756828; cv=none; b=OWnV/R5Q4nf9l7IZbquHcDK0aN8Y7cwDjaLSQ21e2TiEKrnQU+/5e0BR/BRMS2ZVid9jX4CKOKqoFzeFNH6fBwsrSPbOAZPZ6A6jdYhZHDjQEVfN+2dzRWkpVQ1rKn7ctaIaOhVisfRBMxoeCJNMOneuNoJEz9nvba+ikoKmJI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756828; c=relaxed/simple;
	bh=LeKSx8H2lAV7UH366MM6ffVBafmYlm5RPT0bQKnfZC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6e/PRtPGD5KdxxorByIQ55VQzYUv0nkc3HpO2OT9k/W15uDL124FNaXBHLAHo6sTlC37OjKA3V2ldXiJIOztuZu4sn8t/QzKIOJKSZGVgeRNzLVASg5yDQ9shwgAaAuSNOpIeXyB+3huVAjqwv4xH3bOSU7Czj1LcUyqi2X2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B24mUncK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B24mUncK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2094672a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756827; x=1789361627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqkW9SdGFzOsD4u+Jwxf7Q1ZRd4OvLy56qPATyIkONw=;
        b=B24mUncKiNjEjN1qBWlWrVxlZaZ2ZmM8xyEis2ECM5yzOXr0ZvrBwc0pKgigP0JWWa
         kI42BJxLwqxtMzwnKqNffl57zL10VFo7dQrYM+9oUwg87eVD8+ljqjcaQxp65yDj1P0B
         g0p8uzc6k9hBZay+UtiIhGVcPU4JEhbKWwVln9rJ7H5QIwvNIk5Ejjro9+fJKP91+Bk4
         TVKSciNGJUJAKz+go9L3bgyIdZPQ+HNTBeOYmOCtimY9VA+VWhwtFtZgBwMu6WMAhdIy
         3lcyhP+KCHKe7eEm6t48KjX1puKLJxdsapGB8SGT5Am+WRooJayctkHEKR7Yw9+Nys05
         biUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756827; x=1789361627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqkW9SdGFzOsD4u+Jwxf7Q1ZRd4OvLy56qPATyIkONw=;
        b=OPV+EqHf81HSq3OtXCexipoNd/7w4L6GleqISl7wzpyBTCw2VUwa6eQpfKnkMvUB3A
         7m7oV8DTwBUde42dAbuCaO5zcQsPKBrS7EyOmDzhzaOLOqBvBcAe+cKJz7Xqn4zg8cZk
         JgpZ5bXO8MgtEOCkAtPzk3kLcY9QNSphmoPMcbO4nIL+9gDf46yFxZXVIn2sz+9f201w
         XchaivDG07sySkRWo8zUCejfevBOqGUIMshsi7xlXGjbJyjdpeFjKP6PJWUkSlc36WR4
         s4bHGuw0KtCS3y28gYIxgknouvEo5JyhkIEhpUsc2ZluoxrvGQZrbUtuqrmVaG2Ilf4n
         1N5A==
X-Forwarded-Encrypted: i=1; AKwUvBx6QgTfzmnXqEuMHxJeddr+Si2KQ6orCBSVEzxHcJJHhVFMuAUBffwgNzX27BRHxpZ3C9a8s5Gt4wCMq3U=@vger.kernel.org
X-Gm-Message-State: AFuF++mTwxJErIBaKmzYCVh9T8yfnWbK9IVHB4Iw8QXZL/RxM2Gnh/uL
	Sny70GFJd+rwBnLXJ5Yxw6fl1HDoWh9I1Lh/yv6KSni7HtOeWmCawB4V
X-Gm-Gg: AYBFou2RwZ13kVajuykaDpO0+YjKP0UA+N/uR0cqeQinoaCYMgxlkBc/xVvNLCstioA
	hTK4nhF/5UjYLz+mW4N37vFw6T2dRSczhbXHt+2tn5n+cxnYVZYl+jmhFXYZonmvb5i8C9Ybggv
	Q78/1WQ+2GtBVsGdVSvHDDiiicXQ44E95aqcwLrC8IraqqNESDHkzSAt781t05hxz+tr5U4lYuS
	Xj0TqoJs5psZ2i+OQHeFpWFTrB+sYIm+TS9kFseVqKCUQupTGhGeyY02khYW2JRHYcH3UTwCW/d
	4Q/d0MtGeLpULQxcUVGyK295UP0WZ3I1XAtl+cbH4S6fSDQj2hutXOILQDH+llQ7oeEH+wBgkoT
	7xb6Ff2tOKSreSKgz/MRcWxzCNmTooaa0iAaml0xRrwafN0zvijdEnlSfo1Blh9ETb9Nuo3cJ1J
	oU71rEWcAIj9Ug6HC6liQIIEoKzj7110hRRxL5c6UGfTr91S4ylCZXBt3l0V03OXlYL8mJCiGMZ
	Am1jnq1QPTphg==
X-Received: by 2002:a05:6300:6690:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3da3a120478mr28353285637.16.1788756826611;
        Sun, 06 Sep 2026 21:53:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 2/3] firmware: cirrus: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 10:23:30 +0530
Message-ID: <20260907045331.16932-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index bb93b24c659d..04015280ac5d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3505,7 +3505,7 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_write, "FW_CS_DSP");
  *
  * As cs_dsp_chunk_write only writes data when a whole DSP word is ready to
  * be written out it is possible that some data will remain in the cache, this
- * function will pad that data with zeros upto a whole DSP word and write out.
+ * function will pad that data with zeros up to a whole DSP word and write out.
  *
  * Return: Zero for success, a negative number on error.
  */
