Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663652;
	b=sco7PtlH/xMQasSvyfNdxGXCbBO+JC+S89iFwNmT7pQ4RNtnr9cmf8X+kGojUKpQrTtJ
	 eSVYTpq7pGIYimCtZwC8cj4N65RaZUXFDS9lmP8H7i0Ne+fp3Y6wrCLegcg3VorTGfbYd
	 nNqfWpie/EJb05vq5R0b5hEPx+eB0zoAArWTHA1YWXbPq9JKyOD0Xis/ZcBljZqctAj9d
	 +nXRIztkcM2sdW0kZnW5nybXursMMacR1nkOBiKxwpmeygx06fKxUo+T8GHZosB8sFu0l
	 6rwZwTav+dTEYqnEnwuOE7r8BAfEQdQBNDoTDFVUbXh3ZK/CUyQ/XmEuRg2+OqvAyTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663652;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2sFWVrN02se1GOVqXfsWJswTq/geOkfN2nj2Xp5zpwQ=;
	b=3XU3/IuemU4+RxrEseFcVhGbHB8vBdIHatpJDdRix9jcx5/0vl1ydgCjhS8cwBwfotBX
	 3+pmZwBojjxgFe4PFWu0eXJfDbJl2SjQcDdeCOQCfk/RI/rx9puc0f4qN2dU5tFlyfkJa
	 Zt86gFLCLqzJcaAidj5y79WPyIQfjBNjs2R3IBxkv3om663XxI2aW6q+bHpPW7O3yz7yM
	 ZnXqGWWiR4BY4V+vi7XHl5rLbFTWILttLCT12bzE3fQR7LeWwkPK/BScLtqdEn+sSpoO/
	 QOFIPJu63BN9C+77IsU4kvS3LLP5TwO/lmt0oa/1DE5BvA1gwO4rU9e3pI0VoUw4rCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bi9HDz3n;
	arc=none smtp.remote-ip=95.215.58.10
Received: from mta1.migadu.com (out-10.mta1.migadu.com [95.215.58.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBFC606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBFC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bi9HDz3n
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PBhTNR6hPM9HSFYa5+yBZcEPQicg6SZ+iadVGupiVcY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794663650; v=1; x=1795268450;
 b=Bi9HDz3nv2cRoTDNdgdUaSubWURPn6VAq6chj+Ea/lo/6/k2BfqvuabdHR1JoJ8gRgzwOGja
 dEHMr46fzZhrJnXxqYkmfxvUjPwSu1x+SrDxEZYWLK3RXvTAl9E0fX5r78697IHImIgEJuTik7E
 yKG7M8s8x9uf5tvnkugAGnwg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ede4a74e9d03b07;
	Sat, 14 Nov 2026 13:40:30 +0000
X-Mizu-Trace-ID: 5ede4a74e9d03b07
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 14:40:24 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, Po-Hao Huang <phhuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_wifi=3A_rtw88=3A_fix_skb_leak?=
 =?US-ASCII?Q?_in_hw=5Fscan_probe_request_length_check?=
In-Reply-To: <20261113-rtw88-hw-scan-skb-leak-v1-1-3bd47562abf6@igalia.com>
References: <20261113-rtw88-hw-scan-skb-leak-v1-1-3bd47562abf6@igalia.com>
Message-ID: <9AF24DB9-D92E-479C-A678-0571B1557198@linux.dev>
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

On November 13, 2026 4:17:33 PM GMT+01:00, Mauricio Faria de Oliveira
<mfo@igalia.com> wrote:
>In _rtw_hw_scan_update_probe_req(), if the first loop fails (goto out;)
>the
>skb is leaked. It does not reach kfree_skb() at the end of the loop body
>or
>in the second loop (out:) since it is unlinked from probe_req_list.
>
>Fix the leak by calling kfree_skb() if the first loop fails.
>
>In /sys/kernel/debug/kmemleak, after simulating the failure:
>
>  unreferenced object 0xffff88810965a000 (size 232):
>    comm "iw", pid 4729, jiffies 4345008185
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 20f7de11):
>      kmem_cache_alloc_node_noprof+0x302/0x380
>      __alloc_skb+0x74/0x2f0
>      skb_copy+0x57/0xe0
>      rtw_hw_scan_update_probe_req+0xff/0x230
>      rtw_hw_scan_prehandle+0x4e/0x180
>      rtw_hw_scan_offload+0x186/0x1d0
>      rtw_ops_hw_scan+0x61/0xb0
>      drv_hw_scan+0x81/0x130
>      __ieee80211_start_scan+0x2e0/0x760
>      rdev_scan+0x42/0x100
>      nl80211_trigger_scan+0x53b/0x730
>      genl_family_rcv_msg_doit+0x103/0x160
>      genl_rcv_msg+0x1b5/0x2c0
>      netlink_rcv_skb+0x52/0x100
>      genl_rcv+0x28/0x40
>      netlink_unicast+0x26d/0x3b0
>

Should this dump go under --- so it doesn't end up in commit message?

>This leak exists in the first loop since the function was introduced, and
>still happened with the addition of the second loop, in these two commits:
>
>Fixes: 10d162b2ed39 ("rtw88: 8822c: add ieee80211_ops::hw_scan")
>Fixes: d95984b5580d ("rtw88: fix memory overrun and memory leak during hw_scan")

Should this perhaps cc stable?

>Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>---

Either way I'm fine with the code, so just fix the commit message. Feel
free to carry the tag for v2.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
