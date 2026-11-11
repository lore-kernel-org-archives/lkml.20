Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439534;
	b=mkWqWGkhIqy94MDxZmcV4nq5N1L71aPYJldq8ZVQcTcUiphidOt6SC3y6qZ4LDeHmYDT
	 Pk+k/PujCIHexqcr5wThpDAnYqNqUSlu8ezFs678z6Xr5s/B1sSCh7oC7pNEs1nKg+EPC
	 318c1vXu0wznm1ZmogRyM5t2oSeSCL1vS/+5XF1moa8g9YKsqDSw5qmz6+9PE6iID55le
	 1mJecW6gQ8FVDlHzrbh4aKCqoudXcy36VpB7V/T3HLCfWFuj6xZiTPrMhT42rCwMVOD2I
	 i+xIpVcc94IGXU9nSm24sfl6tOjb4eaYLt9sX27QCfA2DCO0SS0yb2rUJEbFjn09ypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PG+feDIjqnRZOjMW0RwMSkFCn75KuYBbqVAgxpF/4fM=;
	b=kRCH9aWnsFaGpfsDBWHhms3Yv++1HK1wXEsD230gVtRLM2+NPdhYN6wJSVUSZNHShxfG
	 EWRu8do8FuKcGYeoYBI5rVOHFDo9glA5dacPUNkNpuTJYXOMtGPqDbE7pH2v/VYgdikc0
	 /3ZaCSSYtSgJk0Z+gyirWofYkkEtVPuh81Pxse2LJ3HmziJbhWRwI4SUPolDsEHgG9vqP
	 2/ZD4d4QSOnF2BL19Awc9/KIt1OoJGcbs4UDoPvOS9eayBmyXBwsnc9tkBN22ce1ZONFC
	 H961jZG6Io3CGDQsEMYIBuibZGsUamsv71Xb/rzcSK/uuVM89nCRr5YAgctqYtVUoHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaDVMzvf;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaDVMzvf
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3712b6d9843so3578662eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439533; x=1795044333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PG+feDIjqnRZOjMW0RwMSkFCn75KuYBbqVAgxpF/4fM=;
        b=ZaDVMzvfM7ghi54DhXjuMpU9nEP/CmgcffNM+h+NOANu4Y3o4DWQZadCjPiBvITZE1
         e0tf9YzEViXcSWytLH7a7ZkwzD2Y1Cx+pumDK0y17gTYcI8FygE4GOiMne/MgceA9qNc
         Oo1l4BsmA6upMajKsUR2x3Md5wefOg34RxUtn6TliwQQTpiq9yuYXcyM2hJWSwcmEq4N
         phywvMWeV7NUJ8anZsxj0lftbtPlzLPULORc0OQFzjMId5ahHeGvj+enAieu55KsNDRM
         yiQpfeRWuQvsWKXuXsFZxEFapr/Z/xDq8DFyl6LamcqBkKTq6QTIGVjcVp6JLrnR2Fqu
         kp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439533; x=1795044333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PG+feDIjqnRZOjMW0RwMSkFCn75KuYBbqVAgxpF/4fM=;
        b=1RcMy/XktQcAbiRAcXwNpMEcw2tDKQkRwu9DYHk8B/J6oykoF5IEk+owJvYxloem+a
         f5WbfwSOdKX9tz0BjLhGQab+Z1oibrf/wfmvEjWKiO9sZlfRgHH4IFBhHmAQ1o96BEUJ
         VOjH3WX5Rx9C0/D94DqsBY7kOp3awDXpdoTiu09vJcKmSLusOjYVOQrYYnuv3zP6gpVP
         qOlsCIoHH6h0gmvbImpASE6ESQaY9w62bR68hQAk52Dl+viiwHzJsRpbMEC/aWoa5lAJ
         rP8Bkbc6DLkTPOXoDBvAs9MPJVgoQaKz8aMi9gnUzTJvnvx0mRAcom5z/LPcBrLZ2u+G
         /5kw==
X-Forwarded-Encrypted: i=1; AL+hErGIYz2/zqFEzvlyNmDNLD9Yp+IV9gKcYMP5pg6CQ8Bg2QXXXdqznUCMfmakxThp5dtcgqL6tgctR9ORFQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gNbUMBfKJyVf6jyVEETbsPz17v93Y+njbLhhDn4SOXgJN8XEE
	jZ/0LCGYxseE9+duDHluY7DqN1keBXxYMx0LNDfVNRpq1t59clQoMwpk9bwNnvrw
X-Gm-Gg: AYBFou2Upnakf5mJbDRI9IpNAuSpxxZ5pOk8A4Iyn15P1PU5WSBzsP2QVDFXl5hYj92
	mhxbwKltwGihOw+Bw9s55rwpvAu+byRV2Wm8TKBuMLBaS5dZSXISJTxuRy1VmNS7S61G/kXS2w6
	rjwx3zRWITmvDqF7kIqgqz9dvTufQErrBbMl+sy9DLeySnSLfwMmFD96opiFJ6ccdh9XsdstxRW
	I1FoJK9WU4xwMwE8iQVzoYb5g6MVc2b2u0Yhgi3K45ka/Jd4oncRwgBjlE/uUZ1dzmOas0xVygR
	BavumInHVvizUbAGg/MaHcj8LjlGGwzwQa4QfyBWyzRZt+onxeSC8QbyKqQ1lDw4U4n3llJh5SJ
	o7vPmTZ3TfogjOeyl7uenYkmnpqbljRAIfEcmVD5W080gHnhC+DuFCJ2Y8vgAMYgWYIOHRiAgzW
	7A+LVHNO43OQKOjQZvo685IGXn5emTts/n4R31jGP7f/Hgr1ol09I9wWJpGyaTYQRoxHLJ6crJe
	o2r2nd2RtgrdF2HoQpK0ZWlOILCKs6m65D/+K49gZKEL4UkyTz19gmHH21sRBfDFPSp2W20BGnw
	knIzMgDh0kkmKuiiGeDHkrqep2eqYvHgf174ZDUAVg==
X-Received: by 2002:a05:7301:77c7:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-376ce6aa7b1mr3264031eec.36.1794439533137;
        Wed, 11 Nov 2026 15:25:33 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm22626946eec.26.2026.11.11.15.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:25:32 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH 0/2] EDAC/i5000: Fix the slot loop and re-enable the driver
Date: Wed, 11 Nov 2026 15:25:27 -0800
Message-ID: <20261111232529.407154-1-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
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

In 2022 i5000_edac was marked BROKEN instead of taking Aristeu's fix for
an out-of-bounds read in i5000_init_csrows(). Nobody had the hardware to
check that the driver handles both single- and dual-ranked DIMMs [1].

I tested on an HP xw8400 (5000X, four channels) with v7.4-rc2, KASAN,
UBSAN bounds and EDAC debug. Without patch 1, UBSAN reports at driver
load:

  UBSAN: array-index-out-of-bounds in drivers/edac/i5000_edac.c:959:20
  index 4 is out of range for type 'u16 [4]'

and the same at line 961. With it there are no reports, and all eight
slots (4 x 2 GB 2Rx4 in slot 0, 4 x 512 MB 1Rx8 in slot 1, both branches)
show up at the right branch/channel/slot with the right size and rank,
10240 MB in total. On 7.2.14 the same holds, also with 4 x 1 GB 2Rx8 in
slot 1 (12288 MB). A two-pass memtester run with the driver polling (two
DIMMs) saw no errors.

Not tested: two-channel boards (5000V/5000Z) and error reporting, as no
memory errors occurred.

Patch 1 is Aristeu's patch as posted, plus my tags. Patch 2 reverts the
BROKEN marking.

6.1, 5.15 and 5.10 do not have the BROKEN marking, so the out-of-bounds
read is live there. Patch 1 applies to them as is.

Analysis and test kernels were prepared with LLM help; the tests ran on my
hardware.

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Andrew Luebke (1):
  Revert "EDAC/i5000: Mark as BROKEN"

Aristeu Rozanski (1):
  i5000_edac: fix slot number passed to determine_mtr()

 drivers/edac/Kconfig      | 1 -
 drivers/edac/i5000_edac.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

