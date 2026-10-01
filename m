Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A8552CCD2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867986; cv=none; b=npsZft+fBg776tEcBLDL4Gl2OsRc0ceWKT2WyDqFxZpQWkcsXqJhaKMjMyFAogNturtCI35DkEJo3HX1dcruVqDDVrxk2k1pNPA5ja1ASMcqboBgAc6EOHxfTHIzPQO41+Fb7hM3Zi+PIO7+8XvQdHG9BQSojniX7PejrTKzrmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867986; c=relaxed/simple;
	bh=xPVjPMgSB791riGDcbRM/IrVfcns5L1TXK+cmo8o0Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IJQuUhHcN66THpa5sgK+v/hGt163uX2eTYzEiqjm2cg6gGwQ84xMN67H1dqiJ3Co32a3V1STGzFZRfGk6MZKYfqSMI1jS/YZPS/mJzzR319vnLCyerE49GL7jjH9asIwG+hZ1GzDJr5TsBlQK8KNDwi4md/8BbGqOKxHQEmK/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieeC/0Ss; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieeC/0Ss"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0f4db03dso83113f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867983; x=1791472783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5xSPKk+m+iRcX7pWXBAMbyjKdLdGZon4dYuunMEzUY=;
        b=ieeC/0Ss4ImCnSAYOUpl5m/Py0h1KTU5y+h2IJg93XhsZL3yBfd+PZ2hWi7yWcGoF4
         YyakRkGlU7JlJgGHRTmNDgxeF+bcDHMfHZur+yJgHUrz2ezg06mgj46dCn64CGgiMBg+
         gZwKiNudZlozapvzFDbpnCfDevQ8R1iO5VNGZYK4GOfvptueSmmOJmGW5r91c9Xp5T7t
         Sr9akB5VMrsGcTworI+TTLzqdTQJTXwT3SZufSia/0GR8pFUggZUoL5zZwGQm38A1pTp
         Y0abwGb0IIsvIXhvGXB38jw2sCwyQ8MGVOtE6jjUJ82gzpVfusrqA29hEgrQmiXPkhHm
         2A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867983; x=1791472783;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5xSPKk+m+iRcX7pWXBAMbyjKdLdGZon4dYuunMEzUY=;
        b=xjdTA+u5Ig7VL5g0bxOl+EWqmAi1Ssz68l/UGvvzFrMYZN7W8Gsn8ItrLlUfhRPtiY
         nDij+z0dLIo3jJbX1AkQFCN27lrnNcQdy7YUFhE8lLJvOQUcy+qNBLtCRcUoJAxSKKSa
         irjRYbgJYSUrnbGGtHjxzEbcl1wUEbDNfy71FBx8wZAk+BRbzlUPtXlI25E/uPX/DWbp
         Lv7jC8s7eRV9SjalLvGftALzsaGPY8ANJtqKj6EeJBjXOrZPGT8eJNoseopa1aQ7iI5u
         XvbVelZ8TE47lXRuoddvkGKoRge+KrRr9PqDbr9FyhU00qlI+jI4rcocGGfuMVG/vJbr
         Vxqw==
X-Forwarded-Encrypted: i=1; AKwUvBwA3TGf5ivNStgQifJjQaGrjr89EDfh0NHw4xxlQ8FvQvK/OeKyhzSIjk2dquTrxkop3K7lLEGnl9BvjDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfmn5CfeWPtlWkZGRFeFWouH2lT42lTkmhNBUfb78DsrWmFn77
	JBjEPygA6gL71sYnrCrcRMeqNdIfSU3ZMAr6dGMJXnxlujhb/GDfdFui
X-Gm-Gg: AYBFou3FjuFpld8xKiiDDxjy5dvRtDdBsTbESc2+7RniTgRat2n//HDLannRfLwa3sB
	Z0qS/Dv/QiQl1WUbf5r/EtRvGEKokTCB8yxywYjNkY+TXQKBzcAW7DYAOydbkIrXdU33927+dIk
	NJzxTw3rJm1EPktm0f4eTJi9cb88ahoQUuL7M2XND+KIUlGGxGhej27on9txMmQkJ7ywKvReOMZ
	vvHyrxPLkJwodPyOjQw93JqwFFtpAc4vJ53n3YVCGnY7jojLivqKBpH3BHJ/0SSD9ar5QylfDaM
	PKjtrypYGutpDeiH/MMps8OOVdGDQADcYX/D5iMlyK/gTNQf3LXPYZrwlJx2enUkr6/Ihwmgn4E
	BcT3PzBZ+wo9E9vkJhexLaBBs1Tp4merrSWzu5lB5OG6y4GWwawbRffDL6tKvtSoR5W4bIngrLw
	/Dz9XipkcZd0jy2m7d67HDzX8l8i1hOB6U+DuNN9VgRVChBcaW+ejBGmFPIF/YQK/OpyrUGLbZz
	qmhno+8hk9COeC9W9m8xJ1f9XHCUKOADEtX046mPSe96g==
X-Received: by 2002:a5d:5f42:0:b0:488:7787:4696 with SMTP id ffacd0b85a97d-48b11a1adc8mr1050622f8f.5.1790867983076;
        Thu, 01 Oct 2026 08:19:43 -0700 (PDT)
Received: from StepanMacBook.lan ([85.193.43.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de18sm3399154f8f.44.2026.10.01.08.19.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 08:19:42 -0700 (PDT)
Received: by StepanMacBook.lan (Postfix, from userid 501)
	id C4C55F89B703; Thu,  1 Oct 2026 17:19:41 +0200 (CEST)
From: =?UTF-8?q?=C5=A0t=C4=9Bp=C3=A1n=20Daleck=C3=BD?= <daleckystepan@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: =?UTF-8?q?=C5=A0t=C4=9Bp=C3=A1n=20Daleck=C3=BD?= <daleckystepan@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: marvell: a3700-comphy: Guard missing polarity argument
Date: Thu,  1 Oct 2026 17:19:38 +0200
Message-ID: <20261001151939.23658-1-daleckystepan@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Armada 3700 COMPHY binding specifies #phy-cells = <1>, so PHY
references supply only the port argument. However,
mvebu_a3700_comphy_xlate() unconditionally reads args[1] to select TX
and RX polarity inversion. The PHY core does not initialize its
of_phandle_args structure, and the phandle parser fills only the
supplied cells, leaving args[1] uninitialized.

Using the unused cell can program unintended SerDes polarity. On a
Turris MOX with a Peridot switch running OpenWrt with Linux 6.18.54,
the CPU link reports RX CRC errors and fails to pass traffic. The
switch PCS does not record a partner advertisement despite link-up.

Check args_count before reading args[1], leaving polarity inversion
disabled when the second argument was not supplied. This does not
change the binding or introduce a supported two-cell interface.

The same change restores 2500BASE-X communication on the affected
MOX with no CRC errors. Cold boots, reboots and interface down/up
cycles were also tested successfully on Linux 6.18.54.

Fixes: 934337080c6c ("phy: marvell: phy-mvebu-a3700-comphy: Add native kernel implementation")
Cc: stable@vger.kernel.org
Closes: https://github.com/openwrt/openwrt/issues/24069
Assisted-by: LLM
Signed-off-by: Štěpán Dalecký <daleckystepan@gmail.com>
---
GitHub Copilot assisted with comparing the working and failing logs,
identifying the unused argument read, preparing the fix and changelog,
and checking the patch. The submitter performed the MOX hardware tests.

The reported hardware tests used OpenWrt with Linux 6.18.54. Mainline
runtime testing has not been performed. An isolated ARM64 mainline build
was attempted on macOS but failed while building host fixdep because
the host Clang could not use -fuse-ld=lld; the driver was not compiled.
A host C test of the changed expressions with poisoned unused argument
slots passed, as did strict checkpatch.

 drivers/phy/marvell/phy-mvebu-a3700-comphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
index 1d1db1737422..d19f0fa9ba7c 100644
--- a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
@@ -1232,8 +1232,8 @@ static struct phy *mvebu_a3700_comphy_xlate(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	lane->invert_tx = args->args[1] & BIT(0);
-	lane->invert_rx = args->args[1] & BIT(1);
+	lane->invert_tx = args->args_count > 1 && (args->args[1] & BIT(0));
+	lane->invert_rx = args->args_count > 1 && (args->args[1] & BIT(1));
 
 	return phy;
 }

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.54.0 (Apple Git-157)

