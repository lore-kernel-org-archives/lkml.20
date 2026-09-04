Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57201476688
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522450; cv=none; b=rzuI29IwdHomgnLLU6bgIDMTXX6ZzdFYyaE15TODZkFh0/RNP9t9cbCMGVqWdeHrTXsDgrSuBywalysx4IVHoEQZx5I3zsfzChI7zF2fLPd9gcl5/qufUB8JWJu1AYll4fFi3SNWV30Q9cwlhG6FfNcleJ0xZO5fKHrmhgX8t28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522450; c=relaxed/simple;
	bh=/9AvWNTx0Uws6CPmP4japv2oVqRgQ4w72Aae5GH9+yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rR68IOcoEZNRKgABa10VW9DF1IlatsAqIOEkk8cUmZ74PIccJwin3UzKnMG4ZouqSHyX5cOqK1gW6RbRc96pIYfDbKy08exjY4cdR4rOk++Zn2gSLquPBYaOU5oCse4HLcdYTknBUTzGI+ZMtIdS/n5JVHp2XpHuegOw/D3N3Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXs/atVK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXs/atVK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38759bcd877so861538a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522449; x=1789127249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayBE8WHfDf08n9bnv+C3PLiPVKYv40b2fp3LtJWfIsg=;
        b=BXs/atVKXYVXjOG97LbQ3dRFBD5zolskLVgCrHcEYj/sTCZ0gkwyN1BzeyZDsFbaxl
         J4hrZzqzg+JxI/qv+zAZFBHh3kdt8g5Y3HxeRrvjAdodrWr/rxtu0xkPPXhYvOxY7l4O
         e1c6qJhMuY9mJ68s+BkPXHWd/ReKp4zqrw/qxskVbL3Efl4KB0v/yPxStzupsl+w0mvH
         KJgVyb8HySgBZdCNg2I/MJXK80g+nQcyASeUn8rNpKLjadxuEGmuYEehySO24qolQdnM
         VAc5n/idxtNrRiJTTuZQBPEE5V1L2dtcsPzsNunpNQTLnKeXTx/iICM9pgiF2qjKifcT
         +i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522449; x=1789127249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayBE8WHfDf08n9bnv+C3PLiPVKYv40b2fp3LtJWfIsg=;
        b=gdhU85mvrkvh/IY7pZqlbf1vBtfc4g88sWKFpHL9XfJo9h5XTb3StwtjTUOwiUAOFF
         U+1s5jnrzx7ss8Lmkh3oXCXtNvmanR8HssbrccDiWoMEGmRgCIAEecu11mNAvxffIW91
         ikW0Pb0gOXhsBfqsw67+MYI2kI2AIQ9/l7MkHjnd0M04xtyx61q6k1JUkCd+2YLVMa2Y
         uONIF0mX1MAgIa6XIhUNB4oXfJcNLEmTds2pL8CaLvkbA3928cxhwd5wJvU4rMigwr6u
         XNDrFnwjZS58pk1Z+v4JPwZxVr3G0dPnYpnm5h9DU/vNbW9FGIKRsBJkHZkxol/Ia/6k
         OB8g==
X-Gm-Message-State: AFuF++n78mXvwlaQrY2Y9TRRANAd+druLEVatMC4iBULJm3vUL2s/S4S
	5azyLb4o62p6e0NGtr1hyPa3KlYbNxXEpTtQRqa7rTlDSGIn2KdIE1yNcqqBCpPm374=
X-Gm-Gg: AYBFou1zbquh3i3Sv5Da5WjKNTMMhX+W7HUF5lhykkXpVwG6EHDWvmxj6Ac1Q2qgT2d
	qQFq2i7Xbyj88qZr3Cl1BGjuegpC96BI+vv+zSLcwaHDe5T8DcPp6LCXQ+2SxnJdGyVSgLFCh7t
	0sEIf7vL3JpW4PDmmrrEvtB8alhN1OxQ1yywsdZULe2FEgO/g+A9RyJxpNxjduL9Jx0AZrQgHEk
	/3qCOh5a0OU51jHFlZE6sozEDtmzXkLkpDA8gPoCeNy9IGwLt+jsYWCbNZkzAvjXK/OxmSvFP3b
	Md7ffYBngdiuORUjlE5v2g04neHQ6UFhy85v+KnbK3vtDw4ALEp1heZoSuxCqJuNVVtI2/HAkiy
	dQyyadTMikz3nh0nB+LgLBhN3bFrTTOOuLII+eX/ovsSseYrs9arfEdbSEl/SkykmaFE7pjROoX
	o7QAQ7qm49FZKlr6qe4qarH5/umpV1s6oyEQfdMg0VlUbZShDr5r9PglHOAsnmd0rRVeV8/BTo/
	x2JnImfpbXHfQI=
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39b26277b88mr8095212a91.24.1788522448541;
        Fri, 04 Sep 2026 04:47:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339c0ec914sm6950891eec.31.2026.09.04.04.47.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:47:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:17:20 +0530
Message-ID: <20260904114724.32518-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  wifi: iwlwifi: fix typos in comments
  wifi: iwlwifi: fix repeated words in comments

 drivers/net/wireless/intel/iwlwifi/dvm/lib.c        | 2 +-
 drivers/net/wireless/intel/iwlwifi/fw/api/power.h   | 2 +-
 drivers/net/wireless/intel/iwlwifi/fw/api/rs.h      | 2 +-
 drivers/net/wireless/intel/iwlwifi/iwl-trans.h      | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c   | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/time-event.h | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/utils.c      | 4 ++--
 7 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.48.1

