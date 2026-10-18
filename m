Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EC14B66E2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330240; cv=none; b=n2Q6pqSGc7TBNlarJ08i2Q/1qVX0JwtX4USyK6WV2mLZ62K2lslArqFqKdD61kcJWmHRc1nlzJ7IcafyFGD/uX4y5ksPI6Zw2nHFyiwXerKM0kzZ8zyZFWRKDQDm7rxIzhFli5Tfv1YmIHG6uVQP49FFRgjp7PypyA5WaPzNwYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330240; c=relaxed/simple;
	bh=NNkfZMaHqUINHPy4yAyt09M/t54snH42tS/afOsUZmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOrWnfnCqXD2O6JzEtfreJYoPDDnkRWOv58I3V2ZZX61TR5tXOAz12tYkXrWyEGZft13e1MWiiUS+oX9n6/Ldj4DzhK3upiGnJyM8etupX/BDS3EATGfTDMEowjzrl7IUbHauu7fOqMEA9LJjMCFbqWHpge3I9NnfaGaLdmHUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9SIDYkA; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9SIDYkA"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so903680c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792330238; x=1792935038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxNMEUEtD9CHubkx0OvUL7KBqR4421WFDcx17ucFJkk=;
        b=W9SIDYkA5VPWXXIEPz1n0iEPmdtZUE3+KzJoyymXQfS1cDJYHjH5gH6EuiClk2xrdo
         wj6HUhTT7cpB5TtzjPRZm/stqDSG/ZwvTRUasklr6dsS5O5W4WjzVXx/EJCEWE3OKuG8
         FZGK7QmPc+KGg1I0bVniAMnIgLZ+dhHakKOJAdpcFdlp+sY+0PjSeaEA459GySXj/zzn
         qdSBSDBnOPunR70yNezaT6Hm6KWnb3ZLrjSFEQLfk68OJFjJ7iUPK1vP/WW7A5MIKscV
         aSWIGh4r6U2cwuNHPSDKrfeCB1avghcn5WNSE4ul8GOVAJJ8HM12i80rrAseT4yEiPqZ
         VNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792330238; x=1792935038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UxNMEUEtD9CHubkx0OvUL7KBqR4421WFDcx17ucFJkk=;
        b=Z77srWXl503FPodwKsW+a16Cq1TSa3KcWXNMME3XR/VPMLCHbfjx6NOKx2u04AVmLI
         4HXK2bA+Anc7g6bJFzC9nMjFTVW9Lgpdk5rrPV4FfBHka9UPf0VtOovLZOADsSjlDX0F
         C2fTi5aERYX0OviSQ/BTarbMUH0r+h+05wc89lLetoM0YSwuyQ0uwtGPyrM/FdZtYDWx
         Zr5QCT0itxlv+2xwAMP3i9Fw5FMm/RMHbe6l1+qQ6Ac2SmqXBUgsNjIRwEj3fUuFSzic
         Ohw8grgBf1b8BdvW0q5ky6J/MExv/b97VcLXBVp1TpIcco48A5pvDsDbyTJ9rdyYuPGv
         SjFg==
X-Gm-Message-State: AFq9FYJKBl+7o+Vrfh4zGXE8dUgqtkFtfxOlYdp3EbLcfZ2l3AwtTVie
	rrEta1Vlg2fBp6iTgCeLZ0BEzmdfak2gZnd4/Ka1U+RzRS8MGskBpXWcuRA0H7QY
X-Gm-Gg: AYBFou09/wdYPqDv9eEdutjAV8KtW904jyCO4/u04QtVuPofEIXOmiw+ouP9yqmxFeg
	vYI4RbztuSRoYPqrFfsmRYsuE2rwr8FHA+tAmHvNkupnq6sIt1wnBCnMIKHn0GotrdAOYFY7XPb
	6Q/v0hmaFQFHoV2oJEvUfYQrI4kkUru4/hZqFNVayrKAjduk26zknION7Swhkk1/dbMFqiClM+G
	uzUWupA5UT4OSzyUezDM8MynyIDW0e8LWPwJABKTpV0KIn7eVaUoEaThYTccp60iOW5ARWCDqVo
	bWSsJMt13fc2X4E1geAV6NWqzO6k5uirLWqVGat2ZdaG5BpXtEygYOtcFE8lRcCqgsovKar9W1i
	xd4HrIzhHhVkn+iyjgjA11ni0jQRAbkknprALmQiRhnDyljbek6bJhaTlp6wGsg/V16bF7/W6Ie
	f3c1Sfa1V4kqZNhI2Mfc7Tw3qxgmtOA6SmF/SEir1lmralLRR+TNwuQcLaoGICXTMfjS7TxpYH/
	bLtPoqyUl7ZZLnymIk3P5jxn0P8o0KdRuhQVSRfuw==
X-Received: by 2002:a05:701b:2608:b0:185:9384:31b5 with SMTP id a92af1059eb24-18593843236mr6207679c88.45.1792330237788;
        Sun, 18 Oct 2026 06:30:37 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm19879934c88.3.2026.10.18.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:30:37 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 0/2] perf: convert Perl test helpers to Python
Date: Sun, 18 Oct 2026 10:30:30 -0300
Message-ID: <20261018133032.24467-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018125641.23064-1-breno3011alves@gmail.com>
References: <20261018125641.23064-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 changes since v1:
  - Restructure as 2 commits (prefix.py alone; the 4 check_*.py together,
    since their callers are heavily intermingled)
  - Update runner.sh and kselftest/Makefile to invoke/install prefix.py
  - Update Makefile.perf to install *.py (not just *.sh/*.pl)
  - Update all call sites in base_probe/ and base_report/
  - Remove the 5 original .pl files
  - Add trailing newlines to all 5 files (pylint C0304)
  - Fix the check_all_patterns_found commit message:
    TESTLOG_ERR_MSG_MAX_LINES is only handled by check_all_lines_matched

This series converts five Perl test helpers in tools/ to Python 3,
continuing the Perl-to-Python conversion effort for the kernel's
auxiliary scripts.

Each conversion is a faithful 1:1 port: same CLI, same output,
same exit codes. All use only the Python standard library.

The five scripts are:
  - prefix.pl                      -> prefix.py
  - check_all_patterns_found.pl    -> check_all_patterns_found.py
  - check_no_patterns_found.pl     -> check_no_patterns_found.py
  - check_all_lines_matched.pl     -> check_all_lines_matched.py
  - check_errors_whitelisted.pl    -> check_errors_whitelisted.py

All five were verified byte-for-byte identical to their Perl
counterparts on synthetic inputs.

Breno Rodrigues Alves (2):
  perf/kselftest: convert prefix.pl to Python
  perf/tests: convert check_*.pl helpers to Python

Breno Rodrigues Alves (2):
  perf/kselftest: convert prefix.pl to Python
  perf/tests: convert check_*.pl helpers to Python

 tools/perf/Makefile.perf                      |  2 +-
 .../base_probe/test_adding_blacklisted.sh     |  6 +-
 .../shell/base_probe/test_adding_kernel.sh    | 44 +++++++--------
 .../perf/tests/shell/base_probe/test_basic.sh | 12 ++--
 .../shell/base_probe/test_invalid_options.sh  |  4 +-
 tools/perf/tests/shell/base_report/setup.sh   |  4 +-
 .../tests/shell/base_report/test_basic.sh     | 54 +++++++++---------
 .../shell/common/check_all_lines_matched.pl   | 39 -------------
 .../shell/common/check_all_lines_matched.py   | 45 +++++++++++++++
 .../shell/common/check_all_patterns_found.pl  | 34 ------------
 .../shell/common/check_all_patterns_found.py  | 35 ++++++++++++
 .../shell/common/check_errors_whitelisted.pl  | 51 -----------------
 .../shell/common/check_errors_whitelisted.py  | 55 +++++++++++++++++++
 .../shell/common/check_no_patterns_found.pl   | 34 ------------
 .../shell/common/check_no_patterns_found.py   | 35 ++++++++++++
 tools/testing/selftests/Makefile              |  2 +-
 tools/testing/selftests/kselftest/prefix.pl   | 24 --------
 tools/testing/selftests/kselftest/prefix.py   | 24 ++++++++
 tools/testing/selftests/kselftest/runner.sh   |  7 +--
 19 files changed, 260 insertions(+), 251 deletions(-)
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
2.43.0

