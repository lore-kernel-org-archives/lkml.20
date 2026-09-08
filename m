Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E8F3769E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848789; cv=none; b=sCKyt8qfKZKO9muzR2BO3JNqU/gVRSYBLVFwdXNv2V6PgpdvHVOTbc53rzAy/mfXpl0CbpbmUvcSZraMOrWbDG8nv6rdgUtt/yPDQLBn9CVQmdGkgFfwRZWxscL/jXgnL0ybgEDCqpjwGt1jrZHpGi2K6XXLIqrtDMtE47XSVjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848789; c=relaxed/simple;
	bh=Yk2YL2UD+FGXW2dMqL1qmIyf7rf2SMaMRMfp5GgJCSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UDGxwvhsWJxHBUTX6pXZrKWgTF4GOTqEAr+1PEuXPgyJZUrBeAhpwI00l+lZHYsvGfv/X04CiUSnb8jZyI0jn6Cw60Rzo3UFOT1UhLZ1fKAodLasQMdDAz0GOtMskZ58hcEpnjToyYbA1Ceg8gtEXyX95bDvoQeEpfB57GVBXQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/z2QLmo; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/z2QLmo"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso257807a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788848786; x=1789453586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2A6ylyPMvOhYX3B65YMjMtxuaf6aCsl7CTkZbc9h9k=;
        b=X/z2QLmod5Qy5TS8dhQNMzd4r/Zm4yPnWzQEG7LFC6BEYOxSnhxKuMtgo2VCQRvYlq
         nfsMMoSCYEb9Q5LyEBDgVVvI9id1qvs8S4aBvKpkMT7s1IUmxR91bTkDAXMKzm31Wpvg
         G5yQCfSj6G79yXWsACdKR++ezjBsJk8OfuCWYv52uZ9fl3c7C59FMOfHe/jtaqjes3/s
         aj1z0tD4RfiS4b6JQv8DnwCMLadgrkWT0CueyMmTGHgp1TR9iXgsCQENVkQOTGi7SobM
         RJWaKWluwqm5q8msiiafm/9/6dhROkm4MEx+r2q3tLd01nLIifLh3ztzdefaU/Y5dEDi
         d8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848786; x=1789453586;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2A6ylyPMvOhYX3B65YMjMtxuaf6aCsl7CTkZbc9h9k=;
        b=UVi5nkFDZ72/uGKGaUIfq8WzCMAVe8vW/lGD26iwC6Yl0Ni3yfc3cWAXH528n7rXiA
         QQHUy6GYG2l4+srddcBGJIQTvPD12+uThaa2MmJQ5tYAWod5wVnY9cyM1gCED8hElJLG
         IkH9W+z9JJ8hqao29tUmRjmKoRdHj1DHI3yEmt4wmFn3UNd6/sN5U+bZ2NoLjfjQ4g3N
         Av0xyhAM1RG+HiMY2TGxxKPn9HdETcnlXOW/3G9j9jpFituFSnzCwIYKBkD5bqTeNOMq
         B6NIn4uRoZA8HAxn0xjK4mc4HVQq1hsMT9fjEQN0+9eJAA66jY8gNo6zM3LTxSa+73lQ
         FDeg==
X-Forwarded-Encrypted: i=1; AKwUvBw7VD7Lj8N3aDQ5W6T4dQZ61IEa1zb6Loqw3I71iKrFT4GVeIK9ojwZkAYqP9vXbGtPSe4bRpvgADWg2Is=@vger.kernel.org
X-Gm-Message-State: AFuF++lPUxgBoqvuhYloz5zVS4d9iuc0f6j5169zBK3tIfvTWy2ZiiOz
	aUqvAjwF2tnSpLFeNwTrSG65G0Sn0aTMrgI3OpZVFxAhSbDjLiK0x9KfY0Az9Mbf
X-Gm-Gg: AYBFou30SZWeGUfPsV2bwIkr7v1jPcYTdBgLPyseVzMndTguRmsOxLqTBaI7INIqiDp
	SXZypMVFrXYJC5N47w5M2S2xcyvavWTBKA+HgxT0tXcE6YeaMq1etJxx43wtDg8faptuI2gXMcQ
	pBhDBtKPmttM/hObuDGLDz+ipnq7YQJowsYOMJvYSQO0Z/cryeNE2gbdpY2AgNAchiDoOKGolnd
	lRDhIspie1JbFr/+sw3Oe9E1coBRjJYRHHxLl0eO0l5jte9dQ3xC/e+dth3iZWYelclaJ0leA8p
	oLcAN2ydiB6ypCVO2UiTQE9T4Ye3GlY34DFbqsBy1oT4ZfPLDvtlGuPfGhzxpypzNqeqIA+p8ip
	0GVMeoJo3eAF5keVypxhlyv0iOfa8M7Vx4Ls1enJ7VEG8k1mcnhGLzCkoUCgRZ7Qv9znTbJmBJn
	oDOuZhdEcA75DWY1f1fQS+jeCXIybrFNuoJV3NfxG/FchhHHbcfgFRX+/VMvivTNzWkPnj2YpmB
	WRdupNtGcEoHBb5tsBB7aetv5kHGRKII4BsNX/LDUX+9IcweeYcs9NUCGIgFI9OmDW1Ptj5loUI
	3CfQi72Nkq3U1/vzovS3r/7iOo59Z00=
X-Received: by 2002:a17:90b:580e:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39b261cfd97mr38329981a91.14.1788848786168;
        Mon, 07 Sep 2026 23:26:26 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm30960386c88.11.2026.09.07.23.26.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 23:26:25 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Andy Shevchenko <andy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/2] i2c: mux: Propagate firmware nodes to channel adapters
Date: Mon,  7 Sep 2026 23:26:21 -0700
Message-ID: <cover.1788623619.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Device Tree channel nodes are associated with the adapters created by
i2c-mux, but equivalent firmware-node descriptions are not. Convert the
existing lookup to generic firmware-node operations so software-node and
ACPI descriptions can use the same property traversal.

This is the remaining I2C prerequisite split out of the Time Card series.
The channel-node leak fix from v7 was applied to i2c-next as commit
385c7af4e3b9 ("i2c: mux: Fix channel node leak on adapter add failure"), so
it is no longer included here. The first patch factors the Device Tree
lookup into a helper without changing behavior. The second converts the
helper and node lifetime handling to generic firmware-node operations.

The existing acpi_preset_companion() call remains in place after the generic
lookup. A separate reference to the node returned by that lookup is retained
because ACPI companion setup may replace the adapter's primary firmware
node. The dependent ptp_ocp board profiles will be resent to net-next after
the LED and I2C prerequisites land.

Changes since v9:
  - Declare dev_node, mux_node, and child on separate lines in both patches,
    as requested by Peter Rosin and agreed by Andy Shevchenko.

The broader __free(fwnode_handle) cleanup remains a separate follow-up.

Validation:
  - git diff --check
  - strict checkpatch with an 80-column limit
  - x86-64 GCC W=1 object build of drivers/i2c/i2c-mux.o
  - mailbox replay onto the declared base with an identical resulting tree

v9: https://lore.kernel.org/r/cover.1788298883.git.ahmadexp@gmail.com/

Ahmad Byagowi (2):
  i2c: mux: Factor out channel node lookup
  i2c: mux: Propagate firmware nodes to channel adapters

 drivers/i2c/i2c-mux.c | 98 +++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 46 deletions(-)


base-commit: 1f3e66348d2527c31b9bedb0b4d9e28bdad9bc83
-- 
2.50.1 (Apple Git-155)
