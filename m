Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861662;
	b=Ih0DQ056hWS6tEJRXPPRzwKCDRpGZaoCl8Q6la0dpG/NB2z36+Fr9Ze5+nnJ+ftz/qz4
	 rC+ZRw4GL0pzeisZuvz8ivARPXT8Wc2hkqpZGY6PzWGipYdN/XLAmVmv/mExVEpSbpYMf
	 hy65SAiYS3R7gvjvEbOmqDghlrDF9/FpmSnXGSIs1WsecVJQjT0KoEJfQu4+J3Eud6kno
	 yOfJt7iE7vkVtSBfzH14S9hMIh7/VFtiXsDpCmS86MFsSS4s5toASORwmbmqL80yQUE+O
	 7PSK4wUKXldtfDs3S/Af9QFM/cvXl9JBnNT+ZmZHdszEpLtOBP2ZyYCYzIYfgcVrr4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KwupKsUiOqn7cLay4MlUcBS/p/Juvy45qENBSa3w+E8=;
	b=y80rKNfXZJbfBPokLNPWONxiUYSy6F4Cnnx4I8yDLbCSiF7hz85tb8Rho/Ijeljp5zXu
	 idTZak6JqqW6cRh5WdbN7gPi8lLw6su5OKepetVqwiFVQMOevJ6e+12hR12/vLFi0fFk9
	 QA3o6fNJ5zm0AgnDSWxU3q7R7fqaH2NAQm1oev47Qr4kuivrELKQdscydC4QO2X08ze/3
	 u+Xav9+MtVB6mt/GfEUqoD3X/SO3PDfuRz090FYYcEpxUOIEGKcXbk8TBzR/ywZJR4n0y
	 79AR7Y3d5/ellgZFGzh1J8V4igqe25zeJuiGHGVoMKDm2c81NkL9UzfKGk5TKjE0K0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgJq43AU;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD0C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgJq43AU
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2efcf92af4fso3292895ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861661; x=1795466461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwupKsUiOqn7cLay4MlUcBS/p/Juvy45qENBSa3w+E8=;
        b=QgJq43AUWZHaO8+QO4KXF8guoz9iXvueKPsr3RlpasNEDj24iCSCWKMJMeh4SpSbCx
         3Xm/m6fFLHiuZkg5SKbrQcrByCo4I4fWpCeS+EvU5YxmHmRT8eQqzC74WwxmIsHPkZUN
         Z2vjCWbWBtw2r5cyfyX20/MzcpsdlgqN7xeaU5OE2jKUVIhYK/hYdNgfkJTRwbfElg6H
         UctodA/hcFpcGcZLgGIaOmGDXoYcW+CYUQ19J7nj5qzXD9kxFLhRfIx4ljr64fQZWv/u
         zlKJBqszvvCZeRI1lxKOl0V2FgeDQKhZqTPVIGnxQlDwy9Ufsm5mn23vCHArggZ67ZoO
         aTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861661; x=1795466461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwupKsUiOqn7cLay4MlUcBS/p/Juvy45qENBSa3w+E8=;
        b=oc9WO1I1DoM4ADGxZPpAETzAYrlZDFd1hkF9F6E5XkMU0AmNyohmn3hxdJGzUAtQdk
         eRZBlpa5UgHCeTFsx7Mlq+Ipr4JnuR0AQsrnzD8oIkeacWsnsjwYe1pe2HcJy6KKyIh4
         gX5jp5ebLeeyYjQUUyJe5f+NWJboJXscRYUlvYDcbs1Xi54o0gwEQv2rK3MVkvZFu9QB
         vR9vSjgc06fA6zsiYpKAmczt9ji8R/F1+bYi0frvkILxjQV5zByfLs14sF+1VyyUYmZm
         OzHe+m2gG9DakZwhMcPyVDIzIPljZ04Fwc55tN1kiktE5SvSetc6tYQ7YBBPdOA4C/6L
         bvww==
X-Forwarded-Encrypted: i=1; AL+hErG+t4izmfpD7B++zss11f0NI5kAPTxg/sWL582xVTjEq/K4G9XoXuzJZ926uS24Q3ZytZhKhvK+zEJk0Co=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t1C9aAqgWSffg94r8r4DMQe72yoJRY1fvlTXYVny/uqWpecwZ
	8gcKhIKVj3+gb8YJrDMfg7BJrjp6nPAXiTjOMh3hNcVsL7Q22/YZmvuf
X-Gm-Gg: AZFdTZd7MnxrV5I0dGxarGXNJ9lQhnG4/5JV/hrG4bBCvBe7DzEH46sa6JyqSNK7xd5
	1RpaKPNv/nCwffMv7RPwkSSsUKJgWRm/C/mPQCDz876GLjEuuJTcZ2hB1zbuGzSGRBZ+2bvbZAU
	zVspH8xoW4SJdPFiImtJPZai9j5UWScQ5WEOWS/xIU56fyOiNuPiMAV+XPmop5FqbnJFU/7d5fq
	hO+CnkJVZqjpNiUyWeFbym1Iaip/3ZbNV/tTkSvD3+2woqzMrhkpTEGqF2te/P/B6zhGJX/xxqM
	33f7t/PLM9cD9r2z1uTsH4H6Qc6nYDx/Oz1wMTSoYhExwBjp9kt7ffm35Y6MS4zqcuFDjl3MwYD
	0CDzR4qhkXEoAV6/30IveDmDBAr3pQRab7+bb126lsH+4wYumK+WGNBMAoTRdhfw2c6lkuw95Nr
	TvDMq5je8FHh4Jz9YsFSQ+n0stARNxWGRgk6MPqNLsY98SYrGAQ1FUcyQPAzV5LK3RVcFHL+3GA
	aVLUJHiF9Fx+0g3jBkzxLTnGb5g1RkptSAxFjKGGnDP9t01hwaHwqAUOJN4QH7ek7nNnvTI6FUM
	iw/aSlZF6t/E++IvbGIVHZrQU4nQ8nAFVoOYfk7WMF7jcxa3jM0OKRVdaXnExSSD73bK0ZCzErT
	UbLW2RA6jGP+0nfZGef9JRvNFLkTaHvR5aJ6HOYXQQ3v6uHJ8q9Cf9AE9LZRMrYv1co5FWpYDTe
	FZDA==
X-Received: by 2002:a17:903:1b47:b0:2ed:3db6:2eb0 with SMTP id d9443c01a7336-2ee0e0ba6f7mr102960155ad.48.1794861660818;
        Mon, 16 Nov 2026 12:41:00 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:00 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] platform/x86: dell: dcdbas: Fix SMI completion wait and buffer handling
Date: Mon, 16 Nov 2026 12:40:48 -0800
Message-ID: <cover.1794861287.git.rosenp@gmail.com>
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
compiler removed entirely because the status was a plain memory read,
and converts the type 1 wait along with it. Patches 2 and 3 fix the SMI
buffer lifetime on unbind and module removal. Patch 4 hardens the
validation of the firmware-provided WSMT buffer description.

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

Changes in v2:
- Squash the type 1 read_poll_timeout_atomic() conversion (v1 patch 5)
  into patch 1, so both waits in host_control_smi() change at once.
- Patch 1: include iopoll.h instead of io.h, and return the error from
  read_poll_timeout_atomic() (-ETIMEDOUT) instead of -ETIME.
- Patch 2: add a Fixes tag.
- Patch 3: make the dcdbas_release_buffer() comment a plain comment
  instead of malformed kernel-doc.
- Patch 4: the problems were found by code reading, so drop the Fixes
  tags and describe the patch as hardening; reject remap_size < 8
  instead of <= 8, as an 8 byte mapping just gives an empty buffer.
- v1: https://lore.kernel.org/platform-driver-x86/cover.1794633178.git.rosenp@gmail.com/

Rosen Penev (4):
  platform/x86: dell: dcdbas: Actually wait for the host control SMI
  platform/x86: dell: dcdbas: Suppress bind attributes of the platform
    driver
  platform/x86: dell: dcdbas: Release the SMI buffer in remove
  platform/x86: dell: dcdbas: Validate the WSMT buffer description

 drivers/platform/x86/dell/dcdbas.c | 82 ++++++++++++++++++------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 50 insertions(+), 33 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.1

