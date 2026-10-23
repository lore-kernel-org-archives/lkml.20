Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760706;
	b=rZ/Lfj5A2uTP+RPuZ0iuGSNp9pEOQJKxTQ+xpl7zJiB7uALprkOZ/uUyaMxqTM20LkFX
	 GUaIe0ylL/NoBUYeqjJ1s+T5vwQRlDsz6RO0tIC7VKn2Uvrt4phA6GvkZw5XMKkb8H6Db
	 XL2p4Q1Kf0Q1cpOu07w7Ag1hhBpBeAG2MJEHGPiMKf5/ZT6ra8To7ijXmmZMYtS6zHIy8
	 Bhd1CB6azyv+rSOMnGbBvymSrNVIxEQgdOWTlukmT8K++ktdqvlZxYpqBu9P1klVk/rRp
	 pctkZ9Ayo7kmWy63miC4vxnOTu1lbw+43wOOlQSDYBfoTBJKxy6jqFyv0M5wE8fIuKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HHctjoTOvtuOQ24Ou0BbRU1HbUb1u2shm1c/Rj8y8vg=;
	b=mhI1Smx9Y+vl3k1a54Jqx3D3X6MkkWMW3e1h5ZF7f+ZQYqED/QUWkOaVkRLe7cX13Qc8
	 vEKt4dr1f5XdJQTgq/KpdcTScCO/V+gMvRBweHkfU46sF6MlL8ffNX8yuTfpy6T31c8hy
	 ao3FNLFV3Ymp3HeSpzwvJtgBG/kq+uzC9tLfdm9U2L4+fMgQ82Hp23X+y6lqkiUNItOsW
	 0m2ZOmyWE9dKpc79DZiaNNu5ivf1xDJZShWmdA0ua5Zyj0UX5f9AWOWn/zdNX75PbCq3t
	 ay67mtn8ZNFTafQeKUs69EOD5g1bC8LXl6EcSdWgSPMjEfFv4SlhVdIYZjCqDuGR1bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YR8vZHAz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299A606A337
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B299A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YR8vZHAz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c5b7d5865so166274f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760704; x=1793365504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHctjoTOvtuOQ24Ou0BbRU1HbUb1u2shm1c/Rj8y8vg=;
        b=YR8vZHAzHjlnrld10IBkG1iGFl4E5kW1iSewGUVVMAFCK/Hnn20YfyvKeyb/GGupNG
         EhzQQfmhHrTs9e6PImHV0ZgS2mOpyQfIFmeFkIZ8XRhRM8z+bac8RNnhD4Am36n1yl54
         GQbjaHfcrB/Dm4mEzndd0eAJXihiOKpM+d+r1JhQd5Cim8XHP1/fh529uK7bIahyNIN6
         8qczkNJi7HBuwbeNZJ6IY+WUkOU+MLcuq6860eLUqIzn7enBQFjk4K7izdhP2OlTJR54
         1GtSITZM2CLkdCYYFxW/atfd8NKOJQNRLnhxd+ModVGgI+ar2yoOg/sSah0YucE7IsNg
         qKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760704; x=1793365504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHctjoTOvtuOQ24Ou0BbRU1HbUb1u2shm1c/Rj8y8vg=;
        b=1xE//733hvi0TovncVRa8SSo6s9buHwuSI/zQreFtxoBNnfbSixAkcVhE5C74gCitE
         CEhxhLxBwtgsF++GNEvUgI8JDUc1eWafcObCItcLrAPzl7jeVjCOd9Sm8cP2yIuErFMg
         C/JRJxtUtOeR7ZKOxzGsUG8Hd7jT6O1iXsZpStpU7Dwh/GUviNEDN3Asscie2FXHRRBh
         5oXnUo1hALTeZo4CqijKXZ6rTvWRtw1ughLNIe468Szm6rNpIYW99d1jfZqQ77zDQ3Dx
         x+8Ssz/gituHFNXVO7+zcg3PPYCUstUU6b/ostBm7VXc8xJayEMJhNVXS9WKAiaQvxdi
         ekww==
X-Forwarded-Encrypted: i=1; AKwUvBw5qmVQur+GK6riZmm1Kbzq0QXkUPhFBv5RCHvcShcmOWLRaI+p89d1QRro56uo6P91r+4fMDpMzJkOWGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLAPLsMYwSRjI7dTwbbDAx/Jj3sDcksW3LWRtj5qigUDEwhNGL
	XhkZcrZPCrJztGG4QE4aHR5PalDUjRS8LmhmgHBqtKLUKELPpxey1inLeF+j53ZBgREsig==
X-Gm-Gg: AYBFou2g+47GXUYYRTkmUAF53Id7DGib930++4BX+XTQ69knmJY0GSZFc1R+/zzXy0h
	zJ/Ez8C79m4gWp/cQ3P00qtVKrpboNULDTpm7rBD68S9AIxull5qME7zLXnx0pjllXFLMVKx+d5
	fMVci22bpLKJ+DwswIiMnvZA3yCzR7UYTY8lz3CLd9SnRdOt/lEGgi2E7w5RuHzLRkPDBxGcUHM
	VeuLr8vVa15k1EZhydh+iHyrwtDmctriTJJbWiRSUvLVtPIS7z4ZcqO3vL0N3p2xKVL+j+v/SyN
	epJDmvoCvL5XBG+/LVW9xszDvjIWTwpizWpZn4DsBp2gUeu3HlDnAptVc5cqSEyEncksDM5eYU9
	0+DchB0D4wlvidJ7RzzffW53EePOsOKhZJzCcaaae7OxIskqxeaVLazBa7Usm0yPgMQJKpuUs1D
	JccypAZ5gFqVzwmvyxgKSrbV8b4kbsIq4yTSvzq13LAk4g/P/I+Adpwu7u0IrU4PSWSt1YfJizW
	5dkjjE5QJKnUc+OXzrdEFWFdEQ9oXvwOXTVYJ04b4feZot2QRvElidlA/vZr714RCZMVgkS4Z1v
	dFk=
X-Received: by 2002:a5d:5f43:0:b0:48a:f41d:83c with SMTP id ffacd0b85a97d-48e384dc66emr4505487f8f.0.1792760703916;
        Fri, 23 Oct 2026 06:05:03 -0700 (PDT)
Received: from Nuel20.localdomain ([105.112.97.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38061c7dsm4658755f8f.54.2026.10.23.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:05:03 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH v2 0/2] docs: kdoc: convert tracepoint parsing to CMatch
Date: Fri, 23 Oct 2026 14:04:13 +0100
Message-ID: <20261023130444.26270-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016231148.7b5a88ef@foz.lan>
References: <20261016231148.7b5a88ef@foz.lan>
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

Mauro suggested handling tracepoint and syscall declarations with pure
CMatch transformations, and keeping any nested-comma tokenizer correction
in a separate patch. This series follows that split.

Patch 1 fixes CMatch argument grouping so delimiters inside nested
expressions do not split the outer macro arguments. Patch 2 replaces the
procedural syscall and tracepoint munging with CMatch transformations,
including support for the TRACE_EVENT_FN() family, and adds parser tests.


Omokefe Emmanuel Onanaroghene (2):
  docs: kdoc: handle nested commas in CMatch arguments
  docs: kdoc: handle TRACE_EVENT_FN() with CMatch

 tools/lib/python/kdoc/c_lex.py        | 22 ++++++-
 tools/lib/python/kdoc/kdoc_parser.py  | 94 ++-------------------------
 tools/lib/python/kdoc/xforms_lists.py | 39 +++++++++++
 tools/unittests/test_cmatch.py        |  7 ++
 tools/unittests/test_kdoc_parser.py   | 56 ++++++++++++++++
 5 files changed, 129 insertions(+), 89 deletions(-)


base-commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26
-- 
2.43.0

