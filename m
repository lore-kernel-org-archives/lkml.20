Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62396426431
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885113; cv=none; b=Ne8PC7j2DFlLa+BumZzwBmgUSv2rmxPUhuEw3J9M3DNtbqf3BEcD7mKGzo0Q+t7ofAolvsZsTaJLEthLbbzQfEGTG4SyimUFdXSOvi/hlHjjGJ1Rhw4ngAphhWW+iRkqIxrWet2pxf6H1Yy+DCYVFFi46BM73JMxps/9GmP6CIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885113; c=relaxed/simple;
	bh=b04oD9ZlZiQc8pVyCgW38TdiVyiLi8KXHWdvFczrbvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMAxPQJMv+fRsTBASL+SwUM32cYiJyVNo2a30QK6ubh/0WQmd4fr6IrXRPYTsC4t6BIT6qIeG9C8xxXLt9gUDOxsXY8Jcz5n9LagGoZ0BUmidvqXNDqs260SkT4cbudmxP8SHgLge+Y0iGO29RBQ7yHJ9RhAIZOSexLdgOtTJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KImTxLIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KImTxLIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0DF1F008A1;
	Tue, 13 Oct 2026 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885112;
	bh=oJsINL6E4DJ+o40/fqRB8fyVpsbVoU7sQMAIRCSOvzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KImTxLICthJsThqYm4fUep3d3V4iz4jGyYKg8NfWeVhwvAbAfgJyzp3y+oIbyZqH5
	 KieAWk5mdWbmsOwZCmkQpSik0OSpnTYcFFqTnQ30qJSSH0hdjWOImVlWDzLZlHUggz
	 Jr4Ub+pc1qA2bnotAsdLRdMDA0woHCNUmI7bR7R3oP1GurZmtODCqaB5Xp/bKWWDv7
	 +PsVdgzxHEr7kayYVPbPmrgn1dc0AZNdCoH5ptFhd7ivN1X3B4hudb6uqEQ/t5HQiG
	 8qp3RJGoybnZyWZJnyRveaqN42uZzDOFEoC/bmQF7fZQxqLQAij61GCeFUBDR4s87V
	 YqqQMt0ZHCxog==
From: Imre Kaloz <kaloz@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] w1: sgi_w1: Search the bus only once
Date: Tue, 13 Oct 2026 11:50:46 +0200
Message-ID: <20261013095046.6006-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013095046.6006-1-kaloz@kernel.org>
References: <20261013095046.6006-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The slaves on this bus are soldered to the board, so rescanning it
every timeout period only busy-waits through the time slots.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/w1/masters/sgi_w1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/w1/masters/sgi_w1.c b/drivers/w1/masters/sgi_w1.c
index 48c10062022c..a583821d2421 100644
--- a/drivers/w1/masters/sgi_w1.c
+++ b/drivers/w1/masters/sgi_w1.c
@@ -90,6 +90,9 @@ static int sgi_w1_probe(struct platform_device *pdev)
 	sdev->bus_master.reset_bus = sgi_w1_reset_bus;
 	sdev->bus_master.touch_bit = sgi_w1_touch_bit;
 
+	/* The slaves are soldered on; one search finds them all. */
+	sdev->bus_master.search_count = 1;
+
 	pdata = dev_get_platdata(&pdev->dev);
 	if (pdata) {
 		strscpy(sdev->dev_id, pdata->dev_id, sizeof(sdev->dev_id));
-- 
2.47.3

