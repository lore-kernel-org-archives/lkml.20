Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0A4B923B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331851; cv=none; b=cfRy/a4PT+Zm0DLSBcuqJRm9x5VTikKooZONTMvj0riGaoi7us5S4xrfTk61J/ks3S7LcNjl7RGcMJonoj7+xQik3C4EHNrAXsV1VynXTRDBRkGMvmzMMYjiKX3YwC5YhZFiPvv/mUfZ/D7q05Dy69aYHOB6LXPL4iY8A8UvDLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331851; c=relaxed/simple;
	bh=A7dnEurpmsMJrogzGiByKhK0eaxOyvtrHhVKPjxCfNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/Y4mr8ctYNJORW0TmJg2WmShEvn2+s8ZU70qaOXtvD67S9GmjQCHBjeQmYVP+1HWqKpm4f2FIa787Q1AmeHLQudQ1LgA3gCDg3ZRKdFNERJnfD7CjbkUCz0/rU3lNYv/Nv/g/445YaakQ2KVBWV3eiQIQE6GvpgkyMHJ/FP+Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C20VzjB9; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C20VzjB9"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f036b17easo2862689eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331849; x=1792936649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krhRdyaEre/HaNOCgJvlHsz7VBF/iToM4L7j7S7abSw=;
        b=C20VzjB9fnNPI9KUq0pS4ZFIzC6essA5jgyMx6ef5hRbOJgOiqYNemCvsj53M7KjYZ
         v9eJwfqzz9MEE1iPfTd+2yEgLljPulj0gvznHWENjtm3vC9/njQRV7EYz3DeBW88SmdM
         jCdpDMAccScK4LktnRdN4tVf/lygQsW6u5o8Kf3cY5X7IKIn3QMjstpxtGtIbg/0t+Bb
         qH5zlj0hWZGzGEKUW4/A8RMIWhYDaokKpfPeTiq2klG5Lz4eS5atZ/w/Nc/RgKFhPDTk
         KXVVO5DmxAN/wIitWh/TpHnv505TCH/qCjOhb0Wbq1j8QCG1QzNDKzUe/FSAu9rLL9M6
         N/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331849; x=1792936649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krhRdyaEre/HaNOCgJvlHsz7VBF/iToM4L7j7S7abSw=;
        b=a+HzxHRKq8bi+NNzTq1E9KWNQY8TAPqMoUEUfo8gYpnbulg6C+JWgJQSuWOx/1vY1t
         hNTooIIWZvKkLK5krh4+lnZYIp37IIBC8MMGR+TscInY3XCZLT/OssDMXSjmdZgorgQc
         y0cbiL2rxkOmbiBmh8ijx5lhx8XJZkxMdWaQCQRkEPVJjUsxydHeiDVDHD1p6+zv6xhw
         fGwsPWAOyHJ/gvarR8GQTNPNyVlDbQPam5o+CkNwB2FYOjUdqQ2Qxwk7nP3rKy566t/C
         DTxaJS6fRFDDFOb5bHmnMxKF91s64bEvP4mdIIhx53XU8z8VTcAdMR4iUW1Z2wr0GRl0
         O3TQ==
X-Gm-Message-State: AFq9FYJn2Xt8jvL/LI1Jjt0EWZghoqI1XoqZXQET7UQRQs8c7xiOwedb
	cilQdDPZHAJbpoKRnyqnJT/tIR5KQ4fqefsGohaPfCPyaTBMXgh2+wcILG/ITO6d
X-Gm-Gg: AYBFou3GqMuQJsUWXgYTtcwtvcIf+V2vIGDJYNIK+OAJkf3sBirKwV/DDeMDauY9lZQ
	UZMZ5xsKF7HVC3gvJv7vDFM+7FqfYMeXg60mZoGklFWKLAt8cTUvmWO+sMVgFMJX0w7xnO8uw9Z
	SXDvgzj+qW9hHWLjKg+BQC5lRkJg1vY4moZ7RXD0KqWwMV7R7XS1omGE1g5q2GyeYThW2KraTKS
	qjamkU5nsddgmdKCLXKd99G4fgG4QJ4dWrrmGumA24jkK297tDWqtVayxcpLI5pgiDlAaszB0DK
	2gdZjGKnDdajPSPpPWl2YeICkqiLmifLQbFV88AFcJeeU/vTkiWjGwq6W3SZqqYtyQrZknbT5fR
	0dPC4M648A8wb/FgxhrIPt9eZIJTTBij/kn6XNom9CrH1tF6FiuoquqD04hBBnMeJhInCHaTiYP
	wXVHabg/HE42dX1lO+Ef4CiWisbQV+yUsFPRALs9P65SgOR3KWx0qIYD73x9seqos6/bl8Jzo+x
	xVLQpJ2T1uaBFSKCqSC0YyZl0njx80d7Ki3xijwrw==
X-Received: by 2002:a05:693c:42d4:b0:358:2e30:8e5 with SMTP id 5a478bee46e88-3619e54286cmr7182820eec.1.1792331848725;
        Sun, 18 Oct 2026 06:57:28 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm27653533eec.6.2026.10.18.06.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:57:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 0/7] scripts: convert remaining Perl utilities in scripts/
Date: Sun, 18 Oct 2026 10:57:15 -0300
Message-ID: <20261018135722.27410-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018112838.16355-1-breno3011alves@gmail.com>
References: <20261018112838.16355-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 changes since v1:
  - Fix the location of two converted scripts: kconfig-sym-check.py
    and streamline_config.py belong in scripts/kconfig/, not in
    scripts/ root, to match the path of their original .pl files.
    Both are now added at the correct path from the start.

This series converts the last seven Perl utilities in scripts/ to
Python 3. After this series, scripts/ contains no remaining Perl
utilities pending conversion (the original .pl files are kept for
coexistence, matching the pattern of the earlier conversions).

Each conversion is a faithful 1:1 port: same CLI, same output,
same behavior. All use only the Python standard library.

The seven scripts are:
  - checkstack.pl             -> checkstack.py
  - extract-module-sig.pl     -> extract-module-sig.py
  - extract-sys-certs.pl      -> extract-sys-certs.py
  - headerdep.pl              -> headerdep.py
  - kconfig-sym-check.pl      -> scripts/kconfig/kconfig-sym-check.py
  - parse-maintainers.pl      -> parse-maintainers.py
  - streamline_config.pl      -> scripts/kconfig/streamline_config.py

Five of the seven were verified byte-for-byte identical to their
Perl counterparts. The remaining two (extract-sys-certs,
streamline_config) depend on build artifacts (vmlinux, .config)
and are 1:1 ports of the Perl logic.

Breno Rodrigues Alves (7):
  scripts: convert checkstack.pl to Python
  scripts: convert extract-module-sig.pl to Python
  scripts: convert extract-sys-certs.pl to Python
  scripts: convert headerdep.pl to Python
  scripts: convert kconfig-sym-check.pl to Python
  scripts: convert parse-maintainers.pl to Python
  scripts: convert streamline_config.pl to Python

Breno Rodrigues Alves (7):
  scripts: convert checkstack.pl to Python
  scripts: convert extract-module-sig.pl to Python
  scripts: convert extract-sys-certs.pl to Python
  scripts: convert headerdep.pl to Python
  scripts: convert kconfig-sym-check.pl to Python
  scripts: convert parse-maintainers.pl to Python
  scripts: convert streamline_config.pl to Python

 scripts/checkstack.py                | 143 ++++++++
 scripts/extract-module-sig.py        | 103 ++++++
 scripts/extract-sys-certs.py         | 132 ++++++++
 scripts/headerdep.py                 | 137 ++++++++
 scripts/kconfig/kconfig-sym-check.py | 177 ++++++++++
 scripts/kconfig/streamline_config.py | 475 +++++++++++++++++++++++++++
 scripts/parse-maintainers.py         | 136 ++++++++
 7 files changed, 1303 insertions(+)
 create mode 100755 scripts/checkstack.py
 create mode 100755 scripts/extract-module-sig.py
 create mode 100755 scripts/extract-sys-certs.py
 create mode 100755 scripts/headerdep.py
 create mode 100755 scripts/kconfig/kconfig-sym-check.py
 create mode 100755 scripts/kconfig/streamline_config.py
 create mode 100755 scripts/parse-maintainers.py

-- 
2.43.0

