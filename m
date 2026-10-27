Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092396;
	b=Cxl/dskLWjste3gV1cb1GfDrnE1Aq8zqbv0jjiklgTh8K0ZOwmYf3Gl4NM4FwovkeF3Q
	 htJyZUYrqBDG2toZRVv6l3WRcdlDWRJ5gDMtRZFFSNjRpySDEv+A4TeprOsD2oDjWV1sn
	 DWHSE0AA3cXZHl2ISXHod1/0zy4OkTTepIGPw81nHz+u1scX8xyub5MAY/+LuvcuYFObY
	 +xfuxEFeHGrzBb788Mbxfho3Z00daHI3GVpe3g+8WbJBf9o34V3YdSrIwGF1on34PyGT4
	 GWxeZlwOcuYNhQTWlBc/ZktLxHyLybgkcNGjFdqcM05Yh2865RLohgWFEv8+ujZsrtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RI7lOu4cwkLNhIfCj4KVRkhNhnRXK1KgWJIU3o3fGYY=;
	b=BHa4iXJWf4+qc9x63A5aHV367+zWok4sI8JIebREGwSs0dWykxmxdS38E+8weAXkhQb3
	 RwT+Q/9viSpkA0uBiOJ5CiK4GgoNrFK2NJChLKBCSudmm3bi4KrQ/w94ak86QjoU6SU0F
	 /eDoFR2cSoaNrXBqHCS74Al/3MSe1RRnzeFpItAAxXq8zG6RYE3ESzj/bZb78grulNXsW
	 jZkAat5RyoiWdvtYTHBtSm5X1/01dF9gN8aO81ctfwxNQQip9YXyZ39jNIwoyOmajhXl1
	 Z3YlaSIXGGZJ2RvU14WLEyCjrOpp/mfzUC/wmoVPTwdqKL1rS0rJoPStxk0vJ9DkNFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="r5/+lntm";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A1606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88A1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r5/+lntm
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14602155e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793092394; x=1793697194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RI7lOu4cwkLNhIfCj4KVRkhNhnRXK1KgWJIU3o3fGYY=;
        b=r5/+lntmV0LWHi4EUnDlg01N8ivpv919JLT+sz/G4ZlbBg63OR9FoWccvkAKIhcx8i
         hHTTQfIJusyCmvr2bpF+k+5EJRmBR0xjrdtOkPZE8bI0MnzdvkzPFmQyhIjvaHhXuH+f
         LRqqNa9wdV6FyLIbp5DuqVb6oO3wT+GyJ38nnh6KslFa3ZpI52dGxF8YOf8lH9r4W8CG
         rBYIZ/u5fH8tJw4PZqfde3viSNtoZxltXXlcXMBxkWgQBKOrdw9mDNB3APSm1OTFaS6X
         X8kG9/TlV3VGiyks+RxJgTaATLcU+ATveKHE8iDNeqf+c0aAO03sq5+vZAKR2R83t/S4
         QOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092394; x=1793697194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RI7lOu4cwkLNhIfCj4KVRkhNhnRXK1KgWJIU3o3fGYY=;
        b=mO02el0n3pb07N1+FEBWdv5wUzxOk0meqsUTYqe0l8Gl3YQLrUczyD5vIUhRYmQCmW
         PDjvAwPeA3bo0FqBIUB4eeFwzTeyLP9cdKe8ACVwhq3oiftjwioDX4CndL39E5CNwuI4
         2oZ5VWLnVQuFrnKzZLR01eMPFrt+qP+5na55rlUd7qdPXi0UzWGLFdkZ+byfKqfplnv1
         wvkSfkPbQDWh4VDy4WdyEmQJb6vBLfiJbXffuAwV9lX8VKUBAu+8InVct8S43yzcGfvh
         6lfLAwVdXfSOT9KNCadPu6E7k/qZ5UznmUVIVs5+QV+JgfypWAFBxr4hYofo6tF3TE/O
         +z8A==
X-Forwarded-Encrypted: i=1; AKwUvBy0vWNF7ssJp0bGVZEDPm7o9HsARTIv+rEP5y/NmEbvD2tRkQGtzO5ei8TC9sjRK5MUFecktg3P4G5ki8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYICEu23YqG9LxuLbYA6+NjiUF8o0tENbQ/G8iPtXRrsJP0zvl8x
	vsL+KP7Clh09eTxVRbBV9B215RVueJPR6ytOIzGiqgHlTgW3ZxZfMTUM
X-Gm-Gg: AYBFou1txYqmj9rTzp6opRVQVB+H/X42TPQLYy8gJTpSFg3xMx9M8axryQ+rVW9SABx
	DOj+fNitnsqvv7fUtPorLSY7WtROjp1mY2D+cZ7eR5VGtBeJ0Y0lgZPiNLZco9H7U2V05JeYn0X
	azuEZ0Hqn7BiFm2gBC4Jc2GAug35aIfV254Pz5i8UWrX+lyaN/tMJm4fEvAaiDqj/SbvtFzFb3R
	42eypJZpiMm4rUC/An/53T/aVzTFND3qe5i3LqqKM56KgxnA3L0AtDOhA5lqMEi7hNo3erZFVxN
	Mzw2tr9IKjmKSzYS15oeJHvjy+WcQXyF+Qz8TEJOEb9W/M4fF0HlnMj6pW6XgCD/lXFGtmdJ/Hz
	zAxsKyotFE1UwE1TGGwm0ncHqWfOFZaxpE/lximuAKRDMKIQNzvxvSp2WcF41gyDNYyLieFNxYG
	bx4WhAeBs1J9MGRwL0FyzetFqU5DvNWNqDrqsrKpCViMpwEN1AkdYwRI3d/eVkby1EfFgC/EuMH
	J9YHA0Os9eehcRMuGCM7Eg09sLu5hiseWHIfPFXf4BoxzX09XDsHQXv9Yfww5uxi7z4lEqb+Bgv
	v0FBGyA=
X-Received: by 2002:a05:600c:608c:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4a77f3f7008mr59179755e9.0.1793092393953;
        Tue, 27 Oct 2026 02:13:13 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d9280sm249768265e9.13.2026.10.27.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:13:13 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v8 2/3] wifi: rtw88: support channel switch in AP mode
Date: Tue, 27 Oct 2026 10:13:12 +0100
Message-ID: <20261027091312.1421798-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <64d3a24e0afd460db4a182bfa2214aa0@realtek.com>
References: 
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

Hi Ping-Ke,

> During the WoW suspend, I think AP stays on original channel and sends
> beacon without countdown. How does associated STA do? Will it switch to
> target channel and disconnect result from no beacon?

Yes. I tried it with mac80211_hwsim on wireless/main: the station
switches on its timer even when the AP goes on beaconing on the old
channel without the CSA element, and disconnects after the beacon
loss. From the code, only drivers with abort_channel_switch (iwlwifi,
mt7921, mt7925) abort the switch on such a beacon and stay.

The AP stays up during WoWLAN only with AP + station on the 8822C:
WoWLAN takes a station vif only, so with an AP alone rtw_ops_suspend()
returns 1 and cfg80211 stops the AP before suspending. I checked this
on an RTL8822CU during a countdown.

Refusing WoWLAN during a switch would not help the stations, cfg80211
would stop the AP as well, so I would keep v9. The resume path does
not run on USB, the device is unbound during suspend; an 8822CE is on
order, it takes two to three weeks, and I can test it when it arrives.

Mehmet
