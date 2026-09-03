Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D83D810F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464491; cv=none; b=GxDHLHZVQBvoMfmOK9Ka1iH9lsdF0cfU0Y0o43Zty16ri2snPcsUG01bZLVH2tGvw5pTTfwOITJqeycSaKTvly/kJOjSgGsPSCejSxXQOoNCRbOXsNFZbZI5utc2+6PdWOtTigMNhi7Z4VvZ3b05ho0DWLpkfOjLUqG9zEnVy1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464491; c=relaxed/simple;
	bh=N+U2wZhd3H6jH4C6wah6BhkYUFxPu8drpgr0MmmfjXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7ysBJXCFT7pcBeGlmGze4+Vaj34c+bfkIMaWA70+rmr5c976KAGZNGR3FzeQUn3GNyuJGHt3MIyEYnN3Qs2iaR29ohMyFc0fmJmD9iDCsDCQUSxDMcehvGj/2RGCtg4sFBlKU8xfTBXRajs4A7fl4VfXo5tcrd68EQMpzDSY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLCz11yu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLCz11yu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so213205a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788464478; x=1789069278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ALsQc4Pki/X6P5tsWmhZ+GXdkUBRbPhGv6524WdN+nw=;
        b=hLCz11yu3eDXk3MVZ6H6E4CJTPpaWP8DbGb5XVPs/vsk9hgG7Iy82eKk/ewpN3vTR7
         4ZaFlMqdN9GKWsnmL6D7dx0MAlhph6UvQgHD+bMEmeAbWZrn/yjWuO4RuuAFy6vCiNDC
         MyeCwjeKVmYpojBLkOqMDAohxksllPQOGVFIDL1egwAIVqSn7mlbh0v0tHRqx7eRdypO
         c8ieYhktdbqYSnKKY1wB5zFgXdD+zzs1G8JYsv3pr2lTutKsQ7h7EMzPJj08mawayVWs
         iGdQ7nxuCeed1qpAJviMi72Qn+YuB92EictjZgOyu9dKctc0c3x/VMUEMMOlyTrvre15
         fQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464478; x=1789069278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALsQc4Pki/X6P5tsWmhZ+GXdkUBRbPhGv6524WdN+nw=;
        b=P48gr39ExZnzBgR2lhdJ94fXwke+qOyzH4HhcssOQaDijxvDHwD5UrxGg0keHu1Lpz
         ONUBfr9x+rlIhbXHi/1zee8w52oMtAazD8Q/9exRvq+L/r+SyxdprpP4GtpALQqFPYe1
         0Ry9Hw2S4l0cXy1ClCX/AcCaq912Yk4Tuj1Q4Q+Dg8crTyTHmzovM8locOdK18RcbcD+
         YiAyuKYtD6z/H55x5SQskqylo79msbjc3Glj2kV2Oi4jERo6+SBaceKRxKDJ+d0S3aSs
         wirNt2f04t/xvobRq6pfYtU8h78rNPRoTMiC61GMd0qGGT0BnErsbViRPGYe3xKj/YsE
         b0tg==
X-Forwarded-Encrypted: i=1; AKwUvBxa4oYjxqr/MHtN08baTDLf1ibzgUnzdM/nU8naCW8Vjv/0y8BwOFTacsB9KRROCBtJ9fWKSxzZ0itt3RE=@vger.kernel.org
X-Gm-Message-State: AFuF++nKvQh9Y2gN6UC2EdH6/Zk74+4gftlAX5H3st84hA20xJzGngLt
	HSs7rO7THCHzEAnkvrmk3t5Zzf0GWWf16JHFKGbfuIzvWlpTlbMGLqfo
X-Gm-Gg: AYBFou2qSYUfcgsfcufLgdnjAPHH64VCyZE7EXMsLcvfL5EDFnAGU3ZIp8UA70ezUFM
	58mAmQpytKs8CxmG/RwttjVGbQzelcRFZjey2UavzGsa3DD1GTfUT4PXD4eGieteGljGZRc9y7d
	8ODTTq8h6evCCYTiDeNjFOgiTaJputrnjP9KlJxE2+5v6eOHGqF1p6WgWSg9+Xg100GM7Nf0ZwC
	1k2W9h57yU1uGsfSot7bw2ZpDw+v9NDEASOZ5gsUflBQfCUiOKwQE21Ajw1dhVZRq7bF9+8AF+w
	d0hem5sj7t0FXlW9QbSsBno5RFUYWOlx3N5XBxDRI7LmB1kTFwyRHT9rkrlDsUJIfOVBrfIYjlj
	yzD2/orc6RR83W8bB9QNDl0LTdMydCmy4sP6MjMUbznUObybn14F8lzvqN1IVVz54p+8xaBiToE
	4SBjckWdqzvztJOzH6vMIpa/9LNguBVouh99efdzsHDz/n3d0cT07Kp81iPgK1fQTwuw+vJRCrs
	81D+lMClE4idipMP9/qTa5sDZTArhrB9Dp1rnU+yZPWjPKVSvqL6FukLvGW/G0=
X-Received: by 2002:a17:90b:4a48:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39b260d2d58mr1134016a91.6.1788464478281;
        Thu, 03 Sep 2026 12:41:18 -0700 (PDT)
Received: from mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm888285eec.18.2026.09.03.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:41:17 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Andy Shevchenko <andy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [PATCH v9 0/2] i2c: mux: Propagate firmware nodes to channel adapters
Date: Thu,  3 Sep 2026 12:40:54 -0700
Message-ID: <cover.1788298883.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Changes since v8:
  - Split the dev_node declaration from its assignment and use
    dev_of_node() in the Device Tree helper, as suggested by Andy
    Shevchenko.
  - Preserve the split declaration and assignment when converting the
    helper to dev_fwnode().
  - Leave broader __free(fwnode_handle) cleanup for a separate follow-up.

Validation:
  - git diff --check
  - strict checkpatch with an 80-column limit
  - x86-64 GCC W=1 object build of drivers/i2c/i2c-mux.o
  - mailbox replay onto the declared base with an identical resulting tree

v8: https://lore.kernel.org/r/cover.1788181174.git.ahmadexp@gmail.com/

Ahmad Byagowi (2):
  i2c: mux: Factor out channel node lookup
  i2c: mux: Propagate firmware nodes to channel adapters

 drivers/i2c/i2c-mux.c | 97 +++++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 46 deletions(-)


base-commit: 1f3e66348d2527c31b9bedb0b4d9e28bdad9bc83
-- 
2.50.1 (Apple Git-155)

