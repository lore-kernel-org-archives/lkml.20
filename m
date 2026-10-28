Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218067;
	b=Mp6Nj4h8iKng2ZdeR9AOlyYF4BqyXreklMoo5gDJTsHszREuQ+QDNh0QLRjh5RuS9B/C
	 jKcADmP0PKgnbiSGIRfZyg86JgC/VGQUCWpzvwP7TbOof/E4flZ2BL15+BfHJkCnch2rb
	 /ejpLCoaWytn7z8m8Ms0LgTxO0lnJqUW27Up2MUcWI1Gv+tRY6WmjZbYa0I03UFZpuuTG
	 q/yBtc1juW+FBf54/Aeyr07XY9CnuoAzoRjqzNZgGv1kC6TE1BnT88X1v3o2SKnHVG7Kx
	 XwhLQLjvWVirGEy1LMI3YQqMp7xHP1A+ybGXfsnmijkkpWdXWG0AfDZel8/daonVL1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ED2rbpiFDY/9XXMCuu1u7PPv2hXtvz6t2MsO7HwHCvo=;
	b=4Rrlep4FjFcbDSsH/6adGJnO1BNhlqPwTjuVZ9Vs+FitcH0vN0Eov4qPjmGtPA/67xvw
	 mYdWfLOXLnzzL+n53Rs0+OskBw0rPnrRaXCaloENtK1VMo46lmzvsGodps2Otm7OhJY2v
	 5/EnbSDY6tpByighKFbslyf5gVkOJ+mM8rPzUfmC6Nk0Zt0tAgwSCBcopZtCM5BVy0IZT
	 4yQsn6R653kxcG/1Swmfx80jkTrW4j0xYMQvEMxo/eg9Yex5Xdx3z3l9aSxA/fZHF4+jw
	 6KfFQU3f0F8yqlw9GjO1huti+24zS0e2sQKGT+o90V/8X2OPFuaFlZPWJgysx561Gmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPh76Kdi;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB773606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB773606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPh76Kdi
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-702dedeb70dso983166eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218066; x=1793822866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED2rbpiFDY/9XXMCuu1u7PPv2hXtvz6t2MsO7HwHCvo=;
        b=OPh76KdiZQKzry4Jqau0yFJ65ZQBUnPTjrYGusysxGpQ3ESNQcQ5Dk4FA64sCq0bjb
         JpIv9mfRCyVN1pN7VUzVlRDAMKCGRuRymWPchH4YYhFX4LmMhbFt5mLw2vkIMFTNhQWQ
         QbDwmGthM6RxInXztn+z/UDpeTWB9NpA5xYEWHaF7/RBbKIc0M13KQYqsRmqlSjbTie4
         IMOUokuYdYkSha4miLFMBifcYX7zYr0WouOfIL8TtAuhhanCKMsuie2FCsWer8xtWdgS
         IPAhJH05SfUw3b1v+H4yk2qpyVvfbKiX5bHqN4u6fGDnKmKcsZ9CkN4jTJ9EdTN5QvPj
         va9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218066; x=1793822866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED2rbpiFDY/9XXMCuu1u7PPv2hXtvz6t2MsO7HwHCvo=;
        b=hZnof0Y4fZIjKQrEk06sYakYzk+vwIExBUxRnt7voZ6cn7wP04nDWGmeOS3N2WroH7
         9/yopiEoc4HAHYYyRk7+CzIfyAnnlLBMeuLCCHOMhmt0ndgwKbmTReXfX+P+BSJRN0vU
         HFEq4YFSwvp/LxoYgcxE7hf+ey0qit7IL0mu7e7g0o8ABRI1bFQU5RfvYlqa8ZnAd3mG
         jHDGvU7AkMxMPKHybgASz3YbHD+p2gIlR+vgRS1PzMWmtADSx1tqIwGNX2A0u+ClMQku
         kcmURrArK66lUAba9dc+yXYCCKV2mXfTDYCzB6fsAldxR7M8HHIJCxRNdeMxqjqhu+gW
         ZDQA==
X-Forwarded-Encrypted: i=1; AKwUvBzD/tnjryJPnk9u7ldD3RRrJtXDJ2fOwmwVtaupu7Ox1Al2PKNH9kR9/WONZDt2dBRwDO9EbivYfCJrmWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxenARiMxFpBs8pVATQfVZUkTht0+FRccdivN20X9iWsG46bPC
	rZ/YsL+v2TyQHs9oWYbCWBEWCEq+oi15epPopHAi7ixryAcBKmdXoTThEWpzDCds
X-Gm-Gg: AYBFou2+/TgPQCKS+q8gAzDnstUMbEdukGBNjHTIVmxg+JT9sOrmOJU4k0X7jaejIA0
	bEPaYZJh+tVF2zu84Mw9n6HYaBz6EB8upSyIlK6N6oxdxKhtpBOOwWNWD11Z1wb4jp4B1Uev/K1
	rd+Eql8ifktGwqIOi+7Q2Lo2wg4JbdhotOFwnJMvUKqzPKyx9UPbB/nT8vJIEC9T7E5iadRLBzc
	nkkeTsjYrrNiQ9ZDRsPcmg3DHdv1S8UOK5lYp69E+ZfYUMYUE/LXEau+MRSeXa99mgiZ+JfO9cn
	/UKiDYmNhwjFEEgCE5KrcH6zva9vINR/uaSbT0KzTT4ucbBxB1ZlUKn/oGSnlBqlTfttGu/ZcR8
	MsrhYM8VyNWK0+T8TaPM2z5h1yEPawwVNK0rD39d+vriZ0s1h/VQ8ZDMspSJyWst3yjQqOftIN0
	DtV2t4wehLcvIp4md3kNHU24A3P3f5AuP4pS7REPVT5U8zzbzLANlRSGe8q7+8M/XJCtgfjE8hO
	DRchrTM/eiKWLy3u4Lp6X+SNlC4PIbHwm+tHH+smxPQEFCKICcEDtiKzF267O0fA5m/rUYNCWVx
	jz9V98/Vghz75w6onigXhSzwFMqagJZSKRhWfHJs4LvCL0VDVyLWXheS08u89hwL2IqEOCxKMTP
	yIb4rvuHFqmk80kez
X-Received: by 2002:a05:6820:3401:20b0:6f8:92ab:bb53 with SMTP id 006d021491bc7-713ef52f25amr1407644eaf.41.1793218065857;
        Wed, 28 Oct 2026 13:07:45 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:44 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/3] tools/nolibc: fix fopen() errno and "rb+" modes
Date: Wed, 28 Oct 2026 15:07:40 -0500
Message-ID: <20261028200743.154151-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
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

fopen() has two bugs:

- When open() fails, fopen() overwrites its errno with EBADF, so a
  missing file is reported as EBADF instead of ENOENT.

- "rb+", "wb+" and "ab+" are not recognised as update modes, so the
  stream is opened read-only or write-only.

Patches 1 and 2 fix them. Patch 3 adds nolibc-test cases for both.

Tested on top of nolibc/for-next 700ce4da6f6f, on x86_64 (GCC and
clang) and i386, and on arm, arm64 and sparc64 under qemu-user:

- nolibc-test, all tests: no failures with the series. The only
  difference from before is the three new tests, which pass. They also
  pass against glibc (make libc-test).

- Without patches 1 and 2, all three new tests fail on every build.

- On x86_64, a separate program opening a file with each of the twelve
  C mode strings now gets the same access mode from nolibc as from
  glibc, and the same errno for ENOENT and EACCES failures.

An LLM was used to help with this series.

Danish Khateeb (3):
  tools/nolibc: fix fopen() errno when open() fails
  tools/nolibc: fix fopen() with the "rb+", "wb+" and "ab+" modes
  selftests/nolibc: test fopen() errors and update modes

 tools/include/nolibc/stdio.h                 |  5 +++-
 tools/testing/selftests/nolibc/nolibc-test.c | 24 ++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)


base-commit: 700ce4da6f6f172435349b687d2d916e791c6330
-- 
2.56.0

