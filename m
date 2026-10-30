Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383871;
	b=si0/wa3HwFrCO5V73wpos9cCHacwtjYGbRmODZCDhnj/qnudcvXcmVZSKL/ZgOhhkMxD
	 w88njR2ltUEEXhOfmIInp/h+aNc2Xl0FZ2+orfugORUf9R3haXQAJLbTA0p4IWaa734il
	 840f0YVzoA1zMO6Y6c1Ugq9TSPUcD1+gglIm52bnLd+qcD0K2YBWSFdUcv4Rw2Pf+hm3i
	 kNrpfPoJhcaV1Uk8LU4xJ8DI+QNbIKSFgz7Y5JlIQkmRHjyDPHHaOyn8z+a7HMnMmBEAJ
	 gJ9X0vKdjlHVm08lLEKmAImRM2MaMG+T5y4ETKYL9dorWoTol3Htxqs0ZYJjA+VyVTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383871;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ENwKWbPNvS8Z4Ya5TukwYEHVlcVz+1SrF/4rTtdeRYE=;
	b=1DtsA/Mux+xMH4ENYSsQ/owaG4g2d3a69FhItPirhk56nhFbhR8f13HGDsP1h6livaHh
	 EqlaUsBazQ19/2n3WHJCfWLK4JERfQ3xJXU5oIQOFhI5Blw5UVsQVc/S2UTo4/+J6aDzX
	 qdkqgAme2miYnw6erd3e4dM5zZg8HtAn2mm6bz4qyL+Ui2x0eiCreNenkUZGKzYO3EdWk
	 +A7SonCxv5RdkcdTsn9uFQWtjuLu0PuWvhyQ7/9mOvRx6YnBTFjFq1F9zbgq8F4dbbE5W
	 UGXb91LhL62Ml8xdLAwC6ym5siYFURM23e/M/8xzX/akYemMRXDaQgIf9K8WqSP9bUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fWmFVWwf;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D3B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fWmFVWwf
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so457081a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383870; x=1793988670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ENwKWbPNvS8Z4Ya5TukwYEHVlcVz+1SrF/4rTtdeRYE=;
        b=vZe708a9ls4B7KNllx+igDb1nSzeE5srFRlOGMFb+GHCJX05y3rcrkTbvHjaHDSs6a
         QXcsp1b2xGpWrGCJjEZEOoe7fIN8TelcEYVZ8QjGAuOv6+mE20Mh6hzeyzj13/txEKDw
         /TI7ac8vJG70vKCqjkpaC3RMh/THnX9PpHI0gvwwz/0GhW8LxctNZn+6qERj+zobYNC9
         oStsFvEe3bQXc1anHiOlAvH61t8K+yk9YE5AjKMS3E2LT2Q9J7T2bGcYwzjfhrgTDXKS
         xD//K7NWbETFaE/HN0fzAiE9uK/rN9j3O9wCT/vm/DTRiFHPMwrB8aSi/JBe124OCZJj
         dUjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmtEL5HYVpt3IlvCSoc6MZ4zajTVo1f10e2gkMTRg9JyZn8v5u8CDMpvyMmksE5lQWxYiNgvR1BbBTChQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmpHYoYslkxTlY4IIJN6jLotbMUz30ltXeqwctDtXkfi8Eo2V6
	s2DUf5UQF3qKaBz35QlLcmngAWk7ihks39acn6fDuO0F308Msspxxp1H1udTdEkmXUir/XM7cxw
	F8Z1h7tWWOnsIWXSKOlSvKtk5bkAN0e5CGd/u7mu5RRAN3XcFqaPOuf/KiFeV9E/7NM5UeJsvtn
	5Toq+SzKGs+97xMqhcDH71TN/PkRcacFiX/XfVNsVjtDJKhJmcfUvu08Rkm2XZwI2ALvhHS76xc
	rJD5ex9cipSk0Gy
X-Gm-Gg: AYBFou0MdSJPdl+ZOcBdxy0MrXdrLw/eYU2Sg2W+g9tsVJvGKNC3Z1CUZzRJqMCsgOR
	eG4Hzp7ynDlXjMcLx4Yip4M99JVpEazLr5nYBNRgOqMAdNr/sQF+KCAXS8zyNkHHklLtWcgQgw+
	+l45OpZLf//gm0xeMfZRJEP0gx4fXgyp7yZXqGrtzBQxFuW642XRAjAeWvlfjNlf289I86p4vKQ
	neLGCJAN+F5Q6IMr6sL5iIPx1pK/GTr2VAHNbnqkA2/dTT8bfumSki+XmZqhiQ9VvuHHpSkN+PZ
	BVR/egl0lYGCY2LKZ9awNjDAyWXwBXibTCyu9ca8fFZyriwoR2z0lytbWQNY5tQYa1CxlvUijZk
	vixe4MVMT3TxmbBFaTUdJnZ3bA340rZvYIcQKm4O/H9x/dxEEw3GzHe/fcKA5kRUjojR8DBML1a
	w8Wd+ZrsJUGGXpKv9kqOy4ECbayXY3Sf+3
X-Received: by 2002:a17:90a:e7c7:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3ae8953618amr2487270a91.1.1793383870091;
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e84adc9sm4385867a91.5.2026.10.30.11.11.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so3291493c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383868; x=1793988668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENwKWbPNvS8Z4Ya5TukwYEHVlcVz+1SrF/4rTtdeRYE=;
        b=fWmFVWwfFFznQYOWpN98DL8jaN+4yzy9BpHYt06HW++iHPcsdOMN7h99SlCM5Tov5q
         wvd9z0zdGvUgSMAE/5OTpS+QXqcC+SN70wPv6KVpKZu80HXyXl4qnVP/OdOYnQW/MdHM
         oSozGo3aZB/TRLOjorv23M+UzDI1JSUhRE0g4=
X-Forwarded-Encrypted: i=1; AKwUvBztHDWvZvZ4ah4xss8ng3xYF0FW5coCHcEY7pe+E8bpPep97OrICbRkU5EMt87CbvrAQ6saf2nNKF3y640=@vger.kernel.org
X-Received: by 2002:a05:701b:4784:b0:165:4b88:abc2 with SMTP id a92af1059eb24-1ac5b5ee632mr5419026c88.26.1793383866879;
        Fri, 30 Oct 2026 11:11:06 -0700 (PDT)
X-Received: by 2002:a05:701b:4784:b0:165:4b88:abc2 with SMTP id a92af1059eb24-1ac5b5ee632mr5418989c88.26.1793383866189;
        Fri, 30 Oct 2026 11:11:06 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:05 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v11 0/6] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Fri, 30 Oct 2026 14:10:27 -0400
Message-Id: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware accesses the
card directly during resume from Suspend-to-DRAM, before the kernel's own
resume path runs, in order to load boot code using hard wired logic that is not
field updatable. The card needs to stay powered and responsive for that access
to succeed, and since it is never power-cycled, it also needs to be reset
before the kernel reuses it after resume.

Ulf's v10 posted patches 3-6 and I'm resending the whole series, as requested.

v10: https://lore.kernel.org/linux-mmc/20261027144051.249211-1-ulf.hansson@oss.qualcomm.com/

Changes in v11:
	- Rebased on the mmc tree's next branch.
	- Patch 1, 2: Resent by the author to complete the Signed-off-by
	chain, with the DT list and maintainers on Cc.
	- Patch 3-6: Added my Signed-off-by as the submitter.
	- Patch 4: Keep the comment about suspend methods being serialized, by
	moving it into mmc_set_host_pm_flags() (Shawn Lin).
	- Patch 5: Also split the cache flush out of _mmc_hw_reset() into a new
	mmc_hw_reset_recovery(), used for the ->hw_reset() bus op, and renamed the
	patch to "Move and split reset functions for eMMC" (Ulf). The flush is
	redundant when resetting at system resume, and failed with a timeout,
	printing "mmc1: cache flush error -110" on every resume.
	- Patch 5: Dropped Shawn's Reviewed-by as the patch changed.
	- Patch 6: Claim the host around the card reset in mmc_resume(), as it
	sends commands. Without it, WARN_ON(!host->claimed) triggers for every
	command sent during the reset.
	- Patch 6: Warn while parsing the DT properties when
	reset-card-at-resume is set without keep-power-in-suspend (Ulf).
	- Patch 6: Dropped Shawn's Reviewed-by as the patch changed.

Tested on a brcmstb board with the Kioxia 016G01 eMMC, using "pml -d"
(S3 suspend/resume):

  keep-power-in-suspend  reset-card-at-resume  Result
  ---------------------  --------------------  ----------------------------
  no                     no                    Enters suspend, board resets
                                               at resume
  yes                    no                    Enters suspend, board resets
                                               at resume
  no                     yes                   Suspend aborts, -EINVAL
  yes                    yes                   S3 suspend/resume works

Kamal Dasu (2):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  dt-bindings: mmc: Add reset-card-at-resume property

Ulf Hansson (4):
  mmc: core: Add option to keep an eMMC powered on at system suspend
  mmc: core: Split sdio_set_host_pm_flags()
  mmc: core: Move and split reset functions for eMMC
  mmc: core: Add support for resetting an eMMC at system resume

 .../bindings/mmc/mmc-controller-common.yaml   |  10 +-
 drivers/mmc/core/core.c                       |  10 ++
 drivers/mmc/core/core.h                       |   1 +
 drivers/mmc/core/host.c                       |  13 +++
 drivers/mmc/core/mmc.c                        | 105 ++++++++++++------
 drivers/mmc/core/sdio_io.c                    |   7 +-
 include/linux/mmc/host.h                      |   1 +
 7 files changed, 105 insertions(+), 42 deletions(-)

-- 
2.34.1

