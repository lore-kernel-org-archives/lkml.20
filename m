Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799170;
	b=EYV0fXm4ki0V6jlznMrBrPF46PZ7p7QFTQ/LqJMdkndcnN+Rk4Xk7WWMQks6oyr7lM0K
	 0iBsqfS7AWzh7T9OWeXO7pMu5sICQTRl8i1skWpepZvet0Jo9tfgWsApXnK15nH0SIW9R
	 62WEAJyqh+mEhg0ePfEIep6AsDGETKkE4j9CiTj/D5HqK1YoM3jAV70pWrPAASwC4dlhh
	 Q4HF7gIaUX3VMHnMaDeMFRls1QHKN1kUUqlLzxNhqOV/JMmP5xuAkd9YAo6fS67v8+E5n
	 jmO5DnCa+Ut0VYb9O3e0s3VsPx0Jsf8Fja/lkbG4PPAkjtTSv3BZz4e/DYkWCu1kpSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NHrXeDMm3qDspSdmiyISYSVqXsqYRkHWDw+hommVmRE=;
	b=HHmyb59618oR+7NVVHG9tI+GcjGRByVy5G3t2QIa45vkAcTREVOjM50qdg6GyuZYcs7c
	 ZS9s+j8ooH0ejcnGiXuKVW4xvnTOwLe0KxN+bcDMwTRYyIhOmZLyg5UHOzYnjufA4aPJo
	 jowMCcN1xySPc01hFiuQqQk/J3a1LDALrlo8+rt0L05766f+tiBptKiHVXYPhMH6YeF4b
	 eiBz7nEOAdDESJmO13myQwOuzlXxo4H1hs6Eyj2YYqvkzj+68xpBTvc0VU05JHko5DCLD
	 mn7eXI3q5CFZxI1/83Y6tHZHyTO59KLRDI8dRGy+bHXeMc6+v2BxwEwl9Nhq8OdFH4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxfw6gUK;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D1B606D808
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D1B606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxfw6gUK
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso288277b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799169; x=1794403969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHrXeDMm3qDspSdmiyISYSVqXsqYRkHWDw+hommVmRE=;
        b=yxfw6gUKwfJp2UuyU25pLCXVj/iCyT+5tv9yXKrls2QPKSimGidfBfI4TSWq5BeRHO
         8TEIMOFanL3bpYnyC97U5Lk1UDoZtVyYGZKc1/D+Ha6eikJCDz72yl+vzBlYvvuMQDT5
         CvN0uUdLOdFQGLAk2joRxrWH2kUbJYuvJjsjohO0vhGwPpz1gAB1OZTPQ5RKc2n58Lq1
         mBdvap4nFtCUCDoiNpO4HkksG3UZbhnf4+J+IpRTP7HXHKTMPl2N1mWsC2KxL6/8WJmD
         SM66mvlfOdq6UkDY5CdHibP3dQMlALDXtuV0mj6v0SF6TYgribEE7episefpDKZDrzU9
         Ae/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799169; x=1794403969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHrXeDMm3qDspSdmiyISYSVqXsqYRkHWDw+hommVmRE=;
        b=rQPDryA1KD1kz4Lk4BqxmZC7SbkBaV8sQP4AOrPLSZN/4QMyIRpmfqu90ShrOze0Ei
         /X0HejmPMO5ubU0ecPNiICETk9oWjta427BKSZB5ncj0m433xjw5FFZOeDp7pJNf2HN1
         iGgakfUGIw+XsALsMw2shYz4B2aS4qLlZ6BnMBhkGRMCbEUtr08IPPcxxWVUC7Acm6Rg
         vwd9sH+fyKiClDOs1/CqQyDwE1oSMCyDevi3c9+SkCRgrkj1yfl9bWj7cvjn4I4j/bZD
         XOWD2LaNx7AjJYL2wcFALkU9euXYB5mSMsJ3qHlnUOgbfjI96dQvhSbFolUQdBXkHBFP
         XJ8A==
X-Forwarded-Encrypted: i=1; AKwUvBzSl1l4ET6Df84gu1/pi3qQm8k4px37UDaYmNVcHStJjU1DEuG66LliKoo9FB9h7zjMyMcTJL8/7EjaQDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M61tMjs8B2spSGdKlLUUmmNj/bl3wGvCa+l+sajAT7+cciCNT
	JtTqMmBAQcTW7lvn+EKriEXyJbTTt1mMnlOCCKY1uh8gawfQuI2C7jKx
X-Gm-Gg: AYBFou2Oq/h2G/wWJ8wd0pArvinRm2kZ634DXAVpSMFrwgAQOoHD2edvsSlPYVd9oda
	KGKU17Qo8gNyCdQ3e71AljkZ4D9f92Pq7gIJVIlEX32B66Fkp9WKWlkz7vGYZuzpQ43KMDa7iu/
	deWlk/d2PzH0AgqH5HyY79CcCiW1v7ZXAFduv2SB6mCHy3YueWaOWgwTACqEH/L+saC1qfPC7aq
	rP6dmPYBGuDrVvoAoKZTyLK5uxZupX4GDl3ALXUG6S5yE7LITVhz+LNuiQs4PeMnYb8/9zmwJbS
	BlHP89YDhaxL9dgrU98YxvFheI6QvzU4hykjVIUQJYFXO5dT+nCWuSdeLz5P28luy7msnla2lu8
	fAwxYjQVVkcFjgl66qCrLI72Z4PeRwUa9wDg3ZHVFPSlcPw4EHRyHSeu2XdSr2QUdNMEsg3S/0J
	jWayHlHoU/tEsoLgFE3yNahm3Rb+/yJeo32/eIO7eBxYbA6ko+XHBbk9m8ruV1BlynJp8EpGB5/
	9jLXWNcxmuHBaYxLm5EpDQVeDLyMKaVL3FHdceY3m6EQU9h77WKoe+C/pZXbftHlG6kBRDOzAOn
	WXcVoBEKtYqbtJ36SH5TfVY/qQAUzlhaC0PhlXGLA7nQ8FWz0DOL08lgAPvO9Dd6CXookaU=
X-Received: by 2002:a05:6a00:2d12:b0:880:a842:bb0a with SMTP id d2e1a72fcca58-8a9be58910cmr12485773b3a.9.1793799169033;
        Wed, 04 Nov 2026 05:32:49 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:32:48 -0800 (PST)
From: Longjun Luo <luolongjuna@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org,
	puranjay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longjun Luo <luolongjuna@gmail.com>
Subject: [RFC PATCH v2 06/11] klp-build: Require CONFIG_DEBUG_INFO
Date: Wed,  4 Nov 2026 21:31:52 +0800
Message-ID: <20261104133158.3187525-7-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104133158.3187525-1-luolongjuna@gmail.com>
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
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

Require the kernel's debug information configuration for DWARF-based
symbol correlation. Use the C and assembly flags supplied by Kbuild
instead of adding separate -g flags in klp-build.

Reduced and split DWARF are supported by the reader and saved-object
handling introduced earlier in this series.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. No failures.

Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 scripts/livepatch/klp-build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index 95bea5b2057e..da55e1028fe3 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -266,6 +266,9 @@ validate_config() {
 	[[ -v CONFIG_KLP_BUILD ]] ||			\
 		die "CONFIG_KLP_BUILD not enabled"
 
+	[[ -v CONFIG_DEBUG_INFO ]] ||			\
+		die "CONFIG_DEBUG_INFO not enabled"
+
 	if [[ -v CONFIG_DEBUG_INFO_SPLIT ]]; then
 		command -v "$DWP" &>/dev/null ||
 			die "split DWARF requires llvm-dwp (or set DWP)"
-- 
2.55.0

