Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990605;
	b=O7xmVE7BDovLVNX4Xckv8ZcAEYU8sTIFWG0yGiwfzQlqpAYAAwiXIdNzy24nWbe0rRWi
	 HY5m6yMdr0IKs+GfGSArY0gKip8TzWAaulW86E8ttRo0XYStjoxIkD4Ln8g3TsWTY7jst
	 8aEke8GJzhqdUz+xaihLXA5TZbpq9Y+Af6/I0tdkDnLzLBXUCV3FHcwCGsBoObZE9KBdG
	 N9wU29FbICbbGKA9xCgzFFAwsaaBcileNXXmnA09viOi39/3t07NUW+9ib4TkqcSm7bhy
	 zVl5R+M3uwfiUmznq5PpRjClq/HNceoKC48T7tplIRybnSu3rAzLdy9AyYGpNXhn0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
	b=4Jm++KeKyj/TmTZbz6mnG0QZATkEeGqHseLh+SEJrp7Q5o8ZuyhhTBsKYJrRozvCkX8s
	 9PI5hPj6MMUWkTH7NhyTYl7GL8zw278Omx4rc2SrFvCHCWPSssMrpfT46UAPZWRM1JdaL
	 RzMyOYfh5Ef3D1QDFYICmVf0yyNZCHrhoa3E9EUmx2Mw2auLB5Qx96wE8O9G8poUoA0+N
	 BiCootcFfO/X+4RA2ml3JAWyBSI08CcF5WagxvR9Xts7L5+u6pv3/GQBRqkQmGRxXKEuG
	 dtXz7BDpc0NC1+NNnbNN/I1bTI5Jx2Z/7T+QrtEPWTQL0o4Xi/9aVL9yUd7L4kKz9TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALdpfCJN;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0190606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0190606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ALdpfCJN
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1331692eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990604; x=1794595404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
        b=ALdpfCJNPx/mXbaQBrqXDAxCA4aSS1RIH+Wy1UveDNxBxcB+3TKfupyaGDOHtHYtCB
         guVedBf11daK1VGrd4ZnKQxX27CGa+GzihR4LywB2BB2dMQXNXtXgMj4iVVrnJOSIbgK
         SSEI8TiOfuRC37kjSo9Ru/gvxhNPLVg8jGx+TWKB8wyBABRh0vTfL0SB7K1yV0IUyzd/
         GRBmAO2FfAxZM8Uq2b6A6TfLHn5/h4wC6+e9PktoUr2V6NDzLe+J2rdx1+LiqUMX+QU9
         7LdTHD+T5Zln4TlvFpZ7dRKOqlOjqRVR0bd7y8kDe7UB39yFqRYBGx4VA1RH+QQbPa6A
         HhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990604; x=1794595404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj9qCzoz3f+xnhhJ4C/ud2J0v2Gz6A5yTqsQ9J2hXWk=;
        b=qK+xqam2P5MejuzfY4f1Xw1SUWnmDiNhpgCuo4sQs7XVFBYKF4kV6wGvwGBACRWk8p
         x5rLg6FadS5Izas6ZcWUODARENYGMIvmlIhraRU9aAIyP84yEZPV0djsB+hhQpYI+G0x
         NQ9+k4OQJMrf0Dk6BImH/HCljJ7F5U/BsrjGrmRHt1PViOeT8tltqogFwjZKGZ+iPKIJ
         VkkOwpznkXap7n/bV7lUUuRAyi0UA1aj5hgykha2/uwxGzEiHqyN4zpVY4Emqo2ePEGN
         Xr53ftOmyNubNscxWTvo9NR34AcBUc7PHs17QcmEYeZXFVoK5w3sIwsCQOZ8W6sHv20O
         WvPg==
X-Forwarded-Encrypted: i=1; AL+hErH8+BMCfHyNj9c5EagrnBJ6v4TNk6YByGrJ+h+gJSssDvy5JX7iNmMwQVubHB5+TfmlMd4Ei+wo+VMd5bw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M8lKLEUC86tLkiN9ebD/v/evywqi7WhTC82+OzAS4hs9YJAN0
	xGp8f05Ffu9KRkOrI8iRhi26yqRxKcIgEYvE6z5hyoTTbb0NwOIWCiUh
X-Gm-Gg: AYBFou2bhUC0WMkZ/npPCFEqBwwwWpXtOEuGq/cDwKrRRl5+6W3RVlu7VMaez1zO0P6
	BiMAAXFkC1DJtnQ2dhGtfElJUBhdOC9HeGrRcmWC9bSRxNt8zN8/ff4Dn3vtfaHwpBXZOPQoDIO
	IftKYxFghilZutE4dEPicB/tQ+7dsxl7YJs/8/UlVfV+x4Ra30snLyNY5wkMN62L7euPkvQnjfX
	fKPa2Wxb2mLVceimpd+bpRfgSYdRmHxiTHEhowzfKe4Dc+h/HyMdb2tmdDi5mzS9XX3kLnOnheU
	qDC3cOuHQvNxkyGR1+w189wIVNSR4nSAxb8IK99jC8STJJnb39pE7Ixr6cbsRJfv7KZyf/qIa5l
	xKhc2hcncjJtsNfMRL4h08+AHtbmC7JjQCJ/G668mp1gq3PDi3wQQ9K4WsvHn24/rfHI+0CTBeY
	seBTtLAbUqqalcFUA2GulRn/SkcMjVf9GKL+aJxwWQaMEEzPldNN/5pUHCAKdVbV5T6q1g1ND2i
	uk5ltoEaGzo2w2d0COjxx8k3tbfxNz+rkfDM9mHvpcyewFyhsnYQ/YJObuJhhjp+YHc7qY3xltg
	zWmyMfGplHo2IxRsiu85SV2BdTW0yA==
X-Received: by 2002:a05:7300:10d:b0:36c:c434:b6b5 with SMTP id 5a478bee46e88-36f76621095mr5197718eec.17.1793990603771;
        Fri, 06 Nov 2026 10:43:23 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:23 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>
Subject: [PATCH 0/4] remoteproc: qcom: Fix DA-to-VA bounds checks
Date: Sat,  7 Nov 2026 00:13:07 +0530
Message-ID: <20261106184312.100-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

This series fixes the same bounds check bug in da_to_va() across four
Qualcomm remoteproc PIL drivers: qcom_q6v5_adsp, qcom_q6v5_pas,
qcom_q6v5_wcss, and qcom_wcnss.

In each driver, offset is a signed 32bit integer assigned from
the 64 bit difference da - <base>, where both operands are u64.
If da is smaller than <base>, the subtraction underflows before
the result is truncated on assignment. This can produce a small
positive offset and bypass the existing underflow check.
Separately, the offset + len bounds check can overflow.

da and len originate from firmware ELF program headers
(p_paddr and p_memsz) via rproc_da_to_va(). The returned
address is used by the ELF loader to write firmware segments, so a
malformed firmware image can cause writes outside the carveout.

Each patch keeps offset in u64, rejects addresses below the
relocation base before subtraction, and uses a subtraction based
bounds check to avoid overflow.

Atul Akella (4):
  remoteproc: qcom: Fix bounds check in adsp_da_to_va()
  remoteproc: qcom: Fix bounds check in qcom_pas_da_to_va()
  remoteproc: qcom: Fix bounds check in q6v5_wcss_da_to_va()
  remoteproc: qcom: Fix bounds check in wcnss_da_to_va()

 drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 6 ++++--
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++++--
 drivers/remoteproc/qcom_wcnss.c     | 6 ++++--
 4 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.43.0

