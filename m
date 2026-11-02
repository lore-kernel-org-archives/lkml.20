Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621560;
	b=uvRVcjlSzn0Uv+mTjiYv/ME1sX0RP5lf5T8W8eCu7X9HYWoiv5x4HB6h04JeOo8wF8LE
	 yjSkssDSWdAaBNYu9SvKjdathJpsHtsp4cxsXjNYEz+tsRVRAI8gtSlP4ITwGpfuZAPxG
	 54Zlvma6kIorQxQYPw/q/fcnj0KlnhzACYVoqA1J87KRN/NbZFJy8A1/s7k3XAnFxKYEg
	 0yXElsU1sbAdS4Q/pocxnSa9Gx0PMKhgJat+DKbDOE65vWr3MKBVImzxHMdMdLLxkGM7A
	 cPVP5Xogv0K9nCk5cEOXaPlvu03i7/QIIQK5jePuW8rNs4wzTxJy59XkQgQW6EEEGfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
	b=zg26aBNseALLgAzAGQnvkI72MpwQMANjIcAYmjZK7FIAgYlDrO59bvd6eFzCcPAE0cV6
	 iqCv/vhQeZ7Y58UGbl4CzsQakObQ2yjhs53/fzT4dlh6xVSqxZRqEAqstj+Xbcmmwa7HP
	 cMEYCICoFORocILE059BwITMab1sZDyGNy1jWEQtiGAjZDMIpLjCGm3gyXjw/DeRd122B
	 9qZHkon/NHcvHKZPxIMfXPZRkWzYOmcsH9jSybwKd/a82ZetjZu42jLfQy4t/OwB7Y9QZ
	 vCcuhXM1hegGfrHumUGlHHObOS4c95sXxATNGZof+YLMCHg8yLLTc5xw6JzcXWxXuwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjRMDqW2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57149606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57149606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjRMDqW2
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so5700401fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793621559; cv=none;
        d=google.com; s=arc-20260327;
        b=DVVGegoNLqdmUnVgQT2lorxSj8b6ex/KkUTBZQ6y9wCjYNu0+4/J7qi2A5yi7Rf+bE
         CC/iUPSJu4V6OINdXq27pf436sqAhRnNxvYeU1xMO97IpUPnQ/0aq4D52GAiv4YFbjLT
         dj3RrvYdE6umiSVuMUjGEMYJ7HvyPhH5VyI//IYegaNBJ3Dj4j7Jp8KxTvTCKvoUOdm6
         bDabSKiyA6sm+DrxHxiGh8M9IurIjQ3JwFBf70CUk4Y/65Apig3xPXbnI8aD21nXrVaS
         nj1tXnxkq3g08l8qvIvV2ceS/JXtBbCE4hMJfYswKVaenbWFllO4D08gUUmW3zkR6kj3
         GPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
        fh=4Cb3nhKwmxdMPI7zEyHz0vnxJ3lnzkZGPm20k2Q9s28=;
        b=qfmzVIiHZ/g0uIQl74LXL2dKAycHe5pPoM6OxxRVfIfPIkvfjcPtcRBw3J+HiEOSW0
         PvUbMtD0Bz9CJeq2v1/6bcjMTnWZVBbDRV1NDKw68+fSOssLZQCt2zk4qkPHfRI9u1h7
         PPN7OmzsOMFzg4DJAPqu5nRjVUvHtBJe9eG2lpRhfUOzSNh1Vsnb42eTxiZYAGMHJv5c
         0wrNRKWbpGHp6mV/3zfbMeCrYLndegNWjC4jtXrT/jZq+jOL4AvLvee1ZJh8/beB55Mj
         NK42LydH+iwTJZRX7YCKA/ELJKZVkDoXDNxBcf2NS/1e+CFKp743v+0sHLpW1tWd+VlR
         GSVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621559; x=1794226359; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
        b=MjRMDqW2MJZwqo+Q9hu8MFOhHnAhtpCLUkRxX9BUfwsWyjFtzKkUfDPePduPffVgD8
         cxt1N77flJnZ0prKh5GIO6oxrH7QZ4DSvxlMSTlarrLXDTab0G/v5xKuXW4KwkfmIebK
         yoXDKIcMlHzWAdpOvof0QCkdqi1sI6CIwECmR1BJyaIKUEpvtS5+DQ6injJyoYhrWjq+
         yZweb+Wfd2qyaNzJOwVjyV5ez+J89tfxCw2h9spngGjwX6joa1VUJkOUNwMTWq+W5ZM7
         0OimD6Jqi/so7uMQ6FuMljIaO19GUZq7tKKEroP0JjxsYiZjwEdbBZ1NgMSE0YXQ2RKS
         kUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621559; x=1794226359;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CzGjQfTKQ1sK49uKYb3bCMwMaQHcf4pDcDTHkCWJ82w=;
        b=utWGQ8iei1EawQz7aOe27AcYPNqTAXRpTykYCycgc30bQ5ujzyww6uHUJ+x0M75xWx
         Xh7oom6n53l36CFqLwPkbJt83y69PePMXCtEzgIUvR3wxhk1OaN1F520cqOtTQBLb7ou
         mcGDcof0vk8PoVTDJOpRv1XCKrg7zkzaKYgKGAJD9cJGmR+/feFwpxrQAmBc6xazmXEe
         /XpS3VbN7cZTmS3Xw2GgCbbcUtD0aF0U4v8WKU16BWEwNigjACDG0FIhror53ONszmgl
         fH6gZB4farugSw6rbrQQnf/gBATP6PcFfer9jPKtTTa16SsVqsZYEgw/v9k47xyfMBwo
         4Zag==
X-Forwarded-Encrypted: i=1; AKwUvBw/zyPiB447J9s1kKv+hwh98yYMnCAkwny+fhmFBc+4yw62oEgmkgkrRyb9RW9Uguc8rfjNppTNXCV3a98=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MrXd0qKOG21eF/rM+P6xjDCkgLt8xxs8ZpGC0RlEejFUV3Cah
	E3C1mH7wgqDteDRHC4R/es8cOuEd4LI18KMKeLnixsXYxeFjcnP5RqYOtryPYISTe/lES8GiwGM
	fkpcdwvQOrKk+0Sj7/WwvIXqdTtfRF7c=
X-Gm-Gg: AYBFou3Y8J6y4x7gaEl7G57cnLRWaU97S6pF96M3cTfyqJe6YRy1he7V1Ho48u14tEj
	irc7TUa4fnwiei6QqWwW8qqaOR+KrwA7aH2bbkt3JKycVokWJ0FMmCE2uJLn3QdffKltiIe/H5V
	Oyz3kmWnt0qMDHsfZK4xGCZ5ZvMIDLAVCndbGhhCwnS3+L+vRyM6fJE3d9ifFWSzsSuAurvIzMS
	xXdEGROKi3hRoEw9+k+mc899cOP8bN02GkuFXBILzEzK5bbEt6i6y/keBu6LIEe1e4EWMWz1/M5
	5LIF1NFgLpdGK1oXV6SK6VImpFLeB0Ufu7R4ISFTQsMAACiXhfHvxPjjdbu98O6L4EJ+5cIoVcq
	TH4bForRBOP/2juQgwukZWlsSerf9jfs3qrletXvnwkvFnr2NCL5rb4RKEzNxOp4TN19qPDKnmV
	thOi7dHbYZnXpdHiVtgZs=
X-Received: by 2002:a05:651c:4418:20b0:3a9:7b31:756d with SMTP id
 38308e7fff4ca-3acb788c991mr19856151fa.0.1793621558428; Mon, 02 Nov 2026
 04:12:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAH_=YdA5Rff14pbjoLp-Mg-n1yLqN0wQMUK5Xj2dB1OdR9-4RQ@mail.gmail.com>
In-Reply-To: <CAH_=YdA5Rff14pbjoLp-Mg-n1yLqN0wQMUK5Xj2dB1OdR9-4RQ@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 2 Nov 2026 20:12:26 +0800
X-Gm-Features: AclHuK9RDZReu1hdd-EOk08Dd1BxiF8vOWHu3_b8-DaNwt90GrVxOodBqGHYdPM
Message-ID: <CAKspUhKoYft5mG7ELbdTJUeJAW2DK7cs7bgupuJFERsDymAdjg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X
To: Vadim Yuzifovich <vadim@yuzi.co>
Cc: hminas@synopsys.com, gregkh@linuxfoundation.org, inochiama@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vadim,

Thanks for the detailed write-up.

I run the same SoC (SG2002, Milk-V Duo 256M) as a peripheral with
g_ether, currently with DMA off as the platform parameters set it, and
get about 111 Mbit/s from the host to the board and 88 Mbit/s back.
I'd be interested in the series, and happy to test it on the Duo 256M
once it's posted.

Thanks,
Chen-Yu
