Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20243D1712
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322926; cv=none; b=bKk4vwXWTC2VGE9K9mUD7Tfko75L7y4rvrfSK9z76kmAnbKaBaxkmcMyRRgA8XM68+eEDuym1UkD97vk9kj5xdzNn4chc2UZBJQvzgpfHLo0qfQ29UGSop+QdPpckr7RsPva2SDmWKOdf3M5C6P7TFGjMQe1DFEs+e7MJs7h3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322926; c=relaxed/simple;
	bh=jYxkzi1M99riTZ4dqTG8LXwFOW+VvoVXEhHL+Z4cgUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnPn+qVQQ+QRYuK43mRrvOafG5gWuHWl52UUl15ezuXAhpi8lvF3WUCcmVoW9dz3y9jSjlWG5mxKtocDGiudxOJyx5jiccjInf38QewzzRcvpO0FpRrxxrNDG8bwGX1GugqQ6EtWACiN5mfb0RyGnd3RFZEeAxWUNH4VUPFn/+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gstdTdCE; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gstdTdCE"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35829219da8so2561029eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322924; x=1792927724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9e0Qzs0dRtDhzTCGw5Bw76neHmmEUGQs6tHNXNvhyq8=;
        b=gstdTdCEDWYstWOu3CXpUBFVcjUWdU/VsJyjE3f/RX7n6iQP0A7ekWV09Vp+wUnpqt
         lJfEYK4StWDu71rNxAxmsalp4bFJ1bRUkgrw3qYzL3cEI50U+lb2uluLWvrBa5LQc2xh
         aF+i45B+5uZvMe148pRtvV2BvRU/XlZrmtvagO6YTb4lQPp88X31ykzVQkh9RrtsFKse
         fGo1uz1CS9k3FN5nlc2C7k3Vk1WqZLtQ7S66x1eINMVMu2c56bfx62X9IbhI6urQ3QF4
         xZ88UMfW7TjvoDEHTgA3uLXnQxOMklm8mRGoU9QmJnlcd0TpekTYu36oC8XpbfPcmxmG
         vmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322924; x=1792927724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9e0Qzs0dRtDhzTCGw5Bw76neHmmEUGQs6tHNXNvhyq8=;
        b=FIYabRH8V/6mQ6myTGOe8ir0r0PoMCDsHHnECW4FOARiKwCePpeAtBQDOYCmf6d0Xs
         jIINd7PilTyS/ygjG9D+geDOi8eaiGMWBHmiRY3HIHSK3ppsIzKvaqz0Pgt/RQSujx/8
         yxrfje0TISz+zYvi6eVEDjy8nGtc0N0D2a7r39I4xlIvxhXjoJX6dse4wL/Jn9jWi0Vt
         tY2SR6Qr1PqNrI5cow0/YUIRcLhSpLCpWrsKA0lZtR1+P4rdAR2QnxiCJVSdmqkTMjgw
         ZTS1f4qbYcTkEyL6TWwXvKRpfBUUZ7ErtSW6wN4pgfqkZNJi0ygflFRc+UONcDK6fLKf
         WgoA==
X-Gm-Message-State: AFq9FYLXbi233PMHyjgIBUj4jRpgaW5dixg9HFiJmdMmpaTx/9Kt6jEg
	AM6G87lmmD3cjpq9whRXDVIFQ+9/XceZI58i23ssZWhAcL8c66dYkae2aRq3rKiB
X-Gm-Gg: AYBFou2CtFTbw63tMiKjM7bz+ulSz0TnRUlVmQkTy5WZimcwSeG143UNLDJafUCAwYG
	lNuc5kO+pEa+BOadBFr/jD7Lpkh3aoxRxuJ6bQOXDXDUVcV6qV3Ufs85vcUPKasJ3zURX2XDhcz
	5e0M4iSo9tiT74OISJLice7w8Oq2+yKw5l7hnc0PKY6ySS4BTAKaPCKk+jqnWmfUL3MQGLFOruR
	75A5XW2SZsfRHthKl+UHSwtwb0NWcuy7IiMJr7PTq7mSn8uMTbSH1852Qbljub+zDH3h8qGRogB
	0+Pj6p6b6wUV8oHwm/rdcRDIG9iFDYGHZw18unvkE9OekJDZ37SQb9CYYoyHfLDW7z20lxAB7/E
	BxX5x576A782CvOfbRuDcxa9VnflJDdmlacBFyEgV4E02KxPXy2V1DPBRAYFfhe4/AL2uQWp1sl
	fcRM7sDg8AcAYnVRC/fd26H5N4Rz1TBuxnzMgbmD6ULsxJJSCxn6MW5mpfaIIJyd4d6sn8L9bV3
	kvH6lb8VqdU4Wp73h8h3OFuHS0cTKY+4QntVxRHxg==
X-Received: by 2002:a05:7022:ea56:20b0:184:ae11:51c8 with SMTP id a92af1059eb24-184ae11535bmr6914352c88.23.1792322923702;
        Sun, 18 Oct 2026 04:28:43 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm42560779eec.24.2026.10.18.04.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:28:43 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 0/7] scripts: convert remaining Perl utilities in scripts/
Date: Sun, 18 Oct 2026 08:28:31 -0300
Message-ID: <20261018112838.16355-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the last seven Perl utilities in
scripts/ to Python 3. After this series, scripts/ contains
no Perl scripts left: all 17 utilities have been converted
(12 in the previous series, 7 more here).

Each conversion is a faithful 1:1 port: same CLI, same output,
same behavior. All use only the Python standard library.

The seven scripts are:
  - checkstack.pl             -> checkstack.py
  - extract-module-sig.pl     -> extract-module-sig.py
  - extract-sys-certs.pl      -> extract-sys-certs.py
  - headerdep.pl              -> headerdep.py
  - kconfig-sym-check.pl      -> kconfig-sym-check.py
  - parse-maintainers.pl      -> parse-maintainers.py
  - streamline_config.pl      -> streamline_config.py

Five of the seven were verified byte-for-byte identical to
their Perl counterparts. The remaining two (extract-sys-certs,
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

 scripts/checkstack.py         | 143 ++++++++++
 scripts/extract-module-sig.py | 103 ++++++++
 scripts/extract-sys-certs.py  | 132 ++++++++++
 scripts/headerdep.py          | 137 ++++++++++
 scripts/kconfig-sym-check.py  | 177 +++++++++++++
 scripts/parse-maintainers.py  | 136 ++++++++++
 scripts/streamline_config.py  | 475 ++++++++++++++++++++++++++++++++++
 7 files changed, 1303 insertions(+)
 create mode 100755 scripts/checkstack.py
 create mode 100755 scripts/extract-module-sig.py
 create mode 100755 scripts/extract-sys-certs.py
 create mode 100755 scripts/headerdep.py
 create mode 100755 scripts/kconfig-sym-check.py
 create mode 100755 scripts/parse-maintainers.py
 create mode 100755 scripts/streamline_config.py

-- 
2.43.0

