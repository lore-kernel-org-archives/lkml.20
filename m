Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208706;
	b=jEvfPaAcn8Bjn6/sOUrowZgx2B4EqkE7HmO0SpA+c6Vk2vCZVNUdY79nEa/Y0gF5pFy1
	 w4M6/iL6IdoymRGPjypUiWfji+n+ukpQbOHxfAGqbf8AJF6ZQwLhP8iPCg9DTL00pTDpl
	 YimM0TNqHJwMOUFOcay2DXFRJWjH9hcv4Jzqa6jvVP1wqXQ8HwhxLR5hDljCrW7Nh3GNz
	 q4zxnnDX08fDYG7URp/dNZqj+zGQGsOlmFnQlynCNMIyTiHN7F9TYQpPLGrJtXSzPW1sX
	 QJ2zh7fdhAbngJAI4A1sHCZzDymgmhyCp+mM0H+ak3QH+AoFSl4p/FDrR9rdODtyglA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zCKO3sRARToFinSo9PL+jKK4jsq4XRctQ0QJ0NSvelc=;
	b=cap0/9K3P0N74lr7m6UkurAxTePFxp1t2SmGY+QJkIIGZy2ik0zbHhcCyFWafo5YKsqQ
	 uVbjMaBasdr5yUuSIGy/QTuc/f5CpzYqQyZQ29fGkKEWF0cW2nbt1e5FLuZTdiy+tEmVe
	 UBW3vjyDTGIwC2vdaVns8vBKHJE5r8BhwCmDGK0jgLOLhPi5H1QxJpcMMDsA/vOhB69hK
	 Iq33hRztVqmeZgvU/qmMGK/4rhFfRWGsNsmLH2icvsakBTcyWkEJRVDpptxw7r4BApqAB
	 N4dXtnuraE9M0paiyFp/d8hcPK7PC7f4w4tbOhKDbZR4TgaPSYwpDq2sBeLOMyd9sdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ny8vlj7k;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F4606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 557F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ny8vlj7k
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so990392eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208704; x=1794813504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCKO3sRARToFinSo9PL+jKK4jsq4XRctQ0QJ0NSvelc=;
        b=Ny8vlj7kM1s66yXg7tUw015cDF03VIMzD/CxUk/Qj7+9QrUBDx68q+9HlU7h9EYVm0
         mpPFfPTIpUUIjlYw5BPWCjASz4weYCDcUMn94Dr9Zu1vfJrzP2zkDrqN0DeChBpTt5Hr
         wLIvuW3oVRxN2buitKzOlYKHXS5h5xU+2hdyExD0s94fPMl71yEJRpp6JifaJTNbHOIl
         /eqlf7sIrTfkRRTmcsr+En01fQlX9QJDTZS8RkSObAPrwfajdnmq8rLmV4IU12QnLnr6
         /7V4BySMPi+PkUadScJyOwvtueo4HnyadVZfgT12m4vf01BnR7w32Tz2dh5FIOMGQDhP
         rVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208704; x=1794813504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCKO3sRARToFinSo9PL+jKK4jsq4XRctQ0QJ0NSvelc=;
        b=Qit8190WOwkEEQkXtAoAGtcmKSmvZpXWoko+IZKKZmKBIdJUNblV3v98dGrttnTcPP
         eoaAoPGKMWOdXW+2XWQRbwDZW3h/Syv7O2FBjEnAXi4w1iYjiKdjrzc+0UvnclrjMtNu
         mSW9oEunqnI0oMiHujoVilNce0KVtp9X1Qsvt8mSXeEtCvk+EtpfbtB7Rs7dm7n5Uakt
         7bBZJDqtlPMvH1yHhM5p9drZhVDPq54xSWYIjnmeEY526gXNn/DnteGSQkfQLA7oIM4w
         wOyuhS8yLFI1SbUIyBd73rOSW3lnnkFn1kB7VjCxPpIGEtEer/i/acGU9io6DSZ4FNIO
         mHsw==
X-Forwarded-Encrypted: i=1; AL+hErFaS/W+9zXOO+jjso+mp4/0milMh4jTfGVskU4sipxrjaOz+51qsHrptZcfPT0Qs/O6Ny4Gda1vEVlvSCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dEzZzqKzBWYZQL3+fsTufH+FjFsQpwwwyqxDFh/ym2atg5V3+
	mNT7u5Pd8XrmykuHEb8LoOXXw4QhS6hbRaZqt7OWIo4fi2IIM1XEfhLt
X-Gm-Gg: AYBFou3eBV9l7iXLcLJS9AK1RU6fLVA14ZHERW38RXwoUIgY+aa4vpZSuQsTRDvxrxW
	JS0WrKAp+Y5DcUqqY9D5EUgNNyTTG0xaPDLNV0ckU0Ac7N8od8caUu5pp4ZumjyHIrzV/v9aP7s
	G2oL1zFMqfkCVovkY1t+1q7BYtJwL4gsp7RNHY1SlenA2fKdSYMYXpHvBfGHtt1mSVmGiUQbO79
	onGCBKOHp1t+/3PMnI4zG6wfEjekD2abxmCTxFPfE8g7s4zIuhnNa5V/eRk6xyPBSb2+rQk2TlL
	nAs2aHrMVStxhWPIdZqxvF1UzzmLZ2Qf4kio8J9NMVrOzBj+dAVt5GJ0qTEVPAK7OHsIMX2NFko
	Lic4bjOJcB9vr51El0k99zY0uNssCh2sRXpYhoRIqH7X4251ZtvvkYRTRKTu/vPzOYGLvlCBS9p
	HhMCY+eD7KkqMMv8fTU1QTPhRc5w7Qu1UWCHa3BZohDWIkevniEyMCggipL3o+W5QBmXEpt8dUO
	OgiHdlwY0shAkNCGKc/eqHgxS/3hbj6lftERlYEVt4biDfClOqYC8c5U6KIL+lNV2m55M81C26H
	cnjtu10xFmgG5CtDIllE9lsiszjnELRRtAG/OeVQyuNXo8cCagPD7IeLiv7aVcjIzme1tPgw5ad
	o5UlsRJIgSfOEzIwtm0FtB2FkkWgC
X-Received: by 2002:a05:7300:50f4:b0:369:d992:e3 with SMTP id 5a478bee46e88-37258658f8dmr5379014eec.32.1794208704312;
        Sun, 08 Nov 2026 23:18:24 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12878306eec.21.2026.11.08.23.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:18:23 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v9 0/2] tc: fq_pie: add per-flow class statistics support
Date: Mon,  9 Nov 2026 12:47:46 +0530
Message-Id: <20261109071748.438946-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
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

FQ-PIE exposes no per-flow AQM state in userspace today. This series
adds tc support for printing per-flow statistics via
'tc -s class show', matching the kernel fq_pie class ops series.

The corresponding kernel series can be viewed here:
https://lore.kernel.org/netdev/20261109071017.438478-1-hemendranaik@gmail.com/

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/
---
Changelog:

v9:
- No code changes since v8.
- Rebased and reposted patch since corresponding kernel series was reposted.

v8:
- No code changes since v7.
- Rebased and reposted patch since corresponding kernel series was reposted.

v7: https://lore.kernel.org/all/20260922211139.38570-1-hemendranaik@gmail.com/
- Removed UAPI header changes. The series now contains 2 commits.

v6: https://lore.kernel.org/netdev/20260919061254.39678-1-hemendranaik@gmail.com/
- No code changes since v5.
- Rebased over the latest iproute2-next tree and re-submitted patch.

v5: https://lore.kernel.org/netdev/20260902040221.83734-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments (folded into patch 1/3):
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is now a direct
   struct member in the UAPI header.

v4: https://lore.kernel.org/netdev/20260727165028.106817-1-hemendranaik@gmail.com/
- Split into 3 patches: fq_pie class stats, pie avg_dq_rate
  formatting, and tc_pie_xstats comment fixes.

v3: https://lore.kernel.org/netdev/20260630184453.171410-1-hemendranaik@gmail.com/
- Moved print_nl() into each xstats type block to preserve output
  formatting.

v2: https://lore.kernel.org/netdev/20260614130729.10076-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue.

v1: https://lore.kernel.org/netdev/20260531131411.28213-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (2):
  tc: fq_pie: add support for printing per-flow PIE statistics
  tc: pie: print avg_dq_rate in human-readable format

 man/man8/tc-fq_pie.8 | 18 ++++++++++++++
 man/man8/tc-pie.8    |  2 +-
 tc/q_fq_pie.c        | 59 ++++++++++++++++++++++++++++++--------------
 tc/q_pie.c           |  4 +--
 4 files changed, 61 insertions(+), 22 deletions(-)

-- 
2.34.1

