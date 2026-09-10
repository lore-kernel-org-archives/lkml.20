Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFE2379C34
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015495; cv=none; b=E19k/0/pzWXpPYauhCM/hBQ7LDYx+2SIq+imhh9YDXbvhDoviwdWy8A4nu+a4eNLMU8sRFLavp8oR6TQv+RRfpSpEC/05TQU3aoA4fXDkHffxGGI8bWw410A2h54f3xAs8bCh3o5b4kSj6l3Mi1x2laZoOszgR9Ky0/CiAwuyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015495; c=relaxed/simple;
	bh=0QHsKllyPpQ6kHwNwzvVNlHG7UWlfT6db9KIxxhcNlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tq14zRdSsmFUrcS8ejepNpSj5ipRlOE2ty2gu9mvXQsA1QB2DiFz4SSnuH5SxtphjBaLz78PR+vmPaIxKfrYo5WOw2GfyfP9ikMWT+8P587BP/g76llJRmrnitOB2RnZTI1Qh8qpGYaMA70gF3avn0FHsmOdRGytW67/xPc6Vtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBc8I2UN; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBc8I2UN"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso622698a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015493; x=1789620293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oo7aRKEGMoVwmi7U82zXGD94LiRc1lUG2POtWtnvFR8=;
        b=gBc8I2UNHNy6TgpLDQdzcnrbnS2bj0uDuUtnL2Hr0h/veMo6AJzzkrRCyB4VspcK72
         Ou4+YJcbzSCk+2XNCowo2LvdnqXIygyrLX85ZrqcUbBmiWt38S3/Dyq4C+BlXTgZXz1X
         zOipevF8Q//OIHB9dgxovf+JvqciTeM5FAq6GPOI9rk3zDBJ6kX8BoBVcVkbfSFDcBxf
         HgI1cZUoNPC4tfTygwz9dWjR9Hebd+qG5xoug0EpPZNfV89AAuksGL54yAcQtUm2P9o0
         TT3hn6WQE5ftMN7fZXoFTqi24YQY9L9d2NJ0/SXYnX0Zh5btXC/VU6fHFVcBaQudOGMy
         TN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015493; x=1789620293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oo7aRKEGMoVwmi7U82zXGD94LiRc1lUG2POtWtnvFR8=;
        b=El8mpJ5YymjEgocyVJcCKQOqt2GRgRDqQ0yWf/U04H6lo0IVnP0a+7DElBG0UdKr9k
         VXNEfL+ZjxRr5FczFWTdCACFUgcU2ghuH9/sxU1Xvk7OyT2HVKzy5JeREUcu9wfyZZPG
         f0ihJQcsl8PrFO2AxjTx8Qmm67vVabbnobtF3+piCMnnJoies6S36LBKFbLGbWVZAvTy
         e93qpzkKVr0PT5XfXlRW6wrSWKWdEDpe5J8b5P1r/O7hOPK2Zb2+D8ACoyW4HZZr5Dlc
         5TYHpt59y2dhYbWkbiyqoNKhWtnwRoRiNJnYoodJ/dPHXI2H8q2sU/kqxg7gd1ZlkqIg
         B6og==
X-Forwarded-Encrypted: i=1; AKwUvBykxe4+4tV2NpA6nEP6l6WbgEiv9RDhyszvYkflW2U1Pa1QczzFULKa1tF1AYyRHnKQgAjTkQOp6Pl7qbU=@vger.kernel.org
X-Gm-Message-State: AFuF++lyDnEHPpApGivhlb19U+81Y3+a159XNnsSlYtjty6ba/60RCbK
	LAy2QlHcfQfHZIClzfujexqPIcaZRB71cdyM7dBsYujXODR8deLxN2I7IIhA+Cao
X-Gm-Gg: AYBFou3iB37+joVVCYw1+O5dLzxpg7ljMhBJPfHQcy4/mYJkEJAGVCUdNmm81Xg6f5g
	mMdZC2eJx/VQshwPs//B7KuvP1RLtq2FxYFke2OWfk9GYCPAeCPmhJ90ex3K4Qn5tVDz+d+k0zs
	USlicgdOQ3JPkyAhIlPb2PoRzpMGpBGOHSmdPqHVRzOkrs9Jwp7d0D7KjwGlQTlqYTVf2W6MhDU
	KglG/gSuknkto2pmbegVlxzhqRoRAyPdxhfifCpMAAWIbMkg+r0ygHosF87qgnNs2HvjRrEut3d
	wN+NvFrsMXwanXbnjElTkMGG2BZy/Kj7l5s6KwhzY7HYEMChehOhv2CPY/Sj/+g+Um8uBmVzLaS
	jIiLLzMVQiQHInNnoPhEsxJJ/MvLi90Ayq/IcZckEDivW2dLalULKyvooboBPt2dUJNiLyb3IdQ
	4xIK/JiAdkKi2DyhKF9mP7nlgxEcKK9dJ4EosE1V3Qr1iYYvi8cljuP6aC9LpuvxavOp9F8ydGf
	5wLQ17Q4wQuSjVIBnGcRWHVrA==
X-Received: by 2002:a05:6a20:4303:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3dacbd6e061mr7726842637.3.1789015492981;
        Wed, 09 Sep 2026 21:44:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:44:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] platform/x86: Fix typos in comments
Date: Thu, 10 Sep 2026 10:14:35 +0530
Message-ID: <cover.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 was one patch touching eight drivers.  Denis Benato asked for it to be
split one patch per file or driver, so here it is as eight patches, one
per driver.  The corrections themselves are unchanged from v1.

The words all come from scripts/spelling.txt, which is the list
checkpatch.pl uses.  codespell finds nothing further in these eight files
except "ALS" in asus-laptop.c, which is the Ambient Light Sensor and must
stay as it is.

Two of these comments have a grammar problem in addition to the
misspelling:

  asus-laptop.c     "The HWRS method return information about the
                    hardware" wants "returns"
  samsung-laptop.c  "This allow to call arbitrary sabi commands" wants
                    "allows calling"

I have left both alone so that this series stays a spelling fix and so
Mark's review still covers exactly the text he read.  I am happy to send
those two as a separate patch if you would like them corrected.

Mark Pearson reviewed v1 in full, so his tag is carried on every patch.
Denis offered his tag on the condition that Ilpo agrees to the split, and
it is included on that basis; please drop it if that is not right.

v1: https://lore.kernel.org/all/20260907085426.3661-1-hemanth.selam@gmail.com/

Hemanth Selam (8):
  platform/x86: asus-laptop: Fix typo in infos_show() comment
  platform/x86: asus-nb-wmi: Fix typo in asus_nb_wmi_quirks() comment
  platform/x86: hp_accel: Fix typo in lis3lv02d_acpi_write() comment
  platform/x86/intel/tpmi: Fix typo in TPMI_FEATURE_NAME_LEN comment
  platform/x86: msi-laptop: Fix typo in struct quirk_entry comment
  platform/x86: panasonic-laptop: Fix typo in the file history comment
  platform/x86: samsung-laptop: Fix typo in sabi_configs comment
  platform/x86: uniwill-laptop: Fix typo in the kbd LED brightness
    comment

 drivers/platform/x86/asus-laptop.c          | 2 +-
 drivers/platform/x86/asus-nb-wmi.c          | 2 +-
 drivers/platform/x86/hp/hp_accel.c          | 2 +-
 drivers/platform/x86/intel/vsec_tpmi.c      | 2 +-
 drivers/platform/x86/msi-laptop.c           | 2 +-
 drivers/platform/x86/panasonic-laptop.c     | 2 +-
 drivers/platform/x86/samsung-laptop.c       | 2 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.48.1

