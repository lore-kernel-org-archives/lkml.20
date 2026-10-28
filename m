Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202227;
	b=htpUYX+yBZyeZ2sx39+1uLGJuNJ6yAdiZFlCo6MLBGzJcF1hUxIvcw9CUlnxh+7Y6jiX
	 2ocPdSt+UaQrSRPPG7SiaKX3t66WyHt8ySqDHP3gftMTgZKE+fda7+7wpqU19AxN1KShx
	 HWhjQR5Mu5UbAfKpXlWv1cWq1q4oTC0j6zPbAnAmxk1iB/2aW+tzUrf6oPv1Gl1PkqfgC
	 xfxhMXz4s+sRS1/PqzHbhADezpLcMS1stsGvmRObOz9EdOyQ3U9Pqs7xIM0de79zkM0EJ
	 sd1qp7WW4c+x24/n1jXltSCsBm5UsZ0EPPMiD1TACGpAIPenFsrmGoT77KxcKQIRoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
	b=zkZ1ww4N2ZIVrAigPn5tDaHV9MNQpqXzR/NFWy3VvJmkcKnQc77RUM8Xyw5OD50dgRFm
	 O9UJJYhmPvsKlKTggAotYPHGZ/eH7g3h2FFAUMHWlw8DXIkpqXuXG14NSObr1UWdZFb+f
	 0UYTuzh6w/bl/NXbMnP641cJn/G1chu9m3zAi+rEdwMhiOR3A5MEV5QjRf7uDoTeq6/Le
	 wmXViO+qe+bbIZpKbDdxirmurkvJZ+yB7XNVJw1Wx830PgckNH4/yUINmKip2CX2FCxle
	 MRxOj6R8I44ARt1CI0KKjjFwAsLdJx0B8wdUSueRxXvQJ7nT4zEOq3mhP3uPq1ur0rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTNYU5GK;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0303F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0303F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTNYU5GK
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso736636f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202225; x=1793807025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=lTNYU5GKH2xLrlqxE7kHO2jj/RfGi+R9C+H+/xU7FNhbaH23w4+yfjbpdvR9JOubiz
         /RIE76kgM4gpQkcFIUGqCpD/U8EjgJVZsjOe3bHFhRWkMytiO+Z9V58C2zoPn3Qf5KxV
         OA73BKUdswMVS1Jv3SYscgzzgvqMvYNCfWR7Ht50wjl2A0NedQS+vxVml2ok5jrdP52h
         S8vWwty5wAaQKNnrT1cHnVoT5tNHYQm1zhTh00id07llPFjXDyF3+N6i+ZISiJiFiqP8
         0TKFc0HtSnCaMwDeX8LFo8xhBmR9aQnhCT8E4gp3bcbnJvtfvSMMTryOa6e3cZ0/5Unk
         R+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202225; x=1793807025;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=muBvBiK2O+Pp3rrCUxEWJ+H1Ov9KIqJWyPpylaLY8VQWPoIsfDamsU/59QKv1r8ZO+
         RSYRWFyebd6GZxditmK5HhasAW158E2uksVtT6NlaztuCDld581Lo0axCDnMg9CcksFE
         yqZiE3fwsWcPIgiGiDQyOSHwj1WpOmRhrSZd2Iy+0yfB1d6I59G+yH4k4QdRz2yezPYP
         qhGnTGmqO4ZpSJiCQuAQpD/NFBBhFiiiOVDRqfW2AbJhXOHC9BeJmzJGohcrXV/Olryl
         3GQKoQRK4SBTxsQN36tglCDDWzXQXtHnaE24a6Hw16FDNfiP1S1kBiK6ctvxptUf1Y8c
         GgKg==
X-Gm-Message-State: AFq9FYIcVE7ixGqu46G9yHCSHR/UnJnuP/MqbGpVEgfLtz43H/hgmZGD
	NvgswsLylkDoyUHW6TJHAX0JQIGYmK+icrVtXyBY1HMvZymnuwXktpRl
X-Gm-Gg: AYBFou2uZr6YKM30MXUXBvvSzY1dCKE///yWmucbOhqf9gbbgaSxIyeDDwZ0nhBL8uq
	E5K47Wf4keAlqFEDMkxMjr3RGwE03x4qcj37BHahLXQrtIRG35nZIy2l4ShPxhVJ4UotazVKkHP
	Ok2etGlNNScHBWxeiIxzemzCx6lL9KJEpVgDTzOXBm29ToxLBeOSBH8YPIOAutAie2lGVvlbRXc
	RiFbz5FRGzDZ/hGQM/wbZIYMeiLhmIglRylz69vbBUuLmTXk0IqmuqM/2mdxw6HHI3VHEkeLKRH
	5AUG9F0St2ByMXH1fGG29yYEFgTLwZmQPvbQDHmXGBC0noWw5Tv/EL8TlVw6uhQ6xSNh/nZ3kbx
	21jOEpPyceOWnvHAyGTXDQt5ztsCl9+MQBHxFYbmVMDN2CFac+1JqTAgc0cG39C35NMeTG5lYBY
	2cQJJc2OHUq1RvqchMcawC5AixDkTaHEJJotzZAAc71f87BbGzELGDwBNvk/cu7dA2kVzZLg6Xe
	qPTEVrnuuKHn2LVC2PjJMdAkW199K5ecqdV/6cmeFoJZ0ugOVP/GU68w8pZYf2H1gUl1m0edItU
	IA+4Yz0egzptoqd5Tm1WyRE/yGPwVqekgKtwsKe7A/aQ02dT8nhlBtGC4cw1LrFNGQ==
X-Received: by 2002:a05:6000:61b:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-48e5d2e4a4amr7127543f8f.18.1793202225120;
        Wed, 28 Oct 2026 08:43:45 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:43:42 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Wed, 28 Oct 2026 12:43:11 -0300
Message-ID: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clone3(CLONE_VM|CLONE_PIDFD) can fail in put_user() after copy_thread()
has mapped a shadow stack into the shared mm. copy_process() then calls
exit_thread(). arm64 and riscv did not implement it, so the VMA leaked.

x86 already frees via exit_thread() -> shstk_free(). Its separate TLS
leak is when copy_thread() fails after the alloc and skips exit_thread().

Changes since v2:
- Move gcs_reset_thread() into process.c (Mark Brown).
- Spell out the x86 vs arm64/riscv difference above.

v2: https://lore.kernel.org/all/cover.1792519121.git.ivanrwcm25@gmail.com/

Assisted-by: LLM


Iván Ezequiel Rodriguez (4):
  arm64/gcs: release GCS on failed fork
  riscv/shstk: release shadow stack on failed fork
  selftests/arm64: GCS must not leak on a failed clone3
  selftests/riscv: shadow stack must not leak on a failed clone3

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/kernel/process.c                   |  16 ++
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/process.c                   |   9 +
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 168 +++++++++++++++++
 .../testing/selftests/arm64/gcs/gcs-locking.c |  20 --
 tools/testing/selftests/arm64/gcs/gcs-util.h  |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c  |  20 --
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 11 files changed, 398 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

-- 
2.43.0

