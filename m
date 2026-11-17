Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926687;
	b=I37toDkP73wXHjxSjd5PXcHa3R9bNpWFONqWfPCJ/PuaVWh+l4ZAoBC31kK5ArwugLrO
	 01Jv2MiQsI6j5Tg2cn8QfuGV0q5x/mxXMKHX9cldz6SuJXwnCo1golvLE1I6l4R2jzAJj
	 jQza18XgLcTJ2XsthEB+4bkt8o7pn90QHGggYRzoaA37v9GbymRETK/GwUH90hdTiYAkA
	 PSRgpJZRkayo27XvrYxdTN6TXQnvpanSArQYPHEiWl056KwdFavLNHx9cjHCyjFVtt5ww
	 EBqVmp9zfUL9Lu2jYKISgdEXBgRndO1huXzV+gIgGUKo+6d/6DhMPn3rPqNE3yTWw1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926687;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=PHXoIi8ouLda/eOhfRDumPGk6plK6QA3eTC0611Rdb4=;
	b=hTl+RGD/fZ5nCFriItV7SFjdhW+8Vj1HcitWTGu9tYKqBnHol4BX1LQuAkue42RTYxAe
	 wInajsx028/hGAwckUcQ0DqGWlNSHCesRk2TLFXrW0kaqj1Ok0T3RAp/lIoeCZgIY0555
	 fI27eRMzmmP/n1z7g83BpNWPL6lxtlNKI48vxubWWblt0UyBLGXD4BtMWW9vwJ0b9QQRw
	 irYPMegXS58fBu/FzmxFvHt9vtW+EVOrDfyKmFeJoVH9jB4hzqfom+JW+pLqraEHajFeW
	 iPR4OS6u3M8re7bme6g4QsZzzy7u10QBdNGJXnsizlTEQ5yoik2JGbniQVUOgnRKgYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF0606A31C;
	Tue, 17 Nov 2026 14:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jTSDn5P58zFpfj;
	Tue, 17 Nov 2026 15:44:41 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794926681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHXoIi8ouLda/eOhfRDumPGk6plK6QA3eTC0611Rdb4=;
	b=OidOVGcj5jSJL/RbruFcEDywi0NNeAxMzWNFnzgm4fyKh/IayFguF2OPI6XiSImGTM1uHB
	8aS6Hh6WBieTmgDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794926681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHXoIi8ouLda/eOhfRDumPGk6plK6QA3eTC0611Rdb4=;
	b=W2KlU7pDyAqyHIksiR1nGc03Jb8PYAWbpOIDZ+HL1zD4Xal+HYV89k4IJ1Tr4JYkjlMnlU
	sA1jIdIqdztM9c9oWBtzbs0FA3n4NXdVTSJtFOGxZ3QelMzzTtxFA0ZvJ6VKEtMh+s949z
	R8xFpuKwhuXgh4qb7MUIglthUvsfSBX7EtxLOBWhqeDVFp6XNW0tMuOiL1yOwJjIw1RbI1
	SMfA11B7a1preyJCE+JZlkEVz0Puq1KP1+MVNLnybIX6o8ySqCAVej1FC2AVzPM9K+Px4u
	mz4QdbU9Gx9osW4+QFc44U++FZoe6uLhLE79RC/OLfPKWlTuFQCktT5H8ViRxQ==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id wElRI1lo/GqCFikAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Tue, 17 Nov 2026 15:44:41 +0100
Received: (nullmailer pid 3747762 invoked by uid 2002000001);
	Tue, 17 Nov 2026 14:44:41 -0000
Date: Tue, 17 Nov 2026 15:44:41 +0100
From: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next 0/5] wifi: rtw88: sdio: faster and fairer TX for
 the 88xx chips
Message-ID: <avxoWTaI2G8aklLk@hardeman.nu>
Mail-Followup-To: Ping-Ke Shih <pkshih@realtek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leonard Lausen <leonard@lausen.nl>,
	Alastair D'Silva <alastair@d-silva.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
References: <20261116190145.2736364-1-david@hardeman.nu>
 <4c0d81f7a207468d8bca3c3c1a5b8dc5@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c0d81f7a207468d8bca3c3c1a5b8dc5@realtek.com>

On Tue, Nov 17, 2026 at 07:46:44AM +0000, Ping-Ke Shih wrote:
>David Härdeman <david@hardeman.nu> wrote:
>> Known issue, not addressed here: when the client goes off-channel (for
>> example for a background scan), the chip sometimes gives up on an MPDU
>> of an A-MPDU session without sending a BAR, and keeps sending up to 64
>> frames past it. 
>
>What do you expect? 
>
>     rtw88                client
>     TX A-MPDU   -->
>     TX BAR      -->
>                 <--      BA
>
>I have not seen BAR for a long time. Do you really need it?

First, I'm not a WiFi expert, so please excuse me if my
understanding/explanation is wrong, weird, or both...

That said, I should have explained this better. What I see is:

1. The client (iwlwifi) goes off-channel for a scan, about 120 ms at a
   time. Here these were the background scans that NetworkManager sets
   up in wpa_supplicant to find roaming candidates, which run every 30 s
   while the signal is below a threshold.

2. The chip keeps retrying the frames it already has, gives up on one of
   them (SN n) when the retry limit is reached, and later continues with
   n+1 and onwards. SN n is never sent again.

3. The client's reorder buffer now has a hole at n. It holds n+1 and the
   following frames until its reorder timeout fires, or until a frame at
   n+64 or beyond pushes the window past the hole.

A BAR with starting sequence number n+1 after step 2 would tell the
client that n won't come, so that it can release the frames it holds
right away. That's the use I mean, not asking for a BA.

>> rtw88 reports every SDIO data frame as acked, so
>> mac80211 doesn't know either and can't send a BAR. 
>
>Can you check air sniffer if the A-MPDU is actually acked, or firmware
>report incorrect ack?

I did use a second AP as a sniffer, but it was too far from the R76S to
decode its VHT data frames. It did see the client's BAs, and no BAR from
the AP. I can repeat the capture closer to the AP if you think it would
help (I would have to wait until a time when I'm not interrupting the
kids' gaming though).

What I have seen:

- On the client, a trace of every MPDU its firmware passed up showed
  that SN n never arrived (within +-500 ms, on any RX queue), while n+1
  and onwards arrived as retries once the client was back.

- On the AP, a debug build of the driver that polls the firmware's
  per-MACID TX statistics every 2 s (H2C 0x43, C2H AP_REQ_TXRPT)
  saw failed frames only while the client was scanning (13 in four
  2-minute runs, all during scans).

So I don't think the firmware considers these frames acked: it knows
that it dropped them, but rtw88 doesn't learn which ones. The "acked" I
wrote about is what rtw88 tells mac80211 for every SDIO data frame.

>I think mac80211 has no way to send a BAR. How can it do? Driver
>tells mac80211 once it TX a set of frames?

From what I understand, mac80211 can, but only if the driver tells it
which frame was dropped: the driver reports that frame as not acked,
with IEEE80211_TX_STAT_AMPDU_NO_BACK set, and mac80211 then sends a BAR
with SSN = SN + 1 (see net/mac80211/status.c). iwlwifi's mvm does this
when a single frame of an A-MPDU fails.

rtw88 can't do that today, because it doesn't learn which frame the chip
dropped: for SDIO it reports every data frame as acked once it has been
handed to the chip. That's why I asked if the firmware can report the
dropped frames (or send the BAR itself).

>> The client's
>> reorder window then stalls until it is pushed past the hole, which
>> costs a short throughput dip. 
>
>Are there some frames get missed but hardware somehow considers it
>has acked them already? (I think need to check air sniffer)

See above: as far as I can tell, the frame is missed, and the firmware
counts it as failed (so it must be aware).

>> With iwlwifi clients it turned into
>> bursts of up to 63 lost frames per hole because of a reorder buffer
>> bug there, for which I have sent fixes:
>> https://lore.kernel.org/linux-wireless/20261116155609.535595-1-david@hardeman.nu/
>> I tried the hardware BAR settings (REG_BAR_MODE_CTRL thresholds, the
>> BAR retry bits in the TX descriptor), a longer retry limit, MACID sleep
>> for dozing clients, per-frame TX reports and a BAR sent by the driver
>> after the client wakes up; none of them helped, and per-frame reports
>> only came back for about one frame per A-MPDU. Ping-Ke, is there a way
>> for the firmware to report which MPDU it dropped, 
>
>I think hardware's retry buffer will do it properly. If a frame exceeds
>retry limit, TX report tells driver a frame is dropped. But this is only
>for specific frames with SN (see rtw_tx_report_enqueue()). 

I tried requesting that report for every QoS data frame: only about 7 %
of the requests were answered, roughly one per A-MPDU, and download
throughput dropped by about a third (~210 to ~140 Mbit/s). So per-frame
reports don't seem usable for this. A report that only covers the
dropped frames, with their SN, would be enough.

>> or to send the BAR
>> itself?
>
>As I know BAR is to ask peer to send BA, what does your expectation if
>you can send BAR?

As above, a BAR with SSN = n+1 moves the client's window past the
dropped frame. REG_BAR_MODE_CTRL suggests that the MAC can send BARs by
itself (BAR_EN is set on my chip), but lowering its thresholds made no
difference to the losses.

As for whether it's needed: with the iwlwifi fix, the remaining cost is
a throughput dip while the client scans, because it waits for the
timeout or for the window to be pushed past the hole. So it isn't
urgent, and this series doesn't try to fix it. I mentioned it as a
known issue in case there is a firmware feature for it.

-- 
David Härdeman
