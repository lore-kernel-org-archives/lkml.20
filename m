Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A04B403F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823439; cv=none; b=TARNp0tm5uIFrA6q2Yy/n0mrscQetwl/JnfC4v0NL9YIlFHJLHhRLEHvgxZgbVTHBo6Qm2tjNqGu45rLC7Q5FJ4VAeGgJx2NA+nv4UsTpkle9BZ6CFnUfwJvJtMuu9U7ez1pD04FZiadm4xQAWhdXGjm9XZ1Wo65oLTjG8myBAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823439; c=relaxed/simple;
	bh=vUcOr0k/Biif+yJwcSpaOnOoZzKY8hxNFDDipC/t+ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JYPAY461oA/LtMDkyB/ciaYsQsllIEl9QU5RThMub+M2Dik3L1cH763+Nw8S6L6//XeFJqxeySFJWGxnzMfUlT9Bs2EttG2NAbGReirPWVQaGQ03jb0oy/pD5M4ppRZKYCqoYw3GE8R6PZub1ZCgCWX3EEVBDlrGI4EBU07W050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=GB5zPK9U; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="GB5zPK9U"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ed3993c1eso127724885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791823437; x=1792428237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=clFQh2LTi4YoRHqOFH1o1TqPcyiqW9KA/u/YoNL08DQ=;
        b=GB5zPK9U/QAVyibiaaBYW5OaZUITyhx7NmzpHnWs6VtFIJ/JYwJ9yqD/W0FWTOv5Mw
         lRZiBfAbJyKSahde/XJaCbcGInWgvKol1cFNbE8Zga6SNHYqKn8HDUVk79vZ8v9tfsg3
         5bEA1G4Y3b6cPaDcycI4yeSzc6009yJ6mD19ZTzwnIgFRAvtZz3YsF5sGkg2N5r35lCV
         H7m1oLjS4Hvw45cZaXdi5hADHmUIFWa6qsGiaVO0Hl5LSVLzOoeSdWzVj9GB11lSnpzB
         N0iQmimrTkdmTgLvYT5n7HT9MRf5/ZMWlYJeJnfBI/Kt7YACK5VAEQhyycpCS4DRNaul
         inBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823437; x=1792428237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clFQh2LTi4YoRHqOFH1o1TqPcyiqW9KA/u/YoNL08DQ=;
        b=OzzkfAlavEdfJIXSR8/hFwI3Yks/WK6uRoME4PZ5anwOcs7W9GVNfTnANT7VbyG2TO
         iA5TIb9ieMklm9WkZmDqsKBlwlZxOfRtPOEb5UCBxZUXqNopCeVh/ACn/5a8Q/DvKOfw
         emRFUj2ylKiTk09qPIkWRa8yVV2UjuCwh5YY6YRd2Rodhjs2ggk6UJHmrJ+3B79iKXcX
         Tzz0/l9dLOg3yk3ew5GUee6gxBKdpS7pCd0Qsa7SIwOFVzo824uHLtxwPePC4Jlr1r29
         ssJEfztIXwAn/4CSb6ydfJAR/i/xyL/AwbBxFT7PpgORRbDSAYcQGmPBspKdzMBEI6om
         J0hg==
X-Forwarded-Encrypted: i=1; AKwUvBwz9RNCFDxbh7bTzscGXx45AxQzx40qIIUmO0KaYfiX9/MkrHTGc5Ly5QbVPxdnJvJbd+7xC9ou6cvhFuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLLHryLoVkA58eOC4Go5WqVJOHs88uZYzq0k/U0YfKeYwrOvGt
	xvpqyRTqW+VcZQ1O6knJxCOVNiOIsMy/fDfgH7y6m00NMIALIZQJ1bgOETHYJyReliI=
X-Gm-Gg: AYBFou0UJu86tPAvkWQ7pJRVFhDsFVqBFLCNplGx0yINXKP83mtxm4BAgPP1ykDow7D
	6tmVbigM3AF7Ag7kVCJQMWKWRLHC/SuKK1ea8YwjewEe/bckmVmeRh8Euu0nNJLft3iNq91IhFC
	oYcgxbydxpwyxc2V/Hv0nlLFX8xz9jLsVOrSyNAfGIOJTp7tsHvTaXSgYOBt5F37nAPM72Gnr7W
	8O41kwNcgraxoxYXxBF8CHwqDGQ+UWH/8CaD89Q2Fnl/L4L4uM37KEDdBI99Cz6PTgXikB6SJkJ
	J3fZnQKP+8U7jaHIZGynGUGCNlQFumWw6da94cRQADE5K10bZ6bJLF2BplLdcwCrLRt/xEZehdt
	PPiPRmWl+HFpsYPNmRVdRNjFAD3KIZi0xODqhDX2g4SO7n3KBrjYliyyXekhesdf1+ADrmgcVz4
	rlpWGA/SkJqSG5YDb9cl7ELmC0zjkpf33W0RwO16a5QjIMWsY/GqQQynvRC/LneyxPG9+5w+9HO
	/k=
X-Received: by 2002:a05:620a:44c4:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-93ebd282089mr1696774585a.59.1791823437228;
        Mon, 12 Oct 2026 09:43:57 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm24998885a.40.2026.10.12.09.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:43:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] reset: introduce TC9564 reset support
Date: Mon, 12 Oct 2026 11:43:51 -0500
Message-ID: <20261012164354.3872326-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the reset controller present within
the Toshiba TC9564 SoC.  It is being considered the first version
of the series despite being previously posted as part of a combined
clock/reset driver:
  https://lore.kernel.org/lkml/20260918165234.687224-1-elder@riscstar.com/

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both PCI functions provides access to the
registers that enable or disable a set of resets.

Both TC9564 PCI functions can provide PCI endpoint buses via
devicetree.  Each PCI endpoint bus provides access to one of the
function's BARs.  Subordinate devices (like the reset controller)
can then be defined as nodes accessible on the endpoint bus.

Only one of the two PCI functions is permitted to define the reset
device node.

Note:
  Other TC9564 drivers have been posted together with DTS file
  updates for the Qualcomm RB3gen2.  To allow this (and a few
  other) drivers to be considered in isolation, I'm omiting
  that here.  (I can add it to future versions if requested.)
      

					-Alex

Alex Elder (2):
  dt-bindings: reset: introduce toshiba,tc9564-reset.yaml
  reset: toshiba: introduce a TC9564 SoC reset driver

 .../bindings/reset/toshiba,tc9564-reset.yaml  |  56 +++++
 MAINTAINERS                                   |   8 +
 drivers/reset/Kconfig                         |  12 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-tc9564.c                  | 192 ++++++++++++++++++
 include/dt-bindings/reset/toshiba,tc9564.h    |  26 +++
 6 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
 create mode 100644 drivers/reset/reset-tc9564.c
 create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h


base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
-- 
2.53.0

