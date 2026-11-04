Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784989;
	b=QnTGzu9lL45uP/47MAcXrIPzdN6+72/fDYDb39LdwMXbyLxiVSSd4UNriuKD460TtjLv
	 fmDyC0qxnsezjfCkMwK+Ah7aAJP36zqoWuyZ9gG7DFSaYO+PybHbt3Y7DER7OENPnHDGx
	 XzWhULcPZhfnl4aCogvgXb41BcdeviiP2W89k7UZ9ahDq6MtbMoa+ud78++6K1M+vhIhM
	 MrEqbwMQ01YxXRhW9BT0MFJm9VCTV4zTorwCefpzDqGKUprUgXvkoQnolY3kOkJeKxES2
	 hSNyZahN3t+mXpeCztquP/QZBS5thQLeVQYt0uR/FiNFaOzmZ6QK+9ZASYedQVOTyaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lTXUcqEXN9fhbWBTgpN5+0qokRh4JVbIacGfVHJnplQ=;
	b=2BNGW7fcr2SriIKtCOgei7Hd2EkIZuNKyEBkQ0FCNFuoh4A+DMBo5/F1o9mMDbZfq5zX
	 N++yGSSuhJljHIJokH3NZmQa/lkzQYOvMDBXaudAiyzA+Z7E84gnOIQ72zbraIoHZxo30
	 wtzogRbCccYWjQzmS7VBfdorQvtONTHfOXlVxQUCWk222rjGUAiBogAc6MBmRAmBzbKIV
	 K6IIXSDvpvm1y1yNAZbxGkYgB2OSyx/G1ZV88NlxrhwngE4xhkQBzKDu5TgA1KL0bIWlm
	 8He7P8dMYXZaxXV6awKW5BJxqfU+BaBrNkrnyLmg6zUVwU33ulDdu2ppZTeIOihBHlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmGCxF+s;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmGCxF+s
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so345035a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784988; x=1794389788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTXUcqEXN9fhbWBTgpN5+0qokRh4JVbIacGfVHJnplQ=;
        b=GmGCxF+sHS82Xh/DPYUY5pfW0A39hyNAQWMZR3S11K6S959NrAiKn5Gvj8B/SUSnxV
         mauKncLIoCa/dTNCYroUkf9L1fq1lSvXHibiZVCT3CPMr5a57LrKFvLvxWKSK0LenaP3
         l5ZAGP6tXncoBnKeYMDAHuVEvVTcVRD8Ac+0zfaYf1toBl3j4UKp+CAEVpuhSE+YBw4M
         qrQ+9OqHbc7RJhCMAPIIrnbnq2t3pDzUm3VijPuGxR7zntnfv0X4pFpTsxUq4ABKTlrl
         ckJqwld9+PfhNeSHBFvKkDzOSncU0XZTBYXrS0xqpdgTKXEeatgsPMZHSD4TwJtu+ojq
         eVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784988; x=1794389788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTXUcqEXN9fhbWBTgpN5+0qokRh4JVbIacGfVHJnplQ=;
        b=nYVeGQwF/ByBXO+qxpoHLMQ5riqOTPGey0oPGBQTbxMfbrgFN4FVkmXzOaEWg1bygX
         nsGc7LpPQ2cqGw+QGfPtvVDthUYFT8yQFjJnPgCq0L2gj3KktgXK2DEFpqesNFTcH8X6
         EysrIWmiFjatlBpSFkF8mYRdBduyIFC2Up5ghoxU8zKzvhskBGeI6TlXy6kOdW5l+L4L
         rj9ojerMY3fKI/jPpcBH0c8JI4O7OtV/GOIT1C+3iw6BQCo7JGssKftlBHV/InADjC5b
         ywGIsnVMz5csTkO2cGX53wmai48mPB4zI7O64f/E6k4IAv9utaRk76MHzN8t46sYkAN1
         SBaA==
X-Forwarded-Encrypted: i=1; AKwUvByMrPzGiTQV3wN1eS1OYvyiEOhLzAfoBJOIFWn+3YdhDoHlz/FJyVm5RZG2QrtkgHZzXfuhKcHYOiuBrng=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KM33o+bio9BBC7rDFkDPvcZpbIzFK6oxB6i9MlJcOYNQ546fH
	4tnWkWJmwZ8oaLGh5aXJou4hXXtrmPel5xBjecTW9dP/AtRvfeWiUV86
X-Gm-Gg: AYBFou0Z8gKvvs4nau0NcvgRIma+YXMoZpOO6A1I9/isZSJ5TjoPqymdoY6gogZbilx
	LolEOWLBALGjuMW2W6gWzSbJOOnSbjMaQIx8TOY14oZru1QxoLxXQiTITvcNeqDdqIbWah1+Zyj
	3W+C7UchxHIXmfQR6IPpsRGzLdFWSa1wgSLNnbEOSxWdVHEe5FG9NKYHbUJpmGNxNEYSVE+pifO
	3zXBnMJPeUF567uS1qYk6AokYygry0aNlML0YSWcFk061Mh3J6U6O5+oLAAkEWD2L6r+nCTOkAo
	sw/o2Z+8p8UByxCEHRZUdVaYZi8goeDbne6ioKTzhNeY3zUkPg7WueQFPUryaPPNvyTs2ZrF1cg
	OAH8+YRpSMrYGO7fRsPNkslm+Len8qGotq0p8JnsThJeXrzPbSAlEuLOcxlVG9o4Y+U4480ZZCh
	uoKedN0rqPJFoidEgimuoyCDVtuaCW0d1Whrsuo/BDm4Gq8PDORf0rF5uKEMGkqkMyBgVrpAHhT
	h8337xpTkFMEI52irKg/bleIjAS5gR8RSWXVtvWJdiXGPg11HnWprJKClrkmiAhkz/qWjvMxxNY
	qy7DJRWJzRMLf+QUXLWWOnZeNFoxTQ9ShuD2ah5cF/sWwwZxtWWAMQc4AwPaSaELKyTJU/Nt/ct
	u/B9x
X-Received: by 2002:a17:90b:2742:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3ae897158ddmr13702795a91.14.1793784988126;
        Wed, 04 Nov 2026 01:36:28 -0800 (PST)
Received: from evo ([183.171.191.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944fd80bsm3149967a91.16.2026.11.04.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:36:27 -0800 (PST)
From: Ambareesh Balaji <ambareeshbalaji@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR Dequeue timeout
Date: Wed,  4 Nov 2026 09:36:08 +0000
Message-ID: <20261104093608.2642748-1-ambareeshbalaji@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104101506.5ae19157.michal.pecio@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com> <20261104101506.5ae19157.michal.pecio@gmail.com>
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

Hi Michal,

Thanks for the review.

On Wed, 4 Nov 2026 10:15:06 +0100, Michal Pecio wrote:
> I have long wondered if we shouldn't simply halt the HC on every
> command timeout other than Address Device. Commands shouldn't be
> taking 5 seconds to complete. When they do, something unexpected
> must be going on and it's unclear if the HC is still usable or
> capable of recovering cleanly when we abort the command.

Your approach is better than mine, which only covers Reset Endpoint
and Set TR Dequeue Pointer. I am happy to drop my patch in favour of
yours for 7.5, and agree it should not have Fixes: or Cc: stable. I
will test your patch once it is posted.

> I haven't seen cases when Reset EP or Set TR Dequeue hang but other
> commands still work.

I can't show that these timeouts happen on real hardware yet. What I
have is:

1) A fault injection reproducer. On an AMD xHCI (1022:1587) passed
through to a QEMU guest, I halt a usbhid interrupt IN endpoint with a
real SET_FEATURE(ENDPOINT_HALT), then suppress the doorbell of the Set
TR Dequeue Pointer command queued by the usbhid unbind. Without a fix
the unbind blocks forever in usb_kill_urb(). With my patch the command
times out, the host is torn down and the unbind completes. Normal
unbind and rebind of the same device is unaffected. I can send the
injection module and test script if you want to run it against your
patch.

2) One real hang with the same symptom on the same controller type
(kernel 7.3.1, tainted by out-of-tree DKMS modules). After a Focusrite
Scarlett Solo logged "USB disconnect", usb_hub_wq stayed in D state
for over 4 minutes in usb_kill_urb(), called from
scarlett2_private_free() on the disconnect path. Nothing recovered it
and only a reboot helped. There was no "xHCI host not responding to
stop endpoint command" in the log.

Reset Endpoint and Set TR Dequeue Pointer timeouts are only reported
through xhci_dbg(), so the missing message does not rule them out,
but it does not confirm them either. I see USB audio hangs like this
once or twice a month. I have enabled xHCI dynamic debug and tracing
and will send what I capture if it happens again.

Regards,
Ambareesh
