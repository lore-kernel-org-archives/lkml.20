Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915264;
	b=o2h+rAZw7xhJYHjRfArIWZy/gARXEhgKjYp3y0FCeUmmkVBrPTOlpwaxAKJaPog/qiRE
	 GRgeA90n6/rN3yHUmxE75c9ZdzLO3yLpJ706PKpkKoifrfzEK0eUEmQlB3KH8abtRuu9J
	 WdaXxDNi5t4EhzwATl13M3ixsHF4QwHfPt6Ej1UAoeA63DTxAIOrPxAL5a1nrZfg56wd0
	 554Qudcf2RJb4RwserBn5vVRdcswn2q9yBeWej9sRG+h270aXoxzpD2RBMgbtSHDKsRkC
	 V55aKzuQXhbSNi4TblCDxb53D3Mx9syxjEyFCZMkN31lrl6sO436iXKrLaVDj87G7Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TrUPSXRCxYG5OrHwdlfM/ahh/Z1XsoY0eQpsHzAAYP8=;
	b=rrBSIM1sbv4T1x9ty2WAm+hv+19zuAFFF37VbWjPiDOs6A1/D8FsbiPPGSAadMWlABPI
	 Eu4Whg5zFDuqfKmOMo8xd3tCmZjWeXy2zRRUWiVd8YhOzwzQjMXEj5/MdFFRb7zJwYx46
	 n4ZWRNr6X16bFy8XhayR5zeJXIBgX8nNSoX0w6MuaPgP3KjNkXEVYYJ0Ra/qnSvG5yMeZ
	 U4SLds+Gdwqo9fu4SqLuHMu0tptJhistCYUTaJQC5Aqaw0CKxtuJsj0tUsl51Q17uqx/1
	 OGzU1sra073SnAa2O1SGKtIxBAEAFK+LPqKDjHWhSY1V5r8XdL6Anm5SDnk2MgyC4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=BFMhJH+T;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759EA606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=BFMhJH+T
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so229939eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793915263; x=1794520063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrUPSXRCxYG5OrHwdlfM/ahh/Z1XsoY0eQpsHzAAYP8=;
        b=BFMhJH+T6eP0OqS3i4JHrj8Jn0mifzZT8dg1tp/DUembJfTBmxrsdH79T4M5FEMvKs
         dMmrqd0H0hWVVCWa2Bc6PS+rm6EkQ7iB7cs3n5LhHeYIEmNSCtdFW7rXCVP9W8TPD3W/
         zEqpxMhgCGrsnyA8c2RTCHvfivSibjU21wR+fGM0CaP/O79O8HUXpdSk/kch5VduHebw
         +elKQCRJwhSztOHJwG5QP0z0HAHVxqxD0hWc7WWATS3fAHH9X9MX44PtFEHJZQgNciV3
         qXIa2oZPUJkZW0ta8xZwoH+5nzbi7RrMTWc/2t7RPFoxAZlMqqfOp+7Src0sgx//c7QR
         nOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915263; x=1794520063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrUPSXRCxYG5OrHwdlfM/ahh/Z1XsoY0eQpsHzAAYP8=;
        b=xGNm6K3bbVz2LmnMXs4JlYT3O4DMKPuPzaODoCa+BdGcyG99Q2xDFz2u03+dnE+KQW
         U2JSPyX6+ghnpkAyHteGRyTu/NgnnEHXOAmSruVvdaTonnRfdY6DJdvIMbDmtNtIrACn
         7XLDJ25x8C/TTnDb/FrdtKG08N+6T1YKzpB3t6jMXLTLzV+LgkQDYbSiubVPjM0WGDgP
         zw+GZVZ/o9flb4AmsDTHBnMIHr40VkuF2BdYLh69w+xb68gO3mqZZp3pU8yj3NHGQf+P
         UAhNNHaCvbnpQ+E9/xYohc5WXFSY+GE8AzpUAUT84+4uCSqOei9/xtw120wcwbHYzdpJ
         EI0g==
X-Forwarded-Encrypted: i=1; AKwUvByQTWzvgW/tgDvh54TsRLyX/eTnwNhRF7qcPbWHdLdoWS3ySFuLFwsXqeUQugqi3gR9Rf2elc1UBuORUoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9san4GG+Ijc2CUY3jXzF2yOGKBDRhTP+N7Cb+UIZbE8O1iS5SI
	tCvZy52m0poFUqlhjk9LCIEKxurrvkjBzzeeoH52RX2iNoxQjDbKJFPNEZWeIWh04cCKySsq83i
	9K3yHpv/c
X-Gm-Gg: AYBFou20Zx/hPT4VQd4JtkvJf0VItGW51S178t3ZKnk+w/vnr9ZiAJXDiZtB+JnqVoH
	zLEGvdorc0y9KF4tzlpm7U6jqtG+tg8IMwrRksY8O+VwxARP95k9em7zPAqRz0SCddqoFsf/4zm
	qd3PAw18pJq7TS+CSscy14IXALM0xkf1v+s8NZAYrR5Un2Bjfxmeg8CBWlKoevQOC3cqb5hI0Vx
	D6wpqg7WeH9swhtmtxnNZ195fe+E3JnC3+0NbJ7PLCNyeXGt3hiXaYk2DR8mi+EHUJ/lsrfKCwo
	Itenu/PnSiLIRFZzB7OgmPWCRNfLo8k+keAiBe58WzeOtQC9xVzSbN0kvTOPBITSSs6lVkM9unu
	eDweBkzWrVPZYtuTdxkaYR3FmDvkomM4vTJM60yoO0rdVDrE3aCQ2IGw5Zq5NQAdXIbByev6DO/
	AIcq+N7i+KYgDcjR3IZyaOsKb1F9mSfVWMOxyNiApEjPABALssEmtjZa3+jq3xU9r4MpCP1dZUM
	PyZs4+4JTZTAenitYpLG738Rs4cS13OfEnnLvq9i0V5BvMwu+gzzci1z+R7usv1dJXw6uomT5IJ
	m8gKsu2SM9RNPM6PQNhNnkS6sbw1Tn2VWSFNUA==
X-Received: by 2002:a05:7300:de07:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-36f75440d6dmr589169eec.11.1793915262296;
        Thu, 05 Nov 2026 13:47:42 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25c1asm2036943eec.27.2026.11.05.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:47:41 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: mason@kernel.org,
	josef@toxicpanda.com,
	wqu@suse.com,
	fdmanana@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 0/2] btrfs: balance item fixes
Date: Thu,  5 Nov 2026 14:47:36 -0700
Message-ID: <20261105214738.111967-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
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

Patch 1 fixes a BUG_ON() in btrfs_balance() on a valid filesystem.  A
balance can leave its item in the root tree when the commit after the
insert fails without an abort, and the next balance then finds the item
and hits BUG_ON(ret == -EEXIST).  syzbot reported it, see patch 1.  The
new balance now overwrites the item that no balance owns.

Patch 2 is hardening.  Nothing checks the size of the balance item, and
btrfs_recover_balance() reads past a short item at mount.  The
tree-checker now rejects a balance item with the wrong size.

Found while looking into a fuzzing report.  An AI tool helped with the
analysis and the patches.

Tested on btrfs for-next df5b88a7914e, KASAN and non-debug kernels:
- Patch 1: on a new filesystem, one failed allocation in
  btrfs_start_dirty_block_groups() during a first balance, then a
  second balance: the BUG_ON() before; with the patch the second
  balance runs to the end, no balance item is left and btrfs check is
  clean.  The same with a failed allocation at each of the first 206
  allocation points of the first balance: no BUG, KASAN report or
  assertion.  Not reproduced without fault injection.  The other way to
  the BUG_ON(), a transaction aborted with -EEXIST, is not reproduced
  on this base: the corrupted image that hit it is now refused by the
  tree-checker at mount.
- Patch 2: a crafted image with a 400 byte balance item is refused at
  mount; valid filesystems (a paused balance resumed or cancelled after
  mount, a balance paused and resumed) are not rejected.
- Both: pause, resume, cancel and skip_balance work as before;
  fstests -g balance and btrfs/220: no new failure.

The crafted image is available on request.

Siddharth Mishra (2):
  btrfs: overwrite a leftover balance item instead of BUG_ON()
  btrfs: tree-checker: add balance item size check

 fs/btrfs/tree-checker.c | 17 +++++++++++++++++
 fs/btrfs/volumes.c      | 10 ++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)


base-commit: df5b88a7914e18488908ddf13e14e31ab39f954c
-- 
2.54.0

