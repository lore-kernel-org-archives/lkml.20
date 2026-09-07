Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A414078C2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763196; cv=none; b=PVyadmSE0huJcVY1HaA4xqJbIOXuK5q7adxR24Tkll/I8IExxvcoj/3zAQNanxjKzHsRP8tEmmAvIa6k8z78D7o6MnSLjnA4lXABW3klBcQwwUwEQyeJ6gUFLGQBX2VEr1Kvr5Y39AJ9IhyJoKLLzT20FHp3w2Kr1I0CC115e1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763196; c=relaxed/simple;
	bh=h0l9ezlVSUx1zYmyUm7DkOpsZUTjhGUTeJv6Fx9ui5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7+NtqSvZxbyf6v6iI3uf70F7ziiBsaUJjudl5MHgbjw00LLxNEF2YD5Qr3q/7WRG/3bIrLLcr7tGNGtGMvIbQpoMeWVsJ9YPlsNN20RC470QfSzMiTvu9bWFWcqsXw/O9FZYtmCfi0rZ1BvIWZMp+8VDCg3XBYPs7NXO3WtMqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ivmf8i7D; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ivmf8i7D"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84eb992a881so2030532b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763194; x=1789367994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVnSpK+EJV7kCmLFCff/HQwLZOhkKnWjgpUC9mIQ2vA=;
        b=Ivmf8i7DPqME4D1LCP1koq1s3aP9IdPIXSozINpnSKbtCRxM+URIdkj51D97PXCVav
         vAMd/nIGWgBiWvNzEPrfaRUY9IwFZboBTZmPDYc90akJL8adB0VTFawI3IKJK1ldX9ZR
         uBw04O1OaGkZ4j8eWqnJDKMAYsVsqD/zboTDj49QRC9Fr0mxOC+UDt6yKjP3+NDBAayq
         U3Wx1qq5RSRq6egaQJ4yCI0I9QQULY9kDwCYE/UVOJ45X3jMEHGXkMUBSgZg6UbGoGeX
         GxMals/Oalys8hzUNrzgrJFaHAALBVei+iFhR4cSfd+gL7ljsZi11KdAdi9eqnah8Ahq
         QRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763194; x=1789367994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVnSpK+EJV7kCmLFCff/HQwLZOhkKnWjgpUC9mIQ2vA=;
        b=MyYGLwvgg3k+js4Zxh+Lzlna4cm4Z370KEMGy6Vxuol+68b4LgHO7upLYgrxAV/D2d
         8G5JATzdFFBWRUn1tH3jmzIdCIXQY3QSVmNHWyhxKff7v1qO63o5qLWhgTOFCf6vfcji
         5G+xTWg1CdBDBv/eo1QMde4QiZmvmpfs44JtC5u4IXh/K5OJXlR6SBxBeP18mIPD0r4O
         Vg3Fic8wmhB3AAgvFp/hG8bGMLZZuLrcHU1J8ovd8Q+mRLH+Paw5Z9vFCYr2L+NIIC5M
         7wZ/LSljqhKCDlc/8j30sRPTXJnpL24H+YMbDspmCZwG2sjjg/22G1/OHE1cPCumSsJ3
         hkxA==
X-Forwarded-Encrypted: i=1; AKwUvBwIolG77KBWRDu4vwVC2UOaNJ15o7lEbY3SKUjBDMIHi1F5D2+TIf45rLeUwSHPa9zF/tev96SV9qEHJX4=@vger.kernel.org
X-Gm-Message-State: AFuF++nKp1LQzKVGJxX/F8drlmZGlVDXTxcQ1mX9sRv/pC4kzImIycL9
	dOCmOl1noqTj8CAiZCClZ+Mk4ZYzd+iVtCBlwE6yOCsj9L8dgH2eQ9Ks
X-Gm-Gg: AYBFou1ERuyYm+Tnlv2sH/RBmPlbVquDUMXA0yqLSJpVyDkfP01FntXeJjcUA/NKtA1
	SF74Lqaw8HrhklaUPtqtKT+h2JZ+Tkv1ybX4hTu4DSeaOre1Xp7puwJooK9q0meM401BLOC7KwV
	Zcuf3UhMYeX/SGewsqSZQams/7RfpNsIS90JZoPqe12tzcDhTnMGnMTLTHT7TkWlWQxjCOY2bxA
	y2YPBLXZQnxGoi/t/Hr5ortktl2kiZ4nWvSyBJ8OGu8Dzj780D5NYl+LBslUpHWASt0136+HS7Z
	965PkswGujqBPk6R31zMnL65EC9rFMmYtirhxKSW4zGPqRufSjzmhmmpeILJqm7+yaPX8Cxb0cW
	i3mpgI0K84CvFuBEd7qEgT3CDYvJAggJe2ulXwUU9YlS+wHKU7BA3+MkVFjWovYwN8v7rYqwKDj
	uoZJsBiPk2ItFKAaY0TdD/T81D4G12owiiohNCv8D4ZbIDMbQa61pUG8JKiFrTBoW6593RY5oCg
	OYch0KMjgDRGA==
X-Received: by 2002:a05:6a21:6442:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3da5b4dab37mr16506868637.27.1788763193833;
        Sun, 06 Sep 2026 23:39:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm25345322eec.19.2026.09.06.23.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:39:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] power: fix typos in comments
Date: Mon,  7 Sep 2026 12:09:45 +0530
Message-ID: <20260907063947.34852-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  power: supply: fix typos in comments
  power: reset: add missing space in error message

 drivers/power/reset/keystone-reset.c    | 2 +-
 drivers/power/supply/bq25890_charger.c  | 2 +-
 drivers/power/supply/charger-manager.c  | 2 +-
 drivers/power/supply/da9030_battery.c   | 2 +-
 drivers/power/supply/max17042_battery.c | 2 +-
 drivers/power/supply/sbs-charger.c      | 4 ++--
 drivers/power/supply/smb347-charger.c   | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.48.1

