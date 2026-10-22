Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709083;
	b=VwJFIapw+E2BelRvUvCn1omJ6ej2jecvb+VbtSfMcC6SqYVOWv2IzQeR8xkD+rRJYqhq
	 gd4Zhj1UXNnf1R3aTc71lhmkDQaFi9UPcvFCo1Ija8UrzKK7ZlesCjA42SqONxgZ3T8Sc
	 6EfeEJRd0yxa1QtIkUegpFlRpfqEwOWYf4eQkYGuSEoaqQzCHOCSKo/ufi1/+PSJF/8Ub
	 o9WoKPwmUjLuSvhIQe6V4xju2omUqAm1IHN+Ef81/Rwtol73VFY0HmWmJZf4lztnm7HLm
	 HGCKjsqk2JuA4+3YVD5MzbyuvdsXlHoIzpsord9YV2iOCxUInpf9S9oqt09hrEhKyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k4fZoxMlqvig8SEoaOPtbmuY6MUiHBjiaHzykL2lErI=;
	b=2ShzVFi+crTzpzHuDfP3RDY5Bln8RBoXNdTQyuEzioYO9nHujsEQA+YAeVdS8hO9Udta
	 n/YX4/P7p5fgukpT9Jp18ibJZH4LujYgTtadsk6Kx3/4lGaqCwFVKRHLRKsZMfWuc0SX/
	 GgXnnuNEi6mNckCvzTb2lMRG406zGo9YcUsX4DYIp6CtRfIGzjefXRBy08vWjM0SJz/Pr
	 VmSofkcP836y12XC4q3nMnmSTNq44yhJDq4V5PX9PdWCIvK/44zzea64TJXW6l8B/5dpp
	 mO66luaQ9QNTm9odE5aZZuPJtUIKRAA2eBHivoA8iq7cJlQALWC5aUHaucCV33wtkZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZbtUcfW9;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6D60A261E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A6D60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZbtUcfW9
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so156701b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709081; x=1793313881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4fZoxMlqvig8SEoaOPtbmuY6MUiHBjiaHzykL2lErI=;
        b=ZbtUcfW97Cbox1/4oJ+iFUIiIvU0KPpzOsKzU6NFQ3zJlZV1PyZtEMRDhcb0ViKG9d
         v8Uo2SUmB128g3IGgbyx47fP3y5DkOJU1WNCsfDHRJNvEFYd9Lytzvs9NH46dEY81zxs
         jFBqN2/AZewvymOUiXVYiLeJNZqT24TKg1v3LFVYZpaXbld26nRy8k44lmMjMh+5wNnS
         yjzMPMjZbQUpFBQu83pXk3IWuek1tlrNUKdVQQsKoxaGyFIwRbV48CvlCtIAQACDiXaA
         ya55qS5GpbOk+pQBINSF5tzKGPg09PsNK1tGynu6rR3iDy8eSPmesKht/M1Wxwbo6WKX
         WB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709081; x=1793313881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4fZoxMlqvig8SEoaOPtbmuY6MUiHBjiaHzykL2lErI=;
        b=ifBFQhOQX0hbtdPH4k5jg2AjlO2zUh/VsZ++PE9lHMUgtUBdl0Ra3xGOBHxzvY5mJ1
         MbCXvExRC+vXODQ3Wt3R0EhUuGyB1ewjm0tmylT8eTb5FADIkKBkjFshewNnZO1xSQ1f
         0wXnHGvbBaVrPQw1RPmBjkUQ+JA8t+9bTbw1DjnVtVp9qZ/tB+ygkwjUvGC54BRXTYfb
         fYv9JWZ8jih+CKvbjdALyxT+pbEHzlyzukIqbBsP/HZSvs18r4qhPui9Iap8mdFcauUV
         9DfqFq4Rweku81HUZ2l0ytbZwXL+T3MG2bDzuO0NXIcc4samLcqZfR+jJn+jaOoGD37j
         u2uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJS6o2gXFeAl1LYUoewWDrNVDU2nBeAgddeV5h2Y988Rs5XE8abh729XLpO4zwN8F+gaGUghuzA7aIpKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1yjIx8sD+WfKxT3w29WvXUx4OPpxqM9T/ZwEzIOlOoD4cVEXN
	mFraKhb/yniiWEdeh+PtA8KAC42JXtlBAfM3bHD1H8QpLVubTJGtQbnp
X-Gm-Gg: AYBFou2C3O0kP8Hd8wdcPDpordJRNFXgdOjOSNPYvv8LwDneqkyTJv9IrmUpCl1wisl
	srCAdabne59Air8zWC5BLC+OtlD4k+2xzsarhwwbWbOeNAzxQ/f8KI5vVd/c29KyV4OId6a64g2
	yy6x5VdvRPdqMRV49DWqQk04kQT/56hTMFRmS0eauypoMRXd4MAiS9M3/7lU0MLpWIQtlCSio0p
	s/LcmwTW190YvSlYtsnzS7CD3ggLV6HcUOo1tdkK0isgAQJnCY80XppSt8706satu1m5ivHIFN2
	yhyWevh+RKB/EMMPp+typwmKF50R+8eG9TdtSO3r09QQOKcfym5vtLrmEjQRsvk1mYdVxvBBFqj
	0Osh0P7jQ82Ci/nEjW1lTKhQhhhjQFTHuc2vukOFqDQO9scecLJVo75GNQVPkdlvyD10dhya5u2
	N07qFg8D20xH23XiZJJFlJ3CHKEvO95M6C3JEQHCR86MGZFONDCem96B+xRd+F0npswzGuWW0IS
	Yho7pQVpjTrtDBNl3lzGwsS3m2Nz0aPrSrUn/YhjTu1C2uvYwIduQ==
X-Received: by 2002:a05:6a21:7084:b0:3e2:729c:9bcb with SMTP id adf61e73a8af0-3e376771294mr257966637.65.1792709081481;
        Thu, 22 Oct 2026 15:44:41 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:41 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
To: Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kir Kolyshkin <kolyshkin@gmail.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] checkpatch: don't suggest kstrto<type> in userspace code
Date: Thu, 22 Oct 2026 15:44:23 -0700
Message-ID: <20261022224426.2756960-5-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022224426.2756960-1-kolyshkin@gmail.com>
References: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

The SSCANF_TO_KSTRTO check suggests using kstrto<type> instead of a
single-variable sscanf(). These helpers are kernel-only and are not
available to userspace code under tools/, so the suggestion can not be
followed there.

Use is_userspace() to skip the check for such files.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index be0e0493d4a2..7a520faec34e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7204,8 +7204,8 @@ sub process {
 			     "unchecked sscanf return value\n" . "$here\n$stat_real\n");
 		}
 
-# check for simple sscanf that should be kstrto<foo>
-		if ($perl_version_ok &&
+# check for simple sscanf that should be kstrto<foo> (not available in userspace)
+		if ($perl_version_ok && !is_userspace($realfile) &&
 		    defined $stat &&
 		    $line =~ /\bsscanf\b/) {
 			my $lc = $stat =~ tr@\n@@;
-- 
2.56.0

