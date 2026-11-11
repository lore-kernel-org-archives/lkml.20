Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794426345;
	b=MTAkoJautFRU17CneHFIV12EIkcHzXzwxL3tH0vIQOGogOX3DzgXOnHKd6reP/A77yoQ
	 PtOORs7aVtiXFVW3jCet0ujAmknhBwtyufnCaWP3rgbji1LLCiCx1c7CC3EdZR5UWJwqQ
	 afnYIPpGBlq25TFPqTdF/XzYAOE5ojJ+qKGBLNkrXy2KCK6u4VBADBVHmZzn31/na2aGL
	 r4jCFpABEBrVbcwAl2/64kVvFtceOO5CshcQBSGQ26mG2SNfpGGsEVBXH5L0FfhPIERQw
	 SnX3jWBKaTfLYSAV9wF1HaXnGfUmK/8Fa+EFsU9y4pdL3ObACyC9nZ5Q0Bf6Xc0DcrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
	b=TOFUg+vV8eTu4sVXaLPzCDxVtN65fHYG/HraHNLQDdBs6NG2xGkMJSA+CyJQzoLgWHKC
	 8J0iohBf2IuttVdu5WmX0YVm/9C0MuX+7rOdE45TmrRUGJ9kwNRLjjbTrXvMZw5OtqZ/p
	 0OzyMNZmMtnzv3MzIqc18/cwKY+0bbM4yAAcouZ9WYAqwU1TrBjLb92uBdRiPvZrW25eI
	 CRPjW9cjB59S1MtMU5P63fGByfi3s+zxBx17Mf/HzjcgTtPK3RrxLqCmQp+scDYHkKTkE
	 SrUaGrYpsQXzdAX5vbLpn6e7Q0cGKti/OKYTu3RO4LQpyKHZtnERkb1BiiEj2UD1RGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2SQADY4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC6606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DC6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2SQADY4
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eabf243d05so1183102e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426344; cv=none;
        d=google.com; s=arc-20260327;
        b=NAdYgcnwginq5/NF8tl4duwsgWwDgSnGsNiGwy3bDXuZc5Y1FPC/TxU/kYISUoWfvm
         utABpkAA4S21TU6n+Mor9ye4CUfXuRZk6rq4pO015jX49iU3/61rKdQQJ97rgZEqb3pG
         UQBWRgT07GumpSeZuphilmtqogSsDDuYNS44TlBLI/nU0OEC3IysgWRqoFwinrLT1yX2
         7JggHgeYuI3CE1jSZBrs/J8mP8SS+j7B5fdZMZ4GRssdr6QRfw5Tdr9u/w0hW9pCj8Nk
         7XBCyH/YQ9NJKwLYs65vSG4uE0k/9dkvGXzjCxSUxLVd3ovjCTifLkwCp/BNx3wXvR28
         w2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
        fh=vPrrTMgyERswb3UmsqTD9X6v8TWZwpzcxvdU9eXBNyI=;
        b=imT6zReiBRWma+CeWXLCtHC82yBIslx0ci13tuL+j1/bitCTMIQFrDoeQbmPiS0Yp5
         juF0f6Hw3NTGbnT0On7CVqb3t0II9jQma8Bln77zCa9WEkljuE0xCQTgUVi03sAoe99l
         hb1um2lAvvj1yNBxduzl5IoKNj4GwjhIHTY/uFV8K+vr0uCFgmszw2XEDESiKeEMrE1j
         r4Wl/Y31trJYRx/kclGUFzMUCiZs4v0F5Aa1X8DAIJSK+ikPYNS+rhKXD4KZFQ6GYZHj
         guJo2I/wmD+KiIeino8rG2HwROMbHAeMTQy6bmMVxDm3Oqe8lg3plpLhwVMXPsYs9F8b
         LQkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426344; x=1795031144; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
        b=s2SQADY4LOfmdJHfDSvArtdrTeHBAS6GOBpELjwBCpCNvpH6naC/dcKs4byB7lwQih
         lqdEQaMgswjGDNm9o7gStKrqov+X6daowptmi4STP/SO6ZLjO2Xwkeyq6XzIt3wpYfb/
         wX3edTaXNQ9PNhBqJGHuCGjUAV86DVgmu7OZv+X2HmWUAj5RerEMECumzxt+nXodVZLR
         /R0o8YKbe+ZDRwLG4eyQOFITNBoppYUFD5LTuA1U4+NJAuQ7dvpTp7y1IdVZis1JJNRE
         ITSHVzog8tbzHuGtrcQeocPXCbHMkj7nsYn2zuTdzWnUwjW5mjrwVHU56tNwiGpy4Qec
         Hj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426344; x=1795031144;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lILIcv7ALfl3mdwxNQu1XBlIGEZnSF9o3ZCOxCy8fhQ=;
        b=1ldmDyXw65blDMmfkeTnX1EHtO1koXBc71iUq6dqYqylRZl/tX91QrsMaHqGICLco1
         mDE9ajczMg8U7SrAvj0tPi+mnNdcM3qgYYmXJNGApZL4SHo1N2mNodai5HvPb0fCHjpz
         EQnnno8+IV1O2CVAb6PlbObbLzXiItfxC0Xulj/wiVBD87gYTSPbkPAzoLj1QE1O/zg4
         CQPs8lpSa+qB4EK0LvZWagqkXJByPuflow4REjBf0saKIcLTy1aNVMkChNWNcucePRDx
         5QFOyMmDuwBjwIL8nmH3te5U399zvHZmKPk0Lt9Spn9wm1McGEdkQCMqrLX1h4DDc8r8
         DU+Q==
X-Forwarded-Encrypted: i=1; AL+hErGD25TNIMJuiiFDuDTQZKhq1LOi2qdxC8RvXX8i1zjpYpu3qogWqsxL/z+iSEpDCS8YQbSoUKbQsp8vTF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z93+N3f4ZXHFypfXpZUdB077lbLzzkxhFQCHe1FJBVedIZsajWN
	/pIRIGzDBXlHRsm/5L7nOaHhadxI3UxUxx/R7pzlS7W9wnSx96WmqbQYSU/wmE4apvu2bNz0ZBK
	eq1xpdG4y7v5/KU8w6aVCgqqyazHjYHo=
X-Gm-Gg: AYBFou3I63CpS67b1l87g4WzOshoTt40aC0pwU125s3Uxg+DbNHDLbZg2L3F+Bv8slU
	X2fgmjNmbkcF+oUipmbbSm+2uMghonO+H28mKMVvmJdfNavla3PGfOgH+k8gHuLiMhgdRe4Dh3A
	r/bkh0v0sxnrETxRY9H1sIqgS9GiVcTUBD9xBFsc113peNVvcXX+dSdnpwNwrrwp3jHeURGyYEk
	8hTvjDiV/ufzh8VT58k8wNwOVEOFlwG4c02eX8MsmpzKNvB3GBnLUUes6oNeX3S7DTnCnnklR8e
	8ScMQSgoGD7kD/fEPslfWGNj9MXQJ1JU7VgRit53d9O0XiNVfz0m/6zl5kQB7LQxP4jvlOyeTXn
	5x4nVS6h4DbYudOtXVBjo6arsyF+ZnPuhkRDC
X-Received: by 2002:a05:6102:a4f:b0:7cc:9d82:ae17 with SMTP id
 ada2fe7eead31-7d4fb2d9f20mr1247064137.11.1794426343023; Wed, 11 Nov 2026
 11:45:43 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 14:45:42 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: enderaoelyther@gmail.com
In-Reply-To: <76bc126fb977cac0f0a124fc80eae9fdb803264d.camel@sipsolutions.net>
References: <20261028141751.6728-1-enderaoelyther@gmail.com>
	 <20261028141751.6728-3-enderaoelyther@gmail.com>	 (sfid-20261028_151822_083722_A5EF7A18)
 <76bc126fb977cac0f0a124fc80eae9fdb803264d.camel@sipsolutions.net>
Date: Wed, 11 Nov 2026 14:45:42 -0500
X-Gm-Features: AclHuK_498F9mVKuehZNiursTJcACe2DxghGvso4T8Fz6hgolPYVL93yCmoCmV8
Message-ID: <CACHPgzw-JeorCAX-b5jjd6d5=L0oYpPdGtstUSaz5sPKZE2HsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mac80211_hwsim: serialize radio removal with
 frame commands
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, Javier Lopez <jlopex@gmail.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> That, with significant work done under the mutex, seems like too big a
> hammer, can't it really not be done in any other way?

Yes, you are right. The global mutex is way too broad, and I am dropping
that approach entirely.

The underlying problem is per-radio object lifetime, not command
serialization. get_hwsim_data_ref_from_addr() returns a radio pointer
after rhashtable_lookup_fast() has already ended its RCU read-side
protection. A concurrent deletion can then unpublish and free that radio
while a frame, TX-status, or PMSR command is still using the pointer.

I reworked the fix around a per-radio reference count. Address lookups
acquire a reference while holding hwsim_radio_lock, which is already used
when removing a radio from the hash table. Deletion first unpublishes the
radio under hwsim_radio_lock, releases that lock, drops the initial
reference, and waits only for in-flight lookups on that specific radio to
finish before calling ieee80211_unregister_hw().

This keeps the expensive ieee80211_unregister_hw() path outside
hwsim_radio_lock. It introduces no new lock and does not serialize command
handlers or the teardown of unrelated radios.

Since patch 1/2 is already applied, I will send the replacement as a
standalone v2.

Thanks,
Zhao

On Tue, 10 Nov 2026 11:54:21 +0100, Johannes Berg
<johannes@sipsolutions.net> wrote:
> On Wed, 2026-10-28 at 22:17 +0800, Zhao Li wrote:
> > Destroying a radio while a frame, TX status, or PMSR command is in
> > progress can make the command access the radio after it has been freed.
> >
> >  DEFINE_SPINLOCK(hwsim_radio_lock);
> > +static DEFINE_MUTEX(hwsim_radio_mutex);
>
> That, with significant work done under the mutex, seems like too big a
> hammer, can't it really not be done in any other way?
>
> johannes
