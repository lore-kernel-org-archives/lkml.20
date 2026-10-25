Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792896795;
	b=xj7g5ogoTrnXSGPsygIKYkqyaMT6xyM8hTepgys8SFUo2wJkMjppaKfvWLLkHitGfmRO
	 dh2w5PjzYyti9JlzA8h8SPOmphAha9h1gFVVjgW6UnR2CwRFAvwPJR1EpROaoSw2gNeiX
	 Rstymwd8Z2dCkKYHrIQUsE8VqCdtDSeTlrcfjuhrVcrmB0AmsDAEEIZZ+umFQtd5sp4EH
	 rVFkHunVR28oJzhrhWT3EP6Tq2OJ/RtNVUh/ewVvQv7J9hZCTvPvxfoK3zPgHichTUODr
	 h1apDpNFTsgl/oVIExJmd6NG7LF7PdFw27iuq1+JM/x23qTX0CYS14VX6e1tE8GANuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
	b=jX9vo4L8XdsEUdG97RsBU52YylX+ors0d30DOLPDS1cfqTcBcJJ1XhjDoFXx8TnQlbQr
	 OD8Sva322orc3h5vHakJDLxTSmFGUllWTJjdOX64F/u3gB+GyeRhdYXmHsxBp9lHboLLT
	 sS4aGtFouKpj7jOWii5/W8AOuWoBR0NpssXYw1zbpXErTWtuyQ+QCY+ENGDRawnposmwE
	 4N5BcmUAqULdCZ835kv0DeRkziEPgf4FQ0DLtsS2L+mXrOVF3mbSM6iAYdGJRRTtP+6rd
	 blsL33/HA+MRSEmrUMNY3RJXBD1E/pRMrlpLXwXAzdmyJJCS/p+M1m2CU+xidT1arRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=GwcUEZjb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95164606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95164606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=GwcUEZjb
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-19305bcb72cso1160687c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792896788; cv=none;
        d=google.com; s=arc-20260327;
        b=Hc6Gtr9nvvDvRj/sG2GfGEcwc0JPIu1riKPzf8gc2ar6m2+OTP88xTb0KvswdsgBrk
         mII4x4HGd3B1MqPVX7qF61kAR7KjCwFkws8LFobboWFcj5sPVWkN2jCtk5i1Q0yqBAMb
         ynwt7JqPQEm9lNyMVN9Sp1VvQ+x5yUgBQp3HvKgS9GY6qZcayqIyDDWQ6FfGVBHubv/P
         Tt5lIfPihBRpthUfjOOzwngZ55bz/BQIexWooH/SORayMSXmzBFe0Cb4NTjwWf9EtCBx
         Q0zmDCn7DAeCRFt5hB4rR9jiFzOiTxrZfWP1gxXbCeepZahwMgTCP5hHPcAd4vKI3sj3
         j4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
        fh=4NoxXNXnV39VCgSOpanvvBNiJp2YREJkxzsTYRBmJGI=;
        b=oaBO6hZrmf+ijvcWRVJNQ+/7nZxFOSWbI7xxXIolILuRCF66ONUaMdnrSYbuT9LmSL
         3n5D8WSKs7d1iq/ewYforFJxDJoYxmceAQk+RsdBrxi9O6scusJh+tcCPnx1X43cgt7o
         wV2redDRF+EzblbSE+OXqq+US7brm1BHVnJ5MdQ1m4PyC4SEJr0fCT8cN1IYY/xtLbwR
         QmMLcPxaurNa4bC59bPHd5uYrgxugur25lx8gpMRobslOxuS9bW/189EL+5vCUlD9arj
         lsfFRYAafhIiIsC8brzGPVzaSb5OQFpNnUbwzFNcvZia36vFTfR14jvQ1QL06KXL5nH4
         3+yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792896788; x=1793501588; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
        b=GwcUEZjbtQYEBYkG+EKGOefzT9NTXUQB6xwcN0B/cqwwm4qgN4m0Th2Ovyan1vAn7J
         2vYqZIZoV/jA3RUO6UcMoiRTfDbwFGjxmUTwLnpjvoelEptoc7YDN/BkPZOsoF+ukW9Z
         PPBvbX7i5ysIE1CZ79IfHFecG9MJEyBMnbGhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896788; x=1793501588;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jHGtF+NZaI+hhPHPeZP23JdzKtyfeu2RME20H6dVyog=;
        b=GBbn4+Dj6NWLuE0FxnhmB86OQ5CVhGIo5SRwIfl2OnFIg8ksv4DeUQd9vi40NgcLsn
         g8AJziCrDjUSKSHizxA3p9U8KaVEqlmmT8J8dXwbcHEt5ozfj/ix8WiV/8WlLed3bQvr
         wMMWl7LZZNrHLQ8NjYYMD8Q5MA5lcdKti7Vz81Lhw1EVPvBzWupIPjrMqdBnGFw3l7Gi
         or7PsJhWDmgo+OFMroKeZfKe/B1rf1+NMogPdDqd6XC/UQCGJfN7I6J9tj7/Td1S0RJX
         7aKzhc9PIpGGg7WJbEK4GdaIz23m1Wve3Mr8iUERK02auMTus+Iv7ymVGLtRA/IC7nA6
         OT/A==
X-Forwarded-Encrypted: i=1; AKwUvBwXL1OMLIN1GxxNOEKX4uNJC4TU09iyKBWlV4/hEQAITN09nmIPfjD7d3RqvZRvDygoXCIJfCe966pRz9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCQhFsqeEjuiqI9WEzYkuPTKwAZLncmF3Bvutm8pkMwn2Ms2tx
	cLhyNkIc6L+f4s/Uyh33yxkmOJDNJe40oyjLYWmywJjpQLaptf2LcaHekQ3QkGLiquBU1TwKUBH
	M2C6cPThYQnZWeubPjpTaMI2pIeqLhsEwIp/kyupa9JLTfv6xkM0mpO0=
X-Gm-Gg: AYBFou2Mvx1Vm15GJUM4xMQ8bk7tK5fPbtuiZ+zYNke3wCJ8AJ14GMjUKjJi8yLKJwO
	hbYT5nk8Hs8CrlKY4HbHmGdIQQOAXzl7dhN1hT4xLk/fRhr3nmqFKBVVUXu8aliTABDytiLC1Lp
	eErvUSO5W3O5TLcM+zucyQ4ofdgI9l4gMku+ZUXdPDtgd6sqvbdgacxhspPp8pQHQB3MVBV4xL4
	v3+laxZn7EdqVJ1/xTEvJLYTgJBsTj+iXowPidblru87k9VIWjLsVtpNb9mOF5i/qm6vEXb83Ra
	ka3vsprlfLF1GK44m2PcouMddcYzrSNAh6UQ/9RfcRTWOZZrZZMwTwz29Ftmsv90gpAlYDRdGKl
	Xqd388xv57VEMEHWjCCYuNx0bjew1arqp8gjo
X-Received: by 2002:a05:7022:b04c:b0:163:3bcd:e5e6 with SMTP id
 a92af1059eb24-19934a96f4fmr5011598c88.24.1792896788514; Sat, 24 Oct 2026
 19:53:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025024514.802862-1-daniel@0x0f.com> <179289664421.3327.13269797237144711675@kernel.org>
In-Reply-To: <179289664421.3327.13269797237144711675@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 25 Oct 2026 11:52:57 +0900
X-Gm-Features: AclHuK-izwE4tuQ9_k56qieEjJy4dAKE5drC7e2460UfCl4uONeoDil9BFT3OsI
Message-ID: <CAFr9PXk93VVxotS-C90Rhi+uuk0BJngTAoMVQqWkfh5dRCbdcw@mail.gmail.com>
Subject: Re: [PATCH] net: i825xx: 82596: use MMIO accessors for the MVME16x
 PORT/CA registers
To: netdev-bot+sinfo@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Denis Ahrens <denis@h3q.com>
Content-Type: text/plain; charset="UTF-8"

Hello bot,

On Sun, 25 Oct 2026 at 11:50, <netdev-bot+sinfo@kernel.org> wrote:
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

A version of this was tested on MVME177 by Dennis. Dennis will
hopefully test this version on his board and reply with a Tested-by
tag.
