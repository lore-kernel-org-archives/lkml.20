Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237568;
	b=xnkz+vpTgGM1febm2QvVFQDBOGA09SCXRL1Lz0u2cojZAzzGNHJ3eiOoFroDaNq2t+SP
	 cUOZrlexE59/LIBlKSUSfYbaFuBAi5vAcqDPj603ahc0Nrn0pP8xMdpiej96u26dtCktv
	 zMFAZEy9dN9gLu3jcNfYxKwopPLp0lnVBcZO3aNFU5miT3U3LBW2aRksSzg3YuMmZMKV4
	 ykxWBPa313E4x65K0Yuie6lNsDrDKelpuN94VCPgpFOSGnn1TmEdxzQUTJNKy/4b55TJ7
	 ZNm/rHHiu2wbu/7oFJ1i97pn+KXTZtxIbrXZNWrqEyoQM+M0v7TsuNiAsj9XMKazkuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sOAMN6xB6AUOiuNDamigNEt4burmkXflULavAghu0Hc=;
	b=wvVXHWG9v7S3BdzZTO9SShMvnwadpG+6faxOv11q6HtRDo+4LBPtEkpFgMqWtH6YFm3W
	 qS9lEOxC1YjKsSmNhA7mfEHel+dO7YVwO4CA1SSFwwSfMqqWNbas7lIaKEUaL1WQv7j0C
	 aFVi9wdtdRU3SlEXzPHc9ryBRhG24Ns9CqoAA7ghuhDeqWpLhKMVMT+Osz60P3puE+m8M
	 nAtIHJgd4YUo2NElRPHhHQX51AKyIU5B1nRzUU7ZWvwsfa8FlPNY7R4U864L2ypDJeHuk
	 hgL7roU5b69Ocr5jhb7ka1zjC29p2Nhpn1wPLBC5OYi28/QrK/fKqxzjLO46Z/6MLWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmABFaJw;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF1B606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF1B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmABFaJw
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso883532b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794237567; x=1794842367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOAMN6xB6AUOiuNDamigNEt4burmkXflULavAghu0Hc=;
        b=BmABFaJwRDbo/JuVeLe7Fwiac4Pa3GGM9x5qQ2hEo87GfV56Q7pg8LxpFggbyEKZyq
         OLcrgqV2wthO5NLR4BI9TNk1zz6oXqW6jeMFKjESaG7SZbN0gEXVPyaF8MGNvEsZfruU
         FtqjvsEJ4f4MUvKOosR2r4WhizqNDMrrRg9jXzMfxWeztgex5kSBvFnkr1l6ENfftHwd
         wRAyrFhFAkSGvLLv+ovwWGvaEu+GLUFIXdMB0RUltMbIB074Wia4ZFPc7XSH11c4GW8S
         UEXPeIpK9X5JKmJlNwBn0hbVquKOQ3sYG6G2PH4E0JtV4HL7eHZPlKFbDxUUXDcxzL62
         gSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237567; x=1794842367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOAMN6xB6AUOiuNDamigNEt4burmkXflULavAghu0Hc=;
        b=e4pM2l9yV8buyhI7TiLeoIcPt4cdSfTalrAEl6YMozEjJaFUuSgJ/sQ2XO6ueWWooA
         bKurLMwOCdl0w86RLPbCF4uFsiY7dD55siSmjcFP8RDsmPA3vr3DKMCv8yhiRpWcBvUn
         l9mtySubx263ZddSfHdYbciEoZVndHeDpg3dfVO7AhoftSSodrHw1SAi3tyEjQJNmuCf
         0rRN0iJjroIhoGlMH+eFdX7VirLpfqa/13W4/bUfkNjqPSG+RfAWhiZ+CD+qXFOEduQK
         V8mxSooVItJBe0KAPgjlARhE+gOuteSmfyY1jkN4KKP9L9CsAZ4XHMHu7gFFNAdyqCtz
         BwdA==
X-Forwarded-Encrypted: i=1; AL+hErHme6i1NpTwJu7lBpJtG5feUDu3A7ypGBwxSUuYciliJMVRNBV74pZ+ZAQSnppCZ47P8X76lCp094TwYFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wJwE8f9DboEhWnyzOHZ+Ej3tifDQwGZXusfnEHsVuzPcD0cHt
	qePKdgfMculnrSL5vCAxchVy6uCKBiO4HXna5soXE1E/XFe1PWZx+niM
X-Gm-Gg: AYBFou0n04BUBBz9bReoJ1Hup7CsglwD5JmSMg2sJLFHvPVuh1fcQ1T/+XBRJ6QW8du
	WaJILXf5n/poanh+5uyrRGH7UC9G+O2wncfsI263hoWJPr/byAjvgEvxNINAVFl4H58A/vhNRvw
	CUK0vaQnwY4gTBr+483JSZd+u61Yp7mGMs4Kou8NvE2OLNQa7m/F68TS8YkFPBfj4dzr9hpYWj0
	w4pGvwZzzTXStbtPQGVW0vOMrNHQssYMj7jE1gt6yzuajOp+iNUGIY//y/ZpV/wlOphaGdw4Ddr
	taLZwdELo1DRRw2cOzVXXw8D6CxBmvZOXF7crFvyxxAK/NS89d7E5GR4zxBYvcTkRWtVkILdbHE
	eUq6i3AykoF1ldfarokXSfiGB+qmggGCr6l/tAq5oFQ3Ji5idS0iI+RBw/+8jOwRe9yn1CG8FI/
	XZj3BzI8zeLtqSHIiVpFMjtjkepiDREPW4TtFQqspSVZroStg8VPJVHiIqiFYa6wnpgsqLGVdWs
	A5O3GWeWIVmlxJn3K+LsmHDlwv7uC4xuEhd5674G1ytg75f0ljzggt3ORyn06XWAOlc8/mr7LBz
	XfajBFMvARgIvQviPatW6Pdc/7j5wgA3/0RC94Ew1f4gqudv4E1BTTVR7OHW0WAwIeHEg1r21bw
	J2wPCbn7qV1poM+e/
X-Received: by 2002:a05:6a00:ad89:b0:89d:faf6:c69d with SMTP id d2e1a72fcca58-8b670a219damr4138847b3a.58.1794237567091;
        Mon, 09 Nov 2026 07:19:27 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821c57sm1508383b3a.37.2026.11.09.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:19:26 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>,
	Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH] selftests/proc: proc-empty-vm: handle CPUs without protection keys
Date: Mon,  9 Nov 2026 23:19:12 +0800
Message-ID: <20261109151912.156518-1-lylin1023@gmail.com>
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

On x86 CPUs without protection keys, pkey_alloc() fails with ENOSPC,
as documented in pkey_alloc(2). protection_key_support() only expects
ENOSYS or EINVAL, so the test fails on such machines, e.g. an Intel
Core i5-7200U:

  protection_key_support: error: rv -1, errno 28

Treat ENOSPC as "no protection key support" as well.

An AI coding assistant (Claude) was used to analyze the failure and to
draft the fix and this changelog. Tested on v7.4-rc1 on the machine
above; the test now passes.

Fixes: bf5add391eeb ("proc: test ProtectionKey in proc-empty-vm test")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b3f898aab4ab..a9d3c973a663 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -77,6 +77,9 @@ static int protection_key_support(void)
 	} else if (rv == -1 && errno == EINVAL) {
 		// ospke=n
 		return 0;
+	} else if (rv == -1 && errno == ENOSPC) {
+		// CPU without protection keys
+		return 0;
 	} else {
 		fprintf(stderr, "%s: error: rv %ld, errno %d\n", __func__, rv, errno);
 		exit(EXIT_FAILURE);
-- 
2.56.0

