Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06FD4E2F1E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062154; cv=none; b=V+ap/WY++Lgq2zTmUdw2d7ZMwYuGGT1CjvSOTcz2WKYigKarYz+ZzGacE5rbY4g4QfQ1x/7RPO2dZ6Rl8T0A7y7/ypm9IwXAMqY6KeY/oq5z2JGbSIn7pNLYhAdeDGE8kBMEGkwwUtlyTgJ3AKJOpx6XUH9lxQSM4Q/tGaQAuN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062154; c=relaxed/simple;
	bh=euQQtVd/BkM8M86t1ev+NxS3ppr2DdnDQ0Zttt7cQ6g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OqxRen2mbozm8ihgnmIRzssg4aNmF1wi96yFPMugzNPbL8KgEyUBe+1waQY4VJIBWa/zMJJ/xjL2UhgZPCGYLfoK65VK8F9tW0XNuyO62VAp2uMD2rjZMWMkkNZ70wcAH7+9XGaN6t2E68CSk9aHJjF8ktiOkIn2LtJVCkimTzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmkrhbI4; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmkrhbI4"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3db57938so446240e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062151; x=1792666951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vpF/gDsfow8fb+icnqCdMQxuKKuSB5DN8xtKyMVbhYg=;
        b=VmkrhbI4JriTbbZ6RLmi0G4IIDO9UD0C6sUmS9w4k7qE/il6TT4JSd08nzrmMmj7xd
         Xo9TMtQVnKHm1ohLfWeEUNLnqxwezWYXLqTZQFRdyeAGEDeOqjQo59fw7aZsnlMsK5uZ
         tLYP8/zMXu7i62oATOW4jI4ajlV/RhedBF4TV+2ESEAhLL4abNcy3DSPRCW+T+miwHdX
         ikbslJ0r1VBt2YS5ISBJItvgqbe+QEQHUD5mmLTeELfkyey/o2waTmSolvJ2gh5l/Hx/
         AqVgWn2WX+cYF4lU/wY83JOcS4ACi+GZm3kbjBc0Sm3Em8FQYz72w8pDbnRcKJ5otC1h
         bU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062151; x=1792666951;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vpF/gDsfow8fb+icnqCdMQxuKKuSB5DN8xtKyMVbhYg=;
        b=GR7DVxFQ67vQYmiQo+7U2+xfA59ySUOFa5OYU+n/W0ntyI1MNgJn9j7WARUGmwSpYY
         w5ilRxyfBnrPaDrkBlixVJjuUFVRW0VIF0VSYDGEbKE56NoFol046LrAR8AMyF4KM864
         hoNhBb9Un/x3ppgltDcKququ86V/WwMqHZ4CH9wMRrCNq4npzeYoqU6+Fj0fjRSYvKaD
         UrNZJes516cnseiSLvHVA1rS2nMMhNRNmZoLBytTBZA/ki8eYpXTBkHJ7lN7sBPbrGKn
         XtbY6MyEMChWrU2wrBgWuyZh9zWJ/CATd5BitqcmiBYIWepj5H5WG1Iwv+9rxdXSmbtb
         mtMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjcFAWmw6INsJwJhCAuIlCF1/wUPrY0uT9abxX2wua88m/orknR/RlhgwdJDEswozMhNsXLoYNp+tguT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9YfCnl3Y4X7EnVc6qrerwBk7l13JrVYj8ewm9/PnbxWe09h2f
	zrYuz3BfpmLoiQwjXLFXfvPHQwbVQG0N+ALXCAIZ8qtkcMuiqlkB6gSm
X-Gm-Gg: AYBFou2mtM0E3HGZDrGlDe23mdRahydKA61ktZdU+t5aQEbkAjqDjSp6cwQ3pWZ/GlF
	p+yfG8SL5W/pg6JxM1SaE6PWT2U+VdgUHjaNNHVUPM8Ck1aAV6qMKLhZ63TFWrmVdCDFIEMDOqP
	D9qBfS2cvu5UC3WB4czAmh6Fb6N7zx3iy6UjbA209ARJc3W9TD+6vUC48LxWlZjGgayH/95KC5F
	zQl6xyfecCCV6mF7qMl/C/p/qwYWc/dVzbbt9htFmEHF91l008K8fCqtxk9a/D0wmqLv2tNmS/F
	SFOYkkkiW4FGm+oJll+aYqUxuELnfwCoR7cvBAT/MoClVX51JQRsGVS9jy97rnzRa7dS0sESHiT
	wQSjpsjC1AAJbZSEXJJ5sjYwm4LlKBwOofEQFzQjLTF6XtN6RkGiv1XAycBgB9z03QwoGPgpkp6
	vuAba5dG+IyzRTv4oeayYO0DwkYufBukbeqKfxUw5e8g97ev/Agh+1w2YSU1xhgYgaAxqYwKxwz
	lDFANFgtZCIDz04k+0DREFH/OKDziVTHbn5nWn3zrVhoaQ+paw=
X-Received: by 2002:a05:6512:3052:b0:5be:41af:8797 with SMTP id 2adb3069b0e04-5be41af88eamr376290e87.67.1792062150522;
        Thu, 15 Oct 2026 04:02:30 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:29 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v13 0/8] I2C Mux per channel bus speed
Date: Thu, 15 Oct 2026 13:01:47 +0200
Message-Id: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XSy07DMBAF0F+psiZoZvwcVvwHYuHHpLVEW5RCV
 FT133EqaKxmacvn+mo0l+4kY5FT97K5dKNM5VSOh3pA9bTp0i4cttKXXC86AjLAqPpCqd9/n/s
 IYFUWCqJzV19/jjKU8y3q7b2ed+X0dRx/bskTzrd/GUT3jAl76Mkn1sEisILX7T6Uj+d03Hdzx
 kR3hwCNo+qiZW+sTpmNfXSqcQSLU9Ux+JBMGmoR9ej0v7OA5Benq8simpOQs2nV0yyOmhlNpro
 hUooDs+O4+s+2zi7Ozj2jkJc0ZCcr5xpHzX+uOknORELt0IdH5xenUC/O33qiUz7oPMDKceOoc
 VydIaYIFjzpVU+EBTpoBopQJXBOAVTyAc1KYiPbkeK8M45i9GHwIj6tJLWSGzlvTTCAkC2pYFw
 rr9frL69fuvsNAwAA
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6441;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=euQQtVd/BkM8M86t1ev+NxS3ppr2DdnDQ0Zttt7cQ6g=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKdMyFsR7fqPper1zTmeTEdklbNmw1vy1al5
 hX3IyJ3x1OJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCynQAKCRCIgE5vWV1S
 MnDbD/sHTPyzlN8rCAFJ5PJ89ack6FbZY7Zm1Ji8y7CJRlHbrJAiT9szD30+tvEsag4iDo74mhW
 0fG9D9jcHAsciDIWA9X75coeko85K3KbbPRv3k/FxeMj3svesXWgZPIfYRJhPG04HrrpRQyX2Cp
 6vlAL8YxGjxA1wIR+YaK+/TbHa9yz0uii8+n/GBfgzVEbKgQJ8T74cF1AXkxWjJKk3HR/rCiNr8
 bYAsaVAQJS9dNY+j2IXa1ZFV+RsRQE8/26wSK+45N6r32tV+TfkSskwYcJ7V60b4yMfXettt/1J
 omzEM5ZMQ/b13D59FbtcapBKgE7bXzTswCrXGnupiAPHaBpOhOIsBrpUp5xu9belfGSiEn/012b
 yvQWHk7bOgeSFMrRxnIz9kyaTLlwNZWrN8IAlpM5e2SZMcHn5kMqjbD6oCpXpb8fS4bTsbWG9Fh
 xj++zbzbhJw40m3lPg7mmil07QLlqrFd0mm66nBStUGfWrGPBMxe2fV8F+HCGmwkIrouJSfAoyv
 vDrgz/eh63hiRAFi/0dtCpYv6RjGJBepsjzCSx9GIfxzYFACcRcIdfpM1NA+6iKhfOsKpNN8WnV
 hOxrcSAZdo0GzLeAU/QBkLKtJKsGxHsOKU7jWZBi/21tahISAKvnE4E8VYCS3Pui0lAB4FbC0g5
 BAALDZ+WbEGjdSQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

This patchset has been used and tested heavily the last months
on a custom board based on a da850 (DaVinci) platform.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v13:
- Rebased on i2c-next (7.3-rc7)
- Corrected gramatics and wordings
- Move set_clk_freq callback to its own structure (i2c_bus_ops)
- Fix style issus
- Don't leak childs anymore
- Link to v12: https://patch.msgid.link/20260719-i2c-mux-v12-0-a5010d623a57@gmail.com

Changes in v12:
- Defined new idle states in i2c-mux.h
- Replaced _hz with _Hz where appropriate
- Reword comment and commit message about idle states
- Link to v11: https://patch.msgid.link/20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com

Changes in v11:
- Rebased on i2c-next
- Use _Hz instead of _hz for local variables in i2c-davinci.c.
- Link to v10: https://patch.msgid.link/20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com

Changes in v10:

- Fix gramatics in documentation
- Move {__,}i2c_adapter_set_clk_freq() to i2c-mux.c
- Make set_clk_freq() return actual frequency
- Reimplement idle_state (from earlier version)
- Implement example on idle_state for ltc4306
- Link to v9: https://lore.kernel.org/r/20260324-i2c-mux-v9-0-5292b0608243@gmail.com

Changes in v9:
- Fix stray blank line
- Link to v8: https://lore.kernel.org/r/20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com

Changes in v8:
- Fix gramatics and change %d to %u were appropriate
- Link to v7: https://lore.kernel.org/r/20260223-i2c-mux-v7-0-ec75b214718a@gmail.com

Changes in v7:
- Remove code for finding first mux-locked ancestor
- Introduce a unlocked (i2c_adapter_set_clk_freq) and unlocked
  (__i2c_adapter_set_clk_freq) variant
- Let the locking be handled in __i2c_adapter_set_clk_freq
- Use I2C_MAX_STANDARD_MODE_FREQ instead of magic numbers where
  appropriate 
- Link to v6: https://lore.kernel.org/r/20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com

Changes in v6:
- Change logic to find which ancestor to lock with I2C_LOCK_ROOT_ADAPTER
  It now find the first mux-locked ancestor and then lock its parent.

- Remove bus_freq_hz in i2c-davinci and only use clock_hz instead
- Mention in commit message that clock_hz can be used to store frequency in an uniform way

- Swap order for change freq/deselect to keep symmetry
- Only allow bus frequency to be lowered in select()
  This to not allow an intermediate frequency to be set when it is not
  supposed to

- check if(ret) instead of ret(<0) where appropriate
- Fix typos in documentation
- Change i2c_adapter.clock_hz from int to u32
- Simplify i2c_adapter_set_clk_freq() by removing 'ret'
- Link to v5: https://lore.kernel.org/r/20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com

Changes in v5:
- Take the lock of the top-most mutex locked mux to make sure that the
  root is locked
- Link to v4: https://lore.kernel.org/r/20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com

Changes in v4:
- Rebase on master
- Swap order for printing warning about "channel %u is slower than
  parent on a non parent-locked mux\n"
- Fix typo in comment, adaper->adapter
- Link to v3: https://lore.kernel.org/r/20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com

Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

To: Andi Shyti <andi.shyti@kernel.org>
To: Peter Rosin <peda@lysator.liu.se>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Marcus Folkesson (8):
      i2c: core: add callback to change bus frequency
      i2c: mux: add idle_state property to i2c_mux_core
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      i2c: mux: ltc4306: set correct idle_state in i2c_mux_core
      docs: i2c: i2c-topology: add section about bus speed
      i2c: mux: pca954x: use idle state from i2c_mux_core

 Documentation/i2c/i2c-topology.rst  | 180 +++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c    |  39 +++++--
 drivers/i2c/i2c-mux.c               | 196 +++++++++++++++++++++++++++++++++---
 drivers/i2c/muxes/i2c-mux-ltc4306.c |   5 +
 drivers/i2c/muxes/i2c-mux-pca954x.c |  76 +++++++++-----
 include/linux/i2c-mux.h             |  57 +++++++++++
 include/linux/i2c.h                 |  12 +++
 7 files changed, 518 insertions(+), 47 deletions(-)
---
base-commit: a1844c195998e764ed89ceb29a234d2be690f404
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
--  
Marcus Folkesson <marcus.folkesson@gmail.com>

