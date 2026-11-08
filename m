Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106620;
	b=tgzwJMUFyTNKWUPvuIEKRdn9zo6AJtJYdwWPfxiLacRFCFIQ6OK3Bo7G5nwm+RDzfNGZ
	 nf8DM/W0WquwLEJLiEcMkqUZ+v8X7YL5aI58umW/RdoCp4u5kuSLA7UIrd9Tpgom++hzp
	 TKCznwKagt+B0GAROig6gA6OaV1I9B3ZSry+7SGo1ncpK8rnUjAch+b981qeQPU2K7dgY
	 vQbXYsPx2y/t1p/0v4eiyXRySTDowJWa98bLKbXQeOVcP+kurOGJrl59WmcqjJn9WqKKT
	 um1IqbdJreJxq6HYowuXGtCSFIn4UOvzL9lHwTax5E+dywIAkzcpB1DT0VA/wUvdkUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E04mLJ5cyGn2rFsBTUMJxpaTlzNgjDYYX4TRN56eccw=;
	b=qvTU8H1nLfK1Qri8XscCKvCmnaWy8Fk4A4lqDeAOalYveaR3LpoFJPG1KKsv1mcGyZ0V
	 UA7VuYrYE+WOGymo9TilX2oKPGa1GTyCykLHXrHDoWaMqr3eoGCZAuhEHiMctGlxVZ0PG
	 iGvWL7n/T6E27bMZok6Ek8ui+j0jwhQ2f7Ud1heZJoHMqBuaJdFIo9xtHgEfUbu52ZP3c
	 cITalFtZTd+Z8wQNXLtb7oUbHnWBfLjQ3LchwYGVInqBa/6qwl7egOKkj3VA+UCUGMY0C
	 JalZnQhfapLXyLG9WrO4R4/txk3K4425y4tz4//aw7kQd7SJZVKTmEsjLC1J7kzabng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8e7WddY;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F96606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8e7WddY
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso103641eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106618; x=1794711418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E04mLJ5cyGn2rFsBTUMJxpaTlzNgjDYYX4TRN56eccw=;
        b=Q8e7WddYBnWleL3P47dR3Wp7PPUMMoIn1ju+iqiDFeTnRaX40Njq0tIFZtyVpGGg3Y
         TWs8vMZ1MrtKD+HkSkZM+WWm417y3jImr1XnZd/LxS9i6i1pyBydBLNYZUubGacSRTqI
         oJaA//jEzdTCGzPZRd0mcoQh7AMwaYpyVJ2hdNDvfanp5eAy3A8ObebMD9ELGSFnMYah
         QLjj7MxggM8zyQc+6HvxvlgsMif09/xkJ8lrp9LZfLmc1zd4F1IEyRe4CqZ0iCXpEE9k
         ezBmisvubRRtft+FiMHDQvLORK5f7AMqA4YXx5IC7EHU7B6TvmY6MdObhdyPDppAmeL4
         zx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106618; x=1794711418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E04mLJ5cyGn2rFsBTUMJxpaTlzNgjDYYX4TRN56eccw=;
        b=jOOgxE7H0CQ5iF5gn8zPx0/D36oAUSFDayNznyqmCFRL7x29wnLqGdnq55yGMkFP8s
         eppKMksh6IVIPH8W8sSC1kzhUQejhjC8ZqeltDOPAeOQ7s7+ZkTvT1rjYdni4zLyrgoS
         SQ6hDwx3nosLHzbtbFsoPTfQoNdrjvSgRSEItvoXCxIcVWNqUuVtmyoDx6Yj5KgpD51W
         P0dJ9YbVc5fWotP+BPJ+FgCspeGbgNLFlF3vu1yRJYNd5fQUppVHkxP3qTuaxDSVXWQW
         BnFjJwMqFv6QU4SkSVWOKHIxwXbXAHb9izsU5BDJMzMx8uWdDLFce1nAkYnbV/fQJ8+M
         eCVQ==
X-Forwarded-Encrypted: i=1; AKwUvByMRmqkzz2r+27rcNyZiqP4DrmRRX9KdD4Apvi9AMMPAtWdTa+UnLVGgGZuygHyEQ737PI4Pvk2xx+FpeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i5mvjAyOqD3NOPi50c2xa9TK9BEzTTT9QdB/pOPtRxg4NvH+T
	zbJXJPb5qQrTKwZB/bQ8e5Is1eL4AhpTjtNdXNtxddr+wxV8h3LEBgZq
X-Gm-Gg: AYBFou3mRaWS9hWWTaSzrmLNSLr5OY+e/v/cSJ659E3NTj0R3VncNlo+l3rSNy8vILg
	q1pHOQWi6pGcu7YEUr3Mm3lo02209V0Ftsun49BYUpDJciHFYP1b4iaazNKCMUb0U/voHq5438q
	ObdZoWvkrbYLREZZgC4VxsgX4wx1Ox+ZWtfEYO6ydqcgC5B+ew3bJtU/L6xa8XfKVTP3jM5BKeq
	BCu5mPhyt9LSyrYPFc7nAW3Oa3e1CmZAV/gIY7UlMPP+bnNbn7DVqkuRmzAD+FN+8D9aTM+njKV
	Qgr3d0IOIOTKnHmoWg1Yl5z24EYiSe00Dc3C0E197kS3nubZUNwdo/S4nGmuxglz8KGr86Fhvpp
	AGjz3letAwsMy9GyGcb23EuTUOwCnZs1dIYpNXrC4CQZmkAM1JbZl2B0y56sgfwmGSOPg3TEpEK
	QAi7gD/WIfmW+5BxHXgpq2Cb/uX91OEj0IcFmWtvkr418VznVX8P3YvIVv/4zGfgWjTRNa4uMDC
	/lTdpnTCgr/ZnJTmUx2ksQ1JvP3tOS4fELC4xq7X379NoG8el6cqaH73YKjId4MP3j89ijEvs8j
	wK+eN+YUBq3PkzI5x++yRrNqBXW8FzNnGKNRw7FVY1QmbtnvLGs1u+iS4P0Sbyyx6JORFrrn0yc
	AxbIqa4X1IoBoGZn1gSDJuICusGng8t88yorNgw==
X-Received: by 2002:a05:701b:2812:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b39fe2dd6cmr598906c88.4.1794106618351;
        Sat, 07 Nov 2026 18:56:58 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm2241202c88.23.2026.11.07.18.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:56:57 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: ast@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	qmo@kernel.org,
	daniel@iogearbox.net,
	yonghong.song@linux.dev,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next v5 0/3] Normalize enum values in libbpf and bpftool
Date: Sun,  8 Nov 2026 02:56:29 +0000
Message-ID: <20261108025632.10799-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes enum signedness in libbpf and bpftool data dumps
using the shared btf_enum_value() helper suggested by Alexei. It also
uses the helper for enum-backed map fields, where sign extension can
change the requested map_extra value.

Ordinary enums are interpreted according to kflag. When kflag is
clear, values are treated as unsigned, including BTF from producers
that did not record signedness.

The helper returns __u64, consistent with btf_enum64_value(). bpftool
casts to __s64 at signed numeric output. CO-RE relocation handling is
left for a separate change.

Changes in v5:
- Keep patches 1 and 2 and the map_extra test unchanged.
- Adopt the bpftool and libbpf tests posted by Alexei in the v4 review.

Tested on arm64 (Linux 6.12.68, GCC 13.3, Clang 18.1). libbpf and
bpftool build with -Werror under both compilers. With patch 3 alone,
the new bpftool_map_dump/enum and map_extra/enum32_high subtests and
the expanded enum_data subtest in btf_dump fail. With the full series,
all 25 subtests pass. The 22 unchanged existing subtests pass in both
cases.

v4: https://lore.kernel.org/bpf/20261107020725.36675-1-dennylin0707@gmail.com/
v3: https://lore.kernel.org/bpf/20261101103221.51534-1-dennylin0707@gmail.com/

Thanks,
Hungyu

Hungyu Lin (3):
  libbpf: Normalize enum values according to signedness
  bpftool: Preserve unsigned enum values in data dumps
  selftests/bpf: Cover enum signedness in data dumps and map fields

 tools/bpf/bpftool/btf_dumper.c                | 23 ++++--
 tools/lib/bpf/btf.h                           |  6 ++
 tools/lib/bpf/btf_dump.c                      |  2 +-
 tools/lib/bpf/libbpf.c                        |  2 +-
 .../bpf/prog_tests/bpftool_map_dump.c         | 76 +++++++++++++++++++
 .../selftests/bpf/prog_tests/btf_dump.c       | 20 +++++
 .../selftests/bpf/prog_tests/map_extra.c      | 19 +++++
 .../selftests/bpf/progs/test_map_extra.c      | 12 +++
 8 files changed, 150 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_extra.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_map_extra.c


base-commit: 3e18218484126afb9da722080659c038cb2256ab
-- 
2.43.0

