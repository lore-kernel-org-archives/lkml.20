Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519432;
	b=xM+Dh/5FRX6JpbHDMI9o5qCezi1Et2AKr4lo+D55VYDSiRmO+TTuh+/h+j278tcE98tm
	 c9h5RqUu0k0JSpJD7xUqMzr2kknFm+hwoiLK8RppPTvIAaoSrQ1frC9i3gG1RivelbZhl
	 3Z6NWYQo0JVnOfSJqN7MNDkzS+syPakBN1sXWMQtePrkRfuPqRFIdWzYCaHVT8prAanPq
	 rtbLygqb1BiPgVnqu2Mpam6HejfxDzbs/mdZou+ruyFM3+3SCQI1r3xFxPIAqkIzp6gSa
	 kd/f7hLagvc/3NNhAbjrDzkDQ/Ud8dSUPKaZl6axL6UfbPZKWEMzUbm6dQx5/7FH2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V4o4fO6pawc66cO2AMtXorTBoaiDvI8IA+mKgSBgKss=;
	b=JP5J/iJFXeWkzSdP46Y54BKgl240XVDkgKvwVmIPxYugZrpjEysSdPWEvoPS2UjgyUuG
	 lvEd5NdA6y8ytxZThKxqSMMTDrtASvcGDa5IZhN23Bftpxi4dGjQOd97hRdMv0kcC7CLQ
	 2RiOxRXclVSyi5ssGRbzjlohyxnItI3Pd8IdPFCeKd1Xx/2Z0LRIsGbmmObyyRyMiWtqj
	 gIWd53PNOnUfNB3VpAPZo2IJDV8IvwmZxcvJRFhHuOLSz8oKuk/edujpx7WRH/vATDV1X
	 XYwbMBLmi7zrJEcb9pCz8NnsQxpbo37BwE9HS/qQEKo8p1GVSJrUrjduO3jOvKuzptA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sMKaL3jw;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05499606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05499606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sMKaL3jw
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5e948e56af3so1196277e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519431; x=1793124231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4o4fO6pawc66cO2AMtXorTBoaiDvI8IA+mKgSBgKss=;
        b=sMKaL3jww4NESjfkjeOIeXNKJS+7VFSKVupBa0tO6e9ooQthB+ba5KWfOLNjEVfagO
         1OYZQ86JLxpBKETa13S40RLH7/YCqvXLKlW5Qh906kTfw5uEH/mNBSiga9P6G8M4qed+
         5a1i//A/9zrg2zryvzT685ZUUPauNuzL+wgtR+bL8LSGwrf6ceNVWj9cMShNog7nrfbh
         fZOpROdfmRNqbdUHPzxN9rFod6E4VGfMbOzx+kyW4PQCPAL3gvvR5T9tTn1J0RyJxxtU
         /xvpXDBjjV23lNvzUVDueIfYQjWHwytfuiQFbJby6Hs49o4VslLQEytfwbRCiOude6FM
         RxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519431; x=1793124231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V4o4fO6pawc66cO2AMtXorTBoaiDvI8IA+mKgSBgKss=;
        b=G5lEQWnm+rV+Pmj1HEFBZgVz/JNkrTeEDmAbMUKxVuRbteP3lzD3fhYsNFg7+NGOgI
         EzawexbN2DQC0LI7FFmVlh46HQRK9C9erI7q2BYOLQ2Nf5zc9lUJydsU6iI04X5O1jTk
         Nbun/JtY0VLd0l0QvAzmd9mw/eyZJJ5V8fxf8uEm7J0oVKMvB13iT6l/8nTzfh+7LFO3
         +qiazvxZA2FOrJlcttFFvO57YZZemmve8f/xIpgh8l7BX1F3KXTV8J0y1ONINWYAay65
         R25CSAeSOhjvjukXacwL2IcJ3MaxsLccpnkE7Ycllc2ZIUVWlAvjD7HJKZR5XTNKNZ5m
         Ka9g==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+QDQRQRcBlx7ys6+XD/G0Z1LouMSQ1dHW5GkI9ckf9ewWXSsJZBEY6Pj7Y/SfffS9RT9q4i+y+2uUHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyu75BlK+MWq0QLF0nV98FHx2goS3CJzwcURV/AHKN7mkJsg2b
	Zm4EL/NBTHDYtmLoKP/XhIPo4v5kJYJ/UU77fk9THQjrNk5YXgVWbvBg
X-Gm-Gg: AYBFou1Bu+EHldPbW/y9ApvswBeEue2f+LEqkr4GXI9blA6rb5vQunM4oq/fgwVeX0w
	jQMblgxDr2YBBOsRLHfxOaeXYnw5OJNdTjVvlhagPnfW6Iqo5lHHPxV2caQeedMLGTpCSH2lqcr
	Tau0ynQXCz4MY0T2GoIfVopj1Sm9wP0JkmTSIwdDC7uTIBagi9Ntem/02EBaHlT4G7F5jyAh6GA
	6Mw3a6Y2Cgye9mXxPj4XDe+BQ+G2RQXNLHyeQOCc2wPREHTAWUWyJdrpE/+ZmQq46EdO2JpFkXV
	CP1wSFmI862y7K561NnlPIe6Nnw5Z5gONenAxF4jhvuK3eSG93eXR/0kdsayAEgWmOIfo9H9A7C
	PI5N0hQQ9w9AZGfhCgyo5hAY9sNHP2HlUvbJQ17ht2FZX2WKCdNn38IBfRkeqShmBs4Dd7DanIh
	TpAPbLpteuBmr1kb2UnD1TAE01aKgENDHMR59YYHXHi8gqiU6WA8u+NmEUS/4XBBRcfwZEgk2Kg
	QO6DxDFje8KpfU2BmvUFBSTL3igK1q9Wu/ZKbjC1Ax3qQ==
X-Received: by 2002:a05:6102:5809:b0:7c3:fc96:fbdc with SMTP id ada2fe7eead31-7cc36af6325mr2439533137.37.1792519430791;
        Tue, 20 Oct 2026 11:03:50 -0700 (PDT)
Received: from localhost.localdomain ([190.177.181.23])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc923b39efsm25269137.8.2026.10.20.11.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:03:50 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: nbd@nbd.name
Cc: lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7603: discard power-save loopbacks after wakeup
Date: Tue, 20 Oct 2026 15:03:45 -0300
Message-ID: <20261020180345.13263-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8e57a7f2-6495-4535-af99-9abf5bcaa1f9@nbd.name>
References: <8e57a7f2-6495-4535-af99-9abf5bcaa1f9@nbd.name>
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

On 20.10.26 18:44, Felix Fietkau wrote:
> It all depends on whether the receiver has moved on and considers the
> frame lost, or if there is value in sending it to avoid the reorder
> timeout (which would cause some jitter). Either way, we should likely
> only allow immediate-tx if aggregation is enabled.
>
> If you have some time, could you test, which variant works better?

I tried, but I could not get the late case to happen here.

Setup: MT7603E AP (EcoNet EN751221 board, OpenWrt, 6.18), channel 11,
HT20, one Android phone (Galaxy A56) as the only client, screen off,
about -35 dBm. I added a debugfs knob for a loopback that arrives after
the wakeup drained psq: 0 drops it (this patch), 1 sends it right away
only if its TID has an active TX aggregation session, 2 always sends it.
Counters record every loopback, whether it arrived before or after the
wakeup, and how long after the wakeup.

Traffic was ICMP echo from the AP to the phone, 1000 bytes:

- One every 50 ms, modes 0/1/2/0/1/2 for 3 minutes each: 4-21 wakeups
  per phase and no late loopback in any of them, so all three modes ran
  the same code. Loss and RTT matched across modes (0.03-0.06% loss,
  p99 10-15 ms).

- Bursts so the phone dozes between them (30 every 400 ms, 10 every
  250 ms, 60 every 1 s, one minute each), repeated three times: about
  1,000 sleep/wake transitions in total and no late loopback. In the
  runs that also counted on-time loopbacks (about 690 transitions) there
  was exactly one, and it arrived while the station was still asleep.

So with this client the hardware almost never holds a frame for the
station when it starts to doze, and none came back after a wakeup. I
can't say which variant works better, since neither path ran. This is
one client on one AP, though; a client that dozes while traffic is
still flowing could behave differently.

Given that, I'd keep the drop as in this patch, since it is the simpler
path and costs at most an occasional frame. If you'd prefer immediate
TX gated on aggregation, I can send a v2 with that instead, and if you
know a client or traffic pattern that triggers late loopbacks more
often, I'm happy to rerun the test with it.

Cristian
