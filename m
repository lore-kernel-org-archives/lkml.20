Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552941;
	b=q6UEIFp9vM6afySx8H26Lgpl5ddJGsojWQhh6taP6w9qPWWpVLOVYltUTAalBMGNZM25
	 1HqGb7Sxuf8cW7Knkh5bVEvZuDTRyvVetshB1NmuDBKcKeS1mECnpzwY4K7oSseZgLIFz
	 EmGuSSTu21qHjNN+25anR0UgCFnpkMF9izhBRNNX+IjGgzWOzxNC8iIrCBwC0J+qhU56m
	 vKfKKWanfZC91vNPG07EgitsdXrq4C9MTQxb11JIY6L9+6R6LVmbN8TXtvP3ItsT8s8h/
	 /LFg/Ginw6NjMvNCFn/wT07uBqwmjsMaBnLuGwnQgZuaJG9PPs6l87Kpe4Ryn0OIoLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552941;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=d3D9BzIQzbde6wqcDiqDA/BpphsaAl0CoKRTl2D5pco=;
	b=QDIRO+3xg8xM6emqzqpgHkUjf0PiStcOrJkuM+LoYZDI3Y+PLC1OKFzEfsSfw/kvNe4h
	 KWmDkdlwLYMi/C8qpEyvSLWtCn30nRSOZrhYnq1LW8aLA3KV+NSaUO2SggCU5AHl7qSZD
	 RDDgi8vdn07CNk79hXCtaaAdM4o052Ww8zv0ALcAgA1/QbcNKPkRpLWVtm9wCP5gf/p8F
	 bb3ZiCUbX0dsu0eGuGKNKj8slkrQwALFTRFU17iU+oEFXiSBgUIqqpJlBi4GAHI3tRgUs
	 gXkx9owu5MxaOY/+tE/JJePdh6kjHuFcr/8wrpPRKe9iDoR6rm7RayD7JVFfdRXIsXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RRbkH2v5;
	arc=none smtp.remote-ip=95.215.58.134
Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A1460A3803
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A1460A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RRbkH2v5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=d3D9BzIQzbde6wqcDiqDA/BpphsaAl0CoKRTl2D5pco=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794552938; v=1; x=1795157738;
 b=RRbkH2v5BxT+JaaaCqFybj8ZUmBRzWFLS98oS/eIHIs/a3lMfc4XXQo94TNMJX1x7nQfLujj
 /3+fkK2BBQ41RgAyslcXsyXyuNVPcW6o3VbPMJvVX+xVC3nKjesyASThwu0ax1/lSyb4nfzSK3h
 6ET/f5uAjw8W1dUokL1qaNes=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 294e72e22a57f0d0;
	Fri, 13 Nov 2026 06:55:38 +0000
X-Mizu-Trace-ID: 294e72e22a57f0d0
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 07:55:37 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Mehmet Fide <mehmet.fide@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_2/3=5D_wifi=3A_rtw88=3A_repor?=
 =?US-ASCII?Q?t_the_frames_purged_from_the_TX_report_queue?=
In-Reply-To: <20261111213239.569224-3-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com> <20261111213239.569224-3-mehmet.fide@gmail.com>
Message-ID: <89B03654-2285-4A15-A5B2-91B0F355B7E2@linux.dev>
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

On November 11, 2026 10:32:38 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>A frame whose sender asked for its TX status waits in the TX report
>queue for the report of the firmware. When no report comes, the purge
>timer frees the frames with skb_queue_purge(), and rtw_core_deinit()
>does the same. mac80211 is not told: the sender gets no status, and the
>copy mac80211 keeps for the status of a frame from user space stays in
>its list until ieee80211_free_hw() warns about it. On an RTL8822CE with
>hostapd, after a firmware crash and an unbind of the driver:
>
>rtw88_8822ce 0000:01:00.0: failed to get tx report from firmware
>[...]
>Have pending ack frames!
>WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211], CPU#1: sh/24725
>Call trace:
> ieee80211_free_ack_frame+0x4c/0x70 [mac80211] (P)
> idr_for_each+0x6c/0xf4
> ieee80211_free_hw+0x30/0x8c [mac80211]
> rtw_pci_remove+0xd8/0xf0 [rtw88_pci]
> pci_device_remove+0x44/0xd4
>
>Take the frames off the queue under its lock and hand them to
>ieee80211_purge_tx_queue(), which reports each one as not sent.
>
>Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
