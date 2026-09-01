Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032540DFDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271575; cv=none; b=iGrhLRGq+W6+EhJFlP4DMNg3lmuuL01Ms+I4FfLiR/rQWO1PiNlQpKVVJkdJwXHDz3H7gnc0GnmeZg4KUOiTmpUR/ety6uCid/49LpeW5dQbzuu8E6OofOBJGt6GyjhF3vgj2X8L2jUkDBB4zpgPyF2HJCHVQdVXRUvrpoyQDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271575; c=relaxed/simple;
	bh=FNAWafCY3dOFrahjM8Pl2Iw/GIp0doPYp+ItWu+gbXE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=QVIARBxmEeFvVnMvPtJrGhZ5S1Drv86wJ4IEEqqwnU4XKi+alwiYmBmrh9D1mu5ovKOTZ5ya61XQ2sq1VUbci8v0DGwFoANTUS9n2eToPlF0i8GKPJyBlyp3mYwapt7hJuPvarMC8KB0HSnPKU2/kjUcWsI5fSBr+jGHlPMf1rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=KVJGccIR; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="KVJGccIR"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=FNAWafCY3dOFra
	hjM8Pl2Iw/GIp0doPYp+ItWu+gbXE=; h=in-reply-to:references:subject:cc:
	to:from:date; d=arkamax.eu; b=KVJGccIRMy1ikmV86deRGvy1slgxAwTq0o0RJjIw
	ijmgyNY68xSAP2iWRyFMyTYE2mqgoqNkvqWPQdpAXRjPzoZtlzvlr0chD66huFsjikTkI+
	TfPx0Uy9bpAybWUFK9Rwcy/0si2w5PuptltN0dbzaP8GRzDZ20L0IKbpyzIFTeNVDjxUAs
	2pwSfU/zQyOJIM7Uy5f9kztOA5UfF1aGut8SG/ZIBPjG30/+QDpiF9cp0xpxp/0fKfDPQO
	T25Cw40SNEgdq9eGisAak44HgRBKxgZhk5DiYXKyZDqPgFwPO3HAfFKIoHU1M/nPl2P6uY
	HlPJtaZBWfi/4Z/nuLK7Jw==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 814b2cdb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 1 Sep 2026 16:06:02 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 16:06:02 +0200
Message-Id: <DL41D2NGEUHW.2UUHTZ6LLM9X7@arkamax.eu>
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Alfonso Kuen" <gerencia@idkmanager.com>, <hch@lst.de>,
 <sagi@grimberg.me>, <kch@nvidia.com>
Cc: <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] nvmet-tcp: report a bounded MDTS instead of "no
 limit"
X-Mailer: aerc 0.22.0
References: <20260829013900.10392-1-gerencia@idkmanager.com>
 <20260831005117.142713-1-gerencia@idkmanager.com>
In-Reply-To: <20260831005117.142713-1-gerencia@idkmanager.com>

On Mon Aug 31, 2026 at 2:51 AM CEST, Alfonso Kuen wrote:
> nvmet-tcp does not implement .get_mdts, so nvmet_ctrl_mdts() falls back
> to the port value (0 by default) and identify-controller advertises "no
> maximum data transfer size". The initiator believes it:
> nvme_init_ctrl_finish() sets max_hw_sectors to UINT_MAX.
>
> What the initiator then issues is decided by the block layer. The
> generic cap is 4 MiB (BLK_DEF_MAX_SECTORS_CAP), but a namespace that
> advertises a large NOWS raises it: blk_validate_limits() takes
> max_sectors from io_opt once io_opt exceeds that cap. On the array we
> measured, NOWS is 65535, so io_opt is 32 MiB and the initiator emitted
> 32 MiB commands -- from a controller that advertised no MDTS at all.
>
> The target cannot serve those, in one of two ways depending on the
> kernel.
>
> Since commit 4a3f00262a04 ("nvmet-tcp: bound SGL data length before
> allocating command buffers"), nvmet_tcp_map_data() rejects any len above
> NVMET_TCP_MAXH2CDATA (4 MiB) with NVME_SC_SGL_INVALID_DATA | DNR, so the
> command fails hard and deterministically. That is the right response to
> an oversized command, but the initiator had no way to avoid sending it:
> nothing advertised the limit it was exceeding.

#define NVMET_TCP_MAXH2CDATA  0x400000 /* 16M arbitrary limit */

So the comment should be fixed, it says NVMET_TCP_MAXH2CDATA is 16M.

Also, it's not entirely clear to me how the target enforces this. Suppose a=
n
host sends a 2 MiB command, violating the MDTS setting, what happens?

Maurizio

