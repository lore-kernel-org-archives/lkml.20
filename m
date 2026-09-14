Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBDC47209A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391790; cv=none; b=KkAjzNPwrTe2UK1QpRnkpwAmkcjXyQESgwDzVeM7ifWcyMeUgTzFq4FbIQB1xO6ARo4vN3wEeiyi9U+lABSqtK8ZAywu2UocFqRpOKafrSLITLKAqWkbdx4TZhIOOw4tB1mej/80XEEiyTcyEP6zSAIdQPQMFAq3eiaNHkL0TYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391790; c=relaxed/simple;
	bh=NeGXUXRLm7h5fh/tHrwMbiOXfb3fpgcGV2CwhD2kv9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McbdF7+Oaod760VDoDQ7Cja2+bUoGDMMvGOrCoHypukK0tpQi//5Ic/rgZWacESd7GLnEgDT351KONhLM7wReh9NEW3ubELqVRO8PtA3HpxT1l4H9cU3b8Afz5oPrk7wElTE45ab2TS16yMFc0ygqkHCw5wrmNeM/ENjxmquHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXgd+VsL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXgd+VsL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so3025792e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391786; x=1789996586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeNBUWeOKCT6NHcWHOZPhRDQedkHJaXnecAyw6p7kGQ=;
        b=LXgd+VsL/LOGW3P9aWU7EnGXT7kMIFs0p0tMb30NFYPUEOY/185oYJacvp3AR+icYS
         VlmbRymO47Zo+PXGEEDAWoJql4GBXGjJ3v+D57GAJzcQE87auu/hHZDuqVlWdzHa9AEP
         1V3njdg7QPCqp8H/r9wNIciqvtPHtlAbxGuojY8PNnUNAroVPiu+cErJkCE3LfcTgh0D
         wS6g9B2Ux1gnT66dtiykmn61Ds1QGXCAUiKpyQXpXtwPkYA1uPzuuGY7agMIU1nHQksm
         3hcJSihUP/efiREpuDfWX5gRkB3lOrwVk9nLm66hgzasmPhMOTH6XYK95qQpmTE5xGYE
         +AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391786; x=1789996586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeNBUWeOKCT6NHcWHOZPhRDQedkHJaXnecAyw6p7kGQ=;
        b=rxGRFls9RXtWaCusl7yGjvr7O9Ru8o4otmik6hoPclabzt73neneil89BrytW/tctm
         wDjUuHF8DFoI3w2D66TMLbrwyVfzPtoJaI2adHt3s79SZvQDIb8L02yYi7HrA/BRwatG
         0e6ECYQFD+syMW/0B8KH65iOKgJS1Eavd4A15lvufobcxXYrDBItKSG1Xos9GnwHe+39
         ez7r6nEfm7MVI3qewF51eDz1Roet5x753gKBoYmk7+J5kjeL8Dq4vaANAoe60pV0eIYx
         4yaq3+q0J630/6RtCUhlUmYkgNXVXaZsTSMKHrh2LtDn4UX+5S91JrDhQQtOcdjDUYsv
         fWEA==
X-Forwarded-Encrypted: i=1; AKwUvByg+x2u82vE7ptY/AitHmPXaeRnMxYdQxTMFs/GKFI43QfY8WS1wpQUNViffQ5j26z2GzGFhDSKEeg1gJA=@vger.kernel.org
X-Gm-Message-State: AFuF++mFw0L2zkOXkr1/Sd5+yvMFLxZglQgbAv6FWOyJZvYValD338/Z
	P09yGowfZkVjxsgzTjc9zAY+PReqvF5l4xIUCmXog7edkwXztBs5xzkd
X-Gm-Gg: AYBFou2yQuvGKxHEIiPZ3WH6LuqXcPWk+1aezt9Zh1rnC6YRl22qCw9ghqWSV1Shqlm
	lPGNiH7kLP/JGgkO07jSZUY8HW+kf39TBv6wZ8zCuxI0Mgitph0qOCht6Vgv7MQsLN+vBQU7BGf
	vEo7eRWn4ZxA75HvdLHK9JNIXAV+he9RHFs6aVuAc8sl4M404ita3n2i+TRi6Kq4GkBZUeHBacv
	OJFINT9cwtfOq2yA2ip3daGdHQqTOPBVhr3wJK+j5Itm+7yz0pBAWS5PsLwFJfK1i7OL1M0CA23
	vnVRKOOfO2uvfcBcJEgbjM8qBn/ePHPSDhGCqcWbD3TpJ4bkdfjnrgyrKQ9QibNI8Jj00mZ0k4x
	no0JQWYZjb4HCV1p/IDh2rs8+Pa7sPJWdTz0WHNkT/BcD/sdxBfofblLD0wAZElVdL7DZP4iqqA
	gFULUGcDtn/ONFftWQotkU+ANUdJDYcIOzMn1J7YdveMLee2ZzuADGJrWiECdG
X-Received: by 2002:a05:6512:691:b0:5b7:6568:3039 with SMTP id 2adb3069b0e04-5b8ae6a7d32mr755913e87.60.1789391786099;
        Mon, 14 Sep 2026 06:16:26 -0700 (PDT)
Received: from glass ([81.25.57.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04804bfsm2423768e87.84.2026.09.14.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:16:25 -0700 (PDT)
From: Andrey Starostin <ndrstrstn@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Starostin <ndrstrstn@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI entry for Acer Extensa 215-23
Date: Mon, 14 Sep 2026 16:16:10 +0300
Message-ID: <20260914131610.46732-1-ndrstrstn@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Extensa 215-23 has an internal digital microphone connected to
the AMD ACP6x audio coprocessor, but its BIOS does not expose the DMIC
through ACPI (_WOV / AcpDmicConnected). acp6x_probe() therefore falls
back to the DMI quirk table, finds no match and returns -ENODEV, so no
DMIC sound card is created and the internal microphone is unusable.

Add a DMI entry for this model.

Assisted-by: LLM
Signed-off-by: Andrey Starostin <ndrstrstn@gmail.com>
---
Tested on the affected machine, running 7.2.3 with this change built as
an out-of-tree module. Before: writing to the driver's "bind" attribute
for acp_yc_mach.0 fails with -ENODEV and no DMIC card exists. After:
"acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI", a card
"acp6x" with "DMIC capture dmic-hifi-0" appears, and arecord/PipeWire
capture live audio from the internal microphone. Speaker output via the
HDA codec is unaffected.

DMI strings of the machine:
  sys_vendor:      Acer
  product_name:    Extensa 215-23
  product_version: V1.18
  board_vendor:    MDC
  board_name:      HerbagEX_MDU
  bios_version:    V1.18 (06/18/2024)

Per Documentation/process/generated-content.rst: the diagnosis (HDA pin
defaults, acp6x_probe() failure path) and this patch were produced with
the help of an AI coding assistant (Claude); the change was reviewed and
tested by me on the hardware.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 385fede6d77f..246e18c66272 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -52,6 +52,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire AG14-22P"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 215-23"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.55.0

