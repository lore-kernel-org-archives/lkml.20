Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816134;
	b=ex2/0tLe4XZ9r3EkfUhXwfeRPSMxp+N+njQG8Kh5F/09UJ0yrjRnHdu/PH5KcYAr8WuS
	 vrv2qUDw3Vw6hpW2SZHeaH3ix6U9c851yC1YwYj8V3oXaqenaFVxM25UXRuWZrJQr7XWA
	 1Eh4dN09+Cg1yQzYIY5ZvWEKmmr5XVu+LXK4Jv3EVo4GOfcFEepJpYUH9hmt562luI/ba
	 rCq+xCpIrKJqA/fdLQ3v3KPO/UB0E8uKXnFbEngscSTqxDwcAzm/KOYWGcds44m4fyXBy
	 ZaWjwani26y6gBC0CVRm3vFs+QCO50zoks40qtaZVrH4LagOxt3+roUKrv2FilcJvuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xjTLfRW1vmU3uyxwz3ZMVejkouImicH1fiPgUPprDmg=;
	b=sF47d9ZsD893GVu/OvqabrM2yuNOOZU4+FT4ZrVfyfyK3vXfC36bZd0Ir+G3cowJUsfD
	 6bhNf7cKB6hUFPLOVlSIvrSHSUVKafJLbhO8jNBUWndgSsz4xsFQRCJLU06YzKzsNQchY
	 iUVBtyzFq7HOVQRMh82z2hjX10ocuJIBbQcQw/4bU0JZQsU6Wr6DVNc57vwOUUTSD6qsN
	 6oCXeKjwjxRQHxI34qztJV/dmkKEjaUA+1tbUT3xHfbm5JEt8GY2TjYKawy1efBVPWKxA
	 I1wYBmQjTmgY6McxrnH7e8mbtZyoEeAhJgrJOV5FHA5oe9A9tt0rNBb/3xN5f39xovg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVXbaDc8;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E534C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E534C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVXbaDc8
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-36a315ed211so2998848eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816133; x=1795420933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjTLfRW1vmU3uyxwz3ZMVejkouImicH1fiPgUPprDmg=;
        b=DVXbaDc8XBP/JgibrQeahOuWJ8zcSrAJjHgtZ1awZIzX79BBEb56eWf6mfho34oEMl
         qfQcTFJn6Pr7LC7Ge8I23zvvcHG7ZYHrl5cVlxv/mAbmXw+ikXIB4SE+p/u9llI+TOPr
         b+/T9CRlHS3xYKHH/1nHYz5Exak+fijotsQWMOnKlbIGf9X2ZcAO8GWG52qf/nz5CRyQ
         Dn2hkK1T1bmuU8BT30nXSQXDzrLs/IpnHOvjQwjKunin8sosiWeeqe7GH8bLV91Aj/Y9
         ncCioZaIFUGRouKcgbkGwe4E58X2iQ325qb9MYyJ0EguxTC5bRorwZYrJkvqUbNgQsTu
         VZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816133; x=1795420933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjTLfRW1vmU3uyxwz3ZMVejkouImicH1fiPgUPprDmg=;
        b=Ofa9kwvMj/IoWuxLr1G31Ndi+zbNl+fjpN9PdYrwLi9l8r4T/cBcQsqPMSZ0KFMDP/
         8cuy7YsURtEj+nEA/boXuavdWR1U+rxUZkwWleeAB+cMthVyMuhETKMvO57d/xklwWdV
         2Ktp1HPOGQMO/xvMrijlUeW6mPqDif+1yOS6DAj3kTwwRDCMnD+enDpDIXQxnGHEqXdx
         hRhXkmzf5xkFX5rR8nC6skOfy3zyfsaP5CgB/eD73eF4kFFomCBCY16LD/lk7UN1E9Bn
         u84NdSJvXZYqFyjwZQKCezhcaigV/a9NI1EE0NTNF1IoMJkwR6M2/wJf88wY9K3TGS0N
         IVrA==
X-Forwarded-Encrypted: i=1; AL+hErEUcArlVFCl1Gbd8ssAGJ/6rSxruBE+CCRYf3T3qKDeFBrtJ0Hwef3Nwhf6HV+JOEFladYgFxHY672PWWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VYPzGlEqt4tF4tw9mq/3KQ358O6j/kS/u30LV7RUxyder2guo
	P/eTKEDozzLBPcn+lGDBdy62JD79qoxxBOHJbGM55w0F9R1gg5couPWi
X-Gm-Gg: AYBFou0te47E4mXA9fYV2tWgBoI/cX83GEC0Vr7K9yvdfAXgHhm+AT2rhno2Ysh45h8
	SRMnNzV4KgjBc5A2p1COrMLt6c7fwcAb363UNtN4QlW9K5QFgaOMDOWGU4TMyX4yl9NkXr6PSst
	8K58jE5yfBm1GpbtUGsJpq8KL98XVqS9j5edP6o4tSY+KG/D2rhfXo4PnXwIclsOqfmwdrAqVfo
	EYNx+x8e7mf9JziwqTlivbp2QylMiqGv9PyxyY+8l10NJIDSUgaXB2zPcvOIgYi98vSPTYaSD4P
	3YJ+ZHNn8eGGXAaFYxJh7XLmje7cMx6QwyQTiWyRig4eiefVyUuTNUugSuSB4zJfud5ghczkvQy
	V20y0iJXUAe8Z2oeUp0NCa4UbJg0hACX41s7fnTH1iwh4L7B8q0K769YEUDGasYdCKZh7wRcTj4
	wN3STywwI0WxMz0eAZ8rmRCra3D5XL2FVC6iKEBvEYQTQFoQ6qCXvzY0Md1KsRdz3m/ZYtoum7H
	4hGwXBQTaoTJIYcqOV7pXeyBsscZyp2TwvautO3L5gV5KGikWStVRXTfCrhlZOGDDsV4l4mQuCW
	Rgj2/zPFA1hqwN4RJZyI4ehlsoKOzpUo4YmSMai6eMBceu1K8UiOJMpvunTrUrE0+7LM3NSOoNu
	vPh+YJv+W0lCzfG8DPjgAo/tM65b1K5Mmt1vNbA==
X-Received: by 2002:a05:7301:182e:b0:367:a092:3c73 with SMTP id 5a478bee46e88-377e1016111mr11133410eec.12.1794816132853;
        Mon, 16 Nov 2026 00:02:12 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm31128558eec.17.2026.11.16.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:02:12 -0800 (PST)
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
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v3 0/2] Fix unaligned enum values in btf_dump
Date: Mon, 16 Nov 2026 08:01:49 +0000
Message-ID: <20261116080151.44860-1-dennylin0707@gmail.com>
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

Changes in v3:
- Do the alignment check before the size check (David).

Changes in v2:
- Describe the undefined shift in the commit log.
- Drop the data_end check, which broke the dump of struct fs_context
  without emit_zeroes.
- Add the selftests from the v1 review.

v2: https://lore.kernel.org/bpf/20261115084923.53182-1-dennylin0707@gmail.com/
v1: https://lore.kernel.org/bpf/20261113223449.97604-1-dennylin0707@gmail.com/

Hungyu Lin (2):
  libbpf: Fix sign extension of unaligned enums in
    btf_dump_get_enum_value()
  selftests/bpf: Dump unaligned enums and a zeroed fs_context

 tools/lib/bpf/btf_dump.c                          | 13 ++++---------
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 10 deletions(-)


base-commit: 8835113107b2cf75df33a71e265cdeec5d5d13e0
-- 
2.43.0

