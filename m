Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC72639A4CF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060589; cv=none; b=gfMkAe/hWhTlZCMgLkK+CnLQ8UGhul581WQVCGFMDUs0jf+fpOiui2VGeG8RiRpNIH4SCSPzoW/lM2yFr1DQo62mz2OQGAh4erIOjA6UYSbC3QsDzCveCOWPupM5YFcpa7yqQ+Dtu5W78LN14HQVYLNasI35LsomOTs7SaDeGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060589; c=relaxed/simple;
	bh=DC2R+GSWBc70SeuMwItKFFt+ayDUg9FE+HBwu4P1YQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jMWpv5dbbRoJMaxXVDUE/KwSN1xNFOL6AqP5R6YTBHXU/J6oUQWnHt3bwnRLJDnvPMMHdyWuUP10+QHFQ9nbBMhj485Ve17Za6g9kd6ZrnL8XEC7+aSgbTSQFVS28kUq7TcFuZy6/S2tQCGY7Z5FaWW8blpA5zGAHDKVsDFLYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+D2htlQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+D2htlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4803F1F0089C;
	Sat,  3 Oct 2026 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791060588;
	bh=uLpwZPO1GiiGvBIyjD7usPVtdy8rIg18LV4hbOtCaUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I+D2htlQtoBEc7czW/e/gBvOF/j5BI2CXVNVMPgq4N5GxNHWZCYvvXsfGi7bKQksD
	 +i1AZbJeiXpim+gCvJ2E8nnaz/rRs/AcJrD5iGi4Mggm2fH6iq3XMb5UTA3plFAiOB
	 zdh8DCgAEuIi491FPq5o86MZzBQd+zAdoFrTJ8Ydcja5lg2WJQ6fuBFxKZ0BmGCRYk
	 nQ4Qv17ukCnRZ9ujdpFY4uc7KQAypGz+oQYeHy63hYnX42zE7GWm7IHzAMyNjFTe+K
	 6rXgtI9IiOD1qo9zKXB/oWemYzHPlvF65RrIfqU7liGLqAtPdi/N3Nd/ga7d/LINVp
	 doIu2JFwOuaVA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1788158204-161347-1-git-send-email-shawn.lin@rock-chips.com>
References: <1788158204-161347-1-git-send-email-shawn.lin@rock-chips.com>
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: Fix TX detect RX
 termination errata
Message-Id: <179106058693.240943.3035344211255216321.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 22:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 31 Aug 2026 14:36:44 +0800, Shawn Lin wrote:
> Some PHY revisions may fail to detect the peer RX's termination
> resistor (RTERM) under certain critical temperature conditions.
> This causes TX detection failures on PCIe links.
> 
> Add a workaround to force the RTERM detection ready signal for
> affected PHY revisions. This ensures reliable TX-to-RX termination
> detection across all operating temperature ranges.
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: naneng-combphy: Fix TX detect RX termination errata
      commit: d68e47a06c5cdc90cbd29ce2e74fa61eab5d47cc

Best regards,
-- 
~Vinod


