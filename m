Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81A525A8C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548629; cv=none; b=Z7w2glSpqbHiV7GgxLN+I/nX5eih0u+BxUK4iyNLtl/w0ylPffm4SAGJVG8nbzVW0GcaiAtCuGQ1/5KYMrDbrPshMboudrKmto3eYByzLZpruIkhas/Sx3YwwpllaCbRxYpui48SABCQi77uIw8f5RX3/9M+FPs6T28oCjZaGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548629; c=relaxed/simple;
	bh=A9m0mh8f8IjC95C1zkUbGFWy89TvGySuHobeN9QBoX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gb9U5ojIGVtiYKsXGToV/dpRyr0LeQUzyvGVX8cqrI1cAML/2nC/SXhPad4N4pz8ISjNT+h8RqNZSh1JCbsgpjJhix3M2AaYnP6ib4K2IEDC8JIgFHzAZyYieKo/j11vlteHJwtldiAU/Sr3+PPi/QvBYsW7izqwRHNpiuVztbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM+tpk/l; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM+tpk/l"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso9437055e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788548617; x=1789153417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sRadvJkA6sgMBOr6kXGejRWQtN1yeGZ40ycoOtIUIEg=;
        b=XM+tpk/lRu2df499Giyb1E5V78kZ4IZQr8hT0+ror06fT881fL0E6Oo0hFsT67ftuG
         FQhkM3ae6Ogk2RD5LWtCd1LHJdtd7snXpGDhCghetyVGWu5BW44jztsCBVEm7PbRfa3e
         iUWxPq3o/I4kMilCXU1OZx/GxfYumeVSaIZ/u7LhLfFKYtDKhxGHUhMovo4yJ8wGLYRA
         aYrnS++jlSdz2ZvglMCQ0+iZlhp4vK+SchayAYzdCHvplRsI0Iw2hnYj5O3Sybuxlp2C
         e1vwEfL7x0m6oaWMTv4XqKXJZSZDZ8UIQHSJlGRr9F9LR0/w2Q/JRFcgYeSwBO17+TwX
         la5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548617; x=1789153417;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sRadvJkA6sgMBOr6kXGejRWQtN1yeGZ40ycoOtIUIEg=;
        b=CI24rUopEi8Wu4+gv8x7vX6joz+yl0Py8j9Fry1l1cK9MC2NWK4oYbcJSzdSDQ/5E/
         PaIUw4kclVP2Z+2V08pigFmeNVruADtUTvBW2TKFTDkYVmb6eIqacIp5ZvLmiSdaVyu1
         nV+hU+PNY6RSela0W8zGu2B72PanK9VU6SMef2/Hf0LExkZkhmPKLbPiCHJR79rZ1XMt
         joRn4FWxnikd2/71q3F61bjqMF5JlL7UaKw3dweoEwWYvZ7TJ5WhMOVT54cNZ0tanjOt
         DKvHsT+W+BnKJ1jMd0zOzgzFxyuxBYJo94quRDemysO/XqzI+PjMSRU9hkmsHcOfd8zR
         lmZQ==
X-Gm-Message-State: AFuF++k7nlaho95tcX0lfb/KgKANogPFRx94FiU5+JAJln+eHmRDpTZD
	C+S117DY5lWcujysy38sz9KwH++WR9CbqLRMBAyi5GDnis0DxfpPgY0Sn7wm
X-Gm-Gg: AYBFou0Mik/QzeJ9xtyy46NM+SVZ/Z7/pmIkAlf+QUPC+8AykL68EXHCgQMTLsAbv39
	JY2HVS5N7yXzGkTRo7bs07oCNOjZk1ULKmK3pU6SjODK8WptF1TesE1j0JT8gPOylPNAexJTl1/
	4zPAn13U8FUG2HhVusbYya4uzc0fNiYKst3AXHzamllUeXoll0os1wHcGjR8WNH1OZFyWtQMcz1
	MHI/NWtxKRm48Gw+uI8zLLkO37AhyEGr91AlwmGYCih/FhV8ZTohd85D0fCNY0yzj1AAUa4GQsI
	8QPIbETpk6DQMyJH4VoC02IIys8rscedmTGlYRqZejzmbrI3yZbJFu9lJHxOwgJVZ7w9+n13a3e
	zOIPcClTgpo31bAOKW2gjXhF4dj4nbB+p2qJ2Mf4jG7JlEPvYtxPJU0cBjjxB+iASAzaMzxMtNU
	gEBdQTaxKQUJbLxq/O2wQn77lAzHTCTp7ji1ePNUc214s3JsTGnN0F5MUmbwV6YKmPboNmhfCLS
	ZZI7nchbyvV+0mNnELatCUEuMmvHda1XxBlGJdq0h33PQ3OeZX7tY4xkMo6/ZoeniWDqVSU2bGo
	MkRA
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr86248715e9.6.1788548617299;
        Fri, 04 Sep 2026 12:03:37 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7710aa5sm89643535e9.7.2026.09.04.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:36 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] wifi: ath9k_htc: cope with lost WMI reads
Date: Fri,  4 Sep 2026 22:03:30 +0300
Message-ID: <20260904190332.815525-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the USB devices every register read is a WMI round trip that can
time out, and ath9k_regread() reports a timeout as -1, the same as an
all-ones register. Two patches already on the list handle the reads
that caused the most damage: the spectral trigger no longer reads the
filter back [1], and a failed multi-read returns all ones [2].

Patch 1 stops ath9k_htc_calcrxfilter() reading AR_RX_FILTER and
AR_PHY_ERR back to find out whether a spectral scan set the PHY error
bits, and sets them from spec_priv instead. Patch 2 counts WMI commands
issued and timed out in a new debugfs file, so a timeout can be seen on
a kernel without debug output.

[1] https://lore.kernel.org/linux-wireless/20260904181709.788886-1-nerijus.bendziunas@gmail.com/
[2] https://lore.kernel.org/linux-wireless/20260904185253.809209-2-nerijus.bendziunas@gmail.com/

Changes in v2:
- Drop the length-drop counter patch from the series; it is sent on
  its own, it has nothing to do with WMI reads.
- Patch 2: the counter is named "Issued", it counts commands that were
  handed to the device.
- Add Assisted-by, rewrite the commit messages, rebase onto ath-next.

Nerijus Bendžiūnas (2):
  wifi: ath9k_htc: derive the PHY error filter bits from software state
  wifi: ath9k_htc: count WMI commands and timeouts in debugfs

 .../net/wireless/ath/ath9k/htc_drv_debug.c    | 25 +++++++++++++++++++
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 12 ++++-----
 drivers/net/wireless/ath/ath9k/wmi.c          |  2 ++
 drivers/net/wireless/ath/ath9k/wmi.h          |  2 ++
 4 files changed, 34 insertions(+), 7 deletions(-)


base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
-- 
2.55.0

