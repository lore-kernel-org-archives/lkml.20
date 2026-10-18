Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72F2765E2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321607; cv=none; b=B4m3FJbjQtKKx5U945DJYlfsIDciw5gRTq52nSbZ6AhMel0sSvhn4i6RPsfhYaABVuHm91V1Yb+7GUiClFJexV+syLhdHKBh5xnkf49vfNSbHm2VLn3MfxNIN7IPi3OJVkTAiuUAWcfVFUtfF06Xvaiv1K/MRMQssG3YxsiChLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321607; c=relaxed/simple;
	bh=f3B3iNW5Jyz48dyQPAFvEgnbdMtc0lDbUiZ7uRdYGfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oa+wr0KGKiaK8o/V7IPYnnmZlYk3J/zttnfot7Lbm+q5dEzYyZ4LQ65pi/0HEQX6XKX9y3Y69i+koZmCEakWq8N3lcClfcxbcultewpkIAkHrFN9QULvLlpisyDDM/Fq3j5jeo5se8i5HPpp/Iyg6124ed0q/nGKnCS/iWX7zpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ9Azgdl; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ9Azgdl"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so3134757eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321605; x=1792926405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O49igHudPgI9v3/i9aS7QF2TqZJHWwnC2xXfiNP4KC8=;
        b=YQ9AzgdlXdF8NI4i/66fFUsG78V+0Oxq+KtEgzTz76EepMW5xSA8a0Vx7TQsIXJ5Yw
         +QGKqTMZxA+EzURSBRQLZ3xiAv8muje7EPYM7dGlDvimL0m1+1yPpkcJZAXaMV/UWh9/
         90AZ6YUIGfQGrFagB876/g4VhHr+2TcwmZQCiABSgTj+4HNqCVe7NUeUCI5OIJ6eKAht
         6VSUxoanHVTHaIgjDUjrjvumSKr5+ugjZuEFeYoTCJQIZpMBbI5GXnBQZ8Qq3x7O3cjG
         NKtfbkXPMyEoJDSdAxW3O6Uzhsbl+g7KIAYaQZK+nZ6QR0c1NJf7lvpwVeJAqrDiRGvW
         Jwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321605; x=1792926405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O49igHudPgI9v3/i9aS7QF2TqZJHWwnC2xXfiNP4KC8=;
        b=LjFke45PInX0mtPGrvp7+XsYtco2v9mlPbuoVutMCeQV8J8ax2T/OdzhGUikifxLCR
         GNjwU1VBEyXYGfbxPtHO2lRPmHR/yENzUmJzK91VM2SqHFaQz+0Gbb4gdkqs18WLrHjv
         +Bn80CUXvNQI0ZBABpl+3o7+e+GjBTjxKAqIWFakj5qe/M0Gxj7TluJyctkaXgzrogUR
         dieDI1vjQzBMTrlFuEbiSgapYnxXbEhWWffAFijPDFJfPO+fhm4X1SLXPLRZ67pdGKdl
         hgoKGuDt1qji9niClm4gyMgl58X+ilsVyZ4NWLKfQQfnF3s8hDL0W3cOvJZQCEkjANQO
         5MBw==
X-Gm-Message-State: AFq9FYKYhRnt9ddykRXc7idjcuKTWxMctcs7NZrXq9VQBjiNXsXzSFOV
	dfBtp4YSDBDDJSIv2g8E98ZPCC+d0yezJeeMsa2iLSVO+TwyxprvR70GQNAMtYwU
X-Gm-Gg: AYBFou1MfDujgdzmmp5ARSdP70qlA+2w6YAnc62cgpSSa/iV1YN8stYMZgNQNM5CF9V
	r554fktyIY+TACnhlLgL/uoz+cemsaz0vEXgCTsDzXsBVdOA4TNngq1wwBt9tGBW7hgxwi8QR90
	B17t8nznJr0x8Cbxy8sYBkNeAMI7AbsdoJ2/H8u+/RMY2Ea99vg5b3b+84Mxao8IVNoBNrAaJaX
	0SyPrXhkdRcjhh3P2vMGbV8xoKacBwi3VWkV5y5JE/ywNXAcrjqldgLxvQEvyLJRAZ5bm89FMoC
	6xA3VNNK8x7ZQ0SYU0RXbX9nDgpiHPBgx5LhvS9JeDNgiyZ6haiQsICScRMpBFS4olZoXFwctTX
	2L1GzjdC1osU6mnZLBns6xKY5OJHa6JqbHL0QMDGrzGTYoPdaP2UKHEbrl9W3phPdUiI8oURms9
	LhASSudgyzk+lDfrTY8mysMpVc0ZrCHO0x2oHYDKQc9ZWClKD7V0MBmOAp5SD+/7z6hsLvA3gwK
	/UD/MOLZ/vv3WB1QGOyYxGGxfM0PyG7GThSpaWk6IIKSTE5kRSm
X-Received: by 2002:a05:693c:4090:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-361a146def6mr8684834eec.7.1792321604948;
        Sun, 18 Oct 2026 04:06:44 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28647706eec.3.2026.10.18.04.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:44 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 0/7] scripts: convert seven more Perl utilities to Python
Date: Sun, 18 Oct 2026 08:06:31 -0300
Message-ID: <20261018110638.9947-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts seven more Perl utilities in scripts/ to
Python 3, following the checkpatch.py + bootgraph.py +
checkincludes.py + markup_oops.py + profile2linkerlist.py
series already submitted.

Each conversion is a faithful 1:1 port: same CLI, same output,
same behavior. All use only the Python standard library.

The seven scripts are:
  - checkdeclares.pl          -> checkdeclares.py
  - checkversion.pl           -> checkversion.py
  - extract_xc3028.pl         -> extract_xc3028.py
  - generate_initcall_order.pl -> generate_initcall_order.py
  - get_maintainer.pl         -> get_maintainer.py
  - leaking_addresses.pl      -> leaking_addresses.py
  - recordmcount.pl           -> recordmcount.py

Verified byte-for-byte identical to the Perl versions for the
scripts that have deterministic output. recordmcount.py tested
for x86_64 and arm64.

Not implemented in get_maintainer.py: --interactive, --self-test,
--git-blame. These can be added in follow-up patches.

Breno Rodrigues Alves (7):
  scripts: convert checkdeclares.pl to Python
  scripts: convert checkversion.pl to Python
  scripts: convert extract_xc3028.pl to Python
  scripts: convert generate_initcall_order.pl to Python
  scripts: convert get_maintainer.pl to Python
  scripts: convert leaking_addresses.pl to Python
  scripts: convert recordmcount.pl to Python

-- 
2.43.0

