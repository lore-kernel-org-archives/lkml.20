Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508BD3BFE47
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206917; cv=none; b=bh03pT9xXuXFP5K3Fum0S4Y2ad14z1DByoLfsXwNjJ1cEP+VHV4jntex7sX8VGvTXAssYkPqAZM4dxBioG73TEw5X8Vc8baY5Lq1ZZqUvJpmbJyzFNeMIVdfIgYJonSXnQv0mL2uWtdxqgYtYjs8o2bQoOPMzHcN/aLDmjDe3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206917; c=relaxed/simple;
	bh=NIrzuAInzsj2sYociheA3JTrwufIGgyVll09+vFspTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFE4rc08qVJjowXf4qAv9WWhvHKanvAKROwG+gBYd0N+YSBp+ZyTt/sS2fyXOIyTaG/6H5eP+W3i/xfRqi1o8m6HdLxyrqaCYXkabcSR3pLHLHUNPEz8p8xua3AejDpMvNYA390U15BsOnN1la0srfuR/TV4OpP7iPUoxySVcPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFOlgPeP; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFOlgPeP"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so1639793c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206915; x=1790811715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdOsqo/iziUsxrRxdJAZK/HE+PMHIxiZ0e+DSZHPK1Y=;
        b=AFOlgPePOHdTP+RZjFdY4gUpeehfoiCKqCxEgdBSDEkl6sj4w3hjx6cWHGavsQM4EU
         DEJ/EgS5QArnVQLHRGyTyJp1zc4Uk+xsfQY9yIz5KVNqF1HfkrsPvKBKrbjCKDyLBfEa
         ocj1nhiS8RPVU0BOS/eijZC1TrbxrUJDzA0PZXIiARUO63vsSa4PyrqZ4CibVazNNlZ/
         iCxW9bWuWrzkCCsGjU3s22vORvw1fbgDdfqL4CWhU68Tj4MDqDg2UdTtZrFCtePF9kLe
         Gpe535zxF+aInL7p8Ey7lcJso1JV6HnTXVInS9clEXcV+URtmQeZxUBc/GtYD7/S4V+d
         i8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206915; x=1790811715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdOsqo/iziUsxrRxdJAZK/HE+PMHIxiZ0e+DSZHPK1Y=;
        b=MWu9VCHdjecI72PBnb3Y4m8OLFpf18U/BxuFThlihGqfjANcQZJhqSES4jrrKQdONv
         ASYTEa7VBY42gAAjDIGDcJS0fCy7hTUil9n7PP6rQIk+wUzwauHCfS6/09O7dNKjRP60
         t21zb2Pfht4VagyCF8VaKdfCqclgcK17RmygheUuuyjSPd0vYvvg5MdIPjME4jruJs2v
         QnvrPfYRhcHVJxGL2CZR1TMBKx9brkv9+m2Qz3ZgUkJxWoUvVpvW/wP/88bNQwhm/XLJ
         4FDaHJKD+HEuFRHRobbimlgJU3N3iLhJk9MGXkGK5C24Y9aAHzcR0btbPpfmoviYy/5h
         NZWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwocBje4F4qDnGO/hwPKtTstL47z+RfbhGhZf+0pLjN7Nm58uYqf24VkhEi/jCCK3F4ghrfE62w++95ifo=@vger.kernel.org
X-Gm-Message-State: AFuF++ls9mmbHi/y7/iV9vfW/NlR6G/owUyJ9P8UJS0p8mGIB6gDV/MS
	9EMrBGI+8E+sTuJxmxlP7URcpNoUslkLAY7A0BM5lVXiNA+uRsSZcsjU
X-Gm-Gg: AYBFou3TcV7ueN3MiD8cmx2qbbIcCe8Fl6hI7EATTC+wSLgAUtTm+cDN1Azuwn2grsu
	D77djwqdIiu8ga9cAs3oeMxNRDjGOa8w6VwkKrUNOSGZQNi5TXiDLfnqCzDriPA6cPGnjQXgzi0
	dwGtrSsE+BpZLkZL24HAUjwZP0TUdHKu+GWtgyoVH945k7GOpPQxT3+kT+y9HhpqkKehLmhNkYF
	cNGZ0ZiucGy2y928cSpR6bE7ANU+5AJGvE+v88LKMl0YSO3jbFJjg32uKyrcyBqElwej6zoUQ65
	IVniARhfNgu/WiT3xZLKt8sEHXCATVF5+CzR3dY1QfittG/dUq6jaXBoq8BNk/D9/gROYLS/mLC
	UkRvVEnFuPGXDS12ibGZjbH2rdENBoZuTxIw/rEXcM/QjSgipJtWn2hqXar7GNndS2lPMyRmRcS
	f+r1QzPsULiIcmYdUG8BuQj3U68IySlTwwahlmBlRBoMgHvbqjXMltRiH7Oea8IU/agRo9wRbLn
	2Lvm1CIzw68ciiRWotrYoyTtfc7ahtlNqnq
X-Received: by 2002:a05:701b:4247:10b0:13b:9d10:4fd2 with SMTP id a92af1059eb24-14503fc80fcmr486501c88.22.1790206915130;
        Wed, 23 Sep 2026 16:41:55 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:41:54 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v3 0/5] media: ov02c10: get_selection and 26 MHz clock support
Date: Wed, 23 Sep 2026 20:40:55 -0300
Message-ID: <20260923234100.318151-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923144257.119076-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Raptor Lake laptops, e.g. the Samsung Galaxy Book3 series, feed the
OV02C10 a 26 MHz external clock, which the driver rejects at probe
today. This series adds support for it, together with two small changes
found along the way.

Patches 1 and 2 are unchanged from v2, apart from a corrected commit
message in patch 2. Patch 3 splits the PLL registers off the mode
tables, with no functional change. Patch 4 adds the 26 MHz link
frequency to the ipu-bridge. Patch 5 adds a 26 MHz PLL table and picks
the PLL table and the link frequency from the external clock rate.

With the other PLL registers left as for 19.2 MHz, the link frequency is
mclk * M / 19.2 MHz, M being the OP and VT PLL multipliers, which are
set to the same value. The 19.2 MHz tables use M = 400. At 26 MHz an
exact 400 MHz would need M = 295.38, so patch 5 uses M = 295 (0x0127):
399.479167 MHz, advertised as such, with a pixel rate of 159.791666 MHz
on two lanes. M = 296 would give 400.833333 MHz. Getting exactly 400 MHz
from 26 MHz needs a divider with a factor of 13. I have no PLL
documentation for this sensor. Sweeping 0x0301, 0x0303, 0x0313 and
0x031c around their table values only gave coarse steps, no output or no
change, so I don't think such a divider is available.

Tested on a Samsung Galaxy Book3 Ultra (Raptor Lake, two CSI-2 lanes,
26 MHz clock):

 - link_frequency reads 399479167 and pixel_rate 159791666.
 - I rewrote VTS over i2c while streaming and fitted the frame period,
   from buffer timestamps, against four VTS values from 2360 to 4600
   lines. That gives a line time of 14268.73 ns for an HTS of 2280,
   i.e. a pixel rate of 159.7899 MHz, 11 ppm below the advertised
   value. The intercept is -0.02 lines.
 - At the default VTS, a 60 s capture runs at 30.014 fps. No frames are
   dropped, apart from sequence number 1, which is skipped at every
   stream start with or without this series. 30.014 fps is below the
   30.105 fps that hblank, vblank and pixel_rate describe. The cause is
   not the PLL: with the exposure at its maximum (VTS - 8) the sensor
   stretches the frame to exposure + 15 lines. That is a separate issue,
   which I'll look at on its own.
 - A single CSI-2 "Frame sync error" is logged at stream start, as it is
   with the unmodified tables.

The 19.2 MHz path is untested, as I have no such hardware. It ends up
with the same register values. Only the write order changes, and two
writes that the per-lane tables used to override are gone.

Changes in v3:
- Patch 2, commit message only: the crop is centred in the output size
  (0x3808-0x380b), not taken from the readout window.
- New patch 3, splitting the PLL registers off the mode tables (Sakari).
- Advertise the 26 MHz link frequency, 399.479167 MHz, as a second menu
  entry and derive the pixel rate from it (Sakari). New ipu-bridge
  patch 4 lists it in the fwnode.
- Patch 5: short commit message, dev_dbg() dropped, no 0x0315 write.

v2: https://lore.kernel.org/linux-media/20260923144257.119076-1-calliarifelipe@gmail.com/
v1: https://lore.kernel.org/linux-media/20260905030732.39196-1-calliarifelipe@gmail.com/

Felipe Calliari (5):
  media: ov02c10: Drop duplicate register write
  media: ov02c10: Implement get_selection
  media: ov02c10: Split the PLL registers off the mode tables
  media: ipu-bridge: Add the OV02C10 26 MHz link frequency
  media: ov02c10: Add support for a 26 MHz external clock

 drivers/media/i2c/ov02c10.c          | 134 +++++++++++++++++++++++----
 drivers/media/pci/intel/ipu-bridge.c |   2 +-
 2 files changed, 116 insertions(+), 20 deletions(-)


base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
-- 
2.55.0

