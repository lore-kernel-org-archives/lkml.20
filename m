Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B062036B931
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577112; cv=none; b=Q7i6e2MpA5Vlsn0VVb1WCfMpa36w+m8HJCCsA9cWgIAkGXNDETVF4R2iBvIW0ZIvnok+v1w1YSBJtNgdU+ThJkoFp6k8Y1NqHfzjKVO/DdaJHKXoVClHcdsyIMYVt+Po7vbkgOwRl4bpR+TMPWcA+S67gUXTwUSjD7HDO2I6kBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577112; c=relaxed/simple;
	bh=ssSVIdhU28wBo3bZAvVEYRVb0VBjTnH+Szu3oc2gf4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sKAjySwqGMHE41PuNXynvKyAmYeYHJOrTfCrgwY+fxKq5V4Ek8mKMEjsA0FRrN4fOlWTXJO2m7fhdgomaypC2A/0OdweZstZ0FqjTLkrwiJT6iw0xx6Myw5PXb5dYnNYJrDrceNHHrl/tY9EXifRBk7pStLtV3uFRBkwrZprWSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ram+X5t8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ram+X5t8"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48442ea8f59so2217984f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577109; x=1789181909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pep5Nu0BxhAqF2yFjcnol3vjVLD0FPuyRmanesgGxk=;
        b=Ram+X5t88Rc52rdbBl5rGrcmD5N5GsjJalyvxYQVWeX1G1KhYdkxSyxmZ5kIpGH/fV
         BsH1tZzE8yz8irEFDbiMpyCfAHs8LkK6JHm4BaE0n7IeOuowNxkIOkA+iXzkLfpxzs8s
         08lAz+a6OjQXAgJ7X9CCEPGj4L/Giia1qW4bbgMoZoPhQSRZ9oRx81bCRD1Y+YCQU+JZ
         XgMwr/okGbVm1MYzKI99asLpcKrBqqT+n/qnLUCCGqd2iacJ7EqGrMUNunhqvImNMgvG
         udocngK3qgLJP91Dz59df9/iuhE5XJFAukF5sua/y4vD2kIKDPY+SN+j8/aLXLNmxB/K
         7qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577109; x=1789181909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pep5Nu0BxhAqF2yFjcnol3vjVLD0FPuyRmanesgGxk=;
        b=V/i5g+2HPxnQUde6rtVv/jWAuvWwgfZpEEwCZDhdmECGaOPChSYnkVqwXwtKpDaqtA
         b8ruO4JdftVtcglHY1lgiEBu+iiH2u6YI/AzAqzdJI6dLk65bhrtQGJQn6q7P22al0wO
         E/LqjcxkuNT6axaAX6FmFYWRrkCqgXWaeEkcTU0glDj5FncUmVXnRh6A9e6u6z2JMHSF
         nF3twYBrKYHdTRm2wvCOl3kd2+C/sHb9jy3UflOfZvnDcpw1tgcQgVh5sxnqgX8bakAp
         8bfoEXsuko+0XWg0Kog6gn4hkRL8KXxqJoKvYq/dprdKIRBka79H4AXk/mN0GjmkmMzK
         A/oQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0e+xz8uFkIjU5VRQtd7lA+Oo0FVkNV40AIdpngwJW6lG/5lCqj0wjdDJ0N/WnYtkq4d7XforzWqsgcVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lPpL18DNl+UPf0F/lHE38DxFzSa+Hkc+C8/ke/uipN4Of6EjOc
	xrSUW6wydzTWRhBWvcw+2gsjeQ8TN8QurmD7h5AAl0QG30/QPZdIaDbU
X-Gm-Gg: AYBFou1NtezZ9VqUnX1ghrOa+cIOFpOarPlvw56kzpn6B0fdrpF4HAzNtm9fZjQddq2
	BTof7QQbDOU485WosmyMbKxPkXsS6r5IFiECHX50zXUG+aR8+kg3OprBGRkU4uxvnirRAjHHZ/Q
	vFVLL6aCtprtZqVmf1ufata0lK4QaQI8wVDxwFCo7rfP7ph6WNg3BNriqVkC5x1zY8GAxjPLxfo
	JQXddkuokpQPemohGWuqOSVGaUuae1HadjYL1MElagdPb1FTtZSaSdtVaLxC41X4p1brYcm/fxu
	4JxYNERq7xO9tRfwqEl4AUIIT1Pfid0Pax52Oev+QbUTt35vi16mKDv0qIu2ZDTG94pN2yJSweR
	JIDDZmfU2rXRh9V5g9NQSR0e9qRb54XDzi1SfFLruZQn2IX3JQp5IqJMnRvK1d5Jrrzgv/WIz2J
	H7sewbaOWw5gS2kfIsomadbxiwivnz4to+S2jEIRvpCLBx25RL/i33pwiG4FpEYYCxRJN7Cgd+k
	suAlbBUSFiZ3fsBWnYdWIItwtZgHwtna3GUddA3fKm8GxcPF9F2KJa1sXqOzo7LTblgZzjmh2Et
	l7QD+yXOAovloOa1Ega3ZMcvl6VHIg7FEAjLL3TZYJGXQ1z9PXXF0W+MHLSgXGpTHok=
X-Received: by 2002:a05:600c:871b:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cf82cbac2mr87022315e9.5.1788577108604;
        Fri, 04 Sep 2026 19:58:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm111088995e9.6.2026.09.04.19.58.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:58:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: parse-headers: Fix script name and stale Makefile reference
Date: Sat,  5 Sep 2026 04:58:21 +0200
Message-Id: <20260905025821.83968-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script is tools/docs/parse-headers.py, not parse_headers.py, and its
FILE_RULES argument is optional. Commit 8a298579cdfc ("scripts:
sphinx-build-wrapper: get rid of uapi/media Makefile") removed the
Makefile the text points to as an example; the cross-references are now
generated by the kernel-include directive, so point to a file that uses
it.

Fixes: d69a03a97a2d ("docs: doc-guide: parse-headers.rst update its documentation")
Fixes: 8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makefile")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/doc-guide/parse-headers.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index a7bb01ff04eb..eb36c92e9a06 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -8,26 +8,27 @@ between the code and the documentation. Adding cross-references for
 userspace API files has an additional advantage: Sphinx will generate warnings
 if a symbol is not found at the documentation. That helps to keep the
 uAPI documentation in sync with the Kernel changes.
-The :ref:`parse_headers.py <parse_headers>` provides a way to generate such
-cross-references. It has to be called via Makefile, while building the
-documentation. Please see ``Documentation/userspace-api/media/Makefile`` for an example
-about how to use it inside the Kernel tree.
+The :ref:`parse-headers.py <parse_headers>` provides a way to generate such
+cross-references. During the documentation build, the same parser is used by
+the ``kernel-include`` directive with the ``:generate-cross-refs:`` option.
+Please see ``Documentation/userspace-api/media/cec/cec-header.rst`` for an
+example about how to use it inside the Kernel tree.
 
 .. _parse_headers:
 
-tools/docs/parse_headers.py
+tools/docs/parse-headers.py
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 NAME
 ****
 
-parse_headers.py - parse a C file, in order to identify functions, structs,
+parse-headers.py - parse a C file, in order to identify functions, structs,
 enums and defines and create cross-references to a Sphinx book.
 
 USAGE
 *****
 
-parse-headers.py [-h] [-d] [-t] ``FILE_IN`` ``FILE_OUT`` ``FILE_RULES``
+parse-headers.py [-h] [-d] [-t] ``FILE_IN`` ``FILE_OUT`` [``FILE_RULES``]
 
 SYNOPSIS
 ********
-- 
2.53.0

