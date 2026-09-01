Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C59646D570
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254315; cv=none; b=Z/w9xKbztg538pFLTA2l6qUtIyd2NLOOCNZFfJHqyo6wT/bTE6rjiyUUeeLxXnEFphRS1waHWEHQlZGEaBLq+mjqWzymWS/vbqrCZ8hzUgrRQ/TXLVuhEt/wXBOyg2sJJ06CpEqaK3XLvMB0JEmHTNMCftRt72NnstiV2FJKsB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254315; c=relaxed/simple;
	bh=XzqNVl6OeV+SYBeUHRgc3K1ehXXBOoZK78nLesljXrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upX57xgn16h3oGHatC++zlj93nMq3sy2zKfV+9j00Ux2/wktSUSIgekvi4Mi3UFeADfiiSPpmKHTg50jTwU/NZe8rfq0Mt92kOSJDmZ/0yq04P/aZ7On0a7aO2iGvzUWFgXWhjtEKNbqgccIQ2+OHVUNczN/MRBMDkM6bZh2qBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWviulsQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWviulsQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so53539595e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254312; x=1788859112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ox17qlfGwgbDEYWgR5CMA+apR26DItVeT8iYjLmPkvw=;
        b=VWviulsQppmWLeniK8mvEs0U1qKgQ88Cox59vb/9yeUu6TOZKH4hRZl+Cxe8dhgulp
         AezmMLaFX30hNmM7iEy6GXxrDe7w4QBQdYZQVBt88ndkT07c46LLczN5AM61i8mY2j9s
         IwBnRO6dScojW2mr3yrh9gr3LyK6lPk9JCsxqv1ZX3V6SJG36r7Itsly+6dbfefY7Dxb
         VG98QFbOiI61ke3+2Zla/v22qY5zRIfSQA4PoZHSQgp6lgo6qy7hwaD6M08TNImh+lYA
         wIxWoqba3fQm4tOLsUrPGem2pfgNYN0F3lMJF/ha1X4M32hN95yPmrFhRt95GC9i3ob2
         IjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254312; x=1788859112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ox17qlfGwgbDEYWgR5CMA+apR26DItVeT8iYjLmPkvw=;
        b=VJb6ViuUlWD8tECCGVk6pd7T/Yvmtp8wQ+kvO0jPsxAEvHYQrggfZP+muGkma12jXQ
         2z4muxii6wQg8DABhIsCtzzJP0OwJ3hS8BLNCc7ODyBnQ0ht6fawbDVW08rcJm2DFuve
         9TlxLO615LccX4XkYPhE6Wc22OsaHOKt6IbgQeT2UOAHG3acEaC7XW5SWgeSw2SswWIp
         L+LV1TGK3Y5/SE9Ks4Mo19eW37DGSyHNcICHWPFmJ5PAfRijxc5l8xOqzKJYX6DWTj9k
         1iqp4fm0reYi14QOIi4qtWoN/efiJVk0hUXgl8pp3cxuMgRUtqZ/lgfHb9mb6NTvj7dL
         TArQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpy8yHjgXDyLRkLCX4dCRHtTNPYOPFH0MRIcyQHM1J7+RQpITs9OeoTsET2qWX5vta4Cijw4g7fEzwAyu0=@vger.kernel.org
X-Gm-Message-State: AFuF++mwgkshA1JJ911V5lGZFFdlUwzli73VPMwSDTfG1EvO8X21nKXc
	54BQISG+3E0U50TRIF128MmpnfArOT6l1cNEveBeWhrUKKv1yrqFdQtC
X-Gm-Gg: AR+sD11K244IQkQ3BCYd96CktnBCKOaFrjbCxXit2py+3KQWkfDJLAKhKfcVS1hbY5S
	keFmbjaM57xRB7+zDWCtznyUnk3HCqPblsIYVtoQK43I3Bw/QFRtEeS7MEyhalwNyd/ArO7F37O
	D0ZKa7+OIz0obmQhukm+Db3XyTNJatQwl8L9eaVKW1SgN/SxaZyCYz8z9EO5TZcUsOVgU0AoVbI
	LkYhRMwOEcXsgtBY3Uzii/9FCFVQUkWujbJ0WVqimW0OSAyqWJWxOq6B5WBd0cjf7XHDigQWVHD
	2KnCLZAGD8vEV46YIOCUU0lGXAleuZOJjM9tvT8Ym83HAA/MDtPAqAZ1aGixvQyGWTNMUnkeOr5
	dYEhYoxba0re3ePxmjfK68DzzujDR5iKBiMX/0jhb77gGF5pfLMGoxT5sYXnK61EdnD75M6clUu
	nNuWDuDdgdpV7GSpBcD2j4wz2XVxi5K8QITBECgJlTGFMQBindXetoy0APxKGMpsYpqA==
X-Received: by 2002:a05:600c:8107:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cd26ad005mr307050445e9.15.1788254312032;
        Tue, 01 Sep 2026 02:18:32 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm54140625e9.1.2026.09.01.02.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:18:31 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next v3] wifi: rtw88: usb: route bmc frames via the high queue only for DTIM delivery
Date: Tue,  1 Sep 2026 11:18:30 +0200
Message-ID: <20260901091830.2506562-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9209280c3f044363afd884687ae3cb6b@realtek.com>
References: <9209280c3f044363afd884687ae3cb6b@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Ping-Ke,

thanks for the detailed answers, and for the ATIM window pointer - I ran
that experiment today. All numbers below are from the same bench setup
as before (RTL8822BU USB2 AP, dtim_period=2, one associated Windows
client in power save, ~40 broadcast/multicast frames per second
generated on the AP, free page count read at 0x240, nothing touching
the client during the runs).

> Have you confirmed the broadcast frames ate all of them?

Yes, three ways. The drain tracks the storm linearly (1803 -> 16 in
~105 s) and only while it runs. With an instrumented build I counted
the high queue draining ~3 frames per DTIM, which at dtim_period=2 is
~15 frames/s against ~40/s coming in. And with a test build that keeps
the same storm off the high queue (routed to the AC queues instead),
the count never leaves 1803 - same traffic, only the queue changed.

> The HIQ packets only send out right after beacon within ATIM
> window controlled by REG_ATIMWND (0x055A). Can you try to
> enlarge the size to see if it will be different?

It makes a dramatic difference. Same storm, only REG_ATIMWND changed:

  0x02 (default)  pool 1803 -> 16 in ~105 s, pinned  (reproduced twice)
  0x04            pool never leaves 1803 over 180 s
  0x08            same, never drops
  0x10            same, never drops  (reproduced twice)

So the default 2 TU window is what limits the drain to ~3 frames per
DTIM, and already 4 TU drains faster than this storm fills.

One more observation worth recording: with the client *actively
pinging* the AP the pool still drains to 16 at the default window.
Windows dynamic power save dozes between packets, so a client that
looks perfectly alive keeps the dozing condition asserted. That matches
our field failure: the link looked healthy and yet the AP died.

> If you stop 40 broadcast frames per second, will AP become available?

Yes. In both runs the pool was back to 1803 about 60 s after the storm
stopped, and the reconnects between the runs above all succeeded. In
the field neither condition stops (the chatter is mDNS/SSDP from the
clients' own segment), which is why it presents as a permanent lockup.

> I think this is not possible, because USB needs time to transmit
> packets from host to WiFi card, and then it needs to wait for next
> DTIM.

Understood, I have dropped that idea.

> Is it possible to declare IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING and
> call ieee80211_get_buffered_bc() to get the BC packets to send?

I looked at how the existing users time the release. ath9k_htc can do
it on USB only because its firmware sends an SWBA event at beacon time
(WMI_SWBA_EVENTID) and the driver pulls the buffered frames from that
handler; rt2500usb has no such event and explicitly refuses to set the
flag for that reason (see the comment in rt2500usb_probe_hw_mode).

Interestingly, the firmware seems to already have the needed event: the
vendor driver enables a beacon-early C2H report through a bit in the
SET_PWR_MODE H2C (SET_H2CCMD_PWRMODE_PARM_BCN_EARLY_C2H_RPT, C2H id
0x1E), though it only uses it for TDLS channel switching, i.e. in a
station power-save context. Do you know whether that report also works
in AP mode on the USB chips, and fires early enough to pace
ieee80211_get_buffered_bc()? If it does, this becomes the clean
long-term solution and I would be happy to prototype it.

For what it is worth, the vendor driver does not use any beacon event
for bmc delivery on USB either: it parks at most one filtered burst in
the high queue, lets the hardware pace it out after the DTIM beacon,
and refills only when the queue reads back empty - in other words, its
real protection is a hard bound on high queue occupancy, which is what
patch 1/2 below brings to rtw88.

> Maybe, check bound first, and then filter ?

Agreed. Here is how I would combine the four knobs:

  - bound (patch 1/2): hard cap on how many bmc frames may sit on the
    high queue (token bucket refilled at what the default window
    drains, overflow goes out on the AC queues awake-style). This is
    the guarantee: the pool stays healthy under any storm, including
    the ARP/DHCP bursts the filter admits.
  - filter (patch 2/2): admit only ARP, EAPOL and DHCP to the high
    queue, matching the vendor driver's default. Ordinary chatter never
    reaches the beacon-paced path, so the bound rarely engages.
  - ATIM window: given the measurements, a moderate raise (0x04
    already drains this storm, 0x10 gives headroom) would add drain
    capacity as a complement. I left it out of the series for now
    because the queue stays unbounded either way and a wider window
    costs every PS station awake time after each DTIM - I assume that
    is why the vendor driver keeps it small and filters instead. If
    the firmware is fine with a larger window on these chips I can add
    it as a third patch; is 0x055A safe to raise across the USB chips?
  - mac80211 BC buffering: the long-term correct PS delivery, gated on
    a beacon-time event as above; follow-up work, not part of this
    series.

If the plan looks right I will send the two patches (based on rtw-next
with the acked v3 applied) in the next days.

Best regards,
Mehmet
