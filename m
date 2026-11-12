Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504768;
	b=RaWoMhb9qcy46x7J0aJC0IePAO2jTjCEaPW1Ilhk3ZKWLlg00uUlDpV8Di9PN/QuCGrs
	 p6D7kTsdcQzhRK2jA1NBBcuCtldDVBCmNZJFMRy39NLiXaTsQnu5X5aIMv2+bR4t437wV
	 mOvyPbb5WJsTWKwoMaGqA+fJdO9lXwwFQ//xE91tCorXrUJab6nBk3OMp5rTTbAAE0epg
	 iQFsAHllkFT/0IiDQOIGZdAkBy3g05nEPkZVfddOacRAucZr6hucIBYITlVEsvlM1Vbkk
	 fBLT8RZxLguUXc3Nk0OTkHKC8OAI2yi4MCa9AgJDsy/EN1Q7zUzfGsQQ2SJkNvs4nOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2P7y66CJkgPkQFRhmo0DMWA/bXlScTLG8J7BrBYV+lk=;
	b=qrh3FyLeWs2LbHUxpnC3CYSKbcZ+5I/BTrGwMiG5Fd0bPDRwM0zKlD49lWOp8SCD5ZdC
	 7FOFN2pHCGT7l0ojFJkfy88CgaF/+s3k57S2nckvbtewDbQ+OA6Doac9gKoFvJaeLJM5g
	 jaFEP1RwxjU2QuM/Drsn6mlaMiXTC01UX0tlQndlDDAqmTzPYwbymvF7u1a4V4mPa5vY/
	 B3HFUap+3qoaEBWACs1Bhd/eLE9lEIfStfgXtVL6O4jDq6lqhgr6Jo9A/pM0ogbdZmOhM
	 V5BZ1rFVf3KAhXi9+o1HIRJBmRMKNXghKA0a5wLgKuiX3ckk9s1PnOpo3evBr6KTObg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URrmeF5c;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76911606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76911606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URrmeF5c
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so3366603c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504767; x=1795109567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P7y66CJkgPkQFRhmo0DMWA/bXlScTLG8J7BrBYV+lk=;
        b=URrmeF5c0SbsojMvZyjAMSTqt88/Qys43b6EJjLmH5dEEx2zb+zcRfU97xxR6rxy4S
         ORKgajaVa/Q8loV8yZnGJ92Mly42tP4X13cnbGxzgTMf4P5EOKtNSn4aHrlV4nXIowB6
         XRBpg9ehKPLzjnbSXumcW30h7Ow78enYGXc+jY+Npu8EbhMUuoDYN00I1rJWdny41sjl
         n4TKSMhdO9kWOO7bRAqJ/KVYMLY8CguyGwmGVQ4U9kx9cyCXMTSnlrM4ICYUkyH2Y6CZ
         aKqyT8DmJlJ1lipVuZYMFS0aTKN+AVGpXwU8ysYOibKQFCKa8AS9P9auLK65OFWuIT/M
         2V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504767; x=1795109567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2P7y66CJkgPkQFRhmo0DMWA/bXlScTLG8J7BrBYV+lk=;
        b=ZLgVjpEqBd+Z2CjjgjNV2PIhoaJXB7lTmEQsCSP94uV4hR7CuC3DfQdxN+jrKTM4MQ
         W7i/DhT/wtHy8z6eOOiMHOq4z0o6/6HX31pSOtg1w51Sc61SafITjeBDLEYqbNC3fXe1
         7OBqPaBaLLLu3IiugV558YCugn542sm4MPFyPBYqUwMV/WgvatOX+y6s8X9l1Z3qMH2T
         zZLV0cS2XsV3Oqbp0uyKLe6TRwHcY4Z5YkVvNhDO3/gQRiP7dGUoamfUygyUsXaeAmvB
         d1E9iVFjQRUXlmo5qhW8xYVG7+zEW58XtSp0exp7Hv24l+bzLuFhXQ8up6OpsdObOsaT
         gLPA==
X-Forwarded-Encrypted: i=1; AL+hErGRG4WMtgIsbrmm6s+PtHmXV+ehay2O+zMiAgZV2KL5pcXlpn+VJMF/9uTrvuEMJyk4SxgG+PmwOqaBiv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PBEjQ/xJDtYQDH1XvBFuaJs5xZNNfGZunvXtKhYYfyTr5YOB1
	TpB6qx3ZzXZ1CmJpxLl3EujYayFWeI2rhljdP/BtSStVL5CxJToeZD05
X-Gm-Gg: AYBFou1B7ejY+SMcxFZxs8b3YWdIpLzP8Q8hvQ486G4tXfMNqhGFOXjWjWUw1iicYRa
	D9+/Owig6DCvhMcdMT9dwYmbu2309ewRsk8CGjptC6Hrk1Wx3MQiov7np3kB2cBsopTeMR/ihri
	bcJ43uXoD28aUO0N2FsGUjoo3RAeGQvzieyk7d/Auru6LBTVjd+N0+JBBbsLlgHKmJIOVQPHOx+
	tc3frdPLRJ9pY055k0JFCQcOkeUuN64i5spbLdZw8wf0TZHqutjVk0ZctM+HhSHi3SwWWiez1r+
	jXNSSi/ZOpd+iFcsO6kifU63Aq00vEwmT0xv3W0KXWRkXYEokU73+bAo9elPuWGsOOca2bneCJV
	zidl4ETHBhD46SXtdbF7vwBPfRZGngSHeak6/humE+4on7bo+xJhnl7O+uEVyHfsbuFYhkQYbBx
	KYU0aC8+/t+2A1K/+fRcSo6SyMdUBa0Hbjusy5iRmolSoC1uHKQNhaHjSUh2NawpGjMBgSawtJy
	cLqzWxvesJVS+0aQ9B6cvm9/eh8dcW0mib+iWYGBcsPNrnKsEboiy640FsBoQf1vxJvxZEfE+HL
	AsAFbUFQGvQ9Bj0hsppGNwmn6zWRcN8R+xYCZzrOiw==
X-Received: by 2002:a05:701b:4248:10b0:1b3:b455:93db with SMTP id a92af1059eb24-1b503131b06mr213096c88.24.1794504767334;
        Thu, 12 Nov 2026 09:32:47 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm379345c88.6.2026.11.12.09.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:32:44 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v8 0/1] perf jevents: Check the keys of the JSON tables
Date: Thu, 12 Nov 2026 17:32:40 +0000
Message-ID: <20261112173241.197996-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112162823.139419-1-takano32@gmail.com>
References: <20261112162823.139419-1-takano32@gmail.com>
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

v8 of the check.  Two things the review found are fixed, and one is left
alone on purpose.

  - --check takes the directory to check as its own argument, so it no
    longer needs the arch and model the generator takes.  The test calls
    "jevents.py --check <dir>" and nothing else.
  - the test takes the interpreter from PYTHON (python3 by default) and
    exits 2 when it is not there, the same way it does when the generator
    is not installed.

The check itself is unchanged: walk, set difference against the list of 51
keys, print the file that carries the bad key, exit 1.  On today's tree it
reports 19 keys in four tables:

  arch/arm64/ampere/ampereonex/mmu.json    PublicDescrition   16 objects
  arch/x86/amdzen4/cache.json              BriefDescript6ion   1 object
  arch/x86/amdzen5/load-store.json         BriefDescript6ion   1 object
  arch/x86/amdzen6/load-store.json         BriefDescript6ion   1 object

The third point was that the test checks a temporary table and never the
tables in the tree, so a misspelling could come back unnoticed.  That is
right, and it cannot be added yet: the tree still carries the two
misspellings above, and a test that fails as soon as it lands is not one
anyone wants.  Once the patches that fix them are in, the test can run
against the tree as well - I would rather add that as a second step than
bake a list of known-bad files into the test now.

Changes since v7:

  - --check takes the directory itself; arch and model are not needed
  - the test uses PYTHON and exits 2 when the interpreter is missing

TAKANO Mitsuhiro (1):
  perf jevents: Check the keys of the JSON tables

 tools/perf/pmu-events/jevents.py        | 41 +++++++++++++++++++++++++
 tools/perf/tests/shell/jevents_check.sh | 29 +++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_check.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

