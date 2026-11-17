Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917446;
	b=Ef0pnfRBfH930aj8OaMswlQB3vMQ6IrtD4nSw9o9Glxw6/AZeVFp49JpC3uInJhuWZHw
	 ssyYSaBwIq/m+L1NJidO6t+DLDfLOd+GNmDNd16taOi8G1qlJN6MnM8J4uD5wJSkG4E0f
	 Z02BYzwnlsBfpdRyM5CWLrNAEx/QvHt2fXUdNv8/aY6I0KPaOGtFIZzwsKeqASsFvTOG+
	 4sPXo3FS64LE5qisWagQh6iiOQ1X+cTOh/R1QvbdGDovQhu70LqMWV0mIRkvxf9kkmbLp
	 LTVgxa+kxvGnZSzALguBCXOpQl1BGJVxpaER7gDzKD6lpBAntZQJ+aUgRboJEhRa5yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917446;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=E4Rle7Q6Lm9Iu8CfkhrIoWVqCRbwUE2Go1RbpzqI5ys=;
	b=P7M9FikMJQrXilfo/z61eEUFMxZHKn8/0sNLNSIrFMFMDlKusTAKDEqO6pR4LWAKlFv4
	 ORWM8a7uhv8lpJC4Y2c4lCG0JejfWX8auD3mU0HpEzSrH3jbzrcdMh+wvM0kL9dliuYHA
	 nCkxVdV6XgtQOLiETF12Ey5kiHFnhi+Vg3SeFvc7ixgo+QYZLSuI4KJfmkVj5ecJXQX7p
	 ZbCzO0RD+L+fYjtuCCXb8veNXHS2XRL3/xICeNgsBDowz0y/QjdURafPPUuihNfSHajb5
	 cAXD01vajNuC8RULZHWmOBvsI1sbxYChAyCk59MlesM2zflEk1wjRLzgX/iFn3HenUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="aUFYu/aA";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4226606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4226606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aUFYu/aA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794917444;
	bh=UtLyPrLif+1FkNX3cyYh/hMM2psbP79LBeslRtUW5GY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aUFYu/aAghtrwARrPCsrnEPNZlBSa5Rd3KjQJoYBN0mSZ4alYMcf6oScMh8GiXNZV
	 tahMRkAmCaks3ZnG0ROcbGwi8gE8tiNkcNSZruLc4/de24W1QXVFov5pDyN6jLr7AX
	 L8Bu9E3cVpc2WTxQntlckk2jsnRRjPKQASnomqNaaoaDXG8i25NI1bWtv3jFC2kAWD
	 SwCBecBy8U7iSwviPKF7UieqIxrrQYOYww6EjYN2s2f55wi0hjRaLnqSOd/NJYjRtG
	 HFMm+j54W/tYcGbbCPX+SVba7YeXv9bqdHwP2hbN/npYLcW+xJk2gKgCB88OqHij9n
	 x6b39ubn1GdpQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2D2817E04B4;
	Tue, 17 Nov 2026 13:10:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261117120934.728612-1-l.scorcia@gmail.com>
References: <20261117120934.728612-1-l.scorcia@gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: mt8167-mmsys: fix errors in
 multiple-output display paths
Message-Id: <179491744386.180525.1057948334056427930.b4-ty@b4>
Date: Tue, 17 Nov 2026 13:10:43 +0100
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
X-Mailer: b4 0.16.0

On Tue, 17 Nov 2026 13:09:12 +0100, Luca Leonardo Scorcia wrote:
> Some display blocks can be used to define multiple-output pipelines.
> The current code uses mtk_mmsys_update_bits to clear the mask bits and
> set the desired output block bit when initializing or disconnecting a
> pipeline. This breaks multiple output pipelines (only the last one set
> produces output).
> 
> Fix this by using the block bit alone as mask for multiple output route
> components.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/1] soc: mediatek: mt8167-mmsys: fix errors in multiple-output display paths
      commit: ffcbc063e8df3cdb50576a4bc20b3d9669e2c43a

Cheers,
Angelo


