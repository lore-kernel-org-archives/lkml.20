Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780964;
	b=qP5dz/ntROYw74pu3T4le+OAIpNEEg0+5krLpTpAaRhjkJ6dTbIOChvytOdVyq8GJbDm
	 JSj9tNHfBDh6lC8euUcLfouaVde1ZJGwV5t+iX9I1ISlDn7JR7/9xiCO+V2iscr+Aq4ph
	 MmXKs43+A6AMVJaNF+Ov9DK3dd7rbUYmr87eXGi7Tta/8xSU5HrdplXg8+sU9mrTtuVol
	 1JxtwUhQ6OtIR4+cKfCuVnLugQV8uLIZcwa4JYtcXIaexc4DL0+ag3V7kZlbmChcMbfoe
	 97bVJ3GfMgpVTJ7n6kXDYiYJ3buDiTLsRRxgJ7iikoHjPj2Z2C2tZzB6M/ARuVOK3SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
	b=Cyh8+SMaeutQ3f7MxJ5mHB91Co2FxbJ/+zIp1vqpWLxCQq7zs8DgYWIkCLtTDc2h/aAv
	 oxYYgk5A3UlSEvds3q/xWgjhhr8BrA/NQ2dVqlMnTOLm4GY8NdYmn9Pg2ZV66rodUpDIQ
	 xTQJs95HYQFadlSyxpPphAOOBH7nH63N2ZoZhSMZQ9L9jZwVDcLgZmQKZ8EPYDceVbMlR
	 CxUGGmV1onKU299E+lGXbELGvtkieydBYgPPN98U7FKgAVSRcwLhX4pweCsB2rebDcCei
	 rwgrXEJbPx/EC2aFQXA/7cvZrS9mKUI7HAiRqfsiQlSoGVge01H/WvJYayTwUxWLA+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QM2s9i+h;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6F606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE6F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QM2s9i+h
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so890460b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780963; x=1793385763; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=QM2s9i+hHm2pdy8tufD3eSxi4a7YxjFc2AOo58WgJYPgvDuslNeYgpYT7QUylr9uWa
         Hqe0gELdawQ83/Q1ng9Km28otyLR1lDW6K4HSPOPxeTnGfM82Idon055Tu5go75XV0eB
         CYIuCPBtFG1aeF1kt5Je1x3Qfp1K4QMVWSFUROi+WXPSziLJsektKR3VhlB9A/celzJs
         dZFWaykYWyvxQ5CYo+R4hLfnY3QpfExgrg9Q7JSF2Oe2gLnvRKETG7pzh+fdk8EgnKYQ
         jPjcskO4VcWLKo9sKcdqFLzzkSHaWBzSPu/DYR7hvJZZFB1k+e2Tg26aOqQfUjT1LEnp
         zeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780963; x=1793385763;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsTkc8bAO4KYYktDdouwEoWdlbtwYIQKUFGzzo3SgDw=;
        b=jrJfb3oNthp94kbomkZ7PTh+JbhWaDYWzIh+jrfqiBA2+Rt6Hoi5kHLKuNkjhhinG4
         YyHi9zkkf0H2nFz1cBiqYa4WUxVb9lOHBxEDVd7UxZaOEmVQvXzqnF67Vf3uGCDyo1h4
         04TXfUYRyS38Ft4asplCm7gXkJGnog3Q9rUqNI+HrPgGoGP4xiBIVfe1bF/4KV+NGAkC
         6DJ/YM/nihUPXdriq29SJta/mWXUhuZZtIZ7fqfSjBJSsDu9+4+f6noJLV9e79lnl39k
         unNXesWDcnxnVoXSm/rvYRoY9YXEZPmPeD5Tntr3A7lGOxHebpQE5dQAjD/YFMeBde5/
         K0vQ==
X-Forwarded-Encrypted: i=1; AKwUvByVZS42dt3uJaShPlGEjgVuQxc2gGGeE4qT58H1gUwxS3tmZZbE/KCjpnOChWlyk5ocA2l9Fu3K2JczGeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0+V9vbJ+sLryw98758QqNGdyAR8lWP0dOu1g3J098zdaMxU9s
	QfIqN71HcUsSdVTtglk5F6+Jwt1ccsyF3lNQeDhGLwrw9zI3omc/ndRc
X-Gm-Gg: AYBFou0MgQ/yjMVVLHgo8xfCG7aAoiHn+NqSB5lo9Ek/AlfN0DHztydAlAV5Zj9k79n
	aXPuJW6ykGLFP9mp+qmS81Hdi3wtkav9sDMDHmtEfnlnhX2YUkWjiqkUVNoA64OighNdYBNBlzN
	Kf74DXAaLPE9CiCuGxSYI75ZLU2bnNJ4Ctxq5ebzEVS4HzRC4Uk31SjM21+wVfRADwoBhNpLywn
	tkFgRFK7Rk2yw8mBEVNCOl4pYFoVr8HKLJDFUNw9QkVr/M2UVmSGYB7urBzE9p79yHYYkQwatcX
	/KwWGJTJyIqicAd2qbayfZvyYWXeFqnKE1epAa41GqVCo+liiSVmYjSX6AExQVuvPYxRI1Hg4p6
	5cfhJdQGZ8Vkb4RSCPPhHYP53Bc8t9zALP0sCXjS5irU4anotIji6LJvqcIAwwvJDDQZ6m4/kGT
	LOfjT5Z2iyINEn7jSDS6zHYGSF9gHGsa7TQ1TO2eqlTcNSbunA61ciuHV2zJ1fN/yaOaKlJVEtK
	mKB8/bVgXBVRw+sHuZ/u1C67hS6tpIP+NNgZoibavWpq+xM3tXLUeHFj5QdpFT3wbrjno3C/RD9
	lYLkMTZJKMGnWvb2QSlcdJawsO0lfG9ktEbzmDQajd5FygAozQ5ixjLYbOyC5uSiswTaCnIYruV
	vP9qoaznnW/90iKxOsvwz42z4DWYfncZRNOKepXfyqLS+6HYLJ4CfXf0rafYTVearyxkPUPbcHP
	Lyzg==
X-Received: by 2002:a05:6808:138c:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-55c00426714mr42788b6e.67.1792780962175;
        Fri, 23 Oct 2026 11:42:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Fri, 23 Oct 2026 12:42:34 -0600
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQy24CMQxFf2WUdVPl4TgJq/5HxSIPG1J1hnZmQ
 FSIf2+AblhWsmRdyT7Xvhex0NxoEZvhImY6taUdpi7MyyDKPk07kq12LYwyqJUxcjnmsa29Tdh
 kHZP8bExrG0lOdF7lSUtni9UuMATQonO+ZuJ2vnu8bx+6Qz6orDfw38RM38duvj7GRE4LyXIYu
 9VmSMyOMHnPBWPyBaIygIAugqo6gDHVF7QPs7SWfb95M1S0MQB4BJ+Sqjkr5XLn1II5RSQEQ5w
 CPm8x+qI51FAjKQ2loFNs2HZMQDRgVbHZ+/y8FZwxwYfKQKUCdytfuNoembYuElJ2IWlicft/3
 5b1MP/cIz/p+7v/SLeXkkqr4BgDlMhvuzG1z9celther9dfuW0aOdIBAAA=
X-Change-ID: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

Correct interrupt routing and serialize physical-channel ownership across
allocation, completion, pause and termination. Keep paused virtual channels
off the allocator, drain completion callbacks before releasing resources,
and associate cyclic state with the descriptor that owns it.

The first patch carries Hongling Zeng's physical-channel indexing fix [0],
adapted to the configurable interrupt-bank size introduced for A733. The
second handles partially populated banks, including H3's twelve channels.
The remaining patches establish the ownership locking, pause bookkeeping,
callback retirement and per-descriptor cyclic state in that order.

Based on DMAengine next at aff5e6a77fc6, which includes A733 support, with
the posted IRQ-safe locking fix [1], channel pause-bit fix [2], and the
virt-dma synchronization helper from [3] applied first. The synchronization
patch uses that shared helper for the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Clear the active descriptor pointer before handing finite completion to
  virt-dma, replacing the completed-descriptor pointer.
- Release completed physical channels while their virtual channels remain
  paused, and clear the hardware pause request before reassignment.
- Keep the ownership changes in patch 3 and the pause policy in patch 4.
- Link to v1: https://lore.kernel.org/r/20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com

---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 180 +++++++++++++++++++++++++++---------------------
 1 file changed, 103 insertions(+), 77 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

