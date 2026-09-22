Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45445628F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074974; cv=none; b=Uges1wUjZS6PIArUKJT8ERfNtr2CaZJ7kn/LY7KgJu9xMyvravr4nRqYM5wf7lC/Ltm0NTHW/0sKDW7xHdcCqZfzu1A7FDrsqq9Ld3vkJLfGXvZmCindJE1xHrfl26FRXxdP4QrR24tmgxoUZl+bmTALOVNTf61cgDPch1GS2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074974; c=relaxed/simple;
	bh=1899KeD85uKRGfXlEpmON98ChfRq+XnW3qXz5M6N/+4=;
	h=Cc:Date:To:From:Subject:Message-Id:Mime-Version:Content-Type; b=bKmMcTDF9gXRS00CU9kf2JHDaY+jrbSccgf30z7xc/rmYdXBiFah8Xna+omld0WinonY+bJA5G5bpNWkvwkt2AvI9gmBtCqTh2Rb1bO/sqiFbDBpHjXNWlJvg38CR8QSt7KO/XEiU93xBawCuwapkdK8bRWFObc8V0qI7fEbRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=0NCiP/zK; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="0NCiP/zK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790074961;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=iFgJigE7aPx9rcthpS190in8b+smB38KzrjCrY8jyZE=;
 b=0NCiP/zKr/rJgj1+Zx+mOuh2xXMNG82cVBLX/lHIs3PjGSvbamCqznwvmbTuZV0ibJs8vt
 gMDyAd/xyuNw+zDfVJiS74ke+GMi/8RuzvVF6/v6kncxkaimuSqb0iWFIe/4DnYYxG0Ihm
 onYnfRnX0Z7+pRCsTOijy1qRbnVvmEaR+jGs07mMu8ZZtUFeM2xJhNlRZv37qPNrMpvmN/
 wU9YYEnmSxhblcNnuOaY2qS/apR0cBHULle4ZyXLED+Te1nTQ1CzcuTFh/tw7jvvIQLJOB
 aM1EqeTHvWRtkZfHtwTgC/GldqYqnZK6ITghHQK2i7nNtCTtxl6ZQ3dsAd3cIQ==
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 22 Sep 2026 19:02:31 +0800
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26ab2604f+1f6f27+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Message-Id: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.111.1]) by smtp.feishu.cn with ESMTPS; Tue, 22 Sep 2026 19:02:38 +0800
Content-Type: text/plain; charset=UTF-8

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC regulator
tree, add USB controller and USB phy, Enable SD card.

This series is based on next-20260918.

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 218 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  66 ++++++
 2 files changed, 284 insertions(+)


base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
-- 
2.43.0
