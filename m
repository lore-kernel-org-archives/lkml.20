Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C744DE728
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979995; cv=none; b=ITQk4pqCH7TzDE3n7ThzEF0WB0k+5ghwOs/wCTxP5tU83kAS6H0W2NWAEMTNoxnLGXtGv0JTKlT0EilkXybp9nYk61lYf0Bu/RYvySGM8F1xanp5AuXo0lQBXvvMzFl+BFaIkQg0TxHwTZpmc5P6UmtCUSgGbWoGOKina+lCUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979995; c=relaxed/simple;
	bh=tUpEzOCfmUF6KJldh55ia/zdgVa3346cD2y6uHf2ak8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VT85ltAgdpfPsAw96g0LYK+YNKb6qhkenB+6Xay9nRiFCRerO42YsuemBV+XwnuxbrTO5rbpc9M6NH4edmTkvWbpqtGZrxjTDhDFKpbnaoAWEFZJSbOD7+nf68Uf2Jt7ZfDmYbTQ+2rhv9Vyyr54yub6mrEjcZquGQwi/nGKovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEeIHBmz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEeIHBmz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so39240985e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979992; x=1792584792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=BEeIHBmz6VvHzs+I47BxAh7mI01S0KKAZLTD9rj3MlUBA95ucq2KbzHaC6SQYGR7vI
         NT8e5tYWj3FmzD02T/DtUkO0fJnJ0fD5x0lELbU/59fk8kaTfmUVAa9ZKRFZVLXls1wd
         HPpZj49YgLTWrGWrS/Wd0/CYv/oDs8y45NWSIkNzQM1TO/baDDEms2CUOHqgGaV3mnRe
         8HvOyZHijHzir8rscpFgWWnrFd8WgX/RABQuLICrqNHNlZoelBNGTWvTeM9N/VT+wErH
         4HX2XgCux0OIkclep+iZ0ZB9Dp8PrfreTzyasyAANqf8bxqNuyyEQg/VTUk4g7ibqLt7
         mg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979992; x=1792584792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=x7OA0537Sj7dIAl5uJgivN54wTpp33h0MxdsCQgdSixvnuYSrhWRy8ZKhd6/43NGq5
         No0kTQCQ1uNkDGhHJ3t9Mm4dzVZIBIaNGlOMGWZsR8QiIGGyXdE2SXo+aRPEhmMuvbDA
         kV/scfiioQvFtFXS158j5gjpKKOvSclw+3/9jI1nhUi9Pi5Dq0hTZdafHjwP4P6Friay
         pLKHe6dvN2OAXPupY7ZCQkc1RLIoXyXk2gOmurC3IwF3g5fD3WDK+nGgM3rRxvtJMQ+u
         cMvJeAlD5D5Pq11JuI+PQRKQ3MHVW4cisQLtPlkBNcREm/OzVsu0O6XyKBt910ECsNAD
         1IyQ==
X-Gm-Message-State: AFq9FYINjM9ilXvBnBCVvdZ/LugjgEl8bf4QShPAXUEYtoiUPle8pdTg
	nauN4npOI73IwufgLqCJxw98fQRdGfTTgzvpC4qrbduyxhCQIPwThWfR
X-Gm-Gg: AYBFou2zi23h2E0WfVkJu0wjRtV2BuhOo1DrGXOoXyY+MuhvRIo7SLhOezihpKQRIUl
	c29SQh0/TE2dX2v0eBzyAazB7URndY95evyu20bu2vyqiXHlt5IA5fbbzBspEcJOlVOuZ0e8y2S
	7WUBs0AN9zR/3DPvqXA3a1k38N3Csi0ecJuK044XksWDcPPS25ZKo/yQ5GqYTL4e+fl7TQT2wls
	ryVVY8ZYre29KqcHHPpt7fugO+zH94/54/R8UQKsNGwhyvqkwZYoj1d9YBJHuAxT0W9/CsWW92+
	GPG39ze1VJZMsx64WXDVURrInUH41ONnbEOZ5S3z8enEI6nxcZiCLZhWQ4yw64rHlyDZENcJN/4
	6IkwIhPLXYO4vFhGcUNNvcd4ACVa9ZYKBwsQOYHyf6TotZAM2MXURQ59qZ6QmG6g591shYYJ0CT
	5KEJmueof8fVNl8LL8ed92OoNz+TaxE39C8C/tRzgsRD9CzLuElOdc8YqgJ41iak4dbC+0VXVGI
	S2GEyGEMyO1Ef8bmaY=
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr171728245e9.6.1791979992192;
        Wed, 14 Oct 2026 05:13:12 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm11420985f8f.48.2026.10.14.05.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:13:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/1 RESEND] leds: Add driver for MAX8907 LED cell
Date: Wed, 14 Oct 2026 15:12:52 +0300
Message-ID: <20261014121253.133467-1-clamor95@gmail.com>
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

