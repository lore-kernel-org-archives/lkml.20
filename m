Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E53447A0B8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523635; cv=none; b=Z83TPNqvOKHTaGm9G42mCSWA0OCs+b16V+P41y7ACHrLPkDxhTAZ8qQBvLCeHmQtGYHgQu/cka+P9LiyFiQ9DRm35YJRNqf7byLK1SMGzIYfwrYxFWcsdt23/LdPgOGqE9x8QOOPlDeVSiqMSFJG5o58eFHrat4hlen36XpjJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523635; c=relaxed/simple;
	bh=p041shYqEXyPJjXxrMykdC7eo44mMrAeTw3kmazrmG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mz8z59/7fdApvK1ScUHbbrGOBz1xMocrVM+deZ6dgnsDO3GMypWfT2/mjxnivBs2WLwt9LhurG4akaKIdKlhKt4XxgbsLVNO1d7tzSridViHbhnmHIqu7X8vEnwbaW30IvlvIAxhq834KZBA3h8dmQHGj0PCNBLDV++rF7wHtJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZuTnYHU; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZuTnYHU"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a46a53abc9so939976b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523632; x=1789128432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRzwySIKet2vXTJydQDUqffQLNKueIf8/ii+qy4BsUc=;
        b=hZuTnYHUlmfEAHfIupPovGfTtiVnX3Hr0t3UOorF0zbrAxrDh0brlGmMBuq2HFmhud
         7bdA1bD/qyYiROlwPb++0eN/3QOdizU0YFdSPsJUD5/WKSbgfu6owSrwzPpJh7hPb88U
         OFWhubkCgD0ycRBBeTGlOkkztJCjsY/UEPELiCKAfoJtMES5xPsOCMpsfDMV6RX88STw
         mtebscNaSD0VoYsUwZLz9WFDhZU5cq8O6Aym1rlHi6CUWCpF6s7BIVysW93VQE9TkvPj
         jnXeVRXg88I+TAvqjy8RPsvxqHx8LbsZ1a+X8cr5SJzcYieGhaKAt8/TdgdnwnGk4Ril
         cX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523632; x=1789128432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRzwySIKet2vXTJydQDUqffQLNKueIf8/ii+qy4BsUc=;
        b=iNHo3YHjdqoP1pWREsgyZX80QwJcXG6H7Uj3uBSJBIO5bmKCy8GOd1lJDZpw4ZAU64
         yaT7L+nNOzqTxx1ZRD3Z0vdwq6dT6WR73IC0Kt7rHjpK7+Eg31i0M7bai5LXPZAKJNxz
         eum4/RpYGsQxmWI1mgWxUpmWNAgfXAAoq72LVi6yoSIt23bv6E5jaZ85gyny+WAeCW1+
         F+8b4/b2sONJYqAQSv6mEywkx7xC3DOjCnfmK+WhOiC4UoYcjRmsI0WneKDIuMIGzX/1
         RyE6n7UWP47zCbg+FkVhbJeaJbt6QudC24dq1iRvSXMv7iKsPVZK7A0UsGeSaTlgdvn9
         dRsg==
X-Gm-Message-State: AFuF++mjjUa2GiwAplAXcVmduKhM4dTniU2R9DQKKus+Ee/dX7iy7L7o
	Sn9vhBmrN6adTGC4KXp/NRXhWYWiQplA5of0cMljvNumgPj0/lp4xu0b
X-Gm-Gg: AYBFou3EXD8wSFBxM/LGfs+a28t9loV3b0C6epImykoyZxlmhD94zRMWroVaYaNx73/
	CbcW4vAELs9mGN92E9zSk1iUEDFtpFiHQFmEvJ/jO9t+yRZVqviEQGvXZbc24HDzrFxAOW3Zs93
	fGXeebb+1loGqThUpu1HG6T/2L7Kg3/TzJ4RFN/fqZSxQsRfBZTzcKS8gE6BdHfGthgs/UVGfjE
	KNFQEDkuNuKXVVRLN1m0wMOnqA6OMpSsBU/L9ifHCM182sriUS2etqu/84dnKpltdtboEt6KrS8
	dB09d+mxF5WvQil1ACl3MuFlhfTpoKbHchb7SZIkF7n/kuJQg/lCnUmaBhYh1BscNHJpmHuTPxU
	zGHEvWL1tkVik3WXi6tE7Fo1FLfH/xLHXL8uVZkZpEvbj1C4vqeFcu2S7vd4h6vgHZbix5qMbxe
	b5m22kvOrQKIWPZT0PUs/F6Mnl8WLA8oJ2ywczeMcms5LkQ9dJ4tguS6S0qIbs2+xLHxPB2OXTu
	IPR5Zb9noDGHgA=
X-Received: by 2002:a05:6820:4c09:b0:6b0:5bd1:4722 with SMTP id 006d021491bc7-6b6faee256fmr3944633eaf.13.1788523632473;
        Fri, 04 Sep 2026 05:07:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm9247100c88.2.2026.09.04.05.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:07:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] drm: fix typos in comments
Date: Fri,  4 Sep 2026 17:37:05 +0530
Message-ID: <20260904120706.19154-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c    | 2 +-
 drivers/gpu/host1x/hw/intr_hw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e..d69c0153739f 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -520,7 +520,7 @@ static int tegra_hdmi_setup_audio(struct tegra_hdmi *hdmi)
 
 	/*
 	 * Tegra30 and later use a slightly modified version of the register
-	 * layout to accomodate for changes related to supporting HDA as the
+	 * layout to accommodate for changes related to supporting HDA as the
 	 * audio input source for HDMI. The source select field has moved to
 	 * the SOR_AUDIO_CNTRL0 register, but the error tolerance and frames
 	 * per block fields remain in the AUDIO_CNTRL0 register.
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index bd5b5ef62f35..afb68e47ecf6 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -93,7 +93,7 @@ host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
 	host1x_sync_writel(host, 0, HOST1X_SYNC_IP_BUSY_TIMEOUT);
 
 	/*
-	 * increase the auto-ack timout to the maximum value. 2d will hang
+	 * increase the auto-ack timeout to the maximum value. 2d will hang
 	 * otherwise on Tegra2.
 	 */
 	host1x_sync_writel(host, 0xff, HOST1X_SYNC_CTXSW_TIMEOUT_CFG);
-- 
2.48.1

