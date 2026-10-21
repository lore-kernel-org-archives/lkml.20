Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616128;
	b=T8H5DlisixdO9bkdSQbw7Uu9EztfAa8tg1M6fK2JPI4YrIX3FubSAcsKr45OOzPa73uN
	 CWmnUe+Tkm8RBJIpggZS5GBqID1HT4tdS52R8pomUlfgogM6C1cidY8Npo7eoBwa/MEvS
	 LjtGfWYgpEShnysGJwG3vfOxav8JDg3IMGg8P5iPMldOvBomIH1Ayk2d8SD4t2YeKwXdY
	 icRRGp247a7I5iV4r7ueq+564xlQ952P7ERuvdNRzS2fV5FNmiNIrc5hCdOFcRUYvUDtO
	 DUUYxPX+5sKh00BSFRsTlx8H5ijnt+6u+/z4j2SyMog++i6iVtUztKejY6AOBoOSWEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BoG6FgQzAOsqSSw4b90ZKrbZ/8eF7MERpzSbbqg2z5o=;
	b=oRBLh3U0NS9LbsVE3kg1XLEDNhuG4oTytuuVpxG6c05aHTLpYTRbRxv0GMtyFmiZ9HMD
	 62VAsaQL/ZJPrcNLouQIB0e9z7PEdi0mojPcNBGlyg+4uNRndZjykMZ6ppAudbgkqe7S0
	 Y+EMWx4PdUCo/b2WRclcpHQzSC8mKxXyMUH9z3tbOLFOkE0NgRdQaR328zGb8rqMxeFu9
	 UtOjliIyLbaPvziizmroteG+du7IYnRWrrswdGQJz+t2iuhD4dKtihB2cHdagLPSjsry6
	 WCQTvBXmY6dsaDapZ7HTSvCQPBLYHOJIE6SbDJJpjIjC/t3Bz16411K4VJAjz1BWvEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlsoi9gk;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A21606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A21606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlsoi9gk
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so1062470e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616126; x=1793220926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoG6FgQzAOsqSSw4b90ZKrbZ/8eF7MERpzSbbqg2z5o=;
        b=rlsoi9gkS/LM3Pu3xYPtL7zf/U6dTptg6cRP/51gPEafMMPbJkkfk5F1Sgimdip3h9
         PTtEPJw0y6xSa5uQsJAL0fNMDnIraWtFrsA678FnlLlc4rNRtsjgMQcACLSLWHbB+pJF
         1cgJ1mJjEOFGAK0j2jsPClYtjcPl+346TKtQBE4XyiTTHLCAXB07T4wDkIPoYfRENcz0
         H1aJVgf5J/WycWH9fkBBvZYWhSELd4BOB4VJCKkoC5l4x6NscEM2gkGqkpJ3tuHIKfUJ
         UBdi9kJhU6N/x8P9PclLHtuHK/ZqtfQdLf9z3GOdC7H38pmSgiArGz1V9Hm+Dt2F64BD
         4EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616126; x=1793220926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoG6FgQzAOsqSSw4b90ZKrbZ/8eF7MERpzSbbqg2z5o=;
        b=IqQnEUrAyz9NYZmBxYsLRTEJd8GN/zuT0rrniLQc4KWJzfneITUlLNPC2nAuL4dPVX
         eaZ7G0AfBDJRhbDmWFfq1J6tCT9wZPCckFGFR0iE1QicbUmFVgn8RaPDgtGTvjDMBVQI
         3e9mRFsWaJjgDXc+QlvI9UZmuRV/HePsyBTnY0hlMydRGTt/LG89uKVbu3XBroI8PNwx
         B24lYAUpHuiIR4MCfTpt0Ez7Tx8AJJ40EcnIxtLoeoIV50vDgH44LEDrbZmqrM/d8OoE
         sM0h2ov9aEPJJGS6/daFU9N6wZpu/FBFXJ23uIm+v4ZJ5vUK1rqrknpYNhgIpMdXb/R7
         qu9g==
X-Forwarded-Encrypted: i=1; AKwUvByT845ZGP+90zvvZ+lBjssswfBT18HpXd51vOCWFSBPnsQYPnrqKTdU7MTwgvVHRNP8W/8Hq3RLsfwJxA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNVCXg+ljgxiAGy5/UF/ndAXNZUhuOpzQwiMHwhyktApuA3yOB
	jpAD0sojRMk/Is0Gx8sAV/FqwvCEQ0Cobze/x02yVIWgNPxsG9P6uV62
X-Gm-Gg: AYBFou05ioWaOMQFRlmYXbuT0BtPO4FHLmLtC3yuO+k+CmVP4sZhePDl8tZB7fzH5Zc
	Bvo9p6S19LFslxKxPSFQAwnrIrc4262YEoeUG5p1djzsuEOukMl803s5alj5gewNwlzNndArWW1
	7hZnLkV6siUTDQFazp/kxGw1Eu/WXgQ8eOgKr27tuC2PaTLDYSqlafzIiF3fJU9Fphr5MQ891ek
	RtsJ+LC3Zy/oKj9Y1atufQM9CQnfgVpG6jf0xbnKNyCQgWbIFxfqmk6QTe1XDpFsEriuSeZ0z0a
	iRej3JxUmH4Td1zBYSYIMfOIwXq0a98vkL1oDdKmo+BKEyGCAjnv0R/0SndPRWJsuP6OiaoYNZ7
	CQqTLotBOjQ82R9CNwLzJUgqEbSCTwQN5gbu6AvLSe6JQa7/GULOEc/m474fDnNYf5EHzujrPDS
	psSZWDJHa5c5P01SRCqQHxa1BD10tH/jmyWtwBBnohjhVnr1QLtqGF55n3O+4o/5N5PGcdKzoCZ
	gsApAL2we4ey8BP5VFrP7C3wV9wCZJjXngLIdL1C6h/nH1H+HS4/CkoPAq7+t3frWL653WU+BtM
	+Nh8Bm8V7bPoDP6E6NPt
X-Received: by 2002:a05:6122:a50f:b0:5ca:856d:cf80 with SMTP id 71dfb90a1353d-5eaebde8b71mr1215288e0c.11.1792616126316;
        Wed, 21 Oct 2026 13:55:26 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae980f64esm4553359e0c.13.2026.10.21.13.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:55:25 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: irogers@google.com
Cc: acme@kernel.org,
	namhyung@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v4 0/2] perf/kselftest: convert Perl test helpers to Python
Date: Wed, 21 Oct 2026 17:55:04 -0300
Message-ID: <20261021205506.26736-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018134322.26445-1-breno3011alves@gmail.com>
References: <20261018134322.26445-1-breno3011alves@gmail.com>
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

This is v4 of the series converting the Perl test helpers to Python.

Changes since v3:
 - Fixed pylint W1514 in check_errors_whitelisted.py by passing an
   explicit encoding to open():
     open(path, encoding="utf-8", errors="surrogateescape")
   "surrogateescape" preserves the byte-for-byte behavior of the Perl
   original, which reads raw bytes.

 - Also fixed two issues found while testing the series locally:
   * open() failures on the whitelist now exit with the underlying
     errno (matching Perl's die), e.g. ENOENT -> rc 2, instead of
     always rc 1.
   * stdin/stdout are reconfigured with surrogateescape so that
     non-UTF-8 bytes in the log (e.g. oops/KASAN output) do not
     raise UnicodeDecodeError/UnicodeEncodeError, preserving the
     byte-for-byte behavior of the Perl originals.

 - The series is split by tree, addressing Ian's suggestion:
   * Patch 1 (kselftest:) touches only tools/testing/selftests/ and can
     go through the kselftest tree.
   * Patch 2 (perf/tests:) touches only tools/perf/ and can go through
     the perf tree.

 - Note on pylint-tests: it fails on tools/perf/tests/shell/lib/
   perf_json_output_lint.py with:
     W4904: Using deprecated class FileType of module argparse
   This is pre-existing in perf-tools-next and reproduces on the base
   commit without this series. The four files touched by this series
   pass pylint 10/10 with the flags used by Makefile.perf.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>


Breno Rodrigues Alves (2):
  kselftest: convert prefix.pl to Python
  perf/tests: convert check_*.pl helpers to Python

 tools/perf/Makefile.perf                      |  2 +-
 .../base_probe/test_adding_blacklisted.sh     |  6 +-
 .../shell/base_probe/test_adding_kernel.sh    | 44 +++++++-------
 .../perf/tests/shell/base_probe/test_basic.sh | 12 ++--
 .../shell/base_probe/test_invalid_options.sh  |  4 +-
 tools/perf/tests/shell/base_report/setup.sh   |  4 +-
 .../tests/shell/base_report/test_basic.sh     | 54 ++++++++---------
 .../shell/common/check_all_lines_matched.pl   | 39 -------------
 .../shell/common/check_all_lines_matched.py   | 47 +++++++++++++++
 .../shell/common/check_all_patterns_found.pl  | 34 -----------
 .../shell/common/check_all_patterns_found.py  | 37 ++++++++++++
 .../shell/common/check_errors_whitelisted.pl  | 51 ----------------
 .../shell/common/check_errors_whitelisted.py  | 58 +++++++++++++++++++
 .../shell/common/check_no_patterns_found.pl   | 34 -----------
 .../shell/common/check_no_patterns_found.py   | 37 ++++++++++++
 tools/testing/selftests/Makefile              |  2 +-
 tools/testing/selftests/kselftest/prefix.pl   | 24 --------
 tools/testing/selftests/kselftest/prefix.py   | 24 ++++++++
 tools/testing/selftests/kselftest/runner.sh   |  4 +-
 19 files changed, 269 insertions(+), 248 deletions(-)
 delete mode 100755 tools/perf/tests/shell/common/check_all_lines_matched.pl
 create mode 100755 tools/perf/tests/shell/common/check_all_lines_matched.py
 delete mode 100755 tools/perf/tests/shell/common/check_all_patterns_found.pl
 create mode 100755 tools/perf/tests/shell/common/check_all_patterns_found.py
 delete mode 100755 tools/perf/tests/shell/common/check_errors_whitelisted.pl
 create mode 100755 tools/perf/tests/shell/common/check_errors_whitelisted.py
 delete mode 100755 tools/perf/tests/shell/common/check_no_patterns_found.pl
 create mode 100755 tools/perf/tests/shell/common/check_no_patterns_found.py
 delete mode 100755 tools/testing/selftests/kselftest/prefix.pl
 create mode 100755 tools/testing/selftests/kselftest/prefix.py

-- 
2.56.0

