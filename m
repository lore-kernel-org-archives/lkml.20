Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FCD41D201
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753269; cv=none; b=OMLabWEjv2LCzI//LdacZvmuXWkjHLltUL4WifN9BTHadL+mwNfH+BoTcP4sJGymYgXFy0SffLNuzqdR5J0Ywdv+En1MW88ozXwZ4sisdeFbiRXTJQggSMvgPnLXH2VLrYjY0NqaISntXWV9IRtapnuGmJePXLZY7kwucyaaJmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753269; c=relaxed/simple;
	bh=tUpEzOCfmUF6KJldh55ia/zdgVa3346cD2y6uHf2ak8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJYcRpa9N9PcQ5OX6tYcxXJtjja+/6W7qnUPmzkcZUb8NDd/cYMuR1eRIozITsI+QRn0db0DrpjE3CKpTIRhMZAfKt+yxiALUfnh2wneJ2W2baRX8EvPi81Fk/HjP1jlSueTfy1A6bUClQI5CU1l0H5E0edvyPSg1ar7bywZeyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdmQiCaK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdmQiCaK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so40550215e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753266; x=1791358066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=PdmQiCaKbfh73kpKBwwDZrdRadpyvsAXmWhJ0iswV02hW4/xHcSvv+cSnV0R2B6fiK
         gXLd/8lDA5BU7fLz+rRCs9pjYt0ntOs60Ru0FyPxGnTdSk7IGnhDQyBwo9ZxXVPAR1Pf
         ShmEeQ6ZnwY4RdOEfEdSrsA8Ko+jxljYETD1A0vsTQYAvBFbeAqoQOQ3d+kMgMHw+85t
         plbEr5LVJC68fxDlSJNleH8Ndcc9c8aAiC3j9U45VDQ1qUMEGCh7FmuxAih5duCbsxrB
         wynd6mnvftXls2iNbU2SI77NiH8NCzjQShmcbYQ9FpTZx005PVH9nmdDm3WiOlyQ2KSm
         qDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753266; x=1791358066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=O9SL/chSNFSS7Hz721WiEVwyFAUPZbhAqYklTzB2SQt1MkhBp/cmCmHf/BHaPpKCrN
         G2A5kyBeKeuKD1dw2kDDbcl9pJWWjrrW/1EpeOPo4YMEN4ECF2ZxnideVl1cK9JArEY5
         8qPyqzCytgqkF/clp2G8fK/ZXv8uSTKMLXWghElBTBsF3Od2PgM/roMFJDtbAYjY1w56
         IiRFz5QnqHJ2ahYDh1plvhlie5B32m+M1M5zjssAG2lTvYgijgHBsK2OyauR8hMAekcX
         u6nMU14S0sacaGqzGGJMc7Rfy6QjXoFZDuCxBY1sxkI38o51oMLCIUgNtMvMp/0r27cu
         rTcw==
X-Gm-Message-State: AFuF++lV02UI7j94jX4QUI2BNgjc44xsenq3FmIvjZumVBAZ3koA57/R
	DLhSJ/hzS8vHTLz8s7GkGFd+dx2l/hrtDFw2Sqc/4SxGEKzGoCj6+b+1
X-Gm-Gg: AYBFou1B43vYYFBjxpfuqAJXkwCy9toK9L9fH8yTaJtEuGB9uAzc0u//S54OwUcifOl
	bZCGJLJqwtpGxQscgHx1+7s96F//V6c6DP45kwOyCqpxqujfSa1dkg8ibMUrAH35YRRQ11VmQ9/
	gf3bal0NGnIRRBo/n/zVZ+GWCi+whIByRjx2T1oOvLPQq+AFoipaZu41jtuzdoS8ozZRb8ptQvZ
	QxiuIrswLcr+YmyPfxP16nBHqrpCPwhsbiBnVxkgoYfbeNIv5Ka0zfnCe32syCpyMLLNz71zKg7
	VWwMJMReFHKeX93WqwEfzws5u8/IxRNOZcJdUnjDWHb4EIpnLcqQlmX5i1DviMM9vXkf69XY9uC
	dl5j1lWFendHC6Eib1qFredEVcVtXCgGdt5pBgGrxmoluaQpDXhsEBlx8c0AVaAwNXXqsE+Zypc
	Lk3pgBeWVPtX7VEz7EK2YcQR9BGZzJnmFbu8aCWeasll2cc36zJPshDbKgC+HmwTnYOahXzCdvm
	ShzVjv7axxD385Itzw=
X-Received: by 2002:a05:600c:8b88:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a01adde996mr6121365e9.9.1790753266400;
        Wed, 30 Sep 2026 00:27:46 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a84419sm27680985e9.1.2026.09.30.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:27:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/1] leds: Add driver for MAX8907 LED cell
Date: Wed, 30 Sep 2026 10:27:31 +0300
Message-ID: <20260930072732.66578-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Svyatoslav Ryhel (1):
  leds: Add driver for MAX8907 LED cell

 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

