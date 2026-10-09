Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048D043712D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541164; cv=none; b=ohoSMEcbhovGuq9QWEZV9dUDAxckjitHKH1ePbiSR/T86h+ouAQsc2YgWUZjhtr9Zho1rfvHVPmpyO9l3C85/CS0Iq5WTv/Y5pcd6H1To8DgkucfonWpey3oz+v7gvB27pWNf+aYgczgZ3zaQCQQt/cZVj8coYPex4x81Lw/Nek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541164; c=relaxed/simple;
	bh=hZhsorpyhrdePy/eS4UBgZy3PoTlUAnavPITsk1OkvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KU5E8qvv+2td6Ydpa1EKzl0Z675MAzKxNEChY9TKh/+KkBfAoV2cTGiRRSmVO4Sn782B2XrANuw+SrjWb+NQwZp2M2gdlq5AoQJF5a/SDu5pyH3spe62jcgeDppxurCD4EX4Dn9dpYYWbzBs39kDxXC/6druLpFZxBYTQaAB1Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com; spf=pass smtp.mailfrom=egicon.com; dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b=BvDBnx8n; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=egicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b="BvDBnx8n"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso37882125e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egicon.com; s=google; t=1791541159; x=1792145959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/IxRkMGThu4h80nLCH1Odchuo85RZD5Hjt36tJqVTTI=;
        b=BvDBnx8nC08RrqlYhZSKKf6LOvcsIv8KTrEy6A2VHCUy73c5jWtJlCNEllUFvT5g87
         m50sq3t4TALfi+YhlZ1Nm5OObhWXWAGUKxAsrOzxaSeepYRKW9NszwXNkMzmcDRXZH+7
         4d1OFKfcsMGqJsJCE5zLvW+8Srf3XhKJf+i842p0gs914TNjlLHhaMFrkH7LGEQ7mAHW
         wsiO8iV/h2sK0H/lUVaX/lubC0dUvXqS58vN//SU+2khTKRtlnO0C9otOhpPlOeWLKgN
         f+Y9q9GuIIF3Mkyg90Z6nsOpknv2Gox9xWXEajsSII4LW99rfrBpIyQ1cfNrTV4Zbk/N
         YAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541159; x=1792145959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IxRkMGThu4h80nLCH1Odchuo85RZD5Hjt36tJqVTTI=;
        b=FMjC6Bcjs9R3PZ9S5PqHmrafiFrBfKuH3LYDsPvDgPTNj0OTo9V5jgngfvWNTup3mC
         xZtOSbCH+xdNhGUFyGGlz3VDvIZLYbr16u9Abp3sdTSTCQhj8CiW398BtYW2niHAe3xf
         q0pwQrPdGustA0bh+E7MHUfAXW4qOxg2kp585BLJEYTI0ckFkUrHownMgqexsYRoBIj3
         fMMCYrD7DT/iAf8P+5lSXIWH31jp813v3+RqMNIuJGwEQO6NIa0l9N0ItpwVb8BJcoke
         GbEk+ODPV5o7Vl5zVKdL16tX/asJXMTusP9cPvMHZ2giHsq72Lcl7RIM/rYpLfnR3Wcg
         X/TA==
X-Forwarded-Encrypted: i=1; AKwUvBxBqsN30hOoD70bIJdQt6pwN7Uzx91Uy3vWiR/4aVLyoOQVhKI4/autM/VyzT7IPCEL+CXln8sGTdzDAYo=@vger.kernel.org
X-Gm-Message-State: AFuF++mA406CiESVa17Yf7RQEN6daBlfZ5LRuM4FY/BFGuIeIpJriAAF
	DAdtqln6MZytHGAbrfhIE3ob6ttte8A/eDXhw41GOIP5I7YfBHnv4IbMByjuf9skCFVXj8wH5eF
	uEdU=
X-Gm-Gg: AYBFou3QAvQSfiXKR6uEli18n2ia5hQOuB8l4jjwxgQvKNeiBjg70cQogWGAXJmoSA5
	ertRNmZjbEJ/6x1gW0m3z37b6wA0lDenh4UQyci1hCJk/7lUkK+ajgtNkXu2CrmEug+6fh/7ImS
	+zmf6FeJT2Wp65lTeS0p1gx6+6dDLmj4IqtzO6kGA9QViOhQNZzP4vy7tNbQ0K0JomiUSXRGw13
	CE8CMZfTrfwM8dyf+pa+yxKBLH1i2Hy8Pu7/RtqZIRsOqXu5gu1IAOxizveCWCBHlsY8RjaR2Xd
	VMWgz2hG7r5ZyAvPtROPfdKlJtGQMhdzzNIGu2LeQBQniBwnIovl+EvRKMjwEugpSgM1iRra8i9
	xYqqZo32y7Q5YfWzKUXd5EWsBOCf+3pb7iwvjAu9dFfdY+TF6hrEfwCEFwuwsRHyqPxCx0kqblK
	9YiOCrg6ErjhTDL/sG0r7ik5YEyIQX2riLiP8vuTcUWBHMVvzMx/BgQujh8D/XhN9NASbK6p18U
	A3q19vPaoCzLJa3f/xbmUln50vtdy7GmsfpuB88pzY4PwnhBnZqbQSiJjPnGJU3
X-Received: by 2002:a05:600c:3494:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a18e4fb31emr24381795e9.34.1791541158877;
        Fri, 09 Oct 2026 03:19:18 -0700 (PDT)
Received: from xpsmax.egicon.com ([37.179.95.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf12bsm3189363f8f.46.2026.10.09.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:19:18 -0700 (PDT)
From: Massimiliano Marretta <massimiliano.marretta@egicon.com>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: keyrings@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Massimiliano Marretta <massimiliano.marretta@egicon.com>
Subject: [PATCH 0/2] Add bulk signing support for PKCS#11 keys
Date: Fri,  9 Oct 2026 12:19:13 +0200
Message-ID: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for signing kernel modules in bulk when the signing
key is stored on a PKCS#11 token.

Currently scripts/sign-file signs one module per invocation. When
the key lives on a PKCS#11 token (e.g. a Nitrokey HSM or a
SmartCard-HSM), every invocation pays a fixed initialization cost
of 25-36 seconds, which dominates the actual signing time. For a
typical build with hundreds of modules this is impractical.

This series adds a '-b' (bulk) option to scripts/sign-file and
teaches the kbuild system to use it automatically when the signing
key is provided as a PKCS#11 URI. The classic one-module-at-a-time
behavior is preserved when the key is a PEM file.

Patch 1/2 also extracts the body of the signing logic into a
dedicated sign_single_file() helper. This is done to keep the
new bulk loop in main() readable and to avoid duplicating the
argument parsing logic. The extracted function contains no
functional changes with respect to the current upstream code.

Measured on a build with 50 modules and the key stored on a
SmartCard-HSM:
  - before: ~24 minutes
  - after:  ~3 min 17 s

Note on checkpatch: the series produces a few "trailing statements
should be on next line" errors on sign-file.c. These come from the
switch statement in main() that is moved within the file by patch
1/2. The affected lines use the exact same style as the current
upstream sources (case 'x': stmt; break;) and are not introduced
by this series.

Massimiliano Marretta (2):
  scripts/sign-file: add bulk module signing support
  kbuild: sign modules in bulk when the signing key is on PKCS#11

 scripts/Makefile.modinst |  43 ++++++++++-
 scripts/sign-file.c      | 159 ++++++++++++++++++++++++---------------
 2 files changed, 142 insertions(+), 60 deletions(-)

-- 
2.43.0

