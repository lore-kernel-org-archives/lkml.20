Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206584;
	b=Rf3CzanAfhITSu3xihIXpPIOWK0LyDHmZtOsVOplx8w9stgOook84B/WGsB2m5lxQ9cA
	 wdPd5CB0cO42OtBiLuxdf0z+7HYnrHfg3FcusBvjrU9RyTWX6PJbO1PDqNovDskrrIjpb
	 RAf1lZcpi/JbvPKxzZ1wIK79IPcuoQCWZsxcgjCQZsSqwz6zt+mTrXR7E5a2MSKi+6aG4
	 qqk7+Fj89Jo2s4RrePMTjxxqCsxH0tSg7K7FQgOchXU5Q9z6llJWJPI9+lUzCH6GfuaIA
	 oWBK+Uh1/XZKFez+tyugX32ZGcyWIAGTZK5o3DS2ISYsdWV/fkihuwG0mXmpSDdRrIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206584;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ebhEmtFiUyEh4cVX2pYWagxjHX97HdZXhWF4H/DoKjc=;
	b=jPXL38K0gMy6eM1IjSwQLkyIyn7UNjzCw8M7JINRtlod0d2DBvVjUAYKFpXetu+GP2vF
	 zz5O9h2h0Y26xWDrW91/CpTUFKKceCvAG2gEASFYGh41xKSDe35+k0fDUgeCvckoxJODI
	 lKFDuW/OH91179t2vG2W8jyeR9h34WT3tW94FiKrHCvy8sBjk59nMqqURD+heS0NUCh8N
	 uI14h5rLoCIGTywMLDOj34dXEdksgzglfmz89NiXYgNPAOaYRiOfBN9ASAACr2VOu/VCM
	 mqQHdJ4v+0vPHPmTzUPLuov+H8xHS0ncLZHtSM9LG2zPCKiuQqe2lR3qsJOtQNDn3/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yotv9l8c;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139AB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yotv9l8c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ebhEmtFiUyEh4cVX2pYWagxjHX97HdZXhWF4H/DoKjc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794206582; v=1; x=1794811382;
 b=Yotv9l8c2RPenS6Q2Y3ubHJTNGrhHhL0KqXUB3FsjGLv9H+z4EwTKUr5x1lHauIQXR8SJxYp
 /RoSfgqYAHjbm6QqniwD8d9CSsNI4GpQHdqfYd87LT+FdU1xLAOQNg/5SO9MyGwc9CyNps+Tvu/
 fnpcOVNvtniGJniKlb+9ma18=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1563ae8dbb63b098;
	Mon, 09 Nov 2026 06:43:02 +0000
X-Mizu-Trace-ID: 1563ae8dbb63b098
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:43:00 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Kalle Valo <kvalo@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_rtw-next_v2_2/2=5D_wifi=3A_rtw88=3A_?=
 =?US-ASCII?Q?8822c=3A_ignore_nrx_values_without_CCK_PD_registers?=
In-Reply-To: <20261108182837.682661-3-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com> <20261108182837.682661-3-zeshanahmednobin@gmail.com>
Message-ID: <2C4EC68D-1844-4124-A40D-FD0BA0627A44@linux.dev>
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

On November 8, 2026 7:28:37 PM GMT+01:00, Zeshan Ahmed Nobin
<zeshanahmednobin@gmail.com> wrote:
>rtw8822c_phy_cck_pd_set() reads nrx, the number of CCK RX paths minus
>one, from a 2-bit register field. The driver only ever sets it to 0 or
>1, for one or two RX paths (see rtw8822c_config_cck_rx_path()), and
>rtw8822c_cck_pd_reg[] only has registers for those two values; its
>entries for nrx 2 and 3 are all zero.
>
>A device that stops responding can return any value. On USB, a failed
>read returns whatever an earlier read left in the buffer, so bw can be
>0 or 1 while nrx is 2 or 3. When the level then changes,
>rtw8822c_phy_cck_pd_set_reg() gets past its WARN_ON(), which only
>checks nrx against RTW_RF_PATH_MAX, and calls rtw_read32_mask() and
>rtw_write32_mask() on register 0x0 with a zero mask. Both compute
>__ffs(0), which is undefined, and the write puts back whatever was read
>from register 0x0.
>
>Return early when rtw8822c_cck_pd_reg[] has no registers for nrx; bw
>has already been checked at that point.
>
>The fix and this message were drafted with an AI coding assistant
>(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
>submitter.
>
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
>Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
>Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>


Best regards,
Luka Gejak
