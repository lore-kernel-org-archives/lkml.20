Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC713E1CED
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907222; cv=none; b=I949ram80l9xzXA3EP33appNBuuEiVGVnjU/yQyyIgChKTE0Ahd9jK8oqOpHZ7gaLqXUIxPdlwkHWJQEfsUAFuvNMDbvjzZPenbp73YSLlenEk3LIhHZZRTLULGDkjjiP8y0zSi43SW6GXG+bPCt2XS64n05RnITVIcBX08s4aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907222; c=relaxed/simple;
	bh=gmvBmBwdaSAmfCT3eaqFlYUXUaLywqgGGVjdmUgNwqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cuHbuyWostB5i64HU/+W0YovyfNAvz+glbeaODavN9MZX9K4KVXGmShhC0OdZxVFQjhjm5I+5+35ZwnfUFyPOMIu/mYrwC43qTDuF7ecQPHPt/cxGqTsZ6DkaVClcTXOI+3zcZbqH3JTQNxal+YDQK2hFVcZkfs+a9AnhKe0Eco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIuT8wiD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIuT8wiD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47db714766aso1365808f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907219; x=1788512019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ams9vzAHvFHkyir1iT+FKrvFhu2cxSyXqvCfm8j6nFQ=;
        b=gIuT8wiDpVbhzGtGhO5Ru6hfuKVcAJlFAU+vCUXx3NybZcf7SjeaAYAYvYPKs8JGjK
         DH0LWGFvRnqqx/I0Sp8CZFvWEnGk/DN6a0pfGmVTRYFJ2uSn3tKuY4A3DjC3//fccReZ
         8g/R8j4TXrq0GG8uS+HVa/xAwhxqo38PFRJ8nLstyiUXN93qlU+uSlcsVGxyCgpk/79/
         x01XqxQND4QWBWVwmvse1FRHXpDcCj7rljIRdcbrQlN/kW7CneqGEWHO+WzJKeQdHsEH
         cgBq/1dpA/9dK7Hxh38bQ3b7sUpMLm4Q5L4Eja0VzxpQEUCm/59MdLGpBNw+7aZ2dT0/
         KOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907219; x=1788512019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ams9vzAHvFHkyir1iT+FKrvFhu2cxSyXqvCfm8j6nFQ=;
        b=kQJ/H0m2we7Zzto/N0/pJWko1tPttJxv5jdIu3oI1G0eWX6rhU1zcIp1gPxBE2q3La
         xxYvJPqIaCAW1r9/TqZ6ACOnyIItlZ6dSdivOgCAz5DCl/rac5K4bJFDxEbDBN8L/J6x
         ZbiZU8rU/OsWVtCkq9y3j6hh8cOJ/dB07d/W9uzDMCPAGvgJOyBtdICrn8ReM70SJLhA
         TDiLR6WpbUIlq6HjmZ21fNiSv7v/ltcjJBEN0zGCbQlTkXzVoWuSvP/JmBNAGXpC1Qff
         h6DS7XeGPzP/LKuM0YWJN609Kfk+8R7VV3NNHa3iVQUGdNV49xUST1mz7R8ixtDhJAoE
         tj2g==
X-Forwarded-Encrypted: i=1; AHgh+Rr+MqfTY5Q2bftoliMRo7aMSxKHceiMN2v4jTJNeUvRBs2E23MlNePZR+S3Io9MI99+v1Ly5ZI3hI1qWOw=@vger.kernel.org
X-Gm-Message-State: AFuF++kl5GSVb6m3BGze2ZDVN8Mi0WA2kF7/I69MMmWyQu0oB9g+iXOK
	wfeu9ywXSIjsfYw0odKpMbvOKjyPLAZ3ubnFCITHNV2fSqKZVz0MwPFo
X-Gm-Gg: AR+sD13qtFW+eebgV/LrNxeqlOfcjE6u6ladceuLiPFfpN4bQy7dSy2Pbj/bYazbvH3
	0/ttYIIqjpiYZcbym83lui/CnVEVA8pxTpuTsguJEwbqOkcahzeRznF1uWHtxBd7hpcAZptTscV
	akgt8WUASiPrWaaUs/iCInrU6x85azyHx80Vg8HnRMkCysRooZeYaU8pFIK1j28S1KQNgyNfOx+
	mwcuB8TrjFRQoruqeX35gHmS3C4O1XXC0W2THkk8UfQp/IS8pdd7yG+j1fSuRG4XiYhIyqiHEdg
	KrIryoflU5iXqnaN5RTBKYr4cxQy4zAExyaIXnjgrg8sKMKVcbNDgQy1t/ZoSpvvsF0o8jWWW6e
	1EW8UpqnHF6+D/l7/3JeGDkiTjLLEAwAedLaw0I9qed/SpS4sUv7scT1QxUSq/ucaDCIMTAJzw5
	mHo3x6+56wYCwnKg4BGbYPmf6I7gQaZmL+sjebRbM2QyqlQRq48C/M4p5JD+CLdUVXtw==
X-Received: by 2002:a05:600d:1:b0:499:8afd:4a9f with SMTP id 5b1f17b1804b1-49b0dd4e54fmr159448325e9.0.1787907218477;
        Fri, 28 Aug 2026 01:53:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm2921103f8f.26.2026.08.28.01.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Fri, 28 Aug 2026 10:53:35 +0200
Message-ID: <20260828085337.3916199-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The driver only implements the 64-byte OOB format the controller
transfers, so chips with a larger OOB (the Colibri VF61's MX30LF4G28AC
has 112 bytes) stopped working when nanddev_init() began restoring
mtd->oobsize after ->attach_chip(): the parity moved and every
ECC-protected read failed, including the BBT and everything UBI needs.

v2 takes the approach Miquel suggested instead of clamping the memory
organization: the detected OOB size stays, the driver gets its own
mtd_ooblayout_ops computed on the first 64 OOB bytes, and the data
paths keep transferring exactly those 64 spare bytes, so the on-flash
format stays identical to U-Boot and to the kernels that clamped.

Tested on a Colibri VF61 (112-byte OOB): mtd->oobsize now reads 112,
the flash-based BBT is found and read without errors, UBIFS written by
a clamping kernel mounts read-write, and an 8 MiB write/read-back
returns identical data with zero corrected bits. Regression-tested on a
Colibri VF50 (64-byte OOB chip): unchanged layout, oobavail and clean
ECC counters.

The two pre-existing issues the Sashiko report flagged on v1 are sent
as a separate series, as they are independent of this fix.

v1: https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/


Mehmet Fide (2):
  mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of
    OOB
  mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages

 drivers/mtd/nand/raw/vf610_nfc.c | 66 ++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 11 deletions(-)

-- 
2.54.0

