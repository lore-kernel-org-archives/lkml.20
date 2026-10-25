Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937084;
	b=sr/pUsnvOvvfvHgGART0MN4iGwyHVeGc0gzE7UY2dspHRSicB7zSpjUnjID8VJnMHMHk
	 1BXL7IaJZomOZLW0ZQxajpITs13Ge9zWRBOGhx8U/tLma0n9gup7H6sBxucAAWceBj43Q
	 LwgusvedHvE8LSKS74AT8SfXYvCG/fNSmNlYO6WFwCr3fh5u/zyghbCR6PpMtk3R5JAW1
	 qcEbrd7wD8ObnEMkxX+yoG8ajeTNUg/hgxQ77dmTXsqQEWlOHtM2FhXa7C+iPy1as6fPJ
	 Hjsutsf9320+ow14KZJiMsMLSPc0XnQZBCWck1eLe92HqH/KXirbPN1XUpwvESJCnPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ri0CPShEuql4BAUZEt5/v7rw6sqPDnjjvp/wkFZ8g2o=;
	b=yxpy8xnqTIwgKgy7+wd/dSzHIkTvGeY8BhhLPsqVWUA5kIv+LHvlNfyKL0NC/xNcvvOf
	 lCXC5Cxp45ML2tux/MMnZdzOXc53erVWRU2W6p8QMeaaW8VjpAtlBAwQd3kK/wFCFc3VY
	 E1aGDeTlI6e1++3BeRshpNjsDauoZaNhsq/DdiKi0aLG+NzIixSs2HsIUGOaLcdj/afwX
	 NEiVN+HHwsYgI4gZCE3eIjy3Eal9O4nbvEGEd9aNnJzCulQkpZVACU+Ss6U5w/w0+6M7b
	 YJ9H2cKB6S8+h5HhSuum1vjTYh8GF9XhE6/hLruSQe/ieqtjjd1klGXhaKA43W7cVUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SjDpN5Dj;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8942606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8942606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SjDpN5Dj
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so4499745e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792937082; x=1793541882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ri0CPShEuql4BAUZEt5/v7rw6sqPDnjjvp/wkFZ8g2o=;
        b=SjDpN5DjCTnhznnyUfyIVV7i5xm+PqIL6QXKyqXFa8G2NJQ6k84eQdfRSr/lMkb/f1
         s0sWzyNB06ewQNCakES2NfeWkb3pioPR0z42VT9ERjg2nJS4V3y64dWjBS9Ek00efXYb
         finHWi9ats9CUH6KdxD+EwYM85Zt4j4asDR0LYgD0bdDFtc73SpDvQ1FrSfh7kirQhfn
         gJKyFyj3A9ypexVlwr3MD9ghP4lkMO0mvSeqY2zS5w+GN6i6UXxT38BfEydclyy3Rdrn
         bQaJ34hDcqqFsymi4vUUyXtXoT/AHJ8J5fXepQeksl0/mtXL2nvEIscWmckZnFNMvcK0
         mumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937082; x=1793541882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ri0CPShEuql4BAUZEt5/v7rw6sqPDnjjvp/wkFZ8g2o=;
        b=rUhmTkKk1fNJk8spmXW4PSLMRYHsPmneOm0JV6I6Nws0Xy7rrikYrWVmadUzbzmGuN
         9VAlCs9zoF8eNJ076vW2P4Xx2uSHVIYHC6x4UtBEodnf9+yY+bU4YzLQY4dKX6bI755V
         ud4jY8VqXawDlu07HkeTqPlUTk+fdR1uLefYJkOIj+l0CLYTPChz1AgjfoUp2/+GmMHG
         8oM1F448TDdtYRRTGAouKGQe1Az/OzRZGL+jadWqz3dYaQW02NcDdIsk1UCeJezG6d6d
         RozY9O1yLbe/tJ2sXmdqioI+ikJdfQc8spIONo7yXlK1l5NDmTo0iqe8QIKniQagSMD7
         CJUg==
X-Forwarded-Encrypted: i=1; AKwUvBwoilBu92yR+LbhPs5InOViWt3EHc3kk6Wn+wNcXrgPCEW5RZODQaLaWUX3ttvoo4ANMpoVB89Hnz4ITqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw8JCc4eBFStXcSkKkj9ffZEDZ3AWFjMtEW43YkjC/7aja+JMk
	FkHw6847q6kIzgE8zqfoFwdk6To8nCqT4hoSY3HNM8yXKTlB20C19CpeyYOjiS5JSqI=
X-Gm-Gg: AYBFou2D+pd5XO+n//Idw5amf5o6RNSW4NhTP4fJ+hZHYxugktI/Zi+HVG+prQhwtqL
	X8/j193mYFsxnRSnQWIUfc+EvqMlw50QXDA1IZWL/uGOlWkjZw1D0qULNtUUFZffqrHN+tE7v9q
	X7lGFNnLK2MsjRz939CFpS6Ii0UTjgduS2mVB3esSGIuxqueahjVamLSSouLhC3P0e8QQAfX94v
	7XA48rItUcL3L1HViIoboq5i+FZuMy0PDdi0dq1tjmPXYTCoLQ3eYBmiVBKK9unTmIk+NruYn3a
	tBAkMnYFMlMTkT0hGX9qLBwQYpr3iWO0WdVnMkwh2zp5ElKb3JYd/HPvXJp4i9eNCGEHwHqkKUz
	Q33vmJhIMp1aBtheBT098yC2r4a8Iw3bxOlBxEPyXNvZIj7U6DBGoaiVXTokm8LeVulJ9wBAls5
	cN59EVwPwuihkiF0j9mYqHElA7SMC4hHbjB1ztJuMuSHt8H421PHeckeMVNDuutUJgHTpku9iA/
	xiCg9gweoDt+R19DwLKQ6RyAlokhoUSrEb56WPpbrclaqXNU6kKmR3BfnGmgA/v6ZSk1ELt1o2y
	KZuL4N2gOB3+cWuI4F1yrCHCCUyfnxOV75nNJqV9boMaAQIbVKc5AhQXcL3BhJr9G7mSQeKZ/LS
	xYfji1btY5IOolZsgtPk=
X-Received: by 2002:a05:600c:46c5:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4a35acba20dmr76716765e9.35.1792937081944;
        Sun, 25 Oct 2026 07:04:41 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm112317695e9.9.2026.10.25.07.04.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 07:04:41 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH RFC 0/2] mmc: jz4740: Use the integrated DMA controller on the X1600
Date: Sun, 25 Oct 2026 15:03:23 +0100
Message-ID: <20261025140325.73204-1-olivier@mgcrea.io>
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

The X1600's MSCs have no request lines to the system DMA controller, so
jz4740_mmc runs them in PIO. This series uses the MSC's own descriptor
DMA there instead. On a HiBy R1 (X1600, SDHC, 4-bit, 50 MHz), reads go
from 17.3 to 22.5 MB/s and writes from 13.9 to 18.2 MB/s, with the CPU
free.

It is an RFC because of how a read is known to be finished. On the
X1600:

- DMA_DATA_DONE (IFLG bit 31) never came in our tests, masked or
  unmasked. Rockbox's driver for the X1000 and X1600 waits for it, with
  the FIFO thresholds (CMDAT RTRG/TTRG) at 32; we tried those thresholds
  only with the flags masked.
- DMAEND (IFLG bit 16) is only flagged while it is unmasked, as the
  manual says. Unmasked, it came for every read we watched, including
  the 8- and 64-byte register reads at card setup; MSC_STAT's DMAEND
  stayed clear for the 64-byte one.
- Waiting for the DMAEND interrupt made reads very slow in a first
  attempt (minutes to list a directory). We haven't found why.

So this version polls: a read is done once DMADA has reached the end of
the last segment with DMALEN at 0, or on DMAEND. Is there a completion
signal on this controller that we have missed, or is this acceptable?

Second, reads under a block (the SCR and SD status at card setup)
sometimes never raised DATA_TRAN_DONE through the DMA, and the card
setup timed out, so they stay on PIO.

Third, SDIO writes that brcmfmac glued together from several frames, in
segments that end inside a block, timed out through the DMA (CMD53,
-ETIMEDOUT) and left the bus dead, while the same writes went through PIO
cleanly. Transfers with such a segment stay on PIO.

Fourth, the X1600 manual's two descriptions of the descriptor's LINK bit
disagree. The code follows the MSC_DMACMD register table, which the
hardware matches: reads spanning several descriptors work.

The R1's Wi-Fi (brcmfmac over SDIO on the other MSC) goes through it
too: its firmware download of about 420 KB in CMD53 transfers read back
correctly, and with the rule above, 10 rounds of DNS, HTTP and ping and
three Wi-Fi off/on cycles went through cleanly.

Only the new ingenic,x1600-mmc compatible turns this on, so the other
SoCs keep their external DMA or PIO. Not tested: error paths (CRC
errors, a card pulled mid-transfer), suspend and resume.

Olivier Louvignes (2):
  dt-bindings: mmc: ingenic: Add the X1600
  mmc: jz4740: Use the integrated DMA controller on the X1600

 .../devicetree/bindings/mmc/ingenic,mmc.yaml  |   3 +
 drivers/mmc/host/jz4740_mmc.c                 | 182 ++++++++++++++++--
 2 files changed, 174 insertions(+), 11 deletions(-)


base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
-- 
2.39.5

