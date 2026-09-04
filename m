Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A93A9639
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507514; cv=none; b=U1n8e0mNVr1mDmpI/UmLTeSustel30+FdlvbhTTml092HmlqfJj4hyv/n+df/qZYc8KKbVE2x1HQdJxB9eDBLMyz0n7G4GYrgREHgZlPmnU4oqPowQrQQJJKVaZa9zSP0pCZp7E9sKbdrNv/7Z2jO6e3QxYNtvyrBHrBgBaUT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507514; c=relaxed/simple;
	bh=h8PbCRKvvFJLZm3SHCvQ9QLJl4LS2W9dFMxYCryCOmk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=l6IL1/74DYMsnyCeZikcVFpciQ+7j1PCdihDjXgVU0wPuhmnTSNr6YBPlEt617dmFwxILMurE84+SCdMQ1B10IDxcfx7KhtBpJ+MsnQHotIaDu4dnv60RpEbxbXVyr2xALEyHDuG1q/aU/1IyjA/nLdFqy4gOxUPIq74frZ3IdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Civ4s4sH; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Civ4s4sH"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-85b293528a9so18790467b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788507512; x=1789112312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nnmn3Oc+vFr5owFtrHhBgb1Vv21EmUmxEFJSlMg6w2E=;
        b=Civ4s4sHeRLEvE0Z0KfyGFhvPVyT0tbOiSxBBO8ID1i7U9CdnG+hItBq6AGLGIFBXH
         ziybo3KrgnGZQdwR9lrZxbyDGAgjn5jzMs60nTC/xESK1oS8QZsfi3PYMNewwJYrpu6N
         pZhgnYVIc61wnQgjiqC60c3kCSAVMAdGF/W6Y9/mVxxF8gmihyLMB9bEhR9Ne+h80pJ9
         1thwOVIXqnOPO6C8nokyn10Eu4RY6F10gAR4xXLhghKds02GDh+OD1FRnCfeoGuDt4VU
         AEOBYxMvFsfINGng/S2IFJZEh5vW43AHmVkMzBZppSZrZwJrXckJd0vp0TTTUHdUqfGS
         jFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507512; x=1789112312;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nnmn3Oc+vFr5owFtrHhBgb1Vv21EmUmxEFJSlMg6w2E=;
        b=UBr1FEbPffjLEfsNunFX5k4b4zlD4VwEme3/eYGdY/VP5RdUYZhNND4CHoAWoscgg7
         hT7kWS9v1H5RMCdkL3k5WGKCVc9UxFXWymFYUlpahjCfhZLV/xP77GpKWUuv/8Yreo83
         F56ZvVs5ojbq+j5HYXR9x1TLeb80seNZfOw1vv7YHpxft4izCotESy3KxkcuONk8Mvj5
         q7hiG71xAaHZjhRiTBb0wNKO7qPUFopToVpwfHxZ1BlhfhSAiMQAsuqno8lo1GNdWuHQ
         sHyQXPnxu1eL0UoKcIDDZM2Dh2ZGIUpYRPFM3+rFsaS5WozDwpkEoBIjS7s3Rhl49O6h
         n9hA==
X-Forwarded-Encrypted: i=1; AKwUvBz2KfUskylOkbddZ4TgFTlRUp5WsGFW+m5RN74Zwb9m358a4iDYEvH2N99Lfp+AbQhS7Fsw+0tJ8XKDCFs=@vger.kernel.org
X-Gm-Message-State: AFuF++lh1ceBav3+6iTp6kpyUdgt9M/SniPRLtmbunaJdhtgKG7blsZy
	yQ1h+bGkxS6pGcQPhPz9w+QrXx2fzaXj7w+Ni2tdaE11VwCc2kAKIq/oENYut0W1
X-Gm-Gg: AYBFou3pe5dYQZFSL9o9m51DQpoUrKmMX+hU5nNciFmiPyow/TnD6b+l0gh6T6o8wVU
	wQcaW4qy+2bA7LwAUrFsm40iBuZB4eCSR7r71vhJT7cnDx4yE4FeEXMYKtxSag2vAHLPnTvXciK
	pzhpVdiCBzbXoI5ECKNJauxH6/gTXM6deoqK8hngI/nrorGQYZH1cl/6RRjFe1LCAGnrEfthC60
	kV0XJFCL4m9BPRmmRPdCGN/IKOcMdhsQV8jPxFhg3SoKYjCHZHU8tZxtLtxrAF4QRNlSfXH+2X3
	rRlvX7Dz9spC8Gxmte76Xq7kojGnhvAdDSEVqDQEe3TFF3AaXZIRlwJqEoEHVLsd5Ty3ogGCkls
	CNbhHgSP4vaXXQQ4xJqGlBFRvm/IVnJCUj7h4Sxj7BGwHUGqUPnrchiZr6jHLz2GrWT3jR97B1J
	ZhHYh+iIWwtlrTkwz4/d3ujNM7RwuH1x/sv7bxTcz4VcIxBBFVxd1rNBKdVgwxk/NeH1SeCMZi9
	Y2BGez3wBLKVXgfXqga
X-Received: by 2002:a53:d012:0:b0:66a:b15e:bb93 with SMTP id 956f58d0204a3-66fb6d605fdmr809951d50.13.1788507511931;
        Fri, 04 Sep 2026 00:38:31 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([179.238.17.208])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm1691157d50.9.2026.09.04.00.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:38:30 -0700 (PDT)
Message-ID: <6a9a7576.4675fc7e.263ae0.6765@mx.google.com>
X-Google-Original-Message-ID: <20260904041502.ramshared-v2-kconfig>
From: emersonbusson <emersonbusson@gmail.com>
To: linux-block@vger.kernel.org
Cc: axboe@kernel.dk,
	linux-kernel@vger.kernel.org,
	emersonbusson <emersonbusson@gmail.com>
Subject: [RFC PATCH v2 2/2] drivers/block: integrate ramshared driver into build system
Date: Fri,  4 Sep 2026 04:38:15 -0300
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904041500.ramshared-v2-cover>
References: <20260904041500.ramshared-v2-cover>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Connect drivers/block/ramshared to drivers/block/Kconfig and
drivers/block/Makefile under the CONFIG_BLK_DEV_RAMSHARED symbol.

Signed-off-by: emersonbusson <emersonbusson@gmail.com>
---
 drivers/block/Kconfig  | 2 ++
 drivers/block/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 8e49b12..d3a5e81 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -375,3 +375,5 @@ config BLK_DEV_ZONED_LOOP
 	  If unsure, say N.
 
+source "drivers/block/ramshared/Kconfig"
+
 endif # BLK_DEV
diff --git a/drivers/block/Makefile b/drivers/block/Makefile
index 28cb489..f895c11 100644
--- a/drivers/block/Makefile
+++ b/drivers/block/Makefile
@@ -41,3 +41,4 @@ obj- += zloop.o
 
+obj-	+= ramshared/
 
 swim_mod-y	:= swim.o swim_asm.o
