Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529157;
	b=2KYklcRQKTBAcZreQnQrs4vyLTJI39Rxw5fHc3+9N02gH/OxbUX2Qluc/bj89qtfg7wA
	 rEOnao20iHIdZQ3co0Ad7O+PAJP21UI4/vrPL38eC+i/zxosGarxXNk6NYoJA3mDOL4Xb
	 SiekP9KVQi++tt7DyyQSZ5aq2K52n8++Z5uPvPNhqB8W7UqZPrR0RSF2RrCyoYj0olUCv
	 P9qpCEuQvUnKkG9y0gDn+fS13qz6nrATYQUGHYMS1JsgT72rPQRqBJBKMuxc02GPI7stu
	 P0MLNRbvbX/J8M4LgzCpgkkUHlLzZoDYGSky1yspuj8LsZgImckaLHQpCV8YyTBO9xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u/zxI4CzMoBvyHkNRptWT2GXXsMEz4m1n2MgjkQARrA=;
	b=PA2xvbmArNkBOHKW672zjmxkebRPoPoG5rNdSuKmIlnhP3fCffo43au1o/qC8lZj6RqM
	 DnBZfbHi0pdj2hciCY18oGeh/QMZRGlNGKOOw1ppCymdhuF/TBNXXxLBsKp963cEoHNbx
	 9m7b62jHLaw7yoTmxTfnZkJ4QVa/sZRQsnItwpbxq4pbxnGLvGs2Jj0wtWbQa04zi5Hwb
	 yQQnQkzQb+SHnDCsdQCKAkvarTvUv01MVffgFsMAlGNkTNF2pm/BCXaEniLeBvtefRIk1
	 taKgoBTCHR3bjzDlth9UOhwrcjuGxZ0okMO/k5N83gknUxYzz4Y2QDjSfKMyv39OzYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udrTcaAh;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A1606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867A1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udrTcaAh
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so737903eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793529155; x=1794133955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u/zxI4CzMoBvyHkNRptWT2GXXsMEz4m1n2MgjkQARrA=;
        b=udrTcaAhR6lTPvX6nytrMjhk3DuWqeWdJyxirvGnilvZJ6Po7seTbDjGHZSb+tTGV8
         lRA7hBsky7Yi4F8BdF8VSbpuo4XOFddA0ePcJc5p7crrbKkktIXPbo10Wbt5Qh8a1AOG
         IlvkjfxsaiwF7JjASnxoQhxDgLJkF1Mu8jiSrY8bz2wGuMkEyVSG/tIlfSl7ubyxpheI
         e91DXqljQQIbTTHvzuszzdztRClpLuqpZ7/vgZC/YsGXHjYZxQrt9cGJVASw8b3vFx7D
         XIEUDOi0sUhTkxObCds0b33AIPGsRsYCUM+NMPIs3GajcyhcnUMCsagg8FLLoJ3LkJjY
         rVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793529155; x=1794133955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/zxI4CzMoBvyHkNRptWT2GXXsMEz4m1n2MgjkQARrA=;
        b=nA7QZjrNKK4/yEg3E0tx0cRs3NOENKgqvOEiz4sj6xIMqmCNm7jYmneNSXgOoRY6ot
         JJnagsbQcUXSX9DLDYMzfAeL/HfYUuijMSFWM3pcI/Vj+i/Hth5T1hE4jdz6hx9mHZ+5
         pJ214L2ZvaJFwUacJuYa1JvUaXLjUK/LTW56CqQncYFjml6BxdDfOAHW/TgrAmKQ1DuO
         PwwO6XNWB04VlqseH7AUfB6L8AqFcFV+EXG/kTF7JwSEvAloIguo347wLp//7nhw8Gzp
         mnmPEweKz2ZXEPTBkX7IxyPgqJ9gQMByHm1iP/ipFSI5LCUSZwlHvHG4+jnp/tyYwyf3
         EVMg==
X-Forwarded-Encrypted: i=1; AKwUvByURhRfL1KN5J8LOfOILeHHr770/j56T+/91iR9pkW5WznQFIa+B7HeEL2R8rRslqhQL7ViMjcNR7AcEZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uFgsC1OBhgXCaGX6/RDLf6juzwwQGAnNy8I6Up5S9PmNSe5Wt
	928DGSvg2kRl87sNKJhMW7vTsIJWXoRYlAcK8+6nFRGUkbcN6KdkydCd
X-Gm-Gg: AYBFou1q3ecArAdGT0YSitwPVgLewl79oXPS4KDc8p7mT79aIxRZbHvopRxMbpxb+o4
	qjEIRGzLMIfAqvjVS8YIqjMd8Sn4gbpeAcqV5QBCverA2F1rdSAyVM+9v08y4aRhRsCDasjgeTo
	VK3g5bC33jwTYFaJpfBle6IJ93pfQRRrhOYrInuJvFgjLwuVpvSiV+xZYn741LIcrmp4fuLSSV1
	Zk+3i3InLx18DuLV0dmynqlBWAk0ncEs/n0hJGQWg5FW26Kc8e/RzlFdiNDdBn6WIYtW5xxTNiC
	yb5n9kKfeAEgjZZlk7plPZXIeIH9nhmmUNq0X3MW88Zergtc9mtmMrks6pbQjA4dZRQryHWsbEx
	Hua071mkkl286G4S3gGILQQFVfu/7pypVy30981LO7JuOXCqDz0c5JrDAeNzH3i64Nody3tHUhN
	BsE3vJRXVRRrNa4o0oCBRvUNjmtbHsMItyo9YT0W9vIiwmwSNzHkqbJ09448eYXuiSF1MV+Ja7U
	vhFl8Wby00gEtuM03a5zA+6dDO813cJrOCJsmBwhytn9nhO79rpbBf89JFUep+SYex8Nj1CO8ny
	ZMMXLPSoCjmTJnxgl8v+iRL7c3Fh90gwOAktEQ87oPlQRsZCgvyUbTx/
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id 5a478bee46e88-36a423f54a1mr10402589eec.19.1793529155071;
        Sun, 01 Nov 2026 02:32:35 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm25242506eec.6.2026.11.01.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:32:34 -0800 (PST)
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
Subject: [PATCH bpf-next v3 0/3] Normalize enum values in libbpf and bpftool
Date: Sun,  1 Nov 2026 10:32:18 +0000
Message-ID: <20261101103221.51534-1-dennylin0707@gmail.com>
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

This series fixes enum signedness problems in libbpf and bpftool data
dumps using the shared btf_enum_value() helper suggested by Alexei.
It also uses the helper when parsing enum-backed map fields, where sign
extension can change the requested map_extra value.

Keep existing enum name matches before considering normalized values.
This matters for eight-byte BTF_KIND_ENUM values in both dumpers and
narrow negative enums in bpftool. libbpf already zero-extends narrow
data without kflag; that behavior is unchanged. bpftool preserves the
original name's priority in one scan, even if another enumerator matches
the normalized value.

For an eight-byte ordinary enum with kflag clear, a stored negative
enumerator can match both its sign- and zero-extended values. This is
a compatibility choice: identical metadata can describe either a legacy
signed enum or an unsigned enum.

Unknown bpftool values follow kflag. With kflag clear, numeric output is
unsigned, including BTF sanitized by libbpf for kernels without enum64
support. This changes unknown negative values whose original signedness
is no longer recorded. libbpf's numeric fallback is unchanged.

CO-RE is left unchanged. Clang 14 and 18 emit a zero-extended immediate
for 0x80000000U, which the current sign-extended orig_val rejects. But
using the helper directly would reject negative enum immediates from
Clang 14 objects without kflag, and would zero-extend negative values
from target BTF without kflag. Those compatibility issues need a
separate change.

This supersedes the pending libbpf patch [1] and bpftool data-dump v2 [2],
as requested in [3]. The already applied bpftool type-JSON fix,
eaae576c34d7, is in the base and is not resubmitted.

Changes in v3:
- Combine libbpf, bpftool and regression tests into one series.
- Add btf_enum_value() and use it for enum-backed map fields and data
  name matching.
- Preserve existing legacy names, including eight-byte ordinary enums
  and ambiguous narrow names, addressing the review of bpftool v2.
- Add libbpf data-dump tests and kernel-backed bpftool map-dump tests.

Validation on ARM64, GCC 13.3.0, Clang 18.1.3, Linux 6.12.68:
- Complete libbpf and bpftool builds pass, including the libbpf ABI
  checks and bpftool built with -Werror.
- With the new tests on the baseline: 38 subtests pass, 8 fail.
- With the fixes: all 46 subtests pass, none fail or skip.
  These are the btf_dump and bpftool_map_dump test groups. The bpftool
  cases load BTF and maps into the kernel and check both CLI formats.
  Run these groups with ./test_progs -t btf_dump,bpftool_map_dump.
- map_extra parsing was checked with a separate local object-open
  harness; this series does not include a selftest for that path.
  Arena allocation and mmap were not tested.

[1] https://lore.kernel.org/bpf/20261031233219.9362-1-dennylin0707@gmail.com/
[2] https://lore.kernel.org/bpf/20261101001024.9994-1-dennylin0707@gmail.com/
[3] https://lore.kernel.org/bpf/DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com/

Thanks,
Hungyu

Hungyu Lin (3):
  libbpf: Normalize enum values according to signedness
  bpftool: Preserve unsigned enum values in data dumps
  selftests/bpf: Cover enum signedness and legacy name matching

 tools/bpf/bpftool/btf_dumper.c                |  42 ++--
 tools/lib/bpf/btf.h                           |   6 +
 tools/lib/bpf/btf_dump.c                      |   3 +-
 tools/lib/bpf/libbpf.c                        |   2 +-
 .../bpf/prog_tests/bpftool_map_dump.c         | 180 ++++++++++++++++++
 .../selftests/bpf/prog_tests/btf_dump.c       |  84 ++++++++
 6 files changed, 302 insertions(+), 15 deletions(-)


base-commit: a30c772627b2ef4bc715332b1b04938a914556cd
-- 
2.43.0

