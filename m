Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332132;
	b=HczzHSr5LRqBXRXqiAQZFg5L0gMAta+4YT/2NyV0YXANrxpkp+uPUlxIYxdNf9LsVEh5
	 qh+wxznqKW/bXinB4Z9VpmpShBr8j6g0n9kAltp/2VXyQFLmtpSwhe1UIeeABTk6Qs+Rw
	 jDA8iK3mBm+SNDyiWXfKrYfwRbbdyuglBtEbg4/xK9YqH8sTHn/kAA/ThtVatT1RSgYFG
	 knEO0ac5YW8AvS2c+n5dxrfsHTJIkjWjiOEfSUN4K1jpivAW1QiamBQOMp1XbPgcsHIjR
	 sXVFElsLB1SiL+yClsBc+uQxL7JdEwTLSK28voUNBT+ShDkNTX17KcI4Ck+QX6ukc8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
	b=XEJE7NVYTr0WSTZolyv0SIzhTthg32F98pf1bfhxPsdqPiZyQu4CLUskVMnnfDHIhDhR
	 VxoCILmgZfA8Z6/M1m2i0dffn5/qf0odgdsx4lj6U7p79ItHxqLe1ZoM0aO7oDVOIGlXG
	 Ipa6yl5I+wybQT/4pZx5dAL9wSRR/aVFZpi1KDA3lgD5Lg+GWuzyO9YANGvt09iXa02ZH
	 cDYkLJjR+LtF9sRphgwkf67bJ092/3OuHs6uCs2R4rAarH1tvESfAeXb3MsavuOwHE8yh
	 EXFYdlaqhFTcSoOirH6e1yAbq082MWEVo9dAuLdsphB9o84MZzBSCKvdVv7CwL9P+Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCLSelHd;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC7606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EC7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCLSelHd
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e47347279so1523966f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332131; x=1794936931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
        b=qCLSelHdSwkXDi7F+RK8rmmA8JQQ27OnfUgKyHi0/X6kr7m2KA8dGm7eRUAYrqbs51
         D7TRDFJSEHBeni84txLs6nAwKtI2lABPTcjJh8BIczjVP/5VhJVfoSkDRM1e+8agSbys
         S+pZfy8MzfwPQdYNctro7QYB7ppaWgtguEuRDyR3n1Ml1JKHFyn18zB6DUgPET+ymMlc
         +4d5BZDoz6gW1VdsoGSZnm5sH2TvxF1vmD8mg/MbznEkheFS6YAVdQIj8RGAC0S8tkKX
         myb04BMRp3e8bvAllXH1hpN/35c6bYS7piAZXKqXD9aqfzHKuxflD9Y02Ej6fER5yXun
         xDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332131; x=1794936931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRe6DvGzMVEKtF/UjYGmmLxKrND1yOzI81LM0TfOFc4=;
        b=sCQVVNj6DULs2ZkGOAe8ZF0Yx/6l1oZx+RFom6ZN43JeTpO+PlGu/CUJA2bYpZi0wT
         VxLTcYJznqfL3gEQErU+XR4NiHIXcz/gW+gPtvsWNzKgeGDnXDfa1S8NfGgIz733DVcr
         UnWFtAybfRtCQ1f+plijb4yOPszgSqwtkVRlcXM2L6rP+/IJULFNI/3ywnbhSMN+Zp8c
         BcDXu7OUCkRJpKMGSX44nVyq8OmSMRH5CQkr5W8cvpyabPFW6mrIWtKhTIbra6MCw8lM
         U8Wvi3wc5ObKW7bdottKDaXdh6KnGVLNuybto0ssvvTvsp0szOA2JBi2uVMSdJNKswTL
         p1uA==
X-Forwarded-Encrypted: i=1; AL+hErF3r+X8ICyxVslLVYIXg94N8KofidIuVPhWFDRe2Og8kMmkLyBRcngzV0dGOSPezKvWf/e0ZD3Mzg720sI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y8yWXoj4kp+RkDLIhbVbFJIPXPw85cYRWmBYntRRWq85amfiv
	u76dC7iALoKbm/CFtbWYZ3gLNZ7ih2ndnTHi+eba9tWiFsQwOEh73bB2
X-Gm-Gg: AYBFou1VWj/ORi5hvZiJttGNYdkf0iJFxRNbuHrFtmL9WXyaCV+I4mBiwrIlxiHO54J
	oseuHAPlFAvzHZEKXNmcUMhbPlWKbslPoykxfZUFpAMyKm8hbfasb5clRbkM2XQYR5Fkz2gTznP
	ez6IXdvOwJvzwkiwGQUIp4Agv+TJAEeBpV3RG0c59Kod6os/aDpgknrzeK4Dd4AHBQIUIjPg8Oz
	rysOWD5Ee/b5yBQ7Y+A+17UA+qb/9ft3Klx+9AZn7BoSPgRph7sWQcIXafTBX8uiwt8y8qANk+a
	9k8JZ7fJfSI7pzDDTzXJVUYL9bn94G7AtTsLa/zhaqxEiJPn74W36QzI1VUKXh4a3h9O9lGifRj
	gtZGcEMI38tke2hcNDReqtOlOQwzhwZlzgpOr6xpCnAO6Ks44K5MBTOJ/Y04mBv91LkhwWXU4Qt
	ML/pWE2EznK7+/g7xcHKjXl0yB9iEjC7REUHTslwzuX8gBdFITEE5PMsxTMSuyJZwjaSnwe3rKs
	r8Tk0/ySDpA6CeFmOKBPgmiwY+QP0Ab35zLOH9wRhQ7SeT58lbCLxsY6OmEhrXTl+3KsdcP0uyk
	k8OTpP1mLPmyu1VdnnM4C2H6hdDCiYtS4eygOG9REd1LRe2o3BC1xEQyOaKtabW9Peg4WE9pdwm
	8B5GpNqm9caPIwQQjHZM=
X-Received: by 2002:a05:6000:420d:b0:48e:7a41:d78e with SMTP id ffacd0b85a97d-4982e7379b7mr6438321f8f.19.1794332130261;
        Tue, 10 Nov 2026 09:35:30 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:29 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 0/3] kconfig: wrap long expressions in menuconfig
Date: Tue, 10 Nov 2026 17:35:23 +0000
Message-ID: <20261110173526.1548434-1-julianbraha@gmail.com>
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
Content-Transfer-Encoding: 8bit

In an offline conversation, Miguel Ojeda reported that scrolling
horizontally in menuconfig's search to read RUST's dependencies has been
slowing down debugging.

Let's wrap expressions (like in the 'Depends on', 'Selected by', or
'Range' sections) between tokens at the end of the window, such that each
line begins with the same indentation. Ensure the '!' negation stays
attached to the left side of the option symbol, and keep the value
annotation attached to the right side when wrapping.

Additionally, write a '\' at the end of wrapped lines, to visually
indicate to the reader that the line continues. 

Patch 1 cleans up the existing expression printing for 'select' and
'imply' (which ANDs the select/imply targets), to properly call 
expr_alloc_and() and print the output of that function, instead of
printing a literal ' && '. This is necessary to ensure that any '&&' at
the end of those lines will wrap properly in patch 2.

Patch 2 makes the wrapping change primarily in expr_print_gstr_helper(),
which already handles writing expression tokens to a growable string, but
now also keeps track of the wrapping info in the 'gstr' struct because
this helper is called multiple times per expression. 

Patch 3 adds a visible continuation '\' to the end of each wrapped line.
This is because some line wraps are not otherwise obvious to the reader,
for example if a line ends with a symbol instead of an operator.
(Below example uses an 80-column terminal)

Here, it would be less obvious without '\' (GPIO_TQMX86):
    Depends on: GPIOLIB [=y] && (MFD_TQMX86 [=y] || COMPILE_TEST [=y]) \  
                && HAS_IOPORT_MAP [=y]

Note that the 'help' textbox uses the same expression printer as search,
so this has the side effect of improving the formatting in 'help', too.

In the future, we should consider a larger revamp that would wrap all text
in the search window, allowing us to safely disable horizontal scrolling.
---
Changes since v1:
- add '\' at end of wrapped lines to indicate continuation (self-review)
- use expr_alloc_and() instead of printing literal ' && ' (self-review)
- properly support trailing '!' and leading spaces (sashiko / Nathan)

Link to v1:
https://lore.kernel.org/all/20261010095001.265759-1-julianbraha@gmail.com/
---
Julian Braha (3):
  kconfig: print the output of expr_alloc_and() instead of printing '&&'
  kconfig: wrap long expressions in menuconfig
  kconfig: show continuation at the end of wrapped lines

 scripts/kconfig/expr.c  | 33 ++++++++++++++++++++++++---------
 scripts/kconfig/lkc.h   |  6 +++++-
 scripts/kconfig/mconf.c |  2 +-
 scripts/kconfig/menu.c  | 24 +++++++++++++-----------
 scripts/kconfig/nconf.c |  2 +-
 scripts/kconfig/util.c  |  2 ++
 6 files changed, 46 insertions(+), 23 deletions(-)

-- 
2.56.0

