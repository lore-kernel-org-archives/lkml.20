Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577655;
	b=buTaSJUmF9/rsJozpMeOgnKk+O+3/zdhJwrhpwOdtVMqcBQ3UImMlUoHp87DPpOsqzLm
	 VGh1i2OY/IFeZ0uWo9OHSBKtapO8KntLIiIF2EGV5WE6V0ztG8qhDJ1yn+ud5zCDAopN0
	 oDdADUJ9wj8KtAimtIMZrecvRLSutpzYyLQ1g543NBff9clTp/LCb/7PaogDyxW4lrO38
	 dWHsAaQEPxMzTSuO778gLWCdVk5O9uQiCK9e3BCE0NO/lDGf9p5S5TRtC9hBdnoIUz3N0
	 ZVtnAo5dGaYjOv02A2ZNk4uvqStn5Zc1HFGhlo+lE9RzKSti8so0G+boVYAMIU80QEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FbF3paBbiX8XkFyM35gCpVzdlhaapsOpxybEvJf8GWc=;
	b=5LqociDjyeTbk9IFk90da9fsEn/IDF55AAoyDhVsbkE8Jzpq4nADCNZM9TYcMfcecmKd
	 R86e/uxVhPFKX0QZUHCYuaTYNA3jwX3h3qtwRQTqVzrs5ZRNgGWk0W4MoCubvulSkAJrf
	 3KkyCjqebQP/jWfd3vfLJIU4X5XRhdhiC5sMSMhUap/m6JkpsJ6DVbPVLbLPRyGIGOxuD
	 Aos8TffXttmw/mBVQ4MZ89gO8xVPPKgsD6QFLRlfpWxvlJKaSvFD+bLkV9DjL/JySp5HJ
	 rqfYtQ1f3fkj2vdESFQh8nuXsThjKpFGgYc4cWpRd8LJPH95+SVyvtaMWY4q4hOXHHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aDNxCbxs;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aDNxCbxs
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso354794f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792577653; x=1793182453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbF3paBbiX8XkFyM35gCpVzdlhaapsOpxybEvJf8GWc=;
        b=aDNxCbxsF95zFiMewnev/K2wny+BQRzVHIbTcBuDM2HEZXVbqljneyTqsFqv2NhlI1
         uckFo6StYC8yYzlP/0KRMHtvTxqbhfyLGJPsfFPv50ugnopyY0tVBUHc1G4hCIHoOQJz
         DzqPGC8zaBGs3dvIqsQV2ONVvmiChBWm9lMcYGjwjHaLNwJ3ULi/pn0p9iaL92czfDyx
         ce3qGX77LSA2lhmZGWZgbsqaNzChSDmUu288/brmzUcQx/qrdzSGKU3GqJqwy/8wVzoj
         WBWVn/qADVcQJwxObKdKelppiMLMgFfsOji3IxCM2qg3WNRgbNPjWlfPMG055ne50dbF
         VSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577653; x=1793182453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbF3paBbiX8XkFyM35gCpVzdlhaapsOpxybEvJf8GWc=;
        b=xZvAvscs8uSyj9yUGIkMy4fNAgDmVYJehONYIKBXc4lYrcXjldTeOxcwy9t/9iBhdw
         UdqyutRWllXxcmgwLpZL791p2SCCHHdGLBOMAT606Ak+hDa9HKDQsR3X31TartQMennq
         otkg509FBaAzimM87L8EroGeo2ojwt3jM7q45xdlINQW0oz76JS+Xnewmg+CFQ0UFGR3
         eQDyvsTp1kjKkO9+wQ/mjcVqnDcNAHe2nXjw6UdC6JHhydeehD8q4z4kE/t/bfQ/kF7/
         wsvwEoJdGonCy4GWxdhgcBiCjBZMs1pUfbOU2XlZEGd1GPiXyl7U/ckJqHLFTSkaasle
         6Znw==
X-Forwarded-Encrypted: i=1; AKwUvBwdiSSv53SHSdcxkWh/U44JYzJlaxafdj3XuYip1j7csZ6ds9wlHjfKPi2cB+BWXRkFF9tEc1RpFTVzAok=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDsRXfQpkAX7dYZMfG66Ssa/Y4G9OjJ8CbgrDmMoD0IpqWRHh2
	Ho3bF2qV1M2xK3TwyYhXN68VCFVrBEVWfkQMXvqtyJbJF5lCBQzP9mU/OhL+WA==
X-Gm-Gg: AYBFou2v1/lMH35aTKFrbySCQx+0fl5F+morv4KW5kSiDUiJHMQohSnADTYFiYo1Gvd
	jFUUKD3EWqIlOV0xSxVLsju8qW3/Ho2QBW3FYCdZuwLyOfYFE2WA6m/sWQ7BnYuapocYI/VKKQV
	/tC0jMxtr44wLpT+ETZK23VsaFGAAVeCFvjBumm8t6RCMr/EXOs9HhzwJFWcv6I1nvQ9LTwPcWr
	TTqx/CyGvjHiK/CTdCYrER7357g6uTfBq7nbarMZ9aQuh/rBlgX3dTd31xh/WtDpbehRC/9X6up
	Xamlva2UwKr7tu/lzEqVWBEXmx2XInnzppVHpQSxebCy6eGvOeTOzU/SwYElpZfX5yHa3qjx9ZN
	6s80Tjj2ljwretxZ8S/XJKjhp14zUWjoiunHF1z+RLjyZHA4U1PG4seJq4jYb8lxSp/cksJfEFR
	3hYEhmwj7qoNrK4iDjM1s/j9OFWi2vF70o3Q1KGQhNZqJYx4taXiEnxGXUtFwZGZAfai6x5YW95
	JaPT/NKosmZEJibvzey+q7ODegag82S9rHHLhIOh6xkKkdq8XrHu9oZLOMxMlNNjQW6PPi3iMWQ
	N527vq2V2mLNCrfPq7QbvA+Go072d/9xZwmKo64QPxM4z5FoynWa68I6XpWXNhQw8FsjjXidiLa
	WgQ==
X-Received: by 2002:a5d:584e:0:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e264f32edmr2988725f8f.38.1792577652829;
        Wed, 21 Oct 2026 03:14:12 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:e71c:400:f186:eea4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584c3b0sm5000928f8f.57.2026.10.21.03.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:14:12 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v2] wifi: rtw88: pci: wake the TX queues when the rings are reset
Date: Wed, 21 Oct 2026 13:13:56 +0300
Message-ID: <20261021101356.1976617-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <3c588aeae8f74a8caa39aa2852bce437@realtek.com>
References: <3c588aeae8f74a8caa39aa2852bce437@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I discussed internally, and we suggest to add ieee80211_wake_queues()
> and clear queue_stopped flags in rtw_pci_start().

Done, sent as v4, with restart_hw named in the subject as you asked.

One difference: the flags are reset unconditionally, the wake is not.
mac80211 keeps one non-refcounted DRIVER slot per queue, and
rtw_hw_scan_start() takes it shortly before it reaches rtw_pci_start()
from idle, so an unconditional wake would release the scan's stop too.
This does not resolve stop ownership when a ring stop and a scan stop
overlap; it only skips the wake when no ring was recorded as stopped.

What is measured and what is not: the controlled A/B is on v3. Two
builds differing by nothing but the patch, the ring filling on its own
under load with no TXPAUSE write, the restart the only thing I
triggered. Unpatched left the DRIVER stop dangling and the link dead;
patched woke the queue and traffic returned. v4 has not been through
that test - it sits earlier on the same start path, so I expect it to
cover the same case, but that is reasoning, not a measurement.

> Another test is to remove/insert driver ko.

Not done - my script stops at iface down/up, so it has never run on a
live wedge. I am adding it, by hand rather than unattended.

> (I suppose you did these tests without changing any behavior as was).

Mostly. Most captures are on the stock distribution driver. Two builds
differ: one carries a five-line debug.c change of mine, one is the
c95323ea9dfb revert you asked me to try.

> I need your help to summarize the dumps. I don't have much time to
> analyze them. Sorry.

A watchdog takes a capture when the gateway stops answering, reads the
TX ring indices and the mac80211 stop masks a few times seconds apart,
then walks a short recovery ladder.

They fall into two main groups: stalled TX rings, and a dead link
despite continuing ring progress. In the first the hardware read index
stops advancing while the ring fills behind it, and in a couple it had
filled and the queue was stopped - the state v4 clears. In this group
recovery was observed only after reconnect or interface down/up. The
second group is the larger one and I have nothing for it; that is what
the monitor capture would be for. The patch does not claim to address
every link loss.

What the captures do not give me is a case where the wake would have
recovered the link. The three with the BE stop bit I listed on 10
October are still the only ones in that state, and none is a clean
test: one had no ladder run against it, one is power-save-on, and in
the third the read index was still advancing.

Checks so far, in case they save you time. REG_TXPAUSE reads 0x00
except in the power-save-on captures. disable_aspm made no difference,
and it does not disable host ASPM anyway. The correctable PCIe receiver
errors appear on a healthy link too. The wedge also occurs with station
power save off, so enabling it is not required to reproduce the failure.

One observation I cannot place: HISR0 reads the same value in every
capture that samples it, with none of those bits covered by
irq_mask[0]. I have not established any connection to the link loss.

Two things in the dumps would mislead you. The fw_crash rung measured
nothing, as I flagged - those lines are my script's labels, not driver
output. And the "SINIF:" line is computed from the first sample only.

I can send you the raw captures if they would help.
