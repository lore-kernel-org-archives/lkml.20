Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C314E433A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612794; cv=none; b=fg1K8XsAsR4P5puaMj/dALTmYBSUen6J3kMIAQBcVIoilppihs+ndItQcdGhZ1ndUCRk89eSE0rUoGoFhwcFraSIcZk/EA8LjF18VQJEj1ZvgyfSHYiIe1g+S6/sGB8hgRc+tOCGLR2F6XhDsgM/c8CTe+wF7glediA8inbqKBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612794; c=relaxed/simple;
	bh=WFy/5vhcXp4NxoZgMMcqci1CClGM/escUbpxyLd339M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKh0i+McJwGU13jUDpULuxNKPZgdlIekDj0NoHDviI1B3LatCRb1eKtW4px6ZKzOtuKONORkBkZ7sYVFCNfIOFqjfh1RQ8Y+OguRA0MVYDBuCLmTcQCIatuUYuj8RqHTkAIoidFhZHAJZ2ffXrYFIjujWFzQB1IpWU2Q2TVyaoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/EQy0g6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/EQy0g6"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6aaf28a86b9so26975a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612791; x=1791217591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pW00/HVZa9cCP4Tz1GUC28j9AjEgh6YcMp1yCf7/6pM=;
        b=I/EQy0g6t6bi/p/gAcLrj1cwTuZOmW65DvwWKnONGdEQz7G33GuVO6LfOimqQIz8+5
         iJ/RxmKvidbl8pUCxhko+XHGqJ+9nSCuEfYoJ0QqdLh4s8l+iRkbvIxtyvtPEmJrHf2D
         u6dn+QdAG+yDaQEyJGAK56YaI5cqv2tl1PnOJhQFq24lHmi7odW7sNapg+IkcaZez4ol
         3SWAF/WYMCKAnnWITwpLMp+RjzWhHHw0iugkf8LHadXJY46lOdC0fd7jJv5HFIgC1coa
         3m6RlL+DJbd/zN0zsabTJ0xJtOWBETfd2QoVKm1xpeqpGrp3p9d1/T5wsou8W3GSd28D
         mwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612791; x=1791217591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pW00/HVZa9cCP4Tz1GUC28j9AjEgh6YcMp1yCf7/6pM=;
        b=ZR1IAw90HnjY4bi6nJiIwJTtMHva1oZYe4xjY8cxePrnp3Hnjbfwm6mg3IKIserMmy
         zMZknQq2ZMenjLbicCfJg3ye8a4vXhMDkxc0H6/A1QDmBor4n2/DzVaLHjyvkOBpfR1Z
         qlgbvyNw++SxG/m7jCZiP3z94QjdphLQ25bHiX8+w031nn+VJRtV9Mwmte+Boh/O/EBe
         Q0gnF8TZwCtPvaCltyUgDiJ3Zo8Z09RJZjoeTALjq8ixE0VBh4qVdUGLo+XW6tr37Iep
         alhDfLGvUkfDvdPrZ4vPfO44/1L2fmi5ZrkkAVOq8YtEvagoeCvN8hQJ35PEBnfXzHg2
         GWJw==
X-Forwarded-Encrypted: i=1; AKwUvBwx/8FACxYdaoxSyiWnrMUY6YTGTSc0nGcPpK7kyM7+BxPDOLKd1XomEUucqUl94WPJY1MXUFqGJMf14LI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjlysEGg6otWB5S1CY0fEMYXEGWd7pRi9S57ZrOfzOrxlQkNWn
	60AharkwB1UF3N+rywAKVMqN3XV3K+pkYdPPoa6SPTuVvCL9E3PtsnpD
X-Gm-Gg: AYBFou3G3xXg42DRSwqa0tE+NAlfHPAA3meGmG7WypeztCoGvY75pExTzNYoCT4MjEn
	nZtsJyxZHzmBQEVmN/JXcvMI2pDj9IECL4/9+chdSb18oPtgjy+9wBLgkcaE2iliSg+YUk6DCez
	12FsT3+xA/ZZyX8ISX7SlQYNZ/eoEIZUHi8Elb00OiQqeEUlL1p4lfk5+jE/g0xbfYVIywxdTeI
	beQSKOoWJKcXZOqpXbfIhGRa3c+RPqjQbc/2A8nFt+1o37Suu+XAibWNAO0k1bnSdlDHE98FEFF
	EtnQCkp1gfzK73Vo30M4zijYERe26OIw7W2Oi0gNRc/gN8tR6TJz2wxbvzFI9Ma9BjD55vF1DEd
	vDknaSqzu4MzP5jhSOCVWH7h0exxkhKY6/EoJwubHrhKzUU5Wisy9C9loMYg4EuJnbA7gsBw8CX
	ijt0vyiX+TBecOzWq1OPg5QMC8KPMK6XDbFeaUQxlJmWuAEuywT3XPxWNlrZAj3YjAWvUEw34Ws
	gt5AOKEZAayycPFfWhJ5qfQa5AWgP5dcUyGdEfAB7K9REO2Y2+AI1fw9VLFRbnsBeaEoqV4Pq+p
	SLMOXehX23Y=
X-Received: by 2002:a05:6402:12d0:b0:6aa:ab94:4a36 with SMTP id 4fb4d7f45d1cf-6aac8f1b94fmr7911904a12.8.1790612791077;
        Mon, 28 Sep 2026 09:26:31 -0700 (PDT)
Received: from localhost.localdomain (84-216-182-59.customers.ownit.se. [84.216.182.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9a72sm4277474a12.7.2026.09.28.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:26:30 -0700 (PDT)
From: Pooyan Azad <pooyan.azadparvar@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Herlangga Maulani <w1zardsec@proton.me>,
	Rob Herring <robh@kernel.org>,
	Jeffrey Lin <jeffrey.lin@rad-ic.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Input: raydium_i2c_ts report handling fixes
Date: Mon, 28 Sep 2026 18:26:15 +0200
Message-ID: <cover.1790612085.git.pooyan.azadparvar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927114425.442803-1-pooyan.azadparvar@gmail.com>
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

This is v2 of the Raydium report parameter patch, split as requested.

Patch 1 validates the packet and contact sizes supplied by the controller.
It also propagates main firmware query errors because otherwise a validation
failure would be ignored by initialization. This is the only patch marked
for stable.

Patch 2 resizes an existing report buffer when a firmware update changes the
packet size. Patch 3 moves the initial allocation to the main firmware query
so devices can remain usable for recovery when they probe in bootloader mode.

Changes in v2:
- Split validation, buffer resizing, and bootloader-mode allocation handling
  into separate patches.
- Mark only the validation fix for stable.
- Rebase onto v7.3-rc5.

The series was compile-tested with:

  make O=/tmp/raydium-build W=1 -j$(nproc) \
       drivers/input/touchscreen/raydium_i2c_ts.o

No runtime testing with a Raydium controller was performed.

Thanks,
Pooyan

Pooyan Azad (3):
  Input: raydium_i2c_ts - validate report parameters
  Input: raydium_i2c_ts - resize report buffer after firmware update
  Input: raydium_i2c_ts - defer report buffer allocation

 drivers/input/touchscreen/raydium_i2c_ts.c | 64 +++++++++++++---------
 1 file changed, 39 insertions(+), 25 deletions(-)

-- 
2.43.0
