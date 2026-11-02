Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599235;
	b=2jjQk/7nMp+6kAoNbe7aUwz8WpptzjHDDf15kuTxh5u9Lijg+I7XnnJ0tFsVY/OzB+Tb
	 FD5tEiOa1OH8ESQslRz9AqkcZF8ghVsrw2fui0URMtSCWbpxpPP610LCsODlT19z0e3eA
	 WYb6dcv8i6oUaXD1hUxJR8aRE+2bICcRaH3yPwklOFMrWOTg8Bg+5yY+fTqt1Ai0Bmm6s
	 a26KraqYkkO8sTydI34PBA0oGUelS5LD4SGKe2Q6wz8uSnEI1OPeTotMQwENw0pjp9b5b
	 ZZIey6wIHxCTrSP3ErbYYXjA7FV1ANAyJtYnvJLriOApkN+xIgyvTfuu3Pt7xfiP8IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599235;
	h=DMARC-Filter:DKIM-Signature:To:Message-Id:Content-Transfer-Encoding:
	 From:Subject:Received:X-Mailer:X-Original-From:Content-Type:Cc:Date:
	 Mime-Version:X-Lms-Return-Path;
	bh=A/tLJoR6OHH3WDx1lVKoWYGKHOjQjb/b8PFhHuwJhxc=;
	b=G5in720qQqtRFzUMssYNFy7QpithEpbvaqDG3oKk13W/DdqLHN8i5MxjOT2BKTnQ5NwG
	 QOX9eD3foarY/tt6vqfCFI2pN5kqW7LiGvplB6KXJgslzBnbWh2yz6GpNJofNpazaiJbS
	 WKZsKf+6n0FxrkVbl8v7pfl1GIOdqrsZ3zoWx5vwOAF78WXvDTkh56hAVv5783cdkxfOL
	 /wfWL3iEnc2p8e402CCLT3K7B3cyWJoqLA8RK8CN4YGvxv59AJIvFtEG24TqDP/PDyXSq
	 BORQYfSPtNHb3vH9I1I9Dro1nz1Lod+KGduvZn8okR4Pi3u/QQMsbGQcKjYb1kHPxyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NlNO657O;
	arc=none smtp.remote-ip=209.127.231.26
Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4992A606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4992A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NlNO657O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599229;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=A/tLJoR6OHH3WDx1lVKoWYGKHOjQjb/b8PFhHuwJhxc=;
 b=NlNO657OTtDs1MO3Bi375pa3WRIykXshvZk68y4dublKsxHAI27SUJ2i4l4037ZU2uY84a
 4gvhYleRByst9Zq1qa1a6lrS7vnTq3rdR82akc4OHPea7hy43YyJKy8lQl0P6UjnUzNNU1
 anfp5JHMJ7vz8d2brKrwVjTdMsTAkSDVjt6XEQ/WVGnKuK2AvhEt/46W/KadyRx7YecIRS
 LUAx7xBsVZMsNfg+QM8Q1kEp0+bi7r/mXrjiq6x0R6Orc4ZLOWKC+u15yF+0y/UoLvB0E2
 0cMfr0G3W9Nt9ofaCA5qFgGvaGp3NfU4zJuD8kSc4aOGZLO2DW6K7/MIlwgBkQ==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:00:26 +0800
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon,  2 Nov 2026 14:00:12 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae826fb+3693e8+vger.kernel.org+sandie.cao@deepcomputing.io>

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261030.

---
Changes in v3:
- Remove useless gpio header.
- Add Onboard SD Card comment.
- Link to v2: https://lore.kernel.org/all/20261020081633.3673704-1-
sandie.cao@deepcomputing.io/

Changes in v2:
- Remove usb3b, usb3c node define in k3.dtsi, it's already uploaded by 
other patch.
- Add phys and phys-name define for usb3b, usb3c, usb3d in 
k3-deepcomputing-fml13v05.
- Remove cd-gpios, use non-removable for sdhci0. 
- Remove vmmc-supply for sdhci0.
- Link to v1: https://lore.kernel.org/all/20260922110231.3426011-1-
sandie.cao@deepcomputing.io/

---

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 227 ++++++++++++++++++
 1 file changed, 227 insertions(+)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0
