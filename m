Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B522FD696
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791953785; cv=none; b=uiMo/5PoPBsQFHtXnLwCPg/3l/piyiUCd01RzRkB3k0Zi98uxiB4ya9HquR4nveaquqjigPPncFE5b+l/87FdI6aAziVcKYYs+Zj9QXR7CT13n4l0NoPNwTmrJcxXhoPZPS/S/1HG2Sft52BNT6KNobtvzhbVK2+bS3eOW6nzDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791953785; c=relaxed/simple;
	bh=WjQH6eF1riN+Hdn/Ak1ts4FChWpGKVUmHOzzJk7eT5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLqPHskLpxkDfq0giEWQ8oWdB6YPjSTwYy9YXkotisHVrOBuXs8HTBnBlBUmfi9DANeu7m3Cjat8Nv4lfFAawnb0IteyOoqKCpOHF82ZviM2nt/ehOG8On0so/0HFDzNMq2jxjTDiQsK7TazV75x9p8XOSlIQ9AjYZduSRgA1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdRVC+SW; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdRVC+SW"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-354ba08cfd1so6301586eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791953784; x=1792558584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjQH6eF1riN+Hdn/Ak1ts4FChWpGKVUmHOzzJk7eT5E=;
        b=fdRVC+SWYM8ZLJ165A3wGZaw8opLHoA0K+UmYdypp+Cmd/Ztex9ifE4hrWWSXMH1Sw
         mH7zN9u3SXhBs3Vvhgda9GCZh6dCojN9NRrd8hlpT051Gvc55yoc8mdlzSCDXcH62C+R
         Gg0dyDwzvRrRXOTAFDJKHy+7/CYhnf6cWf+EwHxZZOteALETiPMcP2pMjpSNexiHFg5c
         WMYMeqSbtgtXVWKGKRmaqDFwCPG+SjO7mUZaYLbbg4M3/iacpSYKhcYC/Ht6PUVYyelW
         uSCtYJTRALKDoDuvoJVxlzTlI3dfTL6nNS5fmCPS6BVO7RGNG8fGl4RMl75FKXdXNpaU
         V5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791953784; x=1792558584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjQH6eF1riN+Hdn/Ak1ts4FChWpGKVUmHOzzJk7eT5E=;
        b=N3Qi6KkC1ntexXK41VdwqTp3dLfFt+acxK1Temvbw+WJiO5n7bK/JGdEudGJ1mdiNQ
         meqLcZP2FYL/LTbdjR8Gc7pkjn0H6QnPLAXH8gZpDUL5elAqOrYeipJHufKhRcfoYNOZ
         xpLyKr+Tq+EVze9lJAfncktnGpygtfup7G2RReMYbdgtzrVsWdkQT8VBKemppeyz644/
         NtA4frHY6ogydkUCU/7M8J6MxqYXW1zAszH3c2x8GxMcE+mKGNQUgIueihtZK/bhB8rV
         erUjsDp2M16lyyfm6/eLjRTa5SUDPw7eZjwGG3JzgrO3tTa8Alwjj0jTMMm59KiDU7Rt
         Aiqw==
X-Forwarded-Encrypted: i=1; AKwUvByQsT0joZZL2bBB5laZxfXD8tlPTkqcakfjMRexj35J1QBj0to4VHdTi8l5BVThrdtY0f2Ko/spGzDOjoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNKGA2ZHsl55COsozmkRZphgybpzZgl691qvci/IeFju0A6+Wi
	8twx1atF5mHjLjyXcQ1hkT8fdpLJrTJWo06HS98HgsrUbu3I45OGZ3eA
X-Gm-Gg: AYBFou2dXvV/LAiH72Lm4Ljj2neuKLsxdP/5i8dLxqxrr9XCaOjTzoglGifmlzs/Rcz
	WomoDn6Vv6KYUNZlJdSZHERM+1yM3Mcq8Rej34O53KH5ayyWL+HJeepXIP2TEcoatGk017XTF+b
	sdU5OpV2SakERhqTM13PfNg6nVWQhQNwO9HnMDFma5nhIpm2VciTbvKrLfMR4DVohdytizI7JAH
	63RLvU3Me0zG+64fHD+YieqwieU/GNkPgmvhmGW74jEM783gIcN3aFNgE6Am4BYbImea5/EEviO
	bIwvww0e3vxpHRsDh0xxjFUiIU6iC+F742B7tjlu9Ar+c07Na3tH8FnXAmmyXlbPa3X8IHCDGiC
	MKCCA69cmeS2w5RZnX9HcuPUhwukIlFzhghoo8X3Ec1PFgvgPtbFE4wtyzFmdM2hwnOFYSOCpx8
	ZEere1xTkz8Cc3/UaSWCltJSyktmp2tB9YDcervESRpGJIgFv9dFbWnS56AQeKWndiqI8RlDdrR
	m1d2Ykno7G6
X-Received: by 2002:a05:7301:dd8a:b0:35d:ea6f:b85e with SMTP id 5a478bee46e88-35dea6fb98cmr1093412eec.1.1791953783690;
        Tue, 13 Oct 2026 21:56:23 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:a73d:31e0:8b98:4eee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm33473630eec.20.2026.10.13.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:56:22 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Wed, 14 Oct 2026 12:56:07 +0800
Message-ID: <20261014045607.3421104-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179194881415.434549.5017437610608933310@kernel.org>
References: <179194881415.434549.5017437610608933310@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
> Can the XDP_TX and ndo_xdp_xmit path stall permanently on XGMAC in
> shared-IRQ mode when the TX coalesce timer is disabled?

This is not caused by this patch. It needs a very specific setup: XDP
TX traffic, tx-usecs set to 0, and tx-frames too large to be reached
below STMMAC_TX_THRESH. With that setup the same stall can already
happen on XGMAC with per-channel MSI today, because
stmmac_xdp_xmit_xdpf() only sets IC on a tx_coal_frames boundary and
has no fallback when the TX timer is disabled.

I will look at fixing that in the XDP TX path with a separate patch,
but it is independent of this one.

> [Severity: Medium]
> This isn't a bug introduced by this patch, but does
> dwmac4_dma_interrupt() in dwmac4_lib.c have the same sticky TBU
> problem?

Yes, it looks like it does, especially since commit 6ccf12ae111e
("net: stmmac: use interrupt mode INTM=1 for multi-MSI") moved the TBU
check out of the NIS block. I only have XGMAC hardware at the moment,
so I kept this patch to XGMAC. I will send a separate patch for dwmac4
once I can test it on dwmac4 hardware.
