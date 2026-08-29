Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC22222AC
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024001; cv=none; b=mZJL8C0v9fC+gPFiSjbtlEZ3ANR1TjgKv6gd+PfnWhyhyjOCRMyy1wvSoCAfgh8GfzfhF0iK4twmMQkh0QzjTPfUGSQZcnLkujBFJNFEprdiucInOvlKgz7/Gucd1KpRcybKxypbvqmqaLyq8tUqLGgG68BleXSXtgsNtnnhWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024001; c=relaxed/simple;
	bh=gzyG0Ut3hBq8/EdxfysApzysmJvogHClAIb4KPO+YJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=otbmunO6ETYE7UoGsmsZ5y2g/4yZY8PlwbZPr0t/b2/57I9LvMXFxks4LtKA95CjJnVkFOD62Yd28C2//Vicw0Keb5JOeLb6WsSQpoEyD99cq4GiN5ikbujRpJgj18M41YybMyS4Y83442ToFkYoRQTqer4LemG2muLIyLwQrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPO4++DL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPO4++DL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso26124635e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023998; x=1788628798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjtxZp+1cmvuSgfyC6Dsr7StqMjbj57Jnc1lQXIGBbk=;
        b=KPO4++DLl2BqKo5vJa7R/2klDQeMRG/6xJFPUPGKR6go4E4O0gOiCiY2FHkAcg0l0k
         TZAdiXbC0OpgJ6gh4s96bfIOU0nViTZG76p1ZeFjX49g+m3XVSQzHr4taOjy5U/fkmdP
         E/1NEqif0WlJrpKQo62vLdD7EzxXxy7yg4FT+3YEPnFYqEmHfBFj5uGBQFa6Pnrq1Exn
         UoL4qofEmoUgd0r/FbMQpD904w834S8MwdC8BSq4lx/VjRaxMaeG9xkn5Y9gGmb51wkV
         J336BEEjcD/cgbx+2gwOWVlwwSZbGefTMy9FQ2po1+18B8GUoRaKF7LoMbr3oFYR1Hk/
         fJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023998; x=1788628798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjtxZp+1cmvuSgfyC6Dsr7StqMjbj57Jnc1lQXIGBbk=;
        b=QoA3cNukarJOcm7gnZARnwDweCfGlvmSeXU5ZPrXkQ/2FB5+w+ezPNp3xMvjXkq303
         n4uBoXCmpcAEFggHw9VxNkj4iCGf/dkxNQ3i43k2KkSkgL8RzC6oq5idMc/R7zl+zb0H
         U2b0MffpOfjFIGtDdMP8TyUpWJVBcIZdhgP+I7jzb0kVnMhCCwxfwzxj5TIGkL293LkP
         7bqgus1jzWrEXiEkO9WMajBu1hG/vLQ5JSCVTAW+n8IoVMFRmJsifK02H4ynY6FxEBa4
         ypdcZUPeGBJYKIAAsAvgmnPImTXiUPNeL5k7/ca6NnLIzcZgVdQy08bbTXbzGg9n8AiI
         PJuA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6fylEzjr9n6m/lrCvIjdkrPc3Pi07PLgEjwxm4GyBXgKidNzNqLkNLgHblTsfyAscBNRPJAVZbN+bc7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kEokXgCvkZZF/J8IC75W+G2OGPXSN5iyQTMouh01WOo3/H+H+H
	NAWatosZ+uBqerLEtSAR4frdshiVtbmx4S2Cxy9IrB79DZ/U/Wj1PVv4Osa8gpQwH88=
X-Gm-Gg: AR+sD11AajGk3CQuB9L6hvZjSfwgSZmjMh6F12QwwQgJ2R1Bq0834VTJWDn4NjW6jgV
	IrJMkd7eNnN26wGiJpFDtORLDFCK/fVnGxOmn4YvMvVTdKRfFK11Eo6HP1cOuksJfWYlWEH21mL
	hk0IWeN0atMeurr7ViwEym9nimaytb1OszQzpN6mz+4KvnmkAeRDsO++TEFJR9Tx1T0ncQbag9J
	RUBS6ANSTzqtZfNe2Wyv/hTM38UQx9pF71TNI6sgiq3JMuGDYJeySI6+GT8Cftlo3b3+xUA9EXw
	uolkTWxVqda51i8b7uPpiQSLF3WiWsFFGTkRdk6Mfp8R+PCLCu3wZCQQfOUZ/eTQkovbqAUn98p
	Lva17/kJaRI765yZfVv9FiqHZeo4buhntOISTQos3PqKnHh9xjgEEOYBYgLBz04QaxSeqOrQGVu
	NbfYW4EecbCHJmqUGxibJ8KDwshXd4az7txReVli/93X3gwMWvIyEY2xCjAmqnNVziwWC4I0vtJ
	1m6EtnezgsdZ26m0alsgCiI1Iw23NJxR2WoSrshFfBKRakfVLLS
X-Received: by 2002:a05:600c:8b35:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-49b91c3b71dmr226235025e9.11.1788023997546;
        Sat, 29 Aug 2026 10:19:57 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm121080285e9.1.2026.08.29.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:19:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 0/4] kconfig: improve input validation for numeric options
Date: Sat, 29 Aug 2026 18:18:58 +0100
Message-ID: <20260829171902.1510587-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves checks for invalid values of 'int' and 'hex' config
options in the Kconfig interpreter.

Tests are added for all new warnings and errors.

Patch 1/4 promotes an existing warning to an error, for attempting to use
a non-numeric option to set a numeric option's value. This warning did not
have a test, but one is added with the promotion to error.

Patch 2/4 adds a check that the constant values for numerics are within
the bounds of the type (64-bit signed integer for 'int', and 64-bit
unsigned integer for 'hex'). This prevents silent failures, for example in
comparisons.

Patch 3/4 adds a check that 'int' and 'hex' options aren't used to set
each other's values. Since the values are naively reused from their
internal string representations, this currently also leads to later silent
failures. 

Finally, patch 4/4 rejects out-of-bounds numeric values from the Kconfig
frontends and adds a warning upon reading in an existing .config file
with one of these values. In the future, this warning should be promoted
to an error.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Julian Braha (4):
  kconfig: promote invalid numeric reference from warning to error
  kconfig: check for out-of-bounds numeric constants
  kconfig: check for hex and int mismatches
  kconfig: prevent out-of-bounds user input for numeric options

 scripts/kconfig/confdata.c                    |  6 ++
 scripts/kconfig/lkc.h                         |  2 +-
 scripts/kconfig/lkc_proto.h                   |  1 +
 scripts/kconfig/menu.c                        | 68 ++++++++++++----
 scripts/kconfig/parser.y                      |  2 +-
 scripts/kconfig/symbol.c                      | 20 +++++
 scripts/kconfig/tests/err_num_bounds/Kconfig  | 79 +++++++++++++++++++
 .../kconfig/tests/err_num_bounds/__init__.py  | 12 +++
 .../tests/err_num_bounds/expected_stderr      | 10 +++
 .../kconfig/tests/err_num_mismatch/Kconfig    | 38 +++++++++
 .../tests/err_num_mismatch/__init__.py        |  9 +++
 .../tests/err_num_mismatch/expected_stderr    |  4 +
 .../tests/err_num_non_numeric_ref/Kconfig     | 75 ++++++++++++++++++
 .../tests/err_num_non_numeric_ref/__init__.py |  9 +++
 .../err_num_non_numeric_ref/expected_stderr   | 16 ++++
 scripts/kconfig/tests/warn_num_bounds/Kconfig | 24 ++++++
 .../kconfig/tests/warn_num_bounds/__init__.py | 25 ++++++
 scripts/kconfig/tests/warn_num_bounds/config  |  7 ++
 .../tests/warn_num_bounds/expected_config     | 11 +++
 .../warn_num_bounds/expected_config_stderr    |  3 +
 .../warn_num_bounds/expected_frontend_config  | 11 +++
 .../warn_num_bounds/expected_frontend_stderr  |  0
 22 files changed, 413 insertions(+), 19 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_bounds/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr

-- 
2.55.0

