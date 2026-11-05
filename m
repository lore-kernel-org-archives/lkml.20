Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876260;
	b=bhdTu6jHGzqf3/zkGcxTBU3CL69m5DH1xSlUMW3s2LLHTItbVG69lfETJwvRqv9kjRSz
	 hlvwvVrPI+fMxU8ag6bcTQ2Icu89ve6rPYXwhSiWDQwVgCu4HcBhhBXlaSI2eAbRlEAOR
	 ziLao76mydj+ynr0zJ/Enm5RrO4x0E30ZbEBeHilK+jppwLokwsmZg/Ozn5GgAEF+OOck
	 JvsNVgJIs18PSJ5N4jG+tDJLw9dtUYbh2Nt7fsJhhF7+Hzsoo9e2OT6NVLx/PNubOfo3h
	 BySFxwFsKTv72WJtbKj70Tizn3jtqT3KyLf68oQYFn4xVJTRIZSbBzoFQ4lG7kq1bFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SXGwN7tRovYpRhOtfKhfyClHFzkHW7mhE7T1iYdcvl4=;
	b=TCLnjeh+eYnJTyP9K74jcZjti2huMIrHx1TbHiCtfBb4jHtn/7z/ITe6SDMFejict0rl
	 +0Ggj7dvS63UoxHEXYHqUJkbVyDJXKEOvIGMrmiGnD7wwCtDwbHHsZrDjL7DADmkEpwL1
	 tvVPGexO5bYz/fm/nhTOQ7bODPlaWFo5QyRcczxEmBaYdRNeBDg9M91pnIDHPtfVrqekM
	 bSTDPM1H0Mznp3iGaeCK467D42+6fp+/xEVVs/B+vKy7MbBP2Aa6hBI5qaqYWCZ5sLYFI
	 uZYfHG1/ie2o6jdoCr4k3IWQWcHnxy54JnwmWy/cMxLaKrjz1fyK78oUpcMU9O2fktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIoTHK3l;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801C606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D801C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIoTHK3l
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1490450f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876258; x=1794481058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SXGwN7tRovYpRhOtfKhfyClHFzkHW7mhE7T1iYdcvl4=;
        b=JIoTHK3lGVSV35Dz6VVacn6rp8zgOW9ERq96TAwriZ52T8iBlGWb8/bhsYbrRkvA9f
         7X6VUxZaMwPetQDmYY65zL1OY8mjTqsIUuH6mJzNdCL9+4Gl63FKz9n63k4P19WLgvxx
         /9xRYbDYigti5yTy+qht9QOlHpej1r7aahnyfFIJYtUIJjxY7US2ztak9gU/Dqh3956Q
         2rm+sZ9iFGxlpZlCMzWbngiYLQG+8jhnnKXaHwl3Q40FWNnxlhQSU6JlmlbFb98juiaa
         pHR4KJsi13h7SPcZdNDjRqVqFfT97pk3aKjlFSoF1TPDS8emRLLydxyVRmPR3twT7kYd
         OUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876258; x=1794481058;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXGwN7tRovYpRhOtfKhfyClHFzkHW7mhE7T1iYdcvl4=;
        b=wP8wOJqjwChBNfTzoSXwfgBocMlS1l7J6coMovyaY+0pR3cJgslQr1b9o+Flh31HuD
         1WXRudVMEZuLEl8KRlqvU6M7+c0emVxi6WbRAFCVPiMVIrz6qTVq4VM+ER1ifa2g/9es
         jCMP5iuEBzI6wTBQ0uHDn6fUfIFsparaQ5dMzCPt6E0vQIFlvDo07nZ39TsPgU0/4MNq
         bXaKlelwmm7jhrwY2vgOr9MCdoPpBQ4DRSgeVynOgZInJLtrtflyjGPjm6J7icw8NgeJ
         beJDLBNRHbW36cQQHnYPpdyx8WpzBAg/jDtVgOFrVAEFJybtqaLAO25a/PdPWDE/i7Yb
         15AA==
X-Forwarded-Encrypted: i=1; AKwUvBxq9I2Grwobl6OIrCLEe94DzFFZVdsGefi0kzviiYsEs8pgbg6+rF20ybMkBkD0u+G83k9WnHsPFud0ZpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Re886e1wJ0TrEJqZYOoDsoY4Sv38Q51zxkBoTmoe1SdtCYWl0
	OPejBh2Bi4onmzPWX3g+KFIiDgyYPPqSZqvrwbj5uCBXzwu/Grd20f4k
X-Gm-Gg: AYBFou0QGzW0yspB9ekA87RmgtUOkgMynsN7vR8qGfOWgYT9LkVI3VitB8kAdy28Sy7
	2zhBt8DXUsJFD15eNyiM5MbFPts33evnym8riqENXFYjYX3w6RkE8NbetoIQXgYwTcrmkEyL4lQ
	v/Z+c7zStF61etM21cjk7V7cEflFFGlHe5wIzk0V56v8WKsEsmJuXlbPlZoez246/44uAK2cutp
	bcTUS5ZXcMi1pXOGpA4CWFhJH/nD5HxREZWtokCdUDV7QOGnrN0Dd11KtvZtQiHQV7lz+fW5CIq
	w3nsrBRzFxy5H34yUmMIojk0+bsRaLp2MzWyA6nF3rbix7slzfWzEkUoNW9a4Tfjo54xKLDR3zO
	D4cIjFHAorwIdeYXM9FndwvRHC3wvn1cL2t/XQkSVeYsHynqFV1QFdDP4+wNzK+J7AJvBtdZ3++
	ulJrmha/tb80xPlzCqdMS9SaOW3hX96I28Ob9HlZWobnMgCnbRzqEtF3bkz02NcsuUQ4PQjfLtU
	QqnuM2qpzQzUkqN5qHsoUTG4IGE67qUnh2Ff/w+C1YZzyMXsUvNfQ/Xk2Ox8RmbHz35tbf18elq
	cnjqyeAqHCgWWI6ltK+ZLIZHkJqiSfKDHJH03oQd1pPSr4dSnX+bSrWHrUi69oTn
X-Received: by 2002:a05:6000:4711:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48e6e5018cfmr41452831f8f.29.1793876258012;
        Thu, 05 Nov 2026 02:57:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9968878f8f.19.2026.11.05.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:57:37 -0800 (PST)
Date: Thu, 5 Nov 2026 10:57:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Simon Schuster <schuster.simon@siemens-energy.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd
 Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] lib: extract 32bit mul/div helpers from nios2
 into GENERIC_LIB
Message-ID: <20261105105736.728782ab@pumpkin>
In-Reply-To: <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
References: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
	<20261103-nios2-remove-usage-of-libgcc-v2-1-5fabbedc49ec@siemens-energy.com>
	<bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 20:23:23 -0800
Vineet Gupta <vgupta@kernel.org> wrote:

> Nios it seems was removed from gcc?

Yep, Intel deprecated it not long before demerging Altera.
Loosely on the basis that they have a RISCV soft cpu for the fpga.
gcc followed (even though the code to support it isn't that big
- I can probably find a copy, you can't download it any more),
as has busybox.

This annoyed the company I worked for (and probably a lot of telco).
RISCV isn't a replacement in any sense, it is missing a lot of
features (like custom instructions) and doesn't have the same level
of customisation.
I wouldn't run Linux on one (you might get 100MHz if you are lucky
and it is definitely in-order one instruction per clock), but it is
useful for 'control pane' logic that would be too complex and large
in straight VHDL/Verilog.
Typically only a few KB of code running in a tight loop.

I've a clean-room copy of the integer part of the cpu - written
in a few weeks (and I'm not really a hardware engineer).

David
