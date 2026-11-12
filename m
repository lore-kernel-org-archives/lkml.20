Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502201;
	b=rdWG4cokXSC8c2gha5/zNmmJTZYJ+vWOEpIIXCiGVw5kzPM4wOBAuf5EON3w6otyVRkq
	 jocShbuALqGczJEb48UQatIFfycH3kdp9GyMc2n/BUo6MCHINzLwEq/CErCvxYTPDLTJe
	 cCSFpmkU5c63qtA9v4LPMoe39nQmjghdkt8UeN7kDBXb+TYOrMqFlNc6QU1bnfFpmNihP
	 vVBPOSYkbHiLlYgGNjUqD+jpwpFod6eXy1xiyQVabtlqmIe16jRLWRLISNg3lW08KxsH8
	 r/BB9u62s3qOrPOFN2oB9v6Yd4s5WCFACaCagnFeyPDi2qiSc6f+3eZIpfcetMqN1aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HTjwYebmxtLa4PiItolJ5AKZJdmlFWAT4a1+ga2BQ5w=;
	b=NZtMyo2n+mHcMJ6ikXbzSpWrv+xH+NQcekbRdq33ySbvBUc40F2zyrgwS4J30fQef/qf
	 iE4Q0eCVsNfeLFvZRsi58ZnWSZeoU3BqzUjRq4PFVq/01kV2Mm6Fir017Fqa15HJ6EOqY
	 wurvgpk+pvxD6BPjEhvFzi4P6AdbYWQncPEWkr43A23CswrjwqJcF+si8A6+WYAM+0/g8
	 4/vXinZDJixy52lijdBDZXsh3mkUpNR1wo8h18zZidzGvmZqQtFVWpiRJyPwWJIZv4M3X
	 Ubjwkbtl32Vftpl8r2SOuyTkNGWI2QDzf1nXPJ1a2zHp8OZPRUf+53WSzC7a6MdVAeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfrYXOAG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30CD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vfrYXOAG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4922523d1afso2725736f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502199; x=1795106999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTjwYebmxtLa4PiItolJ5AKZJdmlFWAT4a1+ga2BQ5w=;
        b=vfrYXOAGJtvaDHCSlWSFFpVBsjesNVMrHHslD0+Nr89w2Q4Lnms26P5+Dgc0CGlpY5
         qAdwuAwnDlLbug6dcW6ZSDkJMThYvJkvVRVlhe3Mg5lZ0z71y3zFWEzBF6IN5cwmfeSh
         1QPhAtTWtB/hqfafWJv9LfZf8rWd0f7tTetPUTgHEV8867Aou+7poedhUiW38gZRR0az
         Ohv9uqenqxTCla2ACQSIxx2gVAkudx4raaQFzmnkGtTql3kVgQS3nehYUJABaTSEewvl
         f5lymy0kVezcATV2D4ByFEjY4rjXuY/4A8T3h8jrnXv2Xz3p1cI5jEL3hA+wyzbM3ZC5
         DOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502199; x=1795106999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTjwYebmxtLa4PiItolJ5AKZJdmlFWAT4a1+ga2BQ5w=;
        b=QVK5z5FWFfF35eE1s4soqdyuzqemTX1rlkt3wwKAHd9b06XouI9ICivmONesmdGWtJ
         MD8OVMC9j/m4jmduM/912f4pdcsTlNxzs9KO+BFOEFbPkIe3LXrl8bqBtRZ8oa7QBqRo
         XX/j+1XneYEdAigUMRKCPtaTqRPZsiNjJpDyerJ+M456sXARDgnm3r0n4k/DJle2ThO6
         FG2EiDZf5eOnwF5J11Kf+8265tPr9egKBlSFGoEAX/frAr8mmkt9xZW0LGffWn/isJ/4
         tNaaz9VTuqKgmJHPyfz6f3d2AjNCM4p186m8Eq29kcBdndGSuswSe47KqyjVjARYQoks
         w7LQ==
X-Forwarded-Encrypted: i=1; AL+hErEkH0o4C+J96y1A7ZOPXvlIjs5CJhIQV2rG3tuEZ7etirtCKby2US1bKXxs6lPPyVpDBjahRU9BLQNiVOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fj7oLunfUjy8t/W/Q86C2lKtWdQyGOr+lf/JGtbmSyMdGM291
	FO5fnanUwx1vF5VS2MdXZWN14UTXj6LlEldynqJs//CMWxzCS7O2Y8dL
X-Gm-Gg: AYBFou0sjrpEtRhfmR187DtwiQn1jgxXplNFzUdqa+3DCJ04KrwDgBBp6ACIxXbcMz3
	LuqdWVtPGxPMTOBcPimBsNM3R1fr6pGyXkq6R6FEz+mSwKZkc5LZ2udYBPC0swQy6Me5q/tkxZ4
	gq0ymVFcU68pxUfsFXHed0uqqEvN7i7uJ33tgP8lPjqGkQV0YgKS7TbPpn8d5taNxCYwZAo+Z2k
	vWgukf+L+NlXJI2GpYTqcukVuUlvpaupvykSPw0F1o/R3DM3OxhDF7A5Ii2INg5/HUWt4zb9+xl
	6esoGI43DMz3IezlqZGzo5JT+rKkBqVzgqTW2CWN8B8JSpAzZEtLGRj4QJC8QZxgA+lKA3c6wTm
	xDklUboFyHDqcGAN8Q6UUC6GkPGovLjModRN9JYY6AGW9Nf0R9XtEMAlqbdamHZuVa97VQW6unt
	n6AYbHOSZhAVScLU7XRbd0zzlYkoZ8+n3A5H5zFPMbKOxMN5d5gI3Pbj2qhdHaKv/WzzSYRX5qC
	mNmim1QBTngvsO7cFkVIjioFy4lwM6OSAOaHLuSbeA+XKDLQ3NH2eh2wVnupc0i3JZr4UGDBXlt
	y7TqZWc1xjERquP6p2At4+5zgiw8NdMweijpLfAE+1garQOxTQ6dgh6XcvUorlwcLsv63BsN/Nm
	j1X+FdzU=
X-Received: by 2002:a05:6000:601:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-499c75525edmr11618552f8f.13.1794502198904;
        Thu, 12 Nov 2026 08:49:58 -0800 (PST)
Received: from nixos-office ([62.28.7.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm234202f8f.15.2026.11.12.08.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:49:58 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: andi@firstfloor.org,
	ljs@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] MAINTAINERS: cleanup Kconfig entry
Date: Thu, 12 Nov 2026 16:48:26 +0000
Message-ID: <20261112164826.110736-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
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

'scripts/config' provides a CLI for kernel configuration, but currently is
not included in any MAINTAINERS entry, despite the commit that created it
using the 'kconfig:' subject:
commit 8e54701ea85b ("kconfig: add script to manipulate .config files on the command line")
so let's add it to the Kconfig entry.

Additionally, 'scripts/Kconfig.toolchain' is used for checking various
aspects of the active build toolchain from the host environment. It's
merely written in Kconfig, and is not really part of Kconfig's
implementation. Let's move it into the Kbuild entry.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..245bbfed8122 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14374,8 +14374,8 @@ S:	Odd Fixes
 Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
 F:	Documentation/kbuild/kconfig*
+F:	scripts/config
 F:	scripts/Kconfig.include
-F:	scripts/Kconfig.toolchain
 F:	scripts/kconfig/
 
 KCORE
@@ -14451,6 +14451,7 @@ F:	Documentation/kbuild/
 F:	Makefile
 F:	scripts/*vmlinux*
 F:	scripts/Kbuild*
+F:	scripts/Kconfig.toolchain
 F:	scripts/Makefile*
 F:	scripts/bash-completion/
 F:	scripts/basic/
-- 
2.56.0

