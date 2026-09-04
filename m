Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A327148875F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519620; cv=none; b=Nh3UzKIZFsWLgIAECCNeR+MW7Z3T2xBcqpPCUFkZfVCEhIf38SLaEbepIKwIDPMCC5URbIAyEU7dDn72TYiZWBb5TdeNz0yFDTSdVDF7lmJwMgeUMyuQ5Ce511u/njRoFMrFdoSyuXMZ6Vt6m+HjUPv6uBceDVwAil3wnYTEiW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519620; c=relaxed/simple;
	bh=OaCzG8/IxvXGBbIEQH4nFJ5PTQLLd4OU3RBBs0kU5+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jh8Kzo203BP9CIe64iXU1mA+wXggz8pzFa916Z8CkUOM+nCo+8Qgr/dqLMrJjwad5UFvo/EvIqhGnEGgpHjhsPWQ/7Ppg+JFqtxkSiIYVP1BCUKNDrZAwgSG+qT3VZl8zfXQ5dIzzxcuFvIsHHzw8rtGFQNyM3Rf9BOub1sOS8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMEs1A6q; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMEs1A6q"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so1074756a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519618; x=1789124418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUm78GuLdKHLpDDH5tmHY0jPLc/sbeaDLasxHX8oQjU=;
        b=AMEs1A6qbpXJjgIgEjL/KxFx/Uopz0c1VmQZ6JjHIIxjcw/ZN7GgfDzKi9ztDvYiPo
         mSKU63cybyjUxayn0pH1u2r293SO2ic9742QzWyGcunVVu6U3zFIpeoylvVr1aZ7bgQS
         9x3PJrTH50cK/cS+vtAa/I/jkA4fgAIKnL9L9RF2ejzP1kMxv5eOD3Gt/zDO1xGaKbyB
         txqZ9lzsnBL4SCkTSryZxWWtq7ahLN3TtMpI3FZi/w7ifyBSIG8kyXEDmFs0wvbfc1HX
         utEk/FM4xK8L/QH/E70RDFx/BfsQVQK0AUNICaUUYH9QBgCf86odtWBMlI9sGLSAtwD0
         x32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519618; x=1789124418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUm78GuLdKHLpDDH5tmHY0jPLc/sbeaDLasxHX8oQjU=;
        b=PSC/SEuKIZni9e0SKI6YVA9FkG1qE/HU1NZzxkmX93r/ZsTs1gJHQdeAckkS2Ev/pb
         POgSXgC+A4LyYczRscl31CYtEp2Wa1zpz0IgrB+N9MA3UgcZPUo6GH7J2IM/kF9pnW+B
         uCOWk0YEF9BZ/43Eeth8T+VSCbEyGsfCqTP+dVEvTHYqbzsG6CpJsWvc5zvT7FVAHykT
         MbiETxfNQBxZ+rp3FryWWMYe77BORShPhR2rfryDiudOiGxhGoHICCCiLZmVgKCfsaQQ
         uuNhPHeG46e/D4BDkeYBJJOvFCY0/N3KSgkIhv2FmBGKREdaHjeX/dE0R+h8rL1phsfH
         HQ2A==
X-Gm-Message-State: AFuF++mwfbOGNEdbu9ZcBTFKu2tZCoEsm2idRcnb6LouSY1/uqHC7dmK
	c4gcWhngAV0f4lK/BJPsls6qjE21Ic9u390SvHQXXEUWvumtyaDX7n++/2AmSPWTpD8=
X-Gm-Gg: AYBFou1brI9deYr6/jSgs6fcyqUMgSid8JSNv9JkyOJRQuau/Mg/lPS+5uj8dTTs0xL
	ib+6w4nt9RWyTsCRwEjoVfql5q5wnUaOVOlZgIWdPU5Y8UnfOPGJMZPT57CjYPQ3UWTdhJLOs8f
	RyTc1/E/UkFGw37Y3I2Ieg/e8MFKPFmXM77+sj6Gxxt7ddLp/+XbdgR3pwyMpMctBk8l2E9RKG4
	2+M6zZdLKj64ovO8C70NEdpr3BLR6mG7umc2qhNtY7/ShdGHquT2472b2QvMDKV0lgwAYr7mC+6
	R5o28KDzdd9J8732mfN5YvPBpkdFEe/CAYqv8B8GhrBdeYmtHCG/3LUX6VyQN2HAJw0AuPRctCI
	fIExWaQFrRxDVRRMzaIA+6H86vqj4vhU6d0uCsLpUuJ9th/wBaKoBUE6n/ajowZNFFxb6g25JAR
	gj4YMeU/f/5LfEtNfERFDLFGEGlGVZSndbumOnlrFXoWZ4SiniJm2TQIEH5Vy9FCrPdvBYSm+tC
	tdddmfRB8k1H/s=
X-Received: by 2002:a17:90a:e7c2:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-39b261da126mr6601235a91.19.1788519617440;
        Fri, 04 Sep 2026 04:00:17 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm6813221eec.7.2026.09.04.04.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:00:16 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pcmcia: fix typo "specifiy" in comment
Date: Fri,  4 Sep 2026 16:29:56 +0530
Message-ID: <20260904110000.6304-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110000.6304-1-hemanth.selam@gmail.com>
References: <20260904110000.6304-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "specifiy" to "specify", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pcmcia/ti113x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pcmcia/ti113x.h b/drivers/pcmcia/ti113x.h
index 5cb670e037a0..9ff0deaf73ab 100644
--- a/drivers/pcmcia/ti113x.h
+++ b/drivers/pcmcia/ti113x.h
@@ -735,7 +735,7 @@ static int ti12xx_2nd_slot_empty(struct yenta_socket *socket)
 }
 
 /*
- * TI specifiy parts for the power hook.
+ * TI specify parts for the power hook.
  *
  * some TI's with some CB's produces interrupt storm on power on. it has been
  * seen with atheros wlan cards on TI1225 and TI1410. solution is simply to
-- 
2.48.1

