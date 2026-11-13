Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561008;
	b=c3wsWVLuBMOxCKCawn/gU4V8xZqy9FMCDqgscxJw5C6wR/ly3M66W0vAWtfVC4WkEt7f
	 /kqx9jhQyKX9Ttu/gIwXLvcXsIS7FcDxEgXMAPT5LarlTW6yRRUcwYeRzrLXohO93vehD
	 eDtheoovQppu/SqWIs2uM/JLR8/6UDVq5XFW9DWUONTV2bldP4NwtQTjfqKwmQIzmZsJu
	 Li0WVDCwA3hSZ5PVfnG+EGW7m33e6+otAzkxZvONA9lkeVc9EZq7s6WPT7Qet2ad4Rqog
	 gsCbHsnucuZY5PY2OoqpEtLKSb8UPP056lQNRfIZKXadFAKPH08iFy0k0P5mrm2RlrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UrOZrRzHvLOK5Hid6oKGFwpfZe9jQsY3maaMc8x+WXg=;
	b=TQref1E4xYmQp2wfqrjGm0GVbE0ellHfhpy17WC4LZT8o5FGG75J0s4RVKlvK7HIiUib
	 7a5hN3XRQ7bKvScbFSf9EvXEhyJ/yfs26vsDm8K0yhyP/YscaoP1lqU6gxUPO5CUxzyeB
	 4R/mlTGUAuf/JThYig0TfUdrde3JaeWodezXdMntBJncs1jrOB+lb55Ewy4McXRSkps65
	 HdYqxOJEeDJq3ZGWvTEYXmlZGXpKQaTOHKB7+63EHUEwOiQzh9Q75X6mYk8miXqJo4Uil
	 i9hqhmUC7kACiRDFABwZ+DhPG0cIelQL70kztWF12OEQHIxBXH4Q4P90GgaKzg8uQwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CvvVd5IM;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3241C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CvvVd5IM
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1043556b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561007; x=1795165807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrOZrRzHvLOK5Hid6oKGFwpfZe9jQsY3maaMc8x+WXg=;
        b=CvvVd5IMmJgjDFlxzQm7zo+4gw4L7PofAIwU8YgxKR3ldOL7V7PpwQPKDW0F+DdW+7
         xxzGRpJ4iwh4cIC7gg+gXgsqzNu7p4K5HHeWRXR9jV2142i0Ih/zLlyz91irWK+eR2Hr
         hWRXADEl6tlgEGnXQjOmHF0k58UwG3fn2ZHRyYloYsQq/Xhs5XlRw6uGT0r+e86mp89A
         H2exGebiAt1PZCzn0+zxb68j6qXouYBQYQ3nhvY4owwr2+RtVGQvFq5DyuG2wrp3GVuB
         RZUq2Gbd3Vgo5eARD/YWyNrdydqrAjSUBNQOQjTL+XXG0CyHbT3OSVZ4k1Qw0ZyqeXWX
         4DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561007; x=1795165807;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrOZrRzHvLOK5Hid6oKGFwpfZe9jQsY3maaMc8x+WXg=;
        b=IxqFLc2fF47HMIIS+ugNIbqD991CRZSFRwQET1yiI5jGMFcIXS8vEB3eLhNeyUNjPt
         jMEovHCaB89BJfIRVSvILILgx/DPXkPIxm4qHH+eQme5+uwo2bNp36ezQU4GQSXz8+CQ
         ie1fsQRP6tbNlZ1Z58x7N17V1khI7t/I3zcgmVvIx2RXgwQ9QkoCt1EtSZtW5bNBduQq
         rGZTnUKlJV0VhRVsVUbqrzr9592H3pnTanPrjxlnSkrqEZj4HdftHQ0x8mw3ZlDDx8oz
         y89bRYSbHLR3BZyuMgA4qOBiPy+Cex+gq+HY66SyjkZL9+Z50/LoR71IzQTE5m+vyif7
         SKvw==
X-Forwarded-Encrypted: i=1; AL+hErHu+LKhBVkX3ln6HZG4SFc9EAVRYCRmKDNhZHu1PYSXOqkN5dH7RolZkv91x4VRa6udLdcrSZPawT0aTvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kWYaXOfG/N0eqKN2BSDbqICYXwwtqMgnptVtBFBpZ4+H+ZJUI
	a+OtQMSQDIeq+/VJn8nRdfYLH3qxFX6AcaVFt8K6aFZAUlNlRPcu3A+tfeTBGQ==
X-Gm-Gg: AYBFou0w97h7SXiEfQLIhIdAj3D42cUdzNbtblRkQbehHG+vf2RqzxQc6txM9myvuew
	jbWf6htFUoi1FXiB93y+wwBO5sZVml5mNjyuYjUiaoUtMC4KnlAVM06+Ac4eCpG/I14PSnexTIC
	yR+UHZ1F9diwrs+qOKqE1zWf5JfnTc7Zio/EhdFmTtXHeMOfFlqME83BM9j2rbvBJjGCvaJ1/UZ
	gcGRaAzhq4sGW5sgZBSGY9CFerZBRmRwecjGZtZXox6ESu5Fdbe7dgddnUJTxV/bs9y2gXAJNi4
	RvBWGK2qve6f64tqVg7az6Zo1M/67e56cSHImAVB698M7gp34DFW387I8M4F4S/xmv32cIstMwx
	Aw937Z6Q7PQn0ajOOJoSawRv2z9HqNN7WDvjC/aFWt/I/nMKQTuTaMxTOSTtGkkVWeaMCt9IKzn
	yTGYCYCTnFDxXp4Hl7tG/gvOPv5dCiVtULKc9Tok7l8ODs7BYJ04m1oThRSgqi71q3pHEwtWT3Y
	U1AukgcYLAVpQl9vtK7nQKvxaP5Buvk944MeF+K0R3BcMxp54TXTrUXIl66wIS/TZK+NsvzS9rY
	M4c7LEVjNTas5vSLgG3eZEd+7TAD5dziQo7JB8NHmAth
X-Received: by 2002:a05:6a00:188e:b0:89f:d449:753c with SMTP id d2e1a72fcca58-8beb5fa81e5mr1982511b3a.10.1794561007317;
        Fri, 13 Nov 2026 01:10:07 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2346e73sm817601b3a.40.2026.11.13.01.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:10:06 -0800 (PST)
From: Vernon Yang <vernon2gm@gmail.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org
Cc: akpm@linux-foundation.org,
	shuah@kernel.org,
	liwang@redhat.com,
	jackmanb@google.com,
	linux-kernel@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: [PATCH 6.12.y] selftests/mm: include kselftest.h in vm_util.h
Date: Fri, 13 Nov 2026 17:10:00 +0800
Message-ID: <20261113091000.382250-1-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vernon Yang <yanglincheng@kylinos.cn>

commit d8a866c766ebe34b4371d42f4a3edca200f5e645 upstream.

The 6.12.y backport of commit fdc3bc349794 ("ksm_tests: skip hugepage
test when Transparent Hugepages are disabled"), added a KSFT_SKIP return
to khugepaged.c, but the prerequisite include from upstream commit
d8a866c766eb ("selftests/mm: add commentary about 9pfs bugs") was not
backported.

As a result, the selftests/mm build fails:

  khugepaged.c:1195:24: error: ‘KSFT_SKIP’ undeclared (first use in this function)

Add the missing include, only the vm_util.h hunk of commit d8a866c766eb
("selftests/mm: add commentary about 9pfs bugs") is needed here.

The remaining hunks depend on commit 32b42970e861 ("selftests/mm: skip
gup_longterm tests on weird filesystems") and commit 571a4b62ed63
("selftests/mm: skip map_populate on weird filesystems"), which are not
present in this tree, so we don't need to backport the remaining hunks.

Fixes: 6cd1e92981f8 ("ksm_tests: skip hugepage test when Transparent Hugepages are disabled")
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 tools/testing/selftests/mm/vm_util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 823d07d84ad0..b3d1d17a09e4 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -5,6 +5,7 @@
 #include <err.h>
 #include <strings.h> /* ffsl() */
 #include <unistd.h> /* _SC_PAGESIZE */
+#include "../kselftest.h"
 
 #define BIT_ULL(nr)                   (1ULL << (nr))
 #define PM_SOFT_DIRTY                 BIT_ULL(55)

base-commit: d3417611a3b40b7f04a29e558cebac2bf69889d7
-- 
2.56.0

