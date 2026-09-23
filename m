Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3676E49BD87
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179748; cv=none; b=kL0R+I6VzrgnJBXrSPvScrDgeboxrSAm5sJFIcHxPPdPGTO/q5va8qbiyzAdPXV+V+mL2MfEu/EZMnwmvOcb9F0m9GdGhetz+tV9XNsi7aWY/uecmra0Fhmbpui0ekfWM+7pBr4XEK+G046XS+Xl6nZ0IMm6jMWQkxAyQMf3t60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179748; c=relaxed/simple;
	bh=fcCVw1IykUqUZVqnvXK2b9/x4ldAmRb61B5ADM2eoI4=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=TLRleNOZRnIZB/Hy4Vee0Py+gHAhmCo+3mA4fcJfhTU7siZu8hxewA0pf0WMKeryK35MBlCGNpZVPMvyjjA/IYghDuuJh+L2WzFQ6izyQbVT5Og3EiwFnEc0GTiirExt3X57AIvG81IqS77NtIQcHZioE+KvTyK/tjdiTpTa63M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kxp7bWEo; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kxp7bWEo"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso167216566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179744; x=1790784544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WbqG0AKTZWuggGCF91+Q2AdGuyAOm1Ny4PEclgtPNJA=;
        b=Kxp7bWEosXyJN8VwQb7wSsfCOQf0lM6z6/xJkjdpUJCQFN5dcmJHarl44jcrpyVJ0N
         7kM0RYytEqEVsK7ZcV9WB9TgVRJiqL2caCbdIBk3fefLGRyR6G70M/jCnIPJTBOlH9h+
         h0ZyCZXsBWcUSo0ojwKNkPYe6A2hRnyNa3JDlB1j2ia42oX+veUYnIsMsfc4Ly0qq+Lz
         uWfzdaNz8TaDs3Uv/cH4uXTdy0m6CvIWImu/cO2r+yXYyXn5OT9wLzK1tr1HAGE3ux0T
         4fw6Hj5eYOmLdNyKuFoGPBYbcFuN7C5neooHGI+253s2YGZ5ZUnsz4IfFoYkHQZcR8++
         7/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179744; x=1790784544;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbqG0AKTZWuggGCF91+Q2AdGuyAOm1Ny4PEclgtPNJA=;
        b=cw+r+EnVmBLos/LGazU617YG1vy5x+RMivzf3kFptPgCDECGtJZ/oB9CHiS9jgZUws
         CVFy74diGd18DlVprEFmP7vxMfLqp9jPeCedL9ZFNooaYN058v1haHjV7g+UXNrIv0Sn
         UZpd/3km9PBh2ftoSkMYPQD1ncBPBBUsXRFSbX6BqUTh9RjW/P9x9Ueyygnoi5LdfQ8v
         U9H3lAhJprcknaPOJEH2YldzbOQGtPINrSTJOdFrQMeXBUPN9SBITDC757xBuSExZ/ur
         fjBidz3i56tap7Vy9qEKEG0hnQRsMH4613L3dAeRYoIT0lU4GhVFtp4dO5QyGsRsRtVU
         SNew==
X-Forwarded-Encrypted: i=1; AKwUvBzLm7Vo2lpJDHYJtDh+yni2Ze/W1JDOEUznUYKKh4D+ro6Itu7cx4dvD9xvH/Pp7ob5gU0P2QKG7s0z0H4=@vger.kernel.org
X-Gm-Message-State: AFuF++k049OenJsfAggoddq1HDY19Epx9C9RNTgFSpEAbtCgkhTX/uKN
	WDlkW8BJyObmndn+FXUAOlM7zWDnu02jM2nXxgtuLSZbcRSbZhLJ5DjR
X-Gm-Gg: AYBFou2WeRDDZqBUIqkidxMY+A44ytc+knx9bvxDm0EWUXGKHWHUC42JqfdVjkuvOs7
	M5XJlycT9BPu8HqABwMLAWAuiioa3l4f3d+dhydJusC2eEEF/lz7svQLAvtxmEiPJkGOd+Tb63o
	VlSV2u8bdpajpjzrxIYu9DKoZTyjq3u/EVnvgcrfwvzvUABDuB0n05zEexKaKDItf+etFIdXoyj
	bi99OTjElRXdFjzX3UjOGpuTcmbtk4esQASbMpycNNRjuKiQO9l32sNOyiR9jAUaJdH1LHaX71h
	y56nYXM0Y7u8FaDrdAk4IHcGACl06Pb91mHbjhDN39fywbYPykYcQRTlxuhPmjXsHGliZvbv379
	mWwT1Vu11SvQ+M3Bddv3Z1afAZPJt+t1lagAy5OHjwXmLc0Swil8w72eUpBeMeHZpYof53FsGoR
	vBwsb5GO/B/iiP4LvzzA2bKCA10NpIet2hgXdiRSzpZk8eHdlf8emv1nJmzorMf3eazpzrNtaUR
	VY2Xqv24sHzrKgayxm/z3lBptpS4yCU4Q2PU+Xbuahs/4imDA9y1w==
X-Received: by 2002:a17:906:f58f:b0:c29:4204:8dbf with SMTP id a640c23a62f3a-c2aadfcf05cmr270841566b.7.1790179744183;
        Wed, 23 Sep 2026 09:09:04 -0700 (PDT)
Received: from [192.168.86.89] (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f5asm160068866b.15.2026.09.23.09.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 09:09:03 -0700 (PDT)
Message-ID: <97b3c67c-03ea-4ae6-ba64-afcdbbd8f36b@gmail.com>
Date: Wed, 23 Sep 2026 18:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: erikhakan@gmail.com
To: Benjamin Tissoires <bentiss@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Jiri Kosina <jikos@kernel.org>, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>,
 Rafael Passos <rafael@rcpassos.me>, =?UTF-8?Q?Gr=C3=A9goire_Stein?=
 <greyxor@protonmail.com>, Alexey Zagorodnikov <xglooom@gmail.com>,
 Roman Stingler <roman.stingler@gmail.com>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 =?UTF-8?B?S2F0ZcWZaW5hIE1lZHbEm2RvdsOh?= <k8ie@mcld.eu>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: logitech-hidpp: fix Bolt hi-res wheel handling
References: <20260922-feature-bolt-fix-v1-0-63b0fa8da0d3@gmail.com>
 <8P3_vvAUQ0qq3g6Cks8PBg@natalenko.name> <arOEsd3o2zgXlyHW@beelink>
In-Reply-To: <arOEsd3o2zgXlyHW@beelink>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

> On Sep 23 2026, Oleksandr Natalenko wrote:
> > Hello.
> >
> > Not sure if I'm testing this right, but with v7.3-rc4 and these two patches scrolling works OK as long as I keep "Scroll Wheel Resolution" in Solaar off. Unlike with unpatched kernel, scrolling doesn't go crazy if I switch between devices. But if I switch "Scroll Wheel Resolution" on, scrolling jumps crazy again.

Okay, the expectation would be that scrolling would remain working
with "Scroll Wheel Resolution" (==high_resolution) either ON or OFF,
but when it's ON, it would also need "Scroll Wheel Diversion"
(==use_hidpp) to be ON (or ignored, but ignore may retain a previous
user setting, so a reconnect after setting that would be good.).

When you tested, do you remember what the setting for Scroll Wheel 
Diversion was? With it set to off, the scroll events will not go 
through the hid++ driver, so if high resolution is turned on, the 
events will be misinterpreted by the generic HID driver that expects
low resolution events.

> Hopefully we've got all of the involved people here.
> 
> Honestly, this whole situation has been running for too long: Bolt can't
> be handled as a DJ receiver, and all the quirks I'm seeing here are
> making things even worse, with the "as long as I keep [some user
> settings] off".
> 
> Bolt in kernel was adding in 7.3, so I'm going to revert it now, and
> we'll have to have a fully working plan for an eventual inclusion in a
> future kernel version.
> 
> Cheers,
> Benjamin

I totally agree that this is the right call, despite this being my first
kernel patch and I was a bit excited to see it roll out :) But of course
I don't want my first contribution to be problematic, so I agree with
reverting it.
For what it's worth, I checked with my G502 Lightspeed mouse, and it too
has incompatibilities between kernel and userspace, but in a rather
oppsite fashion: When "Scroll Wheel Diversion" (=use_hidpp) is turned
ON for it, scrolling stops working altogether, and looking at the code
I think that might actually be true for any device that supports HID++
function 0x2121, i.e. the more modern high resolution scroll.
So, having an incompatibility between the kernel driver and some Solaar
settings would not be new to the Bolt driver, it would just be a
different incompatibility.

But anyway, let's see if Oleksandr can confirm if the issue remains even
with use_hidpp ON. If not, then I think we're hopefully done with at
least the scroll scaling issue, especially if more people can test as
well. But of course there's still the other issue of not being able to
distinguish between devices.

Cheers!
Erik
