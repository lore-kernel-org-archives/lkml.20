Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070641;
	b=y0d0uRVkSWCaEnp1g5+Z+umVIlDWiakVnY4cYfL+OeBgrf7WEt98WGe/xV+PPh+D8+3y
	 HqtFP4BeObMwnMp8XuAnfJKrIS9qdD82RaUwFkJn8r3s1ulESDMWU7b8kcH+znPwJuz8e
	 72wVxcnCmeFBcwmcr4LE0Yvv9t8+aDNtg10f3pqcO3jPCvNA7sMZzzHAYaNPtQBjwVymU
	 g5AiO04e2cN3OxLxl4ltpXRvzdXUbXr5nFF2ZG6uMFBlyzTgVkYDxUXJEpa5rHnCZt74P
	 f7ZmhmHO8A0SEd+OMCSbh8GZvzujaSgHj01FiHG1bHFMa3adXnIxU+OyzFA/RHjYE4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
	b=avb6IQZyamNqqznaGoNfw+0H5Dqc1sKE4icJFo9MwNgyn6Tilg6Gug869PH3C4gMvORs
	 UjKYc+c0KoHGpb8ZFGnT2GmL9XpY5BxgUNljbdcjr4NHpzd1mOSB+/zSf1ko9dRmItUbe
	 K2KVBrqHESmpDVaVz305MXbEUqkFbLRKME4mt7NzFJL3lJEEyAn6IAR0d05iwBeynReml
	 VEhLnvXlnRm1DM4d/b7stBTwM9iN5RC78chG+a4ctQBL+GtGacZaMfUJSH/HND74lCAEO
	 EwbtgjQwEBTF0aYmacBBAxH5fX9WdPCR9xa4WVElv9JRgn8bCKK9Uti45AiBR2xACVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVbx9nZ2;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98EF606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98EF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVbx9nZ2
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so459481c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070640; x=1794675440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
        b=FVbx9nZ2ZQU/Elz+giW71b2m0Bac3qeomfVqTX0WiyIt4mAJdLaKsWVhSGk2pUiUpy
         cpzvDvXBUBsmrsfeQuJ+D7gsbcQK8ztdetkr06L53bMUL4YkCCkC0Z70DqQY5tK83ehs
         x8kQS562yWqhZ7zMv3AQYRkKC3IzyAYzzljvPmJmA6RIE/f5lzFm/puQvZDX5KFVzcC7
         QYH2kyHHjXJGksKwIjGlUtHpmAdZne9UdiaTWs7xx5MOwQboahwUbuG9lskgNAVngZUP
         YpnCQej80VTWKfth5/o8/BUtIDUJmsylsOtEDA3GTYHp15Tion5NtJt6Gr3KLf3pppci
         PC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070640; x=1794675440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy+b2FmS+WOb9VH7r/wCKLd2ZpYqYwoBlahUfl/vu2s=;
        b=enmw+qMGS+VSqABL0+EOVXI+Z1JEZwxxkOck7sph2Q5lgm6EXYSjAmtupYp1HdqTIz
         UbnTXUXp5f8mYRkgzQuqkSZneQ1hq+qFROZOvJhvJ9IB5+DkThSVTW3/dNZzi87dLEHc
         FWGahgWwPgxefP31Z1zGP/ErtAos0hi1x+sC7uks5SiktxJYvSsTSYaGcMklnWGeIjU3
         GtHi0tlHRx2uXzguxrSxPkMIEH2wJupnPbek2PHpcUk49EDKmsDbdBKryHPL0LZCaRWw
         KmvuAGqeu3ZdepEZ/0VgXUFRvdIOv/LkRnNYbWrzXsGPRGo9+mF6j973uAgigSvQdVMd
         kreg==
X-Forwarded-Encrypted: i=1; AKwUvBxsXsZe8feAvh9mb5/qMH62kSirGi1WhwSVCPSW5bWJ/DcvDyrIcyuX6stSCa1bWSiIGQe7+cRKPFAsDLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bN4h0VdkNjyTRnDZVwpiwNeqgDClaVV7sPxGUQQhwFJSJ0Jha
	FlsS03PbC6SfURStcAX8sUJf+ox43ntk30L0OLRUlPXp2au9CduqxJof
X-Gm-Gg: AYBFou2o99V1Tj67Er1JF8I0O4GrRiPXsd7NPh6rSp0URxhvY3+S1FnrZ66XUTFauKg
	Mmqxm046szJkeDFYzjjQarJ7IS+Z0YJyV8wchpsxQgujmYmmi0stSwhYhyPJH8//EX0f7pETzS2
	oNnNa+yC6mB6mZgmtxcAlsMfeDDf8SjYv6xTGrj1mZZp9U4aj20U86WLiIEhPYiztfSzw/iLMDS
	A3wO7gVFjlAUXI0EZ0nF2n6KnFrpyVgVLFLPdLg9ydB37FXfLosrH0ovE1YnUj9JcvxLnK8Kjvk
	vZZi4lP1wOnQcXWIzKigcWB3n3LCTfJcQ4krmrlg8VzzfTpVh3SnZQ+UTaCN1MAIsGL0FmSFyso
	xef4B3QZjyfoXrfIeQ4hKYHY2DfwDhoqpnIDFDT9SMITPoG9uNGXB3veNLtqYNQDU/kxVU+qUtX
	mVx0Y9mgFJ+jGnKSNHXeU1qPgsOref8XvY2S7HKzF1XnWyA4qSE61zB7tHriYPXVVcv3KIz3btx
	c++9lphW8F6NRedcRjtd7yX4YuTIbnK5z4g8JEZR4CnnOeQTmbSSQrC1CUOEwAzc5kb+4AHE8Xh
	kPEkf7j2iwCYQA3EDm4I5Sa0
X-Received: by 2002:a05:7022:5e09:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b25d36f9dfmr7314191c88.40.1794070639786;
        Sat, 07 Nov 2026 08:57:19 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:19 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:01 -0500
Subject: [PATCH v3 2/4] docs/mm: ksm: describe how smart scan picks the
 scans to skip
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-2-16d5ce8b5fd6@gmail.com>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Documentation/mm/ksm.rst covers the stable tree and its reverse mapping,
and Documentation/admin-guide/mm/ksm.rst only says that smart scan skips
pages KSM has failed to merge before.

Neither says how often an unmerged page is looked at, or that the scans
are picked by the global scan number so that identical pages of
different ages still meet in some scan, which merging through the
unstable tree depends on.

Add a section on smart scan that describes both.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 Documentation/mm/ksm.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
index 5a80573162def..f954d221e8017 100644
--- a/Documentation/mm/ksm.rst
+++ b/Documentation/mm/ksm.rst
@@ -75,6 +75,22 @@ The whole list of stable_node "dups" linked in the stable_node
 The frequency of such scans is defined by
 ``stable_node_chains_prune_millisecs`` sysfs tunable.
 
+Smart scan
+----------
+With ``smart_scan`` enabled, ksmd skips pages that it has already tried
+to merge without success. The ``age`` of a page's ksm_rmap_item counts
+the scans that went by while the page stayed unmerged. A page younger
+than three scans is looked at on every scan; after that it is looked at
+every second scan up to an age of five, every fourth scan up to an age
+of eight, and every eighth scan from then on.
+
+The scans that look at a page are picked by the global scan number
+``ksm_scan.seqnr``, not counted per page. The unstable tree is rebuilt
+on every scan, so two identical pages can only be merged in a scan that
+looks at both. As the periods are powers of two, every page is looked
+at on each scan whose number is a multiple of eight, so two identical
+pages meet at least every eighth scan whatever their ages.
+
 Reference
 ---------
 .. kernel-doc:: mm/ksm.c

-- 
2.43.0

