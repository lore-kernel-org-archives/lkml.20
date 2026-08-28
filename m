Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78893F8890
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925192; cv=none; b=qEwwEZvF0Q8UqRL9rhek+LzcrTqlgBphSRdk1cmx/2Aw8yvKM6DaeqWlIVRG4BNHzaWriqgdhkZ7rlHDuiasRd/KfaS7iQUn8eA9uQeYTyvAcjuoDvq/rc7HkLEn8X2P76ai367hFhH8D24C55Bed0DzgZobIurrNfdIjXchOUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925192; c=relaxed/simple;
	bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=loeiCGyctYcMEYfNtGk+X/akP3IzeciVUHteFyVXbVE4i9au+arATwCkVaGGgU2koqr9V1I5fNmGobCTTy1n/XX8v0Gr/T/XSEyZKuEhIkBkavW9Keowle0N6DovQMJqvQQ+sjaNpZbH6q8H8jSLtD7SdV9H7EIQlJaUpu8FVsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=nAW61X2/; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="nAW61X2/"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=nAW61X2/KsfUrHv2WqkCt5+3ZFTAgwwKdDIGfKpdPGniI9rWa5n7V0v/b/5Bc5yy9JoUQjryGxRq+MOsx5ZndP94fWtqlwucrlgSiY0y44+88/ykzJ6IJex65T19hdCZpi5HH3HFGRVXILvJgXCuAi3ck1oL/f3WhavJ2SKbS5ECDgcncJV/fHRvT0UVujeDF4TrKsoXLO4zKtejANiiOyJaTZxNTFz79YX1nQmAPIzD9CO0O/v4v5XUWhjzNzhu+ji0rZYaCHTpZnCJAx6NxbZEwrSkVIVETBKuRa8F4DkvUCyJhncrpJCTrHi30EFyuNA6FQ2At0BM0w/6QXGurw==; s=purelymail2; d=purelymail.com; v=1; bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1236780859;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 28 Aug 2026 13:52:50 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] arm64: dts: mediatek: Fix pinfunc headers of two SoCs
Date: Fri, 28 Aug 2026 15:52:45 +0200
Message-Id: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G7BFavQr4qG1UXNwoRURxL8bP
 M7AzAOZk3CGrngg8SVZ9k3BlAWMi99mRonKYCvrKrKE6+moIVzYR044yY0UoqltMK0bJ9DuSKz
 6f/bD+36Wt25kYwAAAA==
X-Change-ID: 20260828-mt6878-header-fix-8bd142b196cf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925168; l=895;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=;
 b=EE+2KyOZ6REjfgYNnoWEC37uIZ6e4QDtYry3/QrBnOwIYdh1aBk6en9BUD3pczEmQ4hkBgeLC
 6aJplp4Ho6iCA+hdjZ32rYfOKUzjhSReRMWQDYeA0WdH/WH5ZkkLNxo
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Hi,

these pinfunc headers were including a header ('mt65xx.h') which is
outside of the search path (it's in dt-bindings), thus causing a
build failure (CI couldn't catch this since 6878/6893 don't have DTs
merged in yet). Use the correct path, following other SoC pinfunc
headers.

Best regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl header path
      arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl header path

 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h | 2 +-
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260828-mt6878-header-fix-8bd142b196cf

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

