Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3343F0AD;
	Sat,  3 Oct 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041131; cv=none; b=PNg4m728BTOgyP3In8iNjXKkU/6JXhA590doMngsbBKu1qjbbDNQFswPjnaCQEu4ZhzVG+QjpKU3DkmO17Pn3DQNA74l5KZrCnQJobGiKO57Y4DXMSHkeVX2lgE0mLLQLFnZCC2JndF1v4s0Kh/RqAvWeB1oDopYq+DA+yJ59PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041131; c=relaxed/simple;
	bh=NNgaJ7vsbHvoERnixzfbTX3u9cJ5tCZySHe//qdTQUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aYuy/wQGVnFoaTfAMKulVg7Q5JSW8VBT4c8EJz5PcKDkvM4fBjsQmt4mlTs7LcSRXslhy/5T02VaHVMDdFu659Y7a2GnSSv2OzCZNvnw6m8lYJApONzLbnxzm1SDRj2Wxa1vR2eaAnZ9ior/oGOtvr52X/RNtEBXWB/zaatC1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDCh1URW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDCh1URW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8F71F0089C;
	Sat,  3 Oct 2026 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041130;
	bh=q643Wt6fe0ntTTDTKOYlrl8Wj5XitvlnnZ6YOFvEOnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cDCh1URWwts0elrdZ20jLCn18/umO4ONLw1oxNhmmHlvCzhYp0Pm/trdDFICN1PPD
	 UcefMWA7kmVyHMwYWG+lFZdswmpHbkDmSdw4dXNEXosj7Lpbzf9Za1ajBgcLCRw/8v
	 WSD5BoLsDVWB+qGTEXu2Bg44C1J4YQUfoVPVitITBx9VWCVVfPNHfbnzzCxex1rV+u
	 MyzBF2kRhy9OgYo75V/sQyrKrG5DJmCNwCV17dPSbhYAHZGf63dbU0oC8rAiqMXtYa
	 KW7eugMboXNw4X7gLeqK9pKigM1Tf+oEIqODYsLK4++kHMy/0x09+whxbqIzRXQYYk
	 bR0+NNfswjUIw==
From: Vinod Koul <vkoul@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Yixun Lan <dlan@kernel.org>, 
 Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@riscstar.com>, 
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
References: <20260825065007.69353-1-bbanelli@gmail.com>
Subject: Re: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0
 PHY
Message-Id: <179104112791.223537.13672084423793291489.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 25 Aug 2026 08:50:05 +0200, Bruno Banelli wrote:
> v1 was a single patch adding "default ARCH_SPACEMIT" to
> PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
> Kconfig problems in the same entry, and that change makes them easier
> to hit: enabling the symbol by default means configurations that would
> previously have left it off will now build the driver.
> 
> So fix the dependencies first, then enable it by default.
> 
> [...]

Applied, thanks!

[1/2] phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
      commit: 882af55e42a4cd5bd61db0244c0b78941884518a
[2/2] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
      commit: 392101240b22256105da3b5af6348d1889c63112

Best regards,
-- 
~Vinod


