Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC038E8CC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271428; cv=none; b=Z3WvgSuYrci2t1Auug4cgCcfD3a5iRdFdpT3PXFypoU5m+oIqj2AGuH3njzvRP2aeGb+puLjE6DpaSxW8ws9EYXpYwnRrPgnNk5qZn/SW49ZvO59b+lAYaZA38CSM10AFSy3DCnCNPlepPaKvpMfpV64FuJqTGYKYhUBi30wCUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271428; c=relaxed/simple;
	bh=xeduSlkh5F/g1QDxornBkeh3jnYm61LoxT+eaLcg9ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AuXaS2abjO3Dm36H/Ctd9NgWjS+PmokbDUYQhBnBfvdlJ+uQFeT5kVR9TBwENDKp1drWI3o3s5cOwCvcuubhhVqa5vQvKfg6CNhjj/OvdcB2jEPOIKZ6GtLT2EAuWdmpiRIXPDdWbq1cQnr1escuD+A1rkiyBazRpMiMRIHWJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQuF09hU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQuF09hU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1062501a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271426; x=1788876226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxoZFsWluIEGR9m2/BmFPDYm372qjUJBFtS59WloRzM=;
        b=QQuF09hUGxQniiltnGO3fq03rWIJ0Oi/MHiOLGRg4mG8N8bWgL4068qbjSonMzVhVi
         hIT13YKCrd5b8fNcXROz0IPR9/0AbLdT486aGX+1eks4jdVhIvsITQ449Z+LWoV0RbCE
         0lkUCkX9q4O9MFqXoUWav+ywlctabLHMDLdlalKH0a1m2/zzcolOswXwndhbewL75cTL
         8vvCfi+xaWSzeWlawyg9I9LlpsUpP4cB3Ocbfrn7EteI0w+ib+uQlokBSsy5Ihip7Hza
         XwavEV4YgW0KbnC51Wci742OiGzr2ymZvyj2GyyYwRPgDiYD0v1k94c9jVF9zqoUHJBx
         I2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271426; x=1788876226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxoZFsWluIEGR9m2/BmFPDYm372qjUJBFtS59WloRzM=;
        b=jDi3hJOePMQfVV7hMN6QWeH8wQBvSfvI5GLH+bMj/0X0mgl/TERjfVs8FEUadfCR8w
         /hd9OO7rz2CZW2F0/a5PQI8qS07pZxVi1V4869xX8/cnTh89XpqJ2Pu/0ix4sGqbvLtD
         L9KIa+/CWzLY5o/DTnIwxMdRkZyiqljQ4vt3IyNp03/SJ0aFr0YPVF8SECGlurpCZdlc
         EVFS146oervE1u0lgL/r8uAkHRV2J+smdpbhwRtP2ahTmQTguOvAcMYAsRpvALx3OhdU
         uEmEDAjmmbOH2Ybqh83eKhr7OmQcoBJYbEgHHYVUcoqqIrnXmhHYGAO2fzwGtQcJCTE3
         Uvqg==
X-Forwarded-Encrypted: i=1; AKwUvBwHdVbTJpJEanoIJM6ZNDNgI6NZa0kQegp2MgH2VirvbdnWsc/Hcp7PlHJZkzjz3zPTwUhsG/JGWhhyOdA=@vger.kernel.org
X-Gm-Message-State: AFuF++klV6UUaJtgS1zWLPtG+QVUo5g/bf02k7q/Uw9Srfe6IwkVMIof
	SLpsrOLOyFiEtoEaXAUYKpwEfMooUZiFagzNVCd/bK2S1RKgDJA7WnhG
X-Gm-Gg: AYBFou3QU3P0TnIxPHbSFrisAUPJvO4xxTkWg1BxW2Gn8HEWBdAqtWxCEH7AvXqYIpT
	aTPOaZR3p5FQp45C6w7OOSyNizNdJZRP5M/7zIa592zBwWRV358Oo4q0T/PlCHZoNMaiMaskjyD
	7fh8QD9QQG1AVaLjAIbhANJkw5Hme+/OYxHukeNXiNn9JTt5SbttB922wNDV1aBr83fqj0X6Kwk
	Wd1qjO2zRNQXkGTDhMpMf+1glJ8FnvsDbtlEnm7sUbbTYqo6hdo0sMCkgnS6p9MSxb+4W1LmlK0
	4WCtxpJ8j7U4KIKkIPG/4x1Fs/cC16ogvmQ2VFrynOYgmU1/3G3Z81LoAGYxMz9h8zwKD0pPO1g
	PZm350/abDyol5XNtLhk4/8SSZ1DJIp4EkBMucg5krDxM73Lyn1eEVvB1WGH4clEq85hK3xQITc
	rwmeo92hN+SjPilLIEjcZCqHO3voiAmorQCuS1Fz0B
X-Received: by 2002:a17:90b:164b:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-396d1007e54mr50590119a91.15.1788271426092;
        Tue, 01 Sep 2026 07:03:46 -0700 (PDT)
Received: from ArchLinux ([185.244.208.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf8079sm6872467a91.1.2026.09.01.07.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:03:45 -0700 (PDT)
From: Tao juncheng <tjc1437@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tao juncheng <tjc1437@gmail.com>,
	stable@kernel.org
Subject: [PATCH] Input: atkbd - skip deactivate for HONOR NWB-G's internal keyboard
Date: Tue,  1 Sep 2026 14:03:36 +0000
Message-ID: <20260901140336.10568-1-tjc1437@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 ("Input: atkbd -
do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID"), HONOR
NWB-G, aka HONOR WIN Gaming H7's internal keyboard stops
working. Adding the atkbd_deactivate_fixup quirk fixes it.

DMI: HONOR NWB-G/NWB-G-PCB, BIOS 1.10

Fixes: 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 ("Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID")
Cc: stable@kernel.org
Tested-by: Tao juncheng <tjc1437@gmail.com>
Signed-off-by: Tao juncheng <tjc1437@gmail.com>
---
 drivers/input/keyboard/atkbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index c8ad55f26ea8..de8edab3cb0f 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1923,6 +1923,14 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		},
 		.callback = atkbd_deactivate_fixup,
 	},
+	{
+		/* HONOR WIN Gaming H7 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HONOR"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "NWB-G"),
+		},
+		.callback = atkbd_deactivate_fixup,
+	},
 	{ }
 };
 
-- 
2.47.0
