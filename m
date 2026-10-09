Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A2341057
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565041; cv=none; b=I4skrh1d+vObVP1wk7+PTUZNgzTWAhZ0AfmJa4KINsiHauPyDp9MUpxkLKGmxf/0tZOYh57t0UtP6RWr8mzKnJ+8/jKKthNdn5m1ZofSiRkI1YKTviviprMx+xgRLWAOB3F4HNkRvzgIBu8GNaO04eqqFQ3FmKQSHWcP4h1g1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565041; c=relaxed/simple;
	bh=K+cFqFZJ2e8EE3VQyV4cjNttyp1R6GBQS+4YkgEMi94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e0YX/7uw0uI5fEpbMwKLJZdoN+OTS15i+r44rW/ZdJ3kv3fxUlK4kt/FdXJx1FRX6EVojAjVjJXO1qb3+DO3wheDazDI+xGXWfFFoMBb8wDuWtHWcurya7qsg4cf3i/mC0IF62UsL6TnAl35+I2MzapBTwxKcOFlAqjjMDnCKZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0NMchFT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0NMchFT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so613095e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565038; x=1792169838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ga0/K0vP0EjNnh03yqFX4Maz5FD9gKWYoFQtyD/6jI=;
        b=H0NMchFTQccCGInVcCCDKBaif6is0tYRdR70pb+4m8I89T18T+OWqqTgrh6oRJDO5e
         RSzbGN8BZXm1xmOK1eXNdcmAsCTO2ad1I6K8OsuG36ekm71YgydxsVJD+YDyRlAjFmYK
         zhOVGh50ZEn+Y+Gn7aJaFJWhU7qfhSnYn0a+BOiUu8MWCrl3yzzWfja2PRlG38Rvh1Yx
         oNq5PAos2Zzgajogn6g+LlxQewe7wYGH8ERNaIWAjgeiSkID9tZSyJTJBCQH7nKj9OT2
         eLfwghWUvbnMi59OKX8sv3SBc+UWv30Vx78L7u4tz+mg7lrBJFA3R/6rUEyAsutcTVnC
         qrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565038; x=1792169838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ga0/K0vP0EjNnh03yqFX4Maz5FD9gKWYoFQtyD/6jI=;
        b=XdS7Ax/MIFwgq35dz2NrKcJ5e7Ta2D3bRQhfpyUZIWVgifS19QyJdHKFNpoquD6siA
         JU7MkUPdV/6JQCoIyt83gmjAf/tiucEXDYUGX4BkKu4AImoXsAd9zURwoKeWe8QUAr7c
         KvQO3DAW9fmreJUVRbhcVEJkA4EEwKUTkyjBfj6LeAZiSHE3DM6k+jjT6xCI18rbfiHC
         fgS2Da9cKxi9KdrNZJOioulZUVr9HDmbdLesRGXU2bmQ88vcveV6ciiGSzoJ6NyIefjH
         EweSqVV02x7E3d/BFQs9kTy7zSrUSQDiIQ9P/MIQ6VHJknbOkc+SfEifBNZ4TpXLaGfo
         95BA==
X-Forwarded-Encrypted: i=1; AKwUvBxhgmd6UgLriMmWool1/rxcBUCjpSCXovgeGgFkevLpV/RtJo/NpKp4U5D44peIXijOj2W79Dp865imgTw=@vger.kernel.org
X-Gm-Message-State: AFuF++mwcYN0/jVcsblK88IGmhc5il5a6kJw5XUjdCS/gGFdDywNQbOS
	jsm80jnDd/L2gkVKGsczBvaWwDedqmnTCod/N2JqMmu3uqE3a5EBpR+g
X-Gm-Gg: AYBFou3Qzp3CyQBizr0aasQF367PBDryMANQUpHwvV7eWRIJmhn3tvcvTNowVAGv2mb
	VRxrOM1IZc2YdPxCNjDvqLD9AcPhIpHrY4gzvIOA99W1RvNnhoxeRDxR9lgcSISNQ9Di3QAUAkb
	RQhg1sTbmgcf5k6757UBg/cg/Oc5dCMnmWuA0wsGb+/d3ShOXOuj4kMDErTqX9CvRYpXZD17YE8
	RQ96bnvODj3+3waZFEnzAw/BzQCCfRv9WPEFuv4TDs371Tiqzj6ZD1S/i6wBfQMSpDUzt8A3+ev
	kk38ON1BIdNyuTHxmDaS9yBMTLUgXiSEAwb+KHRJiIBMqX5Lk+NAQat0PNOzI30dPTUFTXBDUIX
	jnrgXthGysdiY3zxkNjirMfYzYfSKGliVrIlgVBiNbDGR82CHk7suc2AwzDqY9RNzd+6Q8QoVMd
	eVyj25eIs+Lb1PpH4io/V3tLuf/Q7ccq/V3CZhB+FavUx0eN7scM7n9+/BlByM9WYDEziuGNsNB
	hsINj8oyDk2RZa5dGf5SPl5xBwYb//xct8YnGHnpyCVvOI0YNMIf9CFBC1jtO6LSmvRphMa9Cp4
	WKfETmVX7qsTqCB9Rw==
X-Received: by 2002:a05:600c:6989:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-4a18e49da65mr45770305e9.8.1791565037785;
        Fri, 09 Oct 2026 09:57:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add ADC power sequencing support for RZ/V2H(P) and RZ/V2N SoCs
Date: Fri,  9 Oct 2026 17:57:05 +0100
Message-ID: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for ADC power sequencing on the RZ/V2H(P)
and RZ/V2N SoCs. It introduces per-SoC probe functions for the
renesas-pwrrdy power sequencer driver and ensures that the necessary
Kconfig options are selected for these SoCs.

Note, the ADC driver and binding patches have been posted separately.

Merge strategy:
option #1:
 - Once the pwrseq-renesas-pwrrdy driver is merged in only then
   the sysc driver can be merged via renesas tree.
option #2:
 - Merge all the patches via renesas tree.

v1->v2:
- Passed targets and match pointer info as part of OF data
  instead of prober pointer to keep probe common.

v1: https://lore.kernel.org/all/20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  soc: renesas: rz-sysc: Make power sequencer auxiliary device name SoC
    specific
  soc: renesas: r9a09g05[67]-sys: Instantiate power sequencer auxiliary
    device
  power: sequencing: renesas-pwrrdy: Support SoC-specific probe
    configuration
  power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and RZ/V2N A/D
    converter support
  soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for
    RZ/V2H and RZ/V2N

 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 91 ++++++++++++++++++-
 drivers/soc/renesas/Kconfig                   |  4 +
 drivers/soc/renesas/r9a08g046-sysc.c          |  1 +
 drivers/soc/renesas/r9a09g056-sys.c           |  2 +
 drivers/soc/renesas/r9a09g057-sys.c           |  2 +
 drivers/soc/renesas/rz-sysc.c                 |  6 +-
 drivers/soc/renesas/rz-sysc.h                 |  2 +
 7 files changed, 103 insertions(+), 5 deletions(-)

-- 
2.55.0

