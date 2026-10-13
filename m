Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287DA4EB86C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935165; cv=none; b=W/0/dd9Jey1RLRBAfknhHQrOsuQ+kNHaQbsYNp0MlMmmTzqPYUZDWpxA8rc+S7s5iRbpodSyN4TRj1nzlJ1BW6F7veJimmm6zHUGItDNMv4FYEG9UDsMI0LekViBvF08pCF7qxEiE2d1j8kLHHo9qFJzxfhprJwnCs42pPDEQtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935165; c=relaxed/simple;
	bh=EF1LwZgsRUIQrMk58WlWcF6iwwhWYa8WlARUbB+A+bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lAvxZg273IDhAojqdMminnk/ou2Tp4VXP7NkjMB9J2piO+5wiSvrB97igu95uv1cYUjqkUWHKXbZnYqi/GNlu85mAlbR02lIUsjHC6M+1J3bZfzesLcOGehLj2AJdaaYwWdl1sbTzTlJKtFUo5LRFKagjWMVhOsxAqSUPB0a0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAPxqzRf; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAPxqzRf"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so613381c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791935163; x=1792539963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlGpR6PaTM65eNVl7gc4MS45jtMlIfk6O582kNDMHoU=;
        b=UAPxqzRfngdFnqKUneC7o9i7TIMielfstdt8lIk5PYKT9lUEXMiJXSmVsgUASQAyki
         HYl56GB6ZrbIRe8Ci5UXH5SAzLidLXbfRakjIQ9/IuNTVFqMi4c+MRf7MxHEoqV2qHo6
         yJMrntgiQ8FTwsZxAJclDjFZLMpQZcx4Byff8A1B/8y3uWsbqvgAIobEbJH9HU+6jqZh
         2OgTsa/mSQch91hh0zye4w9cgSspE7M79TVf7EbFAODbwtimq39GLnY99rCTA5JrzkcI
         eokjgz1IBpBMHf23E+BHkfdhv2d6ShmGoCrXQd6cT1qHry1Luj2uha3KyjY4U/qDIwMt
         0gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791935163; x=1792539963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlGpR6PaTM65eNVl7gc4MS45jtMlIfk6O582kNDMHoU=;
        b=t9Q7IQjwLAhiXa+Xzu7hVnPAi9jEPUDy3AnZxf5OqmC5jw6ueDyvSP2ZvbMzWzUWdu
         YFKYKgZdb/jm5NuTVElph+p9DS8MI7IOfdglaYWW4/BkHrqZat+QIbZ9cjYdngcImYhm
         GhEMhSPALFgsiIDVb+zqWktZt0Imn0g0tYHv6fN5SyfqK7zsydf/u+UGK5xroPPkZg3G
         B9BatLnKzTJVeeD9Vs/V3zca4dabWW21564lpxQniRBAYDUybd5BLPxsEnymhTnkvRBk
         Cgo+LuXP5v7LTzx7HAqnaaGmLcKvVGlmybIBp2sWk+kY1QdRRNeyGtF3WIxy/j5XQ9UJ
         HkOw==
X-Forwarded-Encrypted: i=1; AKwUvBzoY5qiV+NfoT6EWyZ0dDC3vlHfv3ztEgM+1GBPf/+p8LpHHSR3ooAPEYAA/ah1nPclxfcljdrOnwq0cJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfZiDAl3UxVhuWaaCU89SB71+WMl0AeqB9hXpkjB8qcmHf1qIc
	KVJUrvYJlrgcJEnzcUO6r8Vc5phpyZhosVrZLOBLOYOzPJio2c0x5s4bbCYoIg==
X-Gm-Gg: AYBFou0n1L24Bs2ChIymy7B6WIW3pIChkDP/+sXGv3dYaYP3glZHnjHFwXtXanH3VSU
	ecHWQ5TeD7UTnPdSAJUomdk7nL9/tszLtU/JHqnO21+yGpr3xLC58LCJs9dKQmnN6lICbi9vsXQ
	nPZ4E6IQngfIu8G+SJJZLBC5EASkX7PHB6JcYekhwpdP9KzE1zk1Uj13SOGCwgeqnhs4WjABtOq
	2C7gF3UOJOqDKF0IPFgmw3oRgwVT8N60zCJ5C/y6WhRQ7ZUbNn+v7HRTZFa9s6fT61YJxyMLLku
	+hfzEq8JRHn9/8M9x26zsR92Xbp+fdIpztW5C9bUhrekiGXfV4Ygsq9Wpj/76UzHkdtVflbXTEx
	1UywoQaDIQGeWLphmu6o9t71IYWSdSHLAlf6rCNFxPGqkE36z2xzXv0T2hRSif9zCS8VM8ImACw
	T62PD5kcdrGOfNZ0zutnYI/z8rVRLxj4uR7W+ueVx0A5OmZ8tdpf13yFOcIQ90adWCFXZoWnJo2
	0E=
X-Received: by 2002:a05:7022:699a:b0:16b:1a1f:ed8a with SMTP id a92af1059eb24-16b1a1fede2mr24381404c88.39.1791935162803;
        Tue, 13 Oct 2026 16:46:02 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm51257744eec.0.2026.10.13.16.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 16:46:02 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH v1 0/3] docs: translations: pt_BR: Add process documentation
Date: Tue, 13 Oct 2026 20:45:41 -0300
Message-ID: <cover.1791933697.git.lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Brazilian Portuguese translations of three Linux
kernel documentation files:

- Driver development debugging guide
- Researcher guidelines
- Stable kernel rules

The translations cover driver debugging techniques, research
guidelines, and stable kernel patch submission procedures.

The translated documents are also added to their respective
documentation indexes.

Notes:

While running make htmldocs, I noticed some warnings about duplicate
C declarations in the driver development debugging guide.

I'm not sure if these warnings are an issue, since the original document
uses the same kernel-doc directives. I kept them unchanged for now.

If this needs to be fixed, please let me know.

Lucas Adryell Ramalho (3):
  docs: translations: pt_BR: process: add
    driver_development_debugging_guide
  docs: translations: pt_BR: process: Translate
    researcher-guidelines.rst
  docs: translations: pt_BR: Translate stable-kernel-rules.rst

 .../driver_development_debugging_guide.rst    | 244 +++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   6 +-
 .../translations/pt_BR/process/index.rst      |   2 +
 .../pt_BR/process/researcher-guidelines.rst   | 188 +++++++++++++
 .../pt_BR/process/stable-kernel-rules.rst     | 258 ++++++++++++++++++
 5 files changed, 697 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
 create mode 100644 Documentation/translations/pt_BR/process/researcher-guidelines.rst
 create mode 100644 Documentation/translations/pt_BR/process/stable-kernel-rules.rst

-- 
2.55.0

