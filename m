Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684037;
	b=SdxlGq02xMTaBNQqkCnkzLWkNdpzGNmZS2UigyJ1AdR8H9KFfSiQtPmQSXEXLhQoOoSF
	 5clJKaSI0mvNSIqPjPNzMDeMW0cxs6MdD5SWgF58A4f7SkGXqbBdE1gZPhzrrp+h2dcB5
	 DGBOXROjXXcVA5l2Hemo+uHHapg7ZVT2+VM3odFvRMno1t1eiQiZ8Z3nl6BnVBU2GDFz7
	 qZVE03ndIu0G+zO7yWOgDxJQuPm39o3kFrBastWDX8ZU70rUY9WirS5JiqcSETOeu5gx+
	 ErFvqaqXuO+ljz0v5+4wHdv8S9c8Yx/GcBHiIaHljwo2KkTP5wnHVKLmgIBMwMlmrzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jrRlpQEwXgiRcoz4RvmnIKknxKuf/PJC+lqfeOzsn1g=;
	b=1WQje9GZSE8pKmURWhjxkhPhyTyqkTvIcyL1MKM79NlCDVzRkc+xwSQ68OWAGzKyqHcf
	 BPNrLq89GyiJVVthH5bpKM1YJC+c0R5pXZ9brdhid9vb4+MEmxI+X2/vH9+tid7O6Ws8l
	 wt2cqZ31zBWJQbp3nS8a6iJy49wD5+C9r5YLnERjKHdmNAyQ4b+01p21XMdDyDvb2/pTr
	 CfCYGOPfuDGVjXxFPutIJcyGkdSMAaWvq3IxNdJBkMpIH/5PmBOg5iw0CsGf5hb9EaI7S
	 CFfr3RYtS+VjPxwUL4L9u+yUa9EoY98KQO+oRPKiME4r0+0POt9u3SfdUCM2RAeOG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JXxzHqE;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B164E606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B164E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JXxzHqE
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91ecdaf14beso31859976d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684035; x=1795288835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrRlpQEwXgiRcoz4RvmnIKknxKuf/PJC+lqfeOzsn1g=;
        b=0JXxzHqEh8fSrjQ0Z/U8UHFlKbWK0bllk68IE7aVPUqxfLncjP0dz4ZCHI5b/s8hiX
         0gyH3xFnbj8UYoGWSYziCoPqtGKBeL4DNyvT8ioOJa/pg4iS35TnGVqaHaxRvepcy/rA
         vX5FZ3ixE4GXyGmhgw8bkSmZF2Lv5EnjDHX3WUBCaiZeTJllFChaOTrex+WU2GY9Xc0m
         S6cl2cAm6p/A0tuDQvuYf3+UcnFfUCEOnCrsiZ2MkdcQC9+U+YSskT6g+/Tl+f5ns46X
         5KFDZ2jH46C0tWe1IXjGof6k7DX6FnuK7aVQSJ6vH/4Q+29NUA7mk8nDEMeBwq/Faaxj
         UEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684035; x=1795288835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrRlpQEwXgiRcoz4RvmnIKknxKuf/PJC+lqfeOzsn1g=;
        b=sI1C1YF+9WpBJAxtAYz9x23bxYLw9Ti3U+RYnEqIQS1LnlNMc5PWf54kbUy83B6KKD
         WFe2kR92wqNk4oTU3UiC/sZbOC9tXrDw8TpdlIAa6CV7/hs9CUbWVzfSLf3lHqRbjiNy
         EKM24rU7j/Q3u0dPlLtG5gNKkoxyiyJ+zuvGx7rK5DWm7NzaGnemgzJ0cZ4gMYic77x3
         fGN8SCoBtNU+0ohuP369An8MWdBBOPM+8FZFdpWNOs0QP4YzT/gjUwb70np7RtwE6LS4
         mKzuDV2h2TjL2X2EVXSfEw2kDcaW5s8SjX3V47xfJnhmYtMIgAohlX6+yuq+Q0DIRSPl
         +a+A==
X-Forwarded-Encrypted: i=1; AL+hErFDkvj9E3i2UtWy8G0tbNkvRVEH01UkQJTmMCsN9u6Fj4OZPijAGnejJw1/EeQVTcW0GHYLVSwntR/kTeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BZhKsaYIFBfhZ73vnQxJz9R/RRk86EVNCWGhT0kN0Hgv6Ae85
	yEpT5VEMoYax92zKOAp17CULrQIv5V1G2TqESkpSz/qUjaa8k0hOGgJOAMij2Y9I
X-Gm-Gg: AYBFou3sDfatM56z4d/13lRA8gvTMqWTTzPkdXUhkuUsUa4TMEoHv+W9B19NfmdoBHv
	7Sfh3MhcQ1OG7AqQzzDK4tgOIJ9E90mCqV1VmwmHvGl2rynbx+2nqzzm6rkGprCBUtXCPamVIyX
	e7gUMoi/MQCBoEqBiZbcsW6LToF6c52JhZ965OSPp5+Ote9agiV2FRbIFhZV7CxknN7I2FkRAqf
	Zi0bZ6kmQHkJYk9Jd8/ZPgvP2wJG2LfaapOgRubR9HNRWDo+ucJNn6dvh4RSSa59/KtmC7+xks2
	8hLpOjp31h5Gmc8kQf99J3uRy4w5EH6TKl823k7Jrv6kIcWtfCV3mJ/liZd2egLlJwnjoscRHOT
	7wNuxUJFiCvpStAn1e4xwbfpBLJeX7ilfpNTIdcrLjv4Sy1xhNbUfQ+0J+/gLYVaTT8PYnGsq/R
	ooMEBpgWtzXmp4m1LpTPdX/0YTHNC7wfZ8qsk4Lq2Q6R70ELmTfZmrKo5Bz67ngPCEV3PIdmvc5
	BAHGxt1fM9nmvSO0RgntyWeEvP/07PIaPFDCDwULP4H3xf2WCqfqVmbdSk7g/jaRe7R21DjHuId
	DZGf3Rqgd4AYQQZB6BKB8L7sEKBv0S9cHwI=
X-Received: by 2002:a05:6214:2f87:b0:919:557c:f0a1 with SMTP id 6a1803df08f44-91f241b9d98mr94261976d6.24.1794684035598;
        Sat, 14 Nov 2026 11:20:35 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 0/3] mtd: rawnand: vf610_nfc: fix the OOB of written pages and command timeouts
Date: Sat, 14 Nov 2026 20:20:28 +0100
Message-ID: <20261114192031.959376-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Three fixes for the vf610_nfc driver. All three were pointed out by
Sashiko, on the large-OOB series [1] and on v1 of this one [2].

1/3: the ECC page write transfers the spare area out of the controller
SRAM but nothing ever puts chip->oob_poi there, so every written page
gets whatever the previous transfer left behind as its OOB.

2/3: a command that timed out can still finish later, and then the next
command returns before the controller is done.

3/3: a timeout is only logged, the callers report success.

Tested on a Colibri VF50 (MX30LF1G18AC) with v7.4-rc2, PROVE_LOCKING and
DEBUG_ATOMIC_SLEEP. A debug patch skipped the wait of one command, so
that the command finished after the status flags had been cleared, and
counted the commands that returned while the controller was still busy:

  unpatched:                       250 after 100 forced timeouts
  completion reinitialized (v1):    41 after 100 forced timeouts
  this series:                       0 after 200 forced timeouts

With the series each forced timeout came back as a read error and the
reads after it returned the right data. An 8 MiB UBIFS write read back
identical after dropping the caches, with no ECC corrections or
failures and no lockdep or atomic sleep report.

Changes in v2:
- rebased on v7.4-rc2. The large-OOB fix that patch 1 builds on
  (vf610_nfc_spare_size()) is merged, which was the build failure
  Sashiko reported on v1 1/2
- 1/3: comment dropped, commit message shortened, no code change
- 2/3: rewritten. Sashiko was right that reinitializing the completion
  is not enough, see the numbers above. The idle interrupt is now
  disabled on a timeout and the status flags are cleared before a
  command starts
- 3/3: new

[1] https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-mtd/20260828085340.3916239-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
  mtd: rawnand: vf610_nfc: keep a timed-out command from completing the
    next one
  mtd: rawnand: vf610_nfc: return an error when a command times out

 drivers/mtd/nand/raw/vf610_nfc.c | 41 +++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

