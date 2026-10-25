Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898613;
	b=PmRQR7UtU3OAvj9GLr1So5Rjnz0us2G04InSlx3njlbSz/ZiH6DrJMxfW25UU/fz7JkI
	 wKqoCl2T1ygVEweO0l5448JETS8ozv5CsBGpSUWjqlNDUZlKo9PLx/TyAK7PYxprfNwWs
	 YK6/dlH6nJjjI8Om5hLxQXLb2IdWePt9NBHKWh/XuvY05G96kZHCVwQqfR8DNBMtCJMDJ
	 Sge0nEMnO9FlquCNBmWiwgDJZflINZGTI5nlyNcrWhugAJEsXx//VZRTACZrxAwpwtuhQ
	 WA90wWbnapSzORwztmgt/vQOt2f297PsOUfOpKV5mH0DDJw/NO7Xr+3cHHi7frj0RXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Tg2aVX/fsHYcOtjwdgzppnsVVZWuPIkX3ZOv1oi3AEs=;
	b=vHkvQcKfHdrhJkJxzkm+5JIfhbCD6/uaeifmutZbfSPFKnyNCs/NNJcNxsIJb0+u2mQu
	 +uU2cKISRZy07brFHhlcuzk6Q4EHMk6IW8l3utAtE8uc4dt1JgxA67PXkbT708jAidJ+K
	 U/P/CbtWN1gq+jMbt3Yjihyc3nW1tEN1OYJ5RrdRRTQ/Qtz7Mn8iYi+y8tR0gfXAIN3HB
	 7IpbrAT++2q+4QLz0ovQ8B00A9Nb6AKGjawat+Wlrb5mP/7jqw/eme/xUjWDB55d9K+I4
	 70u3zSgmJFv1+yN6AWLrg/17qeXb0aJS0asVLiMCof+f10HJrE7K+U+Bu+paLvIytPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=LtPG7PQm;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20174606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20174606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=LtPG7PQm
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so2663787c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792898611; x=1793503411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tg2aVX/fsHYcOtjwdgzppnsVVZWuPIkX3ZOv1oi3AEs=;
        b=LtPG7PQmFYnamYcvAMmtqKk5Gls+3mQidrCDZDU1V7q+raihxD55VrAEPAAmNSR1Il
         OZLyu3scNvi690202ZBIp7rP4p4Y0wbAUxKkOnllrBA1d9j3CUtjRsChIFpAb5a8ot++
         SvRjyNM6Md4hz5xgwmYCTA+E/t9x0xZyld0eRObLxnmi6DFgPMjOxrlt93vvkCQyQNbv
         42ePX4esfIl4w5CmI+TKPGTII6Evcm5T6IKblhlgPBgdWf3Q74GZG3oRwJQey89NGQaL
         Ezeu9AHp/QRUbYBm/aBkVjfV7ocULTN88GsYg6Q9zSrAagiqYxVdUJb0zPCQKHBoVEOV
         CAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898611; x=1793503411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg2aVX/fsHYcOtjwdgzppnsVVZWuPIkX3ZOv1oi3AEs=;
        b=yL3U2p5yMAfEYTDUfq0IatWjV97AJix5OFMI/oDFzVvbCoftPhZvn+F6yCrs5NtoNM
         Znq0BKSVihIYOl89ovi2Aw4HuXPX48QB30XIUJWBcOCKCz7nWWQFAjt24GDRY6wUC4O2
         19tNh0FrMebSeUfl5cNMH42imaYkqoUFgKln2LqyOccz30GbFZaPhMETWAZ7+rDyI4LC
         E0/XL7nw9438e+MEWJxgMdD03BFa3hSgu/qKCGcW7lSfFEoYUBtl9+VgKG6xBrmpt4z+
         3iWRPozgd6ioo5+AvaEcpFg64SL55ZqbjCOykKfpJropsHXVSyVJzgX6e9wfR03cIZKa
         nBiw==
X-Gm-Message-State: AFq9FYK7l9YczJOAdZpMVa1HXF9kl30lMA2BjySob4xFO69Y1ric83tC
	E2irIrN8sNzPbzph927BQ7rFMkjiJ+iYTJ93sdljUViyfVJYScFikm+Ru6gsZpZnZ2GlOsaZE7U
	kbdc17Io=
X-Gm-Gg: AYBFou0rk8+VQmh2zolHbGq5VlHHZwX1rVEgH+yozuz21li5zZduvclIjRVOIvcYbQA
	g/UaEKj/9ToGvkwVdxnNyooEm/sgWff8oCQ2bpnioWNY2sAmuNxpBECJ3GEfeKQvB6AUi1q79o/
	gqmOnALUeRH+5QxlhhbqWc9ScL1dWv/+I5mCTOW99J6xoaJ2ug2E2l8GgRgk02bf4Ypy1jyfpmr
	DtsdZ9K7U1DaPzLj7Gq2+okyMEepz7MEhHyN+607jTMX/BUszR2tViIyck/VEdavsi9lVHnqD6t
	LCzLZFUfpqcIpa0eXwH0k2yeuea+OEt2AdmtICeYUj0SyDwt22LFWSdPig0gFUuoimSmeYPivMR
	KpLEq60f1vDAdsDWokheJ+zb9tJZ7i+E0zhyEXF1dAf9VemhiXrHSSGlJ636mdJD8wep2VLoihL
	JWIYDyaNJcj3tfCYkgaNlrj4UwIfhPSw7I9cmyJhZ3QKGKlCjsinf0gLiMwVNEfmpu5N3DpQfvk
	prhSmNhF6PUragr/HsS0g1RoD8mVcWmypc0WHmrrl7enj1fzgtXoSOPLZoru0oYSw2dd+W7iNua
	ZaTEDpGNomeKoQQ+KARx/5AiOXuK/pyy4+QpHEM=
X-Received: by 2002:a05:7022:7e8b:b0:16a:1fa:58cb with SMTP id a92af1059eb24-199290fe419mr5187678c88.1.1792898611030;
        Sat, 24 Oct 2026 20:23:31 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm26808459c88.17.2026.10.24.20.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 20:23:30 -0700 (PDT)
Message-ID: <9c1cd77b-8a00-49c8-b3c6-625c0ecc6694@kernel.dk>
Date: Sat, 24 Oct 2026 21:23:29 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] io_uring/cancel: futex and waitid cancel results
To: agxr <agxr@disroot.org>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
References: <20261024163259.19372-1-agxr@disroot.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261024163259.19372-1-agxr@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/26 10:31 AM, agxr wrote:
> io_futex_cancel() and io_waitid_cancel() return the number of requests
> they canceled, where the rest of what io_try_cancel() calls returns 0.
> Commit c74193430feb ("io_uring/timeout: don't end a linked timeout with
> 1") took care of what that did to a linked timeout.
> 
> liburing's futex, waitid, io-cancel, sync-cancel, poll-cancel-all,
> cancel-race, futex-kill, link-timeout, timeout and poll-cancel tests
> pass on both patched kernels. Unchanged liburing tests pass with patch
> 1 and fail with patch 2, where they check for the 1.
> 
> agxr (2):
>   io_uring/cancel: count all canceled futex and waitid requests on
>     CANCEL_ALL
>   io_uring/cancel: complete single futex or waitid cancel with 0
> 
>  io_uring/cancel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I'll take a look at these - but please note, that:

Signed-off-by: agxr <agxr@disroot.org>

is not going to be adequate for the kernel, we generally ask for
a known identity. That's either a real name or at least a well
known identity, above is neither of those.

-- 
Jens Axboe

