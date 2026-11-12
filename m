Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500908;
	b=Vkl06H3jI4zWVilOk5RvZcWIhGTaf7nj2AAmxjUBsTV0cgiemJzIhwuRBQOezgrIrIdX
	 WwV8EYbiDfKzRvQkKO+zMQlr/KXEjizSEAaMC2pq/SUsjO6YLn0CbphXE9VcewB5aLNL2
	 AdfOFc6JlWYjRbO9ZinN9v4unMNy+3DedgIxXJxzz4srmZKc8jTBzREWq6kmo9R6gUAy5
	 53D4i1v7QsUSeKTts/aDueD0HUZavEO3PRdTW0VM+EVGP1xEvkwfnIhaJip0Con+rvXbf
	 HrnV2OqoJl+iHfH+2H7/9NhD1rWZGTi834E125ubkpUNOns8oE1E7UpQkQ3Dl2EMAAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hrS1i2uptDqi4qx6tpsDZbcAZjX5RWLF9/OmhrBxonk=;
	b=MpMgsju0mPJesQb46gDrTRp09Dxx3TgoRNYwh6Q4tK4fFIu3JABixoFfzrgVDgaXuXaO
	 x/R61hmEUFvQYk7rhl28kt49HnmpUfZncQgIoA34CW6ZzM+UV0Y/2vFAsmnsQf+Z5yLtD
	 T5o1ogdcKdoEDmiBUZpoWBHwxWdkss2K5FvCQK2GDRaHlNXPpx+Fbn2ZFqIZDZ0sTbepL
	 hdxF1fwhmMlOuB5yaSYA6DSC9nGjRk2hhd3VbnulXHS0tT53AJ18GedOEeN18RoS7Ndsi
	 0RaYkjeDY+FD4JJVO8sX5SXifNlU4aStjWQnQ81fZzwoxeTMy0Z2cheOURskwrQKT2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNWgrxCr;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA6606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03BA6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNWgrxCr
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so65551eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500907; x=1795105707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrS1i2uptDqi4qx6tpsDZbcAZjX5RWLF9/OmhrBxonk=;
        b=bNWgrxCrRv44X/NYFSwO19+St8cxtP9lgEFdumIL95RtoWACaMRU7T2Ato/XmuawoJ
         FOwyIWIV1T8saZbjTZ3rppvgmddU2r5D937ouVZIR6RrivK1rLE3zUd1sjxrhUxXB6Au
         cOBxE8olWi5DhxbP108K3D6ENux1C7shTR9sqr4QNrSXkFB64oKgH84cMHWhcLkH0A/C
         89EGFCgRkk25k25tamIy/euHZyzTvja2mHCuRvY7q72WaDtxI/b6n8DcMyjOCChA+pdj
         l6SiNrq/XppCJ9o8gQ4cFEM9U7n9cfhlEw7SXd3t4ZOD0JjObAmIcnIHFpDHHEIWThR8
         X/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500907; x=1795105707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrS1i2uptDqi4qx6tpsDZbcAZjX5RWLF9/OmhrBxonk=;
        b=vgAMQ56m6ji4qn3xS3/buZA+YgefSOndcVeewQwX5G1SbzD12tLXWyQEwkhPWx4SDX
         ThvIugeRe9OXeLdhYKmecdx2NStEzKUYFaKhvl2sMniY93VZ3eg0XyIG7Pt1v0cJRTEs
         a+LRY3fNZUwkOVAo9SQFXE7U0IPPlLTjJPfQEQWv6NWmmFajzWWOfT5VbOG2kiFAFeHw
         sbze98p2vPB0rbi/6Tseni9rISfeAJLF2LZiDiMH0VUygZSxpnKh6GXwjEuilNgbhESh
         ZFe1w4yu7s4SiCzzEkV1mTF1AKMbzoik6U5sgnHQ25OR0I0Z9uXrAsP3dgBK5pj4YPl4
         /+pQ==
X-Forwarded-Encrypted: i=1; AL+hErFmkfoWtG4fogjGuOc4xVNSvMbH/BCjsINCy5rP8TfnaxdpF/8G8smOhuvGXPWKzQVR0keUquciHECUsZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ae/PQ/ce8HOZurZXzjtMP23Te6qdvGeS6WNx9k/UFS6ATkmhf
	Dfc7Qe8tDkwlT62WbCpWqPi3DWOXh7+Edm+BCOrrZylsYvEZn+pTyeT9
X-Gm-Gg: AYBFou3e7FqRO2zkOr8uR3U/JcIo/0QvAtLGX0gvHk62Ld5XV9eb04OYeWd5wG0wCb2
	OVyd6baKIWqdtbClS0zQKCde0mX6rax2a3rIyPKqSa0tR95dbX1j+XYDUXh9FbD0saRT0ikue6X
	rpdX4G7H4QaH5Zx5Q/G/rovIShpdfpXIOwivEUlLAH0W+sLHv/6ZrOMpYrfZZFI81/tc1tt3+zj
	l9Fb5ZfepK6ge9qLXi2gLZqwrIummweNKnfivwHC+27qEn2j9V9TOzghIHMu9xez3LF6voUMWG5
	+R245BHViytrQWIm2XvQW+FfaB9ghgstPOKLGksPLh243kwi6v3XrO9jsN9W/M9Io/ob6R5WnSA
	1gu1G7gUDl+2UWoK0+vkRCzniaEYio+fwRssjdnVhivw15uyZe35+0M4gRHg0q7+0wNNlIBC8gM
	XqRvy9rzUciCiiPm9VxR0jyMc/cGqfxrBtHVWFyz/bnAYMq8vsX1dUg0qpPz9ggpGheVJFUNg9x
	h5GdBYPR28WI05vwQxisLeO5cZHXdL5JY9fZqt0kFpG3U6yIrjyFMxmSyaAySSCy9pem3DCgbFz
	3ulCwnbZITUK5p8ZA+XCWA==
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr5812930eec.38.1794500906823;
        Thu, 12 Nov 2026 08:28:26 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37926251a09sm705997eec.23.2026.11.12.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:28:26 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v7 0/1] perf jevents: Check the keys of the JSON tables
Date: Thu, 12 Nov 2026 16:28:22 +0000
Message-ID: <20261112162823.139419-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111150920.2383157-1-takano32@gmail.com>
References: <20261111150920.2383157-1-takano32@gmail.com>
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

This is the check from v6 with everything that was not the check taken out,
as James asked.  What is left is the walk, the set difference against the
fixed list, and the file the object is in:

  - no "make check-jevents" target; it runs as a perf test only
  - no arch filter, no summary line, no handling of a table that holds a
    single object, no special case for files that cannot be read
  - the check is 14 lines and the list of 51 keys is 13, and the two-line
    shell wrapper exists only because perf test finds tests by file name;
    it is not part of the check

Patches 1 and 2 of v6 are dropped, so this is one patch: the check alone.
The command line still takes arch and model the way the generator does, and
the check ignores them.

On today's tree it reports 19 keys in four tables and exits 1:

  arch/arm64/ampere/ampereonex/mmu.json    PublicDescrition   16 objects
  arch/x86/amdzen4/cache.json              BriefDescript6ion   1 object
  arch/x86/amdzen5/load-store.json         BriefDescript6ion   1 object
  arch/x86/amdzen6/load-store.json         BriefDescript6ion   1 object

Both spellings are being fixed by patches already posted, so the check goes
green once those land.  The metricgroups.json files hold a dictionary keyed
by group name and are skipped by file name; without that every character of
every group name is reported.

Changes since v6:

  - one patch instead of three; patches 1 and 2 are dropped
  - the check reports the file and the key and nothing else

TAKANO Mitsuhiro (1):
  perf jevents: Check the keys of the JSON tables

 tools/perf/pmu-events/jevents.py        | 38 +++++++++++++++++++++++++
 tools/perf/tests/shell/jevents_check.sh | 24 ++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

