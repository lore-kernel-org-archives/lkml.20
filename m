Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99650364929
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621102; cv=none; b=LNR0ZU+SOfRAH2ixGwWRvc5ZdvCIZr5L4tkuSad90UYjOcWbRNQKttmRypqx8FR10Z9LpLVZlAskosQYnJadqJFHdxyXlTEpCncSaIfNYICA8h/VGEgfUo3Z9qRtdmTQisxN1pWHgjHbAtO0XGrA2MHdSAZTO3Gzm/dXIqoX8u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621102; c=relaxed/simple;
	bh=jcWgGXPavR4NDZXc348pVXSF9p4lh2CqNoZC0YX28IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfdLc97DxvbH2IQbq89jKOkpEO0MEo8L6ZRDJ4wE/BoL+0Z58Zm8lCEL5KAZStQTLiGoFkS1y2p1N4PfkBaz6e3V96/TQXDehe4Fv7vfT2amoKlZtiyVLHfRAUtAe9JdRWVNj3ZRFVj9kT35IVZ+VlDSHs86Enk/WJQe4nMHh6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSWMvvqG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSWMvvqG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so96222f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788621093; x=1789225893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Tg/R56zXVR2Nup96RdAYV8c+PyuQeFJYrSPcXGgxo=;
        b=NSWMvvqGARJanErDt2vACsLP+soKAYAvX9bcvceCn7MKSwZXvjq4ysW1CP2F1X5DhC
         mtR+pKkr7aJ7Vg3cD27HQ/doFez751rCkk8ozJKmveD+cRXsuxkTABSkBRPta2kGTAp8
         4E7hen1Aamuyd89qmoKNSZurgJ5SQBeeOnba+yC5YyJXbR2MWT2X/nbACtgZP4Vgidsb
         lHFmhhWUUl3zWlir2XF+nqHiev3dtxXlpQdXTulXg4FFZsXTabAV9NF4YLsTeHWXiqo7
         3nd6kQY4vShHirE6cBTg5LqOR1EX5z/350bzLCSABpdUqLcLxNZttOMXHI8pXxfWMagc
         PqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788621093; x=1789225893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6Tg/R56zXVR2Nup96RdAYV8c+PyuQeFJYrSPcXGgxo=;
        b=bQzt1hKVbRldi0LSIFJv1pEb2JSeJFeTJvNP/fQVAaduMhY237yVxvE8BTbwg0RPIG
         NNxR+mBSYCc5wyUQkFU/6kkSrcreHr0RRIBpi1zJfmu7o9klDVtsz0HVv3SxlC/UR0CM
         i4QkEAhtfdPoB1TWYSluU1wE8BwCpqaHMChUVVSfmK5nrhhb0/vMf/ipCg3SlEVzz1bl
         cL+X6tHY0HTuhlsL6fvGRpzgDsCgS9yUA+SqC01gLBbxe4EXL0Dzly31cULyOkp6i8Hu
         M3rXoN2OgQSEbvlldE8Dzz3svJk96NfXFHKNQz6hmUjoCT8dY6ssI1qkk0WUmXvQQAdq
         tE/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3giwvCe6lDyGyLZDZWYB5NvQx4YRxlXLwNfZULECwB79EbPbgz/MvXYo/77rzYCP/ShGjoCHmJplK3wo=@vger.kernel.org
X-Gm-Message-State: AFuF++nQZTB7iBhzlstvYyk4uOfgyn3X3umn+lu/WqVEmdljUC6CZZ+m
	9rRP9JqSjI2/RFyACELNKJKCpx7NCfhVOLCRG8IBJztC4OONOxeVjKQt
X-Gm-Gg: AYBFou2IGRnwzcRpcOGH442QBYETVQsicEO6PVZ+1SRfnhjQ+SqG6c/t26R21cctcPP
	ewAG11VtlUlWcyUzsq42zz1IL+ftKpGGwU8/DGdtn5hXl5YfkQW5lLDawY3+4EZCGh3YlZxJUhp
	Yd+s4M6F5B7dZmeBsdg5ekmr9apPqRpvad6LINYkyE+AaLZl9lcdI5KQbycJv1NaSsHy/c5lwpM
	ufT7m+B7KG2lhJICCSNjXRwHcWWAF4G1J/7V4ImOmegv1z4AiIfdNA1X/d9Av3fqIWg8CVwgRes
	ywx4xM/LHSdaVbMZ4kj3VSAsgup27O7wsoZ9gSPkK8s5lPJIp/lkz/gMqj9G8aGSpSvVL7iECwf
	bbpwkL6mpBttBfVMFA40RVh5AjrK7okeBaGv6IohtQX7vPjcLRPvioONwSEg1etS7Lc3dEtJIJx
	DDcLSQXACGDLGyjmJAhJv73/UXIKZNdDD/zpNlB6bZbQkI4mV68TYbVTRY46VZvL42+hJq1jhEQ
	vk3N6MjB+fWmqFwRPx+0d8cJtfh86Tx3kMcsvupDTJVsFPvQxyJsE8WrvM3v4+wZg==
X-Received: by 2002:a05:600c:860b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49d01dd6b62mr41625625e9.2.1788621092762;
        Sat, 05 Sep 2026 08:11:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B950E0061C002CD703C2CBB.dsl.pool.telekom.hu. [2001:4c4e:1b95:e00:61c0:2cd:703c:2cbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm11955662f8f.2.2026.09.05.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:11:32 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: search every core slot when a core is removed
Date: Sat,  5 Sep 2026 17:11:06 +0200
Message-ID: <20260905151112.8752-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apwUewaRnoTNXHCt@rock-5b-plus>
References: <20260904125936.26234-1-royalnet026@gmail.com> <apwUewaRnoTNXHCt@rock-5b-plus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sidong,

> I've tested this patch in Radxa Rock 5 B+ and it works.

Thank you. That is the first test of it on an RK3588 that is not mine, and
b4 collects your tag with the comment attached.

> It seems that there is other issue about num_core. For example,
> sched_to_core() finds core for sched with num_core and it could make
> same error like find_core_for_dev().

You were right, and it is worse than a failed lookup: neither caller checks
what sched_to_core() returns.

I built a KASAN kernel and unbound the middle of the three cores while three
clients were submitting to all of them. It faults twice, once from the
surviving core's job queue and once from its reset work:

  KASAN: null-ptr-deref in range [0x0000000000000220-0x0000000000000227]
  Workqueue: fdad0000.npu drm_sched_run_job_work [gpu_sched]
  pc : rocket_job_run+0x234/0x838 [rocket]

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Workqueue: rocket-reset-2 drm_sched_job_timedout [gpu_sched]
  pc : rocket_job_timedout+0xf0/0x1e0 [rocket]

Both are the third core. The workqueue names are its device and its
core->index, and it had been left at slot 2 while num_cores was down to 2.

The fix is one word, and it carries your Reported-by:

  https://lore.kernel.org/dri-devel/20260905150432.7477-1-royalnet026@gmail.com/

Same test on a kernel with it applied: no faults, journal clean. It applies
on top of the patch you tested, since max_cores comes from that one.

What it does not fix, and the patch says so: an open client keeps an entity
pointing at the scheduler of the core that went away. drm_sched then logs
"not ready, skipping" for every job that lands on it - 25006 of them in my
run - and the client waits in dma_fence_default_wait for a fence that will
never signal. The board stays up and the client hangs. Making one core of
several safe to unbind while a client is open needs more than a fix, and I
did not want to hide that behind a patch that only stops the oops.

Thanks for reading it closely enough to spot the second one.

Igor
