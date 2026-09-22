Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123E844F547
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103735; cv=none; b=NQmJcgXlEKzXd15Ia7WUV+WUD6DmOrpPvcvCL2UsKiURErkLX8KJtOjf9tq2KgjF6ItnmeNzhnVXCykB/exHrs7dKkFtiizcdPLMaPJ2Poe2h6hDjvC++fM1RdEn9dQpuyCXlEiQa+/hQCy5Cv+rKXyGR9STbsibQjlSXLO5kPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103735; c=relaxed/simple;
	bh=nfkuu9sRhYE5Ept2nSN/ZsMCUw1omCS1pS/zvFpgpyg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=F6g8sV/uPq8P0Eq0XOlv1Ea6pYiYaMOwAiZLNdfmwK/5L3QYX0zESUZpxxibF+GP8eb/wvU10KdmXF1U7QU+yUAiJCMgx0wCOuoPC71d2NyK3BamA83TBAHftYTCV1ARpf5M1sHHQ1LrqOwxsfbSsKwhrFT9fznoeWFuQjWU3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kR8BLk1R; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kR8BLk1R"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE6EF4E41030;
	Tue, 22 Sep 2026 19:02:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A163160580;
	Tue, 22 Sep 2026 19:02:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B702810328441;
	Tue, 22 Sep 2026 21:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790103720; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nfkuu9sRhYE5Ept2nSN/ZsMCUw1omCS1pS/zvFpgpyg=;
	b=kR8BLk1RgK0tV6py7wUMLLvWcDvzWr6+FsNW/u87fphn4tQuUwoo5ggpexrkUo/O6vW3ml
	BGpx1u8N+jcDWTv4KmEKzz4HFwqNJFDRE0AXQ1ie45jaVAtATf1W0AIarj/AbY9wR7UtPU
	K34zohjU2j9FO7h8axh3mptdG0pXzbwimdNGlJhVLswu9JpVGIJFvZvtoa86wCWgWmdCRo
	TeFjoLxJrGxTJ17jKenyzPXf4+5GJ1dJvBc+lFHCQA3lIB/isYRWcQ74EoZBBAGlAjUd9n
	3+poE1ISrd9jIETgQhBWXAGqVJeDBDVcslQG5toUtfYmxspNgnnNUDBEKiRJ2g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 21:01:58 +0200
Message-Id: <DLM2T3FD87GC.2VFTTSYAIPXOR@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 2/4] net: macb: Enable RX timestamping for
 specific PTPv1 filters
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Richard Cochran" <richardcochran@gmail.com>,
 "Nicolai Buchwitz" <nb@tipi-net.de>, <linux-kernel@vger.kernel.org>
To: <5mghybrid@khu.ac.kr>, <netdev@vger.kernel.org>, "Rafal Ozieblo"
 <rafalo@cadence.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260922-codex-macb-hwtstamp-submit-v1-0-9d1abaa53296@khu.ac.kr> <20260922-codex-macb-hwtstamp-submit-v1-2-9d1abaa53296@khu.ac.kr>
In-Reply-To: <20260922-codex-macb-hwtstamp-submit-v1-2-9d1abaa53296@khu.ac.kr>
X-Last-TLS-Session-Version: TLSv1.3

Hello Kim,

On Tue Sep 22, 2026 at 11:10 AM CEST, Kim Wooseok via B4 Relay wrote:
> From: Kim Wooseok <5mghybrid@khu.ac.kr>
>
> Selecting a PTPv1 Sync or Delay_Req filter in gem_set_hwtst() returns
> success, but leaves rx_bd_control at its initial value of
> TSTAMP_DISABLED. The requested filter therefore appears to have been
> applied, even though received packets have no hardware timestamps.
>
> The PTPv1 event case already enables timestamping for all frames, so
> use that path for Sync and Delay_Req as well. This enables timestamping
> for both requests and returns HWTSTAMP_FILTER_ALL to tell the caller
> which filter was actually applied.
>
> Fixes: ab91f0a9b5f4 ("net: macb: Add hardware PTP support")
> Assisted-by: GPT-6 Astra
> Signed-off-by: Kim Wooseok <5mghybrid@khu.ac.kr>

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

