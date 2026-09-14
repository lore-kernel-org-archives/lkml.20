Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8D3115AC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361448; cv=none; b=liLHku1TUVp31g5/WEzJI/TNGsej219L9dXaWwyDqCvBupwOU06K1dnVaxgvywxekyJa/rOwNSrWJaVHk9NjI4yuhUPT1FEzCaONxx5eNNS0u66VcspwQw7cGkvtpgqk1SCVBX5PTVaBZwWd9EY6Bu0TMl366gTNtttt7VEBPTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361448; c=relaxed/simple;
	bh=TMaKqT3wETJ/Kskr95mwiLzIopTwehVGMkfPEoOkcbI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gp9Xq3Q4159sNMMCpQxc7KblGkWZw/pS0uaPosalG+Jjh032Q+qiCsSFcrw6Cfk1ESnwxAQH10Ujxte0IEaXxSSxB04NYC5o+hPqYlMnxBgmnQI4m4KEWTEhg3nGH7ZckPY8/T94UoIXhCtDyYxxxILF3N4FAGxCne0r5Il5A1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEqUFxUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEqUFxUF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74677C2BCF5;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789361447;
	bh=TMaKqT3wETJ/Kskr95mwiLzIopTwehVGMkfPEoOkcbI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sEqUFxUF511dTxu1P8l2KuPrBk/p2v7erDXLCPd0BK50RRdzRw+7yvDh49229qR0b
	 sjS4jJ+Yo3kgZK8FT4DETxClYyTfHlA9paliw7V0CVkVQuuDxL8QyZaCvvo6Y4Qhc3
	 +UPoOrmKrPY/KflddCxDNnEEis8lw9McGatk8xRjddgnjilmYK8kq0g+/I+TXSlS1M
	 hbLun4y8HaJoq0EUnzNf/mJFe/qi9e8HLJbozCaRHKRjKGPwgzE18gt+JItTtG7s8b
	 MWtaI/Bs6wtwl6I5RDajczIgEc6wBiCPDbxTon9fkK8IPCD+ZTXPJsyrJaylMjjYMv
	 MgPhPz3mOiAnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610D8C88E67;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Subject: [PATCH 0/2] mtd: spi-nor: spansion: Cleanup S25FS256S
Date: Mon, 14 Sep 2026 13:50:35 +0900
Message-Id: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABt9p2oC/yWMyw5AMBBFf0VmrYk2lPoVsfCYMhZIB5GIfzdY3
 MXJzTkXMAZChjK6IOBBTMssoOMIurGZB1TUC4NJjE2c1opN5mWWladzX1Xv8iYr0lZ760CsNaA
 cX7Gqf+a9nbDb3gzc9wOC8PqWcwAAAA==
X-Change-ID: 20260911-s25fs256s-fixup-d97a584b1f69
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alexander Sverdlin <alex@sverdlin.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789361446; l=642;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=TMaKqT3wETJ/Kskr95mwiLzIopTwehVGMkfPEoOkcbI=;
 b=lnjrw4rRAXxTvWObos4WOftuLLGns+FPN0r0oNgviWqSVvkeAamdhX5h8yTGBAG69UfrtqT7K
 GNY4ZWuAS6ACCVH+jddxxNRdfala2L/j2JEO6K0MUSU5FCtV/hymeEJ
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reply-To: takahiro.kuwano@infineon.com

This series cleans up the S25FS256S entries in the Spansion ID table.
Remove the invalid s25fs256s0 entry and assign the existing S25FS-S
fixups to s25fs256s1.

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
Takahiro Kuwano (2):
      mtd: spi-nor: spansion: Remove s25fs256s0
      mtd: spi-nor: spansion: Assign .fixups to s25fs256s1

 drivers/mtd/spi-nor/spansion.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
---
base-commit: eb652d33da1b99c58a1465028b1336af5a3367c5
change-id: 20260911-s25fs256s-fixup-d97a584b1f69

Best regards,
--  
Takahiro Kuwano <takahiro.kuwano@infineon.com>


