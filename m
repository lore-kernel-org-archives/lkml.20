Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AED522EFF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867953; cv=none; b=Qi9KrAvUgm+9j70aRFKgFTClC9TKXoQJ04OUN+qggCpwsLjSA5mKx05W3h08xw/Dgwd3m7CzAGScx+Cn8GRexw+Kmpx7q0P3vhEDqswL5StKOJMHiC+0Kffd3z1iJoyLeKdbMNvEw5Xmoz03Dso9GTcxqNixzsjUFio94bDp/vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867953; c=relaxed/simple;
	bh=xPVjPMgSB791riGDcbRM/IrVfcns5L1TXK+cmo8o0Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s9nCVb+UrGxJEyP2ihF6xLl4QtloG6WAJD5yYyYun9mSsNw/9mSuEaidjh/okrVqODg5CSUfSz1eQEnFrY7U1ePjBquPdwlAbiRUP8vFo7flUmdgWGZr777Z/Ps2KbJGg5uZGyXUhkRoBx4vue8yEqcccNRxnfQSonQGPboP13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6fJrNxa; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6fJrNxa"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe625404so314127f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867950; x=1791472750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5xSPKk+m+iRcX7pWXBAMbyjKdLdGZon4dYuunMEzUY=;
        b=M6fJrNxaKr0DsEjpxd2qS8Y+qDmwjqlaNbELuy3WxTKpFH3HdAY/LuVMypw1aFrPqQ
         elZtxiK4tPu4XEPhfZnWHek0PNURStbOuQUHorxKFzT/8T4vpVZSrJ4lU/dOqps5wbUf
         bHg6yRPl7o6OPD+WdUFXTzL2VlSKr/ixHcLeZ1D4d4fsCYqZIlcDjuNcHpHTDhYW3NbM
         J3Rffi1DX95Jd72yop565DW8z749lIwOB9L3pG6wyEOfbeWvynaNja1j8ULNmYpERqHH
         84orcS34EwhUHZG8rnk2L7kXx4NbFCDP4zU+jI1UlCTi2NVPrIia1l4ooucVS6j5rXLq
         0Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867950; x=1791472750;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5xSPKk+m+iRcX7pWXBAMbyjKdLdGZon4dYuunMEzUY=;
        b=IBC937tjtahoIuDlC/B0BqBPYtWNBgonBiV/iLZqmGALVEjruSaDRpY7cSKW3uJh4A
         ndI27nMxlRgp2RPRmMWzxR68KLcqa9CeOcpX1d9JJYfGE8Jb0jtc5OdJ1jD42rw773GM
         hULyixZ0Igz0ybQo0U3yWoJ+PcFTvKTED+Zd7QWJWfiQ7vMCv2Bf3JdKaCtVu01OsgfG
         ehiptdAUiNXxTV+Z43qEO0uVG3m5Viz8T976uc7W7bFUICGr4xxhbZFXE8LCWEhlcfa6
         1hKUCtWyEO7YVRSfGFWK0g8jKnE0T32KJ0WCRakEs3SMb3tsUsv3XT+inW6Dzvsan79g
         7n0g==
X-Forwarded-Encrypted: i=1; AKwUvBw0We4bmasIEsXPhbbzYOVbvGgqd97IlC/Zi8hYPG0lWPEMzgOiQVvXIcm5O5SivHWpDsL/Upjr+G5rijw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXJ5rxKN/scJTcuSoOdRSiReD9augedEXmFhXSgvLJG4AGuVp5
	ke6o7FLDamUWg/Se6Z4Eok+568/uF4zsNwqWoyx0zdtzRuG0PZzRBzFX5PwJI5V4
X-Gm-Gg: AYBFou1vY6lftpUV43qDAGAbzdH+TCIBQe1oQqtMFFiaHz6nyH2/Nspf9t9J+oYrjem
	ZkbK6aEgo/Z8EokGai5QMv/N3lgCUnl93XcqfzA2UwHTs74D3OzQQVQtGk9a7HaoYfc7Y164Ra7
	+HjPDzZ8WqZXpudhyH92Iv9TZ2mlebIk5ClUkvzLAAAgGkhy+Lb+Fp36oEGMAOGJU9C3+90CkAC
	WpTXSwyZTr4GMRc+e9EbFOt2GFE1i+OupEAfDX12U/nANpbyVqeFLWOmEz+e5g8kNjZ0KHhpp/I
	Ptub45I+dBc/JsVS6Eycnb+tNZNjG6TnaTNkGSgWjPA95lEwiZu0nsHY6VIdyPojm6ZGgEKNog2
	MHjI8z90nzILfprKWbWC2lF5dYvyc3XmbqC9CpzcM+WVKrR1egSywQotfUyzntU0joAwbp+8Rs9
	zrGi5/QAdBl4MdMctFKafNDhqjidzW/k7tmeoBVeEwV2kQEM9dLcIcGrtF84UQWwSPM8B/pcmLR
	O5vcPlau6iCyglFeiMpTaEy28kSQURO+fg=
X-Received: by 2002:adf:e19a:0:b0:487:14e9:5cba with SMTP id ffacd0b85a97d-48b0255a567mr9510843f8f.6.1790867949738;
        Thu, 01 Oct 2026 08:19:09 -0700 (PDT)
Received: from StepanMacBook.lan ([85.193.43.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690e19asm6738882f8f.18.2026.10.01.08.19.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 08:19:09 -0700 (PDT)
Received: by StepanMacBook.lan (Postfix, from userid 501)
	id 81075F89AAA3; Thu,  1 Oct 2026 17:10:46 +0200 (CEST)
From: =?UTF-8?q?=C5=A0t=C4=9Bp=C3=A1n=20Daleck=C3=BD?= <daleckystepan@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: =?UTF-8?q?=C5=A0t=C4=9Bp=C3=A1n=20Daleck=C3=BD?= <daleckystepan@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: marvell: a3700-comphy: Guard missing polarity argument
Date: Thu,  1 Oct 2026 17:10:38 +0200
Message-ID: <20261001151040.22289-1-daleckystepan@gmail.com>
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

