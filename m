Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9C37266D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790826188; cv=none; b=cvFoMhSXsfZ2wozuvjDUJlKpeF8snxHrFGoUb28ON9juXH/QM6TjC9ox8rCIrqmbpm144hRty2tIKkA0+o5e+WdacIbOerRTEtldGuP2vxeQJyC6XWz2uvm7A/KCEPiMfp8RwS6KnAe11rHqTykZ6jhCetXTGH4Dsh/5zmEEh/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790826188; c=relaxed/simple;
	bh=VjBB9Mjx5oASQrE4i18iblY/H4Bq8gvu//nBNAURB/U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=maLWiOzUdDSkcZpJ1ZduRFh2FZ9blZYuNJ06MVhPkEAMHGB36r7C0BUNkUljQQ694xMVeJUcVBiC1Hy09y85zn0jLxZLE3qTxfeNkgSzi48/N20nOfNZtCBDn7VvdVWVwFR8p1Tig+rOhUex5C181fyk/gGHr911TfxNyilzPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7nPTnuA; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7nPTnuA"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7bf43e81472so334410137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790826186; x=1791430986; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eCXWgSE03YdzbfSNuHGoYBX8R7odGbVzeGgJ8BFkzYY=;
        b=S7nPTnuAPIvdo5XfMkbbflnmBeZ7I7AcLpN+/M1kCRXAl9nAkDzuWELHBjWEmvjOWy
         adJBp8c4NkY8gV1haUUpo0ARrjEP7wQmG7GRo/UxHtyOlTtxAJnsSkMhttYnypxoYhcO
         h0tXKqU33xFwb8driBxG4zZSmRFB64gsvChczN4HihFdcrwRIWrlwkjxkS3DIczgYqUb
         MeywijJ7XBH3ZUE/EOzyseSosOTfz8sfdsyhgnWtkmxht4m4nGp1bg64YltHN9J44pUJ
         dA5rK5QF+PNsMqbvQZYQdJe7xnd7GyaT+1sxc7YOV1Ak/khyY9F1gVbveYduQfsGpj78
         A5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790826186; x=1791430986;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eCXWgSE03YdzbfSNuHGoYBX8R7odGbVzeGgJ8BFkzYY=;
        b=dzgcxtscEcSHTcfit5uBBnMVeh3jGz4Gji6Xk2vj6oigSPa8IoNfn+wTGgL7d+T5Ru
         4k+iGYYAtc68NVDlO3Eo7YV1TuBwLP4eymehH535HPn2bkFXHLYQ12Pz54nFNptzBI5I
         rEUjlBqXDdi0l9p3dIszd537ap32D86nD2V6K5DqTj71zmev0WNF5mHR92hb+OzKz9VR
         EKIJCotYYNSeUH9uEHbQjhvUQuRGrUFihyitk/g+C9SxGWLfoaPRlJ5c5aulO0/LvuyI
         JlgQLuBCcj300XjtYiy60VjWVKAEp6e5I4Z3vPk+rB6oP4WKwPdwczRgAaaQDgyUsGRY
         XyKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtPhOhY7QH9l5xy63mHZCTZvTpl84euA++fAEFlyifQjkW/C9CRIbf6nOwGdkMyK6f5fSnwVqF+rD+IUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmWAiKqOmwLmZ7exeUgvfIlEEYfsucDfZCCXAFDwD3qZkuqC11
	WTtdoOAu2fy/sDSaiAKNi2KFOi6K9VeWVsp5jvzttS++bnE1m6I9gpOg
X-Gm-Gg: AYBFou2NvpwKqulZjNpKLLNQeOvHoWkZQE0/CGrSRlUDZfYxV/BFAv6wM6rmk5GKp4H
	MoC0O6taX5OGmIXy7p8WUoit5RXy0szq67I1spl0/B5cqxCu+bU4rGBOf7EfsfizzZcC5qV53I3
	VaWiLcHb2xjcoiL2XEbdA3xz2ttY/q+L74UPYgyow88RikUOvAsKW22L/K+6ew4Kg8OBcv3odWL
	UK6zKDTP6zwfPWGQowljC8sC/8NwRfPxBXu+TLa3KCKbI/xNxXuHqY8jLcCyTW2IamkKZpgkK2c
	nTQdODwk/IT0ccjrxIhgikbRTspvDljW7ofsDE9ul7qbt+K6I5cJIjIbrfaUCfkMbSDxcFCtgXp
	4mZ1rTDnzXkHZGA0sJ5Y2I86eXasWxUuEo/NWu/aLvpH/5+ukhR+fa5waUuFtdL4GbSqM4u/+w8
	5r692QPGHaW8LxgOz5IHnwyT1e53XrqEOSjt+5HyKAtyNVoHBsvkXx/544xYmTeHRUvN+rzJifr
	qQk
X-Received: by 2002:a05:6102:580c:b0:7b3:5cb7:49 with SMTP id ada2fe7eead31-7be7399744amr773648137.31.1790826185756;
        Wed, 30 Sep 2026 20:43:05 -0700 (PDT)
Received: from [127.0.1.1] ([201.162.73.164])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d7fa499396sm1789926e0c.3.2026.09.30.20.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:43:05 -0700 (PDT)
From: Luis Vieira <luisflavieira@gmail.com>
Subject: [PATCH bpf-next v2 0/2] libbpf: Fix struct and union zero
 detection in BTF dumper
Date: Thu, 01 Oct 2026 00:42:57 -0300
Message-Id: <20261001-libbpf-btf-enodata-fix-v2-0-89f6e8a0240e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMHWvWoC/4WOwQ6CMBBEf4Xs2RqoUKon/8NwaMsCa7AlbSUYw
 r9b8AM8zs682VkhoCcMcMtW8DhTIGeT4KcMzKBsj4zapIHnXORXLtlIWk8d07FjaF2romIdLUw
 ZcZGFKCulJSR48pjOR/EDdsDiEqH5OeGtn2ji3rtnBwrR+c+xYS4O4t+7uWAFq0SrsDRK17W89
 y9F49m4FzTbtn0BoWcsP9gAAAA=
X-Change-ID: 20260928-libbpf-btf-enodata-fix-ac6381645ab8
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Luis Vieira <luisflavieira@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790826180; l=843;
 i=luisflavieira@gmail.com; s=20260913; h=from:subject:message-id;
 bh=VjBB9Mjx5oASQrE4i18iblY/H4Bq8gvu//nBNAURB/U=;
 b=wJyYtsGm47gmywKsylMC/emTWOxxtBrUY/p8L/0tRMGmrKJSTDmk1cXUXUsAZ2l7fqu0Y9fyn
 Qsxq0S3LkIxCSMBj0rYdlHtBV83VuhiBIjUGPnrkREv54fjCWnMvua5
X-Developer-Key: i=luisflavieira@gmail.com; a=ed25519;
 pk=98MeC/NdrC6ah7zYpPnkWiQIoyj62iUP/rNuV3esCW4=

Fix struct and union zero detection in the BTF dumper and add the
regression coverage in a separate selftest patch.

Changes in v2:
- Split the regression selftest into a separate patch, as requested by
  Andrii Nakryiko.
- Link to v1:
  https://patch.msgid.link/20260928-libbpf-btf-enodata-fix-v1-1-56dae4cab778@gmail.com

---
Luis Vieira (2):
      libbpf: Fix struct and union zero detection in BTF dumper
      selftests/bpf: Add regression test for BTF dump zero detection

 tools/lib/bpf/btf_dump.c                          | 2 +-
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: 6a75c73eebd4d497ded7d08b47894f9ddbebb5a9
change-id: 20260928-libbpf-btf-enodata-fix-ac6381645ab8

Best regards,
--  
Luis Vieira <luisflavieira@gmail.com>

