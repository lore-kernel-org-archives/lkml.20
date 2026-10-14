Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D97D5326B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985227; cv=none; b=FKPgBeHkEF+OR7sjQBBVOJMBwV/kw0HbEM7ovf2KtCojXc5TGDu24Aejnf262YQkRkLhkW1/h5R91/hvYwLCZv6xIC1NWZbn3eFgMNuzV3ctjpuohMKWAuovUf1YJx8ucLorm1mCJmymZUxQjnq5Lj+R0aoZff9IsesAKdJmOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985227; c=relaxed/simple;
	bh=W5yOQ61rKBYv/RMJIq2Eh/EaYd8zAs9RxgaF3vvQVDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uveUvlaPp1+BYsz2/0AqHrv1LfqEsPNprY/ubEAcdpXGdCEKlVr7J+4AU3FKjF7IILOrJGtJbl27fVqtOs1kUhhzzoy9Nzf8UBuwBtgCGBk9rHf2axbakjcqvEEIEGcga6XjQKgGw0r4f3zibSO1KyVD56HOdRjPCNE+yvtn8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzoACW4t; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzoACW4t"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so35753175e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985221; x=1792590021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtK0lRUjLXQKxpCoNzzWjfIESEFE9YW7BbkGrmVQGAQ=;
        b=dzoACW4t3eKHXdsynsrieGvskNqqhKtjTyVSzXPkPw4xnpl3aV+oIWyFZNiWJ/TRfN
         iONc3/Q8Eh82DkiE0+9uvfIN2OMhXXFcmcvLtyZk2xyr96x+uo740Q7ojOqSu9M7A8J/
         08ByaO12kz3CVD332Ui6FSUYXxBcuxOwaDNIpis2uoY19iQN3VtVI0NFb+JTBLvcxqff
         RPErLZc8aZQaaWAFVD+Ftigo2FgAv8TTZ6r5Moii8ByXCCQEgpThkNCAfl8SdLWNsVWm
         JFwawLNpQIHY8n+SpQOXIto7vltZthoAKNMC08SMp3o9ir6ACwGLOl0hrIiCeckymQOY
         47uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985221; x=1792590021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtK0lRUjLXQKxpCoNzzWjfIESEFE9YW7BbkGrmVQGAQ=;
        b=JGAELWFOR6hJDoeC5QTDEL+xe5Y21E4yJvFj2xQYw1ZW1a2sq2tTovH2IGvCmw1Q1K
         B7BvlMdrRzaW3d1Xagxl4rIy4sPGw/NEw/tpuDtZY0vm09N1rAXV+qzKe+Sua+Kd6i1U
         zBVlEZAiOyhwh+Z6jGoVgM1nEpTlUOtyVr4iH2laKFW/Uk1rmhUvxxGh0HzJiUR5zFqo
         W7VhgWQZfmYw1kzq6I7Tiykt2oqiuvuw0lHvDOl6YDpyhFuAauegJH+xGcGLJCjb+c0I
         VuW0E+yieeTFWVLNlHJOwYTsMhzX0HR2H8jSVewhAtru0Od6CJJccQ672fwdSSDvvEk6
         6new==
X-Forwarded-Encrypted: i=1; AKwUvBwtapzzmrvgB6tIy4lfrYphqTM87KzkzOD2pnsRmqh7LdCMJ7GMRZuco+7ZB4KVK37YhCX7SrzC8Tyuy/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHpwxN+8F/kiAg1RHQuqJfDe70TuIakeHZI+83gKl0IGwgLC9H
	hwR7kVS2ronFGsCYfVwIMCazQ6NrGCAZbD8EaOWlQXh/eytGi1qBgXcA
X-Gm-Gg: AYBFou1USnkDMG9QOOLFgKaxT3ZKTLXfjxK3cJelSZ4SqcZg8d7+EkGc2Ac3NsRviTg
	d29bnFHYSI7IJyvxVTJa8tNG+hzqOPfBXjdLj5b9KtAzGk6al41ZcU5IQwbE8sM3mpP5OrRb3v4
	l2NQYhSUCjM9hkxr/94GdSpawgG8DsMttaChXmDgWV9PCPnE/Sp00Wn7rKUCvUerN2gLlzS9mfb
	Zrkp24kgCvYhqmlJpeaEvXAfKz/lnU+4IVOdI2pKrcqH5KJNONWPuR1CCw6inweE7lT1n21jJ3p
	6+0AVvGVcZLSW90rngX/aUcafgoAcBwW3TUGTOQVKLZcjUfsUTVkwCYiAUbFT9UQK7kJf9fhVmJ
	2DEf4qXcHan92gtXZs1XWZ+wwaga0g3ckwrcUrA32dUkm8KHEGaE7H4c3MgegFpqvBA4/Neu7hl
	rIlI37Tl8O1Q/9IaCkKSb11RsiUTld2fONZ++vM7rXBM4IJLoTsi6HNtyupTCOVaFfmCNIQCBOi
	7RBtxCIMSwUggOyAFBZj3l74UjtitgL/iToRHfGyQGheAyQ6JaNddby6tknS3o=
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr307699125e9.27.1791985220840;
        Wed, 14 Oct 2026 06:40:20 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm12036009f8f.43.2026.10.14.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:40:20 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: n.schier@fritz.com,
	grahamr@qti.qualcomm.com,
	rdunlap@infradead.org,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 0/2] kconfig: error on reverse range
Date: Wed, 14 Oct 2026 14:40:15 +0100
Message-ID: <20261014134017.2310819-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds more input validation to Kconfig, specifically checking
that ranges for numeric options are properly ordered. This check was
originally introduced as part of kconfirm [1], but there are no findings
for this across the tree, so the check can be added directly into Kconfig.

Patch 1/2 adds a prop_err() function to match the existing prop_warn(),
which is then used in patch 2/2 where the check is introduced.

[1] https://lore.kernel.org/all/20260904220559.GB2787252@ax162/
---
Changes since v1:
- fix typo in commit message: where -> there (Nicolas)
- adjust warning and error printing to match gcc (Nicolas)
- handle case with multiple (conditional) ranges (sashiko)

Link to v1:
https://lore.kernel.org/linux-kbuild/20260922163749.2031594-1-julianbraha@gmail.com/
---
Julian Braha (2):
  kconfig: add prop_err function to simplify property error handling
  kconfig: error on reverse range

 scripts/kconfig/menu.c                        |  49 +++++---
 .../tests/err_num_reverse_range/Kconfig       | 111 ++++++++++++++++++
 .../tests/err_num_reverse_range/__init__.py   |   8 ++
 .../err_num_reverse_range/expected_stderr     |  11 ++
 .../tests/err_transitional/expected_stderr    |   2 +-
 5 files changed, 166 insertions(+), 15 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/expected_stderr

-- 
2.55.0

