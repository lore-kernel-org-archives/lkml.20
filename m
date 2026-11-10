Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322996;
	b=jCt+ZYs1AGD6m2CbCZAl1Az9Mpokx0v/VZta13jyfjNI4b58OHRXgmHKYGFPKBhlFlQI
	 j0hWD8monGoDycw8O0pBLJ4fgNBSJuRf6TMj/MRg/HTRK9+rN0fJbeER2xnvTMPhFkoEU
	 r5bwuj5UG+TzHqJ/0R7nyPh4huHq3MTdfcR4ga7iIcoIel4pzCeR6mSxsGbJnG4cTMQDS
	 t6sXNAyo0h0Qtegbu1rq0Mv0mGkOppHfLpoiiDzBhM3qL/diudpBEm2LtEBueuuNBrKay
	 +c9nnowWVINMT+2euPbo2un+ctAGuGKA5joZwgdl1ss1rgDP4xKK2Pl7ZM5eR4UxrFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
	b=obAvA78PWMFbzp55rHGwrVI62qQFlu352CWwFrCTHCAzf5MOueRP5SWsy5zcIcX4V22Y
	 W4DUeSZ1TsGkdVb2RdKd3cwPBW1jdOkMQQjwUrsec3fBOSLC/FNAV5f0z8zJVmiOo5NXw
	 UhFC792IKtO07RrooPn/pc/Ctvsp6Gq+CRXYJBQMxlFfC/YelXrVBcRnS7VHZOilRkfqK
	 7Ppc8wy73wUKM31p+/5Y8fhnOFiafIw9UJUIcOyFc660UmRt2JPK5hW7hyI3VrRXEIrOW
	 m8mECnO862uNqmrGq1LYvLK+XztTuWd1woViUkwWBCcX3aE95IRrLMlYlgvaDqUgDiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF8YbUT4;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E56A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E56A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GF8YbUT4
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e609985789so8397885ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322995; x=1794927795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
        b=GF8YbUT4kkYPeGMf4netEe+aEvR7wOD4d0XiCn2vAK+eVVkfDAUESiuA92dWI4ViOQ
         4tdv8PMLxDBmA+pb83MaRtAaAIufDA0Iq3Li3QW4S6cjHDH+NBlE1V5V4u0s7EAxrK6n
         u5vRo1OHva4CnjNLL+nNM5UFD++wTmW6Iwrmif0XGtIF2h7wLbhF5K3EItq1mFbu/6Fr
         npIDHLuRbxvV81CKFRQJEp32rs6/WYgW9n0LPoaLwBMM161ShcrPVAxnt2cG355NsxM6
         Ze5ZuXAaGxKOC1T5bJL/iv7ripDYfJS5aBjr/vSUyIFmTS49c36axWanAAmcU35Wot0s
         e6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322995; x=1794927795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
        b=LQhJkY08WnAy3X1IyeRRlJqnbbLJ/wzQ59bvr1rigDw0fp6cjaIm2uP0D4l9t3fMXj
         Y9oraOQVyKZMdC2FjR2+rASz700BeNuYyiTmJo7DiJ+2BgoIIRjCre2fYk7CEmFyWaTU
         MeN0kcHo0BA7rr3ajfuf9VHTdStH+7xGvN4Q8oM6mKIjXtYhr63Lc3L3Fm5Ehv0pOK/X
         5pmLD+ratkGUB4JokvxPutf0hcFucM/uk4zdsT0wHF1HAEPffnOf56nADKFhQdFasiy5
         4C6vQ/EeiFkbYt21AKOrZJX1N5RhgmvsRbkTpSWOQu+8LCSfd7nd6Ab1HR0BSxa7nap/
         FxbQ==
X-Forwarded-Encrypted: i=1; AL+hErGEjRDFpSkkDwjofane8jco+2RblJCelXTG/j/qZUN4xevu4/5Lgk7drzgvzmq0w0h26lPXDSs6OZ2WUgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qu+M/jrmoCst3vBcwgi9F4tz+aMatvVXzI5Gu56NNVltR6h3K
	5csLiqCzk3BDMO22EhvKO46T7HSxOhMn91+KsFTq0WcAiYOGdY1gjFYTHzvYrqzz
X-Gm-Gg: AYBFou08UyNmvyyUln7GtNXeVJo9/s2OJY+8Jk55NbZ/iq372h+d2FWZsi3S70d2/S9
	5+MPf7b5JglZiOm21iFuEZ0t7mZ4X02xC6IzOhmnzN12rvZEjTc0hcx9pagb4reYc558afGjs8P
	XDgisLhKtuUzwbDuCTz74yjEaV6t1rbPyoO4MQ8mOajy2Ay7YqPcyhhs3bkySTyRXakmpctZrQz
	Q9q6RoMBIyuK68CL/6p2BLdTbSP/hzfO14FpbJ/fN3WmKJnCCqVS6bt0L6k4tQUXs+jTe5wQSLy
	JyzHbv/NIVwlhJAXT2lDU4KYMHkv8QRCC5FFFhyVDtptSFB0ukYR3pH1ZyQTSQvqr42g9u282nt
	6x4yRNXcgnS0ePmzG0kLDzxDn8GpIidXDTP4f7f7lhnyOCZV1+MuHURJ+EZg4TVm5kZyp8D9Is0
	CfdELmhHR8kHdlgNjR+uCj7UrdDI77KMbPNITDWeZM3LGaZP6P14OnWH9azigI7f6m+Md28sipK
	x+zbjFVz+CqmH/Kgr9Gfhq75QpJxS2Y7vy3hXoWitM5PZD5APAzenLjkcN9PFgo0bYl6pipQ1qE
	hSxhitgEOz1mkpUcqAYrKzunc1geGZOq1zxDRNAIOg7W+VeOB5valueLYxN6T5Y=
X-Received: by 2002:a17:902:f644:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2edb924c692mr24302405ad.61.1794316877150;
        Tue, 10 Nov 2026 05:21:17 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:16 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 0/7] fs/resctrl: Fix some resctl bugs related to mpam
Date: Tue, 10 Nov 2026 21:20:47 +0800
Message-ID: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Fix resctrl RMID allocation to report a retryable -EBUSY only when
the target CLOSID actually has RMIDs in limbo.

Split the domain-offline path out so it releases busy RMIDs without
allocating a monitor context it never uses.

Also unmount resctrl with the CDP state it was mounted with to fix
another bug with mpam cdp.

And do not allow monitor group move when the RMID index changes.

These fixes are split out of the v10 Narrow-PARTID series below.
        https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

Changes in v5:
- Update and split the patch as Reinette and Ben suggested.
- Adjust the commit message.
- Add Reviewed-by.
- Link to v4:
  - https://lore.kernel.org/all/20261105070934.2258613-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/

Changes in v4:
- Fix the unmount resctrl bug as Reinette suggested.
- Adjust the commit message.
- Add Reviewed-bys.
- Link to v3:
  - https://lore.kernel.org/all/20261031063634.1678345-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/

Changes in v3:
- Add Reviewed-by.
- Local varibles uses reverse Christmas tree style.
- Update the commit message as Reinette suggested.
- Link to v2: https://lore.kernel.org/all/20261030092144.1233551-1-ruanjinjie@huawei.com/

Changes in v2
- Update the commit message as Reinette suggested.
- Link to v1: https://lore.kernel.org/all/20261029081513.924019-1-ruanjinjie@huawei.com/

Jinjie Ruan (6):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs
  fs/resctrl: Clear the CDP state after the cleanup
  fs/resctrl: Stop the limbo handler while resctrl is unmounted
  fs/resctrl: Release the limbo RMIDs when the CDP state changes
  fs/resctrl: Add info/moveable_mon_group

Peter Newman (1):
  fs/resctrl: Disallow monitor group move when the RMID index changes

 Documentation/filesystems/resctrl.rst |  15 ++-
 arch/x86/include/asm/resctrl.h        |   6 +
 drivers/resctrl/mpam_resctrl.c        |   9 ++
 fs/resctrl/internal.h                 |   3 +-
 fs/resctrl/monitor.c                  | 151 ++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 |  50 ++++++++-
 include/linux/arm_mpam.h              |   1 +
 7 files changed, 196 insertions(+), 39 deletions(-)

-- 
2.43.0

