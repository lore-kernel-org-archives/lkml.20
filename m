Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894234;
	b=AlSS2/yXOYdzjYlQ3BXjxewg0mnpr/nsXr5xzJy6aS8bXcK0CZvf4/B64wPHPsWL5iVY
	 aO8Mq+7TV/wQZpIF+SliSwPu+8+CfrbN2+hefgp1FWyvJcQXri4IIgosHtT0VnhiX8258
	 vz4+FxgzW1xKaPPXyB/GxsXaa0+0nlSDoLJDtae5AbwHNqoKl2P1+LCEZUu3ohtyEMFbk
	 QNVXBfzehmVddp7LHfbyd/Rx/NYLIH6vzVJ3wL8FSyN7ug7LlHUKtF0ucNUEetwavcX4e
	 hj6Y0t74VoLWwOd9YQsw9p3aYigvg+aBMA3UuMa5h019l7T4i2QGkBtR30HVtiEzOPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894234;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/hp3mzoQPunJuzlAQ0Nu0QxoCcTF9DX1oZZFPLvhRzY=;
	b=R6+0UzxxgNKTNUImCLYgvojAMwOLWu5EpdTFK8gsOuu5IUXKU/nMi8n0MvtKLkuzFVWq
	 HtpBNawhWU9TAQXtKd1zHI9o3DC31nqsiJ1po5wzv0rUgdXHBS/U7Jvaj44xOg8d58/Qy
	 mzyrJh5mOvIvv5PJ9sMQBmcAhm2pBdqmuabx3PXjFTXzIyFtvN+lrK1s0Z3y0L+HVa1s9
	 huqxrvNyF65mH7qfcNgsMS1K/qcfECO/rzV4roY7bdlU/Unn0gqgInsgkNPwLvL7Q2sWo
	 jS6OTCKOsQgK38Ds5gCOB/cCQvxvVaAaQSVyfdXx5TgEu3FzULPmx39YSXtgBQxjcRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aS5NVWKJ;
	arc=none smtp.remote-ip=95.215.58.185
Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7AE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7AE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aS5NVWKJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/hp3mzoQPunJuzlAQ0Nu0QxoCcTF9DX1oZZFPLvhRzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794894231; v=1; x=1795499031;
 b=aS5NVWKJ5TIFNsaAlno5sZFPZVDirwr2ECYGAHVe1FuSfxsGuGLe1/8vOE18eciztqugtOGB
 kkNlmoaO4mCiPHLR5C443Vhg4E+wOMRAqigsZ37tqdmogjpPi+NyxJxEkH3lNpMBWtUfvzSKAvd
 YEJZNZhfN3HKtMU8ohOGFXmo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3695ad99563aa3f3;
	Tue, 17 Nov 2026 05:43:51 +0000
X-Mizu-Trace-ID: 3695ad99563aa3f3
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 06:43:47 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Leonard Lausen <leonard@lausen.nl>, Ping-Ke Shih <pkshih@realtek.com>
CC: leonard@lausen.nl, =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_2/2=5D_wifi=3A_rtw88=3A_?=
 =?US-ASCII?Q?sdio=3A_combine_free_TX_page_register_reads?=
In-Reply-To: <20261116205739.462458-6-leonard@lausen.nl>
References: <20261116205739.462458-2-leonard@lausen.nl> <20261116205739.462458-6-leonard@lausen.nl>
Message-ID: <4DA7AB91-A420-4C91-B57F-B39FD5DF6696@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 16, 2026 9:57:40 PM GMT+01:00, Leonard Lausen
<leonard@lausen.nl> wrote:
>TX capacity checks on non-8051 chips read three adjacent 32-bit registers
>in separate SDIO requests. Combine them into one 12-byte CMD53 read when
>the existing power/alignment check permits it, with the per-register
>fallback otherwise. Propagate read errors before checking queue capacity.
>
>Allocate a DMA-safe buffer at probe and copy its little-endian values
>into the caller's array before releasing the host. Holding the host
>through the read and copy serializes access to the shared buffer.
>
>Signed-off-by: Leonard Lausen <leonard@lausen.nl>
>---

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
