Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637101;
	b=IH0t+adLw8NZJlPuTeliCK97YhXllmCtJpJGXPrl3y52Vka9G7HLkjI/aXevJ7AFpLct
	 CoQZUQn0izi7Gh94HeIkkYLNG7oVYIhjzyipudKTp4c/8MfyoAxz58HYNL8dR+6FnJekX
	 viAh/p9eT2KrRvmQO1JrsSjkooRxrqIdrqnmtmI3EXN75bkgzGcAygULFQjKQhtymyqHb
	 ETQQIGM7e5BOw2f65xQ2paoJlH+T/QweoUFkvlZfB+mUqlQ/QPEmVYZZoJeoFWC0Ad+Q8
	 WBBC7CkrUJ2X39LszfLMogmz5SYOTNpH2oUvUHGdAeyOdqV5ZJ+nlMxs+lrbgGF7O3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ySLBNxOo+g4OD1IhnmaXb2gimmvucxqU85MBcPIWLnk=;
	b=etfcnvvOVwvCFYAK4+nSe6P+B0Cp+088eI7qBlhwf1b3A4SqgihZ4b5V6QR0PdVYsMAG
	 w/QFwal8YSjMJcprrA0XpX7EffwrxnDhqXVk/leCfZEYxnrLZ6KeGnQbhnAvP7mHQoWvH
	 T5QdfuIHwCEcen6fZNT/HuGFRpDr+WzVt3JT2A86bv1aD8EEoFquJu5ceCgd/H0e+63yJ
	 6fFdkt5j8j7ioL1toqJtCMpAdvizo0E1k59UjuP6nOHnuR+PyGfdLMLMg7NwwP84oyM8v
	 HiTpX4mtMd7di1llaRrzNja5F9mpXMvSvlhZ0Yu/xMJkzqqSESDD1n6Qd1RKpSoZsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRzIjsOX;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203E4606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 203E4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRzIjsOX
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3302194eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637100; x=1795241900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySLBNxOo+g4OD1IhnmaXb2gimmvucxqU85MBcPIWLnk=;
        b=nRzIjsOXc4DTjGb5V4uDM4oX14T2LtQ0PM7wEyYQ+jT9JPkies50fumeh094yuZp68
         CTrtXN8Op3D/NoB7Ei4hOfWccncs3w4jYoR0VMyozZgDpr/q6MY9eBVoh3cWzSSfvHS4
         NgI4otlKxLyX1l9w7cdMFKnG47TRJAhIcyWnrehClAKRyksaXThBqIdCJj5kZyOrFTst
         qCWr+BVvTnJ8csQWMGblp9d1V5vXV0miVN0WewRzxRTKd4F1C/CKmmZ7ilGgYfMNWxaE
         2VM19jBCXKIEYJy/ZJkltYlucdE64MoaKD4sx0ToFesx7FSkS3AWYrPPInvSO4cn8RH6
         1TLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637100; x=1795241900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySLBNxOo+g4OD1IhnmaXb2gimmvucxqU85MBcPIWLnk=;
        b=nv5VNKSaB1BxUMWQ+twnAbGuQ5K6kdV+tsJIfthbHqLF3CsUOt7TUx+nMEJ7TTOWIo
         nNf3eTxvIVXKH2S10sK4JEB00Q+h37I3VzW7MfdA5eh60aKBev7fB8QXGb+wq0YebSCk
         FoDMojASSt1M24G+RVwOejaHpEtnWwVAeFmwF7zqD5s3OujZ7nnM+MRexrPxXJiTCDJ6
         cjHgE5DE+F9tP4ysnP+SWH4dZHuGXRFkF2JNWHldZAg5ULjU5djTnmms4KBWDlYY7GEN
         wtGxmeuxvDgf1PhNoxcX53RqM53tmKZPF8zdKPlhFiBbmRqSxAn3cvFFBQhDu3li5Kt/
         GCzA==
X-Forwarded-Encrypted: i=1; AL+hErFFjc3ASRoNaRNwrAg0xgMXXTtlX+ex6pKoXqOIj+wXaGE1s4TmJwu8gF/LzpYGwQ7BLWyYdanDGaXhdaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sib3exbv3xEjDbrDng1BR2S+Xwyp6ufX/gWQt1hJgvL+A+/HH
	HRe7N1v+JE0+Klsa6zDb3wU/qEufFsYEB0t5lGiDBYr45Atdc28qpSFDuFncig==
X-Gm-Gg: AYBFou3NN9zUS1zZPftduWHNP/3eDVifzZny+E4G541ia2HH4nHlEdFSUKPQx7R7NC/
	bizJlwDW+IkUdaeKWpH0fSrwR6y/mAJBREnb3EPYKClepZtVI5DdTVOHygYoKUb/WA4WvwhslQJ
	0ulSbEvK11gSKaIvaumP0YWZN898+XaBsmDXcaIcgyMCkfYgfpn35Zrh0fQIk6Y7MLDpp4zyC0j
	uFhnycIFrOTzvX80ym7sTLkikYXZnglAH+IOWZQKjjgEmdja1AU631qmXHeZ/W8jkVjHUfUdsoL
	QjhaMlpTaChLUyfWvnfcxHkJRxWkwgRwEE0YZoIxqNg6MehS2/ZAdvUvYLNglWZ/j6xvR3RUsNf
	ZjhcAtF8AiqChvTTd0JvBnnCmhkUNSdluIcQ9QX6rPfd48uBBXHWlnOaJQfWL5LClEGrr1wOXXd
	4we3037lSf7b8WMLsssx9zZhV9SqwzBNQQdhr6azBnqfsle0Rum6ly92Lw6WR2FOlBElZqvHEUx
	4t5IUnFC/oeNynUSCEiFx6Pheb6RH8RRavUBzmZVo7Y/0aPPb1XNgIPHnapVkRy1d9rVXfS+r/U
	yth96mjPxJhXUhEQuwlYMM/nFFWWnMxmw7lGudDgvzQgKAZwaypG/EzqxYCyK4ToKdGD+vMVQq+
	62N0Yk21pSnDjtJtPefbTzElsMWvyhXhJUtrlnC00xRxm4PsR6bGC2U5gHL/ayMZPDusdxGmppS
	IQfg==
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr56245eec.6.1794637100147;
        Fri, 13 Nov 2026 22:18:20 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] platform/x86: dell: dcdbas: Fix SMI completion wait and buffer handling
Date: Fri, 13 Nov 2026 22:17:53 -0800
Message-ID: <cover.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Fixes for dcdbas.

Patch 1 fixes the host control SMI wait for types 2 and 3, which the
compiler removed entirely because the status was a plain memory read.
Patches 2 and 3 fix the SMI buffer lifetime on unbind and module
removal. Patch 4 validates the firmware-provided WSMT buffer
description. Patch 5 converts the type 1 wait to
read_poll_timeout_atomic() as well.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
the driver probes, and growing smi_data_buf_size and then unloading and
reloading dcdbas with dell-smbios on top is clean, with the buffer freed
on remove. The host control SMI (only used at power-off) and the WSMT
paths were not exercised.


Rosen Penev (5):
  platform/x86: dell: dcdbas: Actually wait for the host control SMI
  platform/x86: dell: dcdbas: Suppress bind attributes of the platform
    driver
  platform/x86: dell: dcdbas: Release the SMI buffer in remove
  platform/x86: dell: dcdbas: Validate the WSMT buffer description
  platform/x86: dell: dcdbas: Use read_poll_timeout_atomic() for the
    type 1 SMI

 drivers/platform/x86/dell/dcdbas.c | 80 ++++++++++++++++++------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 49 insertions(+), 32 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

