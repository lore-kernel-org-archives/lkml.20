Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C58645628B;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=h+AfcdSOKj2mJZa75+RLk+6o39rB8WkLArGfZuxaB8N2IggB/IGrLuKSmR9kksvZNsF6pc4He6ekcqNzqoD/Nu/9BoKTVGXK/Tj6xvQvgqcfxHgRnG07ahxthXISezbgiWgC0YyJmMGFbxqpgDzDqs0BQfExTjOI7dMwLvcg68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=1VS5ElObVqR4WKXROqPaqb+LeB1gJwIdpIW5IFGGrxA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N/vQgmRkNBpiNplE85UTVyoQPXcpaXO9ve3bxeolFSrCc1tn3g9XwvJ06Xsd7OVYu0XzS3DKKvbRiq3iISd3UN6icH2FXFKIQewilQHvrZf9H6mNS26BAloZtCEJkhSVjtmXWMSHTXeZOPS3iTgbNssw4XdiDPrXVrsIdBlq5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHTZYpQr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHTZYpQr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C707EC2BCB8;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115331;
	bh=1VS5ElObVqR4WKXROqPaqb+LeB1gJwIdpIW5IFGGrxA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lHTZYpQrs+0MPrNJ1Kf9WfhORtho4Qd0BL6fZ1ngaacv3k4ZFgLfBrrARi0wset6a
	 r2dfdcnfeQaXojaZE0gOFJkp/omct/lYzMY/Zw2he3oWrRla09WNISizoWTTzYsFoc
	 8XN5xgTpenvNg6U2HfHKKqSInT9cPorLjT8uzGVHRqFO0boBuVb53sCUVgFJCuGmHb
	 v6CtIIiYOGYopBF7wAaFpC3MuxrISD9GoebR3eYWeACsz/+hem1c03AIVktOBpEyTW
	 +F13nve6LsIvrjwj3MtE8HTKkUHrJv9NmPQqg4sxqTD4SZhgx+pjPShMlsz1S1udA5
	 Cg9w0mEDUHVPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2537C88E4D;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 00/10] soc: amlogic: clk-measure: Add support for more SoCs
Date: Fri, 11 Sep 2026 16:28:27 +0800
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKu7o2oC/x2N0QqDMAwAf0XyvEDtQ637lTFG18UtOE1JVAbiv
 6/4eBzc7WCkTAbXZgeljY1lrtBeGsifNL8J+VUZvPPBda3DSZTQJBsugraWIrpg/o6PiZKt1eX
 owxDTs6cQoWaK0sC/c3G7H8cfS9aQVHIAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=2217;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=1VS5ElObVqR4WKXROqPaqb+LeB1gJwIdpIW5IFGGrxA=;
 b=E3+DeB6GV9hFUk8OaEE06kHsbHmsvNlb9k5j5OnWHHmzw333FSBd2uBr+Mkvls08BW/it78qn
 1KzIArLeCE+DQ3f0fI/UQOoysDxV49AHMVuHd5NI1lPSwNhnPXzhZfO
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

This patch series adds clk-measure support for the Amlogic A5, A4, S7,
S7D, S6 and A9 SoCs, listed in the order of their release.

The clock names for the clk-measure channels are kept consistent with
those used by the clock driver as much as possible, making it easier to
identify the relationship between the clk-measure channels and the
corresponding clocks in the clock driver.

This patchset also includes an additional patch to optimize memory usage:

  - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage

To avoid requiring everyone to spend additional effort on a separate
patchset, I have included it in this series. Please feel free to point
out if this is not appropriate for this series.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (10):
      dt-bindings: soc: amlogic: Add compatible to support more SoCs
      soc: amlogic: clk-measure: Support more measurement channels
      soc: amlogic: clk-measure: Add support for more SoCs
      soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
      arm64: dts: amlogic: a5: Add clk-measure controller node
      arm64: dts: amlogic: a4: Add clk-measure controller node
      arm64: dts: amlogic: s7: Add clk-measure controller node
      arm64: dts: amlogic: s7d: Add clk-measure controller node
      arm64: dts: amlogic: s6: Add clk-measure controller node
      arm64: dts: amlogic: a9: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   6 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 901 ++++++++++++++++++++-
 8 files changed, 935 insertions(+), 2 deletions(-)
---
base-commit: 87e20720aaadf9540c1596b05b93073a99d02258
change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


