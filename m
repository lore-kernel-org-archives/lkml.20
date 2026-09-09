Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76666387566
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935949; cv=none; b=MpZCOzNSnfq9jpi1n8FzZiAR4xlZyAsRlOLbTHdKxY7QGp/ZEDCIkCBmAdr4HgtQuhwUEmp1N/OHAKTP8cQ4rCw5BdKKVhoEakaoO2LjunCy1DqW6dm7RX6Z/CgN6wyoigF3UfH4ZN4gCcllgJr6wFLhqY5IVNBVcvuy7jvK3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935949; c=relaxed/simple;
	bh=URNE8YrWrYmFHqIwSBcA80NKJ3o2a2OomacW8yom/Cs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MgpvItdr3JLtgkbLBVrGhu4XPhidqlyPEI4fPJ6ffoiVGyQJJFeRHpt+m50+S2jqBS/wgg36E+QS2HwPAn9bKi4+CP/P4rzyWobxkXr2zlIV9jxLh5Is0r5VR+96a7g6SX4NIUC30kJJ1NT9cainWs9JlL2WnqJuf1su5EpMmI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mk2vDOTz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mk2vDOTz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so50895005e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788935945; x=1789540745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=znZXcU749AqU4BnutbzVT6WxOQKsWve99H8svjP+jIo=;
        b=Mk2vDOTzFAp4k0fXN5p6/un0b6oXxmBBa0ZbCVRlhQ2mfuqJJgAmE2xw6juH2BR7j2
         qq+zMbwoFoxHgwrb4v9BBr7JIv8scrWGpLQtIFI8myQIi6e9mBNDIUJbuKPPxX/buKw+
         KSPM81ZGq1KaqMHN2SwwePanbh6fl5N6TLBUjZt2wa15wH+WMd/FK0WMro0bpMU/0riw
         c39+Q4xSmKmmAPpKuE2J6F/EjsqlRw1QL8zY33+z5EXNhfSQLzONoXpnh2x4vIUtHao2
         n6KUSCgJSMaUIi4SlmuZrFgadEHg38EetkWCAbUFb0y+00Q1+7S0xSqjMNIAM8ycqidu
         +X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935945; x=1789540745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znZXcU749AqU4BnutbzVT6WxOQKsWve99H8svjP+jIo=;
        b=AOtpaoMlROtX4IOQf2fKvNeVSaW8aHDmBJ7i5/ve/jl0WwCzwSN0FjFAE/ML6/Ax9h
         bb3ArhIgN45m/+kBZZetzjtXfXQgXfyqNLisOHuM4DJ3CxxZY354ipWeGzbnmRD4K+ui
         Q+jj37BDL9igrJ3n1NEqpA8MfusEHqdRQIfSVYbtFYJxUm1YSBC4XJGrmMjDK4Pf5C5p
         XNlBW6zcjOmkxb1MUHiyMwt2d/RTQUwfDAH4ALRllVEZrftNM0f0eLg/GidtBt/YmRON
         l2a1OHUlxH5WfgtK6AW2F4tk8cjgy7tlLlwH8O3xk46npei85jIdWJuC+JJyRjdE8CnV
         gI4g==
X-Forwarded-Encrypted: i=1; AKwUvBwgzm18558Zds1DKk+FDDm4fjd24c4ZDRDOawkI/jvlaDLDbKz8Zv2CiPYHWXcnQH2V5cMiL+1TpmDUdzg=@vger.kernel.org
X-Gm-Message-State: AFuF++l2MMZZjFNXHLHWPJByJ9bvtjFKaLsXdanGwn/UtbA3UAUD/90T
	CjUAVKxV67Ge4ziEGdTfRhEP3UjLCPOm4+i+e1EIJvT+59Vi9GZSHhaV
X-Gm-Gg: AYBFou2jLgznJhZILW/3FD2LcMHPpLjFchkcwcfvIy64/3gdE2TMfitzfSNY5Ppodm4
	+9byZ22DO4kUhVYAT46rK82THyL/7wTVF0quTsb9DKum32s6BCACDEp2cI7uKDRgxf/qBl9ClIq
	NWdXowJKh/udTGMyrJqD2AK7Njy0WFmqaITKKNoYkwEHB705dUaLpwnIelUJ76Wsu6wTdAgeujT
	NO7+nRFnURhc5OrEtEDp+ASlU2Vl+LoAREF8L/TRCVKv7AM+VZg1D0aLY6H6odMiStZi+7ZC8y0
	i8EeGqtFYqeqXmO/IawlKJw/ismQkRj7N4s3Zuej4i5r/rdNryN/iJ/JroPveT9WospirB3BHwz
	At7/Z4zo2oSAuQVAcBp1vSwB9QpF/7l4iGKj7lim/vqIn31tB6qvUbYeFpPJj9+bvCSeXmuwx/u
	kTHKsSoDWUyYPfJT/SDkvedq6noycdbTCYqxhQlpQI0f5txwg2kAXLt+t3kjaE+NMHdgC+z3qYi
	Oi1MUr2hBsk567DX2MPLiP6jhI34euP8CXdllw0GtS9lGmKCVuHb+jhjzpXF1nd+MxQext9NTbR
	8+K9lDBPX+gZp3xAba5ZUIKuMhNqDHLdkgb+CwDGpNeK5Lczw8hq
X-Received: by 2002:a05:600c:474c:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf828cd70mr309528225e9.16.1788935945280;
        Tue, 08 Sep 2026 23:39:05 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20dbe556sm16450365e9.3.2026.09.08.23.39.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:39:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] random: Fix vgetrandom_opaque_params kernel-doc
Date: Wed,  9 Sep 2026 08:37:44 +0200
Message-Id: <20260909063744.89918-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct vgetrandom_opaque_params contains size_of_opaque_state, but its
kernel-doc describes size_per_opaque_state. This leaves the real member
undescribed and adds a nonexistent member to the generated
documentation.

Use the member's actual name.

Fixes: 4ad10a5f5f78 ("random: introduce generic vDSO getrandom() implementation")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/random.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/random.h b/include/uapi/linux/random.h
index 1dd047ec98a1..ef6614d9c704 100644
--- a/include/uapi/linux/random.h
+++ b/include/uapi/linux/random.h
@@ -58,7 +58,7 @@ struct rand_pool_info {
 /**
  * struct vgetrandom_opaque_params - arguments for allocating memory for vgetrandom
  *
- * @size_per_opaque_state:	Size of each state that is to be passed to vgetrandom().
+ * @size_of_opaque_state:	Size of each state passed to vgetrandom().
  * @mmap_prot:			Value of the prot argument in mmap(2).
  * @mmap_flags:			Value of the flags argument in mmap(2).
  * @reserved:			Reserved for future use.

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0
