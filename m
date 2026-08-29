Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C82AD2C;
	Sat, 29 Aug 2026 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788031914; cv=none; b=ku7+Wc75bCyYVsjqLHQFO40ud7rNzhVCdF6tC25X3Czfm3GPxhW3rud8Y5sC3ntoCKaQ+4jDIymiV9GcxBpXzRn5JfvJJtBGFblQ+Ptv99XWVQNX9WY0jXPgMn9CkNB64sLKU1IyfgqfWydrbBbcvw2SvGajoifiFK5IZOUdOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788031914; c=relaxed/simple;
	bh=zWA0e3paKnXOqIGFnWjHF3VMRHadOpn9Ntl94B44z5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sR6+r4GoLthKZmGndRqcqjeBOj1pi99c8FY4N248ir6+7D1QokBq/q8+u6IlgGYaKtDRqwhyjmQGEOXGe3sqgLahhDl6QwhKMuxLJn4hqozqwzPeXWyylGEyZf6Sblqz4UW4c6bekua7wVed75y30EcnyGDmjbRCW+v1qq6sg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+ZLXK75; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+ZLXK75"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BD5AC2BCB9;
	Sat, 29 Aug 2026 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788031914;
	bh=zWA0e3paKnXOqIGFnWjHF3VMRHadOpn9Ntl94B44z5U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s+ZLXK75FoQM+CDGHrtNdSmeUPX7sRnzOJfEVEfNy+ShaNrwZKB9sjUNg6wu61afG
	 Jc139cV7x7nOkahL8FlFlNXEYK/jqH9JRgd3ca24/UfrUw59LTqUkQB+RLPdGqEcdT
	 BNFyKMjIEbWwTsw1IjITxUt3l8MF4gaqYePOBe7QcY6u2Bd4o3LOwgJlhbFbVKQFmK
	 p5QDuDTMdFmUDD7RwIKPsnWLhC1kLpN4H/G3KM4vL7KTfhSP+jhfPvQPgYoyg0NaNy
	 1CzBgWcPF2IjMrEft3Q4m8KeqJ7UkcIXWkZJbUISqNtrWb5Q9XQMhRhx/Ua7kpGZEA
	 tKX/vbgJ2KTpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B733C61DD6;
	Sat, 29 Aug 2026 19:31:54 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Subject: [PATCH 0/2] ARM: dts: qcom: ipq4019: migrate USB to qcom,snps-dwc3
Date: Sat, 29 Aug 2026 21:31:24 +0200
Message-Id: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIwzk2oC/yXMTQ6DIBBA4auQWTsJ0JZIr2K6oDDqmIgU7E9iv
 HtpXX6L9zYolJkKXMUGmV5ceIkVqhHgRxcHQg7VoKU2stUWOT3OUlkMb3/CmYfs1pqgv5C0pjX
 OugA1Tpl6/vzH3e1wed4n8uvvBvv+BUx4EEd6AAAA
X-Change-ID: 20260829-ipq4019-dwc3-migration-c5e09686a9ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788031913; l=1536;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=zWA0e3paKnXOqIGFnWjHF3VMRHadOpn9Ntl94B44z5U=;
 b=9f+XEHPhEA/ioFMP3AAehqUvv8yDsQJIYgEi19TaElsbHSKfxoyM2+smbqfM7oCi4jkRWAKDt
 xsyDRGt8OgyBpEdTEvhpkRiExp3s0xGBkaO5l3G8gU7Es9CB9Pf6SS8
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

The ipq4019 USB nodes still use the legacy qcom,dwc3 glue, which
describes the DWC3 core as a child node. qcom,snps-dwc3 embeds it in the
glue device instead, so the two nodes collapse into one.

Patch 1 relaxes the interrupt requirements for qcom,ipq4019-dwc3. The
binding groups it with platforms supplying five or six named interrupts,
but neither mainline nor Qualcomm's own vendor devicetree specifies wakeup
interrupts for this SoC, so the migrated devicetree fails dtbs_check
without it.

Patch 2 does the migration, and moves the ap120c-ac SS phy override up to
the parent node since the child's label goes away with it.

Patch 1 is for the USB tree, patch 2 for the qcom tree.

This is a prerequisite for setting per-SoC properties from the qcom glue,
which the legacy path has no mechanism for.

Tested on a Ubiquiti UniFi Travel Router.

Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
Matt Eaton (2):
      dt-bindings: usb: qcom,snps-dwc3: relax interrupt requirements for ipq4019
      ARM: dts: qcom: ipq4019: migrate USB to the qcom,snps-dwc3 glue

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 23 ++++++++++-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |  4 --
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           | 46 ++++++++--------------
 3 files changed, 37 insertions(+), 36 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260829-ipq4019-dwc3-migration-c5e09686a9ad

Best regards,
--  
Matt Eaton <linux@divinehawk.com>


