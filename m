Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709075;
	b=euIW+YOa47HNilPi9vIQTeKrGk7oAvrZEYMlZU/kX377c8+pkBt6eWSXNC74qkZGEAr+
	 jg5xfuKf+ygaZ6hdvvnacyJsUPslBSEMqtH3RWfiYWxk93ZxAfN8KU4ckZAM4UCUd+xPt
	 pw8U+ylUEpaPWa//WTQcgPNdaSslTxOFOVXD7HIQrlAiShE0LwuGq1lDLlSICl/2Bo+1D
	 y25YNVddHgE1HF4F06pYnEi27PHiBp1B2nUiRG20FtCp3EXXNY31GGYjcj/R2e9Gv6VcR
	 5xaXNUESpvzYxf3qAocAEHE2i82B0LXEEdNi9xPQPEdjO2dWNkk2U/g33TOqAMN1p0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B3OEB06UVVzOvWWD1IBOYqe74IAlLNlNvzCjs2X2cFE=;
	b=AUREiRqvJZUq3dkWSSqjjor+ee8Joqeq53T5pxCPy6vIMKeMa9BmQa3e4jqA1nz42iqE
	 zsEuPhY7lnTfFDXog1gw73L/Qpipdf36FDV0jZB9hm3YYs2m0rKBG4Me7xlTdKx4OnRjo
	 AHb9InyU4u0HhQN/Oy8NmSWYPYXvoCjGB6WEY/n5XSCa2vKduoj9hS182ALob/JAYopYk
	 /2v75SJDQDFFftVgs5R85d+nIrM7Lmw/YWqw4kea2yaA+5/uOm7oBXmQHFxQxPX5yEN4A
	 Ny1Ho6D97VJAv/3wG6Ni8dkMo9OFlasylDKBqSsl0/zN8kYDhRdNyRzfBSypHWfNv7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qY5q0eZS;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50542606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50542606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qY5q0eZS
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5378b281aso1276635ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709075; x=1793313875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3OEB06UVVzOvWWD1IBOYqe74IAlLNlNvzCjs2X2cFE=;
        b=qY5q0eZSZmkZ1MHYRk6v4pq+fQFT+QrkFP/iAVsubrsTz74hiIfQZsLmiDG/Xi5maE
         p+gKWitq1OM9aybevrEPPTpNRm+2Ttce45+vVMksQsAAkHm3UdZC7uf8/+53PpmRYU8j
         mHpV2+RbgHzHTMIcmt5D7XcN9aKJwmU8oxq/R2cfxl6Ujsv6PwZG3OHfd6wan4qDhFA9
         UP9KPsmuqfQ+jL1EmgF/Fp7u1P6QYqDy13eTB6cByNr1PKvtrQIwK/xKDxWe8qZOVovh
         PtOXgeVaLpQpmlg7vlV8YKSF8flw1I9RDEUiDE7UeLNmbxaS3f2k7iLhp00X2Jwdx0yJ
         Qipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709075; x=1793313875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3OEB06UVVzOvWWD1IBOYqe74IAlLNlNvzCjs2X2cFE=;
        b=X/xwErXstXmvkgo3XWPWDVTAsslF8L0iutpXD1JorxYBRHdKkdtQTdABHdkB9kAo+9
         ukSkfmGZsUyZxhJBlXOnIoXdRs3D015gsLkp25LtziSPhkzD3lEiUUrjTT0SlUujrSCW
         XMts2hRaYAX2sHrXODhMrEVsUbuvVpUVEYLMwDNt1tsgamJm/7Q2jIgKzCq0pE5S8FeG
         i1Rzvn6crbKjbI3pmDi/BSVbIM98EbTFx3ec5tTxuUNY50bxKG3SJ/u1QxsnrhjAZL6Q
         fHurX87zel3cixdzu7rFYhz2dOybLN3jJb+iQjL0ySMgSXNVYnn08DsZWxRGJAWwpJQB
         QyZw==
X-Forwarded-Encrypted: i=1; AKwUvBwaCNIPuKGlJX+0Ew1p/eWGxh8PErtTqvPy5UdcoDcoTV8TPjyxs3uZ2B60s6PENDPJNwhgpawojLGsILE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE/AW0ofScqbUnA8XKVQPFCzFT/ULXaR8ahIKCYvBO96ZRBmuB
	vu8E60vKpChqysrZyLQXNXVbLE24PTrS1oDc2d2ctLOOgiHUz3NRdcNZ
X-Gm-Gg: AYBFou1RrQ0oIycUHm6qbHuifurlriRIPq5eVeACHRcohJELsBrXh3JH0iQF99gw0rF
	FERBY/Ji/TSi96YNWmAHbZnOe20iaQZYYT7pmbQJLDNcUyu8rKUX69Z2y1EW1Q3EMain5PdDpwO
	06t1Zs1gHjegz9qSb2DX1HlkCztC34Ue3VGN3drIMw5PxYooiN8cAydb+g0NYCngzs27DqpQOwF
	/M51qc11S/7t2hKa+vIiudh++1OTE1QIX2j/cth0+VltCZ7JUdm64pTtxkssXAwOOaCmRKnrye0
	PjXMZU/t9/G93sWQ7H8cvJ/U5UEMmnhoqPoHJHZx2LFElw/KA22Sal93/e7l2K8Ty4cFfJQWkJS
	9o1EBmzQWWXkCiROFTjQHzWap9LOHINmmgkJpIGasMg2XcDW4/Td+fI22fFxA3O4j7dKCxuL6d4
	lw3C1MUuWS6wshsN7H08ZJByaMOAJ5AWvQYyjM7qr/VcRIrFJtNpZUFJlvKgixKzK3ljkFZlpxF
	rrsb0t07pgdOfJ44sGoHPDlDKBmAe/ZPB0DK+eu7hY/3lX5iOcmnAX9KcGQo4ncNlbcFgFKGBo=
X-Received: by 2002:a17:90b:264e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3adce090fe6mr281032a91.44.1792709074523;
        Thu, 22 Oct 2026 15:44:34 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:34 -0700 (PDT)
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
Subject: [PATCH 0/4] checkpatch: skip more kernel-only checks for userspace code
Date: Thu, 22 Oct 2026 15:44:19 -0700
Message-ID: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

Commit 99b70ece33d8 ("checkpatch: suppress strscpy warnings for
userspace tools") added is_userspace() to skip checks which only make
sense for the kernel. This series extends that to a few more checks
which produce false positives for userspace code under tools/:

 - ENOSYS: the "ENOSYS means invalid syscall nr" rule is about the
   kernel ABI; in userspace, errno == ENOSYS is the standard way to
   detect a missing syscall (e.g. to skip a selftest on older kernels);
 - AVOID_BUG: "Do not crash the kernel" does not apply to userspace,
   where BUG()/BUG_ON() are assert-like shims;
 - SSCANF_TO_KSTRTO: kstrto<type> is not available in userspace.

Running "checkpatch.pl -f" (with --strict for AVOID_BUG, which is
a CHECK in file mode) on the files under tools/ that use ENOSYS, BUG()
or sscanf() gives 699 such warnings before this series (ENOSYS: 188,
AVOID_BUG: 491, SSCANF_TO_KSTRTO: 20), and none after.

Since tools/ also contains some kernel code (test modules, Kbuild-built
mocks, rvgen templates), patch 1 makes is_userspace() return false for
those locations, so they are still subject to all the kernel checks
(this also applies to the existing strcpy/strlcpy/strncpy checks).

Kir Kolyshkin (4):
  checkpatch: is_userspace: exclude kernel code under tools/
  checkpatch: don't warn about ENOSYS in userspace code
  checkpatch: don't warn about BUG() in userspace code
  checkpatch: don't suggest kstrto<type> in userspace code

 scripts/checkpatch.pl | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)


base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.56.0

