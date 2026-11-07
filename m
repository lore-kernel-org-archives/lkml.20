Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017255;
	b=Q9n2+ExZeji12gWhzabcde0X245djft+AlFdiCWRgXl38KMoMKLVAW554iwNXueotFJu
	 2E1b2u9eQ0fk6EMBtLOL3H/carCDWNPpxe98oJBC7sFQqw95PAk/T6pniN7Jlc4oxsGIE
	 w+pMIl4cQXcrZJcPaAQc1y14kO9YN+YLE9EdMKIzaYgOCNNh++jM7aph1+WaK+pMydnx5
	 p9SldGgZlHSm6afpezNWMXEWFqP/vsNXlhpl2KHl2X/4VMu/aqStz2N+T/wsNidoUiwEm
	 t6k3AfoGsa5ivrcqNEUUxX/4mBlIHzTzltv2Faa2kFJ7WL9pdiDrynvZQG+oWMSrQIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uXAs2PZ59auU0l17XbEdgEnM2qhJhw52BVoeNXNAnlg=;
	b=OEW909TwS/Wdevg+JnhqNjtaJ1XS6r2zCjEz3M0wSJomLk6UfYU+SXj4qH6L3BZ8TjUo
	 PQASqI4plsDkQMzxRGDth7jPr5g0eOkXXe56aTvWZpagdZzQIS+Y9AbNxYAIqHXCi0e1k
	 GajY9Fgu4FMCYMErjisynPbuV+UaY3PTynYapp0x98eOawkRiGeCsWyuWFzg4z2QUBD3q
	 LpDBE28psfQeSe1FCwTdUHyE5GTBe7VxSoIplyitekVNRtOrjfaHLMu76UcLY2+Q8XB9G
	 GM7OtBggliXqgy1g3opO0EK5gn1R2ZYTTQ8usLXtbwLSYRP/rjP4qQ9VSGUgaR5rdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hI74JhRc;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F5606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E47F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hI74JhRc
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so561363eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017254; x=1794622054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXAs2PZ59auU0l17XbEdgEnM2qhJhw52BVoeNXNAnlg=;
        b=hI74JhRc+ABeO4innCbd2/hKTAiebOQOin2Ez2KNKhPdZau1OzVsRRAgtseleZMrXn
         uL/5ddFLJ7aJ6jPw54WWnXHNI74Ke3L5BoR98U9XWu7CVCiXyWyJ5cVKGcKqWGC353ek
         kO1kJWzHeLQjJzUOY4zQ0PmQe6iNQBvENYmsU2lEG2X+FAf10mhQ7k29DkIt5uu7o0L1
         /SAtErRezrrwUA1t1P4Dj51YTuwNs2CWY4CW2Wxyp03H2vz4IcsJZaHikRQFiOYaGn3x
         1T5pawToanmyl53/fh0H/MHDXAAKff9GTHvZD1YEFz8aIIbYTxQ/vhHkpeqcA1fdO3aB
         37IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017254; x=1794622054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXAs2PZ59auU0l17XbEdgEnM2qhJhw52BVoeNXNAnlg=;
        b=H8Ls1aKQOiJAGoV4/NhIAiFgUbc9qoyBL5sNqjqSQ6j3x6z9afOMBNrSvKq8Kubf0y
         Dc1/zZrgHZxTYKIRhjanp9TgGTteNJZ99pjv6l/p5fBSW9We7dfoUtGheZPFD0/YqFBi
         LuMS7fUh9fypbHTQSv6rADz6eikpwAYJMdGwk/s6rvqVDsr4SR8qzW0A4J7nTwts9nrj
         se519wkVvyyOU15or7JThHJ2o3300dGM8LDr9baoCY4czSwkQ6ypiY1FBiQqp0VZSR61
         eyu++Ikq/AKI4juPOmrGLinOOJO6ayKf4mT5ILqTq4HEJR0UWKz97YkD/lILA/fsHgE5
         pJpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSqUSA9YlSSGCcsvzrOV4Bdsnkl9pTQmZfq7GUgldIHrCsvGGKqjCVNSNOpItsXS1k5FB1e5RkgL1ZQM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nps6ItjT9zsf8qpr2pwSf4wpchEey/46L667aNOGDPLYobc3b
	25gwQzi0MN/vhbl8Q/7uZfXSdihBr3yge6XG7kD8rIKT22e2CnONJw3j
X-Gm-Gg: AYBFou1qXDI3Nzs9fqW8JYGwuxDflEzN/J4+UO4cNHkcgH0AFUVau4hnwuzXdkE68y6
	eopIo/TwzcuuaFDS/RYPzpZJBeW6l3u3XGMFseajJ7aIA4ClxxToDmhiuqbdCHAhBVHMIgR9ipi
	1INQqyhYhxBAGLfa6kgo2l5/FW6OgLdwLV+wi95b+HXy1p4jEqpyE0Whi3ZdFlmVR0HGEIIMFbE
	KW7kgs8VuDBtJnEfNAyR/UvigIeFdGzRcKqZ/ACsViMmThEbJlh4cu4oyPg1DNjkF/IyY7pzhrR
	4I4jBKM80Ycgjx7AS+dd0cDClxhpVbbeAxFtkAXhF4EcDbp6k0varhTAAy0hmfb6OrbRjiNfS6A
	gifSBKShWa/tnoKEXDHIdJfQoPpZKgNnfb4gOAfC2DUgEF1RGtfQ070kKKmYiTHvur8khXSJFj7
	a28S+JZpVLFpYNkohJ01niP2o23e9laHP2IPyTzWlMhk1t9PTj9YV5CqKoxQmeFVi7snpR9ZwVm
	9vRFrey/TC2DVqtd1xMgdB1daCQvyQikEBqpPJc20/yR6TFE93RB8S4cUgvIQAXRFlNfKjjClsC
	YnxTmtrsnUvgms21bHK8cKvh3+gWhUjWQnA4M3UJH131asPhENZnZaS5t3TpbLc31ymLFO/Zkhq
	mnWBqOQtgVTxyn4D4bArByKOn2vD7XP3FsqLw3w==
X-Received: by 2002:a05:701b:2506:b0:1a7:d426:6dd2 with SMTP id a92af1059eb24-1b25d322b55mr4739572c88.26.1794017253925;
        Fri, 06 Nov 2026 18:07:33 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm9338497c88.7.2026.11.06.18.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:07:33 -0800 (PST)
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
Subject: [PATCH bpf-next v4 0/3] Normalize enum values in libbpf and bpftool
Date: Sat,  7 Nov 2026 02:07:22 +0000
Message-ID: <20261107020725.36675-1-dennylin0707@gmail.com>
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

Changes in v4:
- Return __u64 from btf_enum_value(), as requested by Andrii.
- Rely on kflag for name matching; remove legacy comparisons and
  bpftool's cached match and priority logic, as requested by Andrii.
- Remove the legacy and ambiguous narrow-alias test cases. Keep signed
  controls, unsigned names, numeric output and width-boundary coverage.
- Add an open-only skeleton test for the map_extra parser.
- Drop four libbpf numeric-fallback cases that do not exercise this change.
- Rebase onto bpf-next commit 3e1821848412.

Tested on arm64 (Linux 6.12.68, GCC 13.3, Clang 18.1). libbpf and
bpftool build with -Werror. Without patches 1 and 2, 9 of the 18 new
subtests in btf_dump, bpftool_map_dump and map_extra fail. With the
series, all 18 pass; the 23 existing subtests pass in both cases.

v3: https://lore.kernel.org/bpf/20261101103221.51534-1-dennylin0707@gmail.com/

Thanks,
Hungyu

Hungyu Lin (3):
  libbpf: Normalize enum values according to signedness
  bpftool: Preserve unsigned enum values in data dumps
  selftests/bpf: Cover enum signedness in data dumps and map fields

 tools/bpf/bpftool/btf_dumper.c                |  23 ++-
 tools/lib/bpf/btf.h                           |   6 +
 tools/lib/bpf/btf_dump.c                      |   2 +-
 tools/lib/bpf/libbpf.c                        |   2 +-
 .../bpf/prog_tests/bpftool_map_dump.c         | 162 ++++++++++++++++++
 .../selftests/bpf/prog_tests/btf_dump.c       |  77 +++++++++
 .../selftests/bpf/prog_tests/map_extra.c      |  19 ++
 .../selftests/bpf/progs/test_map_extra.c      |  12 ++
 8 files changed, 293 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_extra.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_map_extra.c


base-commit: 3e18218484126afb9da722080659c038cb2256ab
-- 
2.43.0

