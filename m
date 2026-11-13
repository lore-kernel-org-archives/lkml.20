Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.185.108.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573574;
	b=FY1LVv0oRsYT5tRwE6qnWsKo93iY0Ju2uQDstAAalYIK8fHgE6qOZA6J4mckgh6W+hOD
	 VDxXD7R/ks51qAviRD5QjtSsIvkJbnsSdWccG7DPp5EIDnb6yxvsWHkEffsRECiJ5Cy3Y
	 jq0MW/7pv3umRhfmAvy2Z/vOtbdhdGPCvzjUFHNMa4YWSnuYJHwhiuI44DFRJQ/0GmylK
	 E7vBJlbUVufTCsofP67rpYv6uwSKyWn218xFVyDrGwFGX0cMjELRVEETnETHyGGBTzlaH
	 Mm9+Dpgjjc+JLGa2gaO8vw1tB4lkI4r2j3InlaJJWiFZJoPdUhZtTojh4JChhdQ8n9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573574;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Last-TLS-Session-Version;
	bh=iFLB5hhb5axx2wBU+qQkAhbTinTqvnjS+ztS3y8CPfg=;
	b=cm/yJfDLImtXoCn4hWcIVaJ9+47FTl7KQeB99Ukm/lZagzJdqMVo/3QJ4OxswVdjLar5
	 0ODNU8j/Lo5Yu5tn2WieCmlri7klg67Ed1+VzjOLXV+PaXA5FBKfjZkB4/b6LhLDM3KEc
	 qpZlynFAFB135JzAom3cm9QXsKHTYM7N6ohCXLckguj7BnwRnDBnOBy83yCwiA8Cf5wOh
	 PdxH5ZqcaHr5RQrlUy/7boAM66czngGWVl4opyykO3507ioUcYrYXpWPRkstrIliAUDMA
	 9iY8Ve7WrDgGcG1nofkuVmC5hRCOolyF/C3vTqHo+l4aM77CCXczYB6cQYUhsIXYt5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=puresig.cz;
	spf=pass smtp.mailfrom=puresig.cz;
	arc=none smtp.remote-ip=93.185.108.244
Received: from mail.serverx.eu (mail.serverx.eu [93.185.108.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199DE606A32D;
	Fri, 13 Nov 2026 12:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 199DE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puresig.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puresig.cz
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6225F13F4C;
	Fri, 13 Nov 2026 13:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puresig.cz; s=dkim;
	t=1794573564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iFLB5hhb5axx2wBU+qQkAhbTinTqvnjS+ztS3y8CPfg=;
	b=URzV+I8XXZ1k2/AWVmF40lYdmbxpP3gFE3sauXwLMApIDUqmVqryqozTCbfOBL1Gzu28Wd
	QeDkTpQqI48j4a9LmUYLzgGGJ3Vt/WOb2DMpYTFG3oFoDPwPGy7cen1zGFtya33OYz32Pj
	8jcPgBx2AZDmk71xzK8sXTZ0+6znY7sBAyie309d8QVCg3/HQnHNNS76qeFa/SFqBRda9h
	oPAhiFyUfopZzPIKntM288C351gVqAHI7+8pwOn7BLW+/3PvnPshG+6hW6vLcJWS5WK6tm
	doDbWCcAVy26UU9Ei58AIhRkdCPFWJKSPu2QJ8eFYVC5AHtufor6Bpuo3RZleQ==
Date: Fri, 13 Nov 2026 13:39:20 +0100
From: Lukas Splavec <lukas.splavec@puresig.cz>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
Message-ID: <avb5Bm7IA15N2ibR@Lukass-MacBook-Air.local>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, Aug 10, 2026 at 11:22:10AM +0100, Detlev Casanova wrote:
> Since the driver is used for decoding on rk3588 and that the SoC has
> 2 identical decoding cores, enable support for it.

Hi Detlev,

I tested this series together with Sven's RGA3 multicore v1 on an RK3588
board (Giada D77, both vdec cores enabled), with 4 to 8 concurrent
GStreamer 1.28 pipelines (v4l2slh264dec / v4l2slh265dec, 1080p to 4K60,
H.264 and HEVC 8/10-bit).

Multicore works fine: both cores are used and throughput scales roughly
linearly up to 8 streams; 4x HEVC 4K60 runs at about 65% busy per core.

I encountered a problem on v7.1-rc1. I hit an rk_iommu page fault storm
followed by a decoder timeout and device freeze, when pipelines were
started and stopped in overlapping manner. I was able to replicate the
same behaviour without these and Sven's patches on plain v7.1-rc1, but
not on v7.0.

The cause seems to be the inverted error check in iommu_map_nosync() from
d6c65b0fd6 ("iommupt: Avoid rewalking during map"), already fixed by
6fc7e8a3 ("iommu: Fix loss of errno on map failure for classic ops") in
v7.1-rc4. With that fix applied on top of both series, 150 rounds of my
stress test pass with no faults. So it is not caused by this series, but
a rebase onto >= v7.1-rc4 would avoid confusing other testers.

The underlying map failure is likely a separate issue: the RCB SRAM
buffers are mapped at IOVA == kernel VA, which the dma-iommu allocator
does not know about, so capture buffers can collide with them. That is
present since v7.0 and independent of this series, so it is probably a
matter for a separate thread.

Tested-by: Lukas Splavec <lukas.splavec@puresig.cz>

Thanks,
Lukas
