Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840554;
	b=0WVAYToSpKYTKlEEvGLGRA9l6fCDsq2veMxGeE7puD9Mh5c9MKlKaax4ODMMzzEO3H3w
	 nUhZ8z/3lnnqBW2W9X9xe+RZRbtVT7trRUi0CHHOmjEfjlFS4xJD6Evt8q8FpS1LAWtp0
	 r8Vx5exzcrmKYNUQYahu21SrblniHMMXfUFyhKYXESb/TcvmElUb3KXbIkYo4b1vfVgvE
	 Aib3bODozCz0Un+n+twY32KI3KwsykOptWfbfeFwJv6yFa3IQnmYYcTOvCDNAwFjSA/7l
	 4neIh0fz0Bo1otIaok+RgfWFrUZYoCBjvcUaekwFgWDNhl2scEom2lBN0LQJzwAMbAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840554;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=z+TkWp9c3AmRjh/1+xTrO6FIZXytH6PYAw7KZ60P50g=;
	b=HzcIl+KcqFodqLh+4OSBBKpT74Hlitqbr5Xxg/ZJG3pA7GYSNxAr7pl8MlvmP05soP33
	 lndC5TxD5NxsSXnV02UL5JXOXkxZlFrbCbDDFWRcqXrwnCVpJoaV+C+APPGK5d58S2dAl
	 9qaOrrTvmoSg+tVjHsFcKwQUvGG2FOrDXkGUu/jOyZTxWJ9qBUfbrkCgO+H+VUnjlNzLe
	 B52Dn/TZ1ihbay1xXGob9bMTo920VeY7yTxouHB6bOdS7KI7s9xo/921YljvQztM9Ucds
	 T0ogt0EJMPM7Ca7yGF+J1MTmcb1owDiPylHKb5viaAHZCubJiQMGLbvazfiaNtMW5cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="TU3Z/slb";
	arc=none smtp.remote-ip=95.215.58.47
Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60928606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60928606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TU3Z/slb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7xsWyeGZyiyROGIvGQ9jJncn97YGydx0qJ+b5t+gYUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794840551; v=1; x=1795445351;
 b=TU3Z/slbSlJUvuqAGGnsdGZk7Gi0aeYGajcRkCi7XDQ/E4bV+opqD4jnY3gndmOPAP/+AViL
 z2RgWVh0Gg8Rx4qQ3gnuJgyyIgParXRp6fb6kov9sQB6mWOE5yBL5mGbQgqM9iFjVjaEUC1RxpY
 7DL4F9EiJpgEmxi5lSBkAJgg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f19640181f81e0e6;
	Mon, 16 Nov 2026 14:49:11 +0000
X-Mizu-Trace-ID: f19640181f81e0e6
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 15:49:05 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Kalle Valo <kvalo@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_1/2=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?22c=3A_fix_out-of-bounds_access_in_cck=5Fpd=5Fset?=
In-Reply-To: <20261115201826.181662-2-zeshanahmednobin@gmail.com>
References: <20261115201826.181662-1-zeshanahmednobin@gmail.com> <20261115201826.181662-2-zeshanahmednobin@gmail.com>
Message-ID: <80B20AC6-F0A9-46AD-BAEE-3974FD07E20A@linux.dev>
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

On November 15, 2026 9:18:25 PM GMT+01:00, Zeshan Ahmed Nobin
<zeshanahmednobin@gmail.com> wrote:
>rtw8822c_phy_cck_pd_set() reads the bandwidth from a 2-bit register
>field and uses it as the first index into dm_info->cck_pd_lv[], which
>only has entries for 20 and 40 MHz.
>
>When the chip stops responding on the PCIe bus, register reads return
>all ones and bw becomes 3. The function then reads cck_pd_lv[3][nrx],
>past the end of the array. If that byte differs from new_lvl, it calls
>rtw8822c_phy_cck_pd_set_reg(), which rejects bw with WARN_ON(), and
>then writes new_lvl to cck_pd_lv[3][nrx] anyway. UBSAN reports the
>first of these accesses as:
>
>  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
>  index 3 is out of range for type 'u8 [2][4]'
>  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
>  Call Trace:
>   <TASK>
>   __ubsan_handle_out_of_bounds+0xdd/0x120
>   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
>   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
>   rtw_watch_dog_work+0x217/0x330 [rtw88_core]
>
>The driver doesn't need to read the bandwidth from the chip:
>rtw_set_channel() stores it in rtwdev->hal.current_band_width and
>programs the same value into the chip. Use the stored value. CCK PD
>only runs on 2.4 GHz, where the bandwidth is 20 or 40 MHz, so the
>stored value is always a valid index.
>
>On PCIe, a chip that stops responding still returns nrx = 3; the next
>patch handles nrx values without CCK PD registers.
>
>The fix and this message were drafted with an AI coding assistant
>(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
>submitter.
>
>Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
>Cc: stable@vger.kernel.org
>Suggested-by: Luka Gejak <luka.gejak@linux.dev>
>Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
>---
>

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
