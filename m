Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B667A37DABD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756832; cv=none; b=s5U7LF9CnML2bf9SYwzjCOcd0iOjWT8DJAtQJSAaIIf/to5n9kXZHXg/0/P16BYQ0AmiI1SRvf0HYCpdvyqzj5FsfKHpUYKDKLg1bAV21GbhgBMkXB6DN9/HB6qE33uLBefBgRsNoOzsO1RCsjzXaOmBUFcn9Z1YUEJQjveaGjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756832; c=relaxed/simple;
	bh=HcuxoODQkLAG6+IO7GBsJ2AnnmlrWzhvpuB0c6OY03k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/tWmL1seIu5+RSMn4z7RcD6VqqEbNTCwU385zGIbORC/VUpkAhdksCZOSNldtQT7e2oSOMyau2x+OrS8aaxsTvzmY+juwAYPK6Y/BxuqKV0wtPN6/42Azphcm3OfDZ5V6xwMOMzL2KV5VsYJ4HKW0Mx1CePg5DagdIUxSa/OLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azJKuxqt; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azJKuxqt"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2531725a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756831; x=1789361631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIXXjI/FJbHoDDsTPHAM2mcOs2CeLdlEi+w8VdW/jfQ=;
        b=azJKuxqtOOs9Dwx3lImkftTIhGPbajBppCRc879ANoJf1RSDN4XucLic2dYV2Mjfgx
         c73BCCUoEko1CjyR6vZd9ENgZpyN98ASfy3hgOoR41jh8znnt8fbwDhrGjFSzSTx6nvZ
         xnRjhM0Zz2GqYLPhTHWJu94iYaUw7zwrzAAkI+NPb8RPOmSwcVOxMRtVgTInBEhm6a7A
         CM3WD41D2lFsdJwl2Gf/19xsdd95IW3VNbqQNfiyBc1vzS8gkNgSxf+PamN1PEFcRF9y
         +3AEFZFs8E3LiGytcb6aD9mIjgPLiF8OMlZo/ilJmhqDP0uASqxEojotpDxUuQJMZ4/c
         5YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756831; x=1789361631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tIXXjI/FJbHoDDsTPHAM2mcOs2CeLdlEi+w8VdW/jfQ=;
        b=JE5zAIh7xQvLWGYs0yehEBqpTS1IamWFpD/lxgrjsrQGqJO9tWgnld9JOULrIx47Ue
         WrH3yBAASDQxcFEPV/LUbYrNVLU4U88C1AEe9vH7jeA1kkgwznlAqq1jQnUWwgte049P
         HRM+lX71r6XEQNrIsNLqTFropaDrh3AecTrXU8NneYkgpBs3KS/FaVzpQApgee9l4kFq
         iy/Z148zuydPDMlT5KgIjQqwx1ryi/u5poWLwnaLV3tOH86g50/O0SAIr3w+PiuBquoz
         mkYGQPhbVqVUe0W+WlV5ekBBFMjtvE+Brc2IynSDxkRBuR0pOSVkm0h8+kGVNIamaLh8
         +MYw==
X-Forwarded-Encrypted: i=1; AKwUvByZ2+faSZISaiDg1fKZEWIO9sXhYHVgJUN0d97E+nEpJLzlGN1loVpqXBM4ZN51bSGwGt1tckZYiGmETHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mhz4Hqi4nvXrXhnTqQkbIe4Yfq7e9h/vPgMO/YACoVHsYnnXmj
	+r5XLkRia+kMD9CdNUVVDGRzfoc+BXomxpSW7YmF9c1CJxfXMM9HJ8WARR9To6CzI64=
X-Gm-Gg: AYBFou1OAIPjzpFHmVaEDcQL8M5ashhalc5sMtjmiTVBoaY9n1EWwz2HWOUQo9VQ2Tm
	QDTszOt8gZMTpTRASAgFXwJv6anyzJQVjaBsNQKhctSLE7Tm8WfFdsb6H62gVZw3uqNfoAteEf0
	Ab4FG/oytl/KiTt5DwTFRvDT/o+WW2GyAIEj8GnzDGW/+ddAz0Z+6J6O9oZhoNYkOH5elqjF9Vb
	2pFMKwecRUBnz5r8HQXS6A050F1ZOJ0Y7mv7jy9thUC0XPaGtiyJuX10f7CqaI6Yf2LMDWXPVob
	YMbBdypTds9WWaG+Tjjs2K9Zl7A6z7MzQLcMCgV2QPjTGIofSeEdVIoX5zFINomA+e1ZBMlSIxd
	d0pZQhm5GC+77NV5mE1r31a6qcT5VIrwX5hd8WGGKWgCSwOk54GVKQXzfCWoxFoBbt/vtH4W0kA
	j20NODXXkw4y6Bi6TXGYCyX2SWmuWa9rdb9KqugJaPAUfIzJReIKOYqy/xp+HFq0R6BdhGJukEZ
	pL9IHmApTAQbQ==
X-Received: by 2002:a05:6a21:680d:b0:3d3:aee4:66f3 with SMTP id adf61e73a8af0-3da3a22a052mr34116677637.25.1788756831031;
        Sun, 06 Sep 2026 21:53:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:50 -0700 (PDT)
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
Subject: [PATCH v2 3/3] mfd: wm831x: Fix typo "convertor" in comment
Date: Mon,  7 Sep 2026 10:23:31 +0530
Message-ID: <20260907045331.16932-4-hemanth.selam@gmail.com>
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

Correct "convertor" to "converter", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/wm831x-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
index 744e1d161c5a..6280d4f38981 100644
--- a/drivers/mfd/wm831x-auxadc.c
+++ b/drivers/mfd/wm831x-auxadc.c
@@ -132,7 +132,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *irq_data)
 			1 << input, 0);
 	wm831x->auxadc_active &= ~(1 << input);
 
-	/* Turn off the entire convertor if idle */
+	/* Turn off the entire converter if idle */
 	if (!wm831x->auxadc_active)
 		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);
 
