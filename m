Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716266;
	b=qBS4e2z10rDn0SVQ/avFHAxjR6lgP3+yokgGPSwy/KL3DwjDvBa/s0gmQ51ZJYwyTl3z
	 Wgd6ysc73LKDItET+yq+WQmJ0nSYKJubVpInyEnm0iY2TSv/Vxwz5wT8j1lxjO4GxGjcg
	 HqZKkvlBF67uCOSBaCRHg5Eh0FrBdqKkp1MEVRft0KEdb1p7onjb5MhduuePDly//rTXe
	 p/lbgxZuDcMPWzplRIzSy0KAACz9ixtddL0TEYP2TZ5fjAvZpmEhfkThYrJ7Vgqpaqk5+
	 JpGWQIxl81dvKxsk9trX5L2Emut1FJVeVSlUIy/LUtsGH+uIOl5Bk6w+/H2N4QFr7sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=SYduxspSDTHUtiOUros2j7XWp+mQ+wFfNDgsc26Ob+s=;
	b=frUyXxfxEHC8DBndR+TUOe1176nB5K9S3ijEejUSI3FIeP6DEU6Wl6tKG/Q2KOpTOkZx
	 3McgGckH2AFpmaIG/5snFRMVZlyLnrNnJIvFcfhb6KOc/vixlW/kOo5cziSGNa8rv6KYy
	 /gigVFqveFGjAfB+s5pG7e7zsDbbBmam1jLMjjUu0urvtjSwyzqQ09zio9z/xVr4uDXek
	 RlyTQj13oRkQBUDi/3pMRi/s90kJKccchpwOT1qt43xVz5fajbBj0hSZt3IRTO1W6NRl4
	 1KOJTS5IfSxKorB6vDxBjejvtA2u0gnurn6rKtUkcoerX9AvNFENSetEIjwWmJ40TEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R3DlMsAS;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840F2606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 840F2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R3DlMsAS
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so8730381c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716265; x=1794321065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYduxspSDTHUtiOUros2j7XWp+mQ+wFfNDgsc26Ob+s=;
        b=R3DlMsASMzn4n6kieUFPygn7aJzjGIYKUpPFx6AKyb9gYPJ1fL/75rH3zUJXir9lQc
         ksD0u4d7+9i8torBcbqGgzwTfMNiNJw41Io25DYGqkJIbbIpcHXpWQnjW3JVshGL3Nhl
         vomuTJpqL+dCtrTlphtyEI1/OLBjySgSb3sM3VzDFGeECi6lvfhloLw3w0YgLQ3k9kIm
         r3LjCNFr4N84xBhiT1HE9NnsRO3/8I/ltD1IoY26UOII8JAOtR00xWuGj9ob3bR76Vmd
         IwXK4MCdlARs0YwY3y0mjF9CXnJaMkNVqvvxQuTdAvMlrhtKXKS4NhbVsE0Mch7zxP6a
         xW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716265; x=1794321065;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYduxspSDTHUtiOUros2j7XWp+mQ+wFfNDgsc26Ob+s=;
        b=jzu04CIuUdX0mPHT0roc7TFeOfKmukypFVnlruPBkL8J6HcNpWfI5RsW/KOLLWC9Gn
         67Yzl0g3TDHWaFtt59xu/twmC6IJYlpnGKXK5k4qH4UzMkiX+yK1POTZrYSYqgqx1kLG
         e3xeV9Ln397Rx+I6BtB06dwIt+hovB4B9BWgQ1q7mzQ4loeUv9hXdrR7BOsSshdVTji6
         s3vRNYAdWHACZDx+5Zb+Js8sthZm/YD2qIOF8WGW9S//W131c8AQYZG1/N9qy0DTudxn
         FAhgJHjOV90j5C6B6EIjOHw0vsVQZthvIRrmHFYu3xP/ox3xzwPLka+H5KV9H8Nub73N
         99Fg==
X-Forwarded-Encrypted: i=1; AKwUvBw6ymE8ghlKDtzify4z+OdW6RHF/arckp7/yrjStzXfTCKWhXKxb5OTJGzqy5LEnCUG3l23Aqz7x+Q8z+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T7xX/5cmMq1ntin+lHxL0KTFIo6fmXOj9+T6Lc1i0lRahfzzf
	t1WQp1avtFPsD0jAYaLTrKLON/GcnI06ddrcOOIZhjK6paZKAJODtfyVwB12PGPRvX4=
X-Gm-Gg: AYBFou1nL2E23u1SuyH/HezJc0jikl89cYKtFew7+cnW+oVmzl43ssCEj5LLlkDVHxY
	OsDUxdeSp+bxgvXPlyKBP/C8BaYPZuc4a88UAmgDU5Am0CqppcZmAfDlc7Ap/tXr7pu/ECQHLJI
	GbcrQHyLoUs1mTgWHdGHOzqh0H4JWiL6S/Kb/kKaxtJvgNwc03+MCUalhvC8PnhkhdMk8R0CC7y
	ql5CnTLanod4yxomTW5m/MTJnZ9wL82GwZ2GW1NEXe02XY1kmtvEG+Z7Mj8uzfHMeZXjGUqd72B
	DYXuhjpEP9bB01w1EEM6kVC6/gyzB7sLxBAjMCo2iEuRHGJktMtMz8+aKe+L/qJAKUQTjXun4uY
	FdDwHDS9l0s8o2w9Hk2EUcjMTa+R5okoMN7kI4GmSqGhV2MbbC501FBRqoy8KeLcMZxeak+F9Cd
	KrFwXuK3GD2gwcdS1p3QiATSV6WLkA8+3GnZbnMoNL6Gk1Qjr3bnI0lP4ws2CepajlZR089fBHI
	QEerrP9wovjm+xxoullneHGpskwTVwGYaQ6hbEGzXxGzGgwNnzpWtleLhZKOU+IuCOvS70udAWM
	YtcVBuYN/hOWjQVmgapNrRT7DJ5JiLgFAn1OVLx+ey6kOa6GZpJRqe9KeWg5fMLR4EiSNrSKJzq
	5ARyYISbRpRWs
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id a92af1059eb24-1ac5b3fdef6mr21331910c88.24.1793716264489;
        Tue, 03 Nov 2026 06:31:04 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:03 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025161133.59344-1-pocj8ur4in@gmail.com>
References: <20261025161133.59344-1-pocj8ur4in@gmail.com>
Subject: Re: [PATCH] null_blk: reset cache state before device setup
Message-Id: <179371626229.3691261.9776195588952863415.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:02 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 26 Oct 2026 01:11:33 +0900, Baek Kyu, Kim wrote:
> The CACHE flag belongs to nullb_device, which outlives each powered-on
> nullb instance. Power-off discards the runtime cache but leaves the flag
> set. If cache_size changes from 1 to 0 before the next power-on, the
> queue advertises write-through while new page writes still go into the
> cache tree. A completed write can then disappear at the next power-off.
> 
> Clear CACHE before creating the new instance. The existing cache_size
> setup sets it again when the new instance needs a cache.
> 
> [...]

Applied, thanks!

[1/1] null_blk: reset cache state before device setup
      commit: 5a4236bf22622c291a96c139bfe54117f4cf1af6

Best regards,
-- 
Jens Axboe



