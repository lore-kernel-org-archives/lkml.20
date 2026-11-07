Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030013;
	b=l9DVv8cJ3kwtgj+yiSNMoc9xkllzRb0zX10V8/Zel72SPmZdpSm2Hp7+QktkC+WRS2g7
	 4jcDHK01+HWniRQ/to2miE1u+6MIjNd8sR+8MK+q/WodVLXOfN5r1OvMoWpMZlJKEKb/D
	 BJzY1Irm02TXhV2tfrRVa+HYdawsNuMTVK2rSMDLSC2+XWchRN9PlU2cIcbU3OZ2LbVWx
	 YW38+0iqvuv6dUYmVooc7eec4nCtLpRed24sF0AhyjA0xZYclY0guYjBSbCgdT9CCSNGC
	 jOYh5GBxeQsivwwJnOfdAvMsUM58yy+HZ3jIq0WlskREoTEF1z2gNOf2KVeWpClvZzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
	b=trogT9n/st5lRHkQv0ncIT+NlKdfMB9V6jD4t3OQxS3wlEkL+NIbp9Zepb8mzFh2H7sV
	 fJCOIubX8peyfZ0v6dHkmNhBHDDXR6IuvChEeaDA7QtIWgoXHMHLRg7odV5hUWAYNs5Ei
	 o0hoNrQoWrMITfDM+LiEcHI7PailcAqdx6cqsbaaRbPq41exzQyygELkQVGaUOUWpB9EQ
	 K9w8XKafGJr/vfjIedtZMjyXI/r3h9Ngh31VW3nFs/3V1v2NFCFSA++5Qb3tjSYAElcDS
	 uU/pusuL2UM8940EJkz9+Qf7uILyx2/G9mqtyT6bbebiGxmXP7pRA/5m3EsRmR3Q2fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJWcWfEL;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95F606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB95F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJWcWfEL
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed0e2015aaso5292625ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030012; x=1794634812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
        b=sJWcWfELjWnmPKnlNLqGiGA9IT8I/5hSE/TtEHyDveF88BOLxQWRKZTy+XmrZwfOVj
         6SHdPkiKpJxyGVajxyZXDAJNOLm1YneO0Wsmw76rvTlCP6JpJq7kIh7hKUE8w9LH3wcl
         oiErSBdoBO2Z0m57+3+ugZtOv8Eo+fy7TevfteP2bg7wzCKQnsvYP3pvod1iTxvMPx1P
         HxrsvidioOJJzf9bQmkzf42dLqQuhAluXTAhswCBjZtCamyB8Kk0e1sbbH926CpEeIvi
         vwIM8rzJ+O0LXNtL77KfGuuh4KESAx+F6yC9WSpVYk4BA6x5+H5UmkRE3gmN4tTO2vGc
         pYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030012; x=1794634812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n07BclH5UCpfeNF6l7UkFRCz0CaPQfb02nzFrlh13A8=;
        b=P4hcLcSsBMUpf8cA+FXRkGSbPCVuFQsNyqZJsBNrvhKOvwH5y/pB8apcIbwH7GP4ZB
         3fdfiokOfY1vX31bPsJT5AknLfv39tak8k1RYuFc+FFkytJrQKTCQZA7na+l5naTxVy4
         3mIbifTbBPYvwhuOyBC2YeQesazOVkYuPbkp172Izj732oJIqhEGGtR9tiNMIyG2Vgsi
         V9zwatE06nsTGyGbgfk9lzNZFS2b+iEb0g9yv9D+mECCZvqvPdgITh7pGayny/onWkd5
         g2dyZhyIj5l83pjVX0obDNywELqZ/ZrmV3/USCoKNiLu/mIVIPRA7ON9ZmXcVq4QfEyC
         XdLA==
X-Forwarded-Encrypted: i=1; AL+hErFG72bzJFp7pH37oPBnop0YXM6d94mE/+C0k9KVg8rvV8syY4umCfZOo0Rk9UHSzGhWkERdUxZTQUKAdyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TimDIdYovnVHduXxdNxR5BULZs6jJoW0ZT6aeKrPddiNCgU8t
	gwCGHnCtYi0OpcBgH+hh98Wp4F7vSTRBBgKrU6gtAwxkEf//wjaOASgz+FtCnQ==
X-Gm-Gg: AYBFou014CU8Dfz2O1kZlzn10MMNgkyWgiQk43TQKgbnf2FUHAhEITNgnTZQN0dL7bn
	GzSpDirPO7uKdABdl6E3y5XlKAHm8PODRy1PbxpcMXlH5MIcdimtfFyPLhqd7NScBR/OYA6WuJI
	+4/wV6blOOarNO9waVT+2c0StVAY8PJSxa7zpbTyH++qKdPOswBxz16aQ1Bq/gKr3v1BonSZd48
	skZW8hMtImz3N51aJKE0gumwqYW9oS3nBo5ghTU4t5Ctmdnjp9asxwcZDETYVTq/4NTdLFz7SCY
	nbp0dk/cIltfKvAnXKV0LagSJszlfc4ZNk4Q3vsLYN2zjYa6NsZFQI29eAhvLNkXRIBZs2hJ8PY
	f+VAYpSWB6MoA7T4n2zlJceV4oxYrT2yV/QUYqiKDGW8l9ugVeknzPHjowH3y+0xo0rsyLfyoGo
	t2CBVuvYz8r9kLdYCRGTQp2laFgDxR61Xc9cAv6LdPUua6FbuVVqpKZuufVuRhlq2oOQ5vb1grz
	lrTWWkQp3LhBvkigOZC/ljo533wgkNALx9QImNHVoWRqCEaxUCOgTe0g7lOz0vRi0uajF/bFee8
	Z5mPBc8V/jsCSpvhuR4jzP5Sp4DGDwG0BfGvv6cSRSxRUW4mLkk0FZwo+Sv/5tx29yIZZA==
X-Received: by 2002:a17:903:13cf:b0:2ea:19bc:2fe2 with SMTP id d9443c01a7336-2ed404dd277mr59480405ad.10.1794030012078;
        Fri, 06 Nov 2026 21:40:12 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da11afsm10992515ad.72.2026.11.06.21.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:40:11 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 01/10] trace: add lock-free stackmap for stack trace deduplication
Date: Sat,  7 Nov 2026 13:39:54 +0800
Message-Id: <20261107053954.3075147-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103174905.701e078a@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-2-lipengfei28@xiaomi.com> <20261103174905.701e078a@gandalf.local.home>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

On Tue, 3 Nov 2026 17:49:05 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Let's get rid of using rcu_tasks_rude. If RCU isn't watching, then we
> simply discard the stack trace. We do not want to add any more code that
> relies on it. If an architecture wants this feature, then it needs to
> update to not allow tracing without RCU watching.

OK. v8 checks rcu_is_watching() before it loads the map and only uses
synchronize_rcu() for reset and free. When RCU is not watching, the
stack is discarded.

> There's no reason to use a rw semaphore here. Just use a mutex. It's
> serializing the reads of the stackmaps from user space right? There's no
> reason to have more than one reader at a time.

Yes. v8 uses a mutex.

> Instead of duplicating the open coded free in ftrace_stackmap_create(),
> move this ftrace_stackmap_destroy() above that function and call it on fail.

Done in v8.

> The above paragraph is unnecessary here. If you want to add it to kernel
> docs where it is user visible, then fine. (I haven't looked yet if you
> already did).

The docs cover it, so the paragraph goes.

Thanks,
Pengfei Li
