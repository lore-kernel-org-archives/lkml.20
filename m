Received: from mta1.migadu.com (out-32.mta1.migadu.com [95.215.58.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0163C3F71
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875427; cv=none; b=mSIumKnloClq2B09bw7+RZ6S9P++n4XG2kgMG9Zc3cBRaVzPlMk9YPfLuitoDzFIGuuiRNqOBfu+tRZjgOFzSguzLaj5UdCT5GU2KMrCOYTCReIvL23/BWPDU8AxLICHc5BPtAMqyLUroBFT9M0eAZaXPs7CImyS33DF5gzR3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875427; c=relaxed/simple;
	bh=yw7AoW/HGY0hyzkfaYvMgbzeBdxHTR8bh7HvAFdSAg4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hDbv+5bGmSdwR9BwbidBGjJHOzb/siPmcIswEmFzzo7USayAxDvmBGf3pi51Ww0fi0fWjCAiNTRHZ0y4V7lQzOzNinxu1NAOof8EkN1dAttH4QPNlM4+i5JJY+h3Agy0Fnl7bADyyBE3xbadKRlu0VcmDqMCNVn9AgRmJRlpV54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KFGs+3B5; arc=none smtp.client-ip=95.215.58.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KFGs+3B5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yw7AoW/HGY0hyzkfaYvMgbzeBdxHTR8bh7HvAFdSAg4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791875423; v=1; x=1792480223;
 b=KFGs+3B5HC5piMD2y5eHNxkjsJgqrIbbj1U1lZg0hqownYErx8BGr/8ppZ8O1EScwd8TQ2v3
 ohAJYCEsY3Obp9tgw2+rrAri7N+XK/eIGFbJuMc149jWsQICVJinDN3H0wwKNKhp+mq2mbtGXPx
 JKdn7fQU/Lqljjsb3BGsjGwM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34e6b5eb821ee27c;
	Tue, 13 Oct 2026 07:10:21 +0000
X-Mizu-Trace-ID: 34e6b5eb821ee27c
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 07:10:20 +0000
Message-Id: <DM3ITO17G2GI.347CA6KFMKOVS@linux.dev>
Cc: "Luka Gejak" <luka.gejak@linux.dev>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Ulf Hansson" <ulfh@kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH rtw-next v5 1/4] wifi: rtw88: sdio: Handle allocation
 and read errors in rtw_sdio_rxfifo_recv
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Alastair D'Silva" <alastair@d-silva.org>,
 <linux-wireless@vger.kernel.org>, "Ping-Ke Shih" <pkshih@realtek.com>,
 "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261011220755.1673367-1-alastair@d-silva.org>
 <20261011220755.1673367-2-alastair@d-silva.org>
In-Reply-To: <20261011220755.1673367-2-alastair@d-silva.org>

On Sun Oct 11, 2026 at 10:07 PM UTC, Alastair D'Silva wrote:
> When dev_alloc_skb() or rtw_sdio_read_port() fails, rtw_sdio_rxfifo_recv(=
)
> returns without reading data. Because it returned void, the caller still
> counted rx_len against the loop budget while leaving data stranded in the
> FIFO.
>
> Return an error code from rtw_sdio_rxfifo_recv() on failure and break out
> of the receive loop in the caller immediately.
>
> Fixes: 65371a3f14e7 ("wifi: rtw88: sdio: Add HCI implementation for SDIO =
based chipsets")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
