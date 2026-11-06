Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932157;
	b=H59WPmdRqavt3PUJ7Cm4bSGsMLxnxCCCnG8eogNMdOx5OjktSrM6rgt3g4S1qJmjmU/n
	 +ZZm/u0C6VyccNSMW5VEQOSu21HsjhoklINHmu/DoBuBTQh7w9DVxK+vZJpH2TqECliex
	 8kNDecT7SlYxLkVEL/K2FkCBb0S1n+JM3rhNfKCoEDy0flm+tk6lnYI7kFa9eEQ7nS3Pa
	 LO7qvD2U1RYUHjelAEM1gXZfVD/9sR9Oz+qBsY/N0mVHIRs5Kraei6PUuYXWWqFIA05hb
	 0r6Zet3pzCWpfOnC+gBPveq7nRehlA5JiIC210EF36eH/2bvxYmZkaqGmBWVDq1NQsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
	b=E/e52rgkV6auNUrYtbx7uZVLFjo5CZgf3zWCohj85Fy4P+bNccgisspanNCMtaP5aear
	 u/+b8j5C1iH2afT1RRqBuTspv1aQiQi4NVPTeBT/312EONxOhjRS3IFskOCp79rjzSMIX
	 8J4ZC/BfSSdNc+BjVOUyjZEeeo3mRBpMg1+zF0v82kxKOOelaCkRoHk0t3IaYDn4Dcfgf
	 Rt7IbQMTGB9Seemih4ihr6uTvaX6wu/yfsMicGhU+rE0qz5+LJ2zgHEOroPP3XOpeEXql
	 ugCg4Pdc3cRf2iVDNBjZVVunvt/SOTUAndYg7d+UAeDpAXjgUc1zoLBtkwwYm+5LdJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acioOQyM;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28582606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28582606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=acioOQyM
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f6295304dso186960eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932156; x=1794536956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=acioOQyMDt8SBMOpA0nkNSSYxzHeJ1SdNn7aOqwlCLt8jEh/Rr55qdnJ5gy4qlsFSn
         1kqKlOx56Oqhfh2fGx2toAhqEslbHh40vvGfTWVaE515lfJCAYYokbNbcDFuh1rKFbG9
         +TB8LIWNHHH+unU+jIoMEXnduWIcnzfetaSvXOYxyHqODyuuz6c0X7juSHOC3s9qDJw9
         jTMjPtxx/hBpUgWUcKHvTptQJhcVyJWFR5ptrxEFf8F3vHwidRZseIWSGjBNJ7F7FcOv
         fLWvk+KGnQah0NeguiEKBKI788nV6SlyQCMPnAltasp91ZrVPzzOlOxWOKaFyYZl61Vq
         8vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932156; x=1794536956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVFhMdPaOpZaZhoFk4x/27qwSHFs/IDKrnB1S7WQ5Wo=;
        b=yyBFJwswqHsl4at2J1VRlspxM4lvF3K/kTVcy0XM7/yE6nZKD4cQGDyWHtHipp4NlV
         6muK+AEMdGnLP+BCYIF0GUNQa5TavDe6DjgMAhWeTGT75hQZQG8eaHWZZgKcSZZqdhUQ
         cGZKiNm9uUbk6ie3U3uQQxjWDS6anDcAwqGypunht2OLWD8VYyYR9c5giLnvS4nmr8aJ
         aOnOXEE3ZVam4SU4k25d3WvRVb2Tm0RlJ7Z09nLwJMZo6PodDKBXcp79lnJx5K2ILU+k
         u1wkKtHuL5t0kEveJ4jxdhRGIwss+JlYQm2aAPbm/n6CS9f35Z+PNYLGAsOT/pSIlqb6
         h8lw==
X-Forwarded-Encrypted: i=1; AKwUvBybqbr1GokvsatuBKRqtRtRYuCHRiNR9lvTIDCtzoXiDoKclSRUEhMarRpacMBuLdAbX+dtkaQv/m7KQvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wX/fd43OvpleOIsDYNQWyXjVY5S76vLw27wNzZAIY4dL93cwO
	UAwdN3uq+tex3WwlXFd9tFrAE2gg0kku61tY1UGOkkeMqZHA5zv9lgvM
X-Gm-Gg: AYBFou0Uiab79oi+3q3RpEKhQ810vclQF8o+Cbtkj9UfFU2A8e04RZvFFB8ZDsDi4+B
	/YRTRNEgKwEY2SbKXC1DDlls8Bga0BB3rw/dB5nKp1xY7NTH8pxPvZhyPW1XzuqqhVLDIs2eaai
	ysyNis04VBazABvRljrusNWjl9kTic5VcWSL1jTO0pkoZaFYi2i4iY7eUL8Pxx24y3khMmfcx/0
	iKvC5nYK+pflMEJ3EKA7dgnmqPsShm8qFjOcw027WiUsycc25IlWwkzCz7hOUOD1VxxiIenY6Jm
	tJWY/Ilh8dOXp3MHZqMYNAlGKGRQ/H2+KFTTjQeeat7yMoavrI5AZD/CRxnPhDFC99IRpI/Y/p3
	g6sKmN781C9PY/+a9v14gCSIz/wEHcSrx0wNStd1nYFcxLr/Zy6Bef+5TVCbv3iOjVB6DCDaQvo
	3XnoIH8OZV3SSGoDfs4a+dj59P2PPKaS3aD7CMjLcV1LVL+GY5llvW9Gm596Wla4Ni9sL1cMvpg
	Zrm/XxSvqH0aoZPbYQWXXFhCbppZB/af7z1WbrT5lLuAxAxieP1U3cQ/RpMroWWf2Wbbx5kXle2
	kSzBwkDLTM7H1PPWNROua7gqDdNf3Fljuv3B/2u1tfLuuw==
X-Received: by 2002:a05:7300:f58b:b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36f75e295e2mr1519316eec.20.1793932155955;
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:15 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] Aspeed GPIOP handover with managed controller lifetime
Date: Fri,  6 Nov 2026 07:59:05 +0530
Message-ID: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
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

This series continues the AST2600 global-to-local GPIOP passthrough
handover work, rebased on v7.4-rc1. It adds a shared pinctrl lifetime
fix before the G6 handover change.

The registration lifetime issue was identified by automated review:
the G6 callback data is devm-allocated, while the shared helper used
unmanaged pinctrl registration. Patch 1 switches registration to
devm_pinctrl_register(), ensuring unregister runs before earlier
devres allocations are freed. Patch 2 retains the v3 handover logic.

Changes since v3:
- Add managed registration as a separate prerequisite patch.
- Keep the handover implementation unchanged.
- Add KASAN lifecycle testing in QEMU and on B650D4U hardware.
- Update validation statements to distinguish lifecycle and power tests.

Validation:
- Shared helper and G4/G5/G6 objects compile-tested with W=1 on ARM.
- G7 SOC0 object compile-tested using ARM COMPILE_TEST; this was not
  an ARM64 build or G7 runtime test.
- Generic KASAN boot and one unbind/rebind cycle passed in AST2600
  QEMU and on physical B650D4U hardware. Controller entries disappeared
  on unbind and returned on rebind; a subsequent debugfs pins read
  succeeded. No KASAN reports were observed in the captured tests.
- The final v4 source tree matches the tested v3 tree plus the
  managed-registration change; only commit order and messages differ.
- Earlier remote power-on/off and physical-button power-on testing
  used an OpenBMC 6.18.24-based kernel, not this v7.4-rc1 test kernel.

The unfixed runtime comparison has not been performed. Concurrent
readers, probe-failure injection, mixed-pair forwarding, protected
writes and SCU510[28] hardware handling remain unvalidated. Existing
questions about probe-time normalization policy and concurrent SCU
writers also remain open. Electrical measurements are outside the
scope of this lifecycle test.

Supplementary procedure, exact source/config and logs:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/tree/64eaccfde9ac4ec35646c0b7a8663486775b5d3b/docs/experiments/03-pinctrl-lifecycle-kasan

Previous version:
https://lore.kernel.org/r/20261105152348.8567-1-prasanth.padarthi10@gmail.com

Please review the shared lifetime fix and the GPIOP handover policy.


Prasanth Kumar Padarthi (2):
  pinctrl: aspeed: Use managed pinctrl registration
  pinctrl: aspeed: Hand over global GPIOP passthrough to local mux
    controls

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |   3 +-
 2 files changed, 143 insertions(+), 5 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

