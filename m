Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AC53B47D9;
	Sun, 30 Aug 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099745; cv=none; b=RQeOOjQvxW2SJoK3hDM5NDLMtxk6PUQps7soOTlQ2HKwOG0D7Q8DeQKXfmgZjExvyVV2vijmqmY8/j0M9l5OB2el8HqDDeinnNXAYKtNjSI70hlq8/7MGVxPr+3efVDb7XUUyXDMfyi8txszdQngA9KKPDerJLxhr4fA1b4cW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099745; c=relaxed/simple;
	bh=M157gAg3aXNBMLpJR2h8e9GqFXRRpGln0DE/YBYm+4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nfMlIXiI7dPZiK+oQd7Z/bzqoJcYhaI2aImOo8tg1UUfnupRUFKO5Typw7V9REa9kuxBar9Xt9m/55NcfbcBB4vzcKyaJQo4R/zDmKSIGFt/febeeKf9D/y37eK6uO1hyWMH1SBrepSQC7yp5VdcTBo1eWPr38TcKdgnLNGdgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOwPg9rt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOwPg9rt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7F14C2BCC7;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=M157gAg3aXNBMLpJR2h8e9GqFXRRpGln0DE/YBYm+4E=;
	h=From:Subject:Date:To:Cc:From;
	b=SOwPg9rt0CQ6UjQrPArkOQ5P0HKGGnT+hGK/xxiASmlgTwiLC//tqFkIn48qhnFrc
	 iqIlqKp4ofH11zDcAIOooVARBDhj4C6aLxI6tgOszbqh5VRvbzRxTxYBIqfY10GcmD
	 YsYrV5CzgopekhoN1/sjAcHT6DN065ag16ICTR/G9pOywujvrJS1tIhzR2SZNGjm37
	 zXejyS4Vw9VeicxmOCZLn0ymKe15Rz6yhpqoqo16j+ZqjX3JAudX1Dbmuuy1CpkHJ8
	 JU3hjXPzY1W1pvyz6CmoO7jeqGqO+qhy3MGmkqqIP91Ob8nMOPSuzr6EDab2Hb3D8b
	 4qg8X2iEHqg2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FF3C61DB9;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/3] arm64: dts: apple: Fix cpus node indentation
Date: Sun, 30 Aug 2026 16:22:06 +0200
Message-Id: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0Q5EMBCF4VeRud5JqgTdV9m4aBmMCE0HkYh3V
 +vyy8l/ThAKTALf5IRAOwsvc0T6SaAZ7NwTchsNWulCVZlCl6P1fiJsV8GODxLUrjS5sanVnYE
 Y+kD/IXa/+rVsbqRmfZ7gum4zGuGsdgAAAA==
X-Change-ID: 20260830-b4-apple-dts-fixes-2b7949a1a2f9
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=M157gAg3aXNBMLpJR2h8e9GqFXRRpGln0DE/YBYm+4E=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUmzmcy1WeiCR9Kd5qVp2tkdp03Y1H9GuC1A0VhwVMB
 VttFU51lLIwiHExyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACay4Asjw0OectuLx0SFxBd8
 vDSHQ7So7qqhd3jS+rdH8xrfhD3tPsrI8N6ZSSzsB5O+nn3ex+0LgmaVri0QS9oos3DNw//XtrX
 78gEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

Just a small series to drop a spurious space in our dts file. No
functional changes.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (3):
      arm64: dts: apple: t602x: Fix cpus node indentation
      arm64: dts: apple: t6030: Fix cpus node indentation
      arm64: dts: apple: t6032: Fix cpus node indentation

 arch/arm64/boot/dts/apple/t602x-common.dtsi | 2 +-
 arch/arm64/boot/dts/apple/t6030.dtsi        | 2 +-
 arch/arm64/boot/dts/apple/t6032.dtsi        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
change-id: 20260830-b4-apple-dts-fixes-2b7949a1a2f9

Best regards,
--  
Sven Peter <sven@kernel.org>


