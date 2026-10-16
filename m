Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B98042589D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141779; cv=none; b=WHAhrjGow0B3g2R47J+AocgtYZQZ86AkPiYtsajy4RvW5QnAhuAyd4yEp3HW+g6RUwX/tiwnv9EquvG5/fSO0c0jvjwoFhdhELiU7yifEAIiVJaaHiv6dXYpUaaXgHVEddi+EzE+H0UAFmZcV6BCQzcCkRorJh8KtJ2fwx9oF6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141779; c=relaxed/simple;
	bh=zoRBRCh+klw0RRHEztBmxLr3kasJ1/aZu+NJAAfj+oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V13xe+UpY6+VFeXBG8aLwSYyrE67kmfN0oQYXx86m6TCSHKYgnu98UFX6wMwhlIgCtovB7QmyXp4jrUlvpZdjOHaD/qrFkwy/xXS8bQm+pb8/ceKFkGeWtmbULKsSwxfOTHWcvSrxi9mhAgpNNOYx5zHTrooF7BFaKkDZj5Sv58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHdsQZyT; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHdsQZyT"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2692629a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141778; x=1792746578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvlNIlYEgFWeMZAtJnAcYjBkprd3tjTExXS+TYQe1Ss=;
        b=YHdsQZyTrCsNrISRMw/nPtW0pA+sv0KsPDUDrnb47zXcwKby5/mssYSKNbIhwxtMNA
         qN5VcDSJINSCJfL+r9aaXdonQPPRgqBOp9E37AUGy9TXtzh/JXv88FBI2K0yEJJYtoPH
         lIwNk5//BH34kojH0C8eDCqU6oTfxBM+yPpr6DHvlvGnxe/7f7lR4GxvBP8FW2c2tnkr
         fyWkY9KKWu3WtC70z3M+6a/o3SKkNjPtyOcadcQaiiV93hVcygvqBUFjR6Jfm3mj78lE
         ESoqc6Eq0d+IAcTORTTnsmFpiVLxbWUqVDbPgCvSZ8cNxW7zmNx8sSFjDLGGJU4ZuzgE
         AJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141778; x=1792746578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvlNIlYEgFWeMZAtJnAcYjBkprd3tjTExXS+TYQe1Ss=;
        b=FtA4dYQWyG+CISK/Dnm64/eRgOtg+RSMEh7Ee1Xiu+zq/z7qJXGizlLwh7kBb9LkWT
         mTQTCNXDGgf7ohl5Zkk38Ge/JDN0fy/rmWI6v0yCpaJS3qIT6YnV86bgsHSFdMQi+rda
         zVHU23lI4he4Ace2P9AmPaPPYrfKkBzFv2CgFiJWSrOJzD8QqVy6uKndOPuwJabTZ1/z
         9Wxog7qN1hMMfBKpfxnAbakSYmSvrpikGpw08xgG2BoYrDHany3ELh6W6SVPXsStbwdz
         1zLl8wyxnezUqJiUwMZEkiFaW5KmlqYtkPNbQYdh+rJYVd8n2ZLZQuScDueBfV6KpXY2
         Patw==
X-Forwarded-Encrypted: i=1; AKwUvByprUhkU1HEyY1Y737FiOb0rBGAp9YVKMauEk+Anlej4FlJbbcq9kHKwPbie6a8NmNbOA0ch+83R63/9t8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI27vY6GAca/QPPtu2a4GlavpljL+fctYMeFL6GB5Ly7Fu+PCGg
	quG8xRXs6OhcNihp2zUsfDiY+/L37FKg4HI5MxS8KLEv4C1o9jvlzChL
X-Gm-Gg: AYBFou3ZBPsYJ0NYfhYyjG6k9A6FjAbK54chrfPyDY98f8WBa/Qlp0aEW3Eo2SOjwXw
	MeE9g5MLHisyhOYfg/bAGBdUXZu0TdjKC74cbJDPDu8sRxk1SAeEfhsem+DFHBQgKzFs6+uWa8b
	dAdIeCcpJE3xdwTU4cpgCjT5W85lsrMod5gagY36hKY3IQevZkaM3GS31O3NxAPbYZ968ecdrf3
	Dq/0NAZrXzWkOfhg16F85R4SQM92yquwF1gQdq/roZSXUMI245H7WTyOMk6XGk56FcrYtZRJVmz
	UJ7FA0z2vSyYSUlMyTYj5aBwOclkq/kUQ+zVJmDO9iVywx00GYP4smzfLF2nZHkqwtpNkoT1o/r
	NkGV1RXmgNEuR/QtT/P5HPeAicZEUIF2aYjHpMPq0xbSGq3Rp/oqbWkz/c/DZzDAR05VHHqxgRT
	kcpUz6MfFekX8CnR+skaCWrf9sDu1plYmDGM7hBlqK2bfx573ztZxyDOrpJrRmIEv/o6g=
X-Received: by 2002:a17:90b:134e:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ac9259151cmr4962741a91.40.1792141777353;
        Fri, 16 Oct 2026 02:09:37 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1981sm3269097a91.2.2026.10.16.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:09:36 -0700 (PDT)
From: wyibo6109@gmail.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>,
	David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
Date: Fri, 16 Oct 2026 04:09:29 -0500
Message-ID: <20261016090930.947830-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

The dongwoon,dw9714va compatible names the DW9714V silicon revision
found on the OnePlus Pad 4 (iceland) camera modules.  DW9714VA is not
an official part number: it is coined to distinguish this revision,
which shares its IC INFO id (0xFE) with the other DW9714V revisions.

In its register-mapped ("advanced") mode it exposes the DW9719
register interface, with the SAC mode field in MODE shifted by 6 like
on the DW9800K.  This differs from the advanced-mode layout of the
currently available DW9714V datasheet (Rev. 0.03G), which puts
SAC_MODE in [3:0] of SAC_CFG and splits the prescaler and SACT into
separate registers.

The datasheet-conformant DW9714V and DW9714A, used in their normal
(direct DAC) mode, are covered by the dongwoon,dw9714 binding
instead; see the in-flight series by David Heidelberg documenting
them:

https://lore.kernel.org/linux-media/20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz/

The module-specific SAC tuning is carried by the already-documented
dongwoon,sac-mode and dongwoon,vcm-prescale properties.

Cc: David Heidelberg <david@ixit.cz>
Signed-off-by: Yibo Wang <wyibo6109@gmail.com>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9719.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436..f415f2369 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -14,10 +14,17 @@ description:
   with 100 mA output current sink capability, designed for linear control of
   voice coil motors (VCM) in camera lenses. This chip provides a Smart Actuator
   Control (SAC) mode intended for driving voice coil lenses in camera modules.
+  The DW9714V revision found on the OnePlus Pad 4 (iceland) camera
+  modules exposes this register interface in its register-mapped
+  ("advanced") mode, with a register layout following the DW9719
+  rather than the DW9714V datasheet.  dongwoon,dw9714va is not an
+  official part number: it is coined to name this revision, which
+  shares its IC INFO id with the other DW9714V revisions.
 
 properties:
   compatible:
     enum:
+      - dongwoon,dw9714va
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-- 
2.53.0

