Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274447;
	b=oJL573dDxg9rGY3ed19YeIKmhmyWsjngioAthQkz7zmEo3VHRxZwaOAmIKEDR3Q8y4px
	 6bbYqjuNxJE3L9AG6baauR1Jk3jk5yGByrgGmLD3WE+ObIYf3IP9puAsCo5f4IxBSkNBa
	 rK8KwasWOopC2gwvPvmuT+0xqr89lzSVx1o8wT0vwqrz9C9RvuB//cdRz93utHijWeGhl
	 Wan4HN1aCc8hTr+yPBhQ8I8opkWEkIFZ4TORjY5DX/qTYDjOJCZn3KhslLRr4Td6IFBTP
	 yY1SH829ljMy9P32ouYKZPPG4ZGm+zVWn/FOmUNok1C8pQ5hTLuNd5Her9E5jLp1Q/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274447;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AB66/v2qqiaPMMtAxVxm8zYadiax3Nt9sPxRF63Dxbw=;
	b=nmVuoMbMVB5wRe0RjWtC2UvRSQl4E81sSUGSSEW2v2QmppwewHlbF5h053H3v16jIHwc
	 7VB/cH8bLVvEsi4x2Zu9Z7gbNVYZMHy3Iagtj/MwtOxc7p6Ma38Ltyfns0w47mPUhSmJ4
	 28D3l1+IZ509NTYtufTKwBWSt5V4Qbv6EtB3Tq5ZoyHWUd3zLaI+aZMTpSSWTy3KmG1Ue
	 CTuxCpgiop1jlMvAiVfkPn9Ic2R/4NAjIcs6z3oNI9LKy/1s+dzQ3XyOkT8Y5cEt28bdV
	 mNz93Ifvii+Ykup0E43wn4T63cAsu2yhnqMqMGubidGRc+Ndpm0cD/CI31zoOLLFJxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwxlrtX4;
	arc=none smtp.remote-ip=91.218.175.107
Received: from mta0.migadu.com (out-107.mta0.migadu.com [91.218.175.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4B606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E4B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwxlrtX4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=s2g0Oek4Alnf2qjcFNmkwbjLXBHjq/aq5QUfCVDyglE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794274443; v=1; x=1794879243;
 b=DwxlrtX4wCIpck7iss7oUNAr3hj/pZobec1ls5mg2uw7DS2gZ+0haT0yVzUN0BVp1IyV2CGe
 fjHkwvi8hnwgRuRICl0lrqup6yqWwCmODcKP1ec3rKadassrPR4b8t/2PJm/hdM7w3D0qufaHZF
 mzWF7Wf9yb6OQBib+rYehl0o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86af1ee8961c55c2;
	Tue, 10 Nov 2026 01:34:03 +0000
X-Mizu-Trace-ID: 86af1ee8961c55c2
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 02:34:02 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org,
 Noah Weinberger <NoahWeinberger2003@proton.me>,
 "pkshih@realtek.com" <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "security@kernel.org" <security@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_wifi=3A_rtw88=3A_sdio=3A_check_p?=
 =?US-ASCII?Q?acket_length_against_remaining_RX_data?=
In-Reply-To: <tKht3w_knueblApO8rdPrR1QcEs6-nv-6y_7lYwYWCYqQJJ2ZiPAgcGJZuiQVeotGyIaO3EZ9j_0jFwlc5ESOzzhNSRjQu5vvUGR1kf2MUE=@proton.me>
References: <tKht3w_knueblApO8rdPrR1QcEs6-nv-6y_7lYwYWCYqQJJ2ZiPAgcGJZuiQVeotGyIaO3EZ9j_0jFwlc5ESOzzhNSRjQu5vvUGR1kf2MUE=@proton.me>
Message-ID: <43A4B4D6-EB5F-4079-8BE9-A452DA8B2AB6@linux.dev>
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

Hi Noah,

Thanks for looking into this. A few comments below.

On November 8, 2026 11:27:09 PM GMT+01:00, Noah Weinberger
<NoahWeinberger2003@proton.me> wrote:

> Subject: [PATCH] wifi: rtw88: sdio: check packet length against remaining RX data

This doesn't apply to rtw-next, which is the tree rtw88 patches should be
based on, because the same check is already there. I sent it in October and
Ping-Ke applied it as

        83ca360e8528 ("wifi: rtw88: sdio: reject oversized RX packets")

It tests pkt_offset + pkt_len > rx_len at the same place, so this patch can
be dropped.

For future rtw88 patches, please base them on rtw-next and put that in the
subject as [PATCH rtw-next].

> Hello,

This would end up in the git log, so please leave the greeting out.

> rtw_sdio_rxfifo_recv() validates the descriptor's pkt_len only against
> the absolute maximum (11454), never against the amount of data actually
> transferred (rx_len). The last-packet branch is taken precisely when
> curr_pkt_len + pkt_desc_sz >= rx_len - which includes the case where the
> descriptor *overshoots* the buffer - and rtw_sdio_rx_skb() then calls
> skb_put(skb, pkt_stat.pkt_len) on a buffer allocated for the aligned
> rx_len.

The length checks are in rtw_rx_query_rx_desc() rather than here, and there
is a lower bound too.

Commit messages are plain text, so please drop the asterisks and the dashes
around that aside as well.

> The loop's own comment documents that the 8051-class chips can produce
> packets whose pkt_len is zero or points beyond the end of the buffer
> when the RX fill race hits; pkt_len == 0 is guarded, the overshoot is
> not. An inconsistent descriptor therefore reaches skb_over_panic() ->
> BUG.

That comment is in rtw_sdio_rx_isr(), not in this loop, and it explains why
the driver stops when no RX request is pending. So it describes a case the
driver already avoids there, and I don't think it explains the overshoot
here.

The zero length check also only covers normal frames, because
rtw_rx_query_rx_desc() returns for C2H before it gets there.

The BUG isn't always reached either. For normal frames skb_put() only gets
pkt_len, and pkt_offset is applied after it:

        skb_put(skb, pkt_stat->pkt_len);
        skb_reserve(skb, pkt_offset);

So a small overshoot gets past skb_put() without a BUG.

> Affected version/commit: mainline
> fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07),
> drivers/net/wireless/realtek/rtw88/sdio.c:1352-1419
> (rtw_sdio_rxfifo_recv), sdio.c:1331-1350 (rtw_sdio_rx_skb), rx.c:295-320
> (rtw_rx_query_rx_desc).
> Loop predates this window (8703B); newly reachable via 8723BS support
> added in this window.

fa4ad798f6f6 is not v7.4-rc1, which is 6628e7d4c6b2 from Nov 1. Line
numbers
go stale quickly and the first line is well over 75 columns, so please
leave
this out of the commit message.

"Newly reachable" isn't right. The loop came with the SDIO support in
65371a3f14e7, and 8822BS, 8822CS and 8821CS have used it since then. It is
also not clear to me what "this window" refers to.

> [ ... ] every code path cited below was re-verified by the
> reporter against that tree. The patch below has NOT been compiled and has
> NOT been runtime tested, and no reproducer was produced - the triggering
> conditions are described above instead. Please treat this as a report for
> verification rather than a battle-tested fix.

This is a note for reviewers, so it belongs under the --- line and not in
the git log. The code paths are cited above, not below, and since you are
the reporter, writing it in the first person would read more naturally.

Please build a patch before sending it,
Documentation/process/submit-checklist.rst asks for that. If you only want
someone to verify a report, maybe RFC would fit better than a plain PATCH.

You also sent this to security@kernel.org.
Documentation/process/threat-model.rst treats devices reporting values
outside their documented ranges as regular bugs, so that list should be
left out of this one.

> Reported-by: Noah Weinberger <noahweinberger2003@proton.me>

There is no sign off on this patch, so it couldn't be applied even without
the conflict. This tag isn't needed on your own patch, and checkpatch also
asks for a Closes or Link tag after it.

A fix like this should also have a Fixes tag:

        Fixes: 65371a3f14e7 ("wifi: rtw88: sdio: Add HCI implementation for SDIO based chipsets")

> diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
> index dc2fd0f..0a07d8d 100644
> --- a/drivers/net/wireless/realtek/rtw88/sdio.c
> +++ b/drivers/net/wireless/realtek/rtw88/sdio.c

[ ... ]

> +             /* The device may provide an inconsistent descriptor whose
> +              * packet length points beyond the received data; do not let
> +              * skb_put() run past the allocation in that case.
> +              */

I think this comment can go, the check is clear without it. It also isn't
quite accurate. skb_put() would stop with skb_over_panic() rather than run
past the allocation, and the check compares with rx_len, not with the
allocation.

The style is wrong either way, a multi line comment should start with /* on
its own line.


Best regards,
Luka Gejak
