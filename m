Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929253;
	b=uUFo4TZzr9TitONO6RfeHwCWr7uMjtccHfZPqW/Nk0hEZUW0Cv/rGkgxVn+a4e2/v3h+
	 3YHXm/jba3CG9/hs9Pfp1BCPEp7VxoGE0Wzw1fq78EGy7sbvOPxLKKSiUAo8toCT6jaLA
	 XS5Eur+C2VVpAk+dSoVaaL0iEldbymCppC84cZwj10bQyMO3F4zmjDw2VhHUZZJ1n6g5O
	 GMblh9vGNB4QgoZa4F/xOsgEiIAs4QLuAz638+Xfu/ofG5ipRI02KZe4vN+ze+XOalvxF
	 Xza3bsA/8QgXeWgCPjpDeL/Xm8Ke0+saQBk9SuD9UaDJHtTdOXunEf9CZFddeH+lHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929253;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l4kzxy4albyO98WwOBZXJVKpWzM9+D04m4bfPA15zDY=;
	b=2+ykYK0BpHQoPcKpxnPHC7jZbrUvtQL7V+t7x/MYi+0zL1UHJ+kjImU8g9I71GebmsNM
	 7q+XKR0ZvDPvS7x7jQqO5s/LIkEvG+mb1Ttm1In4sI6oZOgpwts7quQ+nlinjPMnPDu3z
	 GV4XuzAaNCc+ygC79UXUpzgEIzqNeDRPPv4nT6mOK6mz8kBNikHLqsdk3Nw7lXRumsqJn
	 yuEoYkeVsBFCp1GvdSv8intkNKRrpFLAbv8ZmWGBK1xhNrQszrrVpv5MrRWgAv8pF1hkr
	 wnuYT94w9JBQMMXf6ayAI/Ln+ar9R3Vq7dA/7xxveZUxZpXMoVVQ5i5G/uLfoOk/PxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h5UzsDob;
	arc=none smtp.remote-ip=95.215.58.200
Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E4606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41E4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h5UzsDob
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3DZUeKMUOesEs+VwJerrWYpQyTXZPxx1uu0Yj7Mba8c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794929249; v=1; x=1795534049;
 b=h5UzsDobXwTdLcbljCOBYaFYe87J13FwSkJD2aGzkcv+2XqnzwXyDGydEwSXrufOUaP5oqkS
 z/SKecSF9gV9vGjJqfqLe1YwTbDObJ6BZM22SciWiF89sfNdFEdbFCYvV7HkfmAdW8cbYlQe3od
 sZ5tja/+ce3xFBWIo5qmHSfM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fd11db2d7b1f8f56;
	Tue, 17 Nov 2026 15:27:29 +0000
X-Mizu-Trace-ID: fd11db2d7b1f8f56
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 16:27:28 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_0/5=5D_wifi=3A_rtw88=3A_sdi?=
 =?US-ASCII?Q?o=3A_faster_and_fairer_TX_for_the_88xx_chips?=
In-Reply-To: <avxoWTaI2G8aklLk@hardeman.nu>
References: <20261116190145.2736364-1-david@hardeman.nu> <4c0d81f7a207468d8bca3c3c1a5b8dc5@realtek.com> <avxoWTaI2G8aklLk@hardeman.nu>
Message-ID: <03BBDDF6-2ACB-4B06-827D-69811DF5664A@linux.dev>
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

Hi David,

Thanks for your explanation, here is my two cents.

On November 17, 2026 3:44:41 PM GMT+01:00, "David Härdeman"
<david@hardeman.nu> wrote:

> I did use a second AP as a sniffer, but it was too far from the R76S to
> decode its VHT data frames. It did see the client's BAs, and no BAR from
> the AP.

I think the closer capture would still help, with the data frames and BA
bitmap for the same TID around a scan. The client trace shows what its
firmware passed up, and the per MACID failure count does not identify
which MPDU failed. Matching those to the air capture would help check
what happened to the particular hole.

[ ... ]

> From what I understand, mac80211 can, but only if the driver tells it
> which frame was dropped: the driver reports that frame as not acked,
> with IEEE80211_TX_STAT_AMPDU_NO_BACK set, and mac80211 then sends a BAR
> with SSN = SN + 1 (see net/mac80211/status.c).

I checked the mac80211 status path, and it does send a BAR with the next
sequence number for that QoS status. The current rtw88 report helper does
not set AMPDU_NO_BACK, so requesting the reports alone would not exercise
that recovery path.

[ ... ]

> I tried requesting that report for every QoS data frame: only about 7 %
> of the requests were answered, roughly one per A-MPDU, and download
> throughput dropped by about a third (~210 to ~140 Mbit/s). So per-frame
> reports don't seem usable for this. A report that only covers the
> dropped frames, with their SN, would be enough.

One detail that might affect this experiment is that the sn passed to
rtw_tx_report_enqueue() is a report cookie, rather than the frame's
802.11 sequence number. It has six usable bits:

        pkt_info->sn = (atomic_inc_return(&tx_report->sn) << 2) & 0xfc;

As far as I can see, it repeats after 64 requests, and
rtw_tx_report_handle() takes the first skb with a matching cookie. If an
older request is still pending when its cookie is reused, a report for
the newer frame can complete the older skb.

Was the 7% figure from raw C2H events or from completed skbs? This would
affect frame attribution, but would not explain a shortage of raw C2H
events. Maybe a short run with one request outstanding at a time,
logging the cookie, QoS TID and seq_ctrl, would help check that part.

Best regards,
Luka Gejak
