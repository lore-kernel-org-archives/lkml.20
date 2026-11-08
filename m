Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176144;
	b=m5fvov9WvpLPbdpwDfxitA/+r/je3baHpYGV+qo2kMhzeFAegkxdpAD0kf7H/O3325nE
	 7yjYY223s0XdAiUSqvTfSLwNZCwNc1FRGZdOhv371b6ejDY8lmoE9zlZrKfGN56GpA2sN
	 ykOWDott15K/VK79uywOFC9tiR1ZgIfadxShZF86HnKGm7neS2cG0wd6sbN/3oODY3PPR
	 2lD8wO96HlSh03Y8dT0J9BxMMwF4w9oGKQYkiLv1aKgAY6q/loL3TBqW3cXvT9UZG/TtZ
	 k/7EUAnFVOKbDv/I9v4BTb0XCRGqcGW8H2zazEsctmDQMtZo3+EIWZSUTzCZnvDhPOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Uvr+F/2JK1AaGLCznMP5hvSKtAyjP1MI/tlzlJAmTmQ=;
	b=TUPs5zKo60rR4y78QEbxbGC3jrmhCScV6b1S2XyqxIt31b3uY6EgypDHjXPuubALDpbi
	 jcSJOglIl31iCpOKZUr7F/nL81VS4vaALeUmq/hjflTmDQlUsqgrav/5+ztN4OSiylqxq
	 Sl8sTRvqj/gpNu07t4Xg5O2S6NNnwr7i/0LVBfETLp2fTyFkJeUoEISjQj+B9FU0ifEuV
	 y+ilSyJ/POJvHehTIKvfWChB8sKHm0w2xLkDOCQklNTptEv8htWzwmJoxidWqtmseJ7td
	 XVkTjQERJgPC1hw6SMqQDs4vTOokgWQlfNxmwrcUnAhIzcW5X40ayewXT8y4EDS4Spw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jahs.net;
	spf=pass smtp.mailfrom=jahs.net;
	dkim=pass header.d=jahs-net.20260707.gappssmtp.com header.i=@jahs-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AGCI9h3L;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966B606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D966B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jahs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jahs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jahs-net.20260707.gappssmtp.com header.i=@jahs-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AGCI9h3L
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a208d93758so2752215e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jahs-net.20260707.gappssmtp.com; s=20260707; t=1794176142; x=1794780942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uvr+F/2JK1AaGLCznMP5hvSKtAyjP1MI/tlzlJAmTmQ=;
        b=AGCI9h3LqFo/LTv7FSC7qIhFizMYFvrWo4Q28P7cagweU/yIHSP1hF4RZH0mMHNI0s
         l3/7cj30FwDvYGAgAyV7hOMA/I/DARh48a5+puSUEWF02JMUi+g7ugf3pmEXn2OSLysj
         8ixnhAeOiijBeV6/vGJzbydEgg36w9HoCnz/ApkVsLPgzdxiNq+vuT7Lc2kxI9wp0PVw
         Z++z249mvd0vNWcZKPNCxdsQVMt3CbdnSswbf+/6NRj2K++KrDHSmYRvvAiQfrBAHasf
         WH5EITQ/JZzLPNCCjm/6ckUpS/z/jLD1FTu5wZrPQsKtCcuCqyPuYgvSWbrnkKH8ktla
         e5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794176142; x=1794780942;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uvr+F/2JK1AaGLCznMP5hvSKtAyjP1MI/tlzlJAmTmQ=;
        b=BWJsI8ftMqbHn1+AEci6fRRlLUvkpB0rPtEkjSp/XIxFqznK0xBZqH22ugAApFW93j
         4MZ6Z5qRxRoEJ5dZnv6uFAZ0W3W+sX3f7eIqSXxQGiVDkwmmoCGKQ9q9b47UfPjGP5wM
         dAm0QZcSK5o6IKrQcmgnSSVVsSfjXc7xkHd8jrck8xhf/xIWIsXsQq2sm4Sfy8183OaY
         6XIxLYDyL+kK+biYSox8y1axzriMRFs9HAdb1FLBGnpp0s9ujgwJitSiYnHLb+dpAXxi
         pzg2gziQvNxqfALQ7JnIibCFNOrlq9prE5O4AZFagq+J0NU7eARFuQqM80Qvx3rt4YwO
         U4HA==
X-Forwarded-Encrypted: i=1; AL+hErFlDR3vV3PZBAsfFQfkTbLd+eaqPafZm3muZZjAD+3ADhkC/fSrF+9TjoRiP+dm4nkONGcwLJEl3pqd4oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R5qQw7b8+6qoFnCgzVSPnu7LuREvvT0ItfY9WvISkw1KnZxT8
	VdUgoXirEBRRS+oOEFIAE5OH7gwQCfAsWXyoXaT0P4bwbRC0gcKpHyAD5+Rd5pQgHg==
X-Gm-Gg: AYBFou1c/rfVIsX0OKNa6Ftob/hQSXxilhPJmmM9mQDKxa+Iz7fa+G17i6EYjA6QmDf
	TGFflykbcULaV9NSHuwoDAW42NvbAzWOo+hDRzma2+R6/io3ginP4Oot5OGcJMh2lxpITz8h6pq
	PRxP8M6HjS3tKHQ5vTERQDaum5UYfxSTJC5FYdtwWIiEFX+E38MjJGzMrLazbV/Bh6VtA+zRi13
	cGQgB6ZkS082JtEAooompRHZkZdPzeiClF8hpX+Hdq4uCLt28e8bzbUXw4lbIWz/H5CksSqoIbk
	khO9dWMlPUcWbPu0zp6m/GNv2GNrC4KtTDNl8qcKMei9xDaZW6oUnKwilOPwSzIsH31YMZwEeiQ
	zGLCUou0O5pJFTgAJGkBAS6mFKier7BrqQWCQVjk7njA3TVEaHQcYNCoWlcD3k7CRMEDULdG8WK
	PWg2GNuTZdi3b0HGItIrtUyU787DABzH7pI2uqq8DeKVmgtkGguIVQrNYIPPq8kY9dvtai3L1dy
	JYrEhth2R9qoFYvKQGEdqkEztoYwHZi93CXYDmuAmGzD0YEYy4TVXu2zc7t2RgdX5Jnh9mv7Wdw
	w+GTSbbhZ8CjjNLYZT+kWZSpLkJgPHPatrJG4dOO
X-Received: by 2002:a05:600c:4e87:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4b963c8e6e7mr40922425e9.22.1794176141294;
        Sun, 08 Nov 2026 14:15:41 -0800 (PST)
Received: from mbp2019.tail53dac2.ts.net ([2a00:23cc:b5dc:701:a5b4:75a8:ede:9f7e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm76735525e9.0.2026.11.08.14.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:15:40 -0800 (PST)
From: James Skillen <jahs@jahs.net>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jesse Zhang <Jesse.Zhang@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/amd/pm: use the VBIOS trained UCLK levels on the MacBookPro16,1
Date: Sun,  8 Nov 2026 22:15:38 +0000
Message-ID: <20261108221538.32132-1-jahs@jahs.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CADnq5_P5Ly4Pb8WqPaN28yDHG8jSjoEHAfDKAqSgTrSj14Pr1Q@mail.gmail.com>
References: <20261024162109.307247-1-dev@deq.rocks> <20261102232450.61301-1-jahs@jahs.net> <CADnq5_P5Ly4Pb8WqPaN28yDHG8jSjoEHAfDKAqSgTrSj14Pr1Q@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alex,

On Tue, 3 Nov 2026 09:35:29 -0500, Alex Deucher wrote:
> Can you try this patch instead:
> https://patchwork.freedesktop.org/patch/765668/?series=174386&rev=2

Many thanks for following this up, and for checking with the Windows
team.

I tested v5 ("drm/amd/pm: defer UCLK DPM on selected Apple Navi
GPUs") on the same MacBookPro16,1 (Pro 5300M, 1002:7340 rev 0x43,
106b:0210, VBIOS 113-D32207P1-019). Kernel 7.3.3 plus the t2linux
patches, v5 applied unmodified. Its navi10_ppt.c differs from
amd-staging-drm-next 178d00b only in the error returns of
navi10_force_clk_levels ("return 0" vs "return ret"); none of these
tests took an error path there. Panel on the Radeon, dcdebugmask=0x1
as before, and SMU messages logged with
amdgpu.dyndbg="file smu_cmn.c +p".

v5 works as described: UCLK is left out of the allowed mask at init
(SetAllowedFeaturesMaskLow 0xa7dfbfb3, stock 0xa7dfbfbb) and enabled
with EnableSmuFeaturesLow(0x8) about 1.2 s after DC init. It boots
cleanly, as stock does on this board. It does not change the UCLK
levels, and the hang is in level 2:

                     UCLK levels       UCLK level 2 pinned at idle,
                     (MHz)             ~5 min after boot
  stock 7.3.3        95/496/736/750    SMU no response after 3.4 s,
                                       GPU reset fails, machine hangs
  v5                 95/496/736/750    SMU no response after 3.5 s,
                                       same
  v5 + trained       95/496/598/736    ok, also under load (below)
  levels

"Machine hangs": a heartbeat sent over the network every 5 s stopped
within ~10 s of the failed GPU reset in both runs, so it was the whole
machine, not only the display.

v5, SMU messages around the pin:

  [311.750451] smu send message: SetSoftMaxByFreq(27), resp: 0x00000001
               in params:000202e0
  [311.750635] smu send message: SetSoftMinByFreq(26), resp: 0x00000001
               in params:000202e0
  [315.231058] SMU: No response msg_reg: 12 resp_reg: 0

For the last row the levels came from a pp_table upload with the
umc_info training points, the values Andre's patch sets in the
driver. v5's late enable ran again after the SMU restart. Forced
switches through every level transition at idle, level 2 pinned under
llama.cpp and memtest_vulkan, memtest_vulkan with forced switches
every 3 s, and a load run at DPM auto all passed, with no SMU or ring
errors. So on this board v5 and the corrected levels work together.

The root cause is in the board's VBIOS: its pptable UCLK levels
(736/750 MHz) don't match the umc_info training points (598/736 MHz).
A corrected VBIOS would be the clean fix; failing that, a driver check
that uses umc_info when the two disagree (a no-op on a correct VBIOS)
seems the practical one.

The testing above and this reply were prepared with help from
claude-opus-5-5; I have checked the results and the text.

Kind regards,
James
