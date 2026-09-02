Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C7B471D03;
	Wed,  2 Sep 2026 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347501; cv=none; b=oei5LviMkrXJ4Et+4QFJnk49MsgOq/3welynnKqIU+ElHIp8zsbbcKQL07/OD+nGjB6S0k5s6VrW4i3uUzhetcbEjbWWbmoTGfmpUSxAQz+iijWg1rC36yXGv+2w2a3WBkFkO1xPmW1DquNbnIfoIh8zaQOcRUmYTwBzuXeo8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347501; c=relaxed/simple;
	bh=c7evoIZo/KPwjVeJ014aOVrUFb8tc3bf+01LKAu8Q1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nu3zwbvO7GZqFIr4ihTQt7t2B8Q4tfoxSYTGfUNqebAli4xaSIEgwRUtdDotvHFR/lZ04DRv66XV+wRFdh/KwprUQ7LvtqcJONEgsipNBCn7jRGbEdFBbRoPTgv2uddogQd7/7zNRvUWmjYe8V5lIMskdMVUntIYSbmtsCzCPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=GzHRdNdb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="GzHRdNdb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jtq/Hbwh3y6+tZU+24Z00S/OaFKe/w6VjMyJdVY5XfE=; b=GzHRdNdbla3pQEwW2Se5SLxB7T
	KQPQr3K7NviQhmFM7GkxzgEygrlhcXWj70lGyHyUs5kMA8neLseGhiPejDvTLl6zNU6654Bn3iln2
	Cgi/ADt+xlPaZjfmQlLD8O83GPKq1NfIA2yR4BlO3IYfeOurDFBdV8NViundwSQIl2IPhu++mDCI3
	1MgM3mhocUg4KltxLp8FMQA8UsS0oHsprz7GvW55l//j4jNCPgvMucDft+R7IXgy4zCwu/a0+e3lM
	EHnPCdsfZdX7sBV2M9j2Ly+U4UWP322pMKBsmONinSN14Fg4mpkxgWutn7jbL9vwuRipvIgEfI6XR
	rz3xlixA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
Date: Wed,  2 Sep 2026 13:11:17 +0200
Message-ID: <178834747218.2268650.11241416915608173120.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aou1Q5-hdF7kRVpe@0d3a7a881997>
References: <aou1Q5-hdF7kRVpe@0d3a7a881997>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Aug 2026 03:06:43 +0000, Rudi Heitbaum wrote:
> The hym8563 on i2c2 does not ack:
> 
>   rtc-hym8563 2-0051: could not init device, -6
> 
> It is also the ext_clock for sdio-pwrseq, so wifi does not come up
> either.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
      commit: 7c40dc4055b6868c5ee7c4e30fd483544a25a58c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
