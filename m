Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049599;
	b=Rj/HPv+6sWz/xdqRsed3njg6YGanD7BnCOrj7sDCxDpc9EoTsmYeVo6pattNX121XmWv
	 UpGgQAxSue2ujbQuOEGSoEvEKfNQKbS0JPVYtKx+kMSAQjkDkTbq8o9tHgfHisag92Yry
	 mM75sn8GFbdw/lvkWkkhPDJgr4AU8lq5x4lEvez5iQr8npnZcA1/1Z9FepQXABxC9XYvy
	 NBsRtZkE0O8+u0bJF5xVrvjdM4U5IHDQhe6rN2T9LypjPNw1hsh0dq4ynoq55c9AY1g7i
	 wzgI9Jbb1TuZMDclvtmpXg9PuzX/Sml8M8k2gO4cyG8LTnM3RdGXJcE/AuE0ap2mD/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049599;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KQl49JqDM1vCAeHiQOXEOxQSoBHDKUHAveCBwvlANlA=;
	b=KjfuKWeeuFD35qrsnIkA5RcSJMWTnTRyXfT7c4qWUxuq+jDNj7eXOMciCjf60tAwVRsp
	 aSj0z4eCakBk6Wro7+GdUKAbuw78xtFQW47PLXQyOrnOjO79GpEhLsKiDiKHW/X5ZA28J
	 mtiAFnHLIFSWxzXMRBWclk196+oiGReW5xcieH90USRns1pJ4anH2HML50kr1MC/j9jK6
	 gcT+tMLjKS7CFjDsordbh9CRqOynLO6LNxcuS8+moQFoHHtOe/Uea6egJwQintd6/DBTB
	 ZIg3soxaQbf4Nylqq5SMaSO7SQeyztxOEUnsXMPWVRKLfFKQC8mwGuLCh9rN5DXHUMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X04TXavF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CC606A32C;
	Sat,  7 Nov 2026 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X04TXavF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8955C1F0089F;
	Sat,  7 Nov 2026 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049599;
	bh=KQl49JqDM1vCAeHiQOXEOxQSoBHDKUHAveCBwvlANlA=;
	h=From:Subject:Date:To:Cc;
	b=X04TXavF7DfzIIF4PvjjKGxVm6TqxF8osxc9KAtZgcGy4i3bvupWXzybPJgOU5vmK
	 v53xqJLdeQWRxW1Ts04hYQMJMGM9ohjRlCM9fHpHR0yXvf189QcAPbmAlLawolDTM6
	 LhIoPltEktEz9ytESttOQ49RfkTBpqvxfqTMugOS0WQ9YibMHCJeQo1C/fK36P1pmf
	 kUZKTkMnzCNeysukKqRrma2LhCHr5FenLgf7hRbq4enzNfLGLxUp9sPlLbAc3PJNOw
	 gxD2J5U9N5t5gEtQ/qmp+gbnpvYaiSKGKBCC3Z0x6vVERY4TKyBobpbvHH6rYeFpQR
	 J5rB+FBBgze/A==
From: Joshua Crofts <crofts@kernel.org>
Subject: [PATCH 0/2] i3c: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Date: Sat, 07 Nov 2026 12:06:22 +0100
Message-Id: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqFMAxA0a1IxgYaxQ9u5eFA0qiZtNLYhyDu3
 eLwDO69wSSpGEzVDUn+ahpDAdUV8L6ETVB9MTSu6YncgD6GE7MJLvmMlu2Q4FFbRu86pp5p5NF
 ByY8kq17f+jc/zwtJ/daUagAAAA==
X-Change-ID: 20261107-dont-use-autosuspend-i3c-d05c16c18c80
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049597; l=750;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=ouv8izIkvbhc6okskbPloVm4p8gofpB9GBqlgkpFX+A=;
 b=JmThoJuFTbbQpKSHqwSjBG2T9jNfHUlHPFJZ/czjYxWwMUNimU0pqVZkRGZ9AxlS0CJP1ekVF
 pmVECe9Dd+5Cp0dZA9N5Y50XpPWcyFMpxO1C80jBEo3QcEyUeDD4s6T
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
Joshua Crofts (2):
      i3c: dw: remove redundant pm_runtime_dont_use_autosuspend() calls
      i3c: master: svc: remove redundant pm_runtime_dont_use_autosuspend() calls

 drivers/i3c/master/dw-i3c-master.c  | 2 --
 drivers/i3c/master/svc-i3c-master.c | 2 --
 2 files changed, 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-dont-use-autosuspend-i3c-d05c16c18c80

Best regards,
-- 
Joshua Crofts

