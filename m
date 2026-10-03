Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61A1A3A80;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058773; cv=none; b=Ok57vpyrHfFq/rHs+KhkEprR6ZIsr6C1W2BaPTgHDkT7I5kmrZxbn++zwGxY1IlFjSoZd6IYBqJQeXtvY0g2fPxY1PE+lpJy+kVPrPQzoMOQ1OJIlE34oKfDYy3bLraBrulOu8HkM50KRRBg0wtCJHASFu/u3Ey9KUDlHR7Oczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058773; c=relaxed/simple;
	bh=iBNPw4+S7wqe2ur9r2+G9UXaM8s1MByYaTEofVO10i8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mk7NXsK8qlPtKqd04SdRdiD1J+KsWxerozFm4S9QUp438fQDVDdB5ghGUOw8B5WzfZSQtUcg4369Kp7CKh6TYzy89AxVaZd/22GxwUD3yVLdsA749V0wUhwplqrmTyB1sH+wqxsPypSjvg5ZxxK9YxiKk2CSc4HxFHOlfhVbQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/koQFUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/koQFUg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49662C2BCB9;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791058773;
	bh=iBNPw4+S7wqe2ur9r2+G9UXaM8s1MByYaTEofVO10i8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=j/koQFUgiv1AhJOtahMKyyjrnDbQIE1v4MEomF/aH/t0m740HkKxaET1KYO1Bd+ki
	 kGDQN5KX8vkRw9mrrvHdzqvIHgsLke3hwFvSOfm/IrA7VhAkRpC/0ezkccbbZd3VHg
	 MVzPLPkPEaBNnlliR1SQ+y++ca05l1K62WkWVyt+gtxqpdspN4sO3eOFtbDKdg8My+
	 Q60WsClUlIlwf6AT/0UWlgtbkg9R37+CiXWmx0uqXaJuDIHrJXOOOHuAoygvDxNBf5
	 UHjaGsF9QWH96daz1w+Ms7rKXKHKwKU47K/imtgsOP36Q+KXzkSTkQrOCzZWeTta2V
	 zWdQLu4TbJTow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BDBCA5FDD;
	Sat,  3 Oct 2026 20:19:33 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH 0/2] Add Altera timeout bridge driver
Date: Sat, 03 Oct 2026 20:19:18 +0000
Message-Id: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZjwWoC/x3MQQqAIBBG4avErBswhcKuEi2k/moWWahFEN49a
 fkt3nspIggi9dVLAbdEOXxBU1c0bc6vYJmLSSvdNkoZXuDSFcBJdhxXYjm5c9a0Rs3Q1lIJz4B
 Fnn86jDl/3retxWQAAAA=
X-Change-ID: 20261003-feature-timeout-ip-7a93630de299
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>, 
 Vyacheslav Yurkov <uvv.mail@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791058772; l=1295;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=iBNPw4+S7wqe2ur9r2+G9UXaM8s1MByYaTEofVO10i8=;
 b=8l2Csc7ezXuJVwxnNu8Y1LTcxSKxqxv38TBsQd9NhOdEMMLQDhfiNKOzCuCtyfGTj8G1wUSBR
 Czdud9AosceAdMGj5vn51ekQOTZXVXvEfSoZHCbXsDdfZHebRhDy/+G
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

This series adds support for the Altera timeout bridge IP. 

The timeout bridge connects an Avalon bus to the HPS and provides a
downstream address space for devices implemented in the FPGA. The
bridge also exposes status information and generates an interrupt when
a timeout occurs.

The driver registers the timeout bridge as a bus and allows child
devices behind the bridge to be described as the child nodes in the
device tree.

The latest bridge documentation (as of October 2026):
https://docs.altera.com/r/docs/683609/26.1/quartus-prime-pro-edition-user-guide/axi-timeout-bridge-ip

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Vyacheslav Yurkov (2):
      dt-bindings: bus: Add binding for Altera AXI Timeout Bridge
      bus: add Altera timeout bridge driver

 .../bindings/bus/altera-timeout-bridge.yaml        |  82 ++++++++
 drivers/bus/Kconfig                                |  10 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/altera-timeout-bridge.c                | 219 +++++++++++++++++++++
 4 files changed, 312 insertions(+)
---
base-commit: a74306e2e676f9775457366fc047a660fbf02f26
change-id: 20261003-feature-timeout-ip-7a93630de299

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


