Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732574;
	b=LNQOKim8jMqi4EVkuef3NIIXWX6bwJaiq2srHY43hbVcPEy1ZKu/l4tk7fBm8Pvuonrp
	 ysyP1oQ3kcrMEzXUnnMkuB+I/qZ+ySsqQZ4bfxOKPKgQbBhQV5dUYUE3xzbR3Pc0IrBqn
	 CMnsqw9ULClvqVdGvztYdym4UpfkgV5/t5qmIlGb5fztde7pO5Ny7oVnUgmqxSqRljDgF
	 gJzjJV2299JFgv5kON/zNoJnlAledCmDL0dlSszTiNWQ363qUY7VpFVGwJCP8HMH+ktzb
	 aWjSBxYerSEmsxLAVJBEMTWPpESI800dUvevtjJ5lra+3j5tAVi0RbnhrNZHfDAyJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5+DlzZ54z+gqYS2j5LWpmlloxzsta3AIypG5vjV0hKY=;
	b=g5CzFYdKghiDqQUucv/OAOH9aAIQf5bKTm7HwD5Ln05xvbrhtuzq4ZsmnugPG8eRnuHj
	 WkbP5uXtjRKxVexdDHGRDjlSR7xpjpUtqg393qka/VAz9fZf2ZudA3ByE9p0v+YJds61x
	 UIF+dI3eun9pu21AKE1O8rBX3bZ0AOh76drndwPCtcsW38tba04dNXKTNzljo39V6oyF2
	 5eKe/PPaTuI5R6bEp9RzQG1z80whoZ190oGCIt7zywqsCFnh+QV9a5Ndy07cOLVC0evAT
	 Z+BrdwRbRz9fndsvu9nSmZNeFbx5J46M+ejUaldX7TU/tEaZeRrWv9/FYHl3l/B4iXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OCuvD+/Z";
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E15606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E15606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OCuvD+/Z
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so750766eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732574; x=1795337374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+DlzZ54z+gqYS2j5LWpmlloxzsta3AIypG5vjV0hKY=;
        b=OCuvD+/ZYUyJBwtcZ9SiBfGB0R3m8CJJ7uqWGLa/nM4vATgtMPx+ctTwj7DOFy/WSy
         xYM9s7AIC71gtafU34SjUfbP42VHORHeDHCgT/rxFrQm27TQZuWF8oxNkE4n70r9XOqO
         LBER5aF0bszPgv3x4eLobOwaI5Zb7garF+Vx6tN4kfj6yIKL7yslnHPCgo99qdkuBz1m
         XGR13Qcev8Cv8rQqXmAIVPC3l0malD4Nrx9xckR6EA4PqvZYdQhzOZg6v0V9CVZ4Uvo8
         APkxqimHzKZCWFVghVvRp9+5q/bcR0GIoqiJ43qR+OogwZmegVnsi2ThhqlNyiLLplL/
         iQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732574; x=1795337374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+DlzZ54z+gqYS2j5LWpmlloxzsta3AIypG5vjV0hKY=;
        b=xXLwL9eiKR3l5Z96St6Xoc7aPvkRoS47N6hnbD2xVgO8AlWSmSlCru1yMzUbMS95so
         ewIDOOvXpB/9HsKPGuf/xSP0X5NB3ZTknFW+vJY2B/cj2FaTWJ0Wqtp+19Zg0OzXmIED
         Y02jmVGdTPvk3XMrz6OedlqlIGsdI7d8St0stqSlFTYi78crlMaPyd2LPF1DFZoE1qgT
         vq2fmXkP2CEwSOq9muju/09nuF4XwM9mGJ6WbnHQTaTy6i+89RJvDxOngT9IiOel/eYX
         Sd8AF7sepoHRumPwGSghkv/CzOUiC7mXkOY9TbN3eX383VH8JN0n7zwkqx9g99KfS5Ke
         xsUQ==
X-Forwarded-Encrypted: i=1; AL+hErEDdYoNjgWXNy7es7FnSgPs5FtUQ9zSmjtIfk+6Y3CqxDxQ7bY4sfgEsnqzZJNLjiyTQaOIfE5oqA2Zwo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yFrUvxyUM+oYfwB4/9PPa/6r2mBZvcoFvNF/Ati4QPI+WRVWb
	jnyka/+LSNXPMsod25QYBd2o2bt7qTzx9lfPO9IZGukho+jVUY+ghXXQ
X-Gm-Gg: AYBFou2QydsaIL600i58B9wzbvqyFBpuVrdIWOMWCWlcnHPvOzh4lSsfbcwAcfmWP/I
	h14nPHlHWHvjd7MEYC/CpqH1CCzzUoI148aWejCtUW2Ja/pF10wwXJNi8Fz4pCWUDYIA1gK/qhz
	D4RVZs5OPF3LGgZs/iKKAM9xW9Bv4CthuEw+Dmkrqpas4pqUnnVUDFPSZJWxrbq8fv7buGSu+DQ
	Lzs5YvKD4MyPtCkFOEyTUDYi9CyWqKoCY4g2Kd3lTMdN41VkZ7uWTcs96YWZWJ3RuJoLfEEAmgZ
	QM6T1pL7gHyJ3LEQY1zOpLj3Y6aGtMUBIJQj+EpET30aScnEAa+3A79ustepKXdDrgCu5UC6c59
	UKoDq0JvUVvqCVpJSixpyTrvxJXhU1SdYXZVJD+hUYLtG7ramFQXk9ki7GGZEk76nZ38LjC8qUi
	ZQmaLezYTAXNuwDEMFl2lkYyXepJRrGdABA0TzFFjemSuYfM9uRISQqIBfEdZCTRzzbW86uJc/1
	w8zgC5aSinrfx8jzth/SXbXccGaw5pRWqRrBmf55qNJ+s90H6tOHFgNUGTmZThQzXtfjSQV6Uf+
	6kWqKr/TUM9vACe/P2mOPWxKhtUse8XJWKC1ivlY8d8uO23Q3L1OrVIejMJOirlJqpr2Yy0DUOr
	9KOGyhtH3dH+ceYjAoviZf93GgYf3UnCnGwiSDA==
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr6019030eec.14.1794732573612;
        Sun, 15 Nov 2026 00:49:33 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm25221051eec.23.2026.11.15.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:33 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v2 0/2] Fix unaligned enum values in btf_dump
Date: Sun, 15 Nov 2026 08:49:21 +0000
Message-ID: <20261115084923.53182-1-dennylin0707@gmail.com>
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size, which shifts a
__u64 by 64. Patch 1 copies unaligned enum data into an aligned buffer
instead, as btf_dump_int_data() does. Patch 2 adds the tests Alexei
posted in the v1 review.

Changes in v2:
- Describe the undefined shift in the commit log.
- Drop the data_end check, which broke the dump of struct fs_context
  without emit_zeroes.
- Add the selftests from the v1 review.

v1: https://lore.kernel.org/bpf/20261113223449.97604-1-dennylin0707@gmail.com/

Hungyu Lin (2):
  libbpf: Fix sign extension of unaligned enums in
    btf_dump_get_enum_value()
  selftests/bpf: Dump unaligned enums and a zeroed fs_context

 tools/lib/bpf/btf_dump.c                          | 13 ++++---------
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 10 deletions(-)


base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.43.0

